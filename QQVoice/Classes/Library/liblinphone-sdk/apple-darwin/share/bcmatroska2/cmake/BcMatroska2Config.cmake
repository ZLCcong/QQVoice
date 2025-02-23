############################################################################
# BcMatroska2Config.cmake
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
# Config file for the Matroska2 package.
# It defines the following variables:
#
#  BCMATROSKA2_FOUND - system has BcMatroska2
#  BCMATROSKA2_INCLUDE_DIRS - the BcMatroska2 include directory
#  BCMATROSKA2_LIBRARIES - The libraries needed to use BcMatroska2

include("${CMAKE_CURRENT_LIST_DIR}/BcMatroska2Targets.cmake")

if(NO)
	set(BCMATROSKA2_LIBRARIES bcmatroska2)
else()
	get_target_property(BCMATROSKA2_LIBRARIES bcmatroska2-static LOCATION)
endif()
set(BCMATROSKA2_INCLUDE_DIRS "/Users/wei/myPro/New/non-free-codec/linphone-iphone/liblinphone-sdk/x86_64-apple-darwin.ios/include")

set(BCMATROSKA2_FOUND 1)
