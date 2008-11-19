Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L2rq0-0003lh-LJ
	for linux-mtd@lists.infradead.org; Wed, 19 Nov 2008 18:31:40 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KAL008KZFGG1KJ0@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 19 Nov 2008 13:31:29 -0500 (EST)
Date: Wed, 19 Nov 2008 13:31:28 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH mtd-utils] fix CFLAGS handling wrt cross compilation
Message-id: <alpine.LFD.2.00.0811191321420.27509@xanadu.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Let's have the "new ubi-utils" makefile handle CFLAGS like the other 
makefiles.  This is important when cross compiling and CFLAGS is 
externally provided. Without this, local include files are not found due 
to the various -I arguments which are then lost.

Signed-off-by: Nicolas Pitre <nico@marvell.com>

diff --git a/ubi-utils/new-utils/Makefile b/ubi-utils/new-utils/Makefile
index ba4c20f..6fce7c6 100644
--- a/ubi-utils/new-utils/Makefile
+++ b/ubi-utils/new-utils/Makefile
@@ -2,7 +2,6 @@
 # Makefile for ubi-utils
 #
 
-OPTFLAGS := -O2 -Wall
 KERNELHDR := ../../include
 DESTDIR := /usr/local
 SBINDIR=/usr/sbin
@@ -10,7 +9,8 @@ MANDIR=/usr/man
 INCLUDEDIR=/usr/include
 
 CC := $(CROSS)gcc
-CFLAGS := -Iinclude -Isrc -I$(KERNELHDR) $(OPTFLAGS) -Werror -Wall
+CFLAGS ?= -O2 -Wall
+CPPFLAGS := -Iinclude -Isrc -I$(KERNELHDR) $(CFLAGS) -Werror -Wall
 
 LIBS = libubi libmtd libubigen libiniparser libscan
 UTILS = ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
@@ -26,7 +26,7 @@ all: $(UTILS)
 
 # The below is the rule to get an .o file from a .c file
 %.o: %.c
-	$(CC) $(CFLAGS) $< -c -o $@
+	$(CC) $(CPPFLAGS) $< -c -o $@
 
 # And the below is the rule to get final executable from its .o and common.o
 %: libubi.a %.o common.o
