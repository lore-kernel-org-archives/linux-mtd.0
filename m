Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zylmp-0007mL-WF
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 19:19:29 +0000
Received: by wmdw130 with SMTP id w130so169214921wmd.0
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2015 11:19:06 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 3/3] mtd: spi-nor: fix error handling in spi_nor_erase
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
Message-ID: <564B7D9E.4070901@gmail.com>
Date: Tue, 17 Nov 2015 20:18:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The documenting comment of mtd_erase in mtdcore.c states:
Device drivers are supposed to call instr->callback() whenever
the operation completes, even if it completes with a failure.

Currently the callback isn't called in case of failure. Fix this.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 4988390..b4d6e93 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -387,17 +387,13 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 	write_disable(nor);
 
+erase_err:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_ERASE);
 
-	instr->state = MTD_ERASE_DONE;
+	instr->state = ret ? MTD_ERASE_FAILED : MTD_ERASE_DONE;
 	mtd_erase_callback(instr);
 
 	return ret;
-
-erase_err:
-	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_ERASE);
-	instr->state = MTD_ERASE_FAILED;
-	return ret;
 }
 
 static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
-- 
2.6.2
