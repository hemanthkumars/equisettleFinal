// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.CaseStatus;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect CaseStatus_Roo_Jpa_Entity {
    
    declare @type: CaseStatus: @Entity;
    
    declare @type: CaseStatus: @Table(name = "case_status");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "CASE_STATUS_ID")
    private Integer CaseStatus.caseStatusId;
    
    public Integer CaseStatus.getCaseStatusId() {
        return this.caseStatusId;
    }
    
    public void CaseStatus.setCaseStatusId(Integer id) {
        this.caseStatusId = id;
    }
    
}
