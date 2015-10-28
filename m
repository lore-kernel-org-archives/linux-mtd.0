Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrTeV-0005qF-5h
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2015 16:32:44 +0000
Date: Wed, 28 Oct 2015 17:32:15 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marex@denx.de>
Cc: Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Ezequiel
 Garcia <ezequiel.garcia@free-electrons.com>, Scott Wood
 <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Kyungmin Park <kyungmin.park@samsung.com>, Han Xu
 <han.xu@freescale.com>, Huang Shijie <shijie.huang@arm.com>
Subject: Re: [PATCH 1/5] mtd: ofpart: grab device tree node directly from
 master device node
Message-ID: <20151028173215.0c1c4e30@bbrezillon>
In-Reply-To: <201510281711.14196.marex@denx.de>
References: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
 <20151027175446.GT13239@google.com>
 <20151028085813.4b0b3ac8@bbrezillon>
 <201510281711.14196.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On Wed, 28 Oct 2015 17:11:14 +0100
Marek Vasut <marex@denx.de> wrote:

> On Wednesday, October 28, 2015 at 08:58:13 AM, Boris Brezillon wrote:
> > Hi Brian,
> 
> Hi,
> 
> [...]
> 
> > > Are
> > > there ever cases we want more than one (master) MTD per nand_chip? Or
> > > vice versa?
> > 
> > Nope, I'd say that you always have a 1:1 relationship between a master
> > MTD device and a NAND device.
> 
> Do some sorts of chipselects come into play here ? Ie. you can have one master
> with multiple NAND chips connected to it.

Most NAND controllers support interacting with several chips (or
dies in case your chip embeds several NAND dies), but I keep thinking
each physical chip should have its own instance of nand_chip + mtd_info.
If you want to have a single mtd device aggregating several chips you
can use mtdconcat.

This leaves the multi-dies chip case, and IHMO we should represent those
chips as a single entity, and I guess that's the purpose of the
->numchips field in nand_chip (if your chip embeds 2 dies with 2 CS
lines, then ->numchips should be 2).

Anyway, I think the whole problem here is that most NAND drivers are
mixing the concepts of NAND controller (the controller driving one or
several NAND chips) and NAND chip (a chip connected to a NAND
controller).
The NAND controller should not be represented with a nand_chip
instance, but with a nand_hw_control instance, which is rarely done
except in a few drivers.

I sent an RFC a while ago [1] to clarify that, but didn't have time to
post a new version.

Best Regards,

Boris

[1]http://thread.gmane.org/gmane.linux.drivers.mtd/57614/focus=58552

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
