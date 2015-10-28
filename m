Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrXUh-0003m9-79
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2015 20:38:52 +0000
From: Marek Vasut <marex@denx.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/5] mtd: ofpart: grab device tree node directly from
 master device node
Date: Wed, 28 Oct 2015 21:38:20 +0100
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Scott Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>,
 Huang Shijie <shijie.huang@arm.com>
References: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
 <201510281711.14196.marex@denx.de> <20151028173215.0c1c4e30@bbrezillon>
In-Reply-To: <20151028173215.0c1c4e30@bbrezillon>
MIME-Version: 1.0
Message-Id: <201510282138.20754.marex@denx.de>
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, October 28, 2015 at 05:32:15 PM, Boris Brezillon wrote:
> Hi Marek,

Hi Boris,

> On Wed, 28 Oct 2015 17:11:14 +0100
> 
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
> > Do some sorts of chipselects come into play here ? Ie. you can have one
> > master with multiple NAND chips connected to it.
> 
> Most NAND controllers support interacting with several chips (or
> dies in case your chip embeds several NAND dies), but I keep thinking
> each physical chip should have its own instance of nand_chip + mtd_info.
> If you want to have a single mtd device aggregating several chips you
> can use mtdconcat.

I agree.

> This leaves the multi-dies chip case, and IHMO we should represent those
> chips as a single entity, and I guess that's the purpose of the
> ->numchips field in nand_chip (if your chip embeds 2 dies with 2 CS
> lines, then ->numchips should be 2).

I'd expect this to be represented as two physical chips, no ?

> Anyway, I think the whole problem here is that most NAND drivers are
> mixing the concepts of NAND controller (the controller driving one or
> several NAND chips) and NAND chip (a chip connected to a NAND
> controller).
> The NAND controller should not be represented with a nand_chip
> instance, but with a nand_hw_control instance, which is rarely done
> except in a few drivers.

OK, understood.

> I sent an RFC a while ago [1] to clarify that, but didn't have time to
> post a new version.
> 
> Best Regards,
> 
> Boris
> 
> [1]http://thread.gmane.org/gmane.linux.drivers.mtd/57614/focus=58552

Best regards,
Marek Vasut
