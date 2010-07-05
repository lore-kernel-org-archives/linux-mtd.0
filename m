Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OVuHo-000388-W3
	for linux-mtd@lists.infradead.org; Mon, 05 Jul 2010 22:37:14 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Mon, 5 Jul 2010 15:10:35 -0700
Subject: [PATCH 2/5] mtd-utils: update Makefiles,
	source files to use common libmtd.a
Message-Id: <ed9ae5115c9637d37d85780062fcbc24@localhost>
References: <4822394121cd0a8f08b0bd3ecd6af199@localhost>
In-Reply-To: <4822394121cd0a8f08b0bd3ecd6af199@localhost>
To: <dedekind1@gmail.com>, <saeed.bishara@gmail.com>, <jwboyer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Modify the build system and source code so that libmtd.a can be built from
a "common" location (lib/).  Statically link all utilities at the top level
with libmtd.a .  Minor changes to mkfs.ubifs to allow using the common
crc32 implementation.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 Makefile                  |   21 ++++++---------------
 common.mk                 |    2 +-
 fectest.c                 |    2 +-
 flash_eraseall.c          |    2 +-
 include/crc32.h           |    2 +-
 jffs2dump.c               |    2 +-
 lib/Makefile              |   22 ++++++++++++++++++++++
 mkfs.jffs2.c              |    4 ++--
 mkfs.ubifs/Makefile       |    3 ++-
 mkfs.ubifs/compr.c        |    4 +++-
 mkfs.ubifs/mkfs.ubifs.c   |    5 +++--
 mkfs.ubifs/mkfs.ubifs.h   |    1 -
 recv_image.c              |    2 +-
 serve_image.c             |    2 +-
 sumtool.c                 |    2 +-
 ubi-utils/Makefile        |   15 +++++++--------
 ubi-utils/src/libscan.c   |    2 +-
 ubi-utils/src/libubigen.c |    2 +-
 ubi-utils/src/ubicrc32.c  |    2 +-
 ubi-utils/src/ubiformat.c |    2 +-
 20 files changed, 57 insertions(+), 42 deletions(-)
 create mode 100644 lib/Makefile

diff --git a/Makefile b/Makefile
index 577634f..b558705 100644
--- a/Makefile
+++ b/Makefile
@@ -7,7 +7,7 @@ ifeq ($(WITHOUT_XATTR), 1)
   CPPFLAGS += -DWITHOUT_XATTR
 endif
 
-SUBDIRS = ubi-utils mkfs.ubifs
+SUBDIRS = lib ubi-utils mkfs.ubifs
 
 TARGETS = ftl_format flash_erase flash_eraseall nanddump doc_loadbios \
 	ftl_check mkfs.jffs2 flash_lock flash_unlock flash_info \
@@ -20,6 +20,9 @@ TARGETS = ftl_format flash_erase flash_eraseall nanddump doc_loadbios \
 
 SYMLINKS =
 
+LDLIBS = -L$(BUILDDIR)/lib -lmtd
+LDDEPS = $(BUILDDIR)/lib/libmtd.a
+
 include common.mk
 
 clean::
@@ -36,28 +39,16 @@ $(SYMLINKS):
 	ln -sf ../fs/jffs2/$@ $@
 
 $(BUILDDIR)/mkfs.jffs2: $(addprefix $(BUILDDIR)/,\
-	crc32.o compr_rtime.o mkfs.jffs2.o compr_zlib.o compr_lzo.o \
+	compr_rtime.o mkfs.jffs2.o compr_zlib.o compr_lzo.o \
 	compr.o rbtree.o)
 LDFLAGS_mkfs.jffs2 = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
 LDLIBS_mkfs.jffs2  = -lz -llzo2
 
-$(BUILDDIR)/flash_eraseall: $(BUILDDIR)/crc32.o $(BUILDDIR)/flash_eraseall.o
-
 $(BUILDDIR)/jffs2reader: $(BUILDDIR)/jffs2reader.o
 LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
 LDLIBS_jffs2reader  = -lz -llzo2
 
