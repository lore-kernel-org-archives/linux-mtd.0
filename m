Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QasAw-0006aH-D3
	for linux-mtd@lists.infradead.org; Sun, 26 Jun 2011 16:27:11 +0000
Received: by wwf22 with SMTP id 22so2949753wwf.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 09:27:05 -0700 (PDT)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/6] nand_wait_ready timeout fix
Date: Sun, 26 Jun 2011 18:26:51 +0200
Message-Id: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_wait_ready timeout should not assume HZ=1000.
Make it independent of HZ value.

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a46e9bb..a3c7fd3 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -512,7 +512,7 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
 void nand_wait_ready(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
-	unsigned long timeo = jiffies + 2;
+	unsigned long timeo = jiffies + (2 * HZ) / 1000;
 
 	/* 400ms timeout */
 	if (in_interrupt() || oops_in_progress)
-- 
1.7.5.4
