From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, "richard@nod.at"
 <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "cyrille.pitchen@microchip.com" <cyrille.pitchen@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Cristian.Birsan@microchip.com" <Cristian.Birsan@microchip.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 1/2] mtd: spi-nor: add support to non-uniform SFDP SPI
 NOR flash memories
Date: Mon, 22 Oct 2018 10:39:48 +0000
Message-ID: <VI1PR04MB1038E92FFAB03E07048FD8B499F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
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
 <20181022111543.2a607efc@bbrezillon>
 <VI1PR04MB1038EF892921194D1BFDE6FC99F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181022122659.0675942e@bbrezillon>
In-Reply-To: <20181022122659.0675942e@bbrezillon>
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

Hi,

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Monday, October 22, 2018 3:57 PM
> To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>; richard@nod.at; Mark
> Brown <broonie@kernel.org>; linux-kernel@vger.kernel.org;
> nicolas.ferre@microchip.com; marek.vasut@gmail.com;
> cyrille.pitchen@microchip.com; linux-mtd@lists.infradead.org;
> Cristian.Birsan@microchip.com; Cyrille Pitchen <cyrille.pitchen@wedev4u.f=
r>;
> computersforpeace@gmail.com; dwmw2@infradead.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v3 1/2] mtd: spi-nor: add support to non-uniform SFDP=
 SPI
> NOR flash memories
>=20
> On Mon, 22 Oct 2018 10:03:55 +0000
> Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:
>=20
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -2863,26 +2863,36 @@ static u8 spi_nor_smpt_read_dummy(const struct
> spi_nor *nor, const u32 settings)
> >   * @nor:       pointer to a 'struct spi_nor'
> >   * @smpt:      pointer to the sector map parameter table
> >   */
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
> > +       pr_info("Start [addr_width:%08x, read_dumy:%0x8,
> > + read_opcode:%08x]\n", nor->addr_width, nor->read_dummy,
> > + nor->read_opcode);
> > +
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
>=20
> 				   ^ i +=3D 2) {
>=20
> > +               if ((smpt[i] & SMPT_DESC_TYPE_MAP))
> > +                       break;
> > +
> >                 read_data_mask =3D SMPT_CMD_READ_DATA(smpt[i]);
> >                 nor->addr_width =3D spi_nor_smpt_addr_width(nor, smpt[i=
]);
> >                 nor->read_dummy =3D spi_nor_smpt_read_dummy(nor, smpt[i=
]);
> >                 nor->read_opcode =3D SMPT_CMD_OPCODE(smpt[i]);
> > +               pr_info("smpt[%d]=3D[addr_width:%08x, read_dumy:%0x8,
> > + read_opcode:%08x]\n", i, nor->addr_width, nor->read_dummy,
> > + nor->read_opcode);
> > +
> >                 addr =3D smpt[i + 1];
> >
> >                 err =3D spi_nor_read_raw(nor, addr, 1, &data_byte); @@
> > -2894,18 +2904,36 @@ static const u32 *spi_nor_get_map_in_use(struct
> spi_nor *nor, const u32 *smpt)
> >                  * Configuration that is currently in use.
> >                  */
> >                 map_id =3D map_id << 1 | !!(data_byte & read_data_mask)=
;
> > +               map_id_is_valid =3D true;
> >                 i =3D i + 2;
>=20
> Drop the above line (i =3D i + 2).
>=20

[    1.632190] Start [addr_width:00000000, read_dumy:08, read_opcode:000000=
00]                                                  =20
[    1.639148] spi_nor_get_map_in_use:2882 smpt[0]=3D08ff65fc              =
                                                       =20
[    1.644451] spi_nor_get_map_in_use:2882 smpt[1]=3D00000004              =
                                                       =20
[    1.649755] spi_nor_get_map_in_use:2882 smpt[2]=3D04ff65fc              =
                                                       =20
[    1.655057] spi_nor_get_map_in_use:2882 smpt[3]=3D00000002              =
                                                       =20
