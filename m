Received: from mail-am5eur02on0709.outbound.protection.outlook.com
 ([2a01:111:f400:fe07::709]
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFjIW-0005aJ-L4
 for linux-mtd@lists.infradead.org; Mon, 07 May 2018 16:47:39 +0000
From: "Wan, Jane (Nokia - US/Sunnyvale)" <jane.wan@nokia.com>
To: "Boris.Brezillon@bootlin.com" <Boris.Brezillon@bootlin.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
CC: "kbuild-all@01.org" <kbuild-all@01.org>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "prabhakar.kushwaha@nxp.com" <prabhakar.kushwaha@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "jagdish.gediya@nxp.com"
 <jagdish.gediya@nxp.com>, "shreeya.patel23498@gmail.com"
 <shreeya.patel23498@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Bos, Ties (Nokia - US/Sunnyvale)"
 <ties.bos@nokia.com>
Subject: RE: [PATCH v2 2/2] mtd: rawnand: fsl_ifc: use bit-wise majority to
 recover the contents of ONFI parameter
Date: Mon, 7 May 2018 16:47:18 +0000
Message-ID: <VI1PR07MB161552E71A13EAE0318008D7819B0@VI1PR07MB1615.eurprd07.prod.outlook.com>
References: <1525464493-5006-2-git-send-email-Jane.Wan@nokia.com>
 <201805051646.R4HISEmo%fengguang.wu@intel.com>
In-Reply-To: <201805051646.R4HISEmo%fengguang.wu@intel.com>
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

I've sent v3 of this patch through git send-email.  Please also see the inl=
ine answer.

Thanks.
Jane

> -----Original Message-----
> From: kbuild test robot [mailto:lkp@intel.com]
> Sent: Saturday, May 05, 2018 1:59 AM
> To: Wan, Jane (Nokia - US/Sunnyvale) <jane.wan@nokia.com>
> Cc: kbuild-all@01.org; Boris.Brezillon@bootlin.com;
> miquel.raynal@bootlin.com; dwmw2@infradead.org;
> computersforpeace@gmail.com; richard@nod.at; marek.vasut@gmail.com;
> yamada.masahiro@socionext.com; prabhakar.kushwaha@nxp.com;
> shawnguo@kernel.org; jagdish.gediya@nxp.com;
> shreeya.patel23498@gmail.com; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; Bos, Ties (Nokia - US/Sunnyvale)
> <ties.bos@nokia.com>; Wan, Jane (Nokia - US/Sunnyvale)
> <jane.wan@nokia.com>
> Subject: Re: [PATCH v2 2/2] mtd: rawnand: fsl_ifc: use bit-wise majority =
to
> recover the contents of ONFI parameter
>=20
> Hi Jane,
>=20
> Thank you for the patch! Perhaps something to improve:
>=20
> [auto build test WARNING on mtd/nand/next] [also build test WARNING on
> v4.17-rc3 next-20180504] [if your patch is applied to the wrong git tree,=
 please
> drop us a note to help improve the system]
>=20
> url:    https://github.com/0day-ci/linux/commits/Jane-Wan/mtd-rawnand-
> fsl_ifc-fix-FSL-NAND-driver-to-read-all-ONFI-parameter-pages/20180505-
> 163132
> base:   git://git.infradead.org/linux-mtd.git nand/next
> config: x86_64-randconfig-x015-201817 (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-16) 7.3.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64
>=20
> Note: it may well be a FALSE warning. FWIW you are at least aware of it n=
ow.
> http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings
>=20
> All warnings (new ones prefixed by >>):
>=20
>    drivers/mtd/nand/raw/nand_base.c: In function 'nand_scan_ident':
> >> drivers/mtd/nand/raw/nand_base.c:5247:2: warning: 'p' may be used
> >> uninitialized in this function [-Wmaybe-uninitialized]
>      kfree(p);
>      ^~~~~~~~
>    drivers/mtd/nand/raw/nand_base.c:5097:27: note: 'p' was declared here
>      struct nand_onfi_params *p;
>                               ^

 [Jane] the kfree() is fixed in v3 patch.  Thanks.
=20
>=20
> vim +/p +5247 drivers/mtd/nand/raw/nand_base.c
>=20
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
090
> d1e1f4e42 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-08-30  5=
091
> /*
> 8b6e50c9e drivers/mtd/nand/nand_base.c     Brian Norris     2011-05-25  5=
092   *
> Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise=
.
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
093
> */
> 29a198a15 drivers/mtd/nand/nand_base.c     Boris Brezillon  2016-05-24  5=
094
> static int nand_flash_detect_onfi(struct nand_chip *chip)
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
095  {
> cbe435a18 drivers/mtd/nand/nand_base.c     Boris Brezillon  2016-05-24  5=
096
> 	struct mtd_info *mtd =3D nand_to_mtd(chip);
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5097  	struct nand_onfi_params *p;
> 97d90da8a drivers/mtd/nand/nand_base.c     Boris Brezillon  2017-11-30  5=
098
> 	char id[4];
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
099
> 	int i, ret, val, pagesize;
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
100
> 	u8 *buf;
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
101
> 7854d3f74 drivers/mtd/nand/nand_base.c     Brian Norris     2011-06-23  5=
102
> 	/* Try ONFI for unknown chip or LP */
> 97d90da8a drivers/mtd/nand/nand_base.c     Boris Brezillon  2017-11-30  5=
103
> 	ret =3D nand_readid_op(chip, 0x20, id, sizeof(id));
> 97d90da8a drivers/mtd/nand/nand_base.c     Boris Brezillon  2017-11-30  5=
104
> 	if (ret || strncmp(id, "ONFI", 4))
> 97d90da8a drivers/mtd/nand/nand_base.c     Boris Brezillon  2017-11-30  5=
105
> 		return 0;
> 97d90da8a drivers/mtd/nand/nand_base.c     Boris Brezillon  2017-11-30  5=
106
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5107  	/* ONFI chip: allocate a buffer to hold its parameter page */
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
108
> 	pagesize =3D sizeof(*p);
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
109
> 	buf =3D kzalloc((pagesize * 3), GFP_KERNEL);
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
110
> 	if (!buf)
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5111  		return -ENOMEM;
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5112
> 97d90da8a drivers/mtd/nand/nand_base.c     Boris Brezillon  2017-11-30  5=
113
> 	ret =3D nand_read_param_page_op(chip, 0, NULL, 0);
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5114  	if (ret) {
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5115  		ret =3D 0;
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5116  		goto free_onfi_param_page;
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5117  	}
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
118
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
119
> 	for (i =3D 0; i < 3; i++) {
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
120
> 		p =3D (struct nand_onfi_params *)&buf[i*pagesize];
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
121
> 		ret =3D nand_read_data_op(chip, p, pagesize, true);
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5122  		if (ret) {
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5123  			ret =3D 0;
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5124  			goto free_onfi_param_page;
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5125  		}
> 97d90da8a drivers/mtd/nand/nand_base.c     Boris Brezillon  2017-11-30  5=
126
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
127
> 		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) =3D=3D
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
128
> 				le16_to_cpu(p->crc)) {
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
129
> 			break;
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
130
> 		}
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
131
> 	}
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
132
> c7f23a706 drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-13  5=
133
> 	if (i =3D=3D 3) {
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
134
> 		int j, k, l;
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
135
> 		u8 v, m;
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
136
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
137
> 		pr_err("Could not find valid ONFI parameter page\n");
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
138
> 		pr_info("Recover ONFI params with bit-wise majority\n");
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
139
> 		for (j =3D 0; j < pagesize; j++) {
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
140
> 			v =3D 0;
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
141
> 			for (k =3D 0; k < 8; k++) {
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
142
> 				m =3D 0;
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
143
> 				for (l =3D 0; l < 3; l++)
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
144
> 					m +=3D GET_BIT(k, buf[l*pagesize + j]);
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
145
> 				if (m > 1)
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
146
> 					v |=3D BIT(k);
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
147
> 			}
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
148
> 			((u8 *)p)[j] =3D v;
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
149
> 		}
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
150
> 		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) !=3D
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
151
> 				le16_to_cpu(p->crc)) {
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
152
> 			pr_err("ONFI parameter recovery failed, aborting\n");
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5153  			goto free_onfi_param_page;
> c7f23a706 drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-13  5=
154
> 		}
> 2c5f4f892 drivers/mtd/nand/raw/nand_base.c Jane Wan         2018-05-04  5=
155
> 	}
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
156
> 8b6e50c9e drivers/mtd/nand/nand_base.c     Brian Norris     2011-05-25  5=
157
> 	/* Check version */
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
158
> 	val =3D le16_to_cpu(p->revision);
> b7b1a29d9 drivers/mtd/nand/nand_base.c     Brian Norris     2010-12-12  5=
159
> 	if (val & (1 << 5))
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5160  		chip->parameters.onfi.version =3D 23;
> b7b1a29d9 drivers/mtd/nand/nand_base.c     Brian Norris     2010-12-12  5=
161
> 	else if (val & (1 << 4))
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5162  		chip->parameters.onfi.version =3D 22;
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
163
> 	else if (val & (1 << 3))
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5164  		chip->parameters.onfi.version =3D 21;
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
165
> 	else if (val & (1 << 2))
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5166  		chip->parameters.onfi.version =3D 20;
> b7b1a29d9 drivers/mtd/nand/nand_base.c     Brian Norris     2010-12-12  5=
167
> 	else if (val & (1 << 1))
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5168  		chip->parameters.onfi.version =3D 10;
> b7b1a29d9 drivers/mtd/nand/nand_base.c     Brian Norris     2010-12-12  5=
169
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5170  	if (!chip->parameters.onfi.version) {
> 20171642e drivers/mtd/nand/nand_base.c     Ezequiel Garcia  2013-11-25  5=
171
> 		pr_info("unsupported ONFI version: %d\n", val);
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5172  		goto free_onfi_param_page;
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5173  	} else {
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5174  		ret =3D 1;
> b7b1a29d9 drivers/mtd/nand/nand_base.c     Brian Norris     2010-12-12  5=
175
> 	}
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
176
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
177
> 	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
178
> 	sanitize_string(p->model, sizeof(p->model));
> f4531b2b1 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5179  	strncpy(chip->parameters.model, p->model,
> f4531b2b1 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5180  		sizeof(chip->parameters.model) - 1);
> 4355b70cf drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-27  5=
181
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
182
> 	mtd->writesize =3D le32_to_cpu(p->byte_per_page);
> 4355b70cf drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-27  5=
183
> 4355b70cf drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-27  5=
184
> 	/*
> 4355b70cf drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-27  5=
185
> 	 * pages_per_block and blocks_per_lun may not be a power-of-2 size
> 4355b70cf drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-27  5=
186
> 	 * (don't ask me who thought of this...). MTD assumes that these
> 4355b70cf drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-27  5=
187
> 	 * dimensions will be power-of-2, so just truncate the remaining area.
> 4355b70cf drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-27  5=
188
> 	 */
> 4355b70cf drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-27  5=
189
> 	mtd->erasesize =3D 1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
> 4355b70cf drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-27  5=
190
> 	mtd->erasesize *=3D mtd->writesize;
> 4355b70cf drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-27  5=
191
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
192
> 	mtd->oobsize =3D le16_to_cpu(p->spare_bytes_per_page);
> 4355b70cf drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-27  5=
193
> 4355b70cf drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-27  5=
194
> 	/* See erasesize comment */
> 4355b70cf drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-27  5=
195
> 	chip->chipsize =3D 1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
> 637957551 drivers/mtd/nand/nand_base.c     Matthieu CASTET  2012-03-19
> 5196  	chip->chipsize *=3D (uint64_t)mtd->erasesize * p->lun_count;
> 13fbd1794 drivers/mtd/nand/nand_base.c     Huang Shijie     2013-09-25  5=
197
> 	chip->bits_per_cell =3D p->bits_per_cell;
> e2985fc1d drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-17  5=
198
> 34da5f5f3 drivers/mtd/nand/nand_base.c     Zach Brown       2017-01-10  5=
199
> 	chip->max_bb_per_die =3D le16_to_cpu(p->bb_per_lun);
> 34da5f5f3 drivers/mtd/nand/nand_base.c     Zach Brown       2017-01-10  5=
200
> 	chip->blocks_per_die =3D le32_to_cpu(p->blocks_per_lun);
> 34da5f5f3 drivers/mtd/nand/nand_base.c     Zach Brown       2017-01-10  5=
201
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5202  	if (le16_to_cpu(p->features) & ONFI_FEATURE_16_BIT_BUS)
> 29a198a15 drivers/mtd/nand/nand_base.c     Boris Brezillon  2016-05-24  5=
203
> 		chip->options |=3D NAND_BUSWIDTH_16;
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
204
> 10c86babf drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-17  5=
205
> 	if (p->ecc_bits !=3D 0xff) {
> 10c86babf drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-17  5=
206
> 		chip->ecc_strength_ds =3D p->ecc_bits;
> 10c86babf drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-17  5=
207
> 		chip->ecc_step_ds =3D 512;
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5208  	} else if (chip->parameters.onfi.version >=3D 21 &&
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5209  		(le16_to_cpu(p->features) &
> ONFI_FEATURE_EXT_PARAM_PAGE)) {
> 6dcbe0cdd drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-22  5=
210
> 6dcbe0cdd drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-22  5=
211
> 		/*
> 6dcbe0cdd drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-22  5=
212
> 		 * The nand_flash_detect_ext_param_page() uses the
> 6dcbe0cdd drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-22  5=
213
> 		 * Change Read Column command which maybe not supported
> 6dcbe0cdd drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-22  5=
214
> 		 * by the chip->cmdfunc. So try to update the chip->cmdfunc
> 6dcbe0cdd drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-22  5=
215
> 		 * now. We do not replace user supplied command function.
> 6dcbe0cdd drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-22  5=
216
> 		 */
> 6dcbe0cdd drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-22  5=
217
> 		if (mtd->writesize > 512 && chip->cmdfunc =3D=3D nand_command)
> 6dcbe0cdd drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-22  5=
218
> 			chip->cmdfunc =3D nand_command_lp;
> 6dcbe0cdd drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-22  5=
219
> 6dcbe0cdd drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-22  5=
220
> 		/* The Extended Parameter Page is supported since ONFI 2.1. */
> cbe435a18 drivers/mtd/nand/nand_base.c     Boris Brezillon  2016-05-24  5=
221
> 		if (nand_flash_detect_ext_param_page(chip, p))
> c7f23a706 drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-13  5=
222
> 			pr_warn("Failed to detect ONFI extended param
> page\n");
> c7f23a706 drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-13  5=
223
> 	} else {
> c7f23a706 drivers/mtd/nand/nand_base.c     Brian Norris     2013-08-13  5=
224
> 		pr_warn("Could not retrieve ONFI ECC requirements\n");
> 10c86babf drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-17  5=
225
> 	}
> 10c86babf drivers/mtd/nand/nand_base.c     Huang Shijie     2013-05-17  5=
226
> f4531b2b1 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5227  	/* Save some parameters from the parameter page for future use */
> 789157e41 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5228  	if (le16_to_cpu(p->opt_cmd) & ONFI_OPT_CMD_SET_GET_FEATURES) {
> f4531b2b1 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5229  		chip->parameters.supports_set_get_features =3D true;
> 789157e41 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5230  		bitmap_set(chip->parameters.get_feature_list,
> 789157e41 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5231  			   ONFI_FEATURE_ADDR_TIMING_MODE, 1);
> 789157e41 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5232  		bitmap_set(chip->parameters.set_feature_list,
> 789157e41 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5233  			   ONFI_FEATURE_ADDR_TIMING_MODE, 1);
> 789157e41 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5234  	}
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5235  	chip->parameters.onfi.tPROG =3D le16_to_cpu(p->t_prog);
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5236  	chip->parameters.onfi.tBERS =3D le16_to_cpu(p->t_bers);
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5237  	chip->parameters.onfi.tR =3D le16_to_cpu(p->t_r);
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5238  	chip->parameters.onfi.tCCS =3D le16_to_cpu(p->t_ccs);
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5239  	chip->parameters.onfi.async_timing_mode =3D
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5240  		le16_to_cpu(p->async_timing_mode);
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5241  	chip->parameters.onfi.vendor_revision =3D
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5242  		le16_to_cpu(p->vendor_revision);
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5243  	memcpy(chip->parameters.onfi.vendor, p->vendor,
> a97421c75 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5244  	       sizeof(p->vendor));
> f4531b2b1 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5245
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5246  free_onfi_param_page:
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> @5247  	kfree(p);
> bd0b64340 drivers/mtd/nand/raw/nand_base.c Miquel Raynal    2018-03-19
> 5248  	return ret;
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
249  }
> 6fb277ba8 drivers/mtd/nand/nand_base.c     Florian Fainelli 2010-09-01  5=
250
>=20
> :::::: The code at line 5247 was first introduced by commit
> :::::: bd0b64340c2d66c0fe1aa99b0b23159d7e0c21f2 mtd: rawnand: get rid of
> the ONFI parameter page in nand_chip
>=20
> :::::: TO: Miquel Raynal <miquel.raynal@bootlin.com>
> :::::: CC: Boris Brezillon <boris.brezillon@bootlin.com>
>=20
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/kbuild-all                   Intel Corpora=
tion
