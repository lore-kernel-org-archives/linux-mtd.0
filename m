Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWXfN-00042M-FQ
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 22:35:05 +0000
Received: by pacgr6 with SMTP id gr6so2104360pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2015 15:34:44 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH mtd-utils 01/11] flash_{un,
 }lock: nest optional parameters in help message
Date: Mon, 31 Aug 2015 15:34:22 -0700
Message-Id: <1441060472-82169-2-git-send-email-computersforpeace@gmail.com>
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

block count should be nested within the optional offset listing. That
is, we require offset before we accept a block count.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 flash_unlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/flash_unlock.c b/flash_unlock.c
index 1cc8c2ff2d9b..ee8ac890f61c 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -28,7 +28,7 @@
 static void usage(int status)
 {
 	fprintf(status ? stderr : stdout,
-		"Usage: %s <mtd device> [offset] [block count]\n\n"
+		"Usage: %s <mtd device> [offset [block count]]\n\n"
 		"If offset is not specified, it defaults to 0.\n"
 		"If block count is not specified, it defaults to all blocks.\n",
 		PROGRAM_NAME);
-- 
2.5.0.457.gab17608
