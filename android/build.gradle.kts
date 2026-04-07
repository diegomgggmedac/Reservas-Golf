buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Asegúrate de que esta versión sea compatible con tu versión de AGP
        classpath("com.android.tools.build:gradle:8.1.0")
        classpath("com.google.gms:google-services:4.4.1")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.8.22")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

//val customBuildDirProvider = rootProject.layout.buildDirectory.dir("../../build")
val customBuildPath = layout.projectDirectory.dir("../../build")

rootProject.layout.buildDirectory.set(customBuildPath)

subprojects {
    val newSubprojectBuildDir = customBuildPath.map { it.dir(project.name) }
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
plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services") // <--- Sin esto, el JSON es invisible
}