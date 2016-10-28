Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c08G8-0001Aa-6v
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 14:35:53 +0000
Date: Fri, 28 Oct 2016 16:35:20 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/4] of: Add device tree bindings for Evatronix
In-Reply-To: <20161026150557.587a7387@bbrezillon>
Message-ID: <alpine.DEB.2.02.1610280900260.9986@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com>
 <20160603162207.0688c9e6@bbrezillon>
 <alpine.DEB.2.02.1606060757180.23377@lnxricardw1.se.axis.com>
 <20160608175018.16c88207@bbrezillon>
 <alpine.DEB.2.02.1606101641050.30757@lnxricardw1.se.axis.com>
 <20160610175454.327f51a2@bbrezillon>
 <alpine.DEB.2.02.1610261152170.9986@lnxricardw1.se.axis.com>
 <20161026135241.63653c4f@bbrezillon>
 <alpine.DEB.2.02.1610261359290.9986@lnxricardw1.se.axis.com>
 <20161026150557.587a7387@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Boris,

On Wed, 26 Oct 2016, Boris Brezillon wrote:

> > However, mildly accelerated chip timing (i.e. ONFi mode 2) I wouldn't call 
> > an advanced feature, and it seems to be supported by all of the chips in 
> > the 1..4 Gb range that we've seen, although I wouldn't be so bold and go 
> > so far as to say that I know all available flash chips (at least in this 
> > size range) support that mode. That's why I'm reluctant to suggest 
> > changing the entries for these flashes in the table in nand_ids.c, which 
> > would be another alternative. And if we did make that change, it might 
> > cause problems in systems which currently use onfi_timing_mode_default if 
> > the timing suddenly becomes faster after a kernel update. Although, at 
> > least looking at the 4.8 tree I'm using for development, it's only the 
> > sunxi NAND driver which uses it, so I guess it would be alright to change 
> > as it is not in widespread use yet?
> 
> I would definitely prefer this approach.

I don't mind making a patch for nand_ids.c which sets a more aggressive 
timing mode for at least flashes in the 1..4 Gb range. As I mentioned 
though I'm not entirely confident saying that that is in fact the case for 
_all_ flashes of that size, but perhaps it's good enough for now making 
that assumption given the flashes I've actually looked at? (I could refer 
to a number of chips in the commit message for reference).

> > The sunxi driver seems to presume the latter, whereas the entries in 
> > nand_ids.c would seem to imply the former, with values such as 2 (for 
> > the TC58NVG0S3E) and 4 (for the H27UCG8T2ATR-BC) - surely these chips 
> > support more than a single timing mode?
> >
> Hm, no it's not. As can be seen here [1], if the NAND is not ONFi, then
> we're using the onfi_timing_mode_default value, which is encoding the
> highest supported mode. The other case is when the chip is ONFi
> compliant, and in this case, the timing_mode field in exposing
> supported modes as a bitmap.
> [1]http://lxr.free-electrons.com/source/drivers/mtd/nand/sunxi_nand.c#L1723

Yes, you're right of course, I was thrown by the fact that the mode 
variable in the sunxi_nand_chip_init_timings() function is used to 
both represent the bit vector and the actual timing mode.

> One last thing, we recently introduced a generic timing selection/setup
> infrastructure [2] to avoid duplicating the code pointed here [1] in all
> drivers. It's been merged in 4.9, and that'd would be better to use
> this infrastructure in your driver.
>
> [2]https://www.spinics.net/lists/arm-kernel/msg532007.html

One thing I would have liked to have is to have the actual timing mode 
number in the nand_data_interface struct, for controllers like in my case 
where it's problematic to take the numeric timing values and map them to 
register values, and the timing register values need to be pre-computed. 
There might be other reasons where the driver might want to know the mode 
number. Sure, once a mode has been agreed on it is set in 
chip->onfi_timing_mode_default, but that won't help 
nand_init_data_interface() when it calls 
chip->setup_data_interface(..., true) to determine if a given mode is in 
fact supported by the controller.


A minor related issue which I been pondering over is that the fact that 
the supported timing modes of an ONFi flash are expressed as a bit vector 
rather than just a single 'highest possible mode' value, which indicates 
that the idea is that a flash may support a certain mode but not 
necessarily all the ones below, e.g. supporting modes 3, 2 and 0. A 
cursory look at the timing mode definition gives the impression that lower 
speeds are subcases of the higher speed ones, but it's hard to say if 
there are relationships between certain parameters that mean this is not 
necessarily so,

However, when we take the highest supported mode from the ID table, we 
convert it into a continguous bit vector using GENMASK() in 
nand_base.c:nand_init_data_interface(), thus assuming that the flash will 
in fact support all slower modes as well.

Perhaps there are no flashes which support a non-contiguous range of 
timing modes (I don't have enough experience with ONFi flashes to say 
one way or the other), it just seemed to me an odd discrepency and 
limitation for non-ONFi flashes.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
