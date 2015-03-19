Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYPam-0001hh-RW
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 01:49:49 +0000
Received: by padcy3 with SMTP id cy3so59624403pad.3
 for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2015 18:49:27 -0700 (PDT)
Date: Wed, 18 Mar 2015 18:49:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Message-ID: <20150319014921.GQ32500@ld-irv-0074>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
 <55072714.9080104@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55072714.9080104@gmail.com>
Cc: devicetree@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 16, 2015 at 11:55:16AM -0700, Florian Fainelli wrote:
> On 06/03/15 17:18, Brian Norris wrote:
> > +static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
> > +{
> > +	static const unsigned int block_sizes_v6[] = { 8, 16, 128, 256, 512, 1024, 2048, 0 };
> > +	static const unsigned int block_sizes_v4[] = { 16, 128, 8, 512, 256, 1024, 2048, 0 };
> > +	static const unsigned int page_sizes[] = { 512, 2048, 4096, 8192, 0 };
> > +
> > +	ctrl->nand_version = nand_readreg(ctrl, 0) & 0xffff;
> > +
> > +	/* Only support v4.0+? */
> > +	if (ctrl->nand_version < 0x0400)
> > +		return -ENODEV;
> 
> It could be nice to have an informative error message here that this is
> either:
> 
> - an unknown controller revision (> 7.1)
> - an older controller revision
> - a check against the compatible property, just in case?

I'll add a message that the revision is not supported. The DT binding
should catch this too, so this check is just an extra safeguard.

> [snip]
> 
> > +		ctrl->cs_offsets = brcmnand_cs_offsets_v71;
> > +	} else {
> > +		ctrl->cs_offsets = brcmnand_cs_offsets;
> > +
> > +		/* pre-v5.0 has a different CS0 offset layout */
> > +		if (ctrl->nand_version <= 0x0500)
> > +			ctrl->cs0_offsets = brcmnand_cs_offsets_cs0;
> 
> Based on this check, should the comment should be "pre-v5.0 and v5.0
> have a different CS0 offset layout"?

Yes. Fixed.

Brian
