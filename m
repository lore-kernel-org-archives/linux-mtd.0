Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYr4s-000420-Cr
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 05:33:55 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: gpmi-mtd ecc regression
Date: Wed, 23 Oct 2013 07:33:33 +0200
References: <CAJ+vNU1JWZp=JoBDJALh59yFybGZ0iQxMEYy8qvTFGDLhyRzqg@mail.gmail.com>
 <52649FDA.1030804@freescale.com>
In-Reply-To: <52649FDA.1030804@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201310230733.33285.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, Tim Harvey <tharvey@gateworks.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2013=E5=B9=B410=E6=9C=8819=E6=97=A5 01:03, Tim Harvey =E5=86=99=
=E9=81=93:
> > Huang,
> >=20
> > The patch you made to obtain ECC info from the chip
> > (http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/=
dr
> > ivers/mtd/nand/gpmi-nand?id=3D2febcdf84b75aae627c61f0a5bf531a69299966c)=
 has
> > caused a regression for an i.MX6 board I'm working with that uses NAND
> > and ubifs.
> >=20
> > I'm using a Micron MT29F8G08
> > (http://download.micron.com/pdf/datasheets/flash/nand/2_4_8gb_nand_m49a=
=2Ep
> > df) which has:
> > page size: 2112 bytes (2048 + 64 bytes)
> > block size: 1056 words (1024 + 32 words)
> > plane size: 2 planes x 1024 blocks per plane
> > device size: 2Gb: 2048 blocks
> > ecc: 4bit
> >=20
> > The legacy_set_geometry function comes up with:
> > gf_len=3D13
> > ecc_strength=3D8
> > page_size=3D2112
> > metadata_size=3D10
> > ecc_chunk_size=3D512
> > ecc_chunk_count=3D4
> > payload_size=3D2048
> > auxiliary_size=3D16
> > auxiliary_status_offset=3D12
> > block_mark_byte_offset=3D1999
> >=20
> > and the new set_geometry_by_ecc_info comes up with:
> > gf_len=3D13
> > ecc_strength=3D4
> > page_size=3D2084
> > metadata_size=3D10
> > ecc_chunk_size=3D512
> > ecc_chunk_count=3D4
> > payload_size=3D2048
> > auxiliary_size=3D16
> > auxiliary_status_offset=3D12
> > block_mark_byte_offset=3D2018
> > block_mark_bit_offset=3D4
> >=20
> > There are two discrepancies above:
> >   a) ecc_strength - this part has 4bit ecc but being detected as 8?
> >   b) page_size - the legacy function includes oob in page size, and the
> >=20
> > new one does not
> >=20
> > which is correct?
>=20
> In theory, both are correct.
>=20
> I am in an embarrass state now:
> [1] we can support the jffs2, when we use the set_geometry_by_ecc_info()
> to set the NAND layout.
>=20
> [2] if we still use the legacy_set_geometry() to set the NAND layout, we
> can not support the jffs2 for GPMI.

It's exactly the other way around if you're talking about JFFS2 compatibili=
ty=20
with the 2.6.35 FSL kernel ;-)
