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
Date: Mon, 22 Oct 2018 10:03:55 +0000
Message-ID: <VI1PR04MB1038EF892921194D1BFDE6FC99F40@VI1PR04MB1038.eurprd04.prod.outlook.com>
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
In-Reply-To: <20181022111543.2a607efc@bbrezillon>
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
> Sent: Monday, October 22, 2018 2:46 PM
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
> On Mon, 22 Oct 2018 06:04:13 +0000
> Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:
>=20
>=20
With below patch, it gets stuck in for loop of "+       for (nmaps =3D 0; i=
< smpt_len; nmaps++) {".

[    1.624684] m25p80 spi0.0: found s25fl512s, expected m25p80
[    1.630377] Start [addr_width:00000000, read_dumy:08, read_opcode:000000=
00]
[    1.637335] spi_nor_get_map_in_use:2882 smpt[0]=3D08ff65fc
[    1.642641] spi_nor_get_map_in_use:2882 smpt[1]=3D00000004
[    1.647945] spi_nor_get_map_in_use:2882 smpt[2]=3D04ff65fc
[    1.653248] spi_nor_get_map_in_use:2882 smpt[3]=3D00000002
[    1.658551] spi_nor_get_map_in_use:2882 smpt[4]=3D02ff65fd
[    1.663855] spi_nor_get_map_in_use:2882 smpt[5]=3D00000004
[    1.669158] spi_nor_get_map_in_use:2882 smpt[6]=3Dff0201fe
[    1.674461] spi_nor_get_map_in_use:2882 smpt[7]=3D00007ff1
[    1.679766] spi_nor_get_map_in_use:2882 smpt[8]=3D00037ff4
[    1.685070] spi_nor_get_map_in_use:2882 smpt[9]=3D03fbfff4
[    1.690375] spi_nor_get_map_in_use:2882 smpt[10]=3Dff0203fe
[    1.695768] spi_nor_get_map_in_use:2882 smpt[11]=3D03fbfff4
[    1.701158] spi_nor_get_map_in_use:2882 smpt[12]=3D00037ff4
[    1.706550] spi_nor_get_map_in_use:2882 smpt[13]=3D00007ff1
[    1.711940] spi_nor_get_map_in_use:2882 smpt[14]=3Dff0005ff
[    1.717330] spi_nor_get_map_in_use:2882 smpt[15]=3D03fffff4
[    1.722720] smpt[0]=3D[addr_width:00000000, read_dumy:08, read_opcode:00=
000065]
[    1.729861] spi_nor_get_map_in_use:2912 map_id=3D1


--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2863,26 +2863,36 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_=
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

+       pr_info("Start [addr_width:%08x, read_dumy:%0x8, read_opcode:%08x]\=
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
                nor->read_dummy =3D spi_nor_smpt_read_dummy(nor, smpt[i]);
                nor->read_opcode =3D SMPT_CMD_OPCODE(smpt[i]);
+               pr_info("smpt[%d]=3D[addr_width:%08x, read_dumy:%0x8, read_=
opcode:%08x]\n", i, nor->addr_width, nor->read_dummy, nor->read_opcode);
+
                addr =3D smpt[i + 1];

                err =3D spi_nor_read_raw(nor, addr, 1, &data_byte);
@@ -2894,18 +2904,36 @@ static const u32 *spi_nor_get_map_in_use(struct spi=
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
+       for (nmaps =3D 0; i< smpt_len; nmaps++) {
+               if((smpt[i] & SMPT_DESC_TYPE_MAP))
+                       continue;
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
+       pr_info("End [addr_width:%08x, read_dumy:%0x8, read_opcode:%08x]\n"=
, nor->addr_width, nor->read_dummy, nor->read_opcode);
        /* fall through */
 out:
        nor->addr_width =3D addr_width;
