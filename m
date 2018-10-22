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
Date: Mon, 22 Oct 2018 06:04:13 +0000
Message-ID: <VI1PR04MB1038BD6103DD8BD6B6DEC2B899F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
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
In-Reply-To: <20181017115237.07310b74@bbrezillon>
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

Hi Boris, Tudor,

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Wednesday, October 17, 2018 3:23 PM
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
> On Wed, 17 Oct 2018 07:46:30 +0000
> Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:
>=20
> > Hi Boris,
> >
> > > -----Original Message-----
> > > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > > Sent: Wednesday, October 17, 2018 1:00 PM
> > > To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
> > > Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>; Tudor Ambarus
> > > <tudor.ambarus@microchip.com>; marek.vasut@gmail.com;
> > > dwmw2@infradead.org; computersforpeace@gmail.com; richard@nod.at;
> > > linux-kernel@vger.kernel.org; nicolas.ferre@microchip.com;
> > > cyrille.pitchen@microchip.com; linux-mtd@lists.infradead.org;
> > > linux-arm- kernel@lists.infradead.org; Cristian.Birsan@microchip.com
> > > Subject: Re: [PATCH v3 1/2] mtd: spi-nor: add support to non-uniform
> > > SFDP SPI NOR flash memories
> > >
> > > On Wed, 17 Oct 2018 09:10:45 +0200
> > > Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> > >
> > > > On Wed, 17 Oct 2018 09:07:24 +0200 Boris Brezillon
> > > > <boris.brezillon@bootlin.com> wrote:
> > > >
> > > > > On Wed, 17 Oct 2018 02:07:43 +0000 Yogesh Narayan Gaur
> > > > > <yogeshnarayan.gaur@nxp.com> wrote:
> > > > >
> > > > > > >
> > > > > > Actually there is no entry of s25fs512s in current spi-nor.c fi=
le.
> > > > > > For my connected flash part, jedec ID read points to
> > > > > > s25fl512s. I have asked my board team to confirm the name of
> > > > > > exact connected flash part. When I check the data sheet of
> > > > > > s25fs512s, it also points to the same Jedec ID information. {
> > > > > > "s25fl512s", INFO(0x010220, 0x4d00, 256
> > > > > > * 1024, 256, ....}
> > > > > >
> > > > > > But as stated earlier, if I skip reading SFDP or read using
> > > > > > 1-1-1 protocol then read are always correct. For 1-4-4
> > > > > > protocol read are wrong and on further debugging found that
> > > > > > Read code of 0x6C is being send as opcode instead of 0xEC.
> > > > > >
> > > > > > If I revert this patch, reads are working fine.
> > > > >
> > > > > Can you try with the following patch?
> > > > >
> > > >
> > > > Hm, nevermind. The problem is actually not related to 4B vs non-4B
> > > > mode but 1-1-4 vs 1-4-4 modes.
> > Yes, that's only I have stated in my first mail that instead of 1-4-4 m=
ode read
> opcode is being sent for 1-1-4 mode.
> > > >
> > >
> > > Can you try with this patch applied?
> > >
> > With suggested patch, read for protocol 1-4-4 working correctly.
> >
> > 	[    1.625360] m25p80 spi0.0: found s25fl512s, expected m25p80
> > 	[    1.631094] m25p80 spi0.0: failed to parse SMPT (err =3D -22)
> > 	[    1.636661] 261 8c4c780 opcode(read:eb, pp:2, erase:d8)
> > 	[    1.641878] 266 8c4c780 opcode(read:ec, pp:12, erase:dc)
> > 	[    1.647200] m25p80 spi0.0: s25fl512s (65536 Kbytes)
> >
>=20
> Okay, let's try this one to see why the SMPT parsing fails.
>=20

Please find the below info for the SMPT table read from the flash
[    1.631085] spi_nor_get_map_in_use:2880 smpt[0]=3D08ff65fc  =20
[    1.636393] spi_nor_get_map_in_use:2880 smpt[1]=3D00000004  =20
[    1.641696] spi_nor_get_map_in_use:2880 smpt[2]=3D04ff65fc  =20
[    1.646998] spi_nor_get_map_in_use:2880 smpt[3]=3D00000002  =20
[    1.652302] spi_nor_get_map_in_use:2880 smpt[4]=3D02ff65fd  =20
[    1.657606] spi_nor_get_map_in_use:2880 smpt[5]=3D00000004  =20
[    1.662911] spi_nor_get_map_in_use:2880 smpt[6]=3Dff0201fe  =20
[    1.668215] spi_nor_get_map_in_use:2880 smpt[7]=3D00007ff1  =20
[    1.673520] spi_nor_get_map_in_use:2880 smpt[8]=3D00037ff4  =20
[    1.678825] spi_nor_get_map_in_use:2880 smpt[9]=3D03fbfff4  =20
[    1.684128] spi_nor_get_map_in_use:2880 smpt[10]=3Dff0203fe  =20
[    1.689519] spi_nor_get_map_in_use:2880 smpt[11]=3D03fbfff4  =20
[    1.694911] spi_nor_get_map_in_use:2880 smpt[12]=3D00037ff4  =20
[    1.700303] spi_nor_get_map_in_use:2880 smpt[13]=3D00007ff1  =20
[    1.705693] spi_nor_get_map_in_use:2880 smpt[14]=3Dff0005ff  =20
[    1.711081] spi_nor_get_map_in_use:2880 smpt[15]=3D03fffff4  =20
[    1.716470] spi_nor_get_map_in_use:2910 NO map_id          =20
[    1.721165] spi_nor_parse_smpt:3055                        =20
[    1.724645] m25p80 spi0.0: failed to parse SMPT (err =3D -22)

I have checked that all these information are matching with the fields spec=
ified in this flash data sheet [1], page 131-133.

Below is the full debug patch.

--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2863,22 +2863,28 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_=
nor *nor, const u32 settings)
  * @nor:       pointer to a 'struct spi_nor'
  * @smpt:      pointer to the sector map parameter table
  */
