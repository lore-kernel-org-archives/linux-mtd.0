Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPEiI-0005nc-9p
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 20:00:27 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, marex@denx.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: atmel-quadspi: add driver for Atmel QSPI
 controller
Date: Mon, 18 Jul 2016 21:59:56 +0200
Message-ID: <1715321.52KD2CMTqu@wuerfel>
In-Reply-To: <20160718195511.GA137880@google.com>
References: <cover.1465830154.git.cyrille.pitchen@atmel.com>
 <3482823.TCe8doMvLu@wuerfel> <20160718195511.GA137880@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, July 18, 2016 12:55:11 PM CEST Brian Norris wrote:
> On Mon, Jul 18, 2016 at 09:35:39PM +0200, Arnd Bergmann wrote:
> > On Friday, July 15, 2016 5:45:07 PM CEST Brian Norris wrote:
> > > Applied to l2-mtd.git with that fixup.
> > 
> > I'm getting this build error now on a randconfig build:
> > 
> > drivers/mtd/built-in.o: In function `atmel_qspi_run_command':
> > :(.text+0x1ee3c): undefined reference to `_memcpy_toio'
> > :(.text+0x1ee48): undefined reference to `_memcpy_fromio'
> 
> Whoops, I noticed those during review, but I don't know why I forgot to
> mention them nor fix them up before applying.
> 
> > On ARCH_EBSA, which doesn't build the file that contains the two
> > functions. I don't see any other driver on ARM using those two
> > functions directly. What is the specific reason for using them
> > here? Do you require byte-wise accesses, or could you use
> > the normal memcpy_toio/memcpy_fromio that turn into aligned
> > 32-bit word accesses instead?
> 
> Good questions. I would suspect that aligned 32-bit accesses are what
> they're looking for, but I'm not absolutely sure.

Ok, so we should look at that first. If the driver supports 32-bit
access, using the regular accessors will also make the transfers
much faster.

> > If you have to use the non-portable
> > functions, maybe we can just make the driver depend on !ARCH_EBSA?
> 
> I don't see an ARCH_EBSA. Did you mean ARCH_EBSA110?

Yes, sorry for the typo.

> Or we could just drop the '|| (ARM && COMPILE_TEST)' clause for now:
> 
>         depends on ARCH_AT91 || (ARM && COMPILE_TEST)

I'd prefer to keep the COMPILE_TEST option, after all it's how
I found the problem. On a related note, what is the ARM dependency
for? Is that just for the _memcpy_toio/_memcpy_fromio? Maybe we
can drop too if we find the right architecture-independent
replacement for those two calls.

	Arnd
