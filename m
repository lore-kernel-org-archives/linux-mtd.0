Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPEdd-0001eB-F6
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 19:55:41 +0000
Received: by mail-pf0-x244.google.com with SMTP id h186so4034808pfg.2
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2016 12:55:15 -0700 (PDT)
Date: Mon, 18 Jul 2016 12:55:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, nicolas.ferre@atmel.com,
 boris.brezillon@free-electrons.com, marex@denx.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: atmel-quadspi: add driver for Atmel QSPI
 controller
Message-ID: <20160718195511.GA137880@google.com>
References: <cover.1465830154.git.cyrille.pitchen@atmel.com>
 <20160714013242.GG54628@google.com>
 <20160716004507.GD76613@google.com> <3482823.TCe8doMvLu@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3482823.TCe8doMvLu@wuerfel>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 18, 2016 at 09:35:39PM +0200, Arnd Bergmann wrote:
> On Friday, July 15, 2016 5:45:07 PM CEST Brian Norris wrote:
> > Applied to l2-mtd.git with that fixup.
> 
> I'm getting this build error now on a randconfig build:
> 
> drivers/mtd/built-in.o: In function `atmel_qspi_run_command':
> :(.text+0x1ee3c): undefined reference to `_memcpy_toio'
> :(.text+0x1ee48): undefined reference to `_memcpy_fromio'

Whoops, I noticed those during review, but I don't know why I forgot to
mention them nor fix them up before applying.

> On ARCH_EBSA, which doesn't build the file that contains the two
> functions. I don't see any other driver on ARM using those two
> functions directly. What is the specific reason for using them
> here? Do you require byte-wise accesses, or could you use
> the normal memcpy_toio/memcpy_fromio that turn into aligned
> 32-bit word accesses instead?

Good questions. I would suspect that aligned 32-bit accesses are what
they're looking for, but I'm not absolutely sure.

> If you have to use the non-portable
> functions, maybe we can just make the driver depend on !ARCH_EBSA?

I don't see an ARCH_EBSA. Did you mean ARCH_EBSA110?

Or we could just drop the '|| (ARM && COMPILE_TEST)' clause for now:

	depends on ARCH_AT91 || (ARM && COMPILE_TEST)

Brian
