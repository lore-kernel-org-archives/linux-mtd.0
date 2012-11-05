Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TVN5u-0008KS-0l
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2012 13:52:04 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so1936060bkw.36
 for <linux-mtd@lists.infradead.org>; Mon, 05 Nov 2012 05:51:59 -0800 (PST)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nand_wait_ready timeout fix
Date: Mon,  5 Nov 2012 14:51:51 +0100
Message-Id: <1352123511-31538-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_wait_ready timeout should not assume HZ=1000.
Make it independent of HZ value like it is done in nand_wait.

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d5ece6e..ee49fe2 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -492,7 +492,7 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
 void nand_wait_ready(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
-	unsigned long timeo = jiffies + 2;
+	unsigned long timeo = jiffies + (2 * HZ) / 1000;
 
 	/* 400ms timeout */
 	if (in_interrupt() || oops_in_progress)
-- 
1.7.10.4
