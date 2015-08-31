Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWXfP-000439-FH
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 22:35:07 +0000
Received: by pabzx8 with SMTP id zx8so152930364pab.1
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2015 15:34:47 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH mtd-utils 05/11] flash_{un,
 }lock: abstract the argument positions
Date: Mon, 31 Aug 2015 15:34:26 -0700
Message-Id: <1441060472-82169-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1441060472-82169-1-git-send-email-computersforpeace@gmail.com>
References: <1441060472-82169-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Previously, there were no options (besides stand-alone --help and
--version), so we just used fixed-position argv indexes. Let's change
that.

Also clean up the sanity checks a bit to make them more verbose and
specific.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 flash_unlock.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/flash_unlock.c b/flash_unlock.c
index 27e7df1eac3f..ce72e49d4ba6 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -54,7 +54,8 @@ int main(int argc, char *argv[])
 	struct mtd_info_user mtdInfo;
 	struct erase_info_user mtdLockInfo;
 	int count;
-	const char *dev;
+	const char *dev, *offs_s, *count_s;
+	int arg_idx;
 
 	for (;;) {
 		int c;
@@ -76,11 +77,31 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	/* Parse command line options */
-	if (argc < 2 || argc > 4)
+	arg_idx = optind;
+
+	/* Sanity checks */
+	if (argc - arg_idx < 1) {
+		errmsg("too few arguments");
+		usage(1);
+	} else if (argc - arg_idx > 3) {
+		errmsg("too many arguments");
 		usage(1);
+	}
+
+	/* First non-option argument */
+	dev = argv[arg_idx++];
 
-	dev = argv[1];
+	/* Second non-option argument */
+	if (arg_idx < argc)
+		offs_s = argv[arg_idx++];
+	else
+		offs_s = NULL;
+
+	/* Third non-option argument */
+	if (arg_idx < argc)
+		count_s = argv[arg_idx++];
+	else
+		count_s = NULL;
 
 	/* Get the device info to compare to command line sizes */
 	fd = open(dev, O_RDWR);
@@ -91,16 +112,16 @@ int main(int argc, char *argv[])
 		sys_errmsg_die("could not get mtd info: %s", dev);
 
 	/* Make sure user options are valid */
-	if (argc > 2)
-		mtdLockInfo.start = strtol(argv[2], NULL, 0);
+	if (offs_s)
+		mtdLockInfo.start = strtol(offs_s, NULL, 0);
 	else
 		mtdLockInfo.start = 0;
 	if (mtdLockInfo.start > mtdInfo.size)
 		errmsg_die("%#x is beyond device size %#x",
 			mtdLockInfo.start, mtdInfo.size);
 
-	if (argc > 3) {
-		count = strtol(argv[3], NULL, 0);
+	if (count_s) {
+		count = strtol(count_s, NULL, 0);
 		if (count == -1)
 			mtdLockInfo.length = mtdInfo.size;
 		else
-- 
2.5.0.457.gab17608
