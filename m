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
Date: Mon, 22 Oct 2018 11:46:55 +0000
Message-ID: <VI1PR04MB1038E072BFFD09C7C19AD2F899F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
References: <20180911154007.17195-1-tudor.ambarus@microchip.com>
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
 <VI1PR04MB1038E92FFAB03E07048FD8B499F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181022124627.2c6c3b93@bbrezillon>	<20181022125259.42df83ea@bbrezillon>
 <VI1PR04MB1038C9C889185F2A700220F299F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20181022134324.2c1bd248@bbrezillon>
In-Reply-To: <20181022134324.2c1bd248@bbrezillon>
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
> Sent: Monday, October 22, 2018 5:13 PM
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
> On Mon, 22 Oct 2018 11:03:09 +0000
> Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:
>=20
> > Hi,
> >
> > > -----Original Message-----
> > > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > > Sent: Monday, October 22, 2018 4:23 PM
> > > To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>;
> > > Cristian.Birsan@microchip.com
> > > Cc: Tudor Ambarus <tudor.ambarus@microchip.com>; richard@nod.at;
> > > Mark Brown <broonie@kernel.org>; linux-kernel@vger.kernel.org;
> > > nicolas.ferre@microchip.com; marek.vasut@gmail.com;
> > > cyrille.pitchen@microchip.com; linux-mtd@lists.infradead.org;
> > > Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>;
> > > computersforpeace@gmail.com; dwmw2@infradead.org;
> > > linux-arm-kernel@lists.infradead.org
> > > Subject: Re: [PATCH v3 1/2] mtd: spi-nor: add support to non-uniform
> > > SFDP SPI NOR flash memories
> > >
> > > On Mon, 22 Oct 2018 12:46:27 +0200
> > > Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> > >
> > > > On Mon, 22 Oct 2018 10:39:48 +0000 Yogesh Narayan Gaur
> > > > <yogeshnarayan.gaur@nxp.com> wrote:
> > > >
Patch used

--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2863,26 +2863,39 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_=
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

+       pr_info("Start [addr_width:%08x, read_dumy:%08x, read_opcode:%08x]\=
n", nor->addr_width, nor->read_dummy, nor->read_opcode);
+
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
+               if ((smpt[i] & SMPT_DESC_TYPE_MAP))
+                       break;
+
                read_data_mask =3D SMPT_CMD_READ_DATA(smpt[i]);
                nor->addr_width =3D spi_nor_smpt_addr_width(nor, smpt[i]);
-               nor->read_dummy =3D spi_nor_smpt_read_dummy(nor, smpt[i]);
+               if (!nor->addr_width)
+                       nor->addr_width =3D 3;
+
+               nor->read_dummy =3D 8; //spi_nor_smpt_read_dummy(nor, smpt[=
i]);
                nor->read_opcode =3D SMPT_CMD_OPCODE(smpt[i]);
+               pr_info("smpt[%d]=3D[addr_width:%08x, read_dumy:%08x, read_=
opcode:%08x]\n", i, nor->addr_width, nor->read_dummy, nor->read_opcode);
+
                addr =3D smpt[i + 1];

                err =3D spi_nor_read_raw(nor, addr, 1, &data_byte);
@@ -2894,18 +2907,37 @@ static const u32 *spi_nor_get_map_in_use(struct spi=
_nor *nor, const u32 *smpt)
                 * Configuration that is currently in use.
                 */
                map_id =3D map_id << 1 | !!(data_byte & read_data_mask);
-               i =3D i + 2;
+               map_id_is_valid =3D true;
        }

-       /* Find the matching configuration map */
-       while (SMPT_MAP_ID(smpt[i]) !=3D map_id) {
-               if (smpt[i] & SMPT_DESC_END)
-                       goto out;
+       if (map_id_is_valid)
+               pr_info("%s:%i map_id=3D%d smpt_len:%d i=3D:%d\n", __func__=
, __LINE__, map_id, smpt_len, i);
+       else
+               pr_info("%s:%i NO map_id\n", __func__, __LINE__);
+
+       for (nmaps =3D 0; i< smpt_len; nmaps++) {
+               if(!(smpt[i] & SMPT_DESC_TYPE_MAP)) {
+                       i +=3D 2;
+                       continue;
+               }
+
+               if(!map_id_is_valid) {
+                       if (nmaps) {
+                               ret =3D NULL;
+                               break;
+                       }
+
+                       ret =3D smpt+i;
+               } else if (map_id =3D=3D SMPT_MAP_ID(smpt[i])) {
+                       ret =3D smpt+i;
+                       break;
+               }
+
                /* increment the table index to the next map */
                i +=3D SMPT_MAP_REGION_COUNT(smpt[i]) + 1;
        }

-       ret =3D smpt + i;
+       pr_info("End [addr_width:%08x, read_dumy:%08x, read_opcode:%08x]\n"=
, nor->addr_width, nor->read_dummy, nor->read_opcode);
        /* fall through */
 out:
        nor->addr_width =3D addr_width;
@@ -3027,8 +3059,9 @@ static int spi_nor_parse_smpt(struct spi_nor *nor,
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
