Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmFQO-0000lL-48
 for linux-mtd@lists.infradead.org; Tue, 20 Sep 2016 07:25:07 +0000
Date: Tue, 20 Sep 2016 09:24:41 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mason <slash.tmp@free.fr>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>, linux-mtd
 <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Sebastian Frias <sf84@laposte.net>, Jean-Baptiste Lescher
 <jblescher@gmail.com>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>
Subject: Re: [PATCH v5] mtd: nand: tango: import driver for tango chips
Message-ID: <20160920092441.1f9fa21e@bbrezillon>
In-Reply-To: <57E06892.6010008@free.fr>
References: <57C94E33.6070304@sigmadesigns.com>
 <20160905091450.017e4aa3@bbrezillon> <57CD4672.1010504@free.fr>
 <20160905131516.0acb8145@bbrezillon>
 <57D189E1.3020508@sigmadesigns.com>
 <57D193C5.8040004@sigmadesigns.com>
 <57D2DF96.7060705@sigmadesigns.com> <57D5530B.2060209@free.fr>
 <20160912210810.79ac23c9@bbrezillon>
 <57DFE444.3000003@sigmadesigns.com>
 <20160919190623.3b9d7842@bbrezillon> <57E06892.6010008@free.fr>
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

On Tue, 20 Sep 2016 00:37:06 +0200
Mason <slash.tmp@free.fr> wrote:

> On 19/09/2016 19:06, Boris Brezillon wrote:
> 
> > Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:
> >   
> >> This driver supports the NAND Flash controller embedded in recent
> >> Tango chips, such as SMP8758 and SMP8759.  
> > 
> > Please send another patch to document the DT bindings, and Cc the DT
> > maintainers.  
> 
> OK.
> 
> 
> >> +struct tango_chip {
> >> +	struct nand_chip chip;
> >> +	void __iomem *base;  
> > 
> > I'm still not convinced this is needed (->base can be calculated where
> > needed based on the chip->cs and nfc->reg_base values), but if you want
> > to keep it, let's keep it.  
> 
> I thought it was bad form to duplicate the code computing
> chip->base, especially if I need to update that function.

I simple macro would avoid the code duplication:

#define TANGO_CHIP_REG(nfc, cs, reg)	\
	((nfc)->pbus_base + ((cs) *256) + reg)

