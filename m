Date: Wed, 20 Aug 2008 21:50:18 +0200
From: Sebastian Siewior <bigeasy@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd-utils: enable parallel build process
Message-ID: <20080820195018.GA661@www.tglx.de>
Mime-Version: 1.0
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

-j 2 build was not possible without this patch.

Signed-off-by: Sebastian Siewior <bigeasy@linutronix.de>
---
 Makefile           |    4 ++--
 ubi-utils/Makefile |    6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 2000b17..6ca6e0d 100644
--- a/Makefile
+++ b/Makefile
@@ -47,8 +47,8 @@ $(BUILDDIR)/%.o: %.c
 .SUFFIXES:
 
 all: $(TARGETS)
-	make -C $(BUILDDIR)/ubi-utils
-	make -C $(BUILDDIR)/mkfs.ubifs
+	$(MAKE) -C $(BUILDDIR)/ubi-utils
+	$(MAKE) -C $(BUILDDIR)/mkfs.ubifs
 
 IGNORE=${wildcard $(BUILDDIR)/.*.c.dep}
 -include ${IGNORE}
diff --git a/ubi-utils/Makefile b/ubi-utils/Makefile
index 3e6203f..bc27f7b 100644
--- a/ubi-utils/Makefile
+++ b/ubi-utils/Makefile
@@ -30,18 +30,18 @@ vpath   %.c ./src
 	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $< -g -Wp,-MD,.$(shell basename $<).dep
 
 all: $(TARGETS)
-	make -C new-utils
+	$(MAKE) -C new-utils
 
 IGNORE=${wildcard .*.c.dep}
 -include ${IGNORE}
 
 $(NTARGETS):
-	make -C new-utils $@
+	$(MAKE) -C new-utils $@
 	mv new-utils/$@ $@
 
 clean:
 	rm -rf *.o $(TARGETS) .*.c.dep
-	make -C new-utils clean
+	$(MAKE) -C new-utils clean
 
 pddcustomize: pddcustomize.o error.o libubimirror.o bootenv.o hashmap.o \
 		libubi.o crc32.o
-- 
1.5.5.2
