Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6muj-0006yv-PG
 for linux-mtd@lists.infradead.org; Thu, 01 Jan 2015 21:04:16 +0000
Date: Thu, 1 Jan 2015 22:03:46 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v3 1/3] mtd: nand: add asm9260 NFC driver
Message-ID: <20150101220346.46548a6e@bbrezillon>
In-Reply-To: <54A5ABA4.2090909@rempel-privat.de>
References: <20141230200946.277c56c0@bbrezillon>
 <1420030733-10374-1-git-send-email-linux@rempel-privat.de>
 <20141231174859.232875d0@bbrezillon>
 <54A5ABA4.2090909@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 01 Jan 2015 21:18:44 +0100
Oleksij Rempel <linux@rempel-privat.de> wrote:

> Am 31.12.2014 um 17:48 schrieb Boris Brezillon:
> > Hi Oleksij,
> > 
> > You should really add a cover letter containing a changelog (updated at
> > each new version of your cover letter) so that reviewers can easily
> > identify what has changed.
> > 
> > While you're at it, can you add your mtd test results to the cover
> > letter ?
> 
> ok.
> 
> [snip]
> 
> >> +/**
> >> + * We can't read less then 32 bits on HW_FIFO_DATA. So, to make
> >> + * read_byte and read_word happy, we use sort of cached 32bit read.
> >> + * Note: expected values for size should be 1 or 2 bytes.
> >> + */
> >> +static u32 asm9260_nand_read_cached(struct mtd_info *mtd, int size)
> >> +{
> >> +	struct asm9260_nand_priv *priv = mtd_to_priv(mtd);
> >> +	u8 tmp;
> >> +
> >> +	if ((priv->read_cache_cnt <= 0) || (priv->read_cache_cnt > 4)) {
> > 
> >                                             ^ how can this ever happen ?
> > 
> >> +		asm9260_nand_cmd_comp(mtd, 0);
> >> +		priv->read_cache = ioread32(priv->base + HW_FIFO_DATA);
> >> +		priv->read_cache_cnt = 4;
> >> +	}
> >> +
> >> +	tmp = priv->read_cache >> (8 * (4 - priv->read_cache_cnt));
> >> +	priv->read_cache_cnt -= size;
> >> +
> >> +	return tmp;
> >> +}
> >> +
> >> +static u8 asm9260_nand_read_byte(struct mtd_info *mtd)
> >> +{
> >> +	return 0xff & asm9260_nand_read_cached(mtd, 1);
> > 
> > Maybe this mask operation could be done in asm9260_nand_read_cached, so
> > that you won't have to bother in read_byte/read_word functions.
> 
> it is same as "return (u8)asm9260_nand_read_cached(mtd, 1);", just makes
> sure compiler do not complain.

Absolutely, I didn't notice the return type of this function (thought
it was returning an u32).
Does it complain when you directly return asm9260_nand_read_cached
result ?

