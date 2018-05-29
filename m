Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNcKT-0001Dq-17
 for linux-mtd@lists.infradead.org; Tue, 29 May 2018 10:58:27 +0000
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: Re: [PATCH v7 2/5] mtd: nand: Add core infrastructure to support SPI
 NANDs
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Peter Pan <peterpansjtu@gmail.com>, Vignesh R <vigneshr@ti.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Peter Pan <peterpandong@micron.com>
References: <20180515150825.19835-1-boris.brezillon@bootlin.com>
 <20180515150825.19835-3-boris.brezillon@bootlin.com>
Message-ID: <31e7dfaf-a083-e750-feb0-34f5ae930eb3@exceet.de>
Date: Tue, 29 May 2018 12:57:33 +0200
MIME-Version: 1.0
In-Reply-To: <20180515150825.19835-3-boris.brezillon@bootlin.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 15.05.2018 17:08, Boris Brezillon wrote:
> From: Peter Pan <peterpandong@micron.com>
> 
> Add a SPI NAND framework based on the generic NAND framework and the
> spi-mem infrastructure.
> 
> In its current state, this framework supports the following features:
> 
> - single/dual/quad IO modes
> - on-die ECC
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>   drivers/mtd/nand/Kconfig      |    1 +
>   drivers/mtd/nand/Makefile     |    1 +
>   drivers/mtd/nand/spi/Kconfig  |    7 +
>   drivers/mtd/nand/spi/Makefile |    2 +
>   drivers/mtd/nand/spi/core.c   | 1122 +++++++++++++++++++++++++++++++++++++++++
>   include/linux/mtd/spinand.h   |  415 +++++++++++++++
>   include/linux/spi/spi-mem.h   |    4 +-
>   7 files changed, 1551 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/mtd/nand/spi/Kconfig
>   create mode 100644 drivers/mtd/nand/spi/Makefile
>   create mode 100644 drivers/mtd/nand/spi/core.c
>   create mode 100644 include/linux/mtd/spinand.h
> 

[...]

