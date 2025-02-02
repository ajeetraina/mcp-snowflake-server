# Start with a base Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Upgrade pip and install build system dependencies
RUN pip install --upgrade pip
RUN pip install hatchling snowflake-connector-python

# Copy project files
COPY pyproject.toml /app/
COPY src /app/src
ADD README.md /app/

# Install the package
RUN pip install .

# Set environment variables for Snowflake
ENV ACCOUNT=your_account
ENV WAREHOUSE=your_warehouse
ENV USER=your_user
ENV PASSWORD=your_password
ENV ROLE=your_role
ENV DATABASE=your_database
ENV SCHEMA=your_schema

# Expose port (if required)
EXPOSE 8000

# Command to run the server
ENTRYPOINT ["mcp_snowflake_server"]
