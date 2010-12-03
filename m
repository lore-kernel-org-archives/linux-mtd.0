Received: from mho-01-ewr.mailhop.org ([204.13.248.71])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1POYkW-0003x9-IQ
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2010 16:44:45 +0000
Date: Fri, 3 Dec 2010 08:44:31 -0800
From: Tony Lindgren <tony@atomide.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH V2] omap: nand: remove hardware ECC as default
Message-ID: <20101203164430.GE17222@atomide.com>
References: <1290177926-3526-1-git-send-email-s-ghorai@ti.com>
	<20101130180542.GP17222@atomide.com>
	<1291393325.2365.72.camel@localhost>
	<1291394352.5992.4.camel@i7.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1291394352.5992.4.camel@i7.infradead.org>
Cc: Sukumar Ghorai <s-ghorai@ti.com>, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* David Woodhouse <dwmw2@infradead.org> [101203 08:29]:
> On Fri, 2010-12-03 at 18:22 +0200, Artem Bityutskiy wrote:
> > On Tue, 2010-11-30 at 10:05 -0800, Tony Lindgren wrote:
> > > * Sukumar Ghorai <s-ghorai@ti.com> [101119 06:36]:
> > > > CONFIG_MTD_NAND_OMAP_HWECC defined wrongly in patch submitted for 2.6.36.
> > > > This flag enables hw ecc by default. Boards like beagle and pandora uses
> > > > sw ecc for write (e.g. binary flushed from u-boot) and read from kernel.
> > > > https://patchwork.kernel.org/patch/111036/
> > > > 
> > > > Signed-off-by: Sukumar Ghorai <s-ghorai@ti.com>
> > > 
> > > This should go in as a fix for the -rc via MTD list if possible.
> > > 
> > > Acked-by: Tony Lindgren <tony@atomide.com>
> > 
> > Tony, I think this is quite simple patch, and you can merge it yourself,
> > MTD tree is slow. I hope dwmw2 will not beat me for this, but unless he
> > quickly jumps in and confirms he takes care of this patch, just go ahead
> > an merge it. I've put dwmw2 to "To:", just in case.
> 
> Acked-by: David Woodhouse <David.Woodhouse@intel.com>
> 
> Unless you'd prefer me to send it on myself, please feel free to submit
> it to Linus directly.

Thanks, I'll queue it.

Regards,

Tony
