Received: from mail-lb0-x22d.google.com ([2a00:1450:4010:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoTac-00015C-1X
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 10:24:35 +0000
Received: by mail-lb0-x22d.google.com with SMTP id os9so22360777lbb.2
 for <linux-mtd@lists.infradead.org>; Fri, 08 Apr 2016 03:24:18 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Olof Johansson <olof@lixom.net>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC PA SEMI PWRFICIENT),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/8] mtd: nand: pasemi: set ECC algorithm explicitly
Date: Fri,  8 Apr 2016 12:23:49 +0200
Message-Id: <1460111031-8706-7-git-send-email-zajec5@gmail.com>
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
 drivers/mtd/nand/pasemi_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
index 3ab53ca..63fcb8c 100644
--- a/drivers/mtd/nand/pasemi_nand.c
+++ b/drivers/mtd/nand/pasemi_nand.c
@@ -151,6 +151,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip->write_buf = pasemi_write_buf;
 	chip->chip_delay = 0;
 	chip->ecc.mode = NAND_ECC_SOFT;
+	chip->ecc.algo = NAND_ECC_HAMMING;
 
 	/* Enable the following for a flash based bad block table */
 	chip->bbt_options = NAND_BBT_USE_FLASH;
-- 
1.8.4.5
