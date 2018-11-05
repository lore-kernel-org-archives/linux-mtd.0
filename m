Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJbs7-0007dP-HI
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 10:12:47 +0000
Date: Mon, 5 Nov 2018 11:12:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 devel@driverdev.osuosl.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] staging: Remove the mt29f_spinand driver
Message-ID: <20181105111227.7bf08cfa@xps13>
In-Reply-To: <20181022201059.8630-1-boris.brezillon@bootlin.com>
References: <20181022201059.8630-1-boris.brezillon@bootlin.com>
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

Hi Greg,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon, 22 Oct 2018
22:10:59 +0200:

> A new SPI NAND subsystem has been added in drivers/mtd/nand/spi/ and
> Micron's MT29F devices are now supported in
> drivers/mtd/nand/spi/micron.c.
>=20
> Remove the old driver.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Hello,
>=20
> If anything is missing in drivers/mtd/nand/spi/micron.c to properly
> support the devices supported by the mt29f_spinand driver, please let
> me know.
> I might accept to delay removal of this driver if I have some guarantees
> that existing users will actually switch to the new driver at some
> point.
>=20
> Regards,
>=20
> Boris
> ---

I plan to apply this patch but I would like your approval first.

As a summary, the mt29f_spinand driver is a Micron SPI NAND chip
driver interfacing with the raw NAND API (which is 'wrong').

Boris has recently contributed a SPI NAND framework supporting SPI
NAND chips from several vendors, including Micron, that is supposed to
take over this driver.

Do you see anything that should prevent us to remove it now?

>  drivers/staging/Kconfig                       |   2 -
>  drivers/staging/Makefile                      |   1 -
>  drivers/staging/mt29f_spinand/Kconfig         |  16 -
>  drivers/staging/mt29f_spinand/Makefile        |   1 -
>  drivers/staging/mt29f_spinand/TODO            |  13 -
>  drivers/staging/mt29f_spinand/mt29f_spinand.c | 980 ------------------
>  drivers/staging/mt29f_spinand/mt29f_spinand.h | 106 --
>  7 files changed, 1119 deletions(-)
>  delete mode 100644 drivers/staging/mt29f_spinand/Kconfig
>  delete mode 100644 drivers/staging/mt29f_spinand/Makefile
>  delete mode 100644 drivers/staging/mt29f_spinand/TODO
>  delete mode 100644 drivers/staging/mt29f_spinand/mt29f_spinand.c
>  delete mode 100644 drivers/staging/mt29f_spinand/mt29f_spinand.h
>=20

Thanks,
Miqu=C3=A8l
