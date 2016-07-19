Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPSUZ-0000vi-C1
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 10:43:15 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, marex@denx.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: atmel-quadspi: add driver for Atmel QSPI
 controller
Date: Tue, 19 Jul 2016 12:42:42 +0200
Message-ID: <3594494.0P5B8Rztl3@wuerfel>
In-Reply-To: <512741bf-9dce-90f3-d969-3d3cb167fe25@atmel.com>
References: <cover.1465830154.git.cyrille.pitchen@atmel.com>
 <1715321.52KD2CMTqu@wuerfel> <512741bf-9dce-90f3-d969-3d3cb167fe25@atmel.com>
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

On Tuesday, July 19, 2016 12:03:11 PM CEST Cyrille Pitchen wrote:
> 
> Indeed I added the ARM dependency for the COMPILE_TEST case only for
> _memcpy_toio() and _memcpy_fromio(). I thought it would be enough.
> 
> Also, I use _memcpy_toio() and _memcpy_fromio() on purpose as opposed to
> memcpy_toio() and mempcy_fromio(). I've tested the two latest functions quite
> a long time ago and it didn't work. If I remember, on our architecture,
> memcpy_toio() and memcpy_fromio() are simply implemented with the regular
> memcpy().

They are implemented using "mmiocpy" when CONFIG_BIG_ENDIAN is not set.
mmiocpy is an alias for the out-of-line memcpy() implementation, but it's
different from calling memcpy() as the compiler can decide to replace
small memcpy with a pointer dereference, and that can be unaligned on
ARMv7 for non-MMIO pointers.

> The additional memory barriers inserted by readb() and writeb() seems to be
> needed to guarantee the IO accesses are not reordered on the system bus.

Those barriers should not be needed at all, I've never seen an I/O bus
that reorders consecutive reads to the same address range.
 
> In the atmel-quadspi.c driver, there is a comment on the use of memcpy():
> /* Then fallback to a PIO transfer (memcpy() DOES NOT work!) */

Please try again, I think this was fixed with

commit 1bd46782d08b01b73df0085b51ea1021b19b44fd
Author: Russell King <rmk+kernel@arm.linux.org.uk>
Date:   Fri Jul 3 15:22:54 2015 +0100

    ARM: avoid unwanted GCC memset()/memcpy() optimisations for IO variants
    
    We don't want GCC optimising our memset_io(), memcpy_fromio() or
    memcpy_toio() variants, so we must not call one of the standard
    functions.  Provide a separate name for our assembly memcpy() and
    memset() functions, and use that instead, thereby bypassing GCC's
    ability to optimise these operations.
    
    GCCs optimisation may introduce unaligned accesses which are invalid
    for device mappings.
    
    Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

	Arnd
