Received: from smtp11.smtpout.orange.fr ([80.12.242.133]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSUE8-0003e9-Np
 for linux-mtd@lists.infradead.org; Fri, 22 Dec 2017 20:47:34 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Miquel Raynal <miquel.raynal@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,  Richard Weinberger
 <richard@nod.at>,  Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,  Rob
 Herring <robh+dt@kernel.org>,  Mark Rutland <mark.rutland@arm.com>,  Jason
 Cooper <jason@lakedaemon.net>,  Andrew Lunn <andrew@lunn.ch>,  Gregory
 Clement <gregory.clement@free-electrons.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Russell King <linux@armlinux.org.uk>,
 Daniel Mack <daniel@zonque.org>,  Haojian Zhuang
 <haojian.zhuang@gmail.com>,  Eric Miao <eric.y.miao@gmail.com>,  Catalin
 Marinas <catalin.marinas@arm.com>,  Will Deacon <will.deacon@arm.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>,  Antoine Tenart
 <antoine.tenart@free-electrons.com>,  Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>,  Hanna Hawa <hannah@marvell.com>,  Neta
 Zur Hershkovits <neta@marvell.com>,  Willy Tarreau <w@1wt.eu>,  Sean
 =?utf-8?Q?Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>
Subject: Re: [PATCH v2 3/5] mtd: nand: replace pxa3xx_nand driver by its
 rework called marvell_nand
In-Reply-To: <20171219132942.27433-4-miquel.raynal@free-electrons.com> (Miquel
 Raynal's message of "Tue, 19 Dec 2017 14:29:40 +0100")
References: <20171219132942.27433-1-miquel.raynal@free-electrons.com>
 <20171219132942.27433-4-miquel.raynal@free-electrons.com>
Date: Fri, 22 Dec 2017 21:47:18 +0100
Message-ID: <87608ycwx5.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Miquel Raynal <miquel.raynal@free-electrons.com> writes:

> Actually remove pxa3xx_nand.c to let marvell_nand.c be compiled instead.
> Also change the defconfig files using it as well as some board files
> depending on CONFIG_MTD_NAND_PXA3xx.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>

Actually that approach doesn't quite suit me.
I'm not convinced at all a new rewrite of the driver will be stable right out of
the box as the old one is.

What I would propose instead is :
 - keep both the new marvell nand driver and the old pxa3xx_nand driver
 - switch pxa_defconfig to compile them both
 - continue testing (with my help)

Once I see the marvell_nand is working properly, we can remove pca3xx_nand in a
second stage, keeping the pxa platform functional all along.

Would you agree to that path ?

As a side not, this patch should be split into 2 parts :
 - one for arch/arm -> switch to the new driver
 - one for drivers/mtd -> removal of the old driver

Cheers.

--
Robert
