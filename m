Received: from host.buserror.net ([209.198.135.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2tG9-0003gq-Us
 for linux-mtd@lists.infradead.org; Wed, 18 May 2016 04:39:02 +0000
Message-ID: <1463546309.16584.130.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marex@denx.de>, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, u-boot@lists.denx.de,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Alexander
 Kaplan <alex@nextthing.co>, Brian Norris <computersforpeace@gmail.com>
Date: Tue, 17 May 2016 23:38:29 -0500
In-Reply-To: <20160516140210.746f913d@bbrezillon>
References: <20160425164314.15c3fc94@bbrezillon>
 <20160425173646.GM3732@bill-the-cat> <20160425225357.7bb6338d@bbrezillon>
 <1462252005.16584.34.camel@buserror.net>
 <20160516140210.746f913d@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [U-Boot] Porting Linux's MTD/NAND changes into U-Boot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2016-05-16 at 14:02 +0200, Boris Brezillon wrote:
> Hi Scott,
> 
> On Tue, 03 May 2016 00:06:45 -0500
> Scott Wood <oss@buserror.net> wrote:
> 
> > I usually do syncs when someone complains about needing a sync.  Every
> > release
> > seems a bit much.  I'll try to do one soon.
> 
> Sorry to bother you with that, but can I ask when you plan to do this
> sync (I guess you'll sync with 4.6)? As I explained, I depend on
> features introduced in 4.6 to make the sunxi NAND driver usable on
> sunxi based boards (the concept of data randomizer/scrambler is
> required on some MLC NANDs, and most Allwinner boards embed this
> kind of NAND chips).
> 
> Don't hesitate to let me know if you need some help.

I'm working on it now.  Yes, with 4.6.

-Scott
