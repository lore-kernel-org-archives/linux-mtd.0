Date: Fri, 22 Dec 2017 23:04:44 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Miquel Raynal <miquel.raynal@free-electrons.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@free-electrons.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Eric Miao <eric.y.miao@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ezequiel
 Garcia <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Neta Zur
 Hershkovits <neta@marvell.com>, Willy Tarreau <w@1wt.eu>, Sean
 =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Subject: Re: [PATCH v2 3/5] mtd: nand: replace pxa3xx_nand driver by its
 rework called marvell_nand
Message-ID: <20171222230444.2c952ea0@bbrezillon>
In-Reply-To: <87608ycwx5.fsf@belgarion.home>
References: <20171219132942.27433-1-miquel.raynal@free-electrons.com>
 <20171219132942.27433-4-miquel.raynal@free-electrons.com>
 <87608ycwx5.fsf@belgarion.home>
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

On Fri, 22 Dec 2017 21:47:18 +0100
Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Miquel Raynal <miquel.raynal@free-electrons.com> writes:
> 
> > Actually remove pxa3xx_nand.c to let marvell_nand.c be compiled instead.
> > Also change the defconfig files using it as well as some board files
> > depending on CONFIG_MTD_NAND_PXA3xx.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>  
> 
> Actually that approach doesn't quite suit me.
> I'm not convinced at all a new rewrite of the driver will be stable right out of
> the box as the old one is.
> 
> What I would propose instead is :
>  - keep both the new marvell nand driver and the old pxa3xx_nand driver
>  - switch pxa_defconfig to compile them both

Didn't notice you were suggesting to compile both, which doesn't work
because both drivers match the same devices, and only one of them
can actually claim the device (likely the first one to register to the
device model). So, to make it safe you need to have a

	depends on !MTD_NAND_PXA3xx

in your MTD_NAND_MARVELL entry, which means only one driver can be
compiled.

>  - continue testing (with my help)
> 
> Once I see the marvell_nand is working properly, we can remove pca3xx_nand in a
> second stage, keeping the pxa platform functional all along.
> 
> Would you agree to that path ?
> 
> As a side not, this patch should be split into 2 parts :
>  - one for arch/arm -> switch to the new driver
>  - one for drivers/mtd -> removal of the old driver
> 
> Cheers.
> 
> --
> Robert
