Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWXfU-00043s-5M
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 22:35:12 +0000
Received: by paczk9 with SMTP id zk9so4728664pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2015 15:34:51 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH mtd-utils 11/11] flash_{un,}lock: document block count == -1
Date: Mon, 31 Aug 2015 15:34:32 -0700
Message-Id: <1441060472-82169-12-git-send-email-computersforpeace@gmail.com>
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

These utilities have accepted -1 as a block count to mean "all blocks."
Let's document that.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 flash_unlock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/flash_unlock.c b/flash_unlock.c
index d775c0b01950..f51870aeb69f 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -52,7 +52,8 @@ static void usage(int status)
 		" -u         --unlock            Unlock a region of flash\n"
 		"\n"
 		"If offset is not specified, it defaults to 0.\n"
-		"If block count is not specified, it defaults to all blocks.\n",
+		"If block count is not specified, it defaults to all blocks.\n"
+		"A block count of -1 means all blocks.\n",
 		flash_msg[DEFAULT_REQUEST],
 		PROGRAM_NAME);
 	exit(status);
-- 
2.5.0.457.gab17608
