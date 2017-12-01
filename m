MIME-Version: 1.0
In-Reply-To: <20171130170132.27522-3-miquel.raynal@free-electrons.com>
References: <20171130170132.27522-1-miquel.raynal@free-electrons.com>
 <20171130170132.27522-3-miquel.raynal@free-electrons.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 1 Dec 2017 11:38:36 +0900
Message-ID: <CAK7LNAT+_vjtjuLmBGaLYbOnN=oZ99tUogWCPgvbsy53aiboxA@mail.gmail.com>
Subject: Re: [PATCH 2/5] mtd: nand: provide several helpers to do common NAND
 operations
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Hanna Hawa <hannah@marvell.com>, Stefan Agner <stefan@agner.ch>,
 Nadav Haklai <nadavh@marvell.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 devel@driverdev.osuosl.org, Maxim Levitsky <maximlevitsky@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 Ofer Heifetz <oferh@marvell.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Wenyou Yang <wenyou.yang@atmel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-12-01 2:01 GMT+09:00 Miquel Raynal <miquel.raynal@free-electrons.com>:
> From: Boris Brezillon <boris.brezillon@free-electrons.com>
>
> This is part of the process of removing direct calls to ->cmdfunc()
> outside of the core in order to introduce a better interface to execute
> NAND operations.
>
> Here we provide several helpers and make use of them to remove all
> direct calls to ->cmdfunc(). This way, we can easily modify those
> helpers to make use of the new ->exec_op() interface when available.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> [miquel.raynal@free-electrons.com: rebased and fixed some conflicts]
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/atmel/nand-controller.c |    2 +-
>  drivers/mtd/nand/brcmnand/brcmnand.c     |    9 +-
>  drivers/mtd/nand/cafe_nand.c             |   14 +-
>  drivers/mtd/nand/denali.c                |   37 +-

For denali.c

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>


-- 
Best Regards
Masahiro Yamada
