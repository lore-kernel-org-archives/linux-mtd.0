Received: from dev.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UYL8x-0006Su-O2
 for linux-mtd@lists.infradead.org; Fri, 03 May 2013 18:55:44 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH] UBI: support ubi_num on mtd.ubi command line
Date: Fri,  3 May 2013 14:55:23 -0400
Message-Id: <1367607323-30083-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I want to be able to add UBI volumes with specific numbers, but the
command line API doesn't have that atm.  Add an additional token to
support it.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/ubi/build.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 8ff08ec..7e0b845 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -47,7 +47,7 @@
 #define MTD_PARAM_LEN_MAX 64
 
 /* Maximum number of comma-separated items in the 'mtd=' parameter */
-#define MTD_PARAM_MAX_COUNT 3
+#define MTD_PARAM_MAX_COUNT 4
 
 /* Maximum value for the number of bad PEBs per 1024 PEBs */
 #define MAX_MTD_UBI_BEB_LIMIT 768
@@ -67,6 +67,7 @@
  */
 struct mtd_dev_param {
 	char name[MTD_PARAM_LEN_MAX];
+	int ubi_num;
 	int vid_hdr_offs;
 	int max_beb_per1024;
 };
@@ -1269,7 +1270,7 @@ static int __init ubi_init(void)
 		}
 
 		mutex_lock(&ubi_devices_mutex);
-		err = ubi_attach_mtd_dev(mtd, UBI_DEV_NUM_AUTO,
+		err = ubi_attach_mtd_dev(mtd, p->ubi_num,
 					 p->vid_hdr_offs, p->max_beb_per1024);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0) {
@@ -1387,7 +1388,7 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 	struct mtd_dev_param *p;
 	char buf[MTD_PARAM_LEN_MAX];
 	char *pbuf = &buf[0];
-	char *tokens[MTD_PARAM_MAX_COUNT];
+	char *tokens[MTD_PARAM_MAX_COUNT], *token;
 
 	if (!val)
 		return -EINVAL;
@@ -1427,37 +1428,54 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 	p = &mtd_dev_param[mtd_devs];
 	strcpy(&p->name[0], tokens[0]);
 
-	if (tokens[1])
-		p->vid_hdr_offs = bytes_str_to_int(tokens[1]);
+	token = tokens[1];
+	if (token) {
+		p->vid_hdr_offs = bytes_str_to_int(token);
 
-	if (p->vid_hdr_offs < 0)
-		return p->vid_hdr_offs;
+		if (p->vid_hdr_offs < 0)
+			return p->vid_hdr_offs;
+	}
 
-	if (tokens[2]) {
-		int err = kstrtoint(tokens[2], 10, &p->max_beb_per1024);
+	token = tokens[2];
+	if (token) {
+		int err = kstrtoint(token, 10, &p->max_beb_per1024);
 
 		if (err) {
 			ubi_err("bad value for max_beb_per1024 parameter: %s",
-				tokens[2]);
+				token);
 			return -EINVAL;
 		}
 	}
 
+	token = tokens[3];
+	if (token) {
+		int err = kstrtoint(token, 10, &p->ubi_num);
+
+		if (err) {
+			ubi_err("bad value for ubi_num parameter: %s",
+				token);
+			return -EINVAL;
+		}
+	} else
+		p->ubi_num = UBI_DEV_NUM_AUTO;
+
 	mtd_devs += 1;
 	return 0;
 }
 
 module_param_call(mtd, ubi_mtd_param_parse, NULL, NULL, 000);
-MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|path>[,<vid_hdr_offs>[,max_beb_per1024]].\n"
+MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|path>[,<vid_hdr_offs>[,max_beb_per1024[,ubi_num]]].\n"
 		      "Multiple \"mtd\" parameters may be specified.\n"
 		      "MTD devices may be specified by their number, name, or path to the MTD character device node.\n"
 		      "Optional \"vid_hdr_offs\" parameter specifies UBI VID header position to be used by UBI. (default value if 0)\n"
 		      "Optional \"max_beb_per1024\" parameter specifies the maximum expected bad eraseblock per 1024 eraseblocks. (default value ("
 		      __stringify(CONFIG_MTD_UBI_BEB_LIMIT) ") if 0)\n"
+		      "Optional \"ubi_num\" parameter specifies UBI volume number. (default value of UBI_DEV_NUM_AUTO)\n"
 		      "\n"
 		      "Example 1: mtd=/dev/mtd0 - attach MTD device /dev/mtd0.\n"
 		      "Example 2: mtd=content,1984 mtd=4 - attach MTD device with name \"content\" using VID header offset 1984, and MTD device number 4 with default VID header offset.\n"
 		      "Example 3: mtd=/dev/mtd1,0,25 - attach MTD device /dev/mtd1 using default VID header offset and reserve 25*nand_size_in_blocks/1024 erase blocks for bad block handling.\n"
+		      "Example 4: mtd=/dev/mtd1,0,0,5 - attach MTD device /dev/mtd1 to UBI 5 and using default values for the other fields.\n"
 		      "\t(e.g. if the NAND *chipset* has 4096 PEB, 100 will be reserved for this UBI device).");
 #ifdef CONFIG_MTD_UBI_FASTMAP
 module_param(fm_autoconvert, bool, 0644);
-- 
1.8.2.1
