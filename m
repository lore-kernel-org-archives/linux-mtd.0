Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5ACC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 08:51:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4F7920756
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 08:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R9A42qVp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4F7920756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MfiKtU7wYAyVAmFb7DqGVZGenhmS+PQ1jRAK7vlo8fY=; b=R9A42qVp/Htbu9
	6FOcbZDeRdQ8wWeLLLWyi2n3HTRpV5BP5rlrSvJUD32w7S6WGSqd71QXNM2MeadMDAnpDPSsNCUmT
	Nh+3EaL6lTwGiTV5EDrn/bIi/zliTEsRe8KTBJXqu/1D8FbNFI9VSc8Eij7lRYo5gsBAgLvPPuF80
	u1mLr16qGu05fOZ/IQl6xro5XJuUS1+MnV/3oINkDFv8DulYPZyTV6J+ngmV/DognSHKPfOC+F8SP
	Dxr8MdABUziXoXzIYHgI2njwDZaleAdZnmR847ktzUCLZJgZ03Cm6ZaO5w3j0ZuARSqX0G8EoUmJC
	tdWuGcaNz8/u7E1kvUqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaxyQ-000493-2h; Tue, 19 May 2020 08:51:42 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaxyM-00048N-OG
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 08:51:40 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 57A1C2A00EB;
 Tue, 19 May 2020 09:51:35 +0100 (BST)
Date: Tue, 19 May 2020 10:51:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 8/8] mtd: rawnand: arasan: Support the hardware BCH
 ECC engine
Message-ID: <20200519105132.4cc2fd18@collabora.com>
In-Reply-To: <20200519074549.23673-9-miquel.raynal@bootlin.com>
References: <20200519074549.23673-1-miquel.raynal@bootlin.com>
 <20200519074549.23673-9-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_015139_054066_F943D7A4 
