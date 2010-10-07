Received: from devils.ext.ti.com ([198.47.26.153])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P3uuZ-0008Td-HX
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 18:09:48 +0000
From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 7 Oct 2010 23:39:38 +0530
Subject: RE: Issue : jffs2 and ecc layout
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B03567115C3@dbde02.ent.ti.com>
References: <2A3DCF3DA181AD40BDE86A3150B27B6B03560990E3@dbde02.ent.ti.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B0356594397@dbde02.ent.ti.com>
	<AANLkTi=y1JwSBrELd=KyUsmhitSCF2eWW9iYFg3a_-J4@mail.gmail.com>
In-Reply-To: <AANLkTi=y1JwSBrELd=KyUsmhitSCF2eWW9iYFg3a_-J4@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Vimal Singh [mailto:vimal.newwork@gmail.com]
> Sent: Thursday, October 07, 2010 11:02 PM
> To: Ghorai, Sukumar
> Cc: linux-mtd@lists.infradead.org; linux-omap@vger.kernel.org
> Subject: Re: Issue : jffs2 and ecc layout
>=20
> On Mon, Oct 4, 2010 at 12:59 PM, Ghorai, Sukumar <s-ghorai@ti.com> wrote:
> >
> >
> >> -----Original Message-----
> >> From: linux-omap-owner@vger.kernel.org [mailto:linux-omap-
> >> owner@vger.kernel.org] On Behalf Of Ghorai, Sukumar
> >> Sent: Tuesday, September 28, 2010 6:17 PM
> >> To: linux-mtd@lists.infradead.org
> >> Cc: linux-omap@vger.kernel.org
> >> Subject: Issue : jffs2 and ecc layout
> >>
> >> Hi,
> >> I was using the following ecc layout which is not working to mount the
> >> jffs2 File-system. I was in 2.6.32 kernel and working; but same layout
> is
> >> not working with latest 2.6 kernel.
> >>
> >> Observation is that - no read request issued to the driver (say
> omap2.c).
> >>
> >> # mount -t jffs2 /dev/mtdblock4 /mnt/nand
> >> [=A0=A0 32.505218] cannot read OOB for EB at 00000000, requested 8 byt=
es,
> read
> >> 0 bytes, error -22
> >> mount: Mounting /dev/mtdblock4 on /mnt/nand failed: Input/output error
> >>
> >> # dmesg
> >> <3>[=A0=A0 32.505218] cannot read OOB for EB at 00000000, requested 8 =
bytes,
> >> read 0 bytes, error -22
> >>
> I do not think above issue has anything to do with the ECC layout.
> But as I earlier pointed (in [1]), this change [2] has messed up
> function 'omap_hwcontrol'.
[Ghorai] in that case how other layout is working? Say storing the ecc at e=
nd of the spare area is working.

> All read/write functions read/write data from/to address
> info->nand.IO_ADDR_(R/W), which is not set by new function
> 'gpmc_nand_write' (which still take care of writing address/cmd to
> write registers). But since above pointer is not set (hence points to
> address '0'), driver tries to read data from wrong location.
[Ghorai] you can see following two line in _probe() function
info->nand.IO_ADDR_R =3D ioremap(info->phys_base, NAND_IO_SIZE);
info->nand.IO_ADDR_W =3D info->nand.IO_ADDR_R;

>=20
> In fact, I would even suggest to try dumping nand command registers(or
> use T32) and verify if commands issued were written correctly to
> appropriate registers.
[Ghorai] I mentioned read request does not come to driver.

>=20
>=20
>=20
> [1]: http://marc.info/?l=3Dlinux-omap&m=3D128302624528822&w=3D2
> [2] commit: http://git.infradead.org/mtd-
> 2.6.git/commitdiff/2c01946c6b9ebaa5a89710bc42ca224a7f52f227
>=20
> --
> Regards,
> Vimal Singh
