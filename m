Date: Mon, 12 Feb 2018 11:20:42 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>, Willy Tarreau <w@1wt.eu>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew
 Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@free-electrons.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will.deacon@arm.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Neta Zur
 Hershkovits <neta@marvell.com>, Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Subject: Re: [PATCH v3 5/7] mtd: nand: use Marvell reworked NAND controller
 driver with all platforms
Message-ID: <20180212112042.5b3f758f@bbrezillon>
In-Reply-To: <20180109103637.23798-6-miquel.raynal@free-electrons.com>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
 <20180109103637.23798-6-miquel.raynal@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue,  9 Jan 2018 11:36:35 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Actually remove pxa3xx_nand.c to let marvell_nand.c be compiled instead.
> Also change the defconfig files using it as well as some board files
> depending on CONFIG_MTD_NAND_PXA3xx.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  arch/arm/configs/cm_x300_defconfig  |    2 +-
>  arch/arm/configs/pxa3xx_defconfig   |    3 +-
>  arch/arm/configs/pxa_defconfig      |    2 +-
>  arch/arm/configs/raumfeld_defconfig |    2 +-
>  arch/arm/mach-mmp/ttc_dkb.c         |    4 +-
>  arch/arm/mach-pxa/cm-x300.c         |    2 +-
>  arch/arm/mach-pxa/colibri-pxa3xx.c  |    2 +-
>  arch/arm/mach-pxa/colibri.h         |    2 +-
>  arch/arm/mach-pxa/littleton.c       |    4 +-
>  arch/arm/mach-pxa/mxm8x10.c         |    4 +-
>  arch/arm/mach-pxa/zylonite.c        |    4 +-
>  drivers/mtd/nand/Kconfig            |   11 -
>  drivers/mtd/nand/Makefile           |    1 -
>  drivers/mtd/nand/pxa3xx_nand.c      | 2104 -----------------------------------

Can you please split this patch in 2, one that patches defconfig and
board files to use the new driver and one that actually removes the old
driver.

Thanks,

Boris

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
