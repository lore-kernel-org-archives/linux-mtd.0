Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoTaZ-00014z-6e
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 10:24:32 +0000
Received: by mail-lb0-x22f.google.com with SMTP id bk9so39403250lbc.3
 for <linux-mtd@lists.infradead.org>; Fri, 08 Apr 2016 03:24:10 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/8] mtd: nand: mxc: set ECC algorithm explicitly
Date: Fri,  8 Apr 2016 12:23:46 +0200
Message-Id: <1460111031-8706-4-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460111031-8706-1-git-send-email-zajec5@gmail.com>
References: <1460111031-8706-1-git-send-email-zajec5@gmail.com>
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
 drivers/mtd/nand/mxc_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 854c832..57b1b74 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1585,6 +1585,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 		this->ecc.mode = NAND_ECC_HW;
 	} else {
 		this->ecc.mode = NAND_ECC_SOFT;
+		this->ecc.algo = NAND_ECC_HAMMING;
 	}
 
 	/* NAND bus width determines access functions used by upper layer */
-- 
1.8.4.5