-static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *s=
mpt)
+static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *s=
mpt, u32 smpt_len)
 {
        const u32 *ret =3D NULL;
-       u32 i, addr;
+       u32 i, addr, nmaps;
        int err;
        u8 addr_width, read_opcode, read_dummy;
        u8 read_data_mask, data_byte, map_id;
+       bool map_id_is_valid =3D false;

        addr_width =3D nor->addr_width;
        read_dummy =3D nor->read_dummy;
        read_opcode =3D nor->read_opcode;

+       for (i =3D 0; i<smpt_len; i++)
+               pr_info("%s:%i smpt[%d]=3D%08x\n", __func__, __LINE__, i, s=
mpt[i]);
+
        map_id =3D 0;
-       i =3D 0;
        /* Determine if there are any optional Detection Command Descriptor=
s */
-       while (!(smpt[i] & SMPT_DESC_TYPE_MAP)) {
+       for (i =3D 0; i< smpt_len; i++) {
+               if (!(smpt[i] & SMPT_DESC_TYPE_MAP))
+                       break;
+
                read_data_mask =3D SMPT_CMD_READ_DATA(smpt[i]);
                nor->addr_width =3D spi_nor_smpt_addr_width(nor, smpt[i]);
                nor->read_dummy =3D spi_nor_smpt_read_dummy(nor, smpt[i]);
@@ -2894,18 +2900,35 @@ static const u32 *spi_nor_get_map_in_use(struct spi=
_nor *nor, const u32 *smpt)
                 * Configuration that is currently in use.
                 */
                map_id =3D map_id << 1 | !!(data_byte & read_data_mask);
+               map_id_is_valid =3D true;
                i =3D i + 2;
        }

-       /* Find the matching configuration map */
-       while (SMPT_MAP_ID(smpt[i]) !=3D map_id) {
-               if (smpt[i] & SMPT_DESC_END)
-                       goto out;
+       if (map_id_is_valid)
+               pr_info("%s:%i map_id=3D%d\n", __func__, __LINE__, map_id);
+       else
+               pr_info("%s:%i NO map_id\n", __func__, __LINE__);
+
+       for (nmaps =3D 0; nmaps< smpt_len; nmaps++) {
+               if(!(smpt[nmaps] & SMPT_DESC_TYPE_MAP))
+                       continue;
+
+               if(!map_id_is_valid) {
+                       if (nmaps) {
+                               ret =3D NULL;
+                               break;
+                       }
+
+                       ret =3D smpt+nmaps;
+               } else if (map_id =3D=3D SMPT_MAP_ID(smpt[nmaps])) {
+                       ret =3D smpt+nmaps;
+                       break;
+               }
+
                /* increment the table index to the next map */
-               i +=3D SMPT_MAP_REGION_COUNT(smpt[i]) + 1;
+               nmaps +=3D SMPT_MAP_REGION_COUNT(smpt[nmaps]) + 1;
        }

-       ret =3D smpt + i;
        /* fall through */
 out:
        nor->addr_width =3D addr_width;
@@ -3027,8 +3050,9 @@ static int spi_nor_parse_smpt(struct spi_nor *nor,
        for (i =3D 0; i < smpt_header->length; i++)
                smpt[i] =3D le32_to_cpu(smpt[i]);

-       sector_map =3D spi_nor_get_map_in_use(nor, smpt);
+       sector_map =3D spi_nor_get_map_in_use(nor, smpt, smpt_header->lengt=
h);
        if (!sector_map) {
+               pr_info("%s:%i\n", __func__, __LINE__);
                ret =3D -EINVAL;
                goto out;
        }
@@ -3139,6 +3167,17 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
                switch (SFDP_PARAM_HEADER_ID(param_header)) {
                case SFDP_SECTOR_MAP_ID:
                        err =3D spi_nor_parse_smpt(nor, param_header);
+                       if (err) {
+                               dev_warn(dev,
+                               "failed to parse SMPT (err =3D %d)\n",
+                               err);
+                               /*
+                                * SMPT parsing is optional, let's not drop
+                                * all information we extracted so far just
+                                * because it failed.
+                                */
+                               err =3D 0;
+                       }
                        break;

                default:
[1] http://www.cypress.com/documentation/datasheets/s25fs512s-512-mbit-18-v=
-serial-peripheral-interface-multi-io-non-volatile

--
Regards
Yogesh Gaur
[...]
