SET(target_CPP
${CMAKE_CURRENT_SOURCE_DIR}/AuthDBSync.cpp
${CMAKE_CURRENT_SOURCE_DIR}/AuthDBSyncHandler.cpp
${CMAKE_CURRENT_SOURCE_DIR}/AuthDBSyncContext.cpp
)
SET(target_INCLUDE
${CMAKE_CURRENT_SOURCE_DIR}/AuthDBSync.h
${CMAKE_CURRENT_SOURCE_DIR}/AuthDBSyncHandler.h
${CMAKE_CURRENT_SOURCE_DIR}/AuthDBSyncEvents.h
${CMAKE_CURRENT_SOURCE_DIR}/AuthDBSyncContext.h
)
SET (target_SOURCES
${target_CPP}
${target_INCLUDE}
)
ADD_LIBRARY(auth_db_sync_lib STATIC ${target_SOURCES})
target_link_libraries(auth_db_sync_lib PUBLIC cox_server_common network_structures)
target_link_libraries(auth_db_sync_lib PRIVATE cereal_IMP)
target_include_directories(auth_db_sync_lib INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

qt5_use_modules(auth_db_sync_lib LINK_PUBLIC Core Sql)
