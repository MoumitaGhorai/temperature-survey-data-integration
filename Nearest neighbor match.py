#!/usr/bin/env python
# coding: utf-8

# In[13]:


import pandas as pd
import geopandas as gpd
from shapely.geometry import Point

# Load CSV files
data1_df = pd.read_csv('~/DHS survey data/DHS 2015-16/IAGE71FL/export_csv.csv')
data2_df = pd.read_csv('~/total_temp.csv')

# Convert latitude and longitude columns to Point geometries
data1_geometry = [Point(xy) for xy in zip(data1_df['LONGNUM'], data1_df['LATNUM'])]
data2_geometry = [Point(xy) for xy in zip(data2_df['x'], data2_df['y'])]

# Create GeoDataFrames
data1_gdf = gpd.GeoDataFrame(data1_df, geometry=data1_geometry, crs='EPSG:4326')
data2_gdf = gpd.GeoDataFrame(data2_df, geometry=data2_geometry, crs='EPSG:4326')



# In[14]:
# Perform nearest neighbor join
joined_data2016 = data1_gdf.sjoin_nearest(data2_gdf, how="left", distance_col="Distances")


# In[15]:
joined_data2016


# In[ ]:





# In[ ]:


# do the same for 2021 files


# In[9]:


import pandas as pd
import geopandas as gpd
from shapely.geometry import Point

# Load CSV files
data3_df = pd.read_csv('~/DHS survey data/DHS 2019-21/IAGE7AFL/export_csv.csv')

# Convert latitude and longitude columns to Point geometries
data3_geometry = [Point(xy) for xy in zip(data3_df['LONGNUM'], data3_df['LATNUM'])]

# Create GeoDataFrames
data3_gdf = gpd.GeoDataFrame(data3_df, geometry=data3_geometry, crs='EPSG:4326')

# Perform nearest neighbor join
joined_data2021 = data3_gdf.sjoin_nearest(data2_gdf, how="left", distance_col="Distances")


# In[10]:


joined_data2021


# ## append the two files together

# In[16]:


final = pd.concat([joined_data2016, joined_data2021], ignore_index=True)


# In[17]:


final


# ## export the two dfs

# In[18]:


# Assuming df is your DataFrame
joined_data2016.to_csv('C:/Users/moumi/Desktop/India temp project/DHS survey data/dhs2016output_file.csv', index=False)
joined_data2021.to_csv('C:/Users/moumi/Desktop/India temp project/DHS survey data/dhs2021output_file.csv', index=False)


# ## merge with PR files and then append

# In[ ]:




