-- Create and Use Warehouse
CREATE WAREHOUSE DEMO_WH;
USE WAREHOUSE DEMO_WH;

-- Create and use Database
CREATE DATABASE DEMOS;
USE DATABASE DEMOS;

-- SECRET With Git Credentials (.secret.sql)
CREATE SECRET gh_snowsight
    TYPE = password
    USERNAME = '<gh username>'
    PASSWORD = '<gh pa token>';
SHOW SECRETS;

-- Create Git Integration
CREATE OR REPLACE API INTEGRATION kameshsampath_repos
    API_PROVIDER = git_https_api
    API_ALLOWED_PREFIXES = ('https://github.com/kameshsampath')
    ALLOWED_AUTHENTICATION_SECRETS = ('QUICKSTART.PUBLIC.GH_SNOWSIGHT')
    ENABLED = true;    
SHOW INTEGRATIONS;

-- Create Git Repository
CREATE OR REPLACE GIT REPOSITORY snow_works_demo_notebooks
    ORIGIN = 'https://github.com/kameshsampath/snow-works-demo-notebooks.git'
    API_INTEGRATION = 'KAMESHSAMPATH_REPOS'
    GIT_CREDENTIALS = 'QUICKSTART.PUBLIC.GH_SNOWSIGHT'
    COMMENT = 'My Snowflake Demo Notebooks';