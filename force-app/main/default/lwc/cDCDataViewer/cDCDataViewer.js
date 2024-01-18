import { LightningElement, wire, track } from 'lwc';

import getJsonData from '@salesforce/apex/CDC_DataViewer_Controller.getJsonData';

const columns = [
    { label: 'Jurisdiction', fieldName: 'wwtp_jurisdiction', type: 'text' },
    { label: 'WWTP ID', fieldName: 'wwtp_id', type: 'text' },
    { label: 'Reporting Jurisdiction', fieldName: 'reporting_jurisdiction', type: 'text' },
    // Add more columns as needed
];

export default class CDCDataViewer extends LightningElement  {
    @track data = [];
    @track columns = columns;

    @wire(getJsonData)
    wiredData({ error, data }) {
        if (data) {
            this.data = data;
        } else if (error) {
            console.error('Error fetching JSON data:', error);
        }
    }
}
