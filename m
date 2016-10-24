Received: from mail-eopbgr10136.outbound.protection.outlook.com
 ([40.107.1.136] helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byYSr-0000CJ-6K
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 06:10:32 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: Marek Vasut <marek.vasut@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
CC: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>,
 "rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: RE: [PATCH] mtd: spi-nor: Add possibility to disable chip erase
Date: Mon, 24 Oct 2016 06:10:02 +0000
Message-ID: <AM4PR0701MB21309FFCFE8370E3153ED66AFEA90@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1477054546-2548-1-git-send-email-marcin.krzeminski@nokia.com>
 <3b23706b-bf46-8d3b-e9b0-01194eec5e11@gmail.com>
In-Reply-To: <3b23706b-bf46-8d3b-e9b0-01194eec5e11@gmail.com>
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

Hi Marek,

> -----Original Message-----
> From: Marek Vasut [mailto:marek.vasut@gmail.com]
> Sent: Friday, October 21, 2016 7:53 PM
> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
> <marcin.krzeminski@nokia.com>; linux-mtd@lists.infradead.org
> Cc: computersforpeace@gmail.com; cyrille.pitchen@atmel.com; rfsw-
> patches@mlist.nokia.com; dwmw2@infradead.org
> Subject: Re: [PATCH] mtd: spi-nor: Add possibility to disable chip erase
>=20
> On 10/21/2016 02:55 PM, marcin.krzeminski@nokia.com wrote:
> > From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> >
> > n25q00 does not support chip erase command (0xC7), but spi-nor
> > framework still send if if user want to erase whole flash. This patch
> > adds option to disable chip erase command and enable in on n25q00.
>=20
> That's true and it's a pretty nasty issue.
> Can you instead implement logic to send multiple die-erase commands ?
> They do make erasing faster afterall.
>=20
As we talked I would like to have die erase. I post is after tests,
It will be a difference series since functionality will be different.
In my MT25Q00 difference between die erase and sector at time erase
is about 40 second.

Regards,
Marcin

> > Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 9 ++++++---
> >  include/linux/mtd/spi-nor.h   | 1 +
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > b/drivers/mtd/spi-nor/spi-nor.c index d0fc165..8338be1 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -75,6 +75,7 @@ struct flash_info {
> >  					 * bit. Must be used with
> >  					 * SPI_NOR_HAS_LOCK.
> >  					 */
> > +#define DISABLE_CE			BIT(10)	/*Some multi-die
> flash does not support CE */
> >  };
> >
> >  #define JEDEC_MFR(info)	((info)->id[0])
> > @@ -368,7 +369,7 @@ static int spi_nor_erase(struct mtd_info *mtd,
> struct erase_info *instr)
> >  		return ret;
> >
> >  	/* whole-chip erase? */
> > -	if (len =3D=3D mtd->size) {
> > +	if (len =3D=3D mtd->size && !(nor->flags & SNOR_F_DISABLE_CE)) {
> >  		unsigned long timeout;
> >
> >  		write_enable(nor);
> > @@ -886,8 +887,8 @@ static const struct flash_info spi_nor_ids[] =3D {
> >  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
> SPI_NOR_QUAD_READ) },
> >  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K |
> USE_FSR | SPI_NOR_QUAD_READ) },
> >  	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K |
> USE_FSR | SPI_NOR_QUAD_READ) },
> > -	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR
> | SPI_NOR_QUAD_READ) },
> > -	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR
> | SPI_NOR_QUAD_READ) },
> > +	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR
> | SPI_NOR_QUAD_READ | DISABLE_CE) },
> > +	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR
> | SPI_NOR_QUAD_READ | DISABLE_CE) },
> >
> >  	/* PMC */
> >  	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
> > @@ -1395,6 +1396,8 @@ int spi_nor_scan(struct spi_nor *nor, const char
> *name, enum read_mode mode)
> >  		nor->flags |=3D SNOR_F_USE_FSR;
> >  	if (info->flags & SPI_NOR_HAS_TB)
> >  		nor->flags |=3D SNOR_F_HAS_SR_TB;
> > +	if (info->flags & DISABLE_CE)
> > +		nor->flags |=3D SNOR_F_DISABLE_CE;
> >
> >  #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
> >  	/* prefer "small sector" erase if possible */ diff --git
> > a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h index
> > c425c7b..2d0b967 100644
> > --- a/include/linux/mtd/spi-nor.h
> > +++ b/include/linux/mtd/spi-nor.h
> > @@ -119,6 +119,7 @@ enum spi_nor_ops {  enum spi_nor_option_flags {
> >  	SNOR_F_USE_FSR		=3D BIT(0),
> >  	SNOR_F_HAS_SR_TB	=3D BIT(1),
> > +	SNOR_F_DISABLE_CE	=3D BIT(2),
> >  };
> >
> >  /**
> >
>=20
>=20
> --
> Best regards,
> Marek Vasut
