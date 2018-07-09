Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcd2p-0003f0-7g
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2018 20:46:04 +0000
Received: by mail-lj1-x244.google.com with SMTP id t21-v6so15089489lji.0
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jul 2018 13:45:52 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20180709200945.30116-1-boris.brezillon@bootlin.com>
References: <20180709200945.30116-1-boris.brezillon@bootlin.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 9 Jul 2018 22:45:50 +0200
Message-ID: <CAK8P3a2zUvr958ZDV9DeGd7y28TFi4A1eYG79rb8cZaPLvN0ng@mail.gmail.com>
Subject: Re: [PATCH v2 00/24] mtd: rawnand: Improve compile-test coverage
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Ralf Baechle <ralf@linux-mips.org>,
 "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 9, 2018 at 10:09 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> Hello,
>
> This is an attempt at adding "depends || COMPILE_TEST" to all NAND
> drivers that have no compile-time dependencies on arch
> features/headers.
>
> This will hopefully help us (NAND/MTD maintainers) in detecting build
> issues earlier. Unfortunately we still have a few drivers that can't
> easily be modified to be arch independent.
>
> I tried to put all patches that only touch the NAND subsystem first,
> so that they can be applied even if other patches are being discussed.
>
> Don't hesitate to point any missing dependencies when compiled with
> COMPILE_TEST. I didn't have any problem when compiling, but that might
> be because the dependencies were already selected.

Looks good to me overall.

> In this v2, I tried to fix all warnings/errors reported by kbuild/0day
> robots. The only remaining ones are those in omap_elm.c which seems to
> do some weird cpu_to_be32() conversions. I guess I could replace those
> by iowrite32be() calls (or just add (__force __u32)), but I don't want
> to risk a regression on this driver, so I'm just leaving it for someone
> else to fix :P.

Agreed, this is definedly very odd code. It looks like the intention
is to write all the bits in reverse order, but four bytes at a time. I'm
fairly sure the current implementation cannot work on big-endian,
in particularly this line:

val = cpu_to_be32(*(u32 *) &ecc[0]) >> 12;

Since shifting a number after the byteswap is not well-defined.
It's probably correct on little-endian, but it's not clear what the
best way would be to write this is an endian-neutral way.

        Arnd
