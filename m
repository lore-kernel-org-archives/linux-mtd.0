Received: from mail-eopbgr710125.outbound.protection.outlook.com
 ([40.107.71.125] helo=NAM05-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcxjv-0001VU-IA
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2018 18:51:56 +0000
Date: Tue, 10 Jul 2018 11:51:38 -0700
From: Paul Burton <paul.burton@mips.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-wireless@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/24] mtd: rawnand: Improve compile-test coverage
Message-ID: <20180710185138.mh564eehyfoaggsu@pburton-laptop>
References: <20180709200945.30116-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180709200945.30116-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Mon, Jul 09, 2018 at 10:09:21PM +0200, Boris Brezillon wrote:
>   MIPS: txx9: Move the ndfc.h header to include/linux/platform_data/txx9
>   mtd: rawnand: txx9ndfmc: Allow selection of this driver when
>     COMPILE_TEST=y
>   MIPS: jz4740: Move jz4740_nand.h header to
>     include/linux/platform_data/jz4740
>   mtd: rawnand: jz4740: Allow selection of this driver when
>     COMPILE_TEST=y
>   mtd: rawnand: jz4780: Drop the dependency on MACH_JZ4780
>   memory: jz4780-nemc: Allow selection of this driver when
>     COMPILE_TEST=y
> 
>  arch/mips/jz4740/board-qi_lb60.c                   |  3 +-
>  arch/mips/txx9/generic/setup.c                     |  2 +-
>  arch/mips/txx9/generic/setup_tx4938.c              |  2 +-
>  arch/mips/txx9/generic/setup_tx4939.c              |  2 +-
>  drivers/memory/Kconfig                             |  6 ++--
>  drivers/mtd/nand/raw/Kconfig                       | 33 ++++++++++++++--------
>  drivers/mtd/nand/raw/jz4740_nand.c                 |  2 +-
>  drivers/mtd/nand/raw/txx9ndfmc.c                   |  2 +-
>  .../linux/platform_data/jz4740}/jz4740_nand.h      |  4 +--
>  .../linux/platform_data}/txx9/ndfmc.h              |  6 ++--
>  rename {arch/mips/include/asm/mach-jz4740 => include/linux/platform_data/jz4740}/jz4740_nand.h (91%)
>  rename {arch/mips/include/asm => include/linux/platform_data}/txx9/ndfmc.h (91%)

For the MIPS-related patches 19-24:

    Acked-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul
