Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWXfV-00044D-1v
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 22:35:13 +0000
Received: by pabzx8 with SMTP id zx8so152932203pab.1
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2015 15:34:52 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH mtd-utils 09/11] flash_{un,
 }lock: improve strtol() error handling
Date: Mon, 31 Aug 2015 15:34:30 -0700
Message-Id: <1441060472-82169-10-git-send-email-computersforpeace@gmail.com>
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

Use the simple_* helpers to improve error checking.

Also fixup brace style at the same time.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 flash_unlock.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/flash_unlock.c b/flash_unlock.c
index 644360548601..7a7a773d1d76 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -147,8 +147,8 @@ int main(int argc, char *argv[])
 	int fd, request;
 	struct mtd_info_user mtdInfo;
 	struct erase_info_user mtdLockInfo;
-	int count;
-	int ret;
+	long count;
+	int ret = 0;
 
 	process_args(argc, argv);
 
@@ -161,22 +161,28 @@ int main(int argc, char *argv[])
 		sys_errmsg_die("could not get mtd info: %s", dev);
 
 	/* Make sure user options are valid */
-	if (offs_s)
-		mtdLockInfo.start = strtol(offs_s, NULL, 0);
-	else
+	if (offs_s) {
+		mtdLockInfo.start = simple_strtol(offs_s, &ret);
+		if (ret)
+			errmsg_die("bad offset");
+	} else {
 		mtdLockInfo.start = 0;
+	}
 	if (mtdLockInfo.start > mtdInfo.size)
 		errmsg_die("%#x is beyond device size %#x",
 			mtdLockInfo.start, mtdInfo.size);
 
 	if (count_s) {
-		count = strtol(count_s, NULL, 0);
+		count = simple_strtol(count_s, &ret);
+		if (ret)
+			errmsg_die("bad count");
 		if (count == -1)
 			mtdLockInfo.length = mtdInfo.size;
 		else
 			mtdLockInfo.length = mtdInfo.erasesize * count;
-	} else
+	} else {
 		mtdLockInfo.length = mtdInfo.size;
+	}
 	if (mtdLockInfo.start + mtdLockInfo.length > mtdInfo.size)
 		errmsg_die("range is more than device supports: %#x + %#x > %#x",
 			mtdLockInfo.start, mtdLockInfo.length, mtdInfo.size);
-- 
2.5.0.457.gab17608
