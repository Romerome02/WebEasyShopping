/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;
import java.util.Objects;

/**
 *
 * @author Rodrigo
 */
public class EasyUser {
    private int id;
    private int document;
    private String name; 
    private String surnames;
    private String email; 
    private String email_verified_at;
    private String password; 
    private String image; 
    private String telefono;
    private String remember_token;
    private String device_ip;
    private Date created_at;
    private Date updated_at;

    public EasyUser(int id, int document, String name, String surnames, String email, String email_verified_at, String password, String image, String telefono, String remember_token, String device_ip, Date created_at, Date updated_at) {
        this.id = id;
        this.document = document;
        this.name = name;
        this.surnames = surnames;
        this.email = email;
        this.email_verified_at = email_verified_at;
        this.password = password;
        this.image = image;
        this.telefono = telefono;
        this.remember_token = remember_token;
        this.device_ip = device_ip;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }
     
    // Constructor vacío
    public EasyUser() {
    }

    public int getId() {
            return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDocument() {
        return document;
    }

    public void setDocument(int document) {
        this.document = document;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurnames() {
        return surnames;
    }

    public void setSurnames(String surnames) {
        this.surnames = surnames;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail_verified_at() {
        return email_verified_at;
    }

    public void setEmail_verified_at(String email_verified_at) {
        this.email_verified_at = email_verified_at;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getRemember_token() {
        return remember_token;
    }

    public void setRemember_token(String remember_token) {
        this.remember_token = remember_token;
    }

    public String getDevice_ip() {
        return device_ip;
    }

    public void setDevice_ip(String device_ip) {
        this.device_ip = device_ip;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    // Getters y setters
    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }
     
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        EasyUser persona = (EasyUser) obj;
        return id == persona.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
    
    @Override
    public String toString() {
        return "Persona{" +
                "id=" + id +
                ", document=" + document +
                ", name='" + name + '\'' +
                ", surnames='" + surnames + '\'' +
                ", email='" + email + '\'' +
                ", email_verified_at='" + email_verified_at + '\'' +
                ", password='" + password + '\'' +
                ", image='" + image + '\'' +
                ", telefono='" + telefono + '\'' +
                ", remember_token='" + remember_token + '\'' +
                ", device_ip='" + device_ip + '\'' +
                ", created_at=" + created_at +
                ", updated_at=" + updated_at +
                '}';
    }
    
    // Método para verificar si el correo electrónico está verificado
    public boolean isEmailVerified() {
        return email_verified_at != null;
    }

    // Validación simple de correo electrónico (podría mejorarse)
    public boolean isValidEmail() {
        return email != null && email.matches("^A[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
    }

    // Validación simple de contraseña (podría mejorarse)
    public boolean isValidPassword() {
         return password != null && password.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$");
    }

}

    

