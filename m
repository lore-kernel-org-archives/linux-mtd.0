Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1foR1B-0003vn-Ru
 for linux-mtd@lists.infradead.org; Sat, 11 Aug 2018 10:21:11 +0000
Date: Sat, 11 Aug 2018 12:20:55 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 4.19
Message-ID: <20180811122055.22640e9e@bbrezillon>
In-Reply-To: <20180801093138.03c716ac@bbrezillon>
References: <20180801093138.03c716ac@bbrezillon>
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

On Wed, 1 Aug 2018 09:31:38 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Hello,
>=20
> Here is the spi-nor PR for 4.19.
>=20
> Regards,
>=20
> Boris
>=20
> The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab=
40:
>=20
>   Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)
>=20
> are available in the git repository at:
>=20
>   git://git.infradead.org/linux-mtd.git tags/spi-nor/for-4.19
>=20
> for you to fetch changes up to bb276262e88dae52cc717bb636b7468f66bb234e:
>=20
>   mtd: spi-nor: only apply reset hacks to broken hardware (2018-08-01 09:=
27:38 +0200)

PR merged in mtd/next.

>=20
> ----------------------------------------------------------------
> Core changes:
> - Apply reset hacks only when reset is explicitly marked as broken in
>   the DT
>=20
> Driver changes:
> - Minor cleanup/fixes in the m25p80 driver
> - Release flash_np in the nxp-spifi driver
> - Add suspend/resume hooks to the atmel-quadspi driver
> - Include gpio/consumer.h instead of gpio.h in the atmel-quadspi driver
> - Use %pK instead of %p in the stm32-quadspi driver
> - Improve timeout handling in the cadence-quadspi driver
> - Use mtd_device_register() instead of mtd_device_parse_register() in
>   the intel-spi driver
>=20
> ----------------------------------------------------------------
> Alexey Khoroshilov (1):
>       mtd: spi-nor: nxp-spifi: release flash_np in nxp_spifi_probe()
>=20
> Benjamin Gaignard (1):
>       mtd: spi-nor: stm32-quadspi: replace "%p" with "%pK"
>=20
> Boris Brezillon (3):
>       mtd: m25p80: Remove unneeded m25p->command field
>       mtd: m25p80: Use SPI_MEM_OP_NO_DUMMY instead of SPI_MEM_OP_DUMMY(0,=
 x)
>       mtd: spi-nor: atmel-quadspi: Include gpio/consumer.h instead of gpi=
o.h
>=20
> Brian Norris (1):
>       mtd: spi-nor: only apply reset hacks to broken hardware
>=20
> Claudiu Beznea (1):
>       mtd: spi-nor: atmel-quadspi: add suspend/resume hooks
>=20
> Nicholas Mc Guire (1):
>       mtd: spi-nor: cadence-quadspi: fix timeout handling
>=20
> Rafa=C5=82 Mi=C5=82ecki (1):
>       mtd: spi-nor: intel-spi: use mtd_device_register()
>=20
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt |  9 +++++++++
>  drivers/mtd/devices/m25p80.c                            |  5 +----
>  drivers/mtd/spi-nor/atmel-quadspi.c                     | 23 +++++++++++=
+++++++++++-
>  drivers/mtd/spi-nor/cadence-quadspi.c                   | 20 ++++++++---=
---------
>  drivers/mtd/spi-nor/intel-spi.c                         |  2 +-
>  drivers/mtd/spi-nor/nxp-spifi.c                         |  1 +
>  drivers/mtd/spi-nor/spi-nor.c                           | 18 +++++++++++=
+++++--
>  drivers/mtd/spi-nor/stm32-quadspi.c                     |  6 +++---
>  include/linux/mtd/spi-nor.h                             |  1 +
>  9 files changed, 62 insertions(+), 23 deletions(-)
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
