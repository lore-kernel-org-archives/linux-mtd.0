Received: from mail-pb0-x235.google.com ([2607:f8b0:400e:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W43RI-0000Pg-6i
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 07:02:00 +0000
Received: by mail-pb0-f53.google.com with SMTP id ma3so3715611pbc.26
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2014 23:01:36 -0800 (PST)
Date: Thu, 16 Jan 2014 23:01:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: m25p80: Use OPCODE_QUAD_READ_4B for 4-byte addressing
Message-ID: <20140117070131.GN1992@norris-Latitude-E6410>
References: <1389800935-6468-1-git-send-email-geert@linux-m68k.org>
 <201401160109.34499.marex@denx.de>
 <20140116210529.GF8919@ld-irv-0074>
 <20140117020453.GC27652@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140117020453.GC27652@shlinux2.ap.freescale.net>
Cc: Marek Vasut <marex@denx.de>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org,
 Sourav Poddar <sourav.poddar@ti.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 17, 2014 at 10:04:54AM +0800, Huang Shijie wrote:
> On Thu, Jan 16, 2014 at 01:05:29PM -0800, Brian Norris wrote:
> > On Thu, Jan 16, 2014 at 01:09:34AM +0100, Marek Vasut wrote:
> > > On Wednesday, January 15, 2014 at 04:48:55 PM, Geert Uytterhoeven wrote:
> > > > From: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
> > > > 
> > > > commit 3487a63955c34ea508bcf4ca5131ddd953876e2d ("drivers: mtd: m25p80: add
> > > > quad read support") in -next added both the 3-byte OPCODE_QUAD_READ and the
> > > > 4-byte OPCODE_QUAD_READ_4B, but incorrectly uses OPCODE_QUAD_READ for both
> > > > 3-byte and 4-byte addressing.
> > > > 
> > > > Use OPCODE_QUAD_READ_4B in the 4-byte case to fix this.
> > 
> > Wow, I noticed this and had a patch privately queued over a month ago
> > for this, but I forgot to send it out... Thanks for noticing!
> > 
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
> > > 
> > > Looks all right.
> > > 
> > > Acked-by: Marek Vasut <marex@denx.de>
> > 
> > Pushed to l2-mtd.git.
> this is a bad news to me. I have to send out a new version for the SPI NOR framework.
> 
> could this patch be merged after my spi-nor patch set? or create a new patch based
> on the spi-nor framework.

This patch is a priority, since it's a bugfix to one that's already
queued up, so it must go first. I haven't taken a look at your latest
series, and I haven't seen comments lately. Was everyone happy with it?
If this conflict is the only problem, I'm sure that can be fixed
trivially. But I'm not sure if it's ready yet anyway. I won't be able to
get to it until next week (at the earliest).

Brian
