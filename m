Received: from nbd.name ([2a01:4f8:131:30e2::2])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJbFX-00028g-VV
 for linux-mtd@lists.infradead.org; Wed, 21 Dec 2016 07:23:45 +0000
From: John Crispin <john@phrozen.org>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Larry D. Pinney" <ldpinney@gmail.com>, John Crispin <john@phrozen.org>
Subject: [PATCH V2 3/3] mtd: spi-nor: add support for ESMT_f25l32qa and
 ESMT_f25l64qa
Date: Wed, 21 Dec 2016 08:23:10 +0100
Message-Id: <1482304990-23942-4-git-send-email-john@phrozen.org>
In-Reply-To: <1482304990-23942-1-git-send-email-john@phrozen.org>
References: <1482304990-23942-1-git-send-email-john@phrozen.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Larry D. Pinney" <ldpinney@gmail.com>

Add Support for the ESMT_F25L32QA and ESMT_F25L64QA
These are 4MB and 8MB SPI NOR Chips from Elite Semiconductor Memory
Technology

Acked-by: Marek Vasut <marex@denx.de>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Larry D. Pinney <ldpinney@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index bfff159..2b150b5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -821,6 +821,8 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 	/* ESMT */
 	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K) },
+	{ "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64, SECT_4K) },
+	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128, SECT_4K) },
 
 	/* Everspin */
 	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-- 
1.7.10.4
