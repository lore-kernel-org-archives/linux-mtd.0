Received: from smtp.gentoo.org ([140.211.166.183])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UYL8H-0006Qk-Ui
 for linux-mtd@lists.infradead.org; Fri, 03 May 2013 18:55:03 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH v2] UBI: drop redundant "UBI error" string
Date: Fri,  3 May 2013 14:54:34 -0400
Message-Id: <1367607274-30000-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1366680595-6197-1-git-send-email-vapier@gentoo.org>
References: <1366680595-6197-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ubi_err() macro automatically prefixes "UBI error" before the message.
By also using it here, we get a log like so:
	UBI error: ubi_init: UBI error: cannot initialize UBI, error -19

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- found some more places in latest mainline

 drivers/mtd/ubi/build.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index a561335..745fbc5 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1309,7 +1309,7 @@ out_version:
 out_class:
 	class_destroy(ubi_class);
 out:
-	ubi_err("UBI error: cannot initialize UBI, error %d", err);
+	ubi_err("cannot initialize UBI, error %d", err);
 	return err;
 }
 late_initcall(ubi_init);
@@ -1346,7 +1346,7 @@ static int __init bytes_str_to_int(const char *str)
 
 	result = simple_strtoul(str, &endp, 0);
 	if (str == endp || result >= INT_MAX) {
-		ubi_err("UBI error: incorrect bytes count: \"%s\"\n", str);
+		ubi_err("incorrect bytes count: \"%s\"\n", str);
 		return -EINVAL;
 	}
 
@@ -1362,7 +1362,7 @@ static int __init bytes_str_to_int(const char *str)
 	case '\0':
 		break;
 	default:
-		ubi_err("UBI error: incorrect bytes count: \"%s\"\n", str);
+		ubi_err("incorrect bytes count: \"%s\"\n", str);
 		return -EINVAL;
 	}
 
@@ -1389,14 +1389,14 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 		return -EINVAL;
 
 	if (mtd_devs == UBI_MAX_DEVICES) {
-		ubi_err("UBI error: too many parameters, max. is %d\n",
+		ubi_err("too many parameters, max. is %d\n",
 			UBI_MAX_DEVICES);
 		return -EINVAL;
 	}
 
 	len = strnlen(val, MTD_PARAM_LEN_MAX);
 	if (len == MTD_PARAM_LEN_MAX) {
-		ubi_err("UBI error: parameter \"%s\" is too long, max. is %d\n",
+		ubi_err("parameter \"%s\" is too long, max. is %d\n",
 			val, MTD_PARAM_LEN_MAX);
 		return -EINVAL;
 	}
@@ -1416,7 +1416,7 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 		tokens[i] = strsep(&pbuf, ",");
 
 	if (pbuf) {
-		ubi_err("UBI error: too many arguments at \"%s\"\n", val);
+		ubi_err("too many arguments at \"%s\"\n", val);
 		return -EINVAL;
 	}
 
@@ -1433,7 +1433,7 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 		int err = kstrtoint(tokens[2], 10, &p->max_beb_per1024);
 
 		if (err) {
-			ubi_err("UBI error: bad value for max_beb_per1024 parameter: %s",
+			ubi_err("bad value for max_beb_per1024 parameter: %s",
 				tokens[2]);
 			return -EINVAL;
 		}
-- 
1.8.2.1
