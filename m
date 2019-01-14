Received: from mail-am5eur03on0605.outbound.protection.outlook.com
 ([2a01:111:f400:fe08::605]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gixwD-000471-Sp
 for linux-mtd@lists.infradead.org; Mon, 14 Jan 2019 08:49:43 +0000
From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
CC: Vignesh R <vigneshr@ti.com>, Cyrille Pitchen
 <cyrille.pitchen@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Piotr Bugalski <bugalski.piotr@gmail.com>
Subject: RE: [PATCH v3 5/7] mtd: devices: m25p80: Use the spi-mem dirmap API
Date: Mon, 14 Jan 2019 08:49:35 +0000
Message-ID: <VI1PR04MB5726AF470280F23B40BC704199800@VI1PR04MB5726.eurprd04.prod.outlook.com>
References: <20181106160536.13415-1-boris.brezillon@bootlin.com>
 <20181106160536.13415-6-boris.brezillon@bootlin.com>
In-Reply-To: <20181106160536.13415-6-boris.brezillon@bootlin.com>
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

I have tested this patch on NXP FlexSPI controller having SPI-NOR flash MT3=
5x.
Added tested-by tag.

--
Regards
Yogesh Gaur.

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Tuesday, November 6, 2018 9:36 PM
> To: David Woodhouse <dwmw2@infradead.org>; Brian Norris
> <computersforpeace@gmail.com>; Boris Brezillon
> <boris.brezillon@bootlin.com>; Marek Vasut <marek.vasut@gmail.com>;
> Richard Weinberger <richard@nod.at>; linux-mtd@lists.infradead.org; Mark
> Brown <broonie@kernel.org>; linux-spi@vger.kernel.org
> Cc: Vignesh R <vigneshr@ti.com>; Cyrille Pitchen
> <cyrille.pitchen@microchip.com>; Tudor Ambarus
> <tudor.ambarus@microchip.com>; Yogesh Narayan Gaur
> <yogeshnarayan.gaur@nxp.com>; Frieder Schrempf
> <frieder.schrempf@exceet.de>; Miquel Raynal <miquel.raynal@bootlin.com>;
> Piotr Bugalski <bugalski.piotr@gmail.com>
> Subject: [PATCH v3 5/7] mtd: devices: m25p80: Use the spi-mem dirmap API
>=20
> Make use of the spi-mem direct mapping API to let advanced controllers
> optimize read/write operations when they support direct mapping.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>

> ---
> Changes in v3:
> - Make nor->read/write() functional before the direct mappings have been
>   created
> - Add Miquel's R-b
>=20
> Changes in v2:
> - Rename the dirmap fields
> - Return directly after calling dirmap_read/write() and let the spi-nor
>   framework call us again if those functions returned less than the
>   requested length
> ---
>  drivers/mtd/devices/m25p80.c | 102 +++++++++++++++++++++++++++++++++--
>  1 file changed, 99 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index c4a1d04b8c80..847188e8a99e 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -31,8 +31,70 @@
>  struct m25p {
>  	struct spi_mem		*spimem;
>  	struct spi_nor		spi_nor;
> +	struct {
> +		struct spi_mem_dirmap_desc *rdesc;
> +		struct spi_mem_dirmap_desc *wdesc;
> +	} dirmap;
>  };
>=20
> +static int m25p_create_write_dirmap(struct m25p *flash) {
> +	struct spi_nor *nor =3D &flash->spi_nor;
> +	struct spi_mem_dirmap_info info =3D {
> +		.op_tmpl =3D SPI_MEM_OP(SPI_MEM_OP_CMD(nor-
> >program_opcode, 1),
> +				      SPI_MEM_OP_ADDR(nor->addr_width, 0, 1),
> +				      SPI_MEM_OP_NO_DUMMY,
> +				      SPI_MEM_OP_DATA_OUT(0, NULL, 1)),
> +		.offset =3D 0,
> +		.length =3D flash->spi_nor.mtd.size,
> +	};
> +	struct spi_mem_op *op =3D &info.op_tmpl;
> +
> +	/* get transfer protocols. */
> +	op->cmd.buswidth =3D spi_nor_get_protocol_inst_nbits(nor-
> >write_proto);
> +	op->addr.buswidth =3D spi_nor_get_protocol_addr_nbits(nor-
> >write_proto);
> +	op->dummy.buswidth =3D op->addr.buswidth;
> +	op->data.buswidth =3D spi_nor_get_protocol_data_nbits(nor-
> >write_proto);
> +
> +	if (nor->program_opcode =3D=3D SPINOR_OP_AAI_WP && nor-
> >sst_write_second)
> +		op->addr.nbytes =3D 0;
> +
> +	flash->dirmap.wdesc =3D spi_mem_dirmap_create(flash->spimem, &info);
> +	if (IS_ERR(flash->dirmap.wdesc))
> +		return PTR_ERR(flash->dirmap.wdesc);
> +
> +	return 0;
> +}
> +
> +static int m25p_create_read_dirmap(struct m25p *flash) {
> +	struct spi_nor *nor =3D &flash->spi_nor;
> +	struct spi_mem_dirmap_info info =3D {
> +		.op_tmpl =3D SPI_MEM_OP(SPI_MEM_OP_CMD(nor-
> >read_opcode, 1),
> +				      SPI_MEM_OP_ADDR(nor->addr_width, 0, 1),
> +				      SPI_MEM_OP_DUMMY(nor->read_dummy,
> 1),
> +				      SPI_MEM_OP_DATA_IN(0, NULL, 1)),
> +		.offset =3D 0,
> +		.length =3D flash->spi_nor.mtd.size,
> +	};
> +	struct spi_mem_op *op =3D &info.op_tmpl;
> +
> +	/* get transfer protocols. */
> +	op->cmd.buswidth =3D spi_nor_get_protocol_inst_nbits(nor->read_proto);
> +	op->addr.buswidth =3D spi_nor_get_protocol_addr_nbits(nor-
> >read_proto);
> +	op->dummy.buswidth =3D op->addr.buswidth;
> +	op->data.buswidth =3D spi_nor_get_protocol_data_nbits(nor-
> >read_proto);
> +
> +	/* convert the dummy cycles to the number of bytes */
> +	op->dummy.nbytes =3D (nor->read_dummy * op->dummy.buswidth) / 8;
> +
> +	flash->dirmap.rdesc =3D spi_mem_dirmap_create(flash->spimem, &info);
> +	if (IS_ERR(flash->dirmap.rdesc))
> +		return PTR_ERR(flash->dirmap.rdesc);
> +
> +	return 0;
> +}
> +
>  static int m25p80_read_reg(struct spi_nor *nor, u8 code, u8 *val, int le=
n)  {
>  	struct m25p *flash =3D nor->priv;
> @@ -92,6 +154,9 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_=
t to,
> size_t len,
>  				   SPI_MEM_OP_DATA_OUT(len, buf, 1));
>  	int ret;
>=20
> +	if (flash->dirmap.wdesc)
> +		return spi_mem_dirmap_write(flash->dirmap.wdesc, to, len,
> buf);
> +
>  	/* get transfer protocols. */
>  	op.cmd.buswidth =3D spi_nor_get_protocol_inst_nbits(nor->write_proto);
>  	op.addr.buswidth =3D spi_nor_get_protocol_addr_nbits(nor->write_proto);
> @@ -128,6 +193,9 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_=
t
> from, size_t len,
>  	size_t remaining =3D len;
>  	int ret;
>=20
> +	if (flash->dirmap.rdesc)
> +		return spi_mem_dirmap_read(flash->dirmap.rdesc, from, len,
> buf);
> +
>  	/* get transfer protocols. */
>  	op.cmd.buswidth =3D spi_nor_get_protocol_inst_nbits(nor->read_proto);
>  	op.addr.buswidth =3D spi_nor_get_protocol_addr_nbits(nor->read_proto);
> @@ -231,19 +299,47 @@ static int m25p_probe(struct spi_mem *spimem)
>  	if (ret)
>  		return ret;
>=20
> -	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
> -				   data ? data->nr_parts : 0);
> +	ret =3D m25p_create_write_dirmap(flash);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D m25p_create_read_dirmap(flash);
> +	if (ret)
> +		goto err_destroy_write_dirmap;
> +
> +	ret =3D mtd_device_register(&nor->mtd, data ? data->parts : NULL,
> +				  data ? data->nr_parts : 0);
> +	if (ret)
> +		goto err_destroy_read_dirmap;
> +
> +	return 0;
> +
> +err_destroy_read_dirmap:
> +	spi_mem_dirmap_destroy(flash->dirmap.rdesc);
> +
> +err_destroy_write_dirmap:
> +	spi_mem_dirmap_destroy(flash->dirmap.wdesc);
> +
> +	return ret;
>  }
>=20
>=20
>  static int m25p_remove(struct spi_mem *spimem)  {
>  	struct m25p	*flash =3D spi_mem_get_drvdata(spimem);
> +	int ret;
>=20
>  	spi_nor_restore(&flash->spi_nor);
>=20
>  	/* Clean up MTD stuff. */
> -	return mtd_device_unregister(&flash->spi_nor.mtd);
> +	ret =3D mtd_device_unregister(&flash->spi_nor.mtd);
> +	if (ret)
> +		return ret;
> +
> +	spi_mem_dirmap_destroy(flash->dirmap.rdesc);
> +	spi_mem_dirmap_destroy(flash->dirmap.wdesc);
> +
> +	return 0;
>  }
>=20
>  static void m25p_shutdown(struct spi_mem *spimem)
> --
> 2.17.1
