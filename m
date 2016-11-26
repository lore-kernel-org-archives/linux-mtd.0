Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhNm-00050t-QW
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:33 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 07/39] mtd: nand: denali: transfer OOB only when oob_required
 is set
Date: Sun, 27 Nov 2016 03:05:53 +0900
Message-Id: <1480183585-592-8-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, the denali_read_page_raw() always transfers the OOB and
copy the data to chip->oob_poi, ignoring the oob_required argument.
Respect the oob_required argument.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index b2b050b..cbc7f75 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1182,7 +1182,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 		BUG();
 	}
 
-	setup_ecc_for_xfer(denali, false, true);
+	setup_ecc_for_xfer(denali, false, oob_required ? true : false);
 	denali_enable_dma(denali, true);
 
 	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
@@ -1198,7 +1198,9 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	denali_enable_dma(denali, false);
 
 	memcpy(buf, denali->buf.buf, mtd->writesize);
-	memcpy(chip->oob_poi, denali->buf.buf + mtd->writesize, mtd->oobsize);
+	if (oob_required)
+		memcpy(chip->oob_poi, denali->buf.buf + mtd->writesize,
+		       mtd->oobsize);
 
 	return 0;
 }
-- 
2.7.4