> 
> 
> >> +static void tango_select_chip(struct mtd_info *mtd, int idx)
> >> +{
> >> +	struct nand_chip *nand = mtd_to_nand(mtd);
> >> +	struct tango_nfc *nfc = to_tango_nfc(nand->controller);
> >> +	struct tango_chip *chip = to_tango_chip(nand);
> >> +
> >> +	if (idx < 0) {
> >> +		chip->base = NULL;
> >> +		return;
> >> +	}
> >> +
> >> +	chip->base = nfc->pbus_base + (chip->cs * 256);  
> > 
> > You support only one CS per chip, so this is something you can
> > configure at init time.
> > 
> > When I asked you to remove the chip->base field, I had multi-CS chips
> > in mind, but given this implementation, there's no need to set/reset
> > the chip->base field each time ->select_chip() is called.  
> 
> OK. I'll set chip->cs and chip->base in the probe function.
> Just to be sure, I'll ask internally whether we want to
> support multi-CS chips right now, or if this can be added
> later on.
> 
> 
> >> +	writel_relaxed(chip->timing1,	nfc->reg_base + NFC_TIMING1);
> >> +	writel_relaxed(chip->timing2,	nfc->reg_base + NFC_TIMING2);
> >> +	writel_relaxed(chip->xfer_cfg,	nfc->reg_base + NFC_XFER_CFG);
> >> +	writel_relaxed(chip->pkt_0_cfg,	nfc->reg_base + NFC_PKT_0_CFG);
> >> +	writel_relaxed(chip->pkt_n_cfg,	nfc->reg_base + NFC_PKT_N_CFG);
> >> +	writel_relaxed(chip->bb_cfg,	nfc->reg_base + NFC_BB_CFG);  
> > 
> > Nit: can you avoid these weird alignments. Use a single space after the
> > comma.  
> 
> I was trying to highlight the fact that all these writes are
> within the reg_base area. I'll do as you ask, since you are
> the gatekeeper.

Is that really less clear without the tabs?

> 
> 
> >> +static int do_dma(struct tango_nfc *nfc, int dir, int cmd,
> >> +		const void *buf, int len, int page)
> >> +{
> >> +	struct dma_async_tx_descriptor *desc;
> >> +	struct scatterlist sg;
> >> +	struct completion tx_done;
> >> +	int err = -EIO;
> >> +	u32 res, val;
> >> +
> >> +	sg_init_one(&sg, buf, len);
> >> +	if (dma_map_sg(nfc->chan->device->dev, &sg, 1, dir) != 1)
> >> +		goto leave;  
> > 
> > Return -EIO directly instead of creating this 'leave' label.  
> 
> OK. I wasn't sure it was good form to make the first test
> special, especially if someone adds a new alloc before this
> one later on. But I don't care either way.

If one adds an allocation, it's likely to be put after this call, and
if it's not, we'll patch the code and create a new exit patch.

> 
> 
> >> +
> >> +	desc = dmaengine_prep_slave_sg(nfc->chan, &sg, 1, dir, DMA_PREP_INTERRUPT);  
> > 
> > Put DMA_PREP_INTERRUPT on a second line to avoid >80 char lines.  
> 
> I was told some maintainers don't enforce the >80 char line rule.
> Am I to understand you're not one of them? :-)

Yes, I'm one of them :P.

> 
> 
> >> +	if (!desc)
> >> +		goto dma_unmap;
> >> +
> >> +	desc->callback = tango_dma_callback;
> >> +	desc->callback_param = &tx_done;
> >> +	init_completion(&tx_done);
> >> +
> >> +	writel_relaxed(MODE_NFC, nfc->pbus_base + PBUS_PAD_MODE);
> >> +
> >> +	writel_relaxed(page, nfc->reg_base + NFC_ADDR_PAGE);
> >> +	writel_relaxed(   0, nfc->reg_base + NFC_ADDR_OFFSET);
> >> +	writel_relaxed( cmd, nfc->reg_base + NFC_FLASH_CMD);
> >> +
> >> +	dmaengine_submit(desc);
> >> +	dma_async_issue_pending(nfc->chan);
> >> +
> >> +	res = wait_for_completion_timeout(&tx_done, HZ);
> >> +	if (res > 0) {
> >> +		void __iomem *addr = nfc->reg_base + NFC_STATUS;
> >> +		err = readl_poll_timeout(addr, val, val & CMD_READY, 0, 1000);  
> > 
> > Why do you need this local variable?
> > 
> > 		err = readl_poll_timeout(nfc->reg_base + NFC_STATUS,
> > 					 val, val & CMD_READY, 0, 1000);  
> 
> I find it hard to read when function arguments are split
> over multiple lines. So if there is a hard "80 char" limit,
> I prefer using temp variables for "long" arguments.

Really? Is that really hard to read?

> 
> 
> >> +	}
> >> +
> >> +	writel_relaxed(MODE_RAW, nfc->pbus_base + PBUS_PAD_MODE);  
> > 
> > Add an extra blank line here.  
> 
> OK.
> 
> 
> >> +static int tango_read_page(struct mtd_info *mtd, struct nand_chip *chip,
> >> +		uint8_t *buf, int oob_required, int page)
> >> +{
> >> +	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
> >> +	int err, res, len = mtd->writesize;
> >> +
> >> +	err = do_dma(nfc, DMA_FROM_DEVICE, NFC_READ, buf, len, page);
> >> +	if (err)
> >> +		return err;
> >> +
> >> +	if (oob_required)
> >> +		chip->ecc.read_oob(mtd, chip, page);
> >> +
> >> +	res = decode_error_report(nfc);
> >> +	if (res >= 0)
> >> +		return res;
> >> +
> >> +	chip->ecc.read_oob(mtd, chip, page);  
> > 
> > There's no different in your case, but it should be read in raw mode.
> > How about calling ecc.read_oob_raw() so that you're safe even if you
> > want to differentiate the read_oob() and read_oob_raw() cases at some
> > point (IIUC, the METADATA section is ECC protected).  
> 
> OK.
> 
> 
> >> +	res = nand_check_erased_ecc_chunk(buf, len, chip->oob_poi, mtd->oobsize,
> >> +			NULL, 0, chip->ecc.strength);  
> > 
> > You should check each ECC packet/chunk independently, because ECC
> > strength is referring to an ECC packet not a full page.  
> 
> Because of our weird physical layout, accessing data chunks is
> really awkward. We are willing to sacrifice a few bad pages
> by using a sub-optimal check (allowing only "strength" bitflips
> over the entire page, instead of over individual packets).

Hm, it doesn't look so complicated to me:

	bitflips = 0;

	for (i = 0; i < chip->ecc.steps; i++) {
		void *data = buf + (i * chip->ecc.size);
		void *oob = chip->oob_poi + (i * chip->ecc.bytes);
		void *extra_oob = NULL;
		int extra_oob_len = 0;

		if (!i) {
			extra_oob = chip->oob_poi;
			extra_oob_len = METADATA_SIZE + BBM_SIZE;
		} else if (i == chip->ecc.steps) {
			extra_oob_len = mtd->oobsize - METADATA_SIZE
			-		BBM_SIZE -
					(chip->ecc.steps *
					 chip->ecc.bytes);
			extra_oob_len = chip->oob_poi + mtd->oobsize -
					extra_oob_len;
		}

		res = nand_check_erased_ecc_chunk(data, chip->ecc.size,
						  oob, chip->ecc.bytes,
						  extra_oob,
						  extra_oob_len,
						  chip->ecc.strength);
		if (res >= 0)
			bitflips = max(res, bitflips);
		else
			mtd->ecc_stats.failed++; 
	}

> 
> 
> >> +static int tango_write_page(struct mtd_info *mtd, struct nand_chip *chip,
> >> +		const uint8_t *buf, int oob_required, int page)
> >> +{
> >> +	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
> >> +	int err, len = mtd->writesize;
> >> +
> >> +	writel_relaxed(0xffffffff, nfc->mem_base + METADATA);
> >> +	err = do_dma(nfc, DMA_TO_DEVICE, NFC_WRITE, buf, len, page);
> >> +	if (err)
> >> +		return err;
> >> +
> >> +	if (oob_required)
> >> +		chip->ecc.write_oob(mtd, chip, page);  
> 
> I suppose we should use write_oob_raw here?

Oops, I didn't spot that one in my review. You said your engine sends
the PAGEPROG command, which means the page has already been programmed
when do_dma() returns, right?
In that case, you can't call ->write_oob() or ->write_oob_raw(),
because you're not allowed to program a page twice.

Don't you have a way to program OOB along with data (extra registers
you can use to pass your OOB data)?

Anyway, since you don't expose free OOB sections, I think you can
ignore the oob_required parameter. Just add a comment explaining why.

> 
> 
> >> +enum { OP_SKIP, OP_READ, OP_WRITE };
> >> +
> >> +static void raw_aux(struct mtd_info *mtd, u8 **buf, int len, int op, int *lim)  
> > 
> > Nit: please pass struct nand_chip *chip in first argument, and extract
> > the mtd using nand_to_mtd(). I know it's just a detail, but I'd like to
> > avoid passing mtd pointers, especially in internal functions.  
> 
> OK.
> 
> 
> >> +{
> >> +	struct nand_chip *chip = mtd_to_nand(mtd);
> >> +	int pos = mtd->writesize - *lim;
> >> +
> >> +	if (op == OP_SKIP)
> >> +		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, pos + len, -1);  
> > 
> > Okay, we already discussed that one, and I already showed that this was
> > not working: NAND_CMD_RNDOUT is only valid for read accesses.
> > 
> > And I told you I'd like to avoid the const to non-const cast in write
> > accessors.  
> 
> Note: I don't use SKIP for writes, therefore there's no need
> to implement that code.

Except you still have to cast the buf pointer in tango_write_page_raw().

> 
> 
> >> +	else if (op == OP_READ)
> >> +		tango_read_buf(mtd, *buf, len);
> >> +	else if (op == OP_WRITE)
> >> +		tango_write_buf(mtd, *buf, len);
> >> +
> >> +	*lim -= len;
> >> +	*buf += len;
> >> +}  
> > 
> > I'm not sure factorizing this code is really important, but since you
> > insist, how about doing the following instead:  
> 
> If the code is not factorized, then it must be duplicated for
> read/write_raw and read/write_oob, I think (i.e. 4 times).

Only twice: read_oob and read_page_raw can still be factorized, same
goes for write_oob and write_page_raw.

Anyway, I fear I won't convince you, so please make sure you remove
this const to non-const cast.

> 
> > enum tango_raw_op { OP_READ, OP_WRITE };
> > 
> > union tango_raw_buffer {
> > 	void *in;
> > 	const void *out;
> > };
> > 
> > struct tango_raw_access {
> > 	enum tango_raw_op op;
> > 	union tango_raw_buffer *buf;
> > 	int pos;
> > };
> > 
> > static void raw_aux(struct nand_chip *chip,
> > 		    struct tango_raw_access *info,
> > 		    union tango_raw_buffer *buf, int len)
> > {
> > 	struct mtd_info *mtd = nand_to_mtd(chip);
> > 
> > 	if (!buf) {
> > 		if (info->op == OP_READ)
> > 			cmd = NAND_CMD_RNDOUT;
> > 		else
> > 			cmd = NAND_CMD_SEQIN;
> > 
> > 		chip->cmdfunc(mtd, cmd, info->pos + len, -1);
> > 	} else {
> > 		if (info->op == OP_READ)
> > 			tango_read_buf(mtd, buf->out, len);
> > 		else
> > 			tango_write_buf(mtd, buf->in, len);
> > 
> > 		buf->in += len;
> > 	}
> > 
> > 	info->pos += len;
> > }  
> 
> I'll take a closer look tomorrow.
> 
> 
> >> +static int raw_access(struct mtd_info *mtd, uint8_t *buf, uint8_t *oob, int op)
> >> +{
> >> +	struct nand_chip *chip = mtd_to_nand(mtd);
> >> +	int pkt_size = chip->ecc.size;
> >> +	int ecc_size = chip->ecc.bytes;
> >> +	int buf_op = buf ? op : OP_SKIP;
> >> +	int oob_op = oob ? op : OP_SKIP;
> >> +	int rem, lim = mtd->writesize;
> >> +	u8 *oob_orig = oob;
> >> +
> >> +	oob += BBM_SIZE;
> >> +	raw_aux(mtd, &oob, METADATA_SIZE, oob_op, &lim);
> >> +
> >> +	while (lim > pkt_size)
> >> +	{
> >> +		raw_aux(mtd, &buf, pkt_size, buf_op, &lim);
> >> +		raw_aux(mtd, &oob, ecc_size, oob_op, &lim);
> >> +	}
> >> +
> >> +	rem = pkt_size - lim;
> >> +	raw_aux(mtd, &buf, lim, buf_op, &lim);
> >> +	raw_aux(mtd, &oob_orig, BBM_SIZE, oob_op, &lim);
> >> +	raw_aux(mtd, &buf, rem, buf_op, &lim);
> >> +	raw_aux(mtd, &oob, ecc_size, oob_op, &lim);
> >> +
> >> +	return 0;
> >> +}  
> > 
> > With the above changes this gives:
> > 
> > static int raw_access(struct nand_chip *chip,
> > 		      union tango_raw_buffer *buf,
> > 		      union tango_raw_buffer *oob,
> > 		      int op)
> > {
> > 	struct mtd_info *mtd = nand_to_mtd(chip);
> > 	int pkt_size = chip->ecc.size;
> > 	int ecc_size = chip->ecc.bytes;
> > 	int steps = 0, rem = 0;
> > 	struct tango_raw_access info = {
> > 		.op = op,
> > 		.pos = 0,
> > 	};
> > 	union tango_raw_buffer oob_orig;
> > 
> > 	if (oob) {
> > 		oob->in = chip->oob_poi + BBM_SIZE;
> > 		oob_orig.in = chip->oob_poi;
> > 	}
> > 
> > 	raw_aux(chip, &info, oob, METADATA_SIZE);
> > 
> > 	while (info.pos + pkt_size + ecc_size <= mtd->writesize) {
> > 		raw_aux(chip, &info, buf, pkt_size);
> > 		raw_aux(mtd, &info, oob, ecc_size);
> > 		steps++;
> > 	}
> > 
> > 	if (steps < chip->ecc.steps)
> > 		rem = pkt_size - (mtd->writesize - info.pos);
> > 		raw_aux(mtd, &info, buf, mtd->writesize - info.pos);
> > 	}  
> 
> I don't think we need the 'steps' variable (I didn't need one).
> 
> > 	raw_aux(mtd, &info, oob ? &oob_orig : NULL, BBM_SIZE);
> > 	raw_aux(mtd, &info, buf, rem);
> > 
> > 	rem = mtd->writesize + mtd->oobsize - info.pos;
> > 	raw_aux(mtd, &info, oob, rem);
> > 
> > 	return 0;
> > }  
> 
> I'll take a closer look tomorrow.
> 
> 
> >> +static u32 to_ticks(int kHz, int ps)
> >> +{
> >> +	return DIV_ROUND_UP_ULL((u64)kHz * ps, NSEC_PER_SEC);
> >> +}
> >> +
> >> +static int set_timings(struct tango_chip *p, int kHz)
> >> +{
> >> +	u32 Trdy, Textw, Twc, Twpw, Tacc, Thold, Trpw, Textr;
> >> +	const struct nand_sdr_timings *sdr;
> >> +	int mode = onfi_get_async_timing_mode(&p->chip);
> >> +
> >> +	if (mode & ONFI_TIMING_MODE_UNKNOWN)
> >> +		return -ENODEV;
> >> +
> >> +	sdr = onfi_async_timing_mode_to_sdr_timings(fls(mode) - 1);  
> > 
> > We recently introduced a generic interface to automate nand timings
> > configuration [1].
> > Can you make use of it (the patches are in my nand/next branch [2], you
> > can rebase your patch series on top of this branch).  
> 
> I'll take a look. I still need to have this driver working
> on 4.7 for the time being...

And? You're trying to mainline the thing. What did you expect?
I'm asking you to use an infrastructure we introduced recently (will
be part of 4.9), the fact that you need to make the driver work on 4.7
is not a good reason to not use it (you can either backport the
series, or keep 2 versions of your driver).

