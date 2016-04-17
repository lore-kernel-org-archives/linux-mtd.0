Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arthL-000722-Q7
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2016 20:53:40 +0000
Received: by mail-lf0-x233.google.com with SMTP id j11so196469225lfb.1
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2016 13:53:19 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V3 01/11] mtd: nand: bf5xx: set ECC algorithm explicitly
Date: Sun, 17 Apr 2016 22:52:57 +0200
Message-Id: <1460926387-9563-2-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460926387-9563-1-git-send-email-zajec5@gmail.com>
References: <1460913104-27388-1-git-send-email-zajec5@gmail.com>
 <1460926387-9563-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is part of process deprecating NAND_ECC_SOFT_BCH (and switching to
enum nand_ecc_algo).

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/bf5xx_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index b38f414..37da423 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -817,6 +817,7 @@ static int bf5xx_nand_probe(struct platform_device *pdev)
 		chip->ecc.write_page_raw = bf5xx_nand_write_page_raw;
 	} else {
 		chip->ecc.mode	    = NAND_ECC_SOFT;
+		chip->ecc.algo	= NAND_ECC_HAMMING;
 	}
 
 	/* scan hardware nand chip and setup mtd info data struct */
-- 
1.8.4.5
