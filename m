From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "frieder.schrempf@exceet.de"
 <frieder.schrempf@exceet.de>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RESEND v4 1/5] spi: spi-mem: Add driver for NXP FlexSPI
 controller
Date: Tue, 23 Oct 2018 09:12:52 +0000
Message-ID: <VI1PR04MB1038247D1A2B65268F76F8F099F50@VI1PR04MB1038.eurprd04.prod.outlook.com>
References: <1540284888-32307-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1540284888-32307-2-git-send-email-yogeshnarayan.gaur@nxp.com>
 <20181023110634.26ff2629@bbrezillon>
In-Reply-To: <20181023110634.26ff2629@bbrezillon>
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
> Sent: Tuesday, October 23, 2018 2:37 PM
> To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
> Cc: linux-mtd@lists.infradead.org; marek.vasut@gmail.com;
> broonie@kernel.org; linux-spi@vger.kernel.org; devicetree@vger.kernel.org=
;
> robh@kernel.org; mark.rutland@arm.com; shawnguo@kernel.org; linux-arm-
> kernel@lists.infradead.org; computersforpeace@gmail.com;
> frieder.schrempf@exceet.de; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH RESEND v4 1/5] spi: spi-mem: Add driver for NXP FlexS=
PI
> controller
>=20
> On Tue, 23 Oct 2018 08:56:46 +0000
> Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:
>=20
> > +struct nxp_fspi {
> > +	void __iomem *iobase;
> > +	void __iomem *ahb_addr;
> > +	u32 memmap_phy;
> > +	u32 memmap_phy_size;
> > +	struct clk *clk, *clk_en;
> > +	struct device *dev;
> > +	struct completion c;
> > +	const struct nxp_fspi_devtype_data *devtype_data;
> > +	struct mutex lock;
> > +	struct pm_qos_request pm_qos_req;
> > +	int selected;
> > +	void (*write)(u32 val, void __iomem *addr);
> > +	u32 (*read)(void __iomem *addr);
>=20
> I think I already commented on this aspect, and I keep thinking having a =
function
> pointer is overkill here.
> Just declare 2 functions and do the f->devtype_data->little_endian check =
in
> there:
>=20
> static u32 fspi_readl(struct nxp_fspi *f, void __iomem *addr) {
> 	if (f->devtype_data->little_endian)
> 		return ioread32(addr);
>=20
> 	return ioread32be(addr);
> }
>=20
> static void fspi_writel(struct nxp_fspi *f, u32 val, void __iomem *addr) =
{
> 	if (f->devtype_data->little_endian)
> 		iowrite32(val, addr);
>=20
> 	iowrite32be(val, addr);
> }

This, I have kept same as being done in spi-fsl-qspi.c driver file as Fried=
er have got the comment to remove the condition in read/write path and he h=
as introduced these hooks there.

Would remove in next version. Please review other changes and complete driv=
er file.

--
Regards
Yogesh Gaur
