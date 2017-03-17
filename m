Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coozv-0001hk-Id
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 10:20:41 +0000
Received: by mail-wr0-x243.google.com with SMTP id g10so8984159wrg.0
 for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2017 03:20:18 -0700 (PDT)
Subject: Re: [PATCH v3 3/8] nand: spi: add basic blocks for infrastructure
To: Peter Pan <peterpandong@micron.com>, boris.brezillon@free-electrons.com,
 richard@nod.at, computersforpeace@gmail.com,
 thomas.petazzoni@free-electrons.com, linux-mtd@lists.infradead.org
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-4-git-send-email-peterpandong@micron.com>
Cc: peterpansjtu@gmail.com, linshunquan1@hisilicon.com
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Message-ID: <43bedbd0-0a0c-e30d-2158-fcf7c936480d@gmail.com>
Date: Fri, 17 Mar 2017 11:20:14 +0100
MIME-Version: 1.0
In-Reply-To: <1489646857-10112-4-git-send-email-peterpandong@micron.com>
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

[...]
> +/*
> + * spinand_detect - [SPI NAND Interface] detect the SPI NAND device
> + * @chip: SPI NAND device structure
> + */
> +int spinand_detect(struct spinand_device *chip)
> +{
> +	struct nand_device *nand = &chip->base;
> +	u8 raw_id[SPINAND_MAX_ID_LEN] = {0};
> +	u8 id[SPINAND_MAX_ID_LEN] = {0};
> +	int ret;
> +
> +	spinand_reset(chip);
> +	spinand_read_id(chip, raw_id);
> +	ret = spinand_manufacturer_detect(chip, raw_id, id);
> +	if (ret)

Would be great to return an error or warning message when the raw_id 
doesn't match any known manufacturer, or when the manufacturer doesn't 
know about this device.
something like:

     pr_err("SPI NAND: unknown raw ID %*phN\n", SPINAND_MAX_ID_LEN, raw_id);

> +		return ret;
> +
> +	spinand_fill_id(chip, id);
> +
> +	pr_info("SPI NAND: %s is found.\n", chip->name);
> +	pr_info("Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
> +		spinand_get_mfr_id(chip), spinand_get_dev_id(chip));
> +	pr_info("%d MiB, block size: %d KiB, page size: %d, OOB size: %d\n",
> +		(int)(nand_size(nand) >> 20), nand_eraseblock_size(nand) >> 10,
> +		nand_page_size(nand), nand_per_page_oobsize(nand));
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(spinand_detect);
> +
