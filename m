Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d0E7e-0004KF-0E
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 21:23:48 +0000
Date: Mon, 17 Apr 2017 23:23:14 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@atmel.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v5 3/6] nand: spi: Add bad block support
Message-ID: <20170417232314.3e9b481d@bbrezillon>
In-Reply-To: <1491810713-27795-4-git-send-email-peterpandong@micron.com>
References: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
 <1491810713-27795-4-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 10 Apr 2017 15:51:50 +0800
Peter Pan <peterpandong@micron.com> wrote:

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
> +	/*
> +	 * It's better to put BBT marker in-band, since some oob area
> +	 * is not ecc protected by internal(on-die) ECC
> +	 */
> +	if (nand->bbt.options & NAND_BBT_USE_FLASH)
> +		nand->bbt.options |= NAND_BBT_NO_OOB;

Hm, really? Do we want to force NAND_BBT_NO_OOB for everyone?

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

[...]
  
>  /*
> @@ -1085,13 +1383,14 @@ static int spinand_init(struct spinand_device *chip)
>  				 GFP_KERNEL);
>  	if (!chip->buf) {
>  		ret = -ENOMEM;
> -		goto err;
> +		goto err1;
>  	}
>  
>  	chip->oobbuf = chip->buf + nand_page_size(nand);
>  
>  	spinand_manufacturer_init(chip);
>  
> +	nand->ops = &spinand_ops;
>  	mtd->name = chip->name;
>  	mtd->size = nand_size(nand);
>  	mtd->erasesize = nand_eraseblock_size(nand);
> @@ -1109,11 +1408,14 @@ static int spinand_init(struct spinand_device *chip)
>  	if (ret < 0)
>  		ret = 0;
>  	mtd->oobavail = ret;
> -	mtd->_erase = spinand_erase;
> +	mtd->_erase = spinand_erase_skip_bbt;
>  	mtd->_read = spinand_read;
>  	mtd->_write = spinand_write;
>  	mtd->_read_oob = spinand_read_oob;
>  	mtd->_write_oob = spinand_write_oob;
> +	mtd->_block_isbad = spinand_block_isbad;
> +	mtd->_block_markbad = spinand_block_markbad;
> +	mtd->_block_isreserved = spinand_block_isreserved;
>  
>  	if (!mtd->bitflip_threshold)
>  		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3,
> @@ -1121,9 +1423,18 @@ static int spinand_init(struct spinand_device *chip)
>  	/* After power up, all blocks are locked, so unlock it here. */
>  	spinand_lock_block(chip, BL_ALL_UNLOCKED);
>  
> +	/* Build bad block table */
> +	ret = spinand_scan_bbt(chip);
> +	if (ret) {
> +		dev_err(chip->dev, "Scan Bad Block Table failed.\n");
> +		goto err2;
> +	}
> +
>  	return nand_register(nand);
>  
> -err:
> +err2:

General note: please use better descriptions for your labels, like
err_free_buf

> +	devm_kfree(chip->dev, chip->buf);

This is not needed (automatically released).

> +err1:
>  	return ret;
>  }
>  
> @@ -1191,10 +1502,14 @@ int spinand_register(struct spinand_device *chip)
>  int spinand_unregister(struct spinand_device *chip)
>  {
>  	struct nand_device *nand = &chip->base;
> +	struct nand_bbt_descr *bd = nand->bbt.bbp;
>  
>  	nand_unregister(nand);
>  	spinand_manufacturer_cleanup(chip);
>  	devm_kfree(chip->dev, chip->buf);
> +	kfree(nand->bbt.bbt);
> +	if (bd->options & NAND_BBT_DYNAMICSTRUCT)
> +		devm_kfree(chip->dev, bd);

Ditto.

>  
>  	return 0;
>  }
