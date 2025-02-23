############################################################################
# Mediastreamer2Config.cmake
# Copyright (C) 2015  Belledonne Communications, Grenoble France
#
############################################################################
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
############################################################################
#
# Config file for the mediastreamer2 package.
# It defines the following variables:
#
#  MEDIASTREAMER2_FOUND - system has mediastreamer2
#  MEDIASTREAMER2_INCLUDE_DIRS - the mediastreamer2 include directory
#  MEDIASTREAMER2_LIBRARIES - The libraries needed to use mediastreamer2
#  MEDIASTREAMER2_CPPFLAGS - The compilation flags needed to use mediastreamer2
#  MEDIASTREAMER2_LDFLAGS - The linking flags needed to use mediastreamer2

if(NOT LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	include("${CMAKE_CURRENT_LIST_DIR}/Mediastreamer2Targets.cmake")
endif()

if(YES)
	set(MEDIASTREAMER2_TARGETNAME mediastreamer_voip)
	set(MEDIASTREAMER2_LIBRARIES ${MEDIASTREAMER2_TARGETNAME} mediastreamer_base)
else()
	set(MEDIASTREAMER2_TARGETNAME mediastreamer_voip-static)
	if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
		set(MEDIASTREAMER2_LIBRARIES ${MEDIASTREAMER2_TARGETNAME})
	else()
		get_target_property(MEDIASTREAMER2_LIBRARIES ${MEDIASTREAMER2_TARGETNAME} LOCATION)
	endif()
	get_target_property(MEDIASTREAMER2_LINK_LIBRARIES ${MEDIASTREAMER2_TARGETNAME} INTERFACE_LINK_LIBRARIES)
	if(MEDIASTREAMER2_LINK_LIBRARIES)
		list(APPEND MEDIASTREAMER2_LIBRARIES ${MEDIASTREAMER2_LINK_LIBRARIES})
		list(REMOVE_ITEM MEDIASTREAMER2_LIBRARIES mediastreamer_base-static)
		if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
			set(MEDIASTREAMER2_BASE_LIBRARIES mediastreamer_base-static)
		else()
			get_target_property(MEDIASTREAMER2_BASE_LIBRARIES mediastreamer_base-static LOCATION)
		endif()
		list(APPEND MEDIASTREAMER2_LIBRARIES ${MEDIASTREAMER2_BASE_LIBRARIES})
	endif()
endif()
get_target_property(MEDIASTREAMER2_INCLUDE_DIRS ${MEDIASTREAMER2_TARGETNAME} INTERFACE_INCLUDE_DIRECTORIES)
if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	list(INSERT MEDIASTREAMER2_INCLUDE_DIRS 0 "${EP_ms2_INCLUDE_DIR}")
else()
	list(INSERT MEDIASTREAMER2_INCLUDE_DIRS 0 "/Users/wei/myPro/New/non-free-codec/linphone-iphone/liblinphone-sdk/x86_64-apple-darwin.ios/include")
endif()
list(REMOVE_DUPLICATES MEDIASTREAMER2_INCLUDE_DIRS)

set(MEDIASTREAMER2_CPPFLAGS -DBZRTP_STATIC;-DBCG729_STATIC)
set(MEDIASTREAMER2_LDFLAGS "-framework CoreFoundation -framework AudioToolbox -framework CoreAudio -framework Foundation -framework QuartzCore -framework OpenGLES -framework UIKit -framework AVFoundation -framework CoreGraphics -framework CoreMedia -framework CoreVideo -framework VideoToolbox")
set(MEDIASTREAMER2_FOUND 1)
