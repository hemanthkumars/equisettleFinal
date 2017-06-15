// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.Mediator;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Mediator_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Mediator.entityManager;
    
    public static final List<String> Mediator.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager Mediator.entityManager() {
        EntityManager em = new Mediator().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Mediator.countMediators() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Mediator o", Long.class).getSingleResult();
    }
    
    public static List<Mediator> Mediator.findAllMediators() {
        return entityManager().createQuery("SELECT o FROM Mediator o", Mediator.class).getResultList();
    }
    
    public static List<Mediator> Mediator.findAllMediators(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Mediator o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Mediator.class).getResultList();
    }
    
    public static Mediator Mediator.findMediator(Integer mediatorId) {
        if (mediatorId == null) return null;
        return entityManager().find(Mediator.class, mediatorId);
    }
    
    public static List<Mediator> Mediator.findMediatorEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Mediator o", Mediator.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Mediator> Mediator.findMediatorEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Mediator o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Mediator.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Mediator.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Mediator.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Mediator attached = Mediator.findMediator(this.mediatorId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Mediator.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Mediator.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Mediator Mediator.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Mediator merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
