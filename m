Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g42fw-0005Uh-1P
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2018 11:35:57 +0000
Date: Sun, 23 Sep 2018 13:35:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren
 <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] mtd: rawnand: ams-delta: use GPIO lookup table
Message-ID: <20180923133531.0c98e803@xps13>
In-Reply-To: <20180919221729.21179-1-jmkrzyszt@gmail.com>
References: <20180909225605.16463-3-jmkrzyszt@gmail.com>
 <20180919221729.21179-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Janusz,

Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote on Thu, 20 Sep 2018
00:17:29 +0200:

> Now as Amstrad Delta board - the only user of this driver - provides
> GPIO lookup tables, switch from GPIO numbers to GPIO descriptors and
> use the table to locate required GPIO pins.
>=20
> Declare static variables for storing GPIO descriptors and replace
> gpio_ function calls with their gpiod_ equivalents.
>=20
> Pin naming used by the driver should be followed while respective GPIO
> lookup table is initialized by a board init code.
>=20
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied on nand/next.

Thanks,
Miqu=C3=A8l
