From: Alison Wang <alison.wang@nxp.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Alison Wang
 <b18965@freescale.com>
CC: "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Subject: RE: [PATCH v3 1/2] mtd: ifc: Update dependency of IFC for LS1021A
Date: Mon, 13 Feb 2017 07:39:41 +0000
Message-ID: <DB6PR0401MB258411171005499F70EAE505F4590@DB6PR0401MB2584.eurprd04.prod.outlook.com>
References: <1486968416-13536-1-git-send-email-b18965@freescale.com>
 <20170213083401.5adf8c31@bbrezillon>
In-Reply-To: <20170213083401.5adf8c31@bbrezillon>
Content-Language: zh-CN
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

Hi, Boris,

	Sorry, I forgot to change them. Should I resend them or you help to fix th=
at when applying?


Best Regards,
Alison Wang

>=20
> Hi Alison,
>=20
> The subject prefix is still wrong, should be 'memory: ifc: '.
>=20
> On Mon, 13 Feb 2017 14:46:55 +0800
> Alison Wang <b18965@freescale.com> wrote:
>=20
> > As Freescale/NXP IFC controller is available on LS1021A, the
> > dependency for LS1021A is added.
> >
> > LS1021A is an earlier product and is not compatible with later
> > LayerScape architecture. So ARCH_LAYERSCAPE can't cover LS1021A.
> >
> > Signed-off-by: Alison Wang <alison.wang@nxp.com>
> > ---
> > Changes in v3:
> > - Update the commit message.
> >
> > Changes in v2:
> > - New patch
> >
> >  drivers/memory/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig index
> > ec80e35..fff8345 100644
> > --- a/drivers/memory/Kconfig
> > +++ b/drivers/memory/Kconfig
> > @@ -115,7 +115,7 @@ config FSL_CORENET_CF
> >
> >  config FSL_IFC
> >  	bool
> > -	depends on FSL_SOC || ARCH_LAYERSCAPE
> > +	depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A
> >
> >  config JZ4780_NEMC
> >  	bool "Ingenic JZ4780 SoC NEMC driver"
