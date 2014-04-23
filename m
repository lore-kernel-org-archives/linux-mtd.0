Received: from smtp22.mail.ru ([94.100.176.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WczRT-0002F6-NC
 for linux-mtd@lists.infradead.org; Wed, 23 Apr 2014 15:50:37 +0000
Message-ID: <5357E133.5040205@list.ru>
Date: Wed, 23 Apr 2014 19:50:11 +0400
From: Stas Sergeev <stsp@list.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] nandmarkblk: initial version
References: <5357D808.5070101@list.ru>
In-Reply-To: <5357D808.5070101@list.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Stas Sergeev <stsp@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trying again, with inlined patch...


-=-=-=-=-=-=-=-=-=# Don't remove this line #=-=-=-=-=-=-=-=-=-
The tool to mark nand blocks as bad.
In the future - also as good.

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 Makefile      |   2 +-
 nandmarkblk.c | 151
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 152 insertions(+), 1 deletion(-)
 create mode 100644 nandmarkblk.c

diff --git a/Makefile b/Makefile
index d316a3d..acb9837 100644
--- a/Makefile
+++ b/Makefile
@@ -20,7 +20,7 @@ MTD_BINS = \
     ftl_format flash_erase nanddump doc_loadbios \
     ftl_check mkfs.jffs2 flash_lock flash_unlock \
     flash_otp_info flash_otp_dump flash_otp_lock flash_otp_write \
-    mtd_debug flashcp nandwrite nandtest \
+    mtd_debug flashcp nandwrite nandtest nandmarkblk \
     jffs2dump \
     nftldump nftl_format docfdisk \
     rfddump rfdformat \
diff --git a/nandmarkblk.c b/nandmarkblk.c
new file mode 100644
index 0000000..127219c
--- /dev/null
+++ b/nandmarkblk.c
@@ -0,0 +1,151 @@
+/*
+ *  nandmarkblk.c
+ *
+ *  Author: Stas Sergeev <stsp@users.sourceforge.net>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#define PROGRAM_NAME "nandmarkblk"
+
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <string.h>
+#include <getopt.h>
+#include <sys/ioctl.h>
+#include "mtd/mtd-user.h"
+#include "common.h"
+#include <libmtd.h>
+
+static void display_help(int status)
+{
+    fprintf(status == EXIT_SUCCESS ? stdout : stderr,
+"Usage: nandwrite [OPTION] MTD_DEVICE [INPUTFILE|-]\n"
+"Writes to the specified MTD device.\n"
+"\n"
+"  -b num, --markbad=num   Mark block bad\n"
+"  -q, --quiet             Don't display progress messages\n"
+"  -h, --help              Display this help and exit\n"
+"      --version           Output version information and exit\n"
+    );
+    exit(status);
+}
+
+static void display_version(void)
+{
+    printf("%1$s " VERSION "\n"
+            "\n"
+            "%1$s comes with NO WARRANTY\n"
+            "to the extent permitted by law.\n"
+            "\n"
+            "You may redistribute copies of %1$s\n"
+            "under the terms of the GNU General Public Licence.\n"
+            "See the file `COPYING' for more information.\n",
+            PROGRAM_NAME);
+    exit(EXIT_SUCCESS);
+}
+
+static const char    *mtd_device;
+static bool        quiet = false;
+static int        markbad = -1;
+static int        markgood = -1;
+
+static void process_options(int argc, char * const argv[])
+{
+    int error = 0;
+
+    for (;;) {
+        int option_index = 0;
+        static const char short_options[] = "vhb:g:q";
+        static const struct option long_options[] = {
+            /* Order of these args with val==0 matters; see
option_index. */
+            {"version", no_argument, 0, 'v'},
+            {"help", no_argument, 0, 'h'},
+            {"markbad", required_argument, 0, 'b'},
+            {"markgood", required_argument, 0, 'g'},
+            {"quiet", no_argument, 0, 'q'},
+            {0, 0, 0, 0},
+        };
+
+        int c = getopt_long(argc, argv, short_options,
+                long_options, &option_index);
+        if (c == EOF)
+            break;
+
+        switch (c) {
+        case 'v':
+            display_version();
+            break;
+        case 'q':
+            quiet = true;
+            break;
+        case 'g':
+            markgood = simple_strtoll(optarg, &error);
+            break;
+        case 'b':
+            markbad = simple_strtoll(optarg, &error);
+            break;
+        case 'h':
+            display_help(EXIT_SUCCESS);
+            break;
+        case '?':
+            error++;
+            break;
+        }
+    }
+
+    argc -= optind;
+    argv += optind;
+
+    if (argc != 1 || error)
+        display_help(EXIT_FAILURE);
+
+    mtd_device = argv[0];
+}
+
+/*
+ * Main program
+ */
+int main(int argc, char * const argv[])
+{
+    int fd = -1;
+    struct mtd_dev_info mtd;
+    /* contains all the data read from the file so far for the current
eraseblock */
+    libmtd_t mtd_desc;
+
+    process_options(argc, argv);
+
+    /* Open the device */
+    if ((fd = open(mtd_device, O_RDWR)) == -1)
+        sys_errmsg_die("%s", mtd_device);
+
+    mtd_desc = libmtd_open();
+    if (!mtd_desc)
+        errmsg_die("can't initialize libmtd");
+
+    /* Fill in MTD device capability structure */
+    if (mtd_get_dev_info(mtd_desc, mtd_device, &mtd) < 0)
+        errmsg_die("mtd_get_dev_info failed");
+
+    if (markbad != -1 && mtd_mark_bad(&mtd, fd, markbad)) {
+        sys_errmsg("%s: MTD Mark bad block failure", mtd_device);
+        goto closeall;
+    }
+
+    if (markgood != -1) {
+        sys_errmsg("%s: MTD Mark good is not implemented", mtd_device);
+        goto closeall;
+    }
+
+closeall:
+    libmtd_close(mtd_desc);
+    close(fd);
+
+    /* Return happy */
+    return EXIT_SUCCESS;
+}
-- 
1.7.11.7
