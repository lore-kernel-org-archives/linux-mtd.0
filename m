Received: from fed1rmmtao101.cox.net ([68.230.241.45])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6qWV-0003xt-Hq
	for linux-mtd@lists.infradead.org; Wed, 20 May 2009 18:28:22 +0000
Message-ID: <4A144BB9.5020805@boundarydevices.com>
Date: Wed, 20 May 2009 11:28:09 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 3/5] mtd: nand: atmel: use default ecc layout
References: <>
	<1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
	<1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
	<200905132212.11923.david-b@pacbell.net>
	<4A141F81.8070104@atmel.com>
In-Reply-To: <4A141F81.8070104@atmel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: David Brownell <david-b@pacbell.net>,
	Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Ferre wrote:
> Hi,
> 
> I would like to bring my 2cents to the discussion so, let me comment simultaneously on:
> [PATCH 1/5] mtd: nand: move layout structure into nand_ecc_ctrl
> [PATCH 3/5] mtd: nand: atmel: use default ecc layout
> 
> First of all I did not manage to compile without this additional line in atmel_nand.c (which is not in original patch):
> 
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -329,7 +303,7 @@ static int atmel_nand_calculate(struct m
>  {
>  	struct nand_chip *nand_chip = mtd->priv;
>  	struct atmel_nand_host *host = nand_chip->priv;
> -	uint32_t *eccpos = nand_chip->ecc.layout->eccpos;
> +	uint32_t *eccpos = nand_chip->ecc.layout.eccpos;
>  	unsigned int ecc_value;
>  
>  	/* get the first 2 ECC bytes */
> 

My patch set is on top of Linux 2.6.30-rc5.

>From 1/3
@@ -188,7 +188,6 @@ static int atmel_nand_calculate(struct mtd_info *mtd,
 {
 	struct nand_chip *nand_chip = mtd->priv;
 	struct atmel_nand_host *host = nand_chip->priv;
-	uint32_t *eccpos = nand_chip->ecc.layout->eccpos;
 	unsigned int ecc_value;

 	/* get the first 2 ECC bytes */

Which is the same subroutine as your change, but a strange difference in line
numbers. Which makes me think you have changes in this file as well.


> 
> Here is the log that I have running with this patch:
> "
> NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB 3,3V 8-bit)
> AT91 NAND: 8-bit, Software ECC
> nand_scan_tail ecc.total = 24, ecc.steps = 8, ecc.bytes = 3, ecc.size = 256, writesize = 2048
> nand_scan_tail oobfree[0].offset=2, .length=38
> Scanning device for bad blocks
> Bad eraseblock 881 at 0x06e20000
> Creating 3 MTD partitions on "atmel_nand":
> 0x00000000-0x00400000 : "Bootstrap"
> 0x00400000-0x04000000 : "Partition 1"
> 0x04000000-0x10000000 : "Partition 2"
> "
> 
> All seems ok.
> 
> So, with the above line replaced, I would like to add to both patches:
> 
> [nicolas.ferre@atmel.com: tested on large page nand sw ECC]
> Tested-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> 
> Regards,


Thanks for testing. I appreciate it.


Troy
