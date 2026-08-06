echo "=== DevOps Build Started ==="
echo "Build Number: $BUILD_NUMBER"
echo "Job Name: $JOB_NAME"
echo "Workspace: $WORKSPACE"
echo "Jenkins User: $(whoami)"
echo "Current Directory: $(pwd)"
echo "Server Info: $(hostname -f)"
echo

echo "=== Testing Scripts ==="
if [ -f "health-check.sh" ]; then
    echo "Running health check script..."
    chmod +x health-check.sh
    ./health-check.sh
else
    echo "health-check.sh not found in repository"
fi

echo
echo "=== Build Environment ==="
ls -la
echo "=== DevOps Build Completed ==="