> 
> >> +}
> >> +
> >> +static u16 asm9260_nand_read_word(struct mtd_info *mtd)
> >> +{
> >> +	return 0xffff & asm9260_nand_read_cached(mtd, 2);
> > 
> > You'd better always use read_word, cause if you call read_byte once
> > then read_word twice, you'll end up with a wrong value after the second
> > read_word (3 bytes consumed, which means there's only 1 remaining byte
> > and you're asking for 2).
> 
> nand_base use both functions. how can i use only one? For example:
>         chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
> 
>         /* Read entire ID string */
>         for (i = 0; i < 8; i++)
>                 id_data[i] = chip->read_byte(mtd);
> 
> this wont work with read_word.

What I meant is that if you start using read_byte after launching a
specific command you should not mix read_byte and read_word, because
otherwise you might end up with erroneous values.
I'm not sure this can really happen (is there any code in nand core
mixing read_byte and read_word ?), but my point is that you should
handle that specific case (only one remaining byte in read_cache while
2 are requested) in asm9260_nand_read_cached...

> 
> 
> >> +}
> >> +
> >> +static void asm9260_nand_read_buf(struct mtd_info *mtd, u8 *buf, int len)
> >> +{
> >> +	struct asm9260_nand_priv *priv = mtd_to_priv(mtd);
> >> +	dma_addr_t dma_addr;
> >> +	int dma_ok = 0;
> >> +
> >> +	if (len & 0x3) {
> >> +		dev_err(priv->dev, "Unsupported length (%x)\n", len);
> >> +		return;
> >> +	}
> >> +
> >> +	/*
> >> +	 * I hate you UBI for your all vmalloc. Be slow as hell with PIO.
> >> +	 * ~ with love from ZeroCopy ~
> >> +	 */
> >> +	if (!is_vmalloc_addr(buf)) {
> >> +		dma_addr = asm9260_nand_dma_set(mtd, buf, DMA_FROM_DEVICE, len);
> >> +		dma_ok = !(dma_mapping_error(priv->dev, dma_addr));
> >> +	}
> >> +	asm9260_nand_cmd_comp(mtd, dma_ok);
> >> +
> >> +	if (dma_ok) {
> >> +		dma_sync_single_for_cpu(priv->dev, dma_addr, len,
> >> +				DMA_FROM_DEVICE);
> >> +		dma_unmap_single(priv->dev, dma_addr, len, DMA_FROM_DEVICE);
> >> +		return;
> >> +	}
> >> +
> >> +	/* fall back to pio mode */
> >> +	len >>= 2;
> >> +	ioread32_rep(priv->base + HW_FIFO_DATA, buf, len);
> > 
> > Hm, what if the buf is not aligned on 32bit, or len is not a multiple
> > of 4 ?
> 
> I can read only buf == page size. All page sizes suported by this
> controller are aligned. See "if (len & 0x3) {", and take a look at
> asm9260_nand_read_cached - we can read only 32bit.

But read_buf is not only used to read full pages (see [1]), and, AFAIR,
there's nothing preventing mtd users from passing a non 32 bit aligned
buf... 

> 
> 
> >> +}
> >> +
> >> +static void asm9260_nand_write_buf(struct mtd_info *mtd,
> >> +		const u8 *buf, int len)
> >> +{
> >> +	struct asm9260_nand_priv *priv = mtd_to_priv(mtd);
> >> +	dma_addr_t dma_addr;
> >> +	int dma_ok = 0;
> >> +
> >> +	if (len & 0x3) {
> >> +		dev_err(priv->dev, "Unsupported length (%x)\n", len);
> >> +		return;
> >> +	}
> >> +
> >> +	if (!is_vmalloc_addr(buf)) {
> >> +		dma_addr = asm9260_nand_dma_set(mtd,
> >> +				(void *)buf, DMA_TO_DEVICE, len);
> >> +		dma_ok = !(dma_mapping_error(priv->dev, dma_addr));
> >> +	}
> >> +
> >> +	if (dma_ok)
> >> +		dma_sync_single_for_device(priv->dev, dma_addr, len,
> >> +				DMA_TO_DEVICE);
> >> +	asm9260_nand_cmd_comp(mtd, dma_ok);
> >> +
> >> +	if (dma_ok) {
> >> +		dma_unmap_single(priv->dev, dma_addr, len, DMA_TO_DEVICE);
> >> +		return;
> >> +	}
> >> +
> >> +	/* fall back to pio mode */
> >> +	len >>= 2;
> >> +	iowrite32_rep(priv->base + HW_FIFO_DATA, buf, len);
> > 
> > Ditto
> > 
> >> +}
> >> +
> >> +static int asm9260_nand_write_page_raw(struct mtd_info *mtd,
> >> +		struct nand_chip *chip, const u8 *buf,
> >> +		int oob_required)
> >> +{
> >> +	struct asm9260_nand_priv *priv = mtd_to_priv(mtd);
> >> +
> >> +	chip->write_buf(mtd, buf, mtd->writesize);
> >> +	if (oob_required)
> >> +		chip->ecc.write_oob(mtd, chip, priv->page_cache &
> >> +				chip->pagemask);
> > 
> > Can't you just call
> > 		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> > 
> > And if it works, then you can just drop this raw function since the
> > default one does the exact same thing.
> 
> There 3 variants:
> - allocate dma == page + oob; and copy each buffer
> - use pio and read out oob even if it was not requested
> - use dma_map_single, avoid buffer copying, and request oob if needed.
> 
> i use last variant even if it meane sending a command to request oob.

Because the controller cannot read in-band and out-of-band data in a
single command ?

> 
> > 
> >> +	return 0;
> >> +}
> >> +
> >> +static int asm9260_nand_write_page_hwecc(struct mtd_info *mtd,
> >> +		struct nand_chip *chip, const u8 *buf,
> >> +		int oob_required)
> >> +{
> >> +	struct asm9260_nand_priv *priv = mtd_to_priv(mtd);
> >> +
> >> +	asm9260_reg_rmw(priv, HW_CTRL, BM_CTRL_ECC_EN, 0);
> >> +	chip->ecc.write_page_raw(mtd, chip, buf, oob_required);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static unsigned int asm9260_nand_count_ecc(struct asm9260_nand_priv *priv)
> >> +{
> >> +	u32 tmp, i, count, maxcount = 0;
> >> +
> >> +	/* FIXME: this layout was tested only on 2048byte NAND.
> >> +	 * NANDs with bigger page size should use more registers. */
> > 
> > Yep, you should really fix that, or at least reject NAND with a
> > different page size until you've fixed that.
> 
> ok.
> 
> >> +	tmp = ioread32(priv->base + HW_ECC_ERR_CNT);
> >> +	for (i = 0; i < 4; i++) {
> >> +		count = 0x1f & (tmp >> (5 * i));
> >> +		maxcount = max_t(unsigned int, maxcount, count);
> >> +	}
> >> +
> >> +	return count;
> >> +}
> >> +
> >> +static int asm9260_nand_read_page_hwecc(struct mtd_info *mtd,
> >> +		struct nand_chip *chip, u8 *buf,
> >> +		int oob_required, int page)
> >> +{
> >> +	struct asm9260_nand_priv *priv = mtd_to_priv(mtd);
> >> +	u8 *temp_ptr;
> >> +	u32 status, max_bitflips = 0;
> >> +
> >> +	temp_ptr = buf;
> >> +
> >> +	/* enable ecc */
> >> +	asm9260_reg_rmw(priv, HW_CTRL, BM_CTRL_ECC_EN, 0);
> >> +	chip->read_buf(mtd, temp_ptr, mtd->writesize);
> >> +
> >> +	status = ioread32(priv->base + HW_ECC_CTRL);
> >> +
> >> +	if (status & BM_ECC_ERR_UNC) {
> >> +		u32 ecc_err;
> >> +
> >> +		ecc_err = ioread32(priv->base + HW_ECC_ERR_CNT);
> >> +		/* check if it is erased page (all_DATA_OOB == 0xff) */
> >> +		/* FIXME: should be tested if it is a bullet proof solution.
> >> +		 *  if not, use is_buf_blank. */
> > 
> > you'd rather use is_buf_blank if you're unsure.
> 
> ok, can is_buf_blank be moved to nand_base?

I'll let Brian answer that one.

> 
> > 
> >> +		if (ecc_err != 0x8421)
> >> +			mtd->ecc_stats.failed++;
> >> +
> >> +	} else if (status & BM_ECC_ERR_CORRECT) {
> >> +		max_bitflips = asm9260_nand_count_ecc(priv);
> > 
> > max_bitflips should contain the maximum number of bitflips in all
> > ECC blocks of a given page, here you just returning the number of
> > bitflips in the last ECC block.
> 
> no. see asm9260_nand_count_ecc.

My bad, you're right (I thought the ECC step loop was done here).

> 
> > The following should do the trick:
> > 
> > 		int bitflips = asm9260_nand_count_ecc(priv);
> > 
> > 		if (bitflips > max_bitflips)
> > 			max_bitflips = bitflips;
> > 
> > 		mtd->ecc_stats.corrected += bitflips;
> > 
> >> +		mtd->ecc_stats.corrected += max_bitflips;
> >> +	}
> >> +
> >> +	if (oob_required)
> >> +		chip->ecc.read_oob(mtd, chip, page);
> >> +
> >> +	return max_bitflips;
> >> +}
> >> +
> >> +static irqreturn_t asm9260_nand_irq(int irq, void *device_info)
> >> +{
> >> +	struct asm9260_nand_priv *priv = device_info;
> >> +	struct nand_chip *nand = &priv->nand;
> >> +	u32 status;
> >> +
> >> +	status = ioread32(priv->base + HW_INT_STATUS);
> >> +	if (!status)
> >> +		return IRQ_NONE;
> >> +
> >> +	iowrite32(0, priv->base + HW_INT_MASK);
> >> +	iowrite32(0, priv->base + HW_INT_STATUS);
> >> +	priv->irq_done = 1;
> > 
> > You should test the flags before deciding the irq is actually done...
> 
> ok. if fixed it by changing mem_mask logic.

Still, checking the status register is a good practice.

> 
> > 
> >> +	wake_up(&nand->controller->wq);
> > 
> > and if the condition is not met, don't wake up the waitqueue.
> > 
> >> +
> >> +	return IRQ_HANDLED;
> >> +}
> >> +
> >> +static void __init asm9260_nand_init_chip(struct nand_chip *nand_chip)
> >> +{
> >> +	nand_chip->select_chip	= asm9260_select_chip;
> >> +	nand_chip->cmdfunc	= asm9260_nand_command_lp;
> > 
> > You seems to only support large pages NANDs (> 512 bytes), maybe you
> > should check if the discovered chip has large pages, and reject the NAND
> > otherwise.
> 
> ok.
> 
> >> +	nand_chip->read_byte	= asm9260_nand_read_byte;
> >> +	nand_chip->read_word	= asm9260_nand_read_word;
> >> +	nand_chip->read_buf	= asm9260_nand_read_buf;
> >> +	nand_chip->write_buf	= asm9260_nand_write_buf;
> >> +
> >> +	nand_chip->dev_ready	= asm9260_nand_dev_ready;
> >> +	nand_chip->chip_delay	= 100;
> >> +	nand_chip->options	|= NAND_NO_SUBPAGE_WRITE;
> >> +
> >> +	nand_chip->ecc.write_page	= asm9260_nand_write_page_hwecc;
> >> +	nand_chip->ecc.write_page_raw	= asm9260_nand_write_page_raw;
> >> +	nand_chip->ecc.read_page	= asm9260_nand_read_page_hwecc;
> >> +}
> >> +
> >> +static int __init asm9260_nand_cached_config(struct asm9260_nand_priv *priv)
> >> +{
> >> +	struct nand_chip *nand = &priv->nand;
> >> +	struct mtd_info *mtd = &priv->mtd;
> >> +	u32 addr_cycles, col_cycles, pages_per_block;
> >> +
> >> +	pages_per_block = mtd->erasesize / mtd->writesize;
> >> +	/* max 256P, min 32P */
> >> +	if (pages_per_block & ~(0x000001e0)) {
> >> +		dev_err(priv->dev, "Unsupported erasesize 0x%x\n",
> >> +				mtd->erasesize);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	/* max 32K, min 256. */
> >> +	if (mtd->writesize & ~(0x0000ff00)) {
> >> +		dev_err(priv->dev, "Unsupported writesize 0x%x\n",
> >> +				mtd->erasesize);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	col_cycles  = 2;
> >> +	addr_cycles = col_cycles +
> >> +		(((mtd->size >> mtd->writesize) > 65536) ? 3 : 2);
> >> +
> >> +	priv->ctrl_cache = addr_cycles << BM_CTRL_ADDR_CYCLE1_S
> >> +		| BM_CTRL_PAGE_SIZE(mtd->writesize) << BM_CTRL_PAGE_SIZE_S
> >> +		| BM_CTRL_BLOCK_SIZE(pages_per_block) << BM_CTRL_BLOCK_SIZE_S
> >> +		| BM_CTRL_INT_EN
> >> +		| addr_cycles << BM_CTRL_ADDR_CYCLE0_S;
> >> +
> >> +	iowrite32(BM_ECC_CAPn(nand->ecc.strength) << BM_ECC_CAP_S,
> >> +			priv->base + HW_ECC_CTRL);
> >> +
> >> +	iowrite32(mtd->writesize + priv->spare_size,
> >> +			priv->base + HW_ECC_OFFSET);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static unsigned long __init clk_get_cyc_from_ns(struct clk *clk,
> >> +		unsigned long ns)
> >> +{
> >> +	unsigned int cycle;
> >> +
> >> +	cycle = NSEC_PER_SEC / clk_get_rate(clk);
> >> +	return DIV_ROUND_CLOSEST(ns, cycle);
> >> +}
> >> +
> >> +static void __init asm9260_nand_timing_config(struct asm9260_nand_priv *priv)
> >> +{
> >> +	struct nand_chip *nand = &priv->nand;
> >> +	const struct nand_sdr_timings *time;
> >> +	u32 twhr, trhw, trwh, trwp, tadl, tccs, tsync, trr, twb;
> >> +	int mode;
> >> +
> > 
> > Maybe you should add support for ONFI timing mode retrieval with
> > onfi_get_async_timing_mode.
> 
> instead of nand->onfi_timing_mode_default?

No you should check both: first try to retrieve the onfi timing mode
with the onfi_get_async_timing_mode function and it it returns an error
use onfi_timing_mode_default.

> 
> >> +	mode = nand->onfi_timing_mode_default;
> >> +	dev_info(priv->dev, "ONFI timing mode: %i\n", mode);
> >> +
> >> +	time = onfi_async_timing_mode_to_sdr_timings(mode);
> >> +	if (IS_ERR_OR_NULL(time)) {
> >> +		dev_err(priv->dev, "Can't get onfi_timing_mode: %i\n", mode);
> >> +		return;
> >> +	}
> >> +
> >> +	trwh = clk_get_cyc_from_ns(priv->clk, time->tWH_min / 1000);
> >> +	trwp = clk_get_cyc_from_ns(priv->clk, time->tWP_min / 1000);
> >> +
> >> +	iowrite32((trwh << 4) | (trwp), priv->base + HW_TIMING_ASYN);
> >> +
> >> +	twhr = clk_get_cyc_from_ns(priv->clk, time->tWHR_min / 1000);
> >> +	trhw = clk_get_cyc_from_ns(priv->clk, time->tRHW_min / 1000);
> >> +	tadl = clk_get_cyc_from_ns(priv->clk, time->tADL_min / 1000);
> >> +	/* tCCS - change read/write collumn. Time between last cmd and data. */
> >> +	tccs = clk_get_cyc_from_ns(priv->clk,
> >> +			(time->tCLR_min + time->tCLH_min + time->tRC_min)
> >> +			/ 1000);
> >> +
> >> +	iowrite32((twhr << 24) | (trhw << 16)
> >> +		| (tadl << 8) | (tccs), priv->base + HW_TIM_SEQ_0);
> >> +
> >> +	trr = clk_get_cyc_from_ns(priv->clk, time->tRR_min / 1000);
> >> +	tsync = 0; /* ??? */
> >> +	twb = clk_get_cyc_from_ns(priv->clk, time->tWB_max / 1000);
> >> +	iowrite32((tsync << 16) | (trr << 9) | (twb),
> >> +			priv->base + HW_TIM_SEQ_1);
> >> +}
> >> +
> >> +static int __init asm9260_nand_ecc_conf(struct asm9260_nand_priv *priv)
> >> +{
> >> +	struct device_node *np = priv->dev->of_node;
> >> +	struct nand_chip *nand = &priv->nand;
> >> +	struct mtd_info *mtd = &priv->mtd;
> >> +	struct nand_ecclayout *ecc_layout = &priv->ecc_layout;
> >> +	int i, ecc_strength;
> >> +
> >> +	nand->ecc.mode = of_get_nand_ecc_mode(np);
> >> +	switch (nand->ecc.mode) {
> >> +	case NAND_ECC_SOFT:
> >> +	case NAND_ECC_SOFT_BCH:
> >> +		dev_info(priv->dev, "Using soft ECC %i\n", nand->ecc.mode);
> >> +		/* nand_base will find needed settings */
> >> +		return 0;
> >> +	case NAND_ECC_HW:
> >> +	default:
> >> +		dev_info(priv->dev, "Using default NAND_ECC_HW\n");
> >> +		nand->ecc.mode = NAND_ECC_HW;
> >> +		break;
> >> +	}
> >> +
> >> +	ecc_strength = of_get_nand_ecc_strength(np);
> >> +	nand->ecc.size = ASM9260_ECC_STEP;
> >> +	nand->ecc.steps = mtd->writesize / nand->ecc.size;
> >> +
> >> +	if (ecc_strength < nand->ecc_strength_ds) {
> >> +		int ds_corr;
> >> +
> >> +		/* Let's check if ONFI can help us. */
> >> +		if (nand->ecc_strength_ds <= 0) {
> > 
> > Actually this is not necessarily filled by ONFI parameters (it can be
> > statically defined in the nand_ids table).
> 
> Should i sepcify it by dev_err or enough to say it in comment?

Keep your error message, just change its content.

> 
> >> +			/* No ONFI and no DT - it is bad. */
> >> +			dev_err(priv->dev,
> >> +					"nand-ecc-strength is not set by DT or ONFI. Please set nand-ecc-strength in DT or add chip quirk in nand_ids.c.\n");
> >> +			return -EINVAL;
> >> +		}
> >> +
> >> +		ds_corr = (mtd->writesize * nand->ecc_strength_ds) /
> >> +			nand->ecc_step_ds;
> >> +		ecc_strength = ds_corr / nand->ecc.steps;
> >> +		dev_info(priv->dev, "ONFI:nand-ecc-strength = %i\n",
> >> +				ecc_strength);
> >> +	} else
> >> +		dev_info(priv->dev, "DT:nand-ecc-strength = %i\n",
> >> +				ecc_strength);
> >> +
> >> +	if (ecc_strength == 0 || ecc_strength > ASM9260_ECC_MAX_BIT) {
> >> +		dev_err(priv->dev,
> >> +				"Not supported ecc_strength value: %i\n",
> >> +				ecc_strength);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	if (ecc_strength & 0x1) {
> >> +		ecc_strength++;
> >> +		dev_info(priv->dev,
> >> +				"Only even ecc_strength value is supported. Recalculating: %i\n",
> >> +		       ecc_strength);
> >> +	}
> >> +
> >> +	/* FIXME: do we have max or min page size? */
> >> +
> >> +	/* 13 - the smallest integer for 512 (ASM9260_ECC_STEP). Div to 8bit. */
> >> +	nand->ecc.bytes = DIV_ROUND_CLOSEST(ecc_strength * 13, 8);
> >> +
> >> +	ecc_layout->eccbytes = nand->ecc.bytes * nand->ecc.steps;
> >> +	nand->ecc.layout = ecc_layout;
> >> +	nand->ecc.strength = ecc_strength;
> >> +
> >> +	priv->spare_size = mtd->oobsize - ecc_layout->eccbytes;
> >> +
> >> +	ecc_layout->oobfree[0].offset = 2;
> >> +	ecc_layout->oobfree[0].length = priv->spare_size - 2;
> >> +
> >> +	/* FIXME: can we use same layout as SW_ECC? */
> > 
> > It depends on what your controller is capable of. If you can define the
> > offset at which you write the ECC bytes, then yes you can reuse the
> > same kind of layout used in SW_ECC.
> > 
> >> +	for (i = 0; i < ecc_layout->eccbytes; i++)
> >> +		ecc_layout->eccpos[i] = priv->spare_size + i;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int __init asm9260_nand_get_dt_clks(struct asm9260_nand_priv *priv)
> >> +{
> >> +	int clk_idx = 0, err;
> >> +
> >> +	priv->clk = devm_clk_get(priv->dev, "sys");
> >> +	if (IS_ERR(priv->clk))
> >> +		goto out_err;
> >> +
> >> +	/* configure AHB clock */
> >> +	clk_idx = 1;
> >> +	priv->clk_ahb = devm_clk_get(priv->dev, "ahb");
> >> +	if (IS_ERR(priv->clk_ahb))
> >> +		goto out_err;
> >> +
> >> +	err = clk_prepare_enable(priv->clk_ahb);
> >> +	if (err)
> >> +		dev_err(priv->dev, "Failed to enable ahb_clk!\n");
> >> +
> >> +	err = clk_set_rate(priv->clk, clk_get_rate(priv->clk_ahb));
> >> +	if (err) {
> >> +		clk_disable_unprepare(priv->clk_ahb);
> >> +		dev_err(priv->dev, "Failed to set rate!\n");
> >> +	}
> >> +
> >> +	err = clk_prepare_enable(priv->clk);
> >> +	if (err) {
> >> +		clk_disable_unprepare(priv->clk_ahb);
> >> +		dev_err(priv->dev, "Failed to enable clk!\n");
> >> +	}
> >> +
> >> +	return 0;
> >> +out_err:
> >> +	dev_err(priv->dev, "%s: Failed to get clk (%i)\n", __func__, clk_idx);
> >> +	return 1;
> >> +}
> >> +
> >> +static int __init asm9260_nand_probe(struct platform_device *pdev)
> >> +{
> >> +	struct asm9260_nand_priv *priv;
> >> +	struct nand_chip *nand;
> >> +	struct mtd_info *mtd;
> >> +	struct device_node *np = pdev->dev.of_node;
> >> +	struct resource *r;
> >> +	int ret, i;
> >> +	unsigned int irq;
> >> +	u32 val;
> >> +
> >> +	priv = devm_kzalloc(&pdev->dev, sizeof(struct asm9260_nand_priv),
> >> +			GFP_KERNEL);
> >> +	if (!priv)
> >> +		return -ENOMEM;
> >> +
> >> +	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> +	priv->base = devm_ioremap_resource(&pdev->dev, r);
> >> +	if (!priv->base) {
> >> +		dev_err(&pdev->dev, "Unable to map resource!\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	priv->dev = &pdev->dev;
> >> +	nand = &priv->nand;
> >> +	nand->priv = priv;
> >> +
> >> +	platform_set_drvdata(pdev, priv);
> >> +	mtd = &priv->mtd;
> >> +	mtd->priv = nand;
> >> +	mtd->owner = THIS_MODULE;
> >> +	mtd->name = dev_name(&pdev->dev);
> >> +
> >> +	if (asm9260_nand_get_dt_clks(priv))
> >> +		return -ENODEV;
> >> +
> >> +	irq = platform_get_irq(pdev, 0);
> >> +	if (!irq)
> >> +		return -ENODEV;
> >> +
> >> +	iowrite32(0, priv->base + HW_INT_MASK);
> >> +	ret = devm_request_irq(priv->dev, irq, asm9260_nand_irq,
> >> +				IRQF_ONESHOT | IRQF_SHARED,
> >> +				dev_name(&pdev->dev), priv);
> >> +
> >> +	asm9260_nand_init_chip(nand);
> >> +
> >> +	ret = of_property_read_u32(np, "nand-max-chips", &val);
> >> +	if (ret)
> >> +		val = 1;
> >> +
> >> +	if (val > ASM9260_MAX_CHIPS) {
> >> +		dev_err(&pdev->dev, "Unsupported nand-max-chips value: %i\n",
> >> +				val);
> >> +		return -ENODEV;
> >> +	}
> >> +
> >> +	for (i = 0; i < val; i++)
> >> +		priv->mem_mask |= BM_CTRL_MEM0_RDY << i;
> > 
> > If you want to support multiple NAND chips, then I recommend to rework
> > the DT representation and to define a asm9260_nand_controller struct:
> > 
> > struct asm9260_nand_controller {
> > 	struct nand_hw_control base;
> > 
> > 	/* asm9260 related stuff */
> > };
> > 
> > Take a look [2] and [3].
> 
> 
> need to tak clother look. Right now i don't understand meaning of struct
> nand_hw_control.

It is there to represent an NAND flash controller, and is mainly useful
to lock access to the controller so that only one chip can be accessed
through the controller at a given time.

> 
> > 
> >> +
> >> +	ret = nand_scan_ident(mtd, val, NULL);
> >> +	if (ret) {
> >> +		dev_err(&pdev->dev, "scan_ident filed!\n");
> >> +		return ret;
> >> +	}
> >> +
> >> +	if (of_get_nand_on_flash_bbt(np)) {
> >> +		dev_info(&pdev->dev, "Use On Flash BBT\n");
> >> +		nand->bbt_options = NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB_BBM
> >> +			| NAND_BBT_LASTBLOCK;
> >> +	}
> >> +
> >> +	asm9260_nand_timing_config(priv);
> >> +	asm9260_nand_ecc_conf(priv);
> >> +	ret = asm9260_nand_cached_config(priv);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	/* second phase scan */
> >> +	if (nand_scan_tail(mtd)) {
> >> +		dev_err(&pdev->dev, "scan_tail filed!\n");
> >> +		return -ENXIO;
> >> +	}
> >> +
> >> +
> >> +	ret = mtd_device_parse_register(mtd, NULL,
> >> +			&(struct mtd_part_parser_data) {
> >> +				.of_node = pdev->dev.of_node,
> >> +			},
> >> +			NULL, 0);
> > 
> > Ergh, can you please define a local variable to replace this ugly
> > mtd_part_parser_data definition ?
> 
> why?
> 

Because I find it hard to read, but maybe I'm the only one to think
that way.
How about the following syntax:

	struct mtd_part_parser_data ppdata = {
		.of_node = pdev->dev.of_node,
	};

[...]

	ret = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);

Regards,

Boris

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L3052

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
