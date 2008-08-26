Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KY6gw-0004mf-4w
	for linux-mtd@lists.infradead.org; Tue, 26 Aug 2008 22:07:10 +0000
Date: Wed, 27 Aug 2008 00:07:05 +0200
From: Sebastian Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: [RFC] mtd-utils: make cross build functional again
Message-ID: <20080826220705.GA4834@Chamillionaire.breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

as of current HEAD "make CROSS=whatever-" breaks once we leave
the main Makefile.
With this patch everything builds except NTARGETS in ubi-utils and with
CROSS being undefined.

The problem with CROSS being undefined could be solved by setting
BUILDDIR explicit to "native" for instance.
The NTARGETS thing is a little tricky. The easiest solution would be
probably to move the NTARGETS targets into its own Makefile.

Anyway, is this something worth to fix since it is almost a year broken?
Should the BUILDDIR thing be removed or is it used?

Signed-off-by: Sebastian Siewior <sebastian@breakpoint.cc>
---
 Makefile            |    6 ++++--
 mkfs.ubifs/Makefile |    6 ++++--
 ubi-utils/Makefile  |   26 ++++++++++++++------------
 3 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/Makefile b/Makefile
index 796c31b..d54e170 100644
--- a/Makefile
+++ b/Makefile
@@ -47,8 +47,10 @@ $(BUILDDIR)/%.o: %.c
 .SUFFIXES:
 
 all: $(TARGETS)
-	$(MAKE) -C $(BUILDDIR)/ubi-utils
-	$(MAKE) -C $(BUILDDIR)/mkfs.ubifs
+	mkdir -p $(BUILDDIR)/ubi-utils
+	mkdir -p $(BUILDDIR)/mkfs.ubifs
+	$(MAKE) -C ubi-utils BUILDDIR=../$(BUILDDIR)/ubi-utils
+	$(MAKE) -C mkfs.ubifs BUILDDIR=../$(BUILDDIR)/mkfs.ubifs
 
 IGNORE=${wildcard $(BUILDDIR)/.*.c.dep}
 -include ${IGNORE}
diff --git a/mkfs.ubifs/Makefile b/mkfs.ubifs/Makefile
index a327eee..81ef429 100644
--- a/mkfs.ubifs/Makefile
+++ b/mkfs.ubifs/Makefile
@@ -3,11 +3,13 @@ SBINDIR=/usr/sbin
 ALL_SOURCES=*.[ch] hashtable/*.[ch]
 CFLAGS += -Wall
 LDLIBS += -lz -llzo2 -lm -luuid
-TARGETS = mkfs.ubifs
+RAWTARGETS = mkfs.ubifs
+
+TARGETS = $(foreach target,$(RAWTARGETS),$(BUILDDIR)/$(target))
 
 all: $(TARGETS)
 
-mkfs.ubifs: crc16.o crc32.o lpt.o compr.o hashtable/hashtable.o \
+$(BUILDDIR)/mkfs.ubifs: crc16.o crc32.o lpt.o compr.o hashtable/hashtable.o \
             hashtable/hashtable_itr.o devtable.o
 
 clean:
diff --git a/ubi-utils/Makefile b/ubi-utils/Makefile
index 4cca316..bdcd444 100644
--- a/ubi-utils/Makefile
+++ b/ubi-utils/Makefile
@@ -18,16 +18,18 @@ PERLPROGS = mkpfi ubicrc32.pl
 
 NTARGETS = ubiattach ubicrc32 ubidetach ubimkvol ubinfo ubinize \
 	ubirmvol ubiupdatevol ubiformat
-TARGETS = pfiflash pddcustomize ubimirror bin2nand nand2bin ubigen \
+RAWTARGETS = pfiflash pddcustomize ubimirror bin2nand nand2bin ubigen \
 	mkbootenv unubi pfi2bin $(NTARGETS)
 
+TARGETS = $(foreach target,$(RAWTARGETS),$(BUILDDIR)/$(target))
+
 vpath   %.c ./src
 
 %: %.o
 	$(CC) $(LDFLAGS) -g -o $@ $^
 
-%.o: %.c
-	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $< -g -Wp,-MD,.$(shell basename $<).dep
+$(BUILDDIR)/%.o: %.c
+	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $< -g -Wp,-MD,$(BUILDDIR)/.$(shell basename $<).dep
 
 all: $(TARGETS)
 
@@ -42,34 +44,34 @@ clean:
 	rm -rf *.o $(TARGETS) .*.c.dep
 	$(MAKE) -C new-utils clean
 
-pddcustomize: pddcustomize.o error.o libubimirror.o bootenv.o hashmap.o \
+$(BUILDDIR)/pddcustomize: pddcustomize.o error.o libubimirror.o bootenv.o hashmap.o \
 		libubi.o crc32.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
-pfiflash: pfiflash.o libpfiflash.o list.o reader.o error.o libubimirror.o \
+$(BUILDDIR)/pfiflash: pfiflash.o libpfiflash.o list.o reader.o error.o libubimirror.o \
 		bootenv.o hashmap.o pfi.o libubi.o crc32.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
-ubimirror: ubimirror.o error.o libubimirror.o bootenv.o hashmap.o \
+$(BUILDDIR)/ubimirror: ubimirror.o error.o libubimirror.o bootenv.o hashmap.o \
 		libubi.o crc32.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
-nand2bin: nand2bin.o nandecc.o nandcorr.o
+$(BUILDDIR)/nand2bin: nand2bin.o nandecc.o nandcorr.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
-bin2nand: bin2nand.o error.o nandecc.o
+$(BUILDDIR)/bin2nand: bin2nand.o error.o nandecc.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
-ubigen: ubigen.o libubigen.o crc32.o
+$(BUILDDIR)/ubigen: ubigen.o libubigen.o crc32.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
-mkbootenv: mkbootenv.o bootenv.o hashmap.o error.o crc32.o
+$(BUILDDIR)/mkbootenv: mkbootenv.o bootenv.o hashmap.o error.o crc32.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
-unubi: unubi.o crc32.o unubi_analyze.o eb_chain.o
+$(BUILDDIR)/unubi: unubi.o crc32.o unubi_analyze.o eb_chain.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
-pfi2bin: pfi2bin.o peb.o error.o list.o crc32.o libubigen.o bootenv.o \
+$(BUILDDIR)/pfi2bin: pfi2bin.o peb.o error.o list.o crc32.o libubigen.o bootenv.o \
 		hashmap.o reader.o pfi.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
-- 
1.5.6.5
