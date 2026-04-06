buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Asegúrate de que esta versión sea compatible con tu versión de AGP
        classpath("com.google.gms:google-services:4.4.1")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val customBuildDirProvider = rootProject.layout.buildDirectory.dir("../../build")

rootProject.layout.buildDirectory.value(customBuildDirProvider)

subprojects {
    val newSubprojectBuildDir = customBuildDirProvider.map { it.dir(project.name) }
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    if (project.path != ":app") {
        evaluationDependsOn(":app")
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}