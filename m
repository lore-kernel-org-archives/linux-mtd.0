Date: Tue, 19 Apr 2016 18:42:37 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org, linux-mtd@lists.infradead.org,
 xiaolei.li@mediatek.com, daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
Message-ID: <20160419184237.62646214@bbrezillon>
In-Reply-To: <5716402F.8060908@linaro.org>
References: <1460393772-26910-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1460393772-26910-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160418001751.286edf83@bbrezillon> <5716402F.8060908@linaro.org>
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

Hi Jorge,

On Tue, 19 Apr 2016 10:26:55 -0400
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> >> +static irqreturn_t mtk_ecc_irq(int irq, void *id)
> >> +{
> >> +	struct mtk_ecc *ecc = id;
> >> +	u32 dec, enc;
> >> +
> >> +	dec = readw(ecc->regs + ECC_DECIRQ_STA) & DEC_IRQEN;
> >> +	enc = readl(ecc->regs + ECC_ENCIRQ_STA) & ENC_IRQEN;
> >> +
> >> +	if (!(dec || enc))
> >> +		return IRQ_NONE;
> >> +
> >> +	if (dec) {
> >> +		dec = readw(ecc->regs + ECC_DECDONE);
> >> +		if (dec & ecc->sec_mask) {
> >> +			ecc->sec_mask = 0;
> >> +			complete(&ecc->done);
> > If you can really do enc and dec in parallel, then you should have two
> > waitqueues.
> 
> 
> unfortunately no, we can't do parallel operations.

That's not a problem, as long a you get exclusive access to the engine
when launching an operation.

Given this new input, I'd suggest reworking a bit the ECC interface.
How about providing an mtk_ecc_enable() function where you'll pass the
direction, or even better, the config which would contain the direction
(encoding or decoding), the ECC strength and step-size (maybe we
should also pass the ECC_MODE: NFI, DMA or whatever).

Similarly to the mtk_ecc_enable() function you would have an
mtk_ecc_disable() which would disable everything.

[...]
> >
> >> +{
> > Not sure this is needed right now, since the NAND driver is the only
> > user of the ECC engine (not even sure you can use the ECC engine
> > independently), and we do not support accessing chips in parallel, but
> > it may be more future proof to take a lock before using the ECC
> > encoder/decoder, and release it when the operation is finished.
> 
> Since it is not required per the current architecture (no parallel chip 
> accesses) I do have doubts about it.

Hm, given that your engine can possibly be used outside of the NAND
pipeline, I'd recommend introducing a lock and using it.
BTW, I see ECC_NFI_MODE (where NFI probably means Nand Flash
Interface) and ECC_DMA_MODE, but the ECC_ENC_MODE mask is (3 << 5). I'm
just curious, what are the other modes (if any)?

> 
> >
> > This your controller seems capable of doing ECC encoding/decoding in
> > parallel, it might be worth having 2 different locks.
> 
> I did double check with the design team and it can't.

Then having a single lock is fine.

> 
> >
> > If you decide to not use any lock, please add something in the
> > documentation, stating that it's the ECC engine user responsibility to
> > ensure serialization, and forbid several mtk_ecc_get() on the same
> > device.
> 
> ok.

Honestly, it wouldn't be a blocking aspect if you decide to skip the
locking part, but given that implementing it seems quite easy and more
future proof, I'd prefer if you do it.

> 
> >
> >> +{
> >> +	dma_addr_t addr;
> >> +	u32 *p, len;
> >> +	u32 reg, i;
> >> +	int rc, ret = 0;
> >> +
> >> +	addr = dma_map_single(ecc->dev, d->data, d->len, DMA_TO_DEVICE);
> >> +	rc = dma_mapping_error(ecc->dev, addr);
> >> +	if (rc) {
> >> +		dev_err(ecc->dev, "dma mapping error\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	/* enable the encoder in DMA mode to calculate the ECC bytes  */
> >> +	reg = readl(ecc->regs + ECC_ENCCNFG) & ~ECC_ENC_MODE_MASK;
> >> +	reg |= ECC_DMA_MODE;
> > When I compare the start_encode() to the start_decode() function I see
> > one big difference: the former is clearly operating in non-pipeline
> > mode (the data are retrieved using DMA and returned values are kept in
> > PARX registers), while, IFAICS, the latter is operating in pipeline
> > mode (data are directly retrieved from the NAND engine stream).
> 
> yes
> 
> >
> > I'm perfectly fine supporting those 2 modes (at least it gives an
> > answer to one of my question: the ECC engine can be used independently
> > of the NAND engine), but the function names should reflect this.
> 
> sure: ecc_prepare_decoder() and ecc_encode().

Maybe something mode explicit, like mtd_ecc_prepare_pipeline().
BTW, I had a second look at your implementation, and I wonder why
you're not putting the operations done in the prepare function directly
in the enable one.



> >> +
> >> +static int mtk_nfc_block_markbad(struct mtd_info *mtd, loff_t ofs)
> >> +{
> >> +	struct nand_chip *chip = mtd_to_nand(mtd);
> >> +	u8 *buf = chip->buffers->databuf;
> >> +	int page, rc, i;
> >> +
> >> +	memset(buf, 0x00, mtd->writesize + mtd->oobsize);
> >> +
> >> +	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
> >> +		ofs += mtd->erasesize - mtd->writesize;
> >> +
> >> +	i = 0;
> >> +	do {
> >> +		page = (int)(ofs >> chip->page_shift);
> >> +		chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
> >> +		rc = mtk_nfc_write_page(mtd, chip, buf, 0, page, 1);
> >> +		if (rc < 0)
> >> +			return rc;
> >> +
> >> +		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> >> +		rc = chip->waitfunc(mtd, chip);
> >> +		rc = rc & NAND_STATUS_FAIL ? -EIO : 0;
> >> +		if (rc < 0)
> >> +			return rc;
> >> +
> >> +		ofs += mtd->writesize;
> >> +		i++;
> >> +
> >> +	} while ((chip->bbt_options & NAND_BBT_SCAN2NDPAGE) && i < 2);
> >> +
> >> +	return 0;
> >> +}
> > Why do you need this custom implementation?
> 
> the reason it our page layout: if we need to mark a bad block it is not possible 
> for us to access the spare area (our layout is: sector + oob + sector + oob ...)
> so we just mark the whole page.
> 
> is this acceptable?

Oh, this means you're loosing the BBM as soon as you start using the
NAND. Don't you have a mechanism switching one or 2 bytes of in-band
with OOB data, so that the BBM remains intact and you can still mark
them as bad when needed?
I'd strongly suggest to do this (I know other drivers, like the GPMI
one, use the same trick).

BTW, how do you detect bad blocks marked by the NAND vendor. Those BBMs
will be in what you consider your in-band region.


> >
> >> +
> >> +	if (ret < mtd->bitflip_threshold)
> >> +		mtd->ecc_stats.corrected = stats.corrected;
> > Hm, ->corrected has already been updated by mtk_nfc_read_page_hwecc(),
> > or am I missing something?
> > Moreover, you should have mtd->ecc_stats.corrected += stats.corrected.
> 
> sorry, yes it might be a bit convoluted due to the inverted logic.
> unless the number of bitflips returned by the read_page_hwecc is equal or over 
> the threshold we don't update the corrected stats (so we just reset it to the 
> previous value at this point, hence the = instead of the +=).

What's the point? I mean, ->corrected should be updated each time you
read a page, even if the number of bitflips does not exceed the
bitflips_threshold.


> >> +
> >> +static int mtk_nfc_ooblayout_free(struct mtd_info *mtd, int section,
> >> +				struct mtd_oob_region *oob_region)
> >> +{
> >> +	struct nand_chip *chip = mtd_to_nand(mtd);
> >> +
> >> +	if (section)
> >> +		return -ERANGE;
> >> +
> >> +	oob_region->length = NFI_FDM_REG_SIZE * chip->ecc.steps;
> > Is NFI_FDM_REG_SIZE really fixed to 8, or does it depend on the
> > spare_per_sector and ecc->bytes information?
> 
> Its value can range between 0 and 8 and it depends on the spare area size and 
> the ecc level.
> each sector spare is: FDM + ECC parity + dummy (if there is dummy, the 
> controller pads it)
> ECC parity = 14 * ecc level (bits)
> 
> So we could do:
> 
> FDM size = spare size - (14 * ecc level + 7) / 8;
> if (FDM size > 8)
> FDM size = 8;

Looks good to me.

> 
> 
> for SLC and MLC nand we do fix it to 8 in all cases.
> for TLC nand, since we have less spare, we can only use 3 bytes.
> 
> do you think it is worth adding the FDM size as a function?

Not necessarily a function, it can be a field somewhere in your private
mtk_nand_chip struct.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
