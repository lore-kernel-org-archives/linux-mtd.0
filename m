Received: from mail-lb0-x234.google.com ([2a00:1450:4010:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiVCf-00028i-US
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2016 22:55:11 +0000
Received: by mail-lb0-x234.google.com with SMTP id oe12so175249541lbc.0
 for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2016 15:54:49 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 3/3] mtd: nand: nandsim: set ECC algorithm explicitly
Date: Tue, 22 Mar 2016 23:54:14 +0100
Message-Id: <1458687254-26181-4-git-send-email-zajec5@gmail.com>
In-Reply-To: <1458687254-26181-1-git-send-email-zajec5@gmail.com>
References: <1458687254-26181-1-git-send-email-zajec5@gmail.com>
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

This follows recent work on switching to enum nand_ecc_algo and
deprecating NAND_ECC_SOFT_BCH.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/nandsim.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 1fd5195..6ff1d8d 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2261,6 +2261,7 @@ static int __init ns_init_module(void)
 	chip->read_buf   = ns_nand_read_buf;
 	chip->read_word  = ns_nand_read_word;
 	chip->ecc.mode   = NAND_ECC_SOFT;
+	chip->ecc.algo   = NAND_ECC_HAMMING;
 	/* The NAND_SKIP_BBTSCAN option is necessary for 'overridesize' */
 	/* and 'badblocks' parameters to work */
 	chip->options   |= NAND_SKIP_BBTSCAN;
@@ -2339,6 +2340,7 @@ static int __init ns_init_module(void)
 			goto error;
 		}
 		chip->ecc.mode = NAND_ECC_SOFT_BCH;
+		chip->ecc.algo = NAND_ECC_BCH;
 		chip->ecc.size = 512;
 		chip->ecc.strength = bch;
 		chip->ecc.bytes = eccbytes;
-- 
1.8.4.5
