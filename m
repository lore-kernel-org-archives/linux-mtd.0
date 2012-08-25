Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5NAC-0001F1-TD
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 20:41:02 +0000
From: Marek Vasut <marex@denx.de>
To: Kevin Cernekee <cernekee@gmail.com>
Subject: Re: [PATCH V5] mtd: m25p80: Make fast read configurable via DT
Date: Sat, 25 Aug 2012 22:40:54 +0200
References: <1345923416-9293-1-git-send-email-marex@denx.de>
 <CAJiQ=7BAH_87jrDCG=Jbw7ezsezFWrBv+eUkoH5jGmeV9tQiYQ@mail.gmail.com>
In-Reply-To: <CAJiQ=7BAH_87jrDCG=Jbw7ezsezFWrBv+eUkoH5jGmeV9tQiYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201208252240.54932.marex@denx.de>
Cc: David Woodhouse <david.woodhouse@intel.com>, dedekind1@gmail.com,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 devicetree-discuss@lists.ozlabs.org, robherring2@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Kevin Cernekee,

> On Sat, Aug 25, 2012 at 12:36 PM, Marek Vasut <marex@denx.de> wrote:
> > Add DT property "m25p,fast-read" that signalises the particular
> > chip supports "fast read" opcode.
> 
> This might be slightly clearer if it is rephrased as:
> 
> Add DT property "m25p,fast-read" that signifies whether the "fast
> read" opcode is supported.

What's the difference?

> > +Optional properties:
> > +- m25p,fast-read : Use the "fast read" opcode to read data from the chip
> > instead +                   of the usual "read" opcode. This opcode isn
> > not supported by +                   all chips and support for it can
> > not be detected at runtime.
> 
> "is not supported"

Thanks

> Are there any modern SPI flash parts that can't handle FAST_READ, or
> is this mostly for compatibility with legacy systems?

We have to support all possibilities, not only "modern systems" .

> > +       bool                    fast_read;
> > 
> > -       t[0].len = m25p_cmdsz(flash) + FAST_READ_DUMMY_BYTE;
> > +       t[0].len = m25p_cmdsz(flash) + (flash->fast_read ? 1 : 0);
> 
> Newer devices support a variable number of dummy cycles; increasing
> the number of dummy cycles can allow for higher interface speeds.  One
> example is the Macronix MX25L25635F:
> 
> http://bit.ly/P9s7UM

Good, but I don't see it supported in the driver, how is this different from 
MX25L256E?

Besides, I noticed the fast-read isn't even properly excersized, as it always 
reads blocks of 512 bytes, even if it can read any basically length. Why is 
that, MTD layer stuff or something?

> It might be worth thinking about how to capture this sort of
> information in the DT properties, even if current versions of m25p80
> only use a small subset of the device capabilities.

They can be added as additional DT props, that should be easy.

Best regards,
Marek Vasut
