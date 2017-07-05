Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dSrNN-0004vt-4q
 for linux-mtd@lists.infradead.org; Wed, 05 Jul 2017 20:58:22 +0000
Received: by mail-wr0-x244.google.com with SMTP id k67so212465wrc.1
 for <linux-mtd@lists.infradead.org>; Wed, 05 Jul 2017 13:58:00 -0700 (PDT)
Date: Wed, 5 Jul 2017 20:57:48 +0000
From: Karl Beldan <karl.beldan@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Karl Beldan <karl.beldan+oss@gmail.com>
Subject: Re: [PATCH] brcmnand: Fix up the flash cache register offset for
 older controllers
Message-ID: <20170705205707.36bgfwvwp7hz4wsc@gobelin>
References: <20170705174653.21797-1-karl.beldan+oss@gmail.com>
 <7f7804da-e431-f197-31b9-c98359b9151a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f7804da-e431-f197-31b9-c98359b9151a@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 05, 2017 at 11:15:01AM -0700, Florian Fainelli wrote:
> On 07/05/2017 10:46 AM, Karl Beldan wrote:
> > From: Karl Beldan <karl.beldan-ext@sagemcom.com>
> > 
> > Tested on BCM{63138,6838,63268} and cross checked with the various
> > *_map_part.h which the brcmnand_regs_v* in brcmnand.c have historically
> > been derived from.
> 
> BCM63138 is using a 7.0 controller, 6838 uses a 5.0 controller, but has
> a separate flash cache register which does indeed end up at 0x400 bytes
> off the main FLASH block, and finally 63268 does have a v4.0 controller
> and the flash cache is also in a separate register that makes it end up
> at 0x400.
> 
> Your change, as proposed would break chips like 7425 which use 5.0
> controller with the flash cache at 0x200 bytes.
> 
> The binding describes an optional flash-cache register cell that you can
> specify, so that's probably what you want to do here?
> 

I wasn't aware the flash cache offset was variable but the flash-cache
binding you are pointing to makes it obvious ;). 
 
Karl
