Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NndyF-0006gi-33
	for linux-mtd@lists.infradead.org; Fri, 05 Mar 2010 20:18:07 +0000
From: "Paulraj, Sandeep" <s-paulraj@ti.com>
To: Blair Barnett <bbarnett@nethra.us.com>
Date: Fri, 5 Mar 2010 14:17:58 -0600
Subject: RE: ONFI 4GB and beyond NAND support
Message-ID: <0554BEF07D437848AF01B9C9B5F0BC5D9C18C4EC@dlee01.ent.ti.com>
References: <4B907BC1.4030907@nethra.us.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9C10DBEB@dlee01.ent.ti.com>
	<4B916483.9040900@nethra.us.com>
In-Reply-To: <4B916483.9040900@nethra.us.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Blair Barnett [mailto:bbarnett@nethra.us.com]
> Sent: Friday, March 05, 2010 3:08 PM
> To: Paulraj, Sandeep
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: ONFI 4GB and beyond NAND support
>=20
> Paulraj, Sandeep wrote:
> >
> >> I have two questions for the MTD gang, but couldn't find the answer in
> >> the archives, nor elsewhere on the web.
> >>
> >> 1. What's the plan, if any, for the MTD NAND layer to support the ONFI
> >> standard?
> >>
> > I guess somebody has to write the necessary code and send the patch.
> > ONFI NANds get all the necessary info from a param table I believe.
> >
> O.K. That's fair.
> >
> >> 2. What's the plan, if any, for the MTD NAND layer to support 4 GB
> NANDs
> >> (and greater)?
> >>
> > This is already there for more than a year. Use the latest kernels
> >
> Let's see. I'm using 2.6.33, so that seems like a pretty new kernel. I
> think the problem may in the code for figuring out the NAND geometry in
> nand_get_flash_type(). If type->pagesize =3D=3D 0,  0x46 is the extid val=
ue.
> Unfortunately, this decodes in the NAND code to the following geometry:
Its been a while but I vaguely remember that instead of actually writing co=
de for the param table I hardcoded the required values in the nand_ids.c an=
d it worked fine for me
>=20
> Writesize =3D 4096 bytes
> oobsize=3D 128 bytes
> erasesize =3D 64 K bytes (extid & 0x03)
>=20
> Reading the chip's ONFI Page parameters, one gets this geometry:
>=20
> writesize =3D 4096 bytes
> oobsize =3D 224 bytes
> erasesize =3D 1024 K bytes
>=20
> It appears a simple fix for the erasesize is to use 0x7 as the mask, but
> the oobsize is a little more problematic.

I had similar concerns.
What we did was to just assume that the OOB size was 128 instead of 224.
We just don't use and our driver sis not concerned about the other 96 bytes=
.
>=20
> The code
> mtd->oobsize =3D (8 << (extid & 0x01)) * (mtd->writesize >> 9);
>=20
> doesn't really work to create a 224 byte oobsize value, not to mention I
> don't know where to look to create the ECC structure required.
As I said above just assume that the OOB is 128 bytes

>=20
> Do you have a preference for how to fix this?
>=20
> -blair
>=20
