def return_median(input_list):
    median_value = int(len(input_list)/2)
    input_list.sort()
 
    if len(input_list) % 2 != 0:
        return input_list[median_value]
    
    elif len(input_list) %2 == 0:
        return (input_list[median_value-1]+input_list[median_value])/2

def median_val_series(series_):
    median_index = int(len(series_)/2)#Index starts at 0
    series_.sort_values(inplace = True, ignore_index = True)
 
    print(series_)
    
    if len(series_) % 2 != 0: #Odd Number
        return series_[median_index]
 
    elif len(series_) % 2 == 0: #Even Number
        return (series_[median_index-1] + series_[median_index])/2
 
    else:
        return "Output Unknown"
 
def pct_val_srs(series_, pct = .75):
    pct_index = int(len(series_)*pct)#Index starts at 0
    series_.sort_values(inplace = True, ignore_index = True)
 
    print(series_)
    
    if len(series_) % 2 != 0: #Odd Number
        return series_[pct_index]
 
    elif len(series_) % 2 == 0: #Even Number
        return (series_[pct_index-1] + series_[pct_index])/2
 
    else:
        return "Output Unknown"
 
def return_median(input_list):
    median_value = int(len(input_list)/2)
    input_list.sort()
 
    if len(input_list) % 2 != 0:
        return input_list[median_value]
    
    elif len(input_list) %2 == 0:
        return (input_list[median_value-1]+input_list[median_value])/2
