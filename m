Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9xOD-0001Ni-AV
 for linux-mtd@lists.infradead.org; Mon, 06 Jun 2016 16:28:35 +0000
Date: Mon, 6 Jun 2016 18:28:09 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 1/2] mtd: nand: sunxi: add support for DMA assisted
 operations
Message-ID: <20160606182809.63a5e65b@bbrezillon>
In-Reply-To: <1460725831-9736-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1460725831-9736-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Fri, 15 Apr 2016 15:10:30 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> The sunxi NAND controller is able to pipeline ECC operations only when
> operated in DMA mode, which improves a lot NAND throughput while keeping
> CPU usage low.

Applied both.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Changes since v2:
> - completely drop the generic approach base on Russell's feedback
>   (doing DMA on non-lowmem memory is unsafe)
> - fix a bug in sunxi_nfc_hw_ecc_read_chunks_dma() where the ECC status
>   value was lost when at least one bitflip was found in an erased chunk
> 
> Changes since v1:
> - reworked sg_alloc_table_from_buf() to avoid splitting contiguous
>   vmalloced area
> - fixed a bug in the read_dma()
> - fixed dma_direction flag in write_dma()
> 
>  drivers/mtd/nand/sunxi_nand.c | 330 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 323 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> index 1baf8983..5299ab0 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -153,6 +153,7 @@
>  
>  /* define bit use in NFC_ECC_ST */
>  #define NFC_ECC_ERR(x)		BIT(x)
> +#define NFC_ECC_ERR_MSK		GENMASK(15, 0)
>  #define NFC_ECC_PAT_FOUND(x)	BIT(x + 16)
>  #define NFC_ECC_ERR_CNT(b, x)	(((x) >> (((b) % 4) * 8)) & 0xff)
>  
> @@ -273,6 +274,7 @@ struct sunxi_nfc {
>  	unsigned long clk_rate;
>  	struct list_head chips;
>  	struct completion complete;
> +	struct dma_chan *dmac;
>  };
>  
>  static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_hw_control *ctrl)
> @@ -365,6 +367,67 @@ static int sunxi_nfc_rst(struct sunxi_nfc *nfc)
>  	return ret;
>  }
>  
> +static int sunxi_nfc_dma_op_prepare(struct mtd_info *mtd, const void *buf,
> +				    int chunksize, int nchunks,
> +				    enum dma_data_direction ddir,
> +				    struct scatterlist *sg)
> +{
> +	struct nand_chip *nand = mtd_to_nand(mtd);
> +	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
> +	struct dma_async_tx_descriptor *dmad;
> +	enum dma_transfer_direction tdir;
> +	dma_cookie_t dmat;
> +	int ret;
> +
> +	if (ddir == DMA_FROM_DEVICE)
> +		tdir = DMA_DEV_TO_MEM;
> +	else
> +		tdir = DMA_MEM_TO_DEV;
> +
> +	sg_init_one(sg, buf, nchunks * chunksize);
> +	ret = dma_map_sg(nfc->dev, sg, 1, ddir);
> +	if (!ret)
> +		return -ENOMEM;
> +
> +	dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
> +	if (IS_ERR(dmad)) {
> +		ret = PTR_ERR(dmad);
> +		goto err_unmap_buf;
> +	}
> +
> +	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
> +	       nfc->regs + NFC_REG_CTL);
> +	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
> +	writel(chunksize, nfc->regs + NFC_REG_CNT);
> +	dmat = dmaengine_submit(dmad);
> +
> +	ret = dma_submit_error(dmat);
> +	if (ret)
> +		goto err_clr_dma_flag;
> +
> +	return 0;
> +
> +err_clr_dma_flag:
> +	writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
> +	       nfc->regs + NFC_REG_CTL);
> +
> +err_unmap_buf:
> +	dma_unmap_sg(nfc->dev, sg, 1, ddir);
> +	return ret;
> +}
> +
> +static void sunxi_nfc_dma_op_cleanup(struct mtd_info *mtd,
> +				     enum dma_data_direction ddir,
> +				     struct scatterlist *sg)
> +{
> +	struct nand_chip *nand = mtd_to_nand(mtd);
> +	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
> +
> +	dma_unmap_sg(nfc->dev, sg, 1, ddir);
> +	writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
> +	       nfc->regs + NFC_REG_CTL);
> +}
> +
>  static int sunxi_nfc_dev_ready(struct mtd_info *mtd)
>  {
>  	struct nand_chip *nand = mtd_to_nand(mtd);
> @@ -822,17 +885,15 @@ static void sunxi_nfc_hw_ecc_update_stats(struct mtd_info *mtd,
>  }
>  
>  static int sunxi_nfc_hw_ecc_correct(struct mtd_info *mtd, u8 *data, u8 *oob,
> -				    int step, bool *erased)
> +				    int step, u32 status, bool *erased)
>  {
>  	struct nand_chip *nand = mtd_to_nand(mtd);
>  	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
>  	struct nand_ecc_ctrl *ecc = &nand->ecc;
> -	u32 status, tmp;
> +	u32 tmp;
>  
>  	*erased = false;
>  
> -	status = readl(nfc->regs + NFC_REG_ECC_ST);
> -
>  	if (status & NFC_ECC_ERR(step))
>  		return -EBADMSG;
>  
> @@ -898,6 +959,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct mtd_info *mtd,
>  	*cur_off = oob_off + ecc->bytes + 4;
>  
>  	ret = sunxi_nfc_hw_ecc_correct(mtd, data, oob_required ? oob : NULL, 0,
> +				       readl(nfc->regs + NFC_REG_ECC_ST),
>  				       &erased);
>  	if (erased)
>  		return 1;
> @@ -967,6 +1029,128 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct mtd_info *mtd,
>  		*cur_off = mtd->oobsize + mtd->writesize;
>  }
>  
> +static int sunxi_nfc_hw_ecc_read_chunks_dma(struct mtd_info *mtd, uint8_t *buf,
> +					    int oob_required, int page,
> +					    int nchunks)
> +{
> +	struct nand_chip *nand = mtd_to_nand(mtd);
> +	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
> +	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
> +	struct nand_ecc_ctrl *ecc = &nand->ecc;
> +	unsigned int max_bitflips = 0;
> +	int ret, i, raw_mode = 0;
> +	struct scatterlist sg;
> +	u32 status;
> +
> +	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
> +	if (ret)
> +		return ret;
> +
> +	ret = sunxi_nfc_dma_op_prepare(mtd, buf, ecc->size, nchunks,
> +				       DMA_FROM_DEVICE, &sg);
> +	if (ret)
> +		return ret;
> +
> +	sunxi_nfc_hw_ecc_enable(mtd);
> +	sunxi_nfc_randomizer_config(mtd, page, false);
> +	sunxi_nfc_randomizer_enable(mtd);
> +
> +	writel((NAND_CMD_RNDOUTSTART << 16) | (NAND_CMD_RNDOUT << 8) |
> +	       NAND_CMD_READSTART, nfc->regs + NFC_REG_RCMD_SET);
> +
> +	dma_async_issue_pending(nfc->dmac);
> +
> +	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD | NFC_DATA_TRANS,
> +	       nfc->regs + NFC_REG_CMD);
> +
> +	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, true, 0);
> +	if (ret)
> +		dmaengine_terminate_all(nfc->dmac);
> +
> +	sunxi_nfc_randomizer_disable(mtd);
> +	sunxi_nfc_hw_ecc_disable(mtd);
> +
> +	sunxi_nfc_dma_op_cleanup(mtd, DMA_FROM_DEVICE, &sg);
> +
> +	if (ret)
> +		return ret;
> +
> +	status = readl(nfc->regs + NFC_REG_ECC_ST);
> +
> +	for (i = 0; i < nchunks; i++) {
> +		int data_off = i * ecc->size;
> +		int oob_off = i * (ecc->bytes + 4);
> +		u8 *data = buf + data_off;
> +		u8 *oob = nand->oob_poi + oob_off;
> +		bool erased;
> +
> +		ret = sunxi_nfc_hw_ecc_correct(mtd, randomized ? data : NULL,
> +					       oob_required ? oob : NULL,
> +					       i, status, &erased);
> +
> +		/* ECC errors are handled in the second loop. */
> +		if (ret < 0)
> +			continue;
> +
> +		if (oob_required && !erased) {
> +			/* TODO: use DMA to retrieve OOB */
> +			nand->cmdfunc(mtd, NAND_CMD_RNDOUT, oob_off, -1);
> +			nand->read_buf(mtd, oob, ecc->bytes + 4);
> +
> +			sunxi_nfc_hw_ecc_get_prot_oob_bytes(mtd, oob, i,
> +							    !i, page);
> +		}
> +
> +		if (erased)
> +			raw_mode = 1;
> +
> +		sunxi_nfc_hw_ecc_update_stats(mtd, &max_bitflips, ret);
> +	}
> +
> +	if (status & NFC_ECC_ERR_MSK) {
> +		for (i = 0; i < nchunks; i++) {
> +			int data_off = i * ecc->size;
> +			int oob_off = i * (ecc->bytes + 4);
> +			u8 *data = buf + data_off;
> +			u8 *oob = nand->oob_poi + oob_off;
> +
> +			if (!(status & NFC_ECC_ERR(i)))
> +				continue;
> +
> +			/*
> +			 * Re-read the data with the randomizer disabled to
> +			 * identify bitflips in erased pages.
> +			 */
> +			if (randomized) {
> +				/* TODO: use DMA to read page in raw mode */
> +				nand->cmdfunc(mtd, NAND_CMD_RNDOUT,
> +					      data_off, -1);
> +				nand->read_buf(mtd, data, ecc->size);
> +			}
> +
> +			/* TODO: use DMA to retrieve OOB */
> +			nand->cmdfunc(mtd, NAND_CMD_RNDOUT, oob_off, -1);
> +			nand->read_buf(mtd, oob, ecc->bytes + 4);
> +
> +			ret = nand_check_erased_ecc_chunk(data,	ecc->size,
> +							  oob, ecc->bytes + 4,
> +							  NULL, 0,
> +							  ecc->strength);
> +			if (ret >= 0)
> +				raw_mode = 1;
> +
> +			sunxi_nfc_hw_ecc_update_stats(mtd, &max_bitflips, ret);
> +		}
> +	}
> +
> +	if (oob_required)
> +		sunxi_nfc_hw_ecc_read_extra_oob(mtd, nand->oob_poi,
> +						NULL, !raw_mode,
> +						page);
> +
> +	return max_bitflips;
> +}
> +
>  static int sunxi_nfc_hw_ecc_write_chunk(struct mtd_info *mtd,
>  					const u8 *data, int data_off,
>  					const u8 *oob, int oob_off,
> @@ -1065,6 +1249,23 @@ static int sunxi_nfc_hw_ecc_read_page(struct mtd_info *mtd,
>  	return max_bitflips;
>  }
>  
> +static int sunxi_nfc_hw_ecc_read_page_dma(struct mtd_info *mtd,
> +					  struct nand_chip *chip, u8 *buf,
> +					  int oob_required, int page)
> +{
> +	int ret;
> +
> +	ret = sunxi_nfc_hw_ecc_read_chunks_dma(mtd, buf, oob_required, page,
> +					       chip->ecc.steps);
> +	if (ret >= 0)
> +		return ret;
> +
> +	/* Fallback to PIO mode */
> +	chip->cmdfunc(mtd, NAND_CMD_RNDOUT, 0, -1);
> +
> +	return sunxi_nfc_hw_ecc_read_page(mtd, chip, buf, oob_required, page);
> +}
> +
>  static int sunxi_nfc_hw_ecc_read_subpage(struct mtd_info *mtd,
>  					 struct nand_chip *chip,
>  					 u32 data_offs, u32 readlen,
> @@ -1098,6 +1299,25 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct mtd_info *mtd,
>  	return max_bitflips;
>  }
>  
> +static int sunxi_nfc_hw_ecc_read_subpage_dma(struct mtd_info *mtd,
> +					     struct nand_chip *chip,
> +					     u32 data_offs, u32 readlen,
> +					     u8 *buf, int page)
> +{
> +	int nchunks = DIV_ROUND_UP(data_offs + readlen, chip->ecc.size);
> +	int ret;
> +
> +	ret = sunxi_nfc_hw_ecc_read_chunks_dma(mtd, buf, false, page, nchunks);
> +	if (ret >= 0)
> +		return ret;
> +
> +	/* Fallback to PIO mode */
> +	chip->cmdfunc(mtd, NAND_CMD_RNDOUT, 0, -1);
> +
> +	return sunxi_nfc_hw_ecc_read_subpage(mtd, chip, data_offs, readlen,
> +					     buf, page);
> +}
> +
>  static int sunxi_nfc_hw_ecc_write_page(struct mtd_info *mtd,
>  				       struct nand_chip *chip,
>  				       const uint8_t *buf, int oob_required,
> @@ -1130,6 +1350,69 @@ static int sunxi_nfc_hw_ecc_write_page(struct mtd_info *mtd,
>  	return 0;
>  }
>  
> +static int sunxi_nfc_hw_ecc_write_page_dma(struct mtd_info *mtd,
> +					   struct nand_chip *chip,
> +					   const u8 *buf,
> +					   int oob_required,
> +					   int page)
> +{
> +	struct nand_chip *nand = mtd_to_nand(mtd);
> +	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
> +	struct nand_ecc_ctrl *ecc = &nand->ecc;
> +	struct scatterlist sg;
> +	int ret, i;
> +
> +	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
> +	if (ret)
> +		return ret;
> +
> +	ret = sunxi_nfc_dma_op_prepare(mtd, buf, ecc->size, ecc->steps,
> +				       DMA_TO_DEVICE, &sg);
> +	if (ret)
> +		goto pio_fallback;
> +
> +	for (i = 0; i < ecc->steps; i++) {
> +		const u8 *oob = nand->oob_poi + (i * (ecc->bytes + 4));
> +
> +		sunxi_nfc_hw_ecc_set_prot_oob_bytes(mtd, oob, i, !i, page);
> +	}
> +
> +	sunxi_nfc_hw_ecc_enable(mtd);
> +	sunxi_nfc_randomizer_config(mtd, page, false);
> +	sunxi_nfc_randomizer_enable(mtd);
> +
> +	writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
> +	       nfc->regs + NFC_REG_RCMD_SET);
> +
> +	dma_async_issue_pending(nfc->dmac);
> +
> +	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
> +	       NFC_DATA_TRANS | NFC_ACCESS_DIR,
> +	       nfc->regs + NFC_REG_CMD);
> +
> +	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, true, 0);
> +	if (ret)
> +		dmaengine_terminate_all(nfc->dmac);
> +
> +	sunxi_nfc_randomizer_disable(mtd);
> +	sunxi_nfc_hw_ecc_disable(mtd);
> +
> +	sunxi_nfc_dma_op_cleanup(mtd, DMA_TO_DEVICE, &sg);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (oob_required || (chip->options & NAND_NEED_SCRAMBLING))
> +		/* TODO: use DMA to transfer extra OOB bytes ? */
> +		sunxi_nfc_hw_ecc_write_extra_oob(mtd, chip->oob_poi,
> +						 NULL, page);
> +
> +	return 0;
> +
> +pio_fallback:
> +	return sunxi_nfc_hw_ecc_write_page(mtd, chip, buf, oob_required, page);
> +}
> +
>  static int sunxi_nfc_hw_syndrome_ecc_read_page(struct mtd_info *mtd,
>  					       struct nand_chip *chip,
>  					       uint8_t *buf, int oob_required,
> @@ -1550,14 +1833,27 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
>  				       struct nand_ecc_ctrl *ecc,
>  				       struct device_node *np)
>  {
> +	struct nand_chip *nand = mtd_to_nand(mtd);
> +	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
> +	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
>  	int ret;
>  
>  	ret = sunxi_nand_hw_common_ecc_ctrl_init(mtd, ecc, np);
>  	if (ret)
>  		return ret;
>  
> -	ecc->read_page = sunxi_nfc_hw_ecc_read_page;
> -	ecc->write_page = sunxi_nfc_hw_ecc_write_page;
> +	if (nfc->dmac) {
> +		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
> +		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
> +		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;
> +		nand->options |= NAND_USE_BOUNCE_BUFFER;
> +	} else {
> +		ecc->read_page = sunxi_nfc_hw_ecc_read_page;
> +		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage;
> +		ecc->write_page = sunxi_nfc_hw_ecc_write_page;
> +	}
> +
> +	/* TODO: support DMA for raw accesses */
>  	ecc->read_oob_raw = nand_read_oob_std;
>  	ecc->write_oob_raw = nand_write_oob_std;
>  	ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage;
> @@ -1883,16 +2179,34 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_mod_clk_unprepare;
>  
> +	nfc->dmac = dma_request_slave_channel(dev, "rxtx");
> +	if (nfc->dmac) {
> +		struct dma_slave_config dmac_cfg = { };
> +
> +		dmac_cfg.src_addr = r->start + NFC_REG_IO_DATA;
> +		dmac_cfg.dst_addr = dmac_cfg.src_addr;
> +		dmac_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +		dmac_cfg.dst_addr_width = dmac_cfg.src_addr_width;
> +		dmac_cfg.src_maxburst = 4;
> +		dmac_cfg.dst_maxburst = 4;
> +		dmaengine_slave_config(nfc->dmac, &dmac_cfg);
> +	} else {
> +		dev_warn(dev, "failed to request rxtx DMA channel\n");
> +	}
> +
>  	platform_set_drvdata(pdev, nfc);
>  
>  	ret = sunxi_nand_chips_init(dev, nfc);
>  	if (ret) {
>  		dev_err(dev, "failed to init nand chips\n");
> -		goto out_mod_clk_unprepare;
> +		goto out_release_dmac;
>  	}
>  
>  	return 0;
>  
> +out_release_dmac:
> +	if (nfc->dmac)
> +		dma_release_channel(nfc->dmac);
>  out_mod_clk_unprepare:
>  	clk_disable_unprepare(nfc->mod_clk);
>  out_ahb_clk_unprepare:
> @@ -1906,6 +2220,8 @@ static int sunxi_nfc_remove(struct platform_device *pdev)
>  	struct sunxi_nfc *nfc = platform_get_drvdata(pdev);
>  
>  	sunxi_nand_chips_cleanup(nfc);
> +	if (nfc->dmac)
> +		dma_release_channel(nfc->dmac);
>  	clk_disable_unprepare(nfc->mod_clk);
>  	clk_disable_unprepare(nfc->ahb_clk);
>  



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