> 
> 
> >> +
> >> +	Trdy	= to_ticks(kHz, sdr->tCEA_max - sdr->tREA_max);
> >> +	Textw	= to_ticks(kHz, sdr->tWB_max);
> >> +	Twc	= to_ticks(kHz, sdr->tWC_min);
> >> +	Twpw	= to_ticks(kHz, sdr->tWC_min - sdr->tWP_min);
> >> +
> >> +	Tacc	= to_ticks(kHz, sdr->tREA_max);
> >> +	Thold	= to_ticks(kHz, sdr->tREH_min);
> >> +	Trpw	= to_ticks(kHz, sdr->tRC_min - sdr->tREH_min);
> >> +	Textr	= to_ticks(kHz, sdr->tRHZ_max);  
> > 
> > Can you please be consistent in your indentation?
> > You're using spaces before '=' almost everywhere except in a few
> > places (like here).  
> 
> When initializing fields of a struct, most code I've seen
> uses tabs to align the equal signs. I thought it should be
> the same when assigning the fields of a struct, or assigning
> several variables of the same nature (such as above).
> 
> Are you saying you prefer
> 
>   Trdy = to_ticks(kHz, sdr->tCEA_max - sdr->tREA_max);
>   Textw = to_ticks(kHz, sdr->tWB_max);
>   Twc = to_ticks(kHz, sdr->tWC_min);

