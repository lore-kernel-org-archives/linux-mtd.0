Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK1Iv-0002Vl-3V
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 13:22:02 +0000
Date: Tue, 6 Nov 2018 14:21:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Vignesh R
 <vigneshr@ti.com>, Cyrille Pitchen <cyrille.pitchen@microchip.com>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Yogesh Narayan Gaur
 <yogeshnarayan.gaur@nxp.com>, Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: Re: [PATCH v2 0/7] spi: spi-mem: Add a direct mapping API
Message-ID: <20181106142149.13e35c98@xps13>
In-Reply-To: <20181030133638.3322-1-boris.brezillon@bootlin.com>
References: <20181030133638.3322-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 30 Oct 2018
14:36:31 +0100:

> Hello,
>=20
> I didn't have much review on the RFC, so I'm resending this series
> without "RFC" in the subject. Maybe I'll get more reviews this time.
>=20
> A few things have changed since I submitted the RFC
> - The spi-nand framework has been merged, and I can thus patch this
>   driver to use the dirmap API
> - The MXIC controller has been submitted, and since I did my tests
>   with this controller, I can also add a patch showing how to
>   implement the dirmap hooks
>=20
> Other changes are addressing the comments I received from Miquel.
>=20
> I'd still like to get feedback on the API and controller interface if
> anyone is interested in reviewing it.
>=20
> Thanks,
>=20
> Boris
>=20
> Boris Brezillon (7):
>   spi: spi-mem: Add missing word in the SPI_MEM_DATA_OUT description
>   spi: spi-mem: Add SPI_MEM_NO_DATA to the spi_mem_data_dir enum
>   spi: spi-mem: Split spi_mem_exec_op() code
>   spi: spi-mem: Add a new API to support direct mapping
>   mtd: devices: m25p80: Use the spi-mem dirmap API
>   mtd: spinand: Use the spi-mem dirmap API
>   spi: mxic: Add support for direct mapping
>=20
>  drivers/mtd/devices/m25p80.c | 142 +++++++++++-------
>  drivers/mtd/nand/spi/core.c  | 231 +++++++++++++++++-------------
>  drivers/spi/spi-mem.c        | 269 ++++++++++++++++++++++++++++++++---
>  drivers/spi/spi-mxic.c       | 140 ++++++++++++++----
>  include/linux/mtd/spinand.h  |   7 +
>  include/linux/spi/spi-mem.h  |  84 ++++++++++-
>  6 files changed, 670 insertions(+), 203 deletions(-)
>=20

For the whole series:

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miqu=C3=A8l
