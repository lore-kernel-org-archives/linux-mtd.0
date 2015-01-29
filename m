Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGdn8-00036T-QY
 for linux-mtd@lists.infradead.org; Thu, 29 Jan 2015 01:21:08 +0000
Received: by mail-pa0-f51.google.com with SMTP id fb1so32146810pad.10
 for <linux-mtd@lists.infradead.org>; Wed, 28 Jan 2015 17:20:45 -0800 (PST)
Date: Wed, 28 Jan 2015 17:20:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH 2/2 v3 RESEND] mtd: fsl_upm: Support NAND ECC DTS
 properties
Message-ID: <20150129012042.GX9759@ld-irv-0074>
References: <1136776275.110939.1421109367310.JavaMail.zimbra@xes-inc.com>
 <447095612.147126.1421278909058.JavaMail.zimbra@xes-inc.com>
 <20150123083026.GE3268@brian-ubuntu>
 <1309767342.94086.1422491856685.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1309767342.94086.1422491856685.JavaMail.zimbra@xes-inc.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, devicetree@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 28, 2015 at 06:37:36PM -0600, Aaron Sierra wrote:
> ----- Original Message -----
> > From: "Brian Norris" <computersforpeace@gmail.com>

> > I was thinking about this a bit more, and it seems like we could really
> > just factor this all into the core nand_base code with something like
> > the following patch. It could possibly use some smarter logic to rule
> > out certain combinations (but some of those are already caught in
> > nand_scan_tail() anyway). What do you think?
> 
> Brian,
> If the NAND device tree property fetching were moved out of fsl_upm,
> I think it should not be called within nand_scan(). I think that
> it's imperative that each driver be able to access these properties
> before handing off to nand_scan(), since there are hardware ECC
> modes that only drivers will know how to error check.

That's why nand_scan() is broken into nand_scan_ident() and
nand_scan_tail() functions which can be called individually. This allows
drivers to do the up-front initialization in nand_scan_ident(), do their
own error checking and handling of these parameters, and then call
nand_scan_tail(). See, for example, drivers/mtd/nand/omap2.c.

> Also, catching errors in nand_scan_tail() tends to result in BUG()s.

Well, some of those can be changed. Feel free to propose changes. I'd
prefer to make nand_scan_tail() play nicer than to compensate in
individual drivers.

> That said, this could be useful as a publicly exported function that
> individual drivers are responsible for calling (maybe in of_mtd.c).

I don't think of_mtd.c should really contain a lot of mtd_info /
nand_chip knowledge, if we can avoid it.

I really do think that the nand_scan() option is a better idea, if we
can work out the other details (BUG(), error checking, and keeping it
flexible enough). I think it provides the best place to flesh out any
other common DT handling for all NAND drivers.

Related: I believe the question came up recently about how to support a
generic DT binding for using a GPIO as a NAND write-protect line. This
would be another candidate for handling transparently in
nand_scan_ident() and would then immediately apply to all NAND drivers,
not just those that were rewritten to call another specialized init
function.

I really don't want to encourage the anti-pattern of each driver
reimplementing code that might as well be shared, if at all possible.
Adding more decentralized helpers to of_mtd.c does not really help that
cause.

> I have a couple of additional comments inline below.
>  
> > diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
> > index 72755d7ec25d..fc4834946233 100644
> > --- a/drivers/mtd/nand/fsl_upm.c
> > +++ b/drivers/mtd/nand/fsl_upm.c
> > @@ -181,6 +181,7 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
> >  	flash_np = of_get_next_child(upm_np, NULL);
> >  	if (!flash_np)
> >  		return -ENODEV;
> > +	fun->chip.dn = flash_np;
> >  
> >  	fun->mtd.name = kasprintf(GFP_KERNEL, "0x%llx.%s", (u64)io_res->start,
> >  				  flash_np->name);
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 3f24b587304f..b701c3f23da1 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -48,6 +48,7 @@
> >  #include <linux/leds.h>
> >  #include <linux/io.h>
> >  #include <linux/mtd/partitions.h>
> > +#include <linux/of_mtd.h>
> >  
> >  /* Define default oob placement schemes for large and small page devices */
> >  static struct nand_ecclayout nand_oob_8 = {
> > @@ -3780,6 +3781,33 @@ ident_done:
> >  	return type;
> >  }
> >  
> > +static int nand_dt_init(struct mtd_info *mtd, struct nand_chip *chip,
> > +			struct device_node *dn)
> 
> Assuming that of_mtd.c is the best place to put this, the
> prototype could be simplified a little:
> 
> int of_nand_chip_init(struct device_node *dn, struct nand_chip *chip)

