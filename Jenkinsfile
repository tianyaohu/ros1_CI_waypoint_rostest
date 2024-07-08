pipeline {
    agent {
        docker {
            image 'tianyaoh501679/jenkins_cicd_learning:tortoisebot_ros1_waypoint_test'
            args '-u root' // Run as root if necessary, or another user with sufficient permissions
        }
    }
    stages {
        stage('Init Gazebo Simulation') {
            steps {
                script {
                    // Explicitly set permissions if necessary and start Gazebo Simulation in the background
                    sh label: '', script: '''#!/bin/bash
                    chmod +x /root/catkin_ws/devel/setup.bash
                    source /root/catkin_ws/devel/setup.bash
                    roslaunch tortoisebot_gazebo tortoisebot_playground.launch &
                    '''
                    // Wait for the simulation to fully start
                    sleep 5
                }
            }
        }
        stage('ROSTest') {
            steps {
                // Explicitly set permissions if necessary and run the rostest with reuse-master option
                sh label: '', script: '''#!/bin/bash
                chmod +x /root/catkin_ws/devel/setup.bash
                source /root/catkin_ws/devel/setup.bash
                rostest tortoisebot_waypoints integration_test.test x:=-0.5 y:=0.5 --reuse-master
                '''
            }
        }
    }
}
