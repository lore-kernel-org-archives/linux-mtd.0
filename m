Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4ASF-00013f-Eh
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 12:54:40 +0000
Received: by wibhq4 with SMTP id hq4so4249432wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 05:54:37 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBI: replace printk calls by ubi_* calls in build.c
Date: Wed, 22 Aug 2012 14:54:23 +0200
Message-Id: <1345640063-29055-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There was some printk still used in ubi_mtd_param_parse() function
because it's called at early boot stage and at the time of UBI
inclusion, ubi_* wrappers caused some issues.

Now, it seems to be ok to use them.

Also, some ubi_* lines are unwrapped to be grep friendly.
Finally, an extraneous "UBI error: " suffix is removed.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/ubi/build.c |   36 +++++++++++++++---------------------
 1 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index aa60b30..cd7f578 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -748,16 +748,15 @@ static int io_init(struct ubi_device *ubi, int max_beb_per1024)
 	 * read-only mode.
 	 */
 	if (ubi->vid_hdr_offset + UBI_VID_HDR_SIZE <= ubi->hdrs_min_io_size) {
-		ubi_warn("EC and VID headers are in the same minimal I/O unit, "
-			 "switch to read-only mode");
+		ubi_warn("EC and VID headers are in the same minimal I/O unit, switch to read-only mode");
 		ubi->ro_mode = 1;
 	}
 
 	ubi->leb_size = ubi->peb_size - ubi->leb_start;
 
 	if (!(ubi->mtd->flags & MTD_WRITEABLE)) {
-		ubi_msg("MTD device %d is write-protected, attach in "
-			"read-only mode", ubi->mtd->index);
+		ubi_msg("MTD device %d is write-protected, attach in read-only mode",
+			ubi->mtd->index);
 		ubi->ro_mode = 1;
 	}
 
@@ -887,8 +886,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	 * no sense to attach emulated MTD devices, so we prohibit this.
 	 */
 	if (mtd->type == MTD_UBIVOLUME) {
-		ubi_err("refuse attaching mtd%d - it is already emulated on "
-			"top of UBI", mtd->index);
+		ubi_err("refuse attaching mtd%d - it is already emulated on top of UBI",
+			mtd->index);
 		return -EINVAL;
 	}
 
@@ -1263,7 +1262,7 @@ out_version:
 out_class:
 	class_destroy(ubi_class);
 out:
-	ubi_err("UBI error: cannot initialize UBI, error %d", err);
+	ubi_err("cannot initialize UBI, error %d", err);
 	return err;
 }
 module_init(ubi_init);
@@ -1300,8 +1299,7 @@ static int __init bytes_str_to_int(const char *str)
 
 	result = simple_strtoul(str, &endp, 0);
 	if (str == endp || result >= INT_MAX) {
-		printk(KERN_ERR "UBI error: incorrect bytes count: \"%s\"\n",
-		       str);
+		ubi_err("incorrect bytes count: \"%s\"", str);
 		return -EINVAL;
 	}
 
@@ -1317,8 +1315,7 @@ static int __init bytes_str_to_int(const char *str)
 	case '\0':
 		break;
 	default:
-		printk(KERN_ERR "UBI error: incorrect bytes count: \"%s\"\n",
-		       str);
+		ubi_err("incorrect bytes count: \"%s\"", str);
 		return -EINVAL;
 	}
 
@@ -1345,21 +1342,19 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 		return -EINVAL;
 
 	if (mtd_devs == UBI_MAX_DEVICES) {
-		printk(KERN_ERR "UBI error: too many parameters, max. is %d\n",
-		       UBI_MAX_DEVICES);
+		ubi_err("too many parameters, max. is %d", UBI_MAX_DEVICES);
 		return -EINVAL;
 	}
 
 	len = strnlen(val, MTD_PARAM_LEN_MAX);
 	if (len == MTD_PARAM_LEN_MAX) {
-		printk(KERN_ERR "UBI error: parameter \"%s\" is too long, "
-		       "max. is %d\n", val, MTD_PARAM_LEN_MAX);
+		ubi_err("parameter \"%s\" is too long, max. is %d",
+			val, MTD_PARAM_LEN_MAX);
 		return -EINVAL;
 	}
 
 	if (len == 0) {
-		printk(KERN_WARNING "UBI warning: empty 'mtd=' parameter - "
-		       "ignored\n");
+		ubi_warn("empty 'mtd=' parameter - ignored");
 		return 0;
 	}
 
@@ -1373,8 +1368,7 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 		tokens[i] = strsep(&pbuf, ",");
 
 	if (pbuf) {
-		printk(KERN_ERR "UBI error: too many arguments at \"%s\"\n",
-		       val);
+		ubi_err("too many arguments at \"%s\"", val);
 		return -EINVAL;
 	}
 
@@ -1391,8 +1385,8 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 		int err = kstrtoint(tokens[2], 10, &p->max_beb_per1024);
 
 		if (err) {
-			printk(KERN_ERR "UBI error: bad value for "
-			       "max_beb_per1024 parameter: %s", tokens[2]);
+			ubi_err("bad value for max_beb_per1024 parameter: %s",
+				tokens[2]);
 			return -EINVAL;
 		}
 	}
-- 
1.7.2.5
