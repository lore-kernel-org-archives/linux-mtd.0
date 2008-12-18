Received: from yx-out-1718.google.com ([74.125.44.157])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDJfg-0003rO-SP
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 14:16:13 +0000
Received: by yx-out-1718.google.com with SMTP id 3so170846yxi.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Dec 2008 06:16:12 -0800 (PST)
Message-ID: <52e42efe0812180616q28c10c72nae087e214c014676@mail.gmail.com>
Date: Thu, 18 Dec 2008 15:16:12 +0100
From: "Sidney Amani" <amani_s@epitech.net>
Sender: seed95@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] Makefile export shared libraries
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From b557d3f22d16fc61788a85f5ec6cc02e0195c810 Mon Sep 17 00:00:00 2001
From: Sidney Amani <amani_s@epitech.net>
Date: Wed, 17 Dec 2008 12:46:42 +0100
Subject: [PATCH] Makefile export shared libraries

Export shared libraries. Other userspace tools might
use them.

Signed-off-by: Sidney Amani <amani_s@epitech.net>
Signed-off-by: Corentin Chary <chary_c@epitech.net>
---
 ubi-utils/new-utils/Makefile |   32 +++++++++++++++++++++-----------
 1 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/ubi-utils/new-utils/Makefile b/ubi-utils/new-utils/Makefile
index 9ba0d95..a975a99 100644
--- a/ubi-utils/new-utils/Makefile
+++ b/ubi-utils/new-utils/Makefile
@@ -7,6 +7,7 @@ DESTDIR := /usr/local
 SBINDIR=/usr/sbin
 MANDIR=/usr/man
 INCLUDEDIR=/usr/include
+LIBDIR=/lib

 CC := $(CROSS)gcc
 AR := $(CROSS)ar
@@ -22,7 +23,9 @@ UTILS = ubiupdatevol ubimkvol ubirmvol ubicrc32
ubinfo ubiattach \

 vpath %.c src

-all: $(UTILS)
+all: $(UTILS) shared
+
+shared: $(addsuffix .so, $(LIBS))

 # The below cancels existing implicite rule to make programs from .c files,
 # in order to force make using our rule defined below
@@ -32,6 +35,11 @@ all: $(UTILS)
 %.o: %.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $< -c -o $@

+# The below is for shared libraries
+%.pic.o: %.c
+	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $< -c -o $@
+
+
 # And the below is the rule to get final executable from its .o and common.o
 %: libubi.a %.o common.o
 	$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.o, $^) -lubi -o $@
@@ -45,15 +53,7 @@ ubinize: ubinize.o common.o crc32.o libiniparser.a
libubigen.a
 ubiformat: ubiformat.o common.o crc32.o libmtd.a libscan.a libubi.a libubigen.a
 	$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.o, $^) -lmtd -lscan -lubi -lubigen -o $@

-libubi.a: libubi.o
-	$(AR) crv $@ $^
-	$(RANLIB) $@
-
-libmtd.a: libmtd.o
-	$(AR) crv $@ $^
-	$(RANLIB) $@
-
-libubigen.a: libubigen.o
+%.a: %.o
 	$(AR) crv $@ $^
 	$(RANLIB) $@

@@ -65,14 +65,24 @@ libscan.a: libscan.o crc32.o
 	$(AR) crv $@ $^
 	$(RANLIB) $@

+%.so: %.pic.o
+	$(CC) $(LDFLAGS) -shared -o $@ $^
+
 clean:
-	rm -rf *.o $(addsuffix .a, $(LIBS)) $(UTILS) .*.c.dep
+	rm -rf *.o $(addsuffix .a, $(LIBS)) $(addsuffix .so, $(LIBS))
$(UTILS) .*.c.dep

 install: ${UTILS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
 	install -m 0755 ${UTILS} ${DESTDIR}/${SBINDIR}/
+	for i in $(addsuffix .so, $(LIBS)); do \
+		[ -f $$i ] &&  install -m 0755 $$i  ${DESTDIR}/${LIBDIR}/; \
+	done

 uninstall:
 	for file in ${UTILS}; do \
 		$(RM) ${DESTDIR}/${SBINDIR}/$$file; \
 	done
+	for file in $(addsuffix .so, $(LIBS)); do \
+		$(RM) -f  ${DESTDIR}/${LIBDIR}/$$file.so; \
+	done
+
-- 
1.5.6.4
