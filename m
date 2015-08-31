Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWXh0-00069s-H9
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 22:36:47 +0000
From: Marek Vasut <marex@denx.de>
To: Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash
 Controller.
Date: Tue, 1 Sep 2015 00:36:22 +0200
Cc: linux-mtd@lists.infradead.org, Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 "Vikas MANOCHA" <vikas.manocha@st.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 devicetree@vger.kernel.org
References: <1440148851-14621-1-git-send-email-marex@denx.de>
 <1440148851-14621-2-git-send-email-marex@denx.de>
 <55E48F3D.3030800@opensource.altera.com>
In-Reply-To: <55E48F3D.3030800@opensource.altera.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201509010036.22605.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, August 31, 2015 at 07:30:37 PM, Graham Moore wrote:
> Hi Marek,

Hi Graham,

> Having some compile issues...see below
>=20
> On 08/21/2015 04:20 AM, Marek Vasut wrote:
> > From: Graham Moore <grmoore@opensource.altera.com>
> >=20
> > Add support for the Cadence QSPI controller. This controller is
> > present in the Altera SoCFPGA SoCs and this driver has been tested
> > on the Cyclone V SoC.
> >=20
> > Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> > Signed-off-by: Marek Vasut <marex@denx.de>
>=20
> [...]
>=20
> > +static int cqspi_set_protocol(struct spi_nor *nor, enum spi_protocol
> > proto) +{
> > +	struct cqspi_flash_pdata *f_pdata =3D nor->priv;
> > +
> > +	switch (proto) {
> > +	case SPI_PROTO_1_1_1:
> > +	case SPI_PROTO_1_1_2:
> > +	case SPI_PROTO_1_1_4:
> > +	case SPI_PROTO_1_2_2:
> > +	case SPI_PROTO_1_4_4:
> > +		f_pdata->inst_width =3D CQSPI_INST_TYPE_SINGLE;
> > +		break;
> > +	case SPI_PROTO_2_2_2:
> > +		f_pdata->inst_width =3D CQSPI_INST_TYPE_DUAL;
> > +		break;
> > +	case SPI_PROTO_4_4_4:
> > +		f_pdata->inst_width =3D CQSPI_INST_TYPE_QUAD;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	switch (proto) {
> > +	case SPI_PROTO_1_1_1:
> > +	case SPI_PROTO_1_1_2:
> > +	case SPI_PROTO_1_1_4:
> > +		f_pdata->addr_width =3D CQSPI_INST_TYPE_SINGLE;
> > +		break;
> > +	case SPI_PROTO_1_2_2:
> > +	case SPI_PROTO_2_2_2:
> > +		f_pdata->addr_width =3D CQSPI_INST_TYPE_DUAL;
> > +		break;
> > +	case SPI_PROTO_1_4_4:
> > +	case SPI_PROTO_4_4_4:
> > +		f_pdata->addr_width =3D CQSPI_INST_TYPE_QUAD;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
>=20
> I think you have some other patches in your tree, the above doesn't
> compile on l2-mtd/master:
>=20
> ~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:701:57: warning: =E2=80=98=
enum
> spi_protocol=E2=80=99 declared inside parameter list [enabled by default]
> ~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:701:57: warning: its
> scope is only this definition or declaration, which is probably not what
> you want [enabled by default]
> ~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:701:70: error: parameter
> 2 (=E2=80=98proto=E2=80=99) has incomplete type

It's in the V7 changelog, you need:

mtd: spi-nor: notify (Q)SPI controller about protocol change

Also, since V8, you will need:

mtd: spi-nor: Decouple SPI NOR's device_node from controller device

They're both in the linux-mtd list, so feel free to pick them from there.
