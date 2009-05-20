Received: from mail.atmel.fr ([81.80.104.162] helo=atmel-es2.atmel.fr)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6naF-0007f9-3s
	for linux-mtd@lists.infradead.org; Wed, 20 May 2009 15:20:02 +0000
Message-ID: <4A141F81.8070104@atmel.com>
Date: Wed, 20 May 2009 17:19:29 +0200
From: Nicolas Ferre <nicolas.ferre@atmel.com>
MIME-Version: 1.0
To: David Brownell <david-b@pacbell.net>,
	Troy Kisky <troy.kisky@boundarydevices.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/5] mtd: nand: atmel: use default ecc layout
References: <>
	<1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
	<1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
	<200905132212.11923.david-b@pacbell.net>
In-Reply-To: <200905132212.11923.david-b@pacbell.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I would like to bring my 2cents to the discussion so, let me comment simultaneously on:
[PATCH 1/5] mtd: nand: move layout structure into nand_ecc_ctrl
[PATCH 3/5] mtd: nand: atmel: use default ecc layout

First of all I did not manage to compile without this additional line in atmel_nand.c (which is not in original patch):

--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -329,7 +303,7 @@ static int atmel_nand_calculate(struct m
 {
 	struct nand_chip *nand_chip = mtd->priv;
 	struct atmel_nand_host *host = nand_chip->priv;
-	uint32_t *eccpos = nand_chip->ecc.layout->eccpos;
+	uint32_t *eccpos = nand_chip->ecc.layout.eccpos;
 	unsigned int ecc_value;
 
 	/* get the first 2 ECC bytes */


Here is the log that I have running with this patch:
"
NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB 3,3V 8-bit)
AT91 NAND: 8-bit, Software ECC
nand_scan_tail ecc.total = 24, ecc.steps = 8, ecc.bytes = 3, ecc.size = 256, writesize = 2048
nand_scan_tail oobfree[0].offset=2, .length=38
Scanning device for bad blocks
Bad eraseblock 881 at 0x06e20000
Creating 3 MTD partitions on "atmel_nand":
0x00000000-0x00400000 : "Bootstrap"
0x00400000-0x04000000 : "Partition 1"
0x04000000-0x10000000 : "Partition 2"
"

All seems ok.

So, with the above line replaced, I would like to add to both patches:

[nicolas.ferre@atmel.com: tested on large page nand sw ECC]
Tested-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Regards,
-- 
Nicolas Ferre
