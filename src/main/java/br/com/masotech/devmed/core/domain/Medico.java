package br.com.masotech.devmed.core.domain;

import java.util.List;
import java.util.UUID;

public class Medico {
    private UUID id;
    private String nome;
    private Integer crm;
    private String uf;
    private List<Contato> contatos;
    private List<Endereco> enderecos;
    private Agenda agenda;
}
