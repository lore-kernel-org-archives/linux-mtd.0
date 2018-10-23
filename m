From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "Cristian.Birsan@microchip.com" <Cristian.Birsan@microchip.com>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, "richard@nod.at" <richard@nod.at>,
 Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nicolas.ferre@microchip.com"
 <nicolas.ferre@microchip.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "cyrille.pitchen@microchip.com"
 <cyrille.pitchen@microchip.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 1/2] mtd: spi-nor: add support to non-uniform SFDP SPI
 NOR flash memories
Date: Tue, 23 Oct 2018 04:47:33 +0000
Message-ID: <VI1PR04MB1038B9A5A8C59E6CB0863FF599F50@VI1PR04MB1038.eurprd04.prod.outlook.com>
References: <20180911154007.17195-1-tudor.ambarus@microchip.com>
 <VI1PR04MB1038AB25EABDC8507984ADC799FF0@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181017090724.12f2cd79@bbrezillon>	<20181017091045.124e0266@bbrezillon>
 <20181017092941.3658bd9a@bbrezillon>
 <VI1PR04MB1038EFA1E83AD78EBE84ECC499FF0@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181017115237.07310b74@bbrezillon>
 <VI1PR04MB1038BD6103DD8BD6B6DEC2B899F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181022111543.2a607efc@bbrezillon>
 <VI1PR04MB1038EF892921194D1BFDE6FC99F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181022122659.0675942e@bbrezillon>
 <VI1PR04MB1038E92FFAB03E07048FD8B499F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181022124627.2c6c3b93@bbrezillon>	<20181022125259.42df83ea@bbrezillon>
 <VI1PR04MB1038C9C889185F2A700220F299F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181022134324.2c1bd248@bbrezillon>
 <VI1PR04MB1038E072BFFD09C7C19AD2F899F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181022135211.1978c25d@bbrezillon>
In-Reply-To: <20181022135211.1978c25d@bbrezillon>
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
> Sent: Monday, October 22, 2018 5:22 PM
> To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
> Cc: Cristian.Birsan@microchip.com; Tudor Ambarus
> <tudor.ambarus@microchip.com>; richard@nod.at; Mark Brown
> <broonie@kernel.org>; linux-kernel@vger.kernel.org;
> nicolas.ferre@microchip.com; marek.vasut@gmail.com;
> cyrille.pitchen@microchip.com; linux-mtd@lists.infradead.org; Cyrille Pit=
chen
> <cyrille.pitchen@wedev4u.fr>; computersforpeace@gmail.com;
> dwmw2@infradead.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v3 1/2] mtd: spi-nor: add support to non-uniform SFDP=
 SPI