[    1.660360] spi_nor_get_map_in_use:2882 smpt[4]=3D02ff65fd              =
                                                       =20
[    1.665662] spi_nor_get_map_in_use:2882 smpt[5]=3D00000004              =
                                                       =20
[    1.670965] spi_nor_get_map_in_use:2882 smpt[6]=3Dff0201fe              =
                                                       =20
[    1.676267] spi_nor_get_map_in_use:2882 smpt[7]=3D00007ff1              =
                                                       =20
[    1.681571] spi_nor_get_map_in_use:2882 smpt[8]=3D00037ff4              =
                                                       =20
[    1.686874] spi_nor_get_map_in_use:2882 smpt[9]=3D03fbfff4              =
                                                       =20
[    1.692176] spi_nor_get_map_in_use:2882 smpt[10]=3Dff0203fe             =
                                                       =20
[    1.697566] spi_nor_get_map_in_use:2882 smpt[11]=3D03fbfff4             =
                                                       =20
[    1.702954] spi_nor_get_map_in_use:2882 smpt[12]=3D00037ff4             =
                                                       =20
[    1.708343] spi_nor_get_map_in_use:2882 smpt[13]=3D00007ff1             =
                                                       =20
[    1.713732] spi_nor_get_map_in_use:2882 smpt[14]=3Dff0005ff             =
                                                       =20
[    1.719120] spi_nor_get_map_in_use:2882 smpt[15]=3D03fffff4             =
                                                       =20
[    1.724509] smpt[0]=3D[addr_width:00000000, read_dumy:08, read_opcode:00=
000065]                                                =20
[    1.731650] smpt[1]=3D[addr_width:00000000, read_dumy:08, read_opcode:00=
000000]                                                =20
[    1.738791] smpt[2]=3D[addr_width:00000000, read_dumy:08, read_opcode:00=
000065]                                                =20
[    1.745932] spi_nor_get_map_in_use:2911 map_id=3D0 smpt_len:16 i=3D:3   =
                                                         =20
[    1.752018] End [addr_width:00000000, read_dumy:08, read_opcode:00000065=
]        =20

Also, one more thing when we are returning from the function, we are over-w=
riting the values of addr_widthm read_dummy and read_opcode.
Is this correct?

out:
        nor->addr_width =3D addr_width;
        nor->read_dummy =3D read_dummy;
        nor->read_opcode =3D read_opcode;
        return ret;
}

--
Regards
Yogesh Gaur
> >         }
> >
> > -       /* Find the matching configuration map */
> > -       while (SMPT_MAP_ID(smpt[i]) !=3D map_id) {
> > -               if (smpt[i] & SMPT_DESC_END)
> > -                       goto out;
> > +       if (map_id_is_valid)
> > +               pr_info("%s:%i map_id=3D%d\n", __func__, __LINE__, map_=
id);
> > +       else
> > +               pr_info("%s:%i NO map_id\n", __func__, __LINE__);
> > +
> > +       for (nmaps =3D 0; i< smpt_len; nmaps++) {
> > +               if((smpt[i] & SMPT_DESC_TYPE_MAP))
> > +                       continue;
> > +
> > +               if(!map_id_is_valid) {
> > +                       if (nmaps) {
> > +                               ret =3D NULL;
> > +                               break;
> > +                       }
> > +
> > +                       ret =3D smpt+i;
> > +               } else if (map_id =3D=3D SMPT_MAP_ID(smpt[i])) {
> > +                       ret =3D smpt+i;
> > +                       break;
> > +               }
> > +
> >                 /* increment the table index to the next map */
> >                 i +=3D SMPT_MAP_REGION_COUNT(smpt[i]) + 1;
> >         }
> >
> > -       ret =3D smpt + i;
> > +       pr_info("End [addr_width:%08x, read_dumy:%0x8,
> > + read_opcode:%08x]\n", nor->addr_width, nor->read_dummy,
> > + nor->read_opcode);
> >         /* fall through */
> >  out:
> >         nor->addr_width =3D addr_width;
