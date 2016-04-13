Received: from mail-lf0-x235.google.com ([2a00:1450:4010:c07::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqJb9-0002QW-Jx
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 12:08:47 +0000
Received: by mail-lf0-x235.google.com with SMTP id c126so66459048lfb.2
 for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2016 05:08:23 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/9] mtd: nand: au1550nd: set ECC algorithm explicitly
Date: Wed, 13 Apr 2016 14:06:57 +0200
Message-Id: <1460549222-24198-5-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460549222-24198-1-git-send-email-zajec5@gmail.com>
References: <1460549222-24198-1-git-send-email-zajec5@gmail.com>
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
 drivers/mtd/nand/au1550nd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index 341ea49..9bf6d99 100644
--- a/drivers/mtd/nand/au1550nd.c
+++ b/drivers/mtd/nand/au1550nd.c
@@ -459,6 +459,7 @@ static int au1550nd_probe(struct platform_device *pdev)
 	/* 30 us command delay time */
 	this->chip_delay = 30;
 	this->ecc.mode = NAND_ECC_SOFT;
+	this->ecc.algo = NAND_ECC_HAMMING;
 
 	if (pd->devwidth)
 		this->options |= NAND_BUSWIDTH_16;
-- 
1.8.4.5