> +
> +/**
> + * spinand_match_and_init() - Try to find a match between a device ID and an
> + *			      entry in a spinand_info table
> + * @spinand: SPI NAND object
> + * @table: SPI NAND device description table
> + * @table_size: size of the device description table
> + *
> + * Should be used by SPI NAND manufacturer drivers when they want to find a
> + * match between a device ID retrieved through the READ_ID command and an
> + * entry in the SPI NAND description table. If a match is found, the spinand
> + * object will be initialized with information provided by the matching
> + * spinand_info entry.
> + *
> + * Return: 0 on success, a negative error code otherwise.
> + */
> +int spinand_match_and_init(struct spinand_device *spinand,
> +			   const struct spinand_info *table,
> +			   unsigned int table_size, u8 devid)
> +{
> +	struct nand_device *nand = spinand_to_nand(spinand);
> +	unsigned int i;
> +
> +	for (i = 0; i < table_size; i++) {
> +		const struct spinand_info *info = &table[i];
> +		const struct spi_mem_op *op;
> +
> +		if (devid != info->devid)
> +			continue;
> +
> +		nand->memorg = table[i].memorg;
> +		nand->eccreq = table[i].eccreq;
> +		spinand->eccinfo = table[i].eccinfo;
> +		spinand->flags = table[i].flags;
> +		spinand->select_target = table[i].select_target;
> +
> +		op = spinand_select_op_variant(spinand,
> +					       info->op_variants.read_cache);
> +		if (!op)
> +			return -ENOTSUPP;
> +
> +		spinand->op_templates.read_cache = op;
> +
> +		op = spinand_select_op_variant(spinand,
> +					       info->op_variants.write_cache);
> +		if (!op)
> +			return -ENOTSUPP;
> +
> +		spinand->op_templates.write_cache = op;
> +
> +		op = spinand_select_op_variant(spinand,
> +					       info->op_variants.update_cache);
> +		spinand->op_templates.update_cache = op;
> +
> +		spinand_init_quad_enable(spinand);
> +
> +		return 0;
> +	}
> +
> +	return -ENOTSUPP;
> +}
> +
> +static int spinand_detect(struct spinand_device *spinand)
> +{
> +	struct device *dev = &spinand->spimem->spi->dev;
> +	struct nand_device *nand = &spinand->base;
> +	int ret;
> +
> +	ret = spinand_reset_op(spinand);
> +	if (ret)
> +		return ret;
> +
> +	ret = spinand_read_id_op(spinand, spinand->id.data);
> +	if (ret)
> +		return ret;
> +
> +	spinand->id.len = SPINAND_MAX_ID_LEN;
> +
> +	ret = spinand_manufacturer_detect(spinand);
> +	if (ret) {
> +		dev_err(dev, "unknown raw ID %*phN\n", SPINAND_MAX_ID_LEN,
> +			spinand->id.data);
> +		return ret;
> +	}
> +
> +	if (nand->memorg.ntargets > 1 && !spinand->select_target) {
> +		dev_err(dev,
> +			"SPI NANDs with more than one die must implement ->select_target()\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_info(&spinand->spimem->spi->dev,
> +		 "%s SPI NAND was found.\n", spinand->manufacturer->name);
> +	dev_info(&spinand->spimem->spi->dev,
> +		 "%llu MiB, block size: %zu KiB, page size: %zu, OOB size: %u\n",
> +		 nanddev_size(nand) >> 20, nanddev_eraseblock_size(nand) >> 10,
> +		 nanddev_page_size(nand), nanddev_per_page_oobsize(nand));
> +
> +	return 0;
> +}
> +
> +static int spinand_noecc_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				       struct mtd_oob_region *region)
> +{
> +	return -ERANGE;
> +}
> +
> +static int spinand_noecc_ooblayout_free(struct mtd_info *mtd, int section,
> +					struct mtd_oob_region *region)
> +{
> +	if (section)
> +		return -ERANGE;
> +
> +	/* Reserve 2 bytes for the BBM. */
> +	region->offset = 2;
> +	region->length = 62;
> +
> +	return 0;
> +}
> +
> +static const struct mtd_ooblayout_ops spinand_noecc_ooblayout = {
> +	.ecc = spinand_noecc_ooblayout_ecc,
> +	.free = spinand_noecc_ooblayout_free,
> +};
> +
> +static int spinand_init(struct spinand_device *spinand)
> +{
> +	struct device *dev = &spinand->spimem->spi->dev;
> +	struct mtd_info *mtd = spinand_to_mtd(spinand);
> +	struct nand_device *nand = mtd_to_nanddev(mtd);
> +	int ret, i;
> +
> +	/*
> +	 * We need a scratch buffer because the spi_mem interface requires that
> +	 * buf passed in spi_mem_op->data.buf be DMA-able.
> +	 */
> +	spinand->scratchbuf = kzalloc(SPINAND_MAX_ID_LEN, GFP_KERNEL);
> +	if (!spinand->scratchbuf)
> +		return -ENOMEM;
> +
> +	ret = spinand_detect(spinand);
> +	if (ret)
> +		goto err_free_bufs;
> +
> +	/*
> +	 * Use kzalloc() instead of devm_kzalloc() here, because some drivers
> +	 * may use this buffer for DMA access.
> +	 * Memory allocated by devm_ does not guarantee DMA-safe alignment.
> +	 */
> +	spinand->databuf = kzalloc(nanddev_page_size(nand) +
> +			       nanddev_per_page_oobsize(nand),
> +			       GFP_KERNEL);
> +	if (!spinand->databuf)
> +		goto err_free_bufs;
> +
> +	spinand->oobbuf = spinand->databuf + nanddev_page_size(nand);
> +
> +	ret = spinand_init_cfg_cache(spinand);

If the SPINAND_HAS_QE_BIT bit is set, then spinand_init_quad_enable() 
will try to use the config cache, but it hasn't been initialized at that 
time.

So spinand_init_cfg_cache() should probably be called earlier, before 
spinand_detect().

Regards,

Frieder

> +	if (ret)
> +		goto err_free_bufs;
> +
> +	ret = spinand_manufacturer_init(spinand);
> +	if (ret) {
> +		dev_err(dev,
> +			"Failed to initialize the SPI NAND chip (err = %d)\n",
> +			ret);
> +		goto err_free_bufs;
> +	}
> +
> +	/* After power up, all blocks are locked, so unlock it here. */
> +	for (i = 0; i < nand->memorg.ntargets; i++) {
> +		spinand_select_target(spinand, i);
> +		spinand_lock_block(spinand, BL_ALL_UNLOCKED);
> +	}
> +
> +	ret = nanddev_init(nand, &spinand_ops, THIS_MODULE);
> +	if (ret)
> +		goto err_free_bufs;
> +
> +	/*
> +	 * Right now, we don't support ECC, so let the whole oob
> +	 * area is available for user.
> +	 */
> +	mtd->_read_oob = spinand_mtd_read;
> +	mtd->_write_oob = spinand_mtd_write;
> +	mtd->_block_isbad = spinand_mtd_block_isbad;
> +	mtd->_block_markbad = spinand_mtd_block_markbad;
> +	mtd->_block_isreserved = spinand_mtd_block_isreserved;
> +	mtd->_erase = spinand_mtd_erase;
> +
> +	if (spinand->eccinfo.ooblayout)
> +		mtd_set_ooblayout(mtd, spinand->eccinfo.ooblayout);
> +	else
> +		mtd_set_ooblayout(mtd, &spinand_noecc_ooblayout);
> +
> +	ret = mtd_ooblayout_count_freebytes(mtd);
> +	if (ret < 0)
> +		goto err_cleanup_nanddev;
> +
> +	return 0;
> +
> +err_cleanup_nanddev:
> +	nanddev_cleanup(nand);
> +
> +err_free_bufs:
> +	kfree(spinand->databuf);
> +	kfree(spinand->scratchbuf);
> +	return ret;
> +}
> +
> +static void spinand_cleanup(struct spinand_device *spinand)
> +{
> +	struct nand_device *nand = &spinand->base;
> +
> +	spinand_manufacturer_cleanup(spinand);
> +	nanddev_cleanup(nand);
> +	kfree(spinand->databuf);
> +	kfree(spinand->scratchbuf);
> +}
> +
> +static int spinand_probe(struct spi_mem *mem)
> +{
> +	struct spinand_device *spinand;
> +	struct mtd_info *mtd;
> +	int ret;
> +
> +	spinand = devm_kzalloc(&mem->spi->dev, sizeof(*spinand),
> +			       GFP_KERNEL);
> +	if (!spinand)
> +		return -ENOMEM;
> +
> +	spinand->spimem = mem;
> +	spi_mem_set_drvdata(mem, spinand);
> +	spinand_set_of_node(spinand, mem->spi->dev.of_node);
> +	mutex_init(&spinand->lock);
> +	mtd = spinand_to_mtd(spinand);
> +	mtd->dev.parent = &mem->spi->dev;
> +
> +	ret = spinand_init(spinand);
> +	if (ret)
> +		return ret;
> +
> +	ret = mtd_device_register(mtd, NULL, 0);
> +	if (ret)
> +		goto err_spinand_cleanup;
> +
> +	return 0;
> +
> +err_spinand_cleanup:
> +	spinand_cleanup(spinand);
> +
> +	return ret;
> +}
> +
> +static int spinand_remove(struct spi_mem *mem)
> +{
> +	struct spinand_device *spinand;
> +	struct mtd_info *mtd;
> +	int ret;
> +
> +	spinand = spi_mem_get_drvdata(mem);
> +	mtd = spinand_to_mtd(spinand);
> +
> +	ret = mtd_device_unregister(mtd);
> +	if (ret)
> +		return ret;
> +
> +	spinand_cleanup(spinand);
> +
> +	return 0;
> +}
> +
> +static const struct spi_device_id spinand_ids[] = {
> +	{ .name = "spi-nand" },
> +	{ /* sentinel */ },
> +};
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id spinand_of_ids[] = {
> +	{ .compatible = "spi-nand" },
> +	{ /* sentinel */ },
> +};
> +#endif
> +
> +static struct spi_mem_driver spinand_drv = {
> +	.spidrv = {
> +		.id_table = spinand_ids,
> +		.driver = {
> +			.name = "spi-nand",
> +			.of_match_table = of_match_ptr(spinand_of_ids),
> +		},
> +	},
> +	.probe = spinand_probe,
> +	.remove = spinand_remove,
> +};
> +module_spi_mem_driver(spinand_drv);
> +
> +MODULE_DESCRIPTION("SPI NAND framework");
> +MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
> +MODULE_LICENSE("GPL v2");

[...]
