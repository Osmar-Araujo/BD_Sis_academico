create sequence public.alunos_seq;

create sequence public.disciplinas_seq;

create sequence public.turmas_seq;

create sequence public.cursos_seq;

create sequence public.professores_seq;

CREATE TABLE public.alunos (
    alu_identificador       INTEGER DEFAULT NEXTVAL('alunos_seq'),    
    alu_nome                character varying(100),
    alu_tur_identificador   INTEGER NOT NULL
);

ALTER TABLE public.alunos ADD CONSTRAINT alunos_pk PRIMARY KEY ( alu_identificador );

CREATE TABLE public.cursos (
    cur_identificador  INTEGER DEFAULT NEXTVAL('cursos_seq'),
    cur_nome           character varying(50),
    cur_periodo        character varying(50),
    cur_decricao       character varying(1000)
);

ALTER TABLE public.cursos ADD CONSTRAINT cursos_pk PRIMARY KEY ( cur_identificador );

CREATE TABLE public.disciplinas (
    dis_identificador              INTEGER DEFAULT NEXTVAL('disciplinas_seq'),
    dis_nome                       character varying(50),
    dis_carga_horaria              character varying(50),
    dis_ementa                     character varying(3000),
    dis_cur_identificador          INTEGER NOT NULL,
    dis_pro_identificador          INTEGER NOT NULL
);

ALTER TABLE public.disciplinas ADD CONSTRAINT disciplinas_pk PRIMARY KEY ( dis_identificador );

CREATE TABLE public.professores (
    pro_identificador  INTEGER DEFAULT NEXTVAL('professores_seq'),
    pro_nome           character varying(100),
    pro_titulacao      character varying(50)
);

ALTER TABLE public.professores ADD CONSTRAINT professores_pk PRIMARY KEY ( pro_identificador );

CREATE TABLE public.turmas (
    tur_identificador         INTEGER DEFAULT NEXTVAL('turmas_seq'),
    tur_descricao             character varying(300),
    tur_cur_identificador     INTEGER NOT NULL
);
 
ALTER TABLE public.turmas ADD CONSTRAINT turmas_pk PRIMARY KEY ( tur_identificador );

ALTER TABLE public.alunos
    ADD CONSTRAINT alu_tur_fk FOREIGN KEY ( alu_tur_identificador )
        REFERENCES turmas ( tur_identificador );

ALTER TABLE public.disciplinas
    ADD CONSTRAINT dis_cur_fk FOREIGN KEY ( dis_cur_identificador )
        REFERENCES public.cursos ( cur_identificador );

ALTER TABLE public.disciplinas
    ADD CONSTRAINT dis_pro_fk FOREIGN KEY ( dis_pro_identificador )
        REFERENCES public.professores ( pro_identificador );

ALTER TABLE public.turmas
    ADD CONSTRAINT tur_cur_fk FOREIGN KEY ( tur_cur_identificador )
        REFERENCES public.cursos ( cur_identificador );