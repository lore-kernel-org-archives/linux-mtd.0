Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fipfH-0007HN-Ij
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 23:27:25 +0000
Date: Fri, 27 Jul 2018 01:27:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: jz4740: Include gpio/consumer.h instead
 of gpio.h
Message-ID: <20180727012710.440f3d2b@xps13>
In-Reply-To: <20180719223813.14351-1-boris.brezillon@bootlin.com>
References: <20180719223813.14351-1-boris.brezillon@bootlin.com>
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

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Fri, 20 Jul 2018
00:38:13 +0200:

> GPIO consumers should no longer include <linux/gpio.h>, and instead
> include <linux/gpio/consumer.h>.
>=20
> Also, explicitly include <include/io.h> since it seems to be missing
> after switching to <linux/gpio/consumer.h>.
>=20
> This fixes a build error when selecting the driver without selecting
> GPIOLIB, which can happen when COMPILE_TEST=3Dy.
>=20
> Fixes: 6968e07e8169 ("mtd: rawnand: jz4740: Allow selection of this drive=
r when COMPILE_TEST=3Dy")
> Reported-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---

Applied to nand/next, thanks!
Miqu=C3=A8l
