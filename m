Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coqu2-00029S-AF
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 12:22:44 +0000
Received: by mail-wm0-x244.google.com with SMTP id x124so3015357wmf.3
 for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2017 05:22:21 -0700 (PDT)
Subject: Re: [PATCH v3 5/8] nand: spi: Add bad block support
To: Peter Pan <peterpandong@micron.com>, boris.brezillon@free-electrons.com,
 richard@nod.at, computersforpeace@gmail.com,
 thomas.petazzoni@free-electrons.com, linux-mtd@lists.infradead.org
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-6-git-send-email-peterpandong@micron.com>
Cc: peterpansjtu@gmail.com, linshunquan1@hisilicon.com
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Message-ID: <911b755d-87a1-26c1-8b75-84383b7c0076@gmail.com>
Date: Fri, 17 Mar 2017 13:22:17 +0100
MIME-Version: 1.0
In-Reply-To: <1489646857-10112-6-git-send-email-peterpandong@micron.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 16/03/2017 07:47, Peter Pan wrote:
> [...]
> +
> +/*
> + * spinand_scan_bbt - scan BBT in SPI NAND device
> + * @chip: SPI NAND device structure
> + */
> +static int spinand_scan_bbt(struct spinand_device *chip)
> +{
> +	struct nand_device *nand = &chip->base;
> +	int ret;
> +
> +	nand->bbt.options |= NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
> +	nand->bbt.td = NULL;
> +	nand->bbt.md = NULL;
> +
> +	ret = spinand_create_badblock_pattern(chip);
> +	if (ret)
> +		return ret;
> +
> +	return nand_scan_bbt(nand);
> +}
> +

Boris, Peter,

I'm not a big fan of NAND_BBT_USE_FLASH for small capacity nand flash 
(eg. 1Gb with 1024 blocks, where a complete bad block scan on boot is 
fast enough).
Do you consider NAND_BBT_USE_FLASH as mandatory, or does a optional 
"of_get_nand_on_flash_bbt(dn))" device tree configuration is something 
possible ?

Regards,
Arnaud

> +/*
>    * spinand_manufacturer_detect - detect SPI NAND device by each manufacturer
>    * @chip: SPI NAND device structure
>    * @raw_id: raw id buffer. raw id is read by spinand_read_id(), should be
> @@ -1120,6 +1394,7 @@ int spinand_init(struct spinand_device *chip)
>   		return -ENOMEM;
>   
>   	chip->oobbuf = chip->buf + nand_page_size(nand);
> +	nand->ops = &spinand_ops;
>   	mtd->name = chip->name;
>   	mtd->size = nand_size(nand);
>   	mtd->erasesize = nand_eraseblock_size(nand);
> @@ -1137,11 +1412,14 @@ int spinand_init(struct spinand_device *chip)
>   	if (ret < 0)
>   		ret = 0;
>   	mtd->oobavail = ret;
> -	mtd->_erase = spinand_erase;
> +	mtd->_erase = spinand_erase_skip_bbt;
>   	mtd->_read = spinand_read;
>   	mtd->_write = spinand_write;
>   	mtd->_read_oob = spinand_read_oob;
>   	mtd->_write_oob = spinand_write_oob;
> +	mtd->_block_isbad = spinand_block_isbad;
> +	mtd->_block_markbad = spinand_block_markbad;
> +	mtd->_block_isreserved = spinand_block_isreserved;
>   
>   	if (!mtd->bitflip_threshold)
>   		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3,
> @@ -1149,7 +1427,8 @@ int spinand_init(struct spinand_device *chip)
>   	/* After power up, all blocks are locked, so unlock it here. */
>   	spinand_lock_block(chip, BL_ALL_UNLOCKED);
>   
> -	return 0;
> +	/* Build bad block table */
> +	return spinand_scan_bbt(chip);
>   }
