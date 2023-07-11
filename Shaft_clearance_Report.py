# -*- coding: utf-8 -*-
"""
Created on Thu Feb 24 09:46:02 2022

@author: rventer
"""

import pandas as pd
import sys
# You need the following in your working dir to run: "event_commtrac_node_checkinout.csv" and 'asset_human.csv'

# Select the date range
date_start = '2022/02/26 00:00'
date_end = '2022/02/27 23:59'




def main(date_start, date_end):
    # Fields we Care about
    fields = ['commtrac_external_id',
              'message_type',
              'date',
              'battery_voltage',
              'strongest_cn_name']
    
    # Import data from CSV
    event_commtrac_node_chckinout = \
                        pd.read_csv("event_commtrac_node_checkinout.csv",
                                    sep=';',
                                    usecols=fields)
    
    # Drop the NaN
    event_commtrac_node_chckinout  = event_commtrac_node_chckinout.dropna()
    
    
    # Convert dates colmun to datetime objects
    event_commtrac_node_chckinout['date'] = \
       pd.to_datetime(event_commtrac_node_chckinout['date'],
                       format='%Y/%m/%d %H:%M')

    def check_inout(x):
        dictt = {24: 'check_in',
                 25: 'check_out'}
        return dictt[x]
    
    # Apply check-in check-out
    event_commtrac_node_chckinout.message_type = \
        event_commtrac_node_chckinout.message_type.apply(check_inout)
    
    # Apply x/10 lamda function
    event_commtrac_node_chckinout.battery_voltage = \
        event_commtrac_node_chckinout.battery_voltage.apply(lambda x: x/10)
    
    # Filter the dates to look for a specific date
    
    event_commtrac_node_chckinout =\
        event_commtrac_node_chckinout[(event_commtrac_node_chckinout['date'] > date_start) & (event_commtrac_node_chckinout['date'] <= date_end)]
    
    # Read in the names of the employees
    
    names_fields = ['personal_id',
                    'first_name',
                    'last_name',
                    'nickname',
                    'commtrac_external_id',
                    'external_id',
                    'zone_id']
    names_df = pd.read_csv('asset_human.csv',
                           sep=';',
                           usecols=names_fields)
    names_df = names_df.dropna()
    names_df.commtrac_external_id = \
        names_df.commtrac_external_id.apply(lambda x:int(x))
    
    # Do similar to a v-lookup
    df = pd.merge(names_df,
                  event_commtrac_node_chckinout,
                  on = 'commtrac_external_id',
                  how = 'inner')
    
    # Split Columns
    df['check_in'] = df[df.message_type == 'check_in'].date
    df['check_out'] = df[df.message_type == 'check_out'].date
    
    df = df[['personal_id', 'first_name', 'last_name','nickname','external_id',
           'battery_voltage', 'commtrac_external_id',
           'check_in', 'check_out', 'strongest_cn_name', 'zone_id']]
    
    # Time Dictionary to try and determine shift
    date = date_start.split(' ')[0]
    next_date = date_end.split(' ')[0]
    
    time_dict = {'day' : [pd.Timestamp(date + ' 05:30'),
                          pd.Timestamp(date + ' 10:59')],
                 'prep' : [pd.Timestamp(date + ' 11:00'),
                           pd.Timestamp(date + ' 20:59')],
                 'night' : [pd.Timestamp(date + ' 21:00'),
                            pd.Timestamp(next_date + ' 09:00')]
                 }
    
    def infer_shift(x):
        for shift in time_dict.keys():
            if x > time_dict[shift][0] and x <= time_dict[shift][1]:
                return shift
        
    # We'll comment this out for now, doesn't seem to make a good infereance
    #df['infered_shift'] = df.check_in.apply(infer_shift).fillna(df.check_out.apply(infer_shift))
    
    # Add the zone_id assigned column field
    zone_df = pd.read_csv('zone.csv', sep=';', usecols=['id', 'name'])
    zone_df.rename(columns={'name':'assigned_section', 'id':'zone_id'}, inplace=True)
    df = pd.merge(df, zone_df, on='zone_id', how='inner')
    
    df = df[['first_name','last_name','nickname','personal_id','battery_voltage',
            'external_id','check_in','check_out','strongest_cn_name','assigned_section']]
            
    
    df.to_csv('shaft_clearance.csv', index=False)


    
if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
    