-$(BUILDDIR)/jffs2dump: $(BUILDDIR)/jffs2dump.o $(BUILDDIR)/crc32.o
-
-$(BUILDDIR)/sumtool: $(BUILDDIR)/sumtool.o $(BUILDDIR)/crc32.o
-
-$(BUILDDIR)/serve_image: $(BUILDDIR)/serve_image.o $(BUILDDIR)/crc32.o $(BUILDDIR)/fec.o
-
-$(BUILDDIR)/recv_image: $(BUILDDIR)/recv_image.o $(BUILDDIR)/crc32.o $(BUILDDIR)/fec.o
-
-$(BUILDDIR)/fectest: $(BUILDDIR)/fectest.o $(BUILDDIR)/crc32.o $(BUILDDIR)/fec.o
-
-
+$(BUILDDIR)/lib/libmtd.a: subdirs_lib_all ;
 
 install:: ${TARGETS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
diff --git a/common.mk b/common.mk
index d704b44..be785b4 100644
--- a/common.mk
+++ b/common.mk
@@ -47,7 +47,7 @@ clean:: $(SUBDIRS_CLEAN)
 
 install:: $(TARGETS) $(SUBDIRS_INSTALL)
 
-%: %.o
+%: %.o $(LDDEPS) $(LDDEPS_$(notdir $@))
 	$(CC) $(CFLAGS) $(LDFLAGS) $(LDFLAGS_$(notdir $@)) -g -o $@ $^ $(LDLIBS) $(LDLIBS_$(notdir $@))
 
 $(BUILDDIR)/%.a:
diff --git a/fectest.c b/fectest.c
index d5893b9..c1fbd52 100644
--- a/fectest.c
+++ b/fectest.c
@@ -8,7 +8,7 @@
 #include <sys/stat.h>
 
 #include "mcast_image.h"
-#include "crc32.h"
+#include <crc32.h>
 
 #define ERASE_SIZE 131072
 //#define PKT_SIZE 1400
diff --git a/flash_eraseall.c b/flash_eraseall.c
index a22fc49..e6f8d50 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -35,7 +35,7 @@
 #include <getopt.h>
 #include <sys/ioctl.h>
 #include <sys/mount.h>
-#include "crc32.h"
+#include <crc32.h>
 
 #include <mtd/mtd-user.h>
 #include <mtd/jffs2-user.h>
diff --git a/include/crc32.h b/include/crc32.h
index 86fc841..4b51177 100644
--- a/include/crc32.h
+++ b/include/crc32.h
@@ -10,7 +10,7 @@
 extern const uint32_t crc32_table[256];
 
 /* Return a 32-bit CRC of the contents of the buffer. */
-static inline uint32_t ubifs_crc32(uint32_t val, const void *ss, int len)
+static inline uint32_t crc32(uint32_t val, const void *ss, int len)
 {
 	const unsigned char *s = ss;
 
diff --git a/jffs2dump.c b/jffs2dump.c
index 2802682..cd8b6fa 100644
--- a/jffs2dump.c
+++ b/jffs2dump.c
@@ -31,7 +31,7 @@
 #include <endian.h>
 #include <byteswap.h>
 #include <getopt.h>
-#include "crc32.h"
+#include <crc32.h>
 #include "summary.h"
 
 #define PROGRAM "jffs2dump"
diff --git a/lib/Makefile b/lib/Makefile
new file mode 100644
index 0000000..91507f3
--- /dev/null
+++ b/lib/Makefile
@@ -0,0 +1,22 @@
+#
+# Makefile for libmtd
+#
+
+SUBDIRS =
+
+# CFLAGS += -Werror
+CPPFLAGS += -I../include
+LIBS = libmtd
+TARGETS = libmtd.a
+
+include ../common.mk
+
+$(BUILDDIR)/libmtd.a: $(addprefix $(BUILDDIR)/,\
+	libmtd.o libmtd_legacy.o crc32.o fec.o)
+
+clean::
+	rm -f $(addsuffix .a, $(LIBS))
+
+install::
+
+uninstall:
diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 64cafb6..2c78fd5 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -69,10 +69,10 @@
 #include <sys/acl.h>
 #endif
 #include <byteswap.h>
-#define crc32 __complete_crap
+#define crc32 __zlib_crc32
 #include <zlib.h>
 #undef crc32
-#include "crc32.h"
+#include <crc32.h>
 #include "rbtree.h"
 
 /* Do not use the weird XPG version of basename */
diff --git a/mkfs.ubifs/Makefile b/mkfs.ubifs/Makefile
index 61d0e20..ba21a8c 100644
--- a/mkfs.ubifs/Makefile
+++ b/mkfs.ubifs/Makefile
@@ -7,12 +7,13 @@ ALL_SOURCES=*.[ch] hashtable/*.[ch]
 TARGETS = mkfs.ubifs
 
 LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid -L$(BUILDDIR)/../ubi-utils/ -lubi
+LDLIBS_mkfs.ubifs += -L$(BUILDDIR)/../lib -lmtd
 LDLIBS_mkfs.ubifs += $(ZLIBLDFLAGS) $(LZOLDFLAGS)
 
 include ../common.mk
 
 $(BUILDDIR)/mkfs.ubifs: $(addprefix $(BUILDDIR)/,\
-	crc16.o crc32.o lpt.o compr.o devtable.o \
+	crc16.o lpt.o compr.o devtable.o \
 	hashtable/hashtable.o hashtable/hashtable_itr.o)
 
 clean::
diff --git a/mkfs.ubifs/compr.c b/mkfs.ubifs/compr.c
index e378c5d..7f084c5 100644
--- a/mkfs.ubifs/compr.c
+++ b/mkfs.ubifs/compr.c
@@ -24,10 +24,12 @@
 #include <stdio.h>
 #include <stdint.h>
 #include <string.h>
-#include <zlib.h>
 #include <lzo/lzo1x.h>
 #include <linux/types.h>
 
+#define crc32 __zlib_crc32
+#include <zlib.h>
+
 #include "compr.h"
 #include "ubifs-media.h"
 #include "mkfs.ubifs.h"
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index e4b4e3c..95b20b0 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -21,6 +21,7 @@
  */
 
 #include "mkfs.ubifs.h"
+#include <crc32.h>
 
 #define PROGRAM_VERSION "1.3"
 
@@ -752,7 +753,7 @@ static void prepare_node(void *node, int len)
 	ch->group_type = UBIFS_NO_NODE_GROUP;
 	ch->sqnum = cpu_to_le64(++c->max_sqnum);
 	ch->padding[0] = ch->padding[1] = 0;
-	crc = ubifs_crc32(UBIFS_CRC32_INIT, node + 8, len - 8);
+	crc = crc32(UBIFS_CRC32_INIT, node + 8, len - 8);
 	ch->crc = cpu_to_le32(crc);
 }
 
@@ -822,7 +823,7 @@ static int do_pad(void *buf, int len)
 		pad_len -= UBIFS_PAD_NODE_SZ;
 		pad_node->pad_len = cpu_to_le32(pad_len);
 
-		crc = ubifs_crc32(UBIFS_CRC32_INIT, buf + 8,
+		crc = crc32(UBIFS_CRC32_INIT, buf + 8,
 				  UBIFS_PAD_NODE_SZ - 8);
 		ch->crc = cpu_to_le32(crc);
 
diff --git a/mkfs.ubifs/mkfs.ubifs.h b/mkfs.ubifs/mkfs.ubifs.h
index 16b34c7..c00dce0 100644
--- a/mkfs.ubifs/mkfs.ubifs.h
+++ b/mkfs.ubifs/mkfs.ubifs.h
@@ -49,7 +49,6 @@
 #include <sys/file.h>
 
 #include "libubi.h"
-#include "crc32.h"
 #include "defs.h"
 #include "crc16.h"
 #include "ubifs-media.h"
diff --git a/recv_image.c b/recv_image.c
index d65aa2a..2be511a 100644
--- a/recv_image.c
+++ b/recv_image.c
@@ -16,7 +16,7 @@
 #include <netinet/in.h>
 #include <sys/ioctl.h>
 #include <sys/time.h>
-#include "crc32.h"
+#include <crc32.h>
 #include "mtd/mtd-user.h"
 #include "mcast_image.h"
 
diff --git a/serve_image.c b/serve_image.c
index adb4869..5aafa35 100644
--- a/serve_image.c
+++ b/serve_image.c
@@ -16,7 +16,7 @@
 #include <sys/mman.h>
 #include <netinet/in.h>
 #include <sys/time.h>
-#include "crc32.h"
+#include <crc32.h>
 #include "mcast_image.h"
 
 int tx_rate = 80000;
diff --git a/sumtool.c b/sumtool.c
index 6bb7168..966e110 100644
--- a/sumtool.c
+++ b/sumtool.c
@@ -44,7 +44,7 @@
 #include <endian.h>
 #include <byteswap.h>
 #include <getopt.h>
-#include "crc32.h"
+#include <crc32.h>
 #include "summary.h"
 
 #define PAD(x) (((x)+3)&~3)
diff --git a/ubi-utils/Makefile b/ubi-utils/Makefile
index e736a09..327d2d7 100644
--- a/ubi-utils/Makefile
+++ b/ubi-utils/Makefile
@@ -9,11 +9,12 @@ SUBDIRS = old-utils
 # CFLAGS += -Werror
 CPPFLAGS += -Iinclude -Isrc -I$(KERNELHDR)
 
-LIBS = libubi libmtd libubigen libiniparser libscan
+LIBS = libubi libubigen libiniparser libscan
 TARGETS = ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
           ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol
 
 VPATH = src
+LDLIBS = -L$(BUILDDIR)/../lib -lmtd
 
 include ../common.mk
 
@@ -23,32 +24,30 @@ $(TARGETS): $(addprefix $(BUILDDIR)/,\
 #	$(CC) $(CFLAGS) $(filter %.o, $^) -L. -lubi -o $@
 
 $(BUILDDIR)/ubicrc32: $(addprefix $(BUILDDIR)/,\
-	ubicrc32.o crc32.o)
+	ubicrc32.o)
 #	$(CC) $(CFLAGS) -o $@ $^
 
 $(BUILDDIR)/ubinize: $(addprefix $(BUILDDIR)/,\
-	ubinize.o common.o crc32.o libiniparser.a libubigen.a)
+	ubinize.o common.o libiniparser.a libubigen.a)
 #	$(CC) $(CFLAGS) $(filter %.o, $^) -L. -liniparser -lubigen -o $@
 
 $(BUILDDIR)/mtdinfo: $(addprefix $(BUILDDIR)/,\
-	libmtd.a libubigen.a crc32.o common.o)
+	libubigen.a common.o)
 #	$(CC) $(CFLAGS) $(filter %.o, $^) -L. -lmtd -lubigen -o $@
 
 $(BUILDDIR)/ubiformat: $(addprefix $(BUILDDIR)/,\
-	ubiformat.o common.o crc32.o libmtd.a libscan.a libubi.a libubigen.a)
+	ubiformat.o common.o libscan.a libubi.a libubigen.a)
 #	$(CC) $(CFLAGS) $(filter %.o, $^) -L. -lmtd -lscan -lubi -lubigen -o $@
 
 $(BUILDDIR)/libubi.a: $(BUILDDIR)/libubi.o
 
