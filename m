Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tbacr-0008VD-Ei
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 17:31:46 +0000
Received: by mail-bk0-f49.google.com with SMTP id jm19so2316055bkc.36
 for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2012 09:31:42 -0800 (PST)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nand_wait_ready timeout fix
Date: Thu, 22 Nov 2012 18:31:28 +0100
Message-Id: <1353605488-29438-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_wait_ready timeout should not assume HZ=100.
Make it independent of HZ value by using msecs_to_jiffies.

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 1a03b7f..16e95e7 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -492,7 +492,7 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
 void nand_wait_ready(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
-	unsigned long timeo = jiffies + 2;
+	unsigned long timeo = jiffies + msecs_to_jiffies(20);
 
 	/* 400ms timeout */
 	if (in_interrupt() || oops_in_progress)
-- 
1.7.10.4
