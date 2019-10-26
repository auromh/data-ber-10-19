Data_wrangling Project

1. Process followed

    1.1 Importing data
        - Import the csv using pandas
        - Think about process to follow
    
    1.2 Cleaning data
        A. First: Check for columns that we can drop:
            - Check for number of NaN in each column, asses if they are still needed
            - drop columns with more than 40 NaN
        B. Homogenize column names
            - Make all column names lower case, strip and replace " " for "_" and "." for ""
        C. Clean table of columns that are duplicated or that dont add any relevant info
            - Checked that case_number1 and case_number2 dont differ from case_number and drop them
            - We found the NaN in href_formula and overwrite it with the value in href --> Now we can drop the href since 99% of the values are equal
            - We drop as well pdf column since href_formula has the same objective and added more value than pdf column
        D. We standardize countries by there international code and eliminate strange characters
        E. Search for new index if possible
            - Check if we could make original_orden or case_number our index
        F. Create a copy of the DF and proceed to create two new columns based on the case_number column: Year_split and Month_split
            - we dont creat a day_split 'cause we are not interested in such level of granulariy
        G. We are going to eliminate those rows where the month_split lenght is more than 2, because they only represent 2.07% and add no value
        H. We fill the remaining NaN with "unknown"s
        I. finally we proceed to align the values of the columns "fatal_(y/n)" and "sex", so that we have homogeneous values
    
    1.3 Manipulation
        A. For the benefit of data analysis, we are interested to analyze the incidents happenning from 1900 onwards, since they represent the majority
        B. Create a new dataframe with the desire rows, called table_to_analyze
        
    1.4 Exporting
        - We export the table_to_analyze as a .pkl and as a .csv

    1.5 Analysis
        - Now we create a new dataframe where we can see the top 5 countries with reported incidents
        - Now we create a dataframe to see what are the most frequent activities people were praticing when they get attacked
        - Check most frequent type of accident, e.g. whteher it was provoked or not
        - Check the years with most accidents
        - Check incidents distribution per month

    1.6 Visualization
        - We represent the analysis done in 1.5 in a visual way



2. Results from analyzing the data provided
    - From a table with 5992 columns and 24 rows, we end up having a clean table with 5325 columns and 11 rows
    - The five countries with more accidents reported are: USA, Australia, South Africa, Papua New Guinea and Brazil
             country	count
            0	US	    1992
            1	AU	    1124
            2	ZA	    535
            3	PG	    129
            4	BR	    100
    - The majority of people were surfing, swimming or fishing when they were attacked by a shark
    - The year with most accidents was 2015, according to the data provided
    - In general terms, the months when it is most likely to suffer a shark attack are july, august and september
    - Finally most of attacks have been categorized as unprovoked


3. Obstacles encountered & Lessons learned
    - Importing file from kaggle link not working --> Solution: download file and importing it from my directory
    - Importing csv decoding issue --> Solution: stackoverflow, encoding = "latin1"
    - Some issues using the new library pycountry --> Solution: learn how to manage exceptions
    - In general working with pandas --> I looked a lot of documentation since I still have to get more confortable working with pandas
    - First I assume there were no duplicates in the case_number column --> I had to reload everything and properly check my assumptions


4. Methods used:
    1. drop
    2. copy
    3. sort_values
    4. reset_index
    5. groupby
    6. loc
    7. assign
    8. map
    9. astype
    10. query
    11. str.lower
    12. str.strip
    13. str.replace
    14. str.title
    15. isna
    16. sum
    17. count
    18. head
    19. shape
    20. fillna
