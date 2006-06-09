Received: from alephnull.demon.nl ([83.160.184.112] helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FoUfd-0005Lo-9y
	for linux-mtd@lists.infradead.org; Thu, 08 Jun 2006 20:16:34 -0400
Date: Fri, 9 Jun 2006 02:16:06 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Todd Poynor <toddpoynor@gmail.com>
Subject: Re: pxa2xx-flash again, please?
Message-ID: <20060609001606.GC26509@xi.wantstofly.org>
References: <Pine.LNX.4.63.0606080916491.1760@pcgl.dsa-ac.de>
	<20060608073632.GA12338@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0606080955050.1760@pcgl.dsa-ac.de>
	<20060608115208.GA4155@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0606081356100.1760@pcgl.dsa-ac.de>
	<44887D8C.2040806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44887D8C.2040806@gmail.com>
Cc: tpoynor@infradead.org, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	=?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 08, 2006 at 12:42:04PM -0700, Todd Poynor wrote:

> >>> Sorry. This patch has been committed to mtd CVS (I think so, as it
> >>> appeared on mtd-cvs ML:
> >>> http://lists.infradead.org/pipermail/linux-mtd-cvs/2005-December/005252.html) 
> >>>
> >>> and I asked this question already a few weeks ago, so, I thought it 
> >>> might
> >>> ring the bell... The problem is - the patch has been submitted last
> >>> December still it is not in stock kernel nor in 2 mtd git-trees on
> >>> kernel.org/git, so...
> >>
> >> Well, the cvs has basically been abandoned.  There was some effort to
> >> pull the important patches from cvs into git, but as you noticed,
> >> things were lost.
> >>
> >> Not sure whether the patch makes sense or not.  Maybe Todd can comment
> >> that.
> > 
> > I think it does. It makes one file per (pxa) platform fewer.
> 
> When I last checked the patch was a good thing, collapsing two 
> practically identical XScale PXA2xx mapping drivers into one and 
> converting to platform devices.

I'd also like to see the unified pxa2xx flash mapping driver go in, so
that it can be used by the LogicPD PXA270 board support code (merged in
2.6.17) too, instead of making Yet Another copy of mainstone-flash.c.


cheers,
Lennert
