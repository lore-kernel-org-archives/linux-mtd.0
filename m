Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dtaKf-0000UB-Iz
 for linux-mtd@lists.infradead.org; Sun, 17 Sep 2017 14:14:05 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: spi-nor: Kill check with no effect
Date: Sun, 17 Sep 2017 16:13:52 +0200
Message-Id: <20170917141352.23691-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

header.major is of type u8 and cannot be negative.

Detected by CoverityScan CID#1417858 ("Integer handling issues")

Fixes: f384b352cbf0 ("mtd: spi-nor: parse Serial Flash Discoverable
Parameters (SFDP) tables")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
Cyrille,

I'm not sure what exactly you wanted to test.
Maybe it makes sense casting header.major to s8 before checking against < 0?

Thanks,
//richard
---
 drivers/mtd/spi-nor/spi-nor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d71765739a93..4b86decdf13e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2252,8 +2252,7 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 
 	/* Check the SFDP header version. */
 	if (le32_to_cpu(header.signature) != SFDP_SIGNATURE ||
-	    header.major != SFDP_JESD216_MAJOR ||
-	    header.minor < SFDP_JESD216_MINOR)
+	    header.major != SFDP_JESD216_MAJOR)
 		return -EINVAL;
 
 	/*
-- 
2.13.5