Yes, I prefer that one.

> 
> Thus the to_ticks calls are not aligned, and it's less obvious
> that the first argument is always the same.

And? What's the point of making it obvious? Does it help understanding
the code?

I prefer when the coding is consistent, and here, it's not consistent
with the rest of the file.

> 
> 
> >> +static int chip_init(struct device *dev, struct device_node *np, int kHz)
> >> +{
> >> +	int err;
> >> +	u32 cs, ecc_bits;
> >> +	struct nand_ecc_ctrl *ecc;
> >> +	struct tango_nfc *nfc = dev_get_drvdata(dev);
> >> +	struct tango_chip *p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
> >> +	if (!p)
> >> +		return -ENOMEM;
> >> +
> >> +	err = of_property_read_u32_index(np, "reg", 0, &cs);
> >> +	if (err)
> >> +		return err;
> >> +  
> > 
> > Can you please check that you only have a single value in reg? Just to
> > make sure the user doesn't try to define a multi-CS chip.  
> 
> OK.
> 
> 
> >> +	if (cs >= MAX_CS)
> >> +		return -ERANGE;
> >> +
> >> +	p->chip.read_byte	= tango_read_byte;
> >> +	p->chip.read_buf	= tango_read_buf;
> >> +	p->chip.select_chip	= tango_select_chip;
> >> +	p->chip.cmd_ctrl	= tango_cmd_ctrl;
> >> +	p->chip.dev_ready	= tango_dev_ready;
> >> +	p->chip.options		= NAND_USE_BOUNCE_BUFFER | NAND_NO_SUBPAGE_WRITE;
> >> +	p->chip.controller	= &nfc->hw;  
> > 
> > Again, be consistent in you coding style: use spaces.  
> 
> OK. I'll take another look at the sunxi driver.
> 
> It makes no sense to me that we should tab-align when using
> struct initialization with named fields, but space-align
> when using assignment.

I never asked to tab-align struct field assignments. Actually, I don't
like it either.

> 
> 
> >> +
> >> +	ecc			= &p->chip.ecc;
> >> +	ecc->mode		= NAND_ECC_HW;
> >> +	ecc->algo		= NAND_ECC_BCH;
> >> +	ecc->read_page_raw	= tango_read_page_raw;
> >> +	ecc->write_page_raw	= tango_write_page_raw;
> >> +	ecc->read_page		= tango_read_page;
> >> +	ecc->write_page		= tango_write_page;
> >> +	ecc->read_oob		= tango_read_oob;
> >> +	ecc->write_oob		= tango_write_oob;  
> > 
> > Can you move this part after nand_scan_ident(). I'd also suggest to
> > support software ECC (it's just taking a few more lines), but that's up
> > to you.  
> 
> OK. What does it mean to support SW ECC?

I means that, if someone wants to use your NAND controller with
software ECC or ECC at all he can.

Regards,

Boris
