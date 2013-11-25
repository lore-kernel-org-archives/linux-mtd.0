Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VkxWb-0002UC-10
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2013 14:52:35 +0000
Date: Mon, 25 Nov 2013 11:52:18 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand: auto-detection of NAND bus-width from ONFI
 param or nand_id[]
Message-ID: <20131125145217.GA14485@localhost>
References: <1385382728-7913-1-git-send-email-pekon@ti.com>
 <20131125125647.GF2408@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA4E675@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA4E675@DBDE04.ent.ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 25, 2013 at 01:26:11PM +0000, Gupta, Pekon wrote:
> Hi Ezequiel,
> 
> 
> > From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
> > Thanks for taking care of this! :-)
> > 
> Yes, I was waiting for -rc1 to be TI-GPMC driver which still gets configured
> from DT independently. However that’s a separate discussion already
> going in your earlier thread.
> 
> 
> > > On Mon, Nov 25, 2013 at 06:02:08PM +0530, Pekon Gupta wrote:
> [...]
> > > +
> > > +	/* re-configure driver is bus-width was incorrectly configured */
> > > +	if (busw != (chip->options & NAND_BUSWIDTH_16)) {
> > > +		pr_warn("reconfiguring NAND bus width to %d instead %d
> > bit\n",
> > > +			   busw ? 16 : 8,
> > > +			   (chip->options & NAND_BUSWIDTH_16) ? 16 : 8);
> > > +		chip->options = (chip->options & ~NAND_BUSWIDTH_16) |
> > busw;
> > 
> > Looking at this makes me wonder why are we *re* configuring, instead of
> > just configuring. I mean, why do we keep the NAND_BUSWIDTH_16 setting?
> > 
> > What use case might need the user to set it, before hand?
> > 
> Nothing.. I just said reconfiguring, bcoz some driver already configure
> 'chip->options & NAND_BUSWIDTH_16' pre-hand before calling
> nand_scan_ident(). So, I wanted to convey that this patch should not
> affect any of their functionality. And no change is should be required.
> 
> Need this to get tested with -ve testing on different boards.. 
> (like setting in-correct DT binding nand-bus-width and driver should still
> be able to detect and probe ONFI params) Then only it proves that this
> patch is actually auto-detecting bus-width under all cases for all controllers.
> 

You seem to keep insisting with the kernel auto-fixing after wrong DT
configuration. I don't think that should matter.

My point is: why don't we *remove* the devicetree property nand-bus-width and the
NAND_BUSWIDTH_16 entirely, together with this patch?

Sounds like the user shouldn't need to mess with any of these, since we
are able to auto-configure things for him.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
