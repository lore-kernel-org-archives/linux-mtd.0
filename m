Received: from smtp08.smtpout.orange.fr ([80.12.242.130]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSr7W-0007jx-Fp
 for linux-mtd@lists.infradead.org; Sat, 23 Dec 2017 21:14:16 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Miquel Raynal <miquel.raynal@free-electrons.com>,  David Woodhouse
 <dwmw2@infradead.org>,  Brian Norris <computersforpeace@gmail.com>,  Marek
 Vasut <marek.vasut@gmail.com>,  Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,  Rob Herring
 <robh+dt@kernel.org>,  Mark Rutland <mark.rutland@arm.com>,  Jason Cooper
 <jason@lakedaemon.net>,  Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@free-electrons.com>,  Sebastian Hesselbarth
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
References: <20171219132942.27433-1-miquel.raynal@free-electrons.com>
 <20171219132942.27433-4-miquel.raynal@free-electrons.com>
 <87608ycwx5.fsf@belgarion.home> <20171222230444.2c952ea0@bbrezillon>
Date: Sat, 23 Dec 2017 22:13:48 +0100
In-Reply-To: <20171222230444.2c952ea0@bbrezillon> (Boris Brezillon's message
 of "Fri, 22 Dec 2017 23:04:44 +0100")
Message-ID: <87bmipb10z.fsf@belgarion.home>
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

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

>> What I would propose instead is :
>>  - keep both the new marvell nand driver and the old pxa3xx_nand driver
>>  - switch pxa_defconfig to compile them both
>
> Didn't notice you were suggesting to compile both, which doesn't work
> because both drivers match the same devices, and only one of them
> can actually claim the device (likely the first one to register to the
> device model). So, to make it safe you need to have a
>
> 	depends on !MTD_NAND_PXA3xx
>
> in your MTD_NAND_MARVELL entry, which means only one driver can be
> compiled.
Mmm... that is I didn't explain to you what pxa_defconfig is designed for.
This defconfig is not for any board actually, it rather is a build coverage
tool.

> So let's find a way to fix the remaining issues you have instead of delaying
> the inevitable.
It's up to you of course, as long as my boards don't break, and nothing breaking
them is merged, I'm fine with it. It's just not the approach I usually choose,
I'm rather a 2-step guy, ie. merge the new one, then merge the switch (which can
be reverted easilly).

Cheers.

-- 
Robert
