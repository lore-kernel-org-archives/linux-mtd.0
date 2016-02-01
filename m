From: Yunhui Cui <yunhui.cui@nxp.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Yunhui Cui
 <B56489@freescale.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "han.xu@freescale.com" <han.xu@freescale.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Yao Yuan <yao.yuan@nxp.com>
Subject: RE: [PATCH 3/3] mtd:spi-nor:fsl-quadspi:Add fast-read mode support
Date: Mon, 1 Feb 2016 11:23:16 +0000
Message-ID: <AM3PR04MB14416F884013EEE1E889AEB994DE0@AM3PR04MB1441.eurprd04.prod.outlook.com>
References: <1454067669-35274-1-git-send-email-B56489@freescale.com>
 <1454067669-35274-4-git-send-email-B56489@freescale.com>
 <56AB7C6E.2050300@atmel.com>
In-Reply-To: <56AB7C6E.2050300@atmel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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

Hi Cyrille,

Thanks for your suggestions very much, I'll resend version 2 patch set.

Best Regards
Yunhui

-----Original Message-----
From: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]=20
Sent: Friday, January 29, 2016 10:51 PM
To: Yunhui Cui; dwmw2@infradead.org; computersforpeace@gmail.com; han.xu@fr=
eescale.com
Cc: linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; linux-arm-=
kernel@lists.infradead.org; Yao Yuan
Subject: Re: [PATCH 3/3] mtd:spi-nor:fsl-quadspi:Add fast-read mode support

Hi Yunhui,

Le 29/01/2016 12:41, Yunhui Cui a =E9crit :
> The qspi driver add generic fast-read mode for different flash=20
> venders, including Micron family. Also add some special operations for=20
> Micron flash read/write in spi-nor.c.
>=20
> Signed-off-by: Yunhui Cui <B56489@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 27 +++++++++++++++++++++------
>  drivers/mtd/spi-nor/spi-nor.c     |  6 +++++-
>  2 files changed, 26 insertions(+), 7 deletions(-)
>=20
[...]
> diff --git a/drivers/mtd/spi-nor/spi-nor.c=20
> b/drivers/mtd/spi-nor/spi-nor.c index ed0c19c..79a025c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -763,7 +763,8 @@ static const struct flash_info spi_nor_ids[] =3D {
>  	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_Q=
UAD_READ) },
>  	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_Q=
UAD_READ) },
>  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SPI_NOR_QUAD_READ) =
},
> -	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SPI_NOR_QUAD_READ) =
},
> +	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SPI_NOR_FAST |
> +			SPI_NOR_QUAD_READ) },
>  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_Q=
UAD_READ) },
>  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR |=
 SPI_NOR_QUAD_READ) },
>  	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K |=20
> USE_FSR | SPI_NOR_QUAD_READ) },
This modification looks wrong.

First SPI_NOR_FAST is part of enum read_mode (from spi-nor.h) and is not in=
tended to be used as a flag, unlike SPI_NOR_QUAD_READ (defined in spi-nor.c=
 just below the flags field of struct flash_info).

Also, creating a new flag to choose between the Read and the Fast Read comm=
ands is not needed: see my last comment below.


> @@ -1233,6 +1234,7 @@ int spi_nor_scan(struct spi_nor *nor, const char=20
> *name, enum read_mode mode)
> =20
>  	if (JEDEC_MFR(info) =3D=3D SNOR_MFR_ATMEL ||
>  	    JEDEC_MFR(info) =3D=3D SNOR_MFR_INTEL ||
> +	    JEDEC_MFR(info) =3D=3D SNOR_MFR_MICRON ||
>  	    JEDEC_MFR(info) =3D=3D SNOR_MFR_SST) {
>  		write_enable(nor);
>  		write_sr(nor, 0);
This update is not related with the support of fast-read mode, it deals wit=
h the write protection. Hence it should be moved into a dedicated patch.

Also be careful as some bits of the Status Register are non-volatile on Mic=
ron memories. This modification may change their values but I guess you onl=
y want to clear the write enable/disable (7) bit.


> @@ -1317,6 +1319,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *n=
ame, enum read_mode mode)
>  		nor->flash_read =3D SPI_NOR_QUAD;
>  	} else if (mode =3D=3D SPI_NOR_DUAL && info->flags & SPI_NOR_DUAL_READ)=
 {
>  		nor->flash_read =3D SPI_NOR_DUAL;
> +	} else if (mode =3D=3D SPI_NOR_FAST && info->flags & SPI_NOR_FAST) {
> +		nor->flash_read =3D SPI_NOR_FAST;
>  	}
> =20
>  	/* Default commands */
>=20
The spi-nor framework already checks the "m25p,fast-read" DT property to ch=
oose between the Read (0x03) and Fast Read (0x0b) command.

So the fsl-quadspi.c driver should rely on this existing property to choose=
 which of SPI_NOR_FAST or SPI_NOR_QUAD is used as the mode argument of spi_=
nor_scan(). As long as mode is neither SPI_NOR_QUAD nor SPI_NOR_DUAL, the c=
hoice of the read op code is done according to whether the "m25p,fast-read"=
 DT property is set or not.


Best regards,

Cyrille
