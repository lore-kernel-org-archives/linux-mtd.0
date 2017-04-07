Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwNzU-0000ZS-Vv
 for linux-mtd@lists.infradead.org; Fri, 07 Apr 2017 07:07:31 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] fixup! mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
Date: Fri,  7 Apr 2017 16:06:38 +0900
Message-Id: <1491548798-28051-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---

Bug port: http://patchwork.ozlabs.org/patch/745136/
Please squash into commit f6614d1b.
(Currently, only once patch on top of that.)
If impossible, I can re-send this with detailed log.


 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8a2e5ff..903a678 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4936,7 +4936,7 @@ void nand_cleanup(struct nand_chip *chip)
 
 	/* Free bad block table memory */
 	kfree(chip->bbt);
-	if (!(chip->options & NAND_OWN_BUFFERS)) {
+	if (!(chip->options & NAND_OWN_BUFFERS) && !chip->buffers) {
 		kfree(chip->buffers->databuf);
 		kfree(chip->buffers->ecccode);
 		kfree(chip->buffers->ecccalc);
-- 
2.7.4
