Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3UP5-0006zM-Oh
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 16:00:36 +0000
Received: by wibhn17 with SMTP id hn17so2909216wib.0
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 09:00:34 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v3 4/6] UBI: replace MTD_UBI_BEB_LIMIT with module parameter
Date: Mon, 20 Aug 2012 18:00:14 +0200
Message-Id: <1345478416-23900-5-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch provides the possibility to adjust the "maximum expected number of
bad blocks per 1024 blocks" (max_beb_per1024) for each mtd device.

The majority of NAND devices have their max_beb_per1024 equal to 20, but
sometimes it's more.
Now, we can adjust that via a kernel parameter:
ubi.mtd=<name|num|path>[,<vid_hdr_offs>[,max_beb_per1024]]

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/ubi/Kconfig |    2 ++
 drivers/mtd/ubi/build.c |   38 ++++++++++++++++++++++++--------------
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index dcbaae3..37e070c 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -51,6 +51,8 @@ config MTD_UBI_BEB_LIMIT
 	  MTD partitions of the same size, UBI will reserve 40 eraseblocks when
 	  attaching a partition.
 
+	  This option can be overridden by the kernel parameter ubi.mtd.
+
 	  Leave the default value if unsure.
 
 config MTD_UBI_GLUEBI
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 6a749d6..5b987cb 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -47,7 +47,7 @@
 #define MTD_PARAM_LEN_MAX 64
 
 /* Maximum number of comma-separated items in the 'mtd=' parameter */
-#define MTD_PARAM_MAX_COUNT 2
+#define MTD_PARAM_MAX_COUNT 3
 
 /* Maximum value for the number of bad eraseblocks per 1024 limit */
 #define MAX_MTD_UBI_BEB_LIMIT 768
@@ -63,10 +63,12 @@
  * @name: MTD character device node path, MTD device name, or MTD device number
  *        string
  * @vid_hdr_offs: VID header offset
+ * @max_beb_per1024: maximum expected number of bad blocks per 1024 erase blocks
  */
 struct mtd_dev_param {
 	char name[MTD_PARAM_LEN_MAX];
 	int vid_hdr_offs;
+	int max_beb_per1024;
 };
 
 /* Numbers of elements set in the @mtd_dev_param array */
@@ -1224,8 +1226,7 @@ static int __init ubi_init(void)
 
 		mutex_lock(&ubi_devices_mutex);
 		err = ubi_attach_mtd_dev(mtd, UBI_DEV_NUM_AUTO,
-					 p->vid_hdr_offs,
-					 CONFIG_MTD_UBI_BEB_LIMIT);
+					 p->vid_hdr_offs, p->max_beb_per1024);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0) {
 			ubi_err("cannot attach mtd%d", mtd->index);
@@ -1345,6 +1346,7 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 	char buf[MTD_PARAM_LEN_MAX];
 	char *pbuf = &buf[0];
 	char *tokens[MTD_PARAM_MAX_COUNT];
+	int err;
 
 	if (!val)
 		return -EINVAL;
@@ -1392,23 +1394,31 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 	if (p->vid_hdr_offs < 0)
 		return p->vid_hdr_offs;
 
+	if (tokens[2]) {
+		err = kstrtoint(tokens[2], 10, &p->max_beb_per1024);
+		if (err) {
+			pr_err("UBI error: bad value for max_beb_per1024 parameter: %s",
+			       tokens[2]);
+			return -EINVAL;
+		}
+	}
+
 	mtd_devs += 1;
 	return 0;
 }
 
 module_param_call(mtd, ubi_mtd_param_parse, NULL, NULL, 000);
-MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: "
-		      "mtd=<name|num|path>[,<vid_hdr_offs>].\n"
+MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|path>[,<vid_hdr_offs>[,max_beb_per1024]].\n"
 		      "Multiple \"mtd\" parameters may be specified.\n"
-		      "MTD devices may be specified by their number, name, or "
-		      "path to the MTD character device node.\n"
-		      "Optional \"vid_hdr_offs\" parameter specifies UBI VID "
-		      "header position to be used by UBI.\n"
-		      "Example 1: mtd=/dev/mtd0 - attach MTD device "
-		      "/dev/mtd0.\n"
-		      "Example 2: mtd=content,1984 mtd=4 - attach MTD device "
-		      "with name \"content\" using VID header offset 1984, and "
-		      "MTD device number 4 with default VID header offset.");
+		      "MTD devices may be specified by their number, name, or path to the MTD character device node.\n"
+		      "Optional \"vid_hdr_offs\" parameter specifies UBI VID header position to be used by UBI. (default value if 0)\n"
+		      "Optional \"max_beb_per1024\" parameter specifies the maximum expected bad eraseblock per 1024 eraseblocks. (default value ("
+		      __stringify(CONFIG_MTD_UBI_BEB_LIMIT) ") if 0)\n"
+		      "\n"
+		      "Example 1: mtd=/dev/mtd0 - attach MTD device /dev/mtd0.\n"
+		      "Example 2: mtd=content,1984 mtd=4 - attach MTD device with name \"content\" using VID header offset 1984, and MTD device number 4 with default VID header offset.\n"
+		      "Example 3: mtd=/dev/mtd1,0,25 - attach MTD device /dev/mtd1 using default VID header offset and reserve 25*nand_size_in_blocks/1024 erase blocks for bad block handling.\n"
+		      "\t(e.g. if the NAND *chipset* has 4096 PEB, 100 will be reserved for this UBI device).");
 
 MODULE_VERSION(__stringify(UBI_VERSION));
 MODULE_DESCRIPTION("UBI - Unsorted Block Images");
-- 
1.7.2.5
