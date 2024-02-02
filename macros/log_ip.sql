{% macro log_source_ip() %}
    {% set v = run_query("select current_ip_address() as source_ip") %}
    {% do log('>>>>>>> the source ip is: ' ~ v.columns[0].values()[0]) %}
    {% set q -%}
        insert into development.dbt_jyeo.asb_ip_logger values (sysdate(),  current_ip_address());
    {%- endset %}
    {% do run_query(q) %}
{% endmacro %}
