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
 <Cristian.Birsan@microchip.com>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v3 1/2] mtd: spi-nor: add support to non-uniform SFDP SPI
 NOR flash memories
Date: Mon, 22 Oct 2018 08:32:21 +0000
Message-ID: <VI1PR04MB1038A95F9378AAEAC8D75CB399F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
References: <20180911154007.17195-1-tudor.ambarus@microchip.com>
 <20180911154007.17195-2-tudor.ambarus@microchip.com>
 <VI1PR04MB103888BC18F3C5AD0C02DEF699FE0@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <31a8f6a9-1459-443a-6ef8-2b2c17769ae4@microchip.com>
 <de0f7245-2557-12be-a306-67b08e55ae7b@wedev4u.fr>
 <VI1PR04MB1038AB25EABDC8507984ADC799FF0@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181017090724.12f2cd79@bbrezillon>	<20181017091045.124e0266@bbrezillon>
 <20181017092941.3658bd9a@bbrezillon>
 <VI1PR04MB1038EFA1E83AD78EBE84ECC499FF0@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181017115237.07310b74@bbrezillon>
 <VI1PR04MB1038BD6103DD8BD6B6DEC2B899F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181022100152.05da1b6c@bbrezillon>
In-Reply-To: <20181022100152.05da1b6c@bbrezillon>
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

HI,


> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Monday, October 22, 2018 1:32 PM
> To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>; Tudor Ambarus
> <tudor.ambarus@microchip.com>; marek.vasut@gmail.com;
> dwmw2@infradead.org; computersforpeace@gmail.com; richard@nod.at;
> linux-kernel@vger.kernel.org; nicolas.ferre@microchip.com;
> cyrille.pitchen@microchip.com; linux-mtd@lists.infradead.org; linux-arm-
> kernel@lists.infradead.org; Cristian.Birsan@microchip.com; Mark Brown
> <broonie@kernel.org>
> Subject: Re: [PATCH v3 1/2] mtd: spi-nor: add support to non-uniform SFDP=
 SPI
> NOR flash memories
>=20
> On Mon, 22 Oct 2018 06:04:13 +0000
> Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:
>=20
> > -static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const
> > u32 *smpt)
> > +static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const
> > +u32 *smpt, u32 smpt_len)
> >  {
> >         const u32 *ret =3D NULL;
> > -       u32 i, addr;
> > +       u32 i, addr, nmaps;
> >         int err;
> >         u8 addr_width, read_opcode, read_dummy;
> >         u8 read_data_mask, data_byte, map_id;
> > +       bool map_id_is_valid =3D false;
> >
> >         addr_width =3D nor->addr_width;
> >         read_dummy =3D nor->read_dummy;
> >         read_opcode =3D nor->read_opcode;
> >
> > +       for (i =3D 0; i<smpt_len; i++)
> > +               pr_info("%s:%i smpt[%d]=3D%08x\n", __func__, __LINE__,
> > + i, smpt[i]);
> > +
> >         map_id =3D 0;
> > -       i =3D 0;
> >         /* Determine if there are any optional Detection Command Descri=
ptors */
> > -       while (!(smpt[i] & SMPT_DESC_TYPE_MAP)) {
> > +       for (i =3D 0; i< smpt_len; i++) {
> > +               if (!(smpt[i] & SMPT_DESC_TYPE_MAP))
> > +                       break;
> > +
> >                 read_data_mask =3D SMPT_CMD_READ_DATA(smpt[i]);
> >                 nor->addr_width =3D spi_nor_smpt_addr_width(nor, smpt[i=
]);
> >                 nor->read_dummy =3D spi_nor_smpt_read_dummy(nor,
> > smpt[i]);
>=20
> Could you also print the ->addr_width, ->read_dummy and ->read_opcode her=
e?
>=20
It didn't showing any print messages here, did above line "         if (!(s=
mpt[i] & SMPT_DESC_TYPE_MAP))" also needs to be changes to "    if ((smpt[i=
] & SMPT_DESC_TYPE_MAP))"?

Below is the log, with the suggested change of modifying as
> +       for (nmaps =3D 0; nmaps< smpt_len; nmaps++) {
> +               if((smpt[nmaps] & SMPT_DESC_TYPE_MAP))

[    1.625992] m25p80 spi0.0: found s25fl512s, expected m25p80             =
                                                     =20
[    1.631681] spi_nor_get_map_in_use:2880 smpt[0]=3D08ff65fc              =
                                                       =20
[    1.636988] spi_nor_get_map_in_use:2880 smpt[1]=3D00000004              =
                                                       =20
[    1.642292] spi_nor_get_map_in_use:2880 smpt[2]=3D04ff65fc              =
                                                       =20
[    1.647596] spi_nor_get_map_in_use:2880 smpt[3]=3D00000002              =
                                                       =20
[    1.652898] spi_nor_get_map_in_use:2880 smpt[4]=3D02ff65fd              =
                                                       =20
[    1.658200] spi_nor_get_map_in_use:2880 smpt[5]=3D00000004              =
                                                       =20
[    1.663503] spi_nor_get_map_in_use:2880 smpt[6]=3Dff0201fe              =
                                                       =20
[    1.668806] spi_nor_get_map_in_use:2880 smpt[7]=3D00007ff1              =
                                                       =20
[    1.674108] spi_nor_get_map_in_use:2880 smpt[8]=3D00037ff4              =
                                                       =20
[    1.679412] spi_nor_get_map_in_use:2880 smpt[9]=3D03fbfff4              =
                                                       =20
[    1.684715] spi_nor_get_map_in_use:2880 smpt[10]=3Dff0203fe             =
                                                       =20
[    1.690105] spi_nor_get_map_in_use:2880 smpt[11]=3D03fbfff4             =
                                                       =20
[    1.695495] spi_nor_get_map_in_use:2880 smpt[12]=3D00037ff4             =
                                                       =20
[    1.700886] spi_nor_get_map_in_use:2880 smpt[13]=3D00007ff1             =
                                                       =20
[    1.706275] spi_nor_get_map_in_use:2880 smpt[14]=3Dff0005ff             =
                                                       =20
[    1.711664] spi_nor_get_map_in_use:2880 smpt[15]=3D03fffff4             =
                                                       =20
[    1.717053] spi_nor_get_map_in_use:2910 NO map_id                       =
                                                     =20
[    1.721777] m25p80 spi0.0: s25fl512s (65536 Kbytes)               =20

Didn't throw any return error.

--
Regards,
Yogesh Gaur


> > @@ -2894,18 +2900,35 @@ static const u32 *spi_nor_get_map_in_use(struct
> spi_nor *nor, const u32 *smpt)
> >                  * Configuration that is currently in use.
> >                  */
> >                 map_id =3D map_id << 1 | !!(data_byte & read_data_mask)=
;
> > +               map_id_is_valid =3D true;
> >                 i =3D i + 2;
> >         }
