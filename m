Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWXfP-00042x-FH
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 22:35:07 +0000
Received: by paczk9 with SMTP id zk9so4726943pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2015 15:34:46 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH mtd-utils 04/11] flash_{un,}lock: document option flags
Date: Mon, 31 Aug 2015 15:34:25 -0700
Message-Id: <1441060472-82169-5-git-send-email-computersforpeace@gmail.com>
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
 flash_unlock.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/flash_unlock.c b/flash_unlock.c
index 9a24b5f796e0..27e7df1eac3f 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -29,7 +29,12 @@
 static void usage(int status)
 {
 	fprintf(status ? stderr : stdout,
-		"Usage: %s <mtd device> [offset [block count]]\n\n"
+		"Usage: %s [options] [--] <mtd device> [offset [block count]]\n"
+		"\n"
+		"Options:\n"
+		" -h         --help              Display this help and exit\n"
+		"            --version           Display version information and exit\n"
+		"\n"
 		"If offset is not specified, it defaults to 0.\n"
 		"If block count is not specified, it defaults to all blocks.\n",
 		PROGRAM_NAME);
-- 
2.5.0.457.gab17608
