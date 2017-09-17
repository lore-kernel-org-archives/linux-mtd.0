Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dtWKx-0008J8-9F
 for linux-mtd@lists.infradead.org; Sun, 17 Sep 2017 09:58:06 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: spi-nor: Check for spi_nor_hwcaps_read2cmd() return value
Date: Sun, 17 Sep 2017 11:57:50 +0200
Message-Id: <20170917095750.14059-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function can return a negativ value in case of errors,
don't use it blindly as array index.

Detected by CoverityScan CID#1418067 ("Memory - illegal accesses")
Fixes: f384b352cbf0 ("mtd: spi-nor: parse Serial Flash Discoverable
Parameters (SFDP) tables")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/spi-nor/spi-nor.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index cf1d4a15e10a..d71765739a93 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2145,6 +2145,9 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 
 		params->hwcaps.mask |= rd->hwcaps;
 		cmd = spi_nor_hwcaps_read2cmd(rd->hwcaps);
+		if (cmd < 0)
+			return -EINVAL;
+
 		read = &params->reads[cmd];
 		half = bfpt.dwords[rd->settings_dword] >> rd->settings_shift;
 		spi_nor_set_read_settings_from_bfpt(read, half, rd->proto);
-- 
2.13.5
