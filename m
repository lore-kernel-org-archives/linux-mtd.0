Received: from arroyo.ext.ti.com ([192.94.94.40])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P2fUO-0004NM-6X
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2010 07:29:36 +0000
From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 4 Oct 2010 12:59:29 +0530
Subject: RE: Issue : jffs2 and ecc layout
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B0356594397@dbde02.ent.ti.com>
References: <2A3DCF3DA181AD40BDE86A3150B27B6B03560990E3@dbde02.ent.ti.com>
In-Reply-To: <2A3DCF3DA181AD40BDE86A3150B27B6B03560990E3@dbde02.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: linux-omap-owner@vger.kernel.org [mailto:linux-omap-
> owner@vger.kernel.org] On Behalf Of Ghorai, Sukumar
> Sent: Tuesday, September 28, 2010 6:17 PM
> To: linux-mtd@lists.infradead.org
> Cc: linux-omap@vger.kernel.org
> Subject: Issue : jffs2 and ecc layout
>=20
> Hi,
> I was using the following ecc layout which is not working to mount the
> jffs2 File-system. I was in 2.6.32 kernel and working; but same layout is
> not working with latest 2.6 kernel.
>=20
> Observation is that - no read request issued to the driver (say omap2.c).
>=20
> # mount -t jffs2 /dev/mtdblock4 /mnt/nand
> [=A0=A0 32.505218] cannot read OOB for EB at 00000000, requested 8 bytes,=
 read
> 0 bytes, error -22
> mount: Mounting /dev/mtdblock4 on /mnt/nand failed: Input/output error
>=20
> # dmesg
> <3>[=A0=A0 32.505218] cannot read OOB for EB at 00000000, requested 8 byt=
es,
> read 0 bytes, error -22
>=20
> Code:
> =A0178 static struct nand_ecclayout hw_x16_romcode_oob_64 =3D {
> =A0179=A0=A0=A0=A0=A0=A0=A0=A0 .eccbytes =3D 12,
> =A0180=A0=A0=A0=A0=A0=A0=A0=A0 .eccpos =3D {
> =A0181=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2, 3, =
4, 5, 6, 7, 8, 9, 10, 11, 12, 13
> =A0182=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 },
> =A0183=A0=A0=A0=A0=A0=A0=A0=A0 .oobfree =3D {
> =A0184=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=
=A0=A0{.offset =3D 14,
> =A0185=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 .length =3D 50}
> =A0186=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> =A0187 };
>=20
> =A01188=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info->nand.ecc.layout =3D =
&hw_x16_romcode_oob_64;
[Ghorai]=20
Does anyone using similar layout for Jffs2? i.e. ECC store at beginning of =
the spare area?


>=20
> Regards,
> Ghorai
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
