Date: Wed, 26 Aug 2015 11:22:18 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org
Message-ID: <556969379.42228.1440606138002.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <20150825213408.GP81844@google.com>
References: <447095612.147126.1421278909058.JavaMail.zimbra@xes-inc.com>
 <288216793.189179.1438710774869.JavaMail.zimbra@xes-inc.com>
 <20150825213408.GP81844@google.com>
Subject: Re: [PATCH] mtd: fsl_upm: Enable software BCH ECC support
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

----- Original Message -----
> From: "Brian Norris" <computersforpeace@gmail.com>
> Sent: Tuesday, August 25, 2015 4:34:08 PM

[snip]

> > --- a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> > @@ -18,6 +18,9 @@ Optional properties:
> >  - chip-delay : chip dependent delay for transferring data from array to
> >  	read registers (tR). Required if property "gpios" is not used
> >  	(R/B# pins not connected).
> > +- nand-ecc-mode : as defined by nand.txt ("soft" and "soft_bch", only).
> > +- nand-ecc-strength : as defined by nand.txt.
> > +- nand-ecc-step-size : as defined by nand.txt.
> 
> These three properties go under the flash node (which is not yet
> documented, though it's mentioned in example and implementation), not
> the controller node. Can you add a separate paragraph/section to
> describe the flash node, and put these properties under that?

Sure thing.

[snip]

> > --- a/drivers/mtd/nand/fsl_upm.c
> > +++ b/drivers/mtd/nand/fsl_upm.c
> > @@ -182,6 +182,7 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
> >  	if (!flash_np)
> >  		return -ENODEV;
> >  
> > +	fun->chip.dn = flash_np;
> >  	fun->mtd.name = kasprintf(GFP_KERNEL, "0x%llx.%s", (u64)io_res->start,
> >  				  flash_np->name);
> >  	if (!fun->mtd.name) {
> > @@ -189,7 +190,39 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
> >  		goto err;
> >  	}
> >  
> > -	ret = nand_scan(&fun->mtd, fun->mchip_count);
> > +	ret = nand_scan_ident(&fun->mtd, fun->mchip_count, NULL);
> > +	if (ret)
> > +		goto err;
> > +
> > +	switch (fun->chip.ecc.mode) {
> > +	case NAND_ECC_NONE:
> 
> Maybe a comment here, to say that we default to soft for legacy reasons?
> "NONE" is actually a potentially valid option (but not likely or
> useful).

OK

> > +		fun->chip.ecc.mode = NAND_ECC_SOFT;
> > +		break;
> > +	case NAND_ECC_SOFT:
> > +		if (fun->chip.ecc.strength && fun->chip.ecc.strength != 1)
> > +			dev_warn(fun->dev, "Ignoring %d-bit software ECC\n",
> > +				fun->chip.ecc.strength);
> 
> Do you really want to ignore this? I think it's fair to make this an
> error case in nand_scan_tail(). Like:
> 
> 	case NAND_ECC_SOFT:
> 		...
> 		if (chip->ecc.strength && chip->ecc.strength != 1) {
> 			// error out
> 			// we really need to kill the heavy usage of
> 			// BUG() in nand_scan_tail()...
> 		}

My rationale was that for "soft" ECC mode, ecc.strength is really a
don't-care property; the driver doesn't use it since the algorithm only
supports 1-bit. Therefore it could be OK to output a warning and carry on.

I can see the other side, too, where we might want all of the
user-supplied values to agree with the capabilities of the driver.

If I rework this, I would intend to accept zeros for ecc.strength and
ecc.size as valid for this mode (size defaults to 256 within nand_ecc.c).
Does that sit well with you?

> 
> > +		if (fun->chip.ecc.size &&
> > +		    (fun->chip.ecc.size != 256) &&
> > +		    (fun->chip.ecc.size != 512)) {
> > +			dev_err(fun->dev, "Invalid software ECC step: %d\n",
> > +				fun->chip.ecc.size);
> 
> Is that a generic soft ECC limitation? (Looks like it only supports 256
> and 512 to me.) If so, then let's put this in nand_base.c. Either in
> nand_dt_init(), or possibly in nand_scan_tail(), under the case for
> NAND_ECC_SOFT.

Yes, it is. OK.

> > +			goto err;
> > +		}
> > +		break;
> > +	case NAND_ECC_SOFT_BCH:
> > +		if (fun->chip.ecc.strength < 2) {
> > +			dev_err(fun->dev, "Invalid BCH ECC strength: %d\n",
> > +				fun->chip.ecc.strength);
> 
> Same here. Maybe in nand_scan_tail()?

OK

-Aaron
