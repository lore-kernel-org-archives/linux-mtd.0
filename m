Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrUJJ-0006SZ-Rj
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2015 17:14:55 +0000
Received: by padhk11 with SMTP id hk11so12547386pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2015 10:14:33 -0700 (PDT)
Date: Wed, 28 Oct 2015 10:14:30 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Scott Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Han Xu <han.xu@freescale.com>, Huang Shijie <shijie.huang@arm.com>
Subject: Re: [PATCH 1/5] mtd: ofpart: grab device tree node directly from
 master device node
Message-ID: <20151028171430.GC13239@google.com>
References: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
 <20151027175446.GT13239@google.com>
 <20151028085813.4b0b3ac8@bbrezillon>
 <201510281711.14196.marex@denx.de>
 <20151028173215.0c1c4e30@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151028173215.0c1c4e30@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 28, 2015 at 05:32:15PM +0100, Boris Brezillon wrote:
> On Wed, 28 Oct 2015 17:11:14 +0100
> Marek Vasut <marex@denx.de> wrote:
> > On Wednesday, October 28, 2015 at 08:58:13 AM, Boris Brezillon wrote:
> > > Hi Brian,
> > 
> > Hi,
> > 
> > [...]
> > 
> > > > Are
> > > > there ever cases we want more than one (master) MTD per nand_chip? Or
> > > > vice versa?
> > > 
> > > Nope, I'd say that you always have a 1:1 relationship between a master
> > > MTD device and a NAND device.
> > 
> > Do some sorts of chipselects come into play here ? Ie. you can have one master
> > with multiple NAND chips connected to it.
> 
> Most NAND controllers support interacting with several chips (or
> dies in case your chip embeds several NAND dies), but I keep thinking
> each physical chip should have its own instance of nand_chip + mtd_info.
> If you want to have a single mtd device aggregating several chips you
> can use mtdconcat.
> 
> This leaves the multi-dies chip case, and IHMO we should represent those
> chips as a single entity, and I guess that's the purpose of the
> ->numchips field in nand_chip (if your chip embeds 2 dies with 2 CS
> lines, then ->numchips should be 2).

Yes, I think that's some of the intention there. And so even in that
case, a multi-die chip gets represented as a single struct nand_chip.

Brian
