Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmgLk-0007Fi-El
 for linux-mtd@lists.infradead.org; Sat, 30 Nov 2013 08:56:29 +0000
Received: by mail-pd0-f178.google.com with SMTP id y10so14850390pdj.23
 for <linux-mtd@lists.infradead.org>; Sat, 30 Nov 2013 00:56:06 -0800 (PST)
Date: Sat, 30 Nov 2013 00:56:02 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 0/1] Fix OMAP2 NAND ONFI device detection
Message-ID: <20131130085602.GC29397@norris.computersforpeace.net>
References: <1383126788-27426-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131030191414.GA16668@norris.computersforpeace.net>
 <20980858CB6D3A4BAE95CA194937D5E73EA2D41D@DBDE04.ent.ti.com>
 <20131030231956.GA2489@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131030231956.GA2489@localhost>
Cc: "marek.belisko@gmail.com" <marek.belisko@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, u.kleine-koenig@pengutronix.de,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

Dragging up an old piece of the conversation, but I think this
highlights some of the difficulty we're still having. Perhaps I should
have headed this off a month ago...

On Wed, Oct 30, 2013 at 08:19:57PM -0300, Ezequiel Garcia wrote:
> On Wed, Oct 30, 2013 at 09:18:53PM +0000, Gupta, Pekon wrote:
> > > 
> > > I'm not sure, of course, but I don't see why not. It's more likely to
> > > break for x16 than it is for x8.
> > > 
> > Another question here is ..
> > The above patch assumes that user has configured GPMC bus-width
> > correctly, so if user is already providing GPMC bus-width information
> > via DT, then do we really need to detect NAND device bus-width again
> > using NAND_BUSWIDTH_AUTO ?
> >
> 
> Hm.. I think you're forgetting the original motivation for this patch,
> which was initially explained by you :-) The problem is ONFI doesn't work
> in 16-bit mode.

So fix our ONFI detection code! Uwe's patch has helped reinforce what I
believe (but can't test yet, as I have no x16 hardware): that we can
*fix* the ONFI code so that it doesn't matter what bus width "mode" we
are in, but we can *always* identify the lower 8 bits of the bus.

> Let me clarify. Since GPMC and NAND widths *must* match (otherwise, it
> wouldn't make much sense, right?) we don't really need to autodetect the
> NAND width.

The rest of your argument should be trimmed here. Your following
comments are seemingly a hack to get around the fact that we don't
support ONFI correctly. But I think we should take a look at Uwe's
approach before going this far on a hack.

> However, since ONFI doesn't work in 16-bit mode, we would have to do
> something like this (untested pseudo code):
> 
>   nand_scan_ident(...);
> 
>   if (platform_data->devsize == 16)
>   	nand_chip->options |= NAND_BUSWIDTH_16;
> 
> And in some cases we might even get away with such solution. However,
> we can't guarantee nand_scan_ident() doesn't need to swith to 16-bit mode
> inside to perform other commands (maybe some ONFI extended parameter page).

(ONFI extended parameter page is only on the lower 8 bits too. So no
"16-bit mode" there.)

> I must admit I'm a bit puzzled by seeing most drivers setting 16-bit
> before calling nand_scan_ident(). I guess none of them relies on ONFI?

I'm fairly confident that most of those drivers have never been used
with a 16-bit bus width since the introduction of ONFI. I believe x16 is
much less common than x8, and there are probably several drivers that
get little or no use anyway. I think the closest we got to testing
results was when a developer complained about this line in the ONFI
code:

	WARN_ON(chip->options & NAND_BUSWIDTH_16);

resulting in commit 0ce82b7f7b7373b16ecf7b5725e21e2975204500. (It's
notable Paul was using similar hardware to you and Pekon...)

Brian
