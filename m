Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctVFd-0003og-PW
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 08:16:15 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 33/37] mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
Date: Thu, 30 Mar 2017 17:15:04 +0900
Message-Id: <1490861708-27813-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some NAND controllers are using DMA engine requiring a specific
buffer alignment.  The core provides no guarantee on the nand_buffers
pointers, which forces some drivers to allocate their own buffers
and pass the NAND_OWN_BUFFERS flag.

Rework the nand_buffers allocation logic to allocate each buffer
independently.  This should make most NAND controllers/DMA engine
happy, and allow us to get rid of these custom buf allocation in
NAND controller drivers.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3:
  - Reword git-log

Changes in v2:
  - Newly added

 drivers/mtd/nand/nand_base.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f828ad7..e9d3195 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4613,13 +4613,25 @@ int nand_scan_tail(struct mtd_info *mtd)
 	}
 
 	if (!(chip->options & NAND_OWN_BUFFERS)) {
-		nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
-				+ mtd->oobsize * 3, GFP_KERNEL);
+		nbuf = kzalloc(sizeof(*nbuf), GFP_KERNEL);
 		if (!nbuf)
 			return -ENOMEM;
-		nbuf->ecccalc = (uint8_t *)(nbuf + 1);
-		nbuf->ecccode = nbuf->ecccalc + mtd->oobsize;
-		nbuf->databuf = nbuf->ecccode + mtd->oobsize;
+		nbuf->ecccalc = kmalloc(mtd->oobsize, GFP_KERNEL);
+		if (!nbuf->ecccalc) {
+			ret = -EINVAL;
+			goto err_free;
+		}
+		nbuf->ecccode = kmalloc(mtd->oobsize, GFP_KERNEL);
+		if (!nbuf->ecccode) {
+			ret = -EINVAL;
+			goto err_free;
+		}
+		nbuf->databuf = kmalloc(mtd->writesize + mtd->oobsize,
+					GFP_KERNEL);
+		if (!nbuf->databuf) {
+			ret = -EINVAL;
+			goto err_free;
+		}
 
 		chip->buffers = nbuf;
 	} else {
@@ -4862,8 +4874,12 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* Build bad block table */
 	return chip->scan_bbt(mtd);
 err_free:
-	if (!(chip->options & NAND_OWN_BUFFERS))
+	if (!(chip->options & NAND_OWN_BUFFERS)) {
+		kfree(chip->buffers->databuf);
+		kfree(chip->buffers->ecccode);
+		kfree(chip->buffers->ecccalc);
 		kfree(chip->buffers);
+	}
 	return ret;
 }
 EXPORT_SYMBOL(nand_scan_tail);
@@ -4914,8 +4930,12 @@ void nand_cleanup(struct nand_chip *chip)
 
 	/* Free bad block table memory */
 	kfree(chip->bbt);
-	if (!(chip->options & NAND_OWN_BUFFERS))
+	if (!(chip->options & NAND_OWN_BUFFERS)) {
+		kfree(chip->buffers->databuf);
+		kfree(chip->buffers->ecccode);
+		kfree(chip->buffers->ecccalc);
 		kfree(chip->buffers);
+	}
 
 	/* Free bad block descriptor memory */
 	if (chip->badblock_pattern && chip->badblock_pattern->options
-- 
2.7.4
