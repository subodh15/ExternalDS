public with sharing class CDC_DataViewer_Controller {
    public static final String DEMO_CDC_DATA_STATIC_RESOURCE = 'CDC_Covid_Data'; 
    
    @AuraEnabled(cacheable=true)
    public static List<Map<String, Object>> getJsonData() {
        String jsonString = '[{"wwtp_jurisdiction":"New York","wwtp_id":"516","reporting_jurisdiction":"New York","sample_location":"Treatment plant","key_plot_id":"NWSS_ny_516_Treatment plant_raw wastewater","county_names":"Madison","county_fips":"36053","population_served":"4908","date_start":"2021-09-30","date_end":"2021-10-14","detect_prop_15d":"100","sampling_prior":"yes","first_sample_date":"2021-10-14"}, {"wwtp_jurisdiction":"New York","wwtp_id":"516","reporting_jurisdiction":"New York","sample_location":"Treatment plant","key_plot_id":"NWSS_ny_516_Treatment plant_raw wastewater","county_names":"Madison","county_fips":"36053","population_served":"4908","date_start":"2021-10-01","date_end":"2021-10-15","detect_prop_15d":"100","sampling_prior":"yes","first_sample_date":"2021-10-14"}]';
        
        jsonString=CDCDataSourceConnection.readJSONFromStaticResource(DEMO_CDC_DATA_STATIC_RESOURCE);
        System.debug('getJsonData::getJsonData');
        List<Map<String, Object>> jsonDataList = convertJsonToList(jsonString);
        System.debug('getJsonData::convertJsonToList');
        return jsonDataList;
        
    }

    public static List<Map<String, Object>> convertJsonToList(String jsonString) {
        List<Object> jsonDataList = (List<Object>) JSON.deserializeUntyped(jsonString);
        List<Map<String, Object>> resultList = new List<Map<String, Object>>();
        for (Object obj : jsonDataList) {
            Map<String, Object> dataMap = (Map<String, Object>) obj;
            resultList.add(dataMap);
        }
        return resultList;
    }   
}