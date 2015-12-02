Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4Def-00074C-Ux
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 20:05:34 +0000
Date: Wed, 2 Dec 2015 12:05:06 -0800
From: Tony Lindgren <tony@atomide.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Roger Quadros <rogerq@ti.com>, dwmw2@infradead.org,
 ezequiel@vanguardiasur.com.ar, javier@dowhile0.org, fcooper@ti.com,
 nsekhar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 00/27] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
Message-ID: <20151202200506.GF23396@atomide.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
 <20151026212346.GJ13239@google.com> <562F45BF.8020205@ti.com>
 <20151130195449.GI64635@google.com> <565DB18C.7040505@ti.com>
 <20151202032643.GF64635@google.com> <565E7DAC.7060401@ti.com>
 <20151202150317.GC23396@atomide.com>
 <20151202181330.GG64635@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151202181330.GG64635@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Brian Norris <computersforpeace@gmail.com> [151202 10:14]:
> On Wed, Dec 02, 2015 at 07:03:17AM -0800, Tony Lindgren wrote:
> > * Roger Quadros <rogerq@ti.com> [151201 21:13]:
> > > On 02/12/15 08:56, Brian Norris wrote:
> > > > 
> > > > I'll take another pass over your patch set, but if things are looking
> > > > better, how do you expect to merge this? There are significant portions
> > > > that touch at least 2 or 3 different subsystem trees, AFAICT.
> > > 
> > > Tony could create an immutable branch with all the dts and memory changes.
> > > You could base the mtd changes on top of that?
> > 
> > If we all agree on that it will be immutable Roger can set up the branch
> > with our acks and we can all merge it in as needed. I believe v4.4-rc1
> > should work as a base for us all?
> 
> There are oustanding comments about the NAND ready/busy GPIO naming in
> patch 18, which I'd like addressed. I'll re-review the rest before the
> end of the day (West Coast U.S.A.). I'm not sure my acks are worth much
> beyond the MTD stuff.

OK, I'm happy with the gpmc related parts.

> Regarding branches, 4.4-rc1 is fine with me.

OK

Thanks,

Tony
