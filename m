Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScHxj-0005BQ-06
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 15:15:55 +0000
Received: by werc12 with SMTP id c12so5309548wer.36
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2012 08:15:53 -0700 (PDT)
Date: Wed, 6 Jun 2012 18:15:29 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: artem.bityutskiy@linux.intel.com
Subject: Re: flash bbt broken due to unitialized bitflip_threshold?
Message-ID: <20120606181529.291aa9a6@halley>
In-Reply-To: <1338989453.6875.49.camel@sauron.fi.intel.com>
References: <20120605220647.GV30400@pengutronix.de>
 <20120606125013.5897a02d@pixies.home.jungo.com>
 <1338989453.6875.49.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Wed, 06 Jun 2012 16:30:53 +0300 Artem Bityutskiy <artem.bityutskiy@linux.intel.com> wrote:
> On Wed, 2012-06-06 at 12:50 +0300, Shmulik Ladkani wrote:
> > +	if (!mtd->bitflip_threshold)
> > +		mtd->bitflip_threshold = mtd->ecc_strength;
> 
> Hmm, why se default is to report bit-flips only when one more flipping
> bit would cause an ECC error? The default be 1 - report on any bit-flip.
> The same should be done in 'add_mtd_device()' - we should preserve the
> old behavior, as it was before these patches. Do I miss something?

Mike's patchset modified behavior of mtd_read() to return EUCLEAN only
if max number of bitflips (per ecc step) exceeds the bitflip_threshold:

	return ret_code >= mtd->bitflip_threshold ? -EUCLEAN : 0;

mtd->bitflip_threshold can be set in the following ways:
- By the lowlevel driver
- By 'add_mtd_device'. Here it defaults to 'ecc_strength' if NOT
  previously set by the driver.
- Using sysfs attribute

Currently, no driver explicitly sets bitflip_threshold, so it defaults
to ecc_strength. This is not necessarily 1; it depends on the hardware
driver, or software algorithm, etc...

So the "old behavior" was not preserved by the patchset, at least for
those setups with ecc_strength greater than 1. And I don't think the
intention was to preserve 'bitflip_threshold' as 1.

As Sascha spotted, the patchset created a problem for 'scan_bbt'.
This is since 'scan_bbt' calls 'mtd_read()' to read the BBT pages,
however 'bitflip_threshold' is usually NOT YET assigned at that point,
which results in mtd_read's condition (quoted above) to ALWAYS
return -EUCLEAN.
This leads to constantly scrubbing the BBT. Ouch.

My suggestion is to assign the default value of 'ecc_strength' to
'bitflip_threshold' at the end of 'nand_scan_tail', PRIOR the call to
scan_bbt().
Hence, BBT will be scrubbed only if maximum bitflips exceeded the
'ecc_strength' of this mtd (which is the default behavior).

Does it make sense to you?

Or would you like to scrub the BBT upon every bitflip, regardless
ecc_strength?

Regards,
Shmulik