X-CRM114-Status: GOOD (  31.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 19 May 2020 09:45:49 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Add support for the hardware ECC BCH engine.
> 
> Please mind that this engine has an important limitation:
> BCH implementation does not inform the user when an uncorrectable ECC
> error occurs. To workaround this, we avoid using the hardware engine
> in the read path and do the computation with the software BCH
> implementation, which is faster than mixing hardware (for correction)
> and software (for verification).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/arasan-nand-controller.c | 342 ++++++++++++++++++
>  1 file changed, 342 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
> index 03d95ee1488b..cd0e11a25ec7 100644
> --- a/drivers/mtd/nand/raw/arasan-nand-controller.c
> +++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
> @@ -10,6 +10,7 @@
>   *   Naga Sureshkumar Relli <nagasure@xilinx.com>
>   */
>  
> +#include <linux/bch.h>
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> @@ -144,6 +145,11 @@ struct anfc_op {
>   * @strength:		Register value of the ECC strength
>   * @raddr_cycles:	Row address cycle information
>   * @caddr_cycles:	Column address cycle information
> + * @ecc_bits:		Exact number of ECC bits per syndrome
> + * @ecc_total:		Total number of ECC bytes
> + * @errloc:		Array of errors located with soft BCH
> + * @hw_ecc:		Buffer to store syndromes computed by hardware
> + * @bch:		BCH structure
>   */
>  struct anand {
>  	struct list_head node;
> @@ -157,6 +163,11 @@ struct anand {
>  	u32 strength;
>  	u16 raddr_cycles;
>  	u16 caddr_cycles;
> +	unsigned int ecc_bits;
> +	unsigned int ecc_total;
> +	unsigned int *errloc;
> +	u8 *hw_ecc;
> +	struct bch_control *bch;
>  };
>  
>  /**
> @@ -261,6 +272,194 @@ static int anfc_pkt_len_config(unsigned int len, unsigned int *steps,
>  	return 0;
>  }
>  
> +/*
> + * When using the embedded hardware ECC engine, the controller is in charge of
> + * feeding the engine with, first, the ECC residue present in the data array.
> + * A typical read operation is:
> + * 1/ Assert the read operation by sending the relevant command/address cycles
> + *    but targeting the column of the first ECC bytes in the OOB area instead of
> + *    the main data directly.
> + * 2/ After having read the relevant number of ECC bytes, the controller uses
> + *    the RNDOUT/RNDSTART commands which are set into the "ECC Spare Command
> + *    Register" to move the pointer back at the beginning of the main data.
> + * 3/ It will read the content of the main area for a given size (pktsize) and
> + *    will feed the ECC engine with this buffer again.
> + * 4/ The ECC engine derives the ECC bytes for the given data and compare them
> + *    with the ones already received. It eventually trigger status flags and
> + *    then set the "Buffer Read Ready" flag.
> + * 5/ The corrected data is then available for reading from the data port
> + *    register.
> + *
> + * The hardware BCH ECC engine is known to be inconstent in BCH mode and never
> + * reports uncorrectable errors. Because of this bug, we have to use the
> + * software BCH implementation in the read path.
> + */
> +static int anfc_read_page_hw_ecc(struct nand_chip *chip, u8 *buf,
> +				 int oob_required, int page)
> +{
> +	struct arasan_nfc *nfc = to_anfc(chip->controller);
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct anand *anand = to_anand(chip);
> +	unsigned int len = mtd->writesize + (oob_required ? mtd->oobsize : 0);
> +	unsigned int max_bitflips = 0;
> +	dma_addr_t paddr;
> +	int step, ret;
> +	struct anfc_op nfc_op = {
> +		.pkt_reg =
> +			PKT_SIZE(chip->ecc.size) |
> +			PKT_STEPS(chip->ecc.steps),
> +		.addr1_reg =
> +			(page & 0xFF) << (8 * (anand->caddr_cycles)) |
> +			(((page >> 8) & 0xFF) << (8 * (1 + anand->caddr_cycles))),
> +		.addr2_reg =
> +			((page >> 16) & 0xFF) |
> +			ADDR2_STRENGTH(anand->strength) |
> +			ADDR2_CS(anand->cs),
> +		.cmd_reg =
> +			CMD_1(NAND_CMD_READ0) |
> +			CMD_2(NAND_CMD_READSTART) |
> +			CMD_PAGE_SIZE(anand->page_sz) |
> +			CMD_DMA_ENABLE |
> +			CMD_NADDRS(anand->caddr_cycles +
> +				   anand->raddr_cycles),
> +		.prog_reg = PROG_PGRD,
> +	};
> +
> +	paddr = dma_map_single(nfc->dev, (void *)buf, len, DMA_FROM_DEVICE);
> +	if (dma_mapping_error(nfc->dev, paddr)) {
> +		dev_err(nfc->dev, "Buffer mapping error");
> +		return -EIO;
> +	}
> +
> +	writel_relaxed(paddr, nfc->base + DMA_ADDR0_REG);
> +	writel_relaxed((paddr >> 32), nfc->base + DMA_ADDR1_REG);
> +
> +	anfc_trigger_op(nfc, &nfc_op);
> +
> +	ret = anfc_wait_for_event(nfc, XFER_COMPLETE);
> +	dma_unmap_single(nfc->dev, paddr, len, DMA_FROM_DEVICE);
> +	if (ret) {
> +		dev_err(nfc->dev, "Error reading page %d\n", page);
> +		return ret;
> +	}
> +
> +	/* Store the raw OOB bytes as well */
> +	ret = nand_change_read_column_op(chip, mtd->writesize, chip->oob_poi,
> +					 mtd->oobsize, 0);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * For each step, compute by softare the BCH syndrome over the raw data.
> +	 * Compare the theoretical amount of errors and compare with the
> +	 * hardware engine feedback.
> +	 */
> +	for (step = 0; step < chip->ecc.steps; step++) {
> +		u8 *raw_buf = &buf[step * chip->ecc.size];
> +		unsigned int bit, byte;
> +		int bf, i;
> +
> +		/* Extract the syndrome, it is not necessarily aligned */
> +		memset(anand->hw_ecc, 0, chip->ecc.bytes);
> +		nand_extract_bits(anand->hw_ecc, 0,
> +				  &chip->oob_poi[mtd->oobsize - anand->ecc_total],
> +				  anand->ecc_bits * step, anand->ecc_bits);
> +
> +		bf = bch_decode(anand->bch, raw_buf, chip->ecc.size,
> +				anand->hw_ecc, NULL, NULL, anand->errloc);
> +		if (!bf) {
> +			continue;
> +		} else if (bf > 0) {
> +			for (i = 0; i < bf; i++) {
> +				/* Only correct the data, not the syndrome */
> +				if (anand->errloc[i] < (chip->ecc.size * 8)) {
> +					bit = BIT(anand->errloc[i] & 7);
> +					byte = anand->errloc[i] >> 3;
> +					raw_buf[byte] ^= bit;
> +				}
> +			}
> +
> +			mtd->ecc_stats.corrected += bf;
> +			max_bitflips = max_t(unsigned int, max_bitflips, bf);
> +
> +			continue;
> +		}
> +
> +		bf = nand_check_erased_ecc_chunk(raw_buf, chip->ecc.size,
> +						 NULL, 0, NULL, 0,
> +						 chip->ecc.strength);
> +		if (bf > 0) {
> +			mtd->ecc_stats.corrected += bf;
> +			max_bitflips = max_t(unsigned int, max_bitflips, bf);
> +			memset(raw_buf, 0xFF, chip->ecc.size);
> +		} else if (bf < 0) {
> +			mtd->ecc_stats.failed++;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int anfc_write_page_hw_ecc(struct nand_chip *chip, const u8 *buf,
> +				  int oob_required, int page)
> +{
> +	struct anand *anand = to_anand(chip);
> +	struct arasan_nfc *nfc = to_anfc(chip->controller);
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	unsigned int len = mtd->writesize + (oob_required ? mtd->oobsize : 0);
> +	dma_addr_t paddr;
> +	int ret;
> +	struct anfc_op nfc_op = {
> +		.pkt_reg =
> +			PKT_SIZE(chip->ecc.size) |
> +			PKT_STEPS(chip->ecc.steps),
> +		.addr1_reg =
> +			(page & 0xFF) << (8 * (anand->caddr_cycles)) |
> +			(((page >> 8) & 0xFF) << (8 * (1 + anand->caddr_cycles))),
> +		.addr2_reg =
> +			((page >> 16) & 0xFF) |
> +			ADDR2_STRENGTH(anand->strength) |
> +			ADDR2_CS(anand->cs),
> +		.cmd_reg =
> +			CMD_1(NAND_CMD_SEQIN) |
> +			CMD_2(NAND_CMD_PAGEPROG) |
> +			CMD_PAGE_SIZE(anand->page_sz) |
> +			CMD_DMA_ENABLE |
> +			CMD_NADDRS(anand->caddr_cycles +
> +				   anand->raddr_cycles) |
> +			CMD_ECC_ENABLE,
> +		.prog_reg = PROG_PGPROG,
> +	};
> +
> +	writel_relaxed(anand->ecc_conf, nfc->base + ECC_CONF_REG);
> +	writel_relaxed(ECC_SP_CMD1(NAND_CMD_RNDIN) |
> +		       ECC_SP_ADDRS(anand->caddr_cycles),
> +		       nfc->base + ECC_SP_REG);
> +
> +	paddr = dma_map_single(nfc->dev, (void *)buf, len, DMA_TO_DEVICE);
> +	if (dma_mapping_error(nfc->dev, paddr)) {
> +		dev_err(nfc->dev, "Buffer mapping error");
> +		return -EIO;
> +	}
> +
> +	writel_relaxed(paddr, nfc->base + DMA_ADDR0_REG);
> +	writel_relaxed((paddr >> 32), nfc->base + DMA_ADDR1_REG);
> +
> +	anfc_trigger_op(nfc, &nfc_op);
> +	ret = anfc_wait_for_event(nfc, XFER_COMPLETE);
> +	dma_unmap_single(nfc->dev, paddr, len, DMA_TO_DEVICE);
> +	if (ret) {
> +		dev_err(nfc->dev, "Error writing page %d\n", page);
> +		return ret;
> +	}
> +
> +	/* Spare data is not protected */
> +	if (oob_required)
> +		ret = nand_write_oob_std(chip, page);
> +
> +	return ret;
> +}
> +
>  /* NAND framework ->exec_op() hooks and related helpers */
>  static int anfc_parse_instructions(struct nand_chip *chip,
>  				   const struct nand_subop *subop,
> @@ -681,6 +880,138 @@ static int anfc_setup_data_interface(struct nand_chip *chip, int target,
>  	return 0;
>  }
>  
> +static int anfc_calc_hw_ecc_bytes(int step_size, int strength)
> +{
> +	unsigned int bch_gf_mag, ecc_bits;
> +
> +	switch (step_size) {
> +	case SZ_512:
> +		bch_gf_mag = 13;
> +		break;
> +	case SZ_1K:
> +		bch_gf_mag = 14;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ecc_bits = bch_gf_mag * strength;
> +
> +	return DIV_ROUND_UP(ecc_bits, 8);
> +}
> +
> +static const int anfc_hw_ecc_512_strengths[] = {4, 8, 12};
> +
> +static const int anfc_hw_ecc_1024_strengths[] = {24};
> +
> +static const struct nand_ecc_step_info anfc_hw_ecc_step_infos[] = {
> +	{
> +		.stepsize = SZ_512,
> +		.strengths = anfc_hw_ecc_512_strengths,
> +		.nstrengths = ARRAY_SIZE(anfc_hw_ecc_512_strengths),
> +	},
> +	{
> +		.stepsize = SZ_1K,
> +		.strengths = anfc_hw_ecc_1024_strengths,
> +		.nstrengths = ARRAY_SIZE(anfc_hw_ecc_1024_strengths),
> +	},
> +};
> +
> +static const struct nand_ecc_caps anfc_hw_ecc_caps = {
> +	.stepinfos = anfc_hw_ecc_step_infos,
> +	.nstepinfos = ARRAY_SIZE(anfc_hw_ecc_step_infos),
> +	.calc_ecc_bytes = anfc_calc_hw_ecc_bytes,
> +};
> +
> +static int anfc_init_hw_ecc_controller(struct arasan_nfc *nfc,
> +				       struct nand_chip *chip)
> +{
> +	struct anand *anand = to_anand(chip);
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +	unsigned int bch_prim_poly = 0, bch_gf_mag = 0, ecc_offset;
> +	int ret;
> +
> +	switch (mtd->writesize) {
> +	case SZ_512:
> +	case SZ_2K:
> +	case SZ_4K:
> +	case SZ_8K:
> +	case SZ_16K:
> +		break;
> +	default:
> +		dev_err(nfc->dev, "Unsupported page size %d\n", mtd->writesize);
> +		return -EINVAL;
> +	}
> +
> +	ret = nand_ecc_choose_conf(chip, &anfc_hw_ecc_caps, mtd->oobsize);
> +	if (ret)
> +		return ret;
> +
> +	switch (ecc->strength) {
> +	case 12:
> +		anand->strength = 0x1;
> +		break;
> +	case 8:
> +		anand->strength = 0x2;
> +		break;
> +	case 4:
> +		anand->strength = 0x3;
> +		break;
> +	case 24:
> +		anand->strength = 0x4;
> +		break;
> +	default:
> +		dev_err(nfc->dev, "Unsupported strength %d\n", ecc->strength);
> +		return -EINVAL;
> +	}
> +
> +	switch (ecc->size) {
> +	case SZ_512:
> +		bch_gf_mag = 13;
> +		bch_prim_poly = 0x201b;
> +		break;
> +	case SZ_1K:
> +		bch_gf_mag = 14;
> +		bch_prim_poly = 0x4443;
> +		break;
> +	default:
> +		dev_err(nfc->dev, "Unsupported step size %d\n", ecc->strength);
> +		return -EINVAL;
> +	}
> +
> +	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
> +
> +	ecc->steps = mtd->writesize / ecc->size;
> +	ecc->algo = NAND_ECC_BCH;
> +	anand->ecc_bits = bch_gf_mag * ecc->strength;
> +	ecc->bytes = DIV_ROUND_UP(anand->ecc_bits, 8);
> +	anand->ecc_total = DIV_ROUND_UP(anand->ecc_bits * ecc->steps, 8);
> +	ecc_offset = mtd->writesize + mtd->oobsize - anand->ecc_total;
> +	anand->ecc_conf = ECC_CONF_COL(ecc_offset) |
> +			  ECC_CONF_LEN(anand->ecc_total) |
> +			  ECC_CONF_BCH_EN;
> +
> +	anand->errloc = devm_kmalloc_array(nfc->dev, ecc->strength,
> +					   sizeof(*anand->errloc), GFP_KERNEL);
> +	if (!anand->errloc)
> +		return -ENOMEM;
> +
> +	anand->hw_ecc = devm_kmalloc(nfc->dev, ecc->bytes, GFP_KERNEL);
> +	if (!anand->hw_ecc)
> +		return -ENOMEM;
> +
> +	/* Enforce bit swapping to fit the hardware */
> +	anand->bch = bch_init(bch_gf_mag, ecc->strength, bch_prim_poly, true);
> +	if (!anand->bch)
> +		return -EINVAL;
> +
> +	ecc->read_page = anfc_read_page_hw_ecc;
> +	ecc->write_page = anfc_write_page_hw_ecc;
> +
> +	return 0;
> +}
> +
>  static int anfc_attach_chip(struct nand_chip *chip)
>  {
>  	struct anand *anand = to_anand(chip);
> @@ -731,6 +1062,8 @@ static int anfc_attach_chip(struct nand_chip *chip)
>  	case NAND_ECC_ON_DIE:
>  		break;
>  	case NAND_ECC_HW:
> +		ret = anfc_init_hw_ecc_controller(nfc, chip);
> +		break;
>  	default:
>  		dev_err(nfc->dev, "Unsupported ECC mode: %d\n",
>  			chip->ecc.mode);
> @@ -740,10 +1073,19 @@ static int anfc_attach_chip(struct nand_chip *chip)
>  	return ret;
>  }
>  
> +static void anfc_detach_chip(struct nand_chip *chip)
> +{
> +	struct anand *anand = to_anand(chip);
> +
> +	if (anand->bch)
> +		bch_free(anand->bch);
> +}
> +
>  static const struct nand_controller_ops anfc_ops = {
>  	.exec_op = anfc_exec_op,
>  	.setup_data_interface = anfc_setup_data_interface,
>  	.attach_chip = anfc_attach_chip,
> +	.detach_chip = anfc_detach_chip,
>  };
>  
>  static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
