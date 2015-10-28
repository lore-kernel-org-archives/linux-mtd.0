Received: from mail-bn1on0147.outbound.protection.outlook.com
 ([157.56.110.147] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrTI4-0001Kk-Is
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2015 16:09:34 +0000
Date: Wed, 28 Oct 2015 10:57:57 -0500
From: Han Xu <han.xu@freescale.com>
To: Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
CC: "b45815@freescale.com" <b45815@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "shijie.huang@arm.com" <shijie.huang@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "vinod.koul@intel.com"
 <vinod.koul@intel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, "dmaengine@vger.kernel.org"
 <dmaengine@vger.kernel.org>
Subject: Re: [PATCH v7 4/7] mtd: nand: gpmi: may use minimum required ecc
Message-ID: <20151028155757.GB4035@chopperman.am.freescale.net>
References: <A765B125120D1346A63912DDE6D8B6310BF4F18D@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4F18D@NTXXIAMBX02.xacn.micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 28, 2015 at 01:42:33PM +0000, Bean Huo 霍斌斌 (beanhuo) wrote:
> > By default NAND driver will choose the highest ecc strength that oob could
> > contain, in this case, for some 8K+744 NAND flash, the ecc strength will be up
> > to 52bit, which beyonds the i.MX6QDL BCH capability (40bit).
> 
> 
> For normal working environment, if hardware BCH ECC cannot meet NAND ecc requirement,
> We can set a minimum required ecc strength, and file system refresh/scrub can control bitflips under NAND ecc strength. But during reflow solder, it is very possible that NAND bitflips may increase over your hardware BCH capability, I don't know how this controller handle this?
> For example, NAND require 80bit ECC, but hardware BCH ECC can only hold 40bit.
> After reflow, there are some blocks that bitflips over 40bit.

if the minimum ecc strength read from NAND ONFI parameter exceeds the
BCH ECC capability, the NAND driver quits and reports unsupport NAND chip.

Do you mean reflow solder may change the NAND minimum required ECC
strength, in other word, the actual minimum ECC may larger than it said
in NAND chip SPEC?
> 
> 
> > This patch allows the NAND driver try to use minimum required ecc strength if
> > it failed to use the highest ecc, even without explicitly claiming
> > "fsl,use-minimum-ecc" in dts.
> > 
> > Signed-off-by: Han Xu <b45815@freescale.com>
> > ---
> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 26 ++++++++++++++------------
> >  1 file changed, 14 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > index 0961b93..d8f2403 100644
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > @@ -136,7 +136,7 @@ static inline bool gpmi_check_ecc(struct
> > gpmi_nand_data *this)
> >   *
> >   * We may have available oob space in this case.
> >   */
> > -static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
> > +static int set_geometry_by_ecc_info(struct gpmi_nand_data *this)
> >  {
> >  	struct bch_geometry *geo = &this->bch_geometry;
> >  	struct mtd_info *mtd = &this->mtd;
> > @@ -145,7 +145,7 @@ static bool set_geometry_by_ecc_info(struct
> > gpmi_nand_data *this)
> >  	unsigned int block_mark_bit_offset;
> > 
> >  	if (!(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0))
> > -		return false;
> > +		return -EINVAL;
> > 
> >  	switch (chip->ecc_step_ds) {
> >  	case SZ_512:
> > @@ -158,19 +158,19 @@ static bool set_geometry_by_ecc_info(struct
> > gpmi_nand_data *this)
> >  		dev_err(this->dev,
> >  			"unsupported nand chip. ecc bits : %d, ecc size : %d\n",
> >  			chip->ecc_strength_ds, chip->ecc_step_ds);
> > -		return false;
> > +		return -EINVAL;
> >  	}
> >  	geo->ecc_chunk_size = chip->ecc_step_ds;
> >  	geo->ecc_strength = round_up(chip->ecc_strength_ds, 2);
> >  	if (!gpmi_check_ecc(this))
> > -		return false;
> > +		return -EINVAL;
> > 
> >  	/* Keep the C >= O */
> >  	if (geo->ecc_chunk_size < mtd->oobsize) {
> >  		dev_err(this->dev,
> >  			"unsupported nand chip. ecc size: %d, oob size : %d\n",
> >  			chip->ecc_step_ds, mtd->oobsize);
> > -		return false;
> > +		return -EINVAL;
> >  	}
> > 
> >  	/* The default value, see comment in the legacy_set_geometry(). */ @@
> > -242,7 +242,7 @@ static bool set_geometry_by_ecc_info(struct
> > gpmi_nand_data *this)
> >  				+ ALIGN(geo->ecc_chunk_count, 4);
> > 
> >  	if (!this->swap_block_mark)
> > -		return true;
> > +		return 0;
> > 
> >  	/* For bit swap. */
> >  	block_mark_bit_offset = mtd->writesize * 8 - @@ -251,7 +251,7 @@
> > static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
> > 
> >  	geo->block_mark_byte_offset = block_mark_bit_offset / 8;
> >  	geo->block_mark_bit_offset  = block_mark_bit_offset % 8;
> > -	return true;
> > +	return 0;
> >  }
> > 
> >  static int legacy_set_geometry(struct gpmi_nand_data *this) @@ -285,7
> > +285,8 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
> >  	geo->ecc_strength = get_ecc_strength(this);
> >  	if (!gpmi_check_ecc(this)) {
> >  		dev_err(this->dev,
> > -			"required ecc strength of the NAND chip: %d is not supported by
> > the GPMI controller (%d)\n",
> > +			"ecc strength: %d cannot be supported by the controller (%d)\n"
> > +			"try to use minimum ecc strength that NAND chip required\n",
> >  			geo->ecc_strength,
> >  			this->devdata->bch_max_ecc_strength);
> >  		return -EINVAL;
> > @@ -366,10 +367,11 @@ static int legacy_set_geometry(struct
> > gpmi_nand_data *this)
> > 
> >  int common_nfc_set_geometry(struct gpmi_nand_data *this)  {
> > -	if (of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc")
> > -		&& set_geometry_by_ecc_info(this))
> > -		return 0;
> > -	return legacy_set_geometry(this);
> > +	if ((of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc"))
> > +				|| legacy_set_geometry(this))
> > +		return set_geometry_by_ecc_info(this);
> > +
> > +	return 0;
> >  }
> > 
> >  struct dma_chan *get_dma_chan(struct gpmi_nand_data *this)
> > --
> > 1.9.1

-- 
Best Regards,

Han "Allen" Xu
