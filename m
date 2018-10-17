From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "richard@nod.at"
 <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nicolas.ferre@microchip.com"
 <nicolas.ferre@microchip.com>, "cyrille.pitchen@microchip.com"
 <cyrille.pitchen@microchip.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "Cristian.Birsan@microchip.com"
 <Cristian.Birsan@microchip.com>
Subject: RE: [PATCH v3 1/2] mtd: spi-nor: add support to non-uniform SFDP SPI
 NOR flash memories
Date: Wed, 17 Oct 2018 07:46:30 +0000
Message-ID: <VI1PR04MB1038EFA1E83AD78EBE84ECC499FF0@VI1PR04MB1038.eurprd04.prod.outlook.com>
References: <20180911154007.17195-1-tudor.ambarus@microchip.com>
 <20180911154007.17195-2-tudor.ambarus@microchip.com>
 <VI1PR04MB103888BC18F3C5AD0C02DEF699FE0@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <31a8f6a9-1459-443a-6ef8-2b2c17769ae4@microchip.com>
 <de0f7245-2557-12be-a306-67b08e55ae7b@wedev4u.fr>
 <VI1PR04MB1038AB25EABDC8507984ADC799FF0@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181017090724.12f2cd79@bbrezillon>	<20181017091045.124e0266@bbrezillon>
 <20181017092941.3658bd9a@bbrezillon>
In-Reply-To: <20181017092941.3658bd9a@bbrezillon>
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

Hi Boris,

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Wednesday, October 17, 2018 1:00 PM
> To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>; Tudor Ambarus
> <tudor.ambarus@microchip.com>; marek.vasut@gmail.com;
> dwmw2@infradead.org; computersforpeace@gmail.com; richard@nod.at;
> linux-kernel@vger.kernel.org; nicolas.ferre@microchip.com;
> cyrille.pitchen@microchip.com; linux-mtd@lists.infradead.org; linux-arm-
> kernel@lists.infradead.org; Cristian.Birsan@microchip.com
> Subject: Re: [PATCH v3 1/2] mtd: spi-nor: add support to non-uniform SFDP=
 SPI
> NOR flash memories
>=20
> On Wed, 17 Oct 2018 09:10:45 +0200
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
>=20
> > On Wed, 17 Oct 2018 09:07:24 +0200
> > Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> >
> > > On Wed, 17 Oct 2018 02:07:43 +0000
> > > Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:
> > >
> > > > >
> > > > Actually there is no entry of s25fs512s in current spi-nor.c file.
> > > > For my connected flash part, jedec ID read points to s25fl512s. I
> > > > have asked my board team to confirm the name of exact connected
> > > > flash part. When I check the data sheet of s25fs512s, it also
> > > > points to the same Jedec ID information. { "s25fl512s",
> > > > INFO(0x010220, 0x4d00, 256
> > > > * 1024, 256, ....}
> > > >
> > > > But as stated earlier, if I skip reading SFDP or read using 1-1-1
> > > > protocol then read are always correct. For 1-4-4 protocol read are
> > > > wrong and on further debugging found that Read code of 0x6C is
> > > > being send as opcode instead of 0xEC.
> > > >
> > > > If I revert this patch, reads are working fine.
> > >
> > > Can you try with the following patch?
> > >
> >
> > Hm, nevermind. The problem is actually not related to 4B vs non-4B
> > mode but 1-1-4 vs 1-4-4 modes.
Yes, that's only I have stated in my first mail that instead of 1-4-4 mode =
read opcode is being sent for 1-1-4 mode.
> >
>=20
> Can you try with this patch applied?
>=20
With suggested patch, read for protocol 1-4-4 working correctly.

	[    1.625360] m25p80 spi0.0: found s25fl512s, expected m25p80            =
                                                      =20
	[    1.631094] m25p80 spi0.0: failed to parse SMPT (err =3D -22)          =
                                                        =20
	[    1.636661] 261 8c4c780 opcode(read:eb, pp:2, erase:d8)                =
                                                      =20
	[    1.641878] 266 8c4c780 opcode(read:ec, pp:12, erase:dc)               =
                                                      =20
	[    1.647200] m25p80 spi0.0: s25fl512s (65536 Kbytes)        =20

Without this patch, param_headers are getting freed and restoring previous =
erase map i.e. opcode related to 1-1-4 protocol.

--
Regards
Yogesh Gaur

> --->8---
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.=
c index
> 9407ca5f9443..cf33d834698c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -3132,6 +3132,17 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>                 switch (SFDP_PARAM_HEADER_ID(param_header)) {
>                 case SFDP_SECTOR_MAP_ID:
>                         err =3D spi_nor_parse_smpt(nor, param_header);
> +                       if (err) {
> +                               dev_warn(dev,
> +                                        "failed to parse SMPT (err =3D %=
d)\n",
> +                                        err);
> +                               /*
> +                                * SMPT parsing is optional, let's not dr=
op
> +                                * all information we extracted so far ju=
st
> +                                * because it failed.
> +                                */
> +                               err =3D 0;
> +                       }
>                         break;
>=20
>                 default:
