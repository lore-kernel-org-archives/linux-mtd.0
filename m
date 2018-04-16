Received: from mail-dm3nam03on0046.outbound.protection.outlook.com
 ([104.47.41.46] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f7yW2-0001xH-BR
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2018 07:25:32 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [RFC PATCH 0/5] RFC for Zynq QSPI
Date: Mon, 16 Apr 2018 07:25:09 +0000
Message-ID: <BY2PR02MB14115B9E46B35A59AC6505D9AFB00@BY2PR02MB1411.namprd02.prod.outlook.com>
References: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
In-Reply-To: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Can some body propose an alternative to get the things done(Adding Zynq Dua=
l parallel and stacked support)? Because to handle this we have changed the=
 core functions. See my patches=20
"[RFC PATCH 3/5] mtd: spi-nor: Add Dual Parallel and Stacked support for Zy=
nq QSPI"
"[RFC PATCH 1/5] spi: Add support for Zynq qspi controller"

I will provide required inputs, if any.

Thanks,
Naga Sureshkumar Relli.

> -----Original Message-----
> From: Naga Sureshkumar Relli [mailto:naga.sureshkumar.relli@xilinx.com]
> Sent: Friday, March 23, 2018 5:52 PM
> To: cyrille.pitchen@wedev4u.fr; marek.vasut@gmail.com; dwmw2@infradead.or=
g;
> computersforpeace@gmail.com; boris.brezillon@free-electrons.com
> Cc: linux-mtd@lists.infradead.org; Naga Sureshkumar Relli <nagasure@xilin=
x.com>
> Subject: [RFC PATCH 0/5] RFC for Zynq QSPI
>=20
> Xilinx Zynq uses a QSPI controller that is based on the Cadence SPI IP.
> This controller implements all the functionality required to support Quad=
 SPI NOR flash
> devices.
> This driver along with the MTD layer is used to support flash devices.
>=20
> This series is for the following purposes:
> - RFC of the Quad SPI driver.
> - We currently use a custom MTD layer and would like to get inputs on
>   dual stacked/dual parallel handling (described below).
>=20
> The flash device(s) can be connected in the three configurations:
> 1. Single - One flash device with 1 CS, 1 Clock and 4 IO lines.
> 2. Dual Parallel - Two flash devices connected with common CS and
>    separate IO lines (resulting in 8 IO lines).
>    In this configuration, the controller
>    a) Duplicates commands, address etc. sent on both sets of 4 IO lines.
>    b) Stripes data both transmitted and received i.e.
>       4 bits of data is sent to the first flash and the other 4 bits
>       to the second flash. Similarly read data is also consolidated.
>    Due to this, TX and RX data handling in the driver need special
>    handling for parallel mode.
> 3. Dual Stacked - Two flash devices connected with separate CS and
>    4 common IO lines. This is largely similar to single, except for
>    the slave selection logic.
> The above configuration is conveyed to the QSPI driver through a devicetr=
ee property.
>=20
> The QSPI driver differs from the existing Cadence SPI driver in the follo=
wing respects majorly:
> 1. TX and RX handling: Different TX registers are used to write into
>    the TX FIFO. TXD0, TXD1, TXD2 and TXD3 are used write 4, 1, 2 and 3
>    bytes respectively. Depending on the TXD register used, the received
>    bytes also need to be handled separately.
> 2. Depending on the configuration in which flash devices are connected
>    (single, parallel or stacked), QSPI controller configuration registers
>    need to be modified.
> 3. There is no support for extended slave select in QSPI, as opposed to
>    SPI. In case of stacked configuration, the slave select field remains
>    the same and a different configuration bit is used to select between
>    the two flash devices.
> 4. Handling of dual parallel configuration.
>=20
> MTD layer:
> The Xilinx Zynq MTD layer by far makes use of the mainline version with s=
ome differences.
> The primary flash families supported are Spansion, Winbond and Micron.
> - Probe:
>   - In dual configurations, both flash devices are recognized as one
>     continuous memory. (ID is read only from one flash and it is a
>     pre-stated assumption that both flash devices have the same flash
>     make and size.)
> - Addressing:
>   a) In dual stacked mode, the address passed to the MTD layer can be
>      between 0x0 to 2*(one flash size). Hence the MTD layer has to recogn=
ize
>      whether the address belongs to the first flash or the second flash
>      subtract the offset and indicate the same to the QSPI driver.
>   b) In dual stacked mode too the address can range between
>      0 to 2*(one flash size). But, when an 8 bit word is written,
>      4 bits are written to the first and 4 bits are written to the
>      second flash. Hence the address sent is always halved and checks
>      are in place for even address and even length.
> - 4 byte addressing is not supported and hence bank selection logic is us=
ed
>   along with the addressing system described above.
> - Flash register read/writes, for example, lock/unlock, quad enable etc.
>   are handled differently in dual stacked and parallel modes.
>=20
> This is tested with current master branch of Linux.
> To make Zynq QSPI work, we need to tweak spi-nor.c.
> I agree that changing the spi-nor layer apis, doesn't look good but i did=
n't find a way to do the
> same.
> So please suggest a way to handle Zynq QSPI controller in dual parallel a=
nd stacked modes.
> we can move the spi/spi-zynq-qspi.c to spi-nor/ but even in that case als=
o changes are needed in
> spi-nor.c.
> What ever the changes we do to make Zynq QSPI work, will applicable for X=
ilinx ZynqMP
> SOC QSPI controller(spi-zynqmp-qspi.c) as well.
> I am happy to do the changes suggested, so that we will have a solution f=
or Xilinx Zynq and
> ZynqMP SOC QSPI controllers.
>=20
> Naga Sureshkumar Relli (5):
>   spi: Add support for Zynq qspi controller
>   mtd: spi-nor: Add support for Zynq QSPI controller
>   mtd: spi-nor: Add Dual Parallel and Stacked support for Zynq QSPI
>   spi: Add PM Support for Zynq QSPI controller
>   devicetree: Add devicetree bindings documentation for Zynq QSPI
>=20
>  .../devicetree/bindings/spi/spi-zynq-qspi.txt      |  26 +
>  drivers/mtd/spi-nor/spi-nor.c                      | 425 ++++++++++-
>  drivers/spi/Kconfig                                |  15 +
>  drivers/spi/Makefile                               |   1 +
>  drivers/spi/spi-zynq-qspi.c                        | 827 +++++++++++++++=
++++++
>  include/linux/mtd/spi-nor.h                        |  15 +-
>  include/linux/spi/spi.h                            |   5 +-
>  7 files changed, 1276 insertions(+), 38 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt
>  create mode 100644 drivers/spi/spi-zynq-qspi.c
>=20
> --
> 2.7.4
