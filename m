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
Subject: RE: [PATCH v2 1/2] mtd: ifc: Update dependency of IFC for LS1021A
Date: Tue, 3 Jan 2017 09:19:22 +0000
Message-ID: <DB6PR0401MB2584447FAAD7E79FC0A87977F46E0@DB6PR0401MB2584.eurprd04.prod.outlook.com>
References: <1483411266-45875-1-git-send-email-b18965@freescale.com>
 <20170103100439.6e7360c6@bbrezillon>
In-Reply-To: <20170103100439.6e7360c6@bbrezillon>
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

Ok, I see. Thanks.


Best Regards,
Alison Wang

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> Sent: Tuesday, January 03, 2017 5:05 PM
> To: Alison Wang <b18965@freescale.com>
> Cc: marek.vasut@gmail.com; cyrille.pitchen@atmel.com; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> mtd@lists.infradead.org; dwmw2@infradead.org;
> computersforpeace@gmail.com; Alison Wang <alison.wang@nxp.com>
> Subject: Re: [PATCH v2 1/2] mtd: ifc: Update dependency of IFC for
> LS1021A
>=20
> Hi Alison,
>=20
> The subject prefix should be "memory: " and not "mtd: ifc: ".
>=20
> Looks good otherwise.
>=20
> No need to resend, I can fix that when applying.
>=20
> Regards,
>=20
> Boris
>=20
> On Tue, 3 Jan 2017 10:41:05 +0800
> Alison Wang <b18965@freescale.com> wrote:
>=20
> > As Freescale/NXP IFC controller is available on LS1021A, the
> > dependency for LS1021A is added.
> >
> > Signed-off-by: Alison Wang <alison.wang@nxp.com>
> > ---
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
