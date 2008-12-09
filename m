Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LA2my-0001Zz-8O
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 13:38:12 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] new-utils: fix up build system
Date: Tue,  9 Dec 2008 08:38:10 -0500
Message-Id: <1228829890-27302-1-git-send-email-vapier@gentoo.org>
Cc: Nicolas Pitre <nico@cam.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The previous change with CFLAGS handling was not entirely correct.  So fix
CFLAGS/CPPFLAGS/LDFLAGS to work like standard build systems (i.e. autotools)
and change `ranlib` to $(RANLIB) to fix cross-compiling.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 ubi-utils/new-utils/Makefile |   28 ++++++++++++++++------------
 1 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/ubi-utils/new-utils/Makefile b/ubi-utils/new-utils/Makefile
index 133dd66..9ba0d95 100644
--- a/ubi-utils/new-utils/Makefile
+++ b/ubi-utils/new-utils/Makefile
@@ -9,8 +9,12 @@ MANDIR=/usr/man
 INCLUDEDIR=/usr/include
 
 CC := $(CROSS)gcc
-CFLAGS ?= -O2 -Wall
-CPPFLAGS := -Iinclude -Isrc -I$(KERNELHDR) $(CFLAGS) -Werror -Wall
+AR := $(CROSS)ar
+RANLIB := $(CROSS)ranlib
+CFLAGS ?= -O2
+CFLAGS += -Werror -Wall
+CPPFLAGS += -Iinclude -Isrc -I$(KERNELHDR)
+LDFLAGS += -L.
 
 LIBS = libubi libmtd libubigen libiniparser libscan
 UTILS = ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
@@ -26,40 +30,40 @@ all: $(UTILS)
 
 # The below is the rule to get an .o file from a .c file
 %.o: %.c
-	$(CC) $(CPPFLAGS) $< -c -o $@
+	$(CC) $(CFLAGS) $(CPPFLAGS) $< -c -o $@
 
 # And the below is the rule to get final executable from its .o and common.o
 %: libubi.a %.o common.o
-	$(CC) $(CFLAGS) $(filter %.o, $^) -L. -lubi -o $@
+	$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.o, $^) -lubi -o $@
 
 ubicrc32: ubicrc32.o crc32.o
-	$(CC) $(CFLAGS) -o $@ $^
+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
 
 ubinize: ubinize.o common.o crc32.o libiniparser.a libubigen.a
-	$(CC) $(CFLAGS) $(filter %.o, $^) -L. -liniparser -lubigen -o $@
+	$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.o, $^) -liniparser -lubigen -o $@
 
 ubiformat: ubiformat.o common.o crc32.o libmtd.a libscan.a libubi.a libubigen.a
-	$(CC) $(CFLAGS) $(filter %.o, $^) -L. -lmtd -lscan -lubi -lubigen -o $@
+	$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.o, $^) -lmtd -lscan -lubi -lubigen -o $@
 
 libubi.a: libubi.o
 	$(AR) crv $@ $^
-	ranlib $@
+	$(RANLIB) $@
 
 libmtd.a: libmtd.o
 	$(AR) crv $@ $^
-	ranlib $@
+	$(RANLIB) $@
 
 libubigen.a: libubigen.o
 	$(AR) crv $@ $^
-	ranlib $@
+	$(RANLIB) $@
 
 libiniparser.a: libiniparser.o dictionary.o
 	$(AR) crv $@ $^
-	ranlib $@
+	$(RANLIB) $@
 
 libscan.a: libscan.o crc32.o
 	$(AR) crv $@ $^
-	ranlib $@
+	$(RANLIB) $@
 
 clean:
 	rm -rf *.o $(addsuffix .a, $(LIBS)) $(UTILS) .*.c.dep
-- 
1.6.0.4
