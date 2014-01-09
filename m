Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W15SQ-00006Y-Fs
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2014 02:34:55 +0000
Date: Thu, 9 Jan 2014 10:00:19 +0800
From: Huang Shijie <b32955@freescale.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v0] mtd: gpmi: Use cached syndromes to speedup erased
 region bitflip detection.
Message-ID: <20140109020017.GA26102@shlinux2.ap.freescale.net>
References: <1389123873-30663-1-git-send-email-eliedebrauwer@gmail.com>
 <20140108053816.GA28424@shlinux2.ap.freescale.net>
 <CAGWqfigWXs+0nJzxQMh6umhrm1bA5YUWbZmXmj7=aut3HsaAcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAGWqfigWXs+0nJzxQMh6umhrm1bA5YUWbZmXmj7=aut3HsaAcA@mail.gmail.com>
Cc: Huang Shijie <shijie8@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 08, 2014 at 08:52:35AM +0100, Elie De Brauwer wrote:
> >> I did some benchmarking on the following 2k and 4k nand chips:
> >> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xdc (Micron MT29F4G08ABAEAH4), 512MiB, page size: 4096, OOB size: 224
> >> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron MT29F2G08ABAEAH4), 256MiB, page size: 2048, OOB size: 64
> >>
> >> By simply doing time dd if=/dev/mtd8 of=/dev/null bs=1M and calculating
> >> the throughput (in megabyte/s). This gave the following results:
> >>
> >> 2k  |4k
> >> ========
> >> 7.0 |11.3 <- v6 of the bitflips correction path (broken fast path)
> >> 4.7 |5.9  <- v7 of the bitflip correction patch (no fast path)
> >> 5.9 |8.4  <- with this patch applied.
> >>
> > thanks for the new patch.
> >
> > I suddenly think out a new solution about this issue:
> >   [1] when the bitflip occurs, the BCH will tells up the uncorrectable,
> >   [2] if we catch a uncorrectable error, we could check the whole buffer, and
> >       count the number of the bitflips. Assume we get the bitflips is N.
> >
> >   [3] if N is < (gf_len ), we could think this is a erased page, and call the
> >       memset to the whole buffer, and tell the upper layer that this is a good
> >       empty page.
> >
> >   [4] since the [1] is very rare, i think this method is much faster then the
> >       current solution.
> >
> > the patch is something like this:
> 
> What you suggest will obviously be able to reach the maximum speed,
> I've been playing with a similar idea too but always bumped into the issue
> that you cannot know whether or not a page is actually an erased page or
> not. In your solution for example you cannot distinguish between:
> - an erased page which suffers from bitflips
> - a genuine uncorrectable page whose original contents may be close to
> all 0xff's, but only has a handful of bits set to 0.

In actually, we do have a method to distinguish the two cases:

  If [3] is met, we could read the page out without ECC enabled, and check
  the bitflips again. such as:
  
  <1> if [3] is met, read out the page again without the ECC enabled.
      and check the bitflips with this new page, assume we get N2.
  <2> if it is a erased page, the N2 will less then gf_len.

  <3> if it is a page full of 0xff(only servel bits set to 0), the N2 will
      greater then gf_len.


I will give a patch later, and you can test it.

thanks
Huang Shijie
    
