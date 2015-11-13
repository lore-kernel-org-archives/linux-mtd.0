Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zx7ju-0001vG-M8
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2015 06:21:41 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 08/27] ubifs: introduce a new tool ubifs_dump
Date: Fri, 13 Nov 2015 14:13:19 +0800
Message-ID: <1447395218-7061-9-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1447395218-7061-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1447395218-7061-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Init a new tool named as ubifs_dump

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 Makefile                            |  8 ++++-
 ubifs-utils/ubifs_dump/ubifs_dump.c | 68 +++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 ubifs-utils/ubifs_dump/ubifs_dump.c

diff --git a/Makefile b/Makefile
index ad0526f..a1aaa6e 100644
--- a/Makefile
+++ b/Makefile
@@ -25,7 +25,8 @@ UBI_BINS = \
 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
 	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
 UBIFS_BINS = \
-	mkfs.ubifs/mkfs.ubifs
+	mkfs.ubifs/mkfs.ubifs \
+	ubifs_dump/ubifs_dump
 JFFSX_BINS = \
 	mkfs.jffs2 sumtool jffs2reader jffs2dump
 NAND_BINS = \
@@ -128,6 +129,11 @@ $(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-co
 #
 $(foreach v,crc16.o lpt.o compr.o devtable.o io.o hashtable.o hashtable_itr.o,$(eval UBIFS_LIBS += ../lib/$(v)))
 
+obj-ubifs_dump = $(UBIFS_LIBS)
+LDFLAGS_ubifs_dump = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
+LDLIBS_ubifs_dump = -lz -llzo2 -lm -luuid
+$(call mkdep,ubifs-utils/ubifs_dump/,ubifs_dump,,ubi-utils/libubi.a)
+
 obj-mkfs.ubifs = $(UBIFS_LIBS)
 LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
 LDLIBS_mkfs.ubifs = -lz $(LZOLDLIBS) -lm -luuid
diff --git a/ubifs-utils/ubifs_dump/ubifs_dump.c b/ubifs-utils/ubifs_dump/ubifs_dump.c
new file mode 100644
index 0000000..bbe1269
--- /dev/null
+++ b/ubifs-utils/ubifs_dump/ubifs_dump.c
@@ -0,0 +1,68 @@
+#include "ubifs_common.h"
+#define PROGRAM_NAME "ubifs-dump"
+#include "common.h"
+#include "io.h"
+
+static const char *optstring = "";
+
+static const struct option longopts[] = {
+	{NULL, 0, NULL, 0}
+};
+
+struct ubifs_info info_;
+static struct ubifs_info *c = &info_;
+
+static int get_options(int argc, char**argv)
+{
+	int opt, i;
+
+	while (1) {
+		opt = getopt_long(argc, argv, optstring, longopts, &i);
+		if (opt == -1)
+			break;
+		switch (opt) {
+		default:
+			break;
+		}
+	}
+
+	if (optind != argc && !output)
+		output = xstrdup(argv[optind]);
+
+	if (!output)
+		return err_msg("not output device or file specified");
+
+	if (open_ubi(c, output))
+		return err_msg("open ubi (%s) failed.", output);
+
+	return 0;
+}
+
+static int dump()
+{
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int err;
+
+	err = get_options(argc, argv);
+	if (err)
+		return err;
+	err = open_target(c, 1);
+	if (err)
+		return err;
+
+	err = dump();
+	if (err) {
+		close_target();
+		return err;
+	}
+
+	err = close_target();
+	if (err)
+		return err;
+
+	return 0;
+}
-- 
1.8.4.2
