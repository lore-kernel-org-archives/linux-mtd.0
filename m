Received: from mail-ie0-x236.google.com ([2607:f8b0:4001:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZOOV-0008W1-IC
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 17:08:24 +0000
Received: by mail-ie0-f182.google.com with SMTP id as1so4457185iec.27
 for <linux-mtd@lists.infradead.org>; Thu, 24 Oct 2013 10:08:02 -0700 (PDT)
Date: Thu, 24 Oct 2013 10:07:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCHv3 2/3] drivers: mtd: devices: Add quad read support.
Message-ID: <20131024170754.GA20061@ld-irv-0074.broadcom.com>
References: <1381332284-21822-1-git-send-email-sourav.poddar@ti.com>
 <1381332284-21822-3-git-send-email-sourav.poddar@ti.com>
 <20131024010619.GA23337@ld-irv-0074.broadcom.com>
 <5268B3B8.4090807@ti.com>
 <20131024073400.GA9863@norris.computersforpeace.net>
 <5268DE0B.7040208@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5268DE0B.7040208@ti.com>
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagannadh.teki@gmail.com>,
 balbi@ti.com, Huang Shijie <b32955@freescale.com>, broonie@kernel.org,
 linux-mtd@lists.infradead.org, spi-devel-general@lists.sourceforge.net,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 24, 2013 at 02:14:59PM +0530, Sourav Poddar wrote:
> On Thursday 24 October 2013 01:04 PM, Brian Norris wrote:
> >I just submitted my cleanups which (among other things) fixes this bug.
> >I believe I CC'd you. Go ahead and review it, and if it works to your
> >liking, please just base your work on top of it. I'll apply some or all
> >of that series if no one objects.
> >
> Ok.

I'll push parts the reviewed parts of my patch series now, so you can
base off them. (I'm still open to comments on them, though.)

> >Do all parts that support quad read also support all the other quad
> >opcodes (like quad program)?
> >
> I have Spansion and Macronix flash with me.
> 
> For spansion,
> supported quad commands are:
> QOR(0x6b) which is what I am using.
> QIOR(0xeb)
> DDR QIOR(0xed)
> 
> For macronix,
> QOR(0x6b) which is what I am using.
> QIOR(0xeb)

So it seems there are flash which support quad read but not quad
program. So the flag I recommended (M25P80_QUAD) should be made specific
to quad read (M25P80_QUAD_READ) I guess, since we may support page
program eventually.

Brian
