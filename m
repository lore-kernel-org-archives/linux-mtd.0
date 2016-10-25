Received: from mail-he1eur01on0129.outbound.protection.outlook.com
 ([104.47.0.129] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byuWu-0005O9-TX
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 05:44:10 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>
Subject: RE: [PATCH 1/3] mtd: spi-nor: Add die_cnt field and flags
Date: Tue, 25 Oct 2016 05:43:44 +0000
Message-ID: <AM4PR0701MB2130E8217FE5642F6FF3E362FEA80@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1477314214-17718-1-git-send-email-marcin.krzeminski@nokia.com>
 <1477314214-17718-2-git-send-email-marcin.krzeminski@nokia.com>
 <0386ac08-f41e-1e10-d0e6-a16624bba952@atmel.com>
In-Reply-To: <0386ac08-f41e-1e10-d0e6-a16624bba952@atmel.com>
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

> -----Original Message-----
> From: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
> Sent: Monday, October 24, 2016 3:55 PM
> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
> <marcin.krzeminski@nokia.com>; linux-mtd@lists.infradead.org
> Cc: rfsw-patches@mlist.nokia.com; dwmw2@infradead.org;
> computersforpeace@gmail.com; marek.vasut@gmail.com
> Subject: Re: [PATCH 1/3] mtd: spi-nor: Add die_cnt field and flags
>=20
> Hi Marcin,
>=20
> Le 24/10/2016 =E0 15:03, marcin.krzeminski@nokia.com a =E9crit :
> > From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> >
> > This commit adds new field and flags that could be used to signalize
> > that chip support die erase command.
> >
> > If DIE_ERASE flag will be selected but die_cnt field will be 0 chip
> > will not use chip erase command.
> >
> > Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 18 ++++++++++++++++++
> >  include/linux/mtd/spi-nor.h   |  5 +++++
> >  2 files changed, 23 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > b/drivers/mtd/spi-nor/spi-nor.c index d0fc165..3afe207 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -75,6 +75,7 @@ struct flash_info {
> >  					 * bit. Must be used with
> >  					 * SPI_NOR_HAS_LOCK.
> >  					 */
> > +#define DIE_ERASE			BIT(10)	/* Support for die erase cmd
> */
> >  };
> >
> >  #define JEDEC_MFR(info)	((info)->id[0])
> > @@ -295,6 +296,23 @@ static int erase_chip(struct spi_nor *nor)
> >  	return nor->write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0);  }
> >
> > +static int spi_nor_die_erase(struct spi_nor *nor, u32 addr) {
> > +	u8 buf[SPI_NOR_MAX_ADDR_WIDTH];
> > +	int i;
> > +
> > +	dev_dbg(nor->dev, "erase @ 0x%X\n", addr);
> > +
> > +	write_enable(nor);
> > +
> > +	for (i =3D nor->addr_width - 1; i >=3D 0; i--) {
> > +		buf[i] =3D addr & 0xff;
> > +		addr >>=3D 8;
> > +	}
> > +
> > +	return nor->write_reg(nor, SPINOR_OP_DIE_ERASE, buf,
> > +nor->addr_width);
>=20
> If think you should first check whether nor->erase() is implemented by th=
e
> SPI controller driver and call it instead of nor->write_reg().
>=20
> For instance, some SPI controllers are mapped to the system memory to
> speed up Fast Read operations. In which case, they could also enable data
> cache to fasten even more the read operations.
>=20
> So when the spi-nor framework calls nor->erase() or nor->write(), those
> handlers might need to invalidate the cache before performing the next
> read.
>=20
> This is just an example but generally speaking, don't forget the nor->era=
se()
> handler! :)
>=20
Thanks for extensive clarification, I will include this in v2.

Regards,
Marcin

>=20
> > +}
> > +
> >  static int spi_nor_lock_and_prep(struct spi_nor *nor, enum
> > spi_nor_ops ops)  {
> >  	int ret =3D 0;
> > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> > index c425c7b..80154b2 100644
> > --- a/include/linux/mtd/spi-nor.h
> > +++ b/include/linux/mtd/spi-nor.h
> > @@ -50,6 +50,7 @@
> >  #define SPINOR_OP_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC
> chips */
> >  #define SPINOR_OP_BE_32K	0x52	/* Erase 32KiB block */
> >  #define SPINOR_OP_CHIP_ERASE	0xc7	/* Erase whole flash chip */
> > +#define SPINOR_OP_DIE_ERASE	0xc4	/* Erase whole die within chip
> */
> >  #define SPINOR_OP_SE		0xd8	/* Sector erase (usually
> 64KiB) */
> >  #define SPINOR_OP_RDID		0x9f	/* Read JEDEC ID */
> >  #define SPINOR_OP_RDCR		0x35	/* Read configuration register
> */
> > @@ -119,6 +120,7 @@ enum spi_nor_ops {  enum spi_nor_option_flags {
> >  	SNOR_F_USE_FSR		=3D BIT(0),
> >  	SNOR_F_HAS_SR_TB	=3D BIT(1),
> > +	SNOR_F_DIE_ERASE	=3D BIT(2),
> >  };
> >
> >  /**
> > @@ -136,6 +138,8 @@ enum spi_nor_option_flags {
> >   * @sst_write_second:	used by the SST write operation
> >   * @flags:		flag options for the current SPI-NOR (SNOR_F_*)
> >   * @cmd_buf:		used by the write_reg
> > + * @die_cnt:		number of dies in chip, if and
> SNOR_F_DIE_ERASE
>=20
> The 1st flag is missing between "if" and "and", isn't it?
> > + * 			flasg is enabled CE command will be disabled
>=20
> typo: s/flasg/flags/
> >   * @prepare:		[OPTIONAL] do some preparations for the
> >   *			read/write/erase/lock/unlock operations
> >   * @unprepare:		[OPTIONAL] do some post work after the
> > @@ -167,6 +171,7 @@ struct spi_nor {
> >  	bool			sst_write_second;
> >  	u32			flags;
> >  	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
> > +	u32			die_cnt;
> >
> >  	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
> >  	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
> >
>=20
> Best regards,
>=20
> Cyrille
