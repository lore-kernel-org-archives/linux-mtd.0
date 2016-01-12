Received: from mail-db3on0091.outbound.protection.outlook.com ([157.55.234.91]
 helo=emea01-db3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aIqGw-0002UY-2x
 for linux-mtd@lists.infradead.org; Tue, 12 Jan 2016 04:09:31 +0000
From: Yao Yuan <yao.yuan@nxp.com>
To: Han Xu <han.xu@freescale.com>, Yuan Yao <yao.yuan@freescale.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v2 4/4] mtd: spi-nor: fsl-quadspi: extend support for some
 special requerment.
Date: Tue, 12 Jan 2016 04:09:04 +0000
Message-ID: <AM2PR04MB07229FADBBF527A93CC5410489CA0@AM2PR04MB0722.eurprd04.prod.outlook.com>
References: <1450954821-7483-1-git-send-email-yao.yuan@freescale.com>
 <1450954821-7483-4-git-send-email-yao.yuan@freescale.com>
 <20160104210223.GB27554@chopperman.am.freescale.net>
In-Reply-To: <20160104210223.GB27554@chopperman.am.freescale.net>
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

On Tue, Jan 05, 2016 at 05:02:34AM +0800, Han Xu wrote:
> On Thu, Dec 24, 2015 at 07:00:21PM +0800, Yuan Yao wrote:
> > Add extra info in LUT table to support some special requerments.
> > Spansion S25FS-S family flash need some special operations.
>=20
> What's the special requirement, detail it.

Ok, we will detail it in next version.

>=20
> >
> > Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> > ---
> > Changed in v2:
> > Update my email to <yao.yuan@nxp.com>
> > ---
> >  drivers/mtd/spi-nor/fsl-quadspi.c | 41
> +++++++++++++++++++++++++++++++++++++--
> >  include/linux/mtd/spi-nor.h       |  4 ++++
> >  2 files changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c
> > b/drivers/mtd/spi-nor/fsl-quadspi.c
> > index 9ab2b51..081ae85 100644
> > --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> > +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> > @@ -205,6 +205,8 @@
> > @@ -848,9 +881,13 @@ static int fsl_qspi_write_reg(struct spi_nor
> > *nor, u8 opcode, u8 *buf, int len)  {
> >  	struct fsl_qspi *q =3D nor->priv;
> >  	int ret;
> > +	u32 to =3D 0;
> > +
> > +	if (opcode =3D=3D SPINOR_OP_SPANSION_RDAR)
> > +		memcpy(&to, nor->cmd_buf, 4);
>=20
> RADR or WRAR? This is hacking code, why need these two commands?
=20
Sorry, it's should be WRAR.
The command RADR is necessary for Spansion S25FS-S family flash. But the WR=
AR we didn't use this command now. But it seems we should use it in the fut=
ure. So we add this command.=20

Hi Xu Han, David Woodhouse, Brian Norris

By the way, there are some patches depend on this patch for QSPI Spansion S=
25FS-S family flash support on ARMv8 platform.
in order to the completeness of the patch sets. I want to just send the pat=
ch set for QSPI LS1021A and LS1043A SOC support.
Include: mtd-spi-nor-fsl-quadspi-add-big-endian-support.patch mtd-spi-nor-f=
sl-quadspi-add-support-for-ls1021a.patch
Those patches add the QSPI support on LS1021A and LS1043A SOC.

And another patch set will send to support Spansion S25FS-S family flash.
Include: mtd-spi-nor-fsl-quadspi-add-support-for-layerscape.patch mtd-spi-n=
or-fsl-quadspi-extend-support-for-some-spec.patch
And some other patches.
Those patches will add the QSPI Spansion S25FS-S family flash support. This=
 is used for NXP LS2080A SOC.

Is that OK?

Thanks.
Best Regards,
Yuan Yao
