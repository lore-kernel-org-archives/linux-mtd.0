Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6mDF-00012K-Ms
 for linux-mtd@lists.infradead.org; Thu, 01 Jan 2015 20:19:19 +0000
Message-ID: <54A5ABA4.2090909@rempel-privat.de>
Date: Thu, 01 Jan 2015 21:18:44 +0100
From: Oleksij Rempel <linux@rempel-privat.de>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 1/3] mtd: nand: add asm9260 NFC driver
References: <20141230200946.277c56c0@bbrezillon>	<1420030733-10374-1-git-send-email-linux@rempel-privat.de>
 <20141231174859.232875d0@bbrezillon>
In-Reply-To: <20141231174859.232875d0@bbrezillon>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="We1AX4WpEOKsT2k0gKQ9sGIBxdtwFJa4r"
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--We1AX4WpEOKsT2k0gKQ9sGIBxdtwFJa4r
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 31.12.2014 um 17:48 schrieb Boris Brezillon:
> Hi Oleksij,
>=20
> You should really add a cover letter containing a changelog (updated at=

> each new version of your cover letter) so that reviewers can easily
> identify what has changed.
>=20
> While you're at it, can you add your mtd test results to the cover
> letter ?

ok.

[snip]

>> +/**
>> + * We can't read less then 32 bits on HW_FIFO_DATA. So, to make
>> + * read_byte and read_word happy, we use sort of cached 32bit read.
>> + * Note: expected values for size should be 1 or 2 bytes.
>> + */
>> +static u32 asm9260_nand_read_cached(struct mtd_info *mtd, int size)
>> +{
>> +	struct asm9260_nand_priv *priv =3D mtd_to_priv(mtd);
>> +	u8 tmp;
>> +
>> +	if ((priv->read_cache_cnt <=3D 0) || (priv->read_cache_cnt > 4)) {
>=20
>                                             ^ how can this ever happen =
?
>=20
>> +		asm9260_nand_cmd_comp(mtd, 0);
>> +		priv->read_cache =3D ioread32(priv->base + HW_FIFO_DATA);
>> +		priv->read_cache_cnt =3D 4;
>> +	}
>> +
>> +	tmp =3D priv->read_cache >> (8 * (4 - priv->read_cache_cnt));
>> +	priv->read_cache_cnt -=3D size;
>> +
>> +	return tmp;
>> +}
>> +
>> +static u8 asm9260_nand_read_byte(struct mtd_info *mtd)
>> +{
>> +	return 0xff & asm9260_nand_read_cached(mtd, 1);
>=20
> Maybe this mask operation could be done in asm9260_nand_read_cached, so=

> that you won't have to bother in read_byte/read_word functions.

it is same as "return (u8)asm9260_nand_read_cached(mtd, 1);", just makes
sure compiler do not complain.

>> +}
>> +
>> +static u16 asm9260_nand_read_word(struct mtd_info *mtd)
>> +{
>> +	return 0xffff & asm9260_nand_read_cached(mtd, 2);
>=20
> You'd better always use read_word, cause if you call read_byte once
> then read_word twice, you'll end up with a wrong value after the second=

> read_word (3 bytes consumed, which means there's only 1 remaining byte
> and you're asking for 2).

nand_base use both functions. how can i use only one? For example:
        chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);

        /* Read entire ID string */
        for (i =3D 0; i < 8; i++)
                id_data[i] =3D chip->read_byte(mtd);

this wont work with read_word.


>> +}
>> +
>> +static void asm9260_nand_read_buf(struct mtd_info *mtd, u8 *buf, int =
len)
>> +{
>> +	struct asm9260_nand_priv *priv =3D mtd_to_priv(mtd);
>> +	dma_addr_t dma_addr;
>> +	int dma_ok =3D 0;
>> +
>> +	if (len & 0x3) {
>> +		dev_err(priv->dev, "Unsupported length (%x)\n", len);
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * I hate you UBI for your all vmalloc. Be slow as hell with PIO.
>> +	 * ~ with love from ZeroCopy ~
>> +	 */
>> +	if (!is_vmalloc_addr(buf)) {
>> +		dma_addr =3D asm9260_nand_dma_set(mtd, buf, DMA_FROM_DEVICE, len);
>> +		dma_ok =3D !(dma_mapping_error(priv->dev, dma_addr));
>> +	}
>> +	asm9260_nand_cmd_comp(mtd, dma_ok);
>> +
>> +	if (dma_ok) {
>> +		dma_sync_single_for_cpu(priv->dev, dma_addr, len,
>> +				DMA_FROM_DEVICE);
>> +		dma_unmap_single(priv->dev, dma_addr, len, DMA_FROM_DEVICE);
>> +		return;
>> +	}
>> +
>> +	/* fall back to pio mode */
>> +	len >>=3D 2;
>> +	ioread32_rep(priv->base + HW_FIFO_DATA, buf, len);
>=20
> Hm, what if the buf is not aligned on 32bit, or len is not a multiple
> of 4 ?

I can read only buf =3D=3D page size. All page sizes suported by this
controller are aligned. See "if (len & 0x3) {", and take a look at
asm9260_nand_read_cached - we can read only 32bit.


>> +}
>> +
>> +static void asm9260_nand_write_buf(struct mtd_info *mtd,
>> +		const u8 *buf, int len)
>> +{
>> +	struct asm9260_nand_priv *priv =3D mtd_to_priv(mtd);
>> +	dma_addr_t dma_addr;
>> +	int dma_ok =3D 0;
>> +
>> +	if (len & 0x3) {
>> +		dev_err(priv->dev, "Unsupported length (%x)\n", len);
>> +		return;
>> +	}
>> +
>> +	if (!is_vmalloc_addr(buf)) {
>> +		dma_addr =3D asm9260_nand_dma_set(mtd,
>> +				(void *)buf, DMA_TO_DEVICE, len);
>> +		dma_ok =3D !(dma_mapping_error(priv->dev, dma_addr));
>> +	}
>> +
>> +	if (dma_ok)
>> +		dma_sync_single_for_device(priv->dev, dma_addr, len,
>> +				DMA_TO_DEVICE);
>> +	asm9260_nand_cmd_comp(mtd, dma_ok);
>> +
>> +	if (dma_ok) {
>> +		dma_unmap_single(priv->dev, dma_addr, len, DMA_TO_DEVICE);
>> +		return;
>> +	}
>> +
>> +	/* fall back to pio mode */
>> +	len >>=3D 2;
>> +	iowrite32_rep(priv->base + HW_FIFO_DATA, buf, len);
>=20
> Ditto
>=20
>> +}
>> +
>> +static int asm9260_nand_write_page_raw(struct mtd_info *mtd,
>> +		struct nand_chip *chip, const u8 *buf,
>> +		int oob_required)
>> +{
>> +	struct asm9260_nand_priv *priv =3D mtd_to_priv(mtd);
>> +
>> +	chip->write_buf(mtd, buf, mtd->writesize);
>> +	if (oob_required)
>> +		chip->ecc.write_oob(mtd, chip, priv->page_cache &
>> +				chip->pagemask);
>=20
> Can't you just call
> 		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>=20
> And if it works, then you can just drop this raw function since the
> default one does the exact same thing.

There 3 variants:
- allocate dma =3D=3D page + oob; and copy each buffer
- use pio and read out oob even if it was not requested
- use dma_map_single, avoid buffer copying, and request oob if needed.

i use last variant even if it meane sending a command to request oob.

>=20
>> +	return 0;
>> +}
>> +
>> +static int asm9260_nand_write_page_hwecc(struct mtd_info *mtd,
>> +		struct nand_chip *chip, const u8 *buf,
>> +		int oob_required)
>> +{
>> +	struct asm9260_nand_priv *priv =3D mtd_to_priv(mtd);
>> +
>> +	asm9260_reg_rmw(priv, HW_CTRL, BM_CTRL_ECC_EN, 0);
>> +	chip->ecc.write_page_raw(mtd, chip, buf, oob_required);
>> +
>> +	return 0;
>> +}
>> +
>> +static unsigned int asm9260_nand_count_ecc(struct asm9260_nand_priv *=
priv)
>> +{
>> +	u32 tmp, i, count, maxcount =3D 0;
>> +
>> +	/* FIXME: this layout was tested only on 2048byte NAND.
>> +	 * NANDs with bigger page size should use more registers. */
>=20
> Yep, you should really fix that, or at least reject NAND with a
> different page size until you've fixed that.

ok.

>> +	tmp =3D ioread32(priv->base + HW_ECC_ERR_CNT);
>> +	for (i =3D 0; i < 4; i++) {
>> +		count =3D 0x1f & (tmp >> (5 * i));
>> +		maxcount =3D max_t(unsigned int, maxcount, count);
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static int asm9260_nand_read_page_hwecc(struct mtd_info *mtd,
>> +		struct nand_chip *chip, u8 *buf,
>> +		int oob_required, int page)
>> +{
>> +	struct asm9260_nand_priv *priv =3D mtd_to_priv(mtd);
>> +	u8 *temp_ptr;
>> +	u32 status, max_bitflips =3D 0;
>> +
>> +	temp_ptr =3D buf;
>> +
>> +	/* enable ecc */
>> +	asm9260_reg_rmw(priv, HW_CTRL, BM_CTRL_ECC_EN, 0);
>> +	chip->read_buf(mtd, temp_ptr, mtd->writesize);
>> +
>> +	status =3D ioread32(priv->base + HW_ECC_CTRL);
>> +
>> +	if (status & BM_ECC_ERR_UNC) {
>> +		u32 ecc_err;
>> +
>> +		ecc_err =3D ioread32(priv->base + HW_ECC_ERR_CNT);
>> +		/* check if it is erased page (all_DATA_OOB =3D=3D 0xff) */
>> +		/* FIXME: should be tested if it is a bullet proof solution.
>> +		 *  if not, use is_buf_blank. */
>=20
> you'd rather use is_buf_blank if you're unsure.

ok, can is_buf_blank be moved to nand_base?

>=20
>> +		if (ecc_err !=3D 0x8421)
>> +			mtd->ecc_stats.failed++;
>> +
>> +	} else if (status & BM_ECC_ERR_CORRECT) {
>> +		max_bitflips =3D asm9260_nand_count_ecc(priv);
>=20
> max_bitflips should contain the maximum number of bitflips in all
> ECC blocks of a given page, here you just returning the number of
> bitflips in the last ECC block.

no. see asm9260_nand_count_ecc.

> The following should do the trick:
>=20
> 		int bitflips =3D asm9260_nand_count_ecc(priv);
>=20
> 		if (bitflips > max_bitflips)
> 			max_bitflips =3D bitflips;
>=20
> 		mtd->ecc_stats.corrected +=3D bitflips;
>=20
>> +		mtd->ecc_stats.corrected +=3D max_bitflips;
>> +	}
>> +
>> +	if (oob_required)
>> +		chip->ecc.read_oob(mtd, chip, page);
>> +
>> +	return max_bitflips;
>> +}
>> +
>> +static irqreturn_t asm9260_nand_irq(int irq, void *device_info)
>> +{
>> +	struct asm9260_nand_priv *priv =3D device_info;
>> +	struct nand_chip *nand =3D &priv->nand;
>> +	u32 status;
>> +
>> +	status =3D ioread32(priv->base + HW_INT_STATUS);
>> +	if (!status)
>> +		return IRQ_NONE;
>> +
>> +	iowrite32(0, priv->base + HW_INT_MASK);
>> +	iowrite32(0, priv->base + HW_INT_STATUS);
>> +	priv->irq_done =3D 1;
>=20
> You should test the flags before deciding the irq is actually done...

ok. if fixed it by changing mem_mask logic.

>=20
>> +	wake_up(&nand->controller->wq);
>=20
> and if the condition is not met, don't wake up the waitqueue.
>=20
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static void __init asm9260_nand_init_chip(struct nand_chip *nand_chip=
)
>> +{
>> +	nand_chip->select_chip	=3D asm9260_select_chip;
>> +	nand_chip->cmdfunc	=3D asm9260_nand_command_lp;
>=20
> You seems to only support large pages NANDs (> 512 bytes), maybe you
> should check if the discovered chip has large pages, and reject the NAN=
D
> otherwise.

ok.

>> +	nand_chip->read_byte	=3D asm9260_nand_read_byte;
>> +	nand_chip->read_word	=3D asm9260_nand_read_word;
>> +	nand_chip->read_buf	=3D asm9260_nand_read_buf;
>> +	nand_chip->write_buf	=3D asm9260_nand_write_buf;
>> +
>> +	nand_chip->dev_ready	=3D asm9260_nand_dev_ready;
>> +	nand_chip->chip_delay	=3D 100;
>> +	nand_chip->options	|=3D NAND_NO_SUBPAGE_WRITE;
>> +
>> +	nand_chip->ecc.write_page	=3D asm9260_nand_write_page_hwecc;
>> +	nand_chip->ecc.write_page_raw	=3D asm9260_nand_write_page_raw;
>> +	nand_chip->ecc.read_page	=3D asm9260_nand_read_page_hwecc;
>> +}
>> +
>> +static int __init asm9260_nand_cached_config(struct asm9260_nand_priv=
 *priv)
>> +{
>> +	struct nand_chip *nand =3D &priv->nand;
>> +	struct mtd_info *mtd =3D &priv->mtd;
>> +	u32 addr_cycles, col_cycles, pages_per_block;
>> +
>> +	pages_per_block =3D mtd->erasesize / mtd->writesize;
>> +	/* max 256P, min 32P */
>> +	if (pages_per_block & ~(0x000001e0)) {
>> +		dev_err(priv->dev, "Unsupported erasesize 0x%x\n",
>> +				mtd->erasesize);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* max 32K, min 256. */
>> +	if (mtd->writesize & ~(0x0000ff00)) {
>> +		dev_err(priv->dev, "Unsupported writesize 0x%x\n",
>> +				mtd->erasesize);
>> +		return -EINVAL;
>> +	}
>> +
>> +	col_cycles  =3D 2;
>> +	addr_cycles =3D col_cycles +
>> +		(((mtd->size >> mtd->writesize) > 65536) ? 3 : 2);
>> +
>> +	priv->ctrl_cache =3D addr_cycles << BM_CTRL_ADDR_CYCLE1_S
>> +		| BM_CTRL_PAGE_SIZE(mtd->writesize) << BM_CTRL_PAGE_SIZE_S
>> +		| BM_CTRL_BLOCK_SIZE(pages_per_block) << BM_CTRL_BLOCK_SIZE_S
>> +		| BM_CTRL_INT_EN
>> +		| addr_cycles << BM_CTRL_ADDR_CYCLE0_S;
>> +
>> +	iowrite32(BM_ECC_CAPn(nand->ecc.strength) << BM_ECC_CAP_S,
>> +			priv->base + HW_ECC_CTRL);
>> +
>> +	iowrite32(mtd->writesize + priv->spare_size,
>> +			priv->base + HW_ECC_OFFSET);
>> +
>> +	return 0;
>> +}
>> +
>> +static unsigned long __init clk_get_cyc_from_ns(struct clk *clk,
>> +		unsigned long ns)
>> +{
>> +	unsigned int cycle;
>> +
>> +	cycle =3D NSEC_PER_SEC / clk_get_rate(clk);
>> +	return DIV_ROUND_CLOSEST(ns, cycle);
>> +}
>> +
>> +static void __init asm9260_nand_timing_config(struct asm9260_nand_pri=
v *priv)
>> +{
>> +	struct nand_chip *nand =3D &priv->nand;
>> +	const struct nand_sdr_timings *time;
>> +	u32 twhr, trhw, trwh, trwp, tadl, tccs, tsync, trr, twb;
>> +	int mode;
>> +
>=20
> Maybe you should add support for ONFI timing mode retrieval with
> onfi_get_async_timing_mode.

instead of nand->onfi_timing_mode_default?

>> +	mode =3D nand->onfi_timing_mode_default;
>> +	dev_info(priv->dev, "ONFI timing mode: %i\n", mode);
>> +
>> +	time =3D onfi_async_timing_mode_to_sdr_timings(mode);
>> +	if (IS_ERR_OR_NULL(time)) {
>> +		dev_err(priv->dev, "Can't get onfi_timing_mode: %i\n", mode);
>> +		return;
>> +	}
>> +
>> +	trwh =3D clk_get_cyc_from_ns(priv->clk, time->tWH_min / 1000);
>> +	trwp =3D clk_get_cyc_from_ns(priv->clk, time->tWP_min / 1000);
>> +
>> +	iowrite32((trwh << 4) | (trwp), priv->base + HW_TIMING_ASYN);
>> +
>> +	twhr =3D clk_get_cyc_from_ns(priv->clk, time->tWHR_min / 1000);
>> +	trhw =3D clk_get_cyc_from_ns(priv->clk, time->tRHW_min / 1000);
>> +	tadl =3D clk_get_cyc_from_ns(priv->clk, time->tADL_min / 1000);
>> +	/* tCCS - change read/write collumn. Time between last cmd and data.=
 */
>> +	tccs =3D clk_get_cyc_from_ns(priv->clk,
>> +			(time->tCLR_min + time->tCLH_min + time->tRC_min)
>> +			/ 1000);
>> +
>> +	iowrite32((twhr << 24) | (trhw << 16)
>> +		| (tadl << 8) | (tccs), priv->base + HW_TIM_SEQ_0);
>> +
>> +	trr =3D clk_get_cyc_from_ns(priv->clk, time->tRR_min / 1000);
>> +	tsync =3D 0; /* ??? */
>> +	twb =3D clk_get_cyc_from_ns(priv->clk, time->tWB_max / 1000);
>> +	iowrite32((tsync << 16) | (trr << 9) | (twb),
>> +			priv->base + HW_TIM_SEQ_1);
>> +}
>> +
>> +static int __init asm9260_nand_ecc_conf(struct asm9260_nand_priv *pri=
v)
>> +{
>> +	struct device_node *np =3D priv->dev->of_node;
>> +	struct nand_chip *nand =3D &priv->nand;
>> +	struct mtd_info *mtd =3D &priv->mtd;
>> +	struct nand_ecclayout *ecc_layout =3D &priv->ecc_layout;
>> +	int i, ecc_strength;
>> +
>> +	nand->ecc.mode =3D of_get_nand_ecc_mode(np);
>> +	switch (nand->ecc.mode) {
>> +	case NAND_ECC_SOFT:
>> +	case NAND_ECC_SOFT_BCH:
>> +		dev_info(priv->dev, "Using soft ECC %i\n", nand->ecc.mode);
>> +		/* nand_base will find needed settings */
>> +		return 0;
>> +	case NAND_ECC_HW:
>> +	default:
>> +		dev_info(priv->dev, "Using default NAND_ECC_HW\n");
>> +		nand->ecc.mode =3D NAND_ECC_HW;
>> +		break;
>> +	}
>> +
>> +	ecc_strength =3D of_get_nand_ecc_strength(np);
>> +	nand->ecc.size =3D ASM9260_ECC_STEP;
>> +	nand->ecc.steps =3D mtd->writesize / nand->ecc.size;
>> +
>> +	if (ecc_strength < nand->ecc_strength_ds) {
>> +		int ds_corr;
>> +
>> +		/* Let's check if ONFI can help us. */
>> +		if (nand->ecc_strength_ds <=3D 0) {
>=20
> Actually this is not necessarily filled by ONFI parameters (it can be
> statically defined in the nand_ids table).

Should i sepcify it by dev_err or enough to say it in comment?

>> +			/* No ONFI and no DT - it is bad. */
>> +			dev_err(priv->dev,
>> +					"nand-ecc-strength is not set by DT or ONFI. Please set nand-ecc=
-strength in DT or add chip quirk in nand_ids.c.\n");
>> +			return -EINVAL;
>> +		}
>> +
>> +		ds_corr =3D (mtd->writesize * nand->ecc_strength_ds) /
>> +			nand->ecc_step_ds;
>> +		ecc_strength =3D ds_corr / nand->ecc.steps;
>> +		dev_info(priv->dev, "ONFI:nand-ecc-strength =3D %i\n",
>> +				ecc_strength);
>> +	} else
>> +		dev_info(priv->dev, "DT:nand-ecc-strength =3D %i\n",
>> +				ecc_strength);
>> +
>> +	if (ecc_strength =3D=3D 0 || ecc_strength > ASM9260_ECC_MAX_BIT) {
>> +		dev_err(priv->dev,
>> +				"Not supported ecc_strength value: %i\n",
>> +				ecc_strength);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ecc_strength & 0x1) {
>> +		ecc_strength++;
>> +		dev_info(priv->dev,
>> +				"Only even ecc_strength value is supported. Recalculating: %i\n",=

>> +		       ecc_strength);
>> +	}
>> +
>> +	/* FIXME: do we have max or min page size? */
>> +
>> +	/* 13 - the smallest integer for 512 (ASM9260_ECC_STEP). Div to 8bit=
=2E */
>> +	nand->ecc.bytes =3D DIV_ROUND_CLOSEST(ecc_strength * 13, 8);
>> +
>> +	ecc_layout->eccbytes =3D nand->ecc.bytes * nand->ecc.steps;
>> +	nand->ecc.layout =3D ecc_layout;
>> +	nand->ecc.strength =3D ecc_strength;
>> +
>> +	priv->spare_size =3D mtd->oobsize - ecc_layout->eccbytes;
>> +
>> +	ecc_layout->oobfree[0].offset =3D 2;
>> +	ecc_layout->oobfree[0].length =3D priv->spare_size - 2;
>> +
>> +	/* FIXME: can we use same layout as SW_ECC? */
>=20
> It depends on what your controller is capable of. If you can define the=

> offset at which you write the ECC bytes, then yes you can reuse the
> same kind of layout used in SW_ECC.
>=20
>> +	for (i =3D 0; i < ecc_layout->eccbytes; i++)
>> +		ecc_layout->eccpos[i] =3D priv->spare_size + i;
>> +
>> +	return 0;
>> +}
>> +
>> +static int __init asm9260_nand_get_dt_clks(struct asm9260_nand_priv *=
priv)
>> +{
>> +	int clk_idx =3D 0, err;
>> +
>> +	priv->clk =3D devm_clk_get(priv->dev, "sys");
>> +	if (IS_ERR(priv->clk))
>> +		goto out_err;
>> +
>> +	/* configure AHB clock */
>> +	clk_idx =3D 1;
>> +	priv->clk_ahb =3D devm_clk_get(priv->dev, "ahb");
>> +	if (IS_ERR(priv->clk_ahb))
>> +		goto out_err;
>> +
>> +	err =3D clk_prepare_enable(priv->clk_ahb);
>> +	if (err)
>> +		dev_err(priv->dev, "Failed to enable ahb_clk!\n");
>> +
>> +	err =3D clk_set_rate(priv->clk, clk_get_rate(priv->clk_ahb));
>> +	if (err) {
>> +		clk_disable_unprepare(priv->clk_ahb);
>> +		dev_err(priv->dev, "Failed to set rate!\n");
>> +	}
>> +
>> +	err =3D clk_prepare_enable(priv->clk);
>> +	if (err) {
>> +		clk_disable_unprepare(priv->clk_ahb);
>> +		dev_err(priv->dev, "Failed to enable clk!\n");
>> +	}
>> +
>> +	return 0;
>> +out_err:
>> +	dev_err(priv->dev, "%s: Failed to get clk (%i)\n", __func__, clk_idx=
);
>> +	return 1;
>> +}
>> +
>> +static int __init asm9260_nand_probe(struct platform_device *pdev)
>> +{
>> +	struct asm9260_nand_priv *priv;
>> +	struct nand_chip *nand;
>> +	struct mtd_info *mtd;
>> +	struct device_node *np =3D pdev->dev.of_node;
>> +	struct resource *r;
>> +	int ret, i;
>> +	unsigned int irq;
>> +	u32 val;
>> +
>> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(struct asm9260_nand_priv),
>> +			GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	priv->base =3D devm_ioremap_resource(&pdev->dev, r);
>> +	if (!priv->base) {
>> +		dev_err(&pdev->dev, "Unable to map resource!\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	priv->dev =3D &pdev->dev;
>> +	nand =3D &priv->nand;
>> +	nand->priv =3D priv;
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +	mtd =3D &priv->mtd;
>> +	mtd->priv =3D nand;
>> +	mtd->owner =3D THIS_MODULE;
>> +	mtd->name =3D dev_name(&pdev->dev);
>> +
>> +	if (asm9260_nand_get_dt_clks(priv))
>> +		return -ENODEV;
>> +
>> +	irq =3D platform_get_irq(pdev, 0);
>> +	if (!irq)
>> +		return -ENODEV;
>> +
>> +	iowrite32(0, priv->base + HW_INT_MASK);
>> +	ret =3D devm_request_irq(priv->dev, irq, asm9260_nand_irq,
>> +				IRQF_ONESHOT | IRQF_SHARED,
>> +				dev_name(&pdev->dev), priv);
>> +
>> +	asm9260_nand_init_chip(nand);
>> +
>> +	ret =3D of_property_read_u32(np, "nand-max-chips", &val);
>> +	if (ret)
>> +		val =3D 1;
>> +
>> +	if (val > ASM9260_MAX_CHIPS) {
>> +		dev_err(&pdev->dev, "Unsupported nand-max-chips value: %i\n",
>> +				val);
>> +		return -ENODEV;
>> +	}
>> +
>> +	for (i =3D 0; i < val; i++)
>> +		priv->mem_mask |=3D BM_CTRL_MEM0_RDY << i;
>=20
> If you want to support multiple NAND chips, then I recommend to rework
> the DT representation and to define a asm9260_nand_controller struct:
>=20
> struct asm9260_nand_controller {
> 	struct nand_hw_control base;
>=20
> 	/* asm9260 related stuff */
> };
>=20
> Take a look [2] and [3].


need to tak clother look. Right now i don't understand meaning of struct
nand_hw_control.

>=20
>> +
>> +	ret =3D nand_scan_ident(mtd, val, NULL);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "scan_ident filed!\n");
>> +		return ret;
>> +	}
>> +
>> +	if (of_get_nand_on_flash_bbt(np)) {
>> +		dev_info(&pdev->dev, "Use On Flash BBT\n");
>> +		nand->bbt_options =3D NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB_BBM
>> +			| NAND_BBT_LASTBLOCK;
>> +	}
>> +
>> +	asm9260_nand_timing_config(priv);
>> +	asm9260_nand_ecc_conf(priv);
>> +	ret =3D asm9260_nand_cached_config(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* second phase scan */
>> +	if (nand_scan_tail(mtd)) {
>> +		dev_err(&pdev->dev, "scan_tail filed!\n");
>> +		return -ENXIO;
>> +	}
>> +
>> +
>> +	ret =3D mtd_device_parse_register(mtd, NULL,
>> +			&(struct mtd_part_parser_data) {
>> +				.of_node =3D pdev->dev.of_node,
>> +			},
>> +			NULL, 0);
>=20
> Ergh, can you please define a local variable to replace this ugly
> mtd_part_parser_data definition ?

why?

--=20
Regards,
Oleksij


--We1AX4WpEOKsT2k0gKQ9sGIBxdtwFJa4r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iF4EAREIAAYFAlSlq6oACgkQHwImuRkmbWmEzgD+IW+yJIzbPGGhmsCfjwgnSJX+
vzdK2OmodzHbccequEcA/0uxqVyj6c0CW/T51z769hd9AZBXUSihXzu857AZ7T0L
=sdaP
-----END PGP SIGNATURE-----

--We1AX4WpEOKsT2k0gKQ9sGIBxdtwFJa4r--
