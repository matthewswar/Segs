SET(target_CPP
${CMAKE_CURRENT_SOURCE_DIR}/GameDBSync.cpp
${CMAKE_CURRENT_SOURCE_DIR}/GameDBSyncHandler.cpp
${CMAKE_CURRENT_SOURCE_DIR}/GameDBSyncContext.cpp
)
SET(target_INCLUDE
${CMAKE_CURRENT_SOURCE_DIR}/GameDBSync.h
${CMAKE_CURRENT_SOURCE_DIR}/GameDBSyncHandler.h
${CMAKE_CURRENT_SOURCE_DIR}/GameDBSyncEvents.h
${CMAKE_CURRENT_SOURCE_DIR}/GameDBSyncContext.h
)
SET (target_SOURCES
${target_CPP}
${target_INCLUDE}
)
ADD_LIBRARY(game_db_sync_lib STATIC ${target_SOURCES})
target_link_libraries(game_db_sync_lib PUBLIC cox_server_common network_structures)
target_link_libraries(game_db_sync_lib PRIVATE cereal_IMP)
target_include_directories(game_db_sync_lib INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

qt5_use_modules(game_db_sync_lib LINK_PUBLIC Core Sql)
