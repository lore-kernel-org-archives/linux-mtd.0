Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPEKm-0007qF-9s
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 19:36:09 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, marex@denx.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: atmel-quadspi: add driver for Atmel QSPI
 controller
Date: Mon, 18 Jul 2016 21:35:39 +0200
Message-ID: <3482823.TCe8doMvLu@wuerfel>
In-Reply-To: <20160716004507.GD76613@google.com>
References: <cover.1465830154.git.cyrille.pitchen@atmel.com>
 <20160714013242.GG54628@google.com> <20160716004507.GD76613@google.com>
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

On Friday, July 15, 2016 5:45:07 PM CEST Brian Norris wrote:
> Applied to l2-mtd.git with that fixup.

I'm getting this build error now on a randconfig build:

drivers/mtd/built-in.o: In function `atmel_qspi_run_command':
:(.text+0x1ee3c): undefined reference to `_memcpy_toio'
:(.text+0x1ee48): undefined reference to `_memcpy_fromio'

On ARCH_EBSA, which doesn't build the file that contains the two
functions. I don't see any other driver on ARM using those two
functions directly. What is the specific reason for using them
here? Do you require byte-wise accesses, or could you use
the normal memcpy_toio/memcpy_fromio that turn into aligned
32-bit word accesses instead? If you have to use the non-portable
functions, maybe we can just make the driver depend on !ARCH_EBSA?

	Arnd