> NOR flash memories
>=20
> On Mon, 22 Oct 2018 11:46:55 +0000
> Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:
>=20
> > Hi,
> >
> > > -----Original Message-----
> > > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > > Sent: Monday, October 22, 2018 5:13 PM
> > > To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
> > > Cc: Cristian.Birsan@microchip.com; Tudor Ambarus
> > > <tudor.ambarus@microchip.com>; richard@nod.at; Mark Brown
> > > <broonie@kernel.org>; linux-kernel@vger.kernel.org;
> > > nicolas.ferre@microchip.com; marek.vasut@gmail.com;
> > > cyrille.pitchen@microchip.com; linux-mtd@lists.infradead.org;
> > > Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>;
> > > computersforpeace@gmail.com; dwmw2@infradead.org;
> > > linux-arm-kernel@lists.infradead.org
> > > Subject: Re: [PATCH v3 1/2] mtd: spi-nor: add support to non-uniform
> > > SFDP SPI NOR flash memories
> > >
> > > On Mon, 22 Oct 2018 11:03:09 +0000
> > > Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:
> > >
> > > > Hi,
> > > >
> > > > > -----Original Message-----
> > > > > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > > > > Sent: Monday, October 22, 2018 4:23 PM
> > > > > To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>;
> > > > > Cristian.Birsan@microchip.com
> > > > > Cc: Tudor Ambarus <tudor.ambarus@microchip.com>; richard@nod.at;
> > > > > Mark Brown <broonie@kernel.org>; linux-kernel@vger.kernel.org;
> > > > > nicolas.ferre@microchip.com; marek.vasut@gmail.com;
> > > > > cyrille.pitchen@microchip.com; linux-mtd@lists.infradead.org;
> > > > > Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>;
> > > > > computersforpeace@gmail.com; dwmw2@infradead.org;
> > > > > linux-arm-kernel@lists.infradead.org
> > > > > Subject: Re: [PATCH v3 1/2] mtd: spi-nor: add support to
> > > > > non-uniform SFDP SPI NOR flash memories
> > > > >
> > > > > On Mon, 22 Oct 2018 12:46:27 +0200 Boris Brezillon
> > > > > <boris.brezillon@bootlin.com> wrote:
> > > > >
> > > > > > On Mon, 22 Oct 2018 10:39:48 +0000 Yogesh Narayan Gaur
> > > > > > <yogeshnarayan.gaur@nxp.com> wrote:
> > > > > >
> > Patch used
> >
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -2863,26 +2863,39 @@ static u8 spi_nor_smpt_read_dummy(const struct
> > spi_nor *nor, const u32 settings)
>=20
> >         /* Determine if there are any optional Detection Command Descri=
ptors */
> > -       while (!(smpt[i] & SMPT_DESC_TYPE_MAP)) {
> > +       for (i =3D 0; i< smpt_len; i++) {
>=20
> See, you should have i +=3D 2 here, not i++.

Ok
>=20
> > +               if ((smpt[i] & SMPT_DESC_TYPE_MAP))
> > +                       break;
> > +
> >                 read_data_mask =3D SMPT_CMD_READ_DATA(smpt[i]);
> >                 nor->addr_width =3D spi_nor_smpt_addr_width(nor, smpt[i=
]);
> > -               nor->read_dummy =3D spi_nor_smpt_read_dummy(nor, smpt[i=
]);
> > +               if (!nor->addr_width)
> > +                       nor->addr_width =3D 3;
> > +
> > +               nor->read_dummy =3D 8; //spi_nor_smpt_read_dummy(nor,
> > + smpt[i]);
> >                 nor->read_opcode =3D SMPT_CMD_OPCODE(smpt[i]);
> > +               pr_info("smpt[%d]=3D[addr_width:%08x, read_dumy:%08x,
> > + read_opcode:%08x]\n", i, nor->addr_width, nor->read_dummy,
> > + nor->read_opcode);
> > +
> >                 addr =3D smpt[i + 1];
> >
> >                 err =3D spi_nor_read_raw(nor, addr, 1, &data_byte);
>=20
> And add a trace here to print data_byte and addr.
>=20
Logs:
[    1.625840] m25p80 spi0.0: found s25fl512s, expected m25p80             =
                                                     =20
[    1.631536] Start [addr_width:00000000, read_dumy:00000000, read_opcode:=
00000000]                                            =20
[    1.639013] spi_nor_get_map_in_use:2882 smpt[0]=3D08ff65fc              =
                                                       =20
[    1.644317] spi_nor_get_map_in_use:2882 smpt[1]=3D00000004              =
                                                       =20
[    1.649621] spi_nor_get_map_in_use:2882 smpt[2]=3D04ff65fc              =
                                                       =20
[    1.654924] spi_nor_get_map_in_use:2882 smpt[3]=3D00000002              =
                                                       =20
[    1.660229] spi_nor_get_map_in_use:2882 smpt[4]=3D02ff65fd              =
                                                       =20
[    1.665532] spi_nor_get_map_in_use:2882 smpt[5]=3D00000004              =
                                                       =20
[    1.670836] spi_nor_get_map_in_use:2882 smpt[6]=3Dff0201fe              =
                                                       =20
[    1.676140] spi_nor_get_map_in_use:2882 smpt[7]=3D00007ff1              =
                                                       =20
[    1.681444] spi_nor_get_map_in_use:2882 smpt[8]=3D00037ff4              =
                                                       =20
[    1.686748] spi_nor_get_map_in_use:2882 smpt[9]=3D03fbfff4              =
                                                       =20
[    1.692052] spi_nor_get_map_in_use:2882 smpt[10]=3Dff0203fe             =
                                                       =20
[    1.697441] spi_nor_get_map_in_use:2882 smpt[11]=3D03fbfff4             =
                                                       =20
