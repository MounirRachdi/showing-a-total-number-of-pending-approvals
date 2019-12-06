import { LightningElement, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getPendingList from '@salesforce/apex/GetPendingApproval.getPendingList'; 
import getName from '@salesforce/apex/GetPendingApproval.getName';

export default class PendingApprovals extends NavigationMixin(LightningElement) {
     @wire(getName) UserName;
     @wire(getPendingList) PendingList;
     navigateToApprovalRequestPage() {
          this[NavigationMixin.Navigate]({

          type: 'standard__objectPage',
          attributes: {
              objectApiName: 'ProcessInstanceWorkitem',
              actionName: 'home'
          }
      });
      }
     }
