From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Charles Manning <manningc2@actrix.gen.nz>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Wed, 22 Dec 2010 13:13:13 +0530
Subject: RE: [PATCH v6 0/7] nand prefetch-irq support and ecc layout chanage
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B036A3B0397@dbde02.ent.ti.com>
References: <1290785677-16005-1-git-send-email-s-ghorai@ti.com>
	<201012201045.53688.manningc2@actrix.gen.nz>
In-Reply-To: <201012201045.53688.manningc2@actrix.gen.nz>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Charles Manning [mailto:manningc2@actrix.gen.nz]
> Sent: Monday, December 20, 2010 3:16 AM
> To: linux-mtd@lists.infradead.org
> Cc: Ghorai, Sukumar; linux-omap@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v6 0/7] nand prefetch-irq support and ecc layout
> chanage
>=20
> On Saturday 27 November 2010 04:34:30 Sukumar Ghorai wrote:
> > The following set of patches applies on linux-2.6.
> >
> > The main motivations behind this patch series are -
> >         1. support NAND I/O in irq mode.
> >         2. support of different ECC schema.
> >         3. also to make ecc layout as like in romcode ecc layout
>=20
> Why change the ECC layout?
>=20
> Be very careful when you change ECC layouts. This can break production
> systems.
>=20
> For example if people are running something earlier and then want to
> deliver a
> new kernel with 2.6.37 then their existing NAND file systems will no
> longer
> be readable.
>=20
> Changes to ECC should only be done for very good reasons and should be
> controlled with a Kconfig with the default being the existing ECC layout.
>=20
[Ghorai] we are just adding few ecc-layout(s) and based on the request from=
 different customer. The default ecc-layout is the old one for backward com=
patibility and selection of ecc-layput is exposed form board file. =20