[    1.702830] spi_nor_get_map_in_use:2882 smpt[12]=3D00037ff4             =
                                                       =20
[    1.708220] spi_nor_get_map_in_use:2882 smpt[13]=3D00007ff1             =
                                                       =20
[    1.713608] spi_nor_get_map_in_use:2882 smpt[14]=3Dff0005ff             =
                                                       =20
[    1.718999] spi_nor_get_map_in_use:2882 smpt[15]=3D03fffff4             =
                                                       =20
[    1.724388] smpt[0]=3D[addr_width:00000003, read_dumy:00000008, read_opc=
ode:00000065]                                          =20
[    1.732050] smpt_read[1] addr[00000004], data_byte[00000000] err:0000000=
0                                                    =20
[    1.738830] smpt[2]=3D[addr_width:00000003, read_dumy:00000008, read_opc=
ode:00000065]                                          =20
[    1.746491] smpt_read[3] addr[00000002], data_byte[00000002] err:0000000=
0                                                    =20
[    1.753270] smpt[4]=3D[addr_width:00000003, read_dumy:00000008, read_opc=
ode:00000065]                                          =20
[    1.760930] smpt_read[5] addr[00000004], data_byte[00000000] err:0000000=
0                                                    =20
[    1.767710] spi_nor_get_map_in_use:2915 map_id=3D0 smpt_len:16 i=3D:6   =
                                                         =20
[    1.773794] End [addr_width:00000003, read_dumy:00000008, read_opcode:00=
000065] ReturnVal:00000000                               =20
[    1.781092] spi_nor_parse_smpt:3065                                     =
                                                     =20
[    1.784573] m25p80 spi0.0: failed to parse SMPT (err =3D -22)           =
                                                       =20
[    1.790153] m25p80 spi0.0: s25fl512s (65536 Kbytes) =20


Code:
        for (i =3D 0; i< smpt_len; i+=3D2) {
                if ((smpt[i] & SMPT_DESC_TYPE_MAP))
                        break;

                read_data_mask =3D SMPT_CMD_READ_DATA(smpt[i]);
                nor->addr_width =3D spi_nor_smpt_addr_width(nor, smpt[i]);
                if (!nor->addr_width)
                        nor->addr_width =3D 3;

                nor->read_dummy =3D 8;=20
                nor->read_opcode =3D SMPT_CMD_OPCODE(smpt[i]);
                pr_info("smpt[%d]=3D[addr_width:%08x, read_dumy:%08x, read_=
opcode:%08x]\n", i, nor->addr_width, nor->read_dummy, nor->read_opcode);

                addr =3D smpt[i + 1];

                err =3D spi_nor_read_raw(nor, addr, 1, &data_byte);
                pr_info("smpt_read[%d] addr[%08x], data_byte[%08x] err:%08x=
\n", (i+1), addr, data_byte, err);
                if (err)
                        goto out;

                /*
                 * Build an index value that is used to select the Sector M=
ap
                 * Configuration that is currently in use.
                 */
                map_id =3D map_id << 1 | !!(data_byte & read_data_mask);
                map_id_is_valid =3D true;
        }

        if (map_id_is_valid)
                pr_info("%s:%i map_id=3D%d smpt_len:%d i=3D:%d\n", __func__=
, __LINE__, map_id, smpt_len, i);
        else
                pr_info("%s:%i NO map_id\n", __func__, __LINE__);

        for (nmaps =3D 0; i< smpt_len; nmaps++) {
                if(!(smpt[i] & SMPT_DESC_TYPE_MAP)) {
                        i +=3D 2;
                        continue;
                }

                if(!map_id_is_valid) {
                        if (nmaps) {
                                ret =3D NULL;
                                break;
                        }

                        ret =3D smpt+i;
                } else if (map_id =3D=3D SMPT_MAP_ID(smpt[i])) {
                        ret =3D smpt+i;
                        break;
                }

                /* increment the table index to the next map */
                i +=3D SMPT_MAP_REGION_COUNT(smpt[i]) + 1;
        }

        pr_info("End [addr_width:%08x, read_dumy:%08x, read_opcode:%08x] Re=
turnVal:%08x\n", nor->addr_width, nor->read_dummy, nor->read_opcode, ret);

--
Thanks
Yogesh Gaur.

> Thanks,
>=20
> Boris
