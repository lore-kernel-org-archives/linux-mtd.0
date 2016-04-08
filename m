Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoTai-00015a-Va
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 10:24:42 +0000
Received: by mail-lb0-x233.google.com with SMTP id u8so66608274lbk.0
 for <linux-mtd@lists.infradead.org>; Fri, 08 Apr 2016 03:24:20 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/8] mtd: nand: orion: set ECC algorithm explicitly
Date: Fri,  8 Apr 2016 12:23:48 +0200
Message-Id: <1460111031-8706-6-git-send-email-zajec5@gmail.com>
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
 drivers/mtd/nand/orion_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index d4614bf..40a7c4a 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -130,6 +130,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	nc->cmd_ctrl = orion_nand_cmd_ctrl;
 	nc->read_buf = orion_nand_read_buf;
 	nc->ecc.mode = NAND_ECC_SOFT;
+	nc->ecc.algo = NAND_ECC_HAMMING;
 
 	if (board->chip_delay)
 		nc->chip_delay = board->chip_delay;
-- 
1.8.4.5
