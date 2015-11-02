Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtAew-0000Uf-7f
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 08:40:11 +0000
Date: Mon, 2 Nov 2015 09:39:43 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Maxime Ripard
 <maxime.ripard@free-electrons.com>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: nand: automate NAND timings selection
Message-ID: <20151102093943.081b06b9@bbrezillon>
In-Reply-To: <20151102003733.GA677@laptop.cereza>
References: <1445598236-14036-1-git-send-email-boris.brezillon@free-electrons.com>
 <1445598236-14036-2-git-send-email-boris.brezillon@free-electrons.com>
 <20151102003733.GA677@laptop.cereza>
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

Hi Ezequiel,

On Sun, 1 Nov 2015 21:37:33 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> Hi Boris,
> 
> This looks nice. I gave a try at this patch and it allows to simplify
> pxa3xx-nand greatly. A few comments below.
> 
> On 23 Oct 01:03 PM, Boris Brezillon wrote:
> > The NAND framework provides several helpers to query timing modes supported
> > by a NAND chip, but this implies that all NAND controller drivers have
> > to implement the same timings selection dance.
> > 
> > Provide a common logic to select the best timings based on ONFI or
> > ->onfi_timing_mode_default information.
> > NAND controller willing to support timings adjustment should just
> > implement the ->setup_data_interface() method.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/mtd/nand/nand_base.c | 189 ++++++++++++++++++++++++++++++++++++++++++-
> >  include/linux/mtd/nand.h     | 115 +++++++++++++++-----------
> >  2 files changed, 254 insertions(+), 50 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index eaf1fcd..52a1f89 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -3323,6 +3323,144 @@ static void nand_onfi_detect_micron(struct nand_chip *chip,
> >  	chip->setup_read_retry = nand_setup_read_retry_micron;
> >  }
> >  
> > +/**
> > + * nand_setup_data_interface - Setup the data interface and timings on the
> > + *			       controller side
> > + * @mtd: MTD device structure
> > + * @conf: new configuration to apply
> > + *
> > + * Try to configure the NAND controller to support the provided data
> > + * interface configuration.
> > + *
> > + * Returns 0 in case of success or -ERROR_CODE.
> > + */
> > +static int nand_setup_data_interface(struct mtd_info *mtd,
> > +				     const struct nand_data_interface *conf)
> > +{
> > +	struct nand_chip *chip = mtd->priv;
> > +	int ret;
> > +
> > +	if (!chip->setup_data_interface)
> > +		return -ENOTSUPP;
> > +
> > +	ret = chip->setup_data_interface(mtd, conf, false);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*chip->data_iface = *conf;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * nand_setup_data_interface - Check if a data interface config is supported
> 
> s/setup/check

Yes, I'll fix it.

> 
> > + *			       by the NAND controller
> > + * @mtd: MTD device structure
> > + * @conf: new configuration to apply
> > + *
> > + * Check if the provided data interface configuration is supported by the
> > + * NAND controller.
> > + *
> > + * Returns 0 if it is supported or -ERROR_CODE.
> > + */
> > +static int nand_check_data_interface(struct mtd_info *mtd,
> > +				     const struct nand_data_interface *conf)
> > +{
> > +	struct nand_chip *chip = mtd->priv;
> > +
> > +	if (!chip->setup_data_interface)
> > +		return -ENOTSUPP;
> > +
> > +	return chip->setup_data_interface(mtd, conf, true);
> > +}
> > +
> > +/**
> > + * nand_configure_data_interface - Configure the data interface and timings
> > + * @mtd: MTD device structure
> > + *
> > + * Try to configure the data interface and NAND timings appropriately.
> > + * First tries to retrieve supported timing modes from ONFI information,
> > + * and if the NAND chip does not support ONFI, relies on the
> > + * ->onfi_timing_mode_default specified in the nand_ids table.
> > + *
> > + * Returns 0 in case of success or -ERROR_CODE.
> > + */
> > +static int nand_configure_data_interface(struct mtd_info *mtd)
> > +{
> > +	struct nand_chip *chip = mtd->priv;
> > +	struct nand_data_interface *conf;
> > +	int modes, mode, ret = -EINVAL;
> > +
> > +	conf = kzalloc(sizeof(*conf), GFP_KERNEL);
> > +	if (!conf)
> > +		return -ENOMEM;
> > +
> > +	/* TODO: support DDR interfaces */
> > +	conf->type = NAND_SDR_IFACE;
> > +
> > +	/*
> > +	 * First try to identify the best timings from ONFI parameters and
> > +	 * if the NAND does not support ONFI, fallback to the default ONFI
> > +	 * timing mode.
> > +	 */
> > +	modes = onfi_get_async_timing_mode(chip);
> > +	if (modes != ONFI_TIMING_MODE_UNKNOWN) {
> > +		for (mode = fls(modes) - 1; mode >= 0; mode--) {
> > +			conf->timings.sdr =
> > +				*onfi_async_timing_mode_to_sdr_timings(mode);
> > +
> > +			ret = nand_check_data_interface(mtd, conf);
> > +			if (!ret)
> > +				break;
> > +		}
> > +	} else {
> > +		mode = chip->onfi_timing_mode_default;
> > +		conf->timings.sdr =
> > +				*onfi_async_timing_mode_to_sdr_timings(mode);
> > +
> > +		ret = nand_check_data_interface(mtd, conf);
> > +	}
> > +
> > +	if (!ret) {
> > +		uint8_t tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { mode };
> > +		int i;
> > +
> > +		/*
> > +		 * Ensure the timing mode has be changed on the chip side
> > +		 * before changing timings on the controller side.
> > +		 */
> > +		if (modes != ONFI_TIMING_MODE_UNKNOWN) {
> > +			/*
> > +			 * FIXME: should we really set the timing mode on all
> > +			 * dies?
> > +			 */
> > +			for (i = 0; i < chip->numchips; i++) {
> > +				chip->select_chip(mtd, i);
> > +				ret = chip->onfi_set_features(mtd, chip,
> > +						ONFI_FEATURE_ADDR_TIMING_MODE,
> > +						tmode_param);
> > +			}
> > +			chip->select_chip(mtd, -1);
> > +		}
> > +
> > +		if (!ret) {
> > +			ret = nand_setup_data_interface(mtd, conf);
> > +
> > +			/*
> > +			 * Reset the NAND chip if the data interface setup
> > +			 * failed so that the chip goes back to a known state
> > +			 * (timing mode 0).
> > +			 */
> > +			if (ret)
> > +				chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
> > +		}
> > +	}
> > +
> > +	kfree(conf);
> > +
> > +	return ret;
> > +}
> > +
> >  /*
> >   * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise.
> >   */
> > @@ -3906,6 +4044,11 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
> >  		chip->options &= ~NAND_SAMSUNG_LP_OPTIONS;
> >  ident_done:
> >  
> > +	/*
> > +	 * Setup the NAND interface (interface type + timings).
> > +	 */
> > +	nand_configure_data_interface(mtd);
> > +
> 
> Need to check the returned value.

The reason I don't check the return value here is because the
->setup_data_interface() function is not mandatory, and
nand_configure_data_interface() will return -ENOTSUPP if it's not
implemented. But maybe we should check the return value and avoid
calling this function if chip->setup_data_interface() is not
implemented.

> 
> Also, it doesn't feel right to configure the timings in nand_get_flash_type.
> How about something like this:

Yes, it's probably a better place.

> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 947e74d24ee8..5fae81101c32 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4009,11 +4009,6 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  		chip->options &= ~NAND_SAMSUNG_LP_OPTIONS;
>  ident_done:
>  
> -	/*
> -	 * Setup the NAND interface (interface type + timings).
> -	 */
> -	nand_configure_data_interface(mtd);
> -
>  	/* Try to identify manufacturer */
>  	for (maf_idx = 0; nand_manuf_ids[maf_idx].id != 0x0; maf_idx++) {
>  		if (nand_manuf_ids[maf_idx].id == *maf_id)
> @@ -4189,6 +4184,13 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  		goto err;
>  	}
>  
> +	/*
> +	 * Setup the NAND interface (interface type + timings).
> +	 */
> +	ret = nand_configure_data_interface(mtd);
> +	if (ret)
> +		return ret;
> +
>  	chip->select_chip(mtd, -1);
> [..]
>  
> 
> >  	/* Try to identify manufacturer */
> >  	for (maf_idx = 0; nand_manuf_ids[maf_idx].id != 0x0; maf_idx++) {
> >  		if (nand_manuf_ids[maf_idx].id == *maf_id)
> > @@ -4033,6 +4176,41 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
> >  	/* Set the default functions */
> >  	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
> >  
> > +	/*
> > +	 * Allocate an interface config struct if the controller implements the
> > +	 * ->apply_interface_conf() method.
> > +	 */
> > +	if (chip->setup_data_interface) {
> > +		chip->data_iface = kzalloc(sizeof(*chip->data_iface),
> > +					   GFP_KERNEL);
> > +		if (!chip->data_iface)
> > +			return -ENOMEM;
> > +
> > +		/*
> > +		 * The ONFI specification says:
> > +		 * "
> > +		 * To transition from NV-DDR or NV-DDR2 to the SDR data
> > +		 * interface, the host shall use the Reset (FFh) command
> > +		 * using SDR timing mode 0. A device in any timing mode is
> > +		 * required to recognize Reset (FFh) command issued in SDR
> > +		 * timing mode 0.
> > +		 * "
> > +		 *
> > +		 * Configure the data interface in SDR mode and set the
> > +		 * timings to timing mode 0. The Reset command is issued
> > +		 * in nand_get_flash_type().
> > +		 */
> > +
> > +		chip->data_iface->type = NAND_SDR_IFACE;
> > +		chip->data_iface->timings.sdr =
> > +				*onfi_async_timing_mode_to_sdr_timings(0);
> > +		ret = chip->setup_data_interface(mtd, chip->data_iface, false);
> > +		if (ret) {
> > +			pr_err("Failed to configure data interface to SDR timing mode 0\n");
> > +			goto err;
> > +		}
> > +	}
> > +
> >  	/* Read the flash type */
> >  	type = nand_get_flash_type(mtd, chip, &nand_maf_id,
> >  				   &nand_dev_id, table);
> > @@ -4041,7 +4219,9 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
> >  		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
> >  			pr_warn("No NAND device found\n");
> >  		chip->select_chip(mtd, -1);
> > -		return PTR_ERR(type);
> > +		kfree(chip->data_iface);
> 
> You free data_iface here...

Oops, probably a leftover of a previous version where I was not freeing
chip->data_iface in the error path.
I'll fix that.

> 
> > +		ret = PTR_ERR(type);
> > +		goto err;
> >  	}
> >  
> >  	chip->select_chip(mtd, -1);
> > @@ -4069,6 +4249,10 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
> >  	mtd->size = i * chip->chipsize;
> >  
> >  	return 0;
> > +
> > +err:
> > +	kfree(chip->data_iface);
> 
> ...and again here.
> 
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL(nand_scan_ident);
> >  
> > @@ -4476,6 +4660,9 @@ void nand_release(struct mtd_info *mtd)
> >  
> >  	mtd_device_unregister(mtd);
> >  
> > +	/* Free interface config struct */
> > +	kfree(chip->data_iface);
> > +
> >  	/* Free bad block table memory */
> >  	kfree(chip->bbt);
> >  	if (!(chip->options & NAND_OWN_BUFFERS))
> > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> [..]
> >  /**
> >   * struct nand_chip - NAND Private Flash Chip Data
> >   * @IO_ADDR_R:		[BOARDSPECIFIC] address to read the 8 I/O lines of the
> > @@ -690,6 +750,10 @@ struct nand_chip {
> >  	int (*onfi_get_features)(struct mtd_info *mtd, struct nand_chip *chip,
> >  			int feature_addr, uint8_t *subfeature_para);
> >  	int (*setup_read_retry)(struct mtd_info *mtd, int retry_mode);
> > +	int (*setup_data_interface)(struct mtd_info *mtd,
> > +				    const struct nand_data_interface *conf,
> > +				    bool check_only);
> 
> The function lacks its proper documentation in the comment above
> the struct.
> 

Yep, I'll document this new function.

Thanks for your review.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
