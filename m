Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LK5Co-0006Hd-GU
	for linux-mtd@lists.infradead.org; Tue, 06 Jan 2009 06:14:22 +0000
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id n066EDmF001240
	for <linux-mtd@lists.infradead.org>; Tue, 6 Jan 2009 00:14:18 -0600
Message-ID: <32911.192.168.10.88.1231222450.squirrel@dbdmail.itg.ti.com>
In-Reply-To: <57799.192.168.10.89.1229076658.squirrel@dbdmail.itg.ti.com>
References: <57799.192.168.10.89.1229076658.squirrel@dbdmail.itg.ti.com>
Date: Tue, 6 Jan 2009 11:44:10 +0530 (IST)
Subject: Re: [PATCH] [MTD] [NAND] nand_base.c: Allowing core driver to
	choose      ECC block size for SW ECC scheme.
From: "vimal singh" <vimalsingh@ti.com>
To: "vimal singh" <vimalsingh@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is this patch was missed? This will add flexibility to generic nand driver to
choose ecc size. As, nand driver supports 256 and 512 byte software ecc's.

---
vimal

> This patch allows core driver to choose ECC block size in sw ecc case.
>
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
> Current nand driver supports 256 and 512 byte software ecc.
> This patch provides driver the flexibility to choose ecc size.
> '256' bytes will be used by default if not provided by core driver.
>
> --- a/drivers/mtd/nand/nand_base.c	2008-12-12 14:26:30.050002000 +0530
> +++ b/drivers/mtd/nand/nand_base.c	2008-12-12 14:27:05.330000000 +0530
> @@ -2622,7 +2622,8 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		chip->ecc.write_page = nand_write_page_swecc;
>  		chip->ecc.read_oob = nand_read_oob_std;
>  		chip->ecc.write_oob = nand_write_oob_std;
> -		chip->ecc.size = 256;
> +		if (!chip->ecc.size)
> +			chip->ecc.size = 256;
>  		chip->ecc.bytes = 3;
>  		break;
>
>
>
