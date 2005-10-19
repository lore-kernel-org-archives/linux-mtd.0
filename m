Received: from blood.actrix.co.nz ([203.96.16.163])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ES2Lb-0004vx-ER
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 21:02:34 -0400
Received: from [202.154.143.82] (unknown [202.154.143.82])
	by blood.actrix.co.nz (Postfix) with ESMTP id E77764170
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Oct 2005 14:02:22 +1300 (NZDT)
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Wed, 19 Oct 2005 14:08:38 +1300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200510191408.38536.manningc2@actrix.gen.nz>
Subject: Proposal: allow reading oob with AUTOPLACE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks

As has been discussed in various places, it would be nice to be able to rea=
d=20
oob with AUTOPLACE, without reading the whole data page too. At present the=
re=20
is no way to do this.

Having this capability is quite important to YAFFS2 since it allows the tag=
s=20
(in oob) to be scanned without having to do the extra (useless) work of=20
dummy-reading the data. Currently people have to manually fiddle around to=
=20
get the required semantics.

There are three ways I can see to achieve this:

1) Change the semantics of read_oob(). That would work, but would break any=
one=20
expecting read_oob() to have its current semantics of reading raw.

2) Change read_oob() to take an oobsel argument to allow reading raw or=20
AUTOPLACE or whatever. That would break some code, but very little. At leas=
t=20
it would be obvious where something needs fixing (whereas (1) does not make=
=20
it obvious).

3) Change read_ecc() to allow passing in a NULL data buf pointer to indicat=
e=20
that only the oob should be read.

Personally, I think 2 is neatest from an interface perspective, but 3 break=
s=20
the least and 1 is the worst because semantics change in an uncontrolled wa=
y.=20
However, this is a personal taste issue and I will be happy with any soluti=
on=20
that gives the function.

I have below an**untested** patch for option 3 - sorry folk; no hw =3D=3D n=
o test.=20
I wrote this with the intent of seeing how traumatic the changes might be,=
=20
rather than try build shippable code.

I expect the patch does not conform to guidelines, but I hope not to get a=
=20
public flogging.

diff /opt/mtd_virgin/drivers/mtd/nand/nand_base.c /opt/mtd/drivers/mtd/nand=
/nand_base.c
1118a1119
> =A0=A0=A0=A0=A0=A0int oob_only, oob_once;
1147a1149,1150
> =A0=A0=A0=A0=A0=A0oob_once =3D oob_only =3D (!buf); /* buf is NULL, so on=
ly reading OOB */
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
1174c1177
< =A0=A0=A0=A0=A0=A0while (read < len) {
=2D--
> =A0=A0=A0=A0=A0=A0while (read < len || oob_once) {
1200c1203
< =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0this->c=
mdfunc (mtd, NAND_CMD_READ0, 0x00, page);
=2D--
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0this->c=
mdfunc (mtd, (oob_only) ? NAND_CMD_READOOB :=20
NAND_CMD_READ0, 0x00, page);
1201a1205
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0oob_onc=
e =3D 0;
1208a1213
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
1210a1216,1218
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if(oob_only)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto re=
ad_oob_data;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
1256a1265
> read_oob_data:
1260c1269
< =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (!compareecc)
=2D--
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (!compareecc || oob_only)