-$(BUILDDIR)/libmtd.a: $(BUILDDIR)/libmtd.o $(BUILDDIR)/libmtd_legacy.o
-
 $(BUILDDIR)/libubigen.a: $(BUILDDIR)/libubigen.o
 
 $(BUILDDIR)/libiniparser.a: $(addprefix $(BUILDDIR)/,\
 	libiniparser.o dictionary.o)
 
 $(BUILDDIR)/libscan.a: $(addprefix $(BUILDDIR)/,\
-	libscan.o crc32.o)
+	libscan.o)
 
 clean::
 	rm -f $(addsuffix .a, $(LIBS))
diff --git a/ubi-utils/src/libscan.c b/ubi-utils/src/libscan.c
index 5a2ea78..85f3d7f 100644
--- a/ubi-utils/src/libscan.c
+++ b/ubi-utils/src/libscan.c
@@ -32,8 +32,8 @@
 #include <mtd/mtd-user.h>
 #include <libmtd.h>
 #include <libscan.h>
+#include <crc32.h>
 #include "common.h"
-#include "crc32.h"
 
 #define PROGRAM_NAME "libscan"
 
diff --git a/ubi-utils/src/libubigen.c b/ubi-utils/src/libubigen.c
index 8f060da..62792d0 100644
--- a/ubi-utils/src/libubigen.c
+++ b/ubi-utils/src/libubigen.c
@@ -32,7 +32,7 @@
 #include <mtd/ubi-media.h>
 #include <mtd_swab.h>
 #include <libubigen.h>
-#include "crc32.h"
+#include <crc32.h>
 #include "common.h"
 
 #define PROGRAM_NAME "libubigen"
diff --git a/ubi-utils/src/ubicrc32.c b/ubi-utils/src/ubicrc32.c
index d39af10..2dd69e1 100644
--- a/ubi-utils/src/ubicrc32.c
+++ b/ubi-utils/src/ubicrc32.c
@@ -28,8 +28,8 @@
 #include <getopt.h>
 #include <unistd.h>
 #include <mtd/ubi-media.h>
+#include <crc32.h>
 
-#include "crc32.h"
 #include "common.h"
 
 #define BUFSIZE 4096
diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index 8487fd5..f0a87c4 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -41,7 +41,7 @@
 #include <libscan.h>
 #include <libubigen.h>
 #include <mtd_swab.h>
-#include "crc32.h"
+#include <crc32.h>
 #include "common.h"
 
 #define PROGRAM_VERSION "1.5"
-- 
1.6.5