Though I don't agree about of_mtd.c, dropping the 'mtd' argument is
possible. (In fact, we can just use a single 'chip' argument if we
want.) I was just borrowing the style of the rest of nand_base.c, which
often includes both 'mtd' and 'chip'.

> > +{
> > +	int ecc_mode, ecc_strength, ecc_step;
> > +
> > +	if (of_get_nand_bus_width(dn) == 16)
> > +		chip->options |= NAND_BUSWIDTH_16;
> > +
> > +	if (of_get_nand_on_flash_bbt(dn))
> > +		chip->bbt_options |= NAND_BBT_USE_FLASH;
> > +
> > +	ecc_mode = of_get_nand_ecc_mode(dn);
> > +	ecc_strength = of_get_nand_ecc_strength(dn);
> > +	ecc_step = of_get_nand_ecc_step_size(dn);
> > +
> > +	if (ecc_mode >= 0)
> > +		chip->ecc.mode = ecc_mode;
> > +
> > +	if (ecc_strength >= 0)
> > +		chip->ecc.strength = ecc_strength;
> > +
> > +	if (ecc_step > 0)
> > +		chip->ecc.size = ecc_step;
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * nand_scan_ident - [NAND Interface] Scan for the NAND device
> >   * @mtd: MTD device structure
> > @@ -3797,6 +3825,13 @@ int nand_scan_ident(struct mtd_info *mtd, int
> > maxchips,
> >  	int i, nand_maf_id, nand_dev_id;
> >  	struct nand_chip *chip = mtd->priv;
> >  	struct nand_flash_dev *type;
> > +	int ret;
> > +
> > +	if (chip->dn) {
> > +		ret = nand_dt_init(mtd, chip, chip->dn);
> > +		if (ret)
> > +			return ret;
> > +	}
> >  
> >  	/* Set the default functions */
> >  	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
> > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > index 3d4ea7eb2b68..e0f40e12a2c8 100644
> > --- a/include/linux/mtd/nand.h
> > +++ b/include/linux/mtd/nand.h
> > @@ -26,6 +26,8 @@
> >  
> >  struct mtd_info;
> >  struct nand_flash_dev;
> > +struct device_node;
> > +
> >  /* Scan and identify a NAND device */
> >  extern int nand_scan(struct mtd_info *mtd, int max_chips);
> >  /*
> > @@ -542,6 +544,7 @@ struct nand_buffers {
> >   *			flash device
> >   * @IO_ADDR_W:		[BOARDSPECIFIC] address to write the 8 I/O lines of the
> >   *			flash device.
> > + * @dn:			[BOARDSPECIFIC] device node describing this instance
> >   * @read_byte:		[REPLACEABLE] read one byte from the chip
> >   * @read_word:		[REPLACEABLE] read one word from the chip
> >   * @write_byte:		[REPLACEABLE] write a single byte to the chip on the
> > @@ -644,6 +647,8 @@ struct nand_chip {
> >  	void __iomem *IO_ADDR_R;
> >  	void __iomem *IO_ADDR_W;
> >  
> > +	struct device_node *dn;
> > +
> 
> This addition to struct nand_chip wouldn't be needed, then.
> 
> >  	uint8_t (*read_byte)(struct mtd_info *mtd);
> >  	u16 (*read_word)(struct mtd_info *mtd);
> >  	void (*write_byte)(struct mtd_info *mtd, uint8_t byte);
> > 
> 
> You hinted at implementing stronger error checking. If we went
> this route, would it make sense to only error check the software
> ECC modes?

Yes. I just elided some of the details for now, since it's not actually
necessary to do some of it (many other drivers can use SW ECC without
the extra error checks).

Thanks,
Brian
