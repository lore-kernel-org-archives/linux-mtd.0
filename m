Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fc8xl-0007nc-Q3
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 12:38:51 +0000
Date: Sun, 8 Jul 2018 14:38:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "mmayer@broadcom.com" <mmayer@broadcom.com>, "rogerq@ti.com"
 <rogerq@ti.com>, "ladis@linux-mips.org" <ladis@linux-mips.org>,
 "ada@thorsis.com" <ada@thorsis.com>, "honghui.zhang@mediatek.com"
 <honghui.zhang@mediatek.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nagasureshkumarrelli@gmail.com"
 <nagasureshkumarrelli@gmail.com>, Michal Simek <michals@xilinx.com>
Subject: Re: [[LINUX PATCH v10] 4/4] mtd: rawnand: pl353: Add basic driver
 for arm pl353 smc nand interface
Message-ID: <20180708143836.3eb4af31@xps13>
In-Reply-To: <MWHPR02MB262302F2D504A4783CF60832AF420@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1529563351-2241-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1529563351-2241-5-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180627172249.72f878a2@xps13>
 <MWHPR02MB26236BEABAAF0213B49EC21EAF4F0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20180628091450.25bd54e5@xps13>
 <MWHPR02MB262302F2D504A4783CF60832AF420@MWHPR02MB2623.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Naga,

[...]

> > > > > +
> > > > > +	if (csline =3D=3D NAND_DATA_IFACE_CHECK_ONLY)
> > > > > +		return -EINVAL; =20
> > > >
> > > > Why? =20
> > > It is similar to
> > > if (chipnr < 0)
> > > 	return 0; =20
> >=20
> > Mmmmmh, no?
> >=20
> > (return 0) !=3D (return -EINVAL)
> >=20
> > The core is asking you to check if the controller driver support partic=
ular timings (usually
> > ONFI modes 1-5). Returning an error means "I only support the slowest t=
imings" which, I
> > suppose, is wrong. Please fix this and compare the speeds. =20
> I tried updating the driver as per your comments.
> But I am facing an issue here.
> The part I am using is http://www.cypress.com/file/207521/download.
> This part doesn't support get/set features. But the controller supports i=
t.
> In this case, the frame work is doing like this
> If chip supports set_features, then it issues the ONFI_FEATURE_ADDR_TIMIN=
G_MODE other wise not.

Yes because some NAND parts are broken and do not support set feature
while working naturally at an higher rate than the slowest default one.

> In our case it won't and then next it simply changes the controller mode.=
 Hence both are in different timing mode and not

If you look at the table 3.4 of your NAND part specification, you can
see that it supports mode 0-4. Hence the core will suppose it can
switch the controller timings to mode 4. Now, is your controller able
to support these speeds? Maybe it only supports non-EDO modes (0-3)
and mode 4 cannot be achieved?

> Able to communicate with the nand flash device.
> https://elixir.bootlin.com/linux/v4.18-rc3/source/drivers/mtd/nand/raw/na=
nd_base.c#L1285
> Am I missing something?
> Could you please help on this.
>=20
> The code snippet is like this
> tatic int pl353_setup_data_interface(struct mtd_info *mtd, int csline,
> 				       const struct nand_data_interface *conf)
> {
> 	sdr =3D nand_get_sdr_timings(conf);
> 	if (IS_ERR(sdr)) {
>=20
> 		return PTR_ERR(sdr);
> 	}
> 	if (csline =3D=3D NAND_DATA_IFACE_CHECK_ONLY) {
> 		return 0;
> 	}
> }
>=20
> Thanks,
> Naga Sureshkumar Relli.

Thanks,
Miqu=C3=A8l
