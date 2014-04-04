Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WW2Zv-00071F-1Z
 for linux-mtd@lists.infradead.org; Fri, 04 Apr 2014 11:46:35 +0000
From: Gerhard Sittig <gsi@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/3] mtd: nand: comment update,
 the DEPLETE1 command has gone
Date: Fri,  4 Apr 2014 13:45:46 +0200
Message-Id: <1396611948-4523-2-git-send-email-gsi@denx.de>
In-Reply-To: <1396611948-4523-1-git-send-email-gsi@denx.de>
References: <1396611948-4523-1-git-send-email-gsi@denx.de>
Cc: Alexander Shiyan <shc_work@mail.ru>, David Mosberger <davidm@egauge.net>,
 Gerhard Sittig <gsi@denx.de>, Pekon Gupta <pekon@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
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
changes in v2: none

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
