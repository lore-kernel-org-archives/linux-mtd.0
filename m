Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUez6-0002kk-To
 for linux-mtd@lists.infradead.org; Wed, 26 Aug 2015 17:59:41 +0000
Received: by pacti10 with SMTP id ti10so95365880pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 26 Aug 2015 10:59:19 -0700 (PDT)
Date: Wed, 26 Aug 2015 10:59:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: fsl_upm: Enable software BCH ECC support
Message-ID: <20150826175917.GR81844@google.com>
References: <447095612.147126.1421278909058.JavaMail.zimbra@xes-inc.com>
 <288216793.189179.1438710774869.JavaMail.zimbra@xes-inc.com>
 <20150825213408.GP81844@google.com>
 <556969379.42228.1440606138002.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <556969379.42228.1440606138002.JavaMail.zimbra@xes-inc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 26, 2015 at 11:22:18AM -0500, Aaron Sierra wrote:
> ----- Original Message -----
> > From: "Brian Norris" <computersforpeace@gmail.com>
> > Sent: Tuesday, August 25, 2015 4:34:08 PM

> > > +	case NAND_ECC_SOFT:
> > > +		if (fun->chip.ecc.strength && fun->chip.ecc.strength != 1)
> > > +			dev_warn(fun->dev, "Ignoring %d-bit software ECC\n",
> > > +				fun->chip.ecc.strength);
> > 
> > Do you really want to ignore this? I think it's fair to make this an
> > error case in nand_scan_tail(). Like:
> > 
> > 	case NAND_ECC_SOFT:
> > 		...
> > 		if (chip->ecc.strength && chip->ecc.strength != 1) {
> > 			// error out
> > 			// we really need to kill the heavy usage of
> > 			// BUG() in nand_scan_tail()...
> > 		}
> 
> My rationale was that for "soft" ECC mode, ecc.strength is really a
> don't-care property; the driver doesn't use it since the algorithm only
> supports 1-bit. Therefore it could be OK to output a warning and carry on.

Understood.

> I can see the other side, too, where we might want all of the
> user-supplied values to agree with the capabilities of the driver.

Right. I especially would want to keep sanity on the device tree, as
this is something closer to an ABI (depending on who you ask...) than
internal driver-provided values.

> If I rework this, I would intend to accept zeros for ecc.strength and
> ecc.size as valid for this mode (size defaults to 256 within nand_ecc.c).
> Does that sit well with you?

Sure, that's fair. We've been allowing this in nand_scan_tail() already
(we tend to fill in reasonable defaults if the driver doesn't specify),
so I don't want to remove that fallback. I just don't want people
specifying 4-bit hamming ECC in their DT and not noticing your little
warning log message saying that we're ignoring them and using 1-bit.

But the DT binding doc should not suggest that they can be left at 0. If
you're up for it, perhaps you can add some details in
Documentation/devicetree/bindings/mtd/nand.txt about the "soft" and
"soft_bch" ECC modes while you're at it.

Thanks,
Brian
