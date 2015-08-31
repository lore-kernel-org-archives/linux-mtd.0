Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWXfQ-00043E-LA
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 22:35:09 +0000
Received: by pabzx8 with SMTP id zx8so152930581pab.1
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2015 15:34:47 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH mtd-utils 06/11] flash_{un,
 }lock: move args processing to its own function
Date: Mon, 31 Aug 2015 15:34:27 -0700
Message-Id: <1441060472-82169-7-git-send-email-computersforpeace@gmail.com>
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

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 flash_unlock.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/flash_unlock.c b/flash_unlock.c
index ce72e49d4ba6..67277493d4b3 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -48,13 +48,11 @@ static const struct option long_opts[] = {
 	{ NULL,		0,		0, 0 },
 };
 
-int main(int argc, char *argv[])
+/* Program arguments */
+static const char *dev, *offs_s, *count_s;
+
+static void process_args(int argc, char *argv[])
 {
-	int fd, request;
-	struct mtd_info_user mtdInfo;
-	struct erase_info_user mtdLockInfo;
-	int count;
-	const char *dev, *offs_s, *count_s;
 	int arg_idx;
 
 	for (;;) {
@@ -103,6 +101,17 @@ int main(int argc, char *argv[])
 	else
 		count_s = NULL;
 
+}
+
+int main(int argc, char *argv[])
+{
+	int fd, request;
+	struct mtd_info_user mtdInfo;
+	struct erase_info_user mtdLockInfo;
+	int count;
+
+	process_args(argc, argv);
+
 	/* Get the device info to compare to command line sizes */
 	fd = open(dev, O_RDWR);
 	if (fd < 0)
-- 
2.5.0.457.gab17608
