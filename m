From: =?iso-2022-jp?B?QmVhbiBIdW8gGyRCcDlJTElMGyhCIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, "nicolas.ferre@atmel.com"
 <nicolas.ferre@atmel.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "zajec5@gmail.com" <zajec5@gmail.com>,
 "juhosg@openwrt.org" <juhosg@openwrt.org>, "marex@denx.de" <marex@denx.de>,
 "shijie.huang@intel.com" <shijie.huang@intel.com>, "ben@decadent.org.uk"
 <ben@decadent.org.uk>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk"
 <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org"
 <galak@codeaurora.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH linux-next v4 5/5] mtd: atmel-quadspi: add driver for
 Atmel QSPI controller
Date: Tue, 25 Aug 2015 01:44:57 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF47A26@NTXXIAMBX02.xacn.micron.com>
References: <cover.1440410236.git.cyrille.pitchen@atmel.com>
 <bf368fc101f38db231131b69eff0863210f2b01c.1440410236.git.cyrille.pitchen@atmel.com>
In-Reply-To: <bf368fc101f38db231131b69eff0863210f2b01c.1440410236.git.cyrille.pitchen@atmel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
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


>+	nor->read_reg =3D atmel_qspi_read_reg;
>+	nor->write_reg =3D atmel_qspi_write_reg;
>+	nor->read =3D atmel_qspi_read;
>+	nor->write =3D atmel_qspi_write;
>+	nor->erase =3D atmel_qspi_erase;
>+	nor->set_protocol =3D atmel_qspi_set_protocol;

This is very good, the structure of spi_nor should add a hook function to n=
otify spi controller=20
That spi nor transfer protocol already changed.

>+
>+	if (of_modalias_node(child, modalias, sizeof(modalias)) < 0) {
>+		err =3D -ENODEV;
>+		goto release_channel;
>+	}
>+
>+	err =3D of_property_read_u32(child, "spi-max-frequency", &aq->clk_rate);
>+	if (err < 0)
>+		goto release_channel;
>+
>+	err =3D atmel_qspi_init(aq);
>+	if (err)
>+		goto release_channel;
>+
>+	nor->dev->of_node =3D child;
>+	err =3D spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
>		goto release_channel;
>+


.......

>static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)  {
 	return mtd->priv;
>@@ -944,6 +960,11 @@ static int micron_quad_enable(struct spi_nor *nor)
>		return ret;
> 	}
>=20
>+	/* switch protocol to Quad CMD 4-4-4 */
>+	ret =3D spi_nor_set_protocol(nor, SPI_PROTO_4_4_4);
>+	if (ret)
>+		return ret;
>+

This make sense,from spi nor side,once its protocol being changed,
Mtd layer must notify this status to spi nor controller immediately,
And spi nor controller also should re-adjust its protocol.
Otherwise, following reading SR operation will fail.=20

>
> 	ret =3D spi_nor_wait_till_ready(nor);
> 	if (ret)
> 		return ret;

If my ack has any value in here, feel free to add it.

Acked-by: Bean Huo <beanhuo@micron.com>
