Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTtRR-0007Yn-1k
 for linux-mtd@lists.infradead.org; Sat, 29 Mar 2014 13:36:58 +0000
From: Gerhard Sittig <gsi@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v1 1/3] mtd: nand: comment update,
 the DEPLETE1 command has gone
Date: Sat, 29 Mar 2014 14:36:22 +0100
Message-Id: <1396100184-7110-2-git-send-email-gsi@denx.de>
In-Reply-To: <1396100184-7110-1-git-send-email-gsi@denx.de>
References: <1396100184-7110-1-git-send-email-gsi@denx.de>
Cc: Gerhard Sittig <gsi@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Pekon Gupta <pekon@ti.com>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

update a comment in nand_command_lp() about specific requirements of
individual commands, the DEPLETE1 command was removed in the past and
the comment no longer applied

Signed-off-by: Gerhard Sittig <gsi@denx.de>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9715a7ba164a..567620e81ce2 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -700,7 +700,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 
 	/*
 	 * Program and erase have their own busy handlers status, sequential
-	 * in, and deplete1 need no delay.
+	 * in and status need no delay.
 	 */
 	switch (command) {
 
-- 
1.7.10.4
