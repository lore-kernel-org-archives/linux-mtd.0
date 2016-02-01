Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQLPy-0000Uz-1y
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 20:49:50 +0000
Received: by mail-pf0-x22a.google.com with SMTP id o185so84882733pfb.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 12:49:29 -0800 (PST)
Date: Mon, 1 Feb 2016 12:49:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, Hauke Mehrtens <hauke@hauke-m.de>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: brcmnand: set initial ECC params based on info from
 HW
Message-ID: <20160201204926.GL19540@google.com>
References: <1453881500-11736-1-git-send-email-zajec5@gmail.com>
 <20160201175342.GF19540@google.com> <56AF9F58.4050103@gmail.com>
 <20160201190238.GJ19540@google.com> <56AFC102.5090000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56AFC102.5090000@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 01, 2016 at 12:33:06PM -0800, Florian Fainelli wrote:
> On 01/02/16 11:02, Brian Norris wrote:
> > On Mon, Feb 01, 2016 at 10:09:28AM -0800, Florian Fainelli wrote:
> >> The Marvell PXA3XX NAND controller has a "marvell,nand-keep-config"
> >> which seems to be in par with what Rafal is after here, maybe it would
> >> be worth standardizing/mimicing that kind of property for the brcmnand
> >> driver?
> > 
> > Maybe. Honestly, it's not that clear to me what the pxa3xx-nand binding
> > means. But if we make that clear, that could be a possibility.
> 
> I would argue that if you were down the road of looking at the
> bootloader defaults to figure out why things did not work, it's not that
> much of a stretch to put the correct information in Device Tree, leading
> to predictable results, so ...

I wasn't suggesting trying to reintroduce any complex
bootloader-matching logic. I think either we should stick with:

(a) all info (ECC step size + strength) goes in DT (as-is) or
(b) we provide a DT option to say "keep the ECC settings configured by
    the bootloader"

If we go with (a), I'd still propose my original suggestion, if that
helps Rafal's use case:

> >>> What if we just print out the hardware defaults when we bail out due to
> >>> missing ECC DT properties? Then developers can choose to set up their DT
> >>> with these properties, if those are actually proven correct. Would that
> >>> save you the hours of setup you mention?

Regards,
Brian
