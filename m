Received: from wp110.webpack.hosteurope.de ([80.237.132.117])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IBb1Y-0007Yb-6C
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 14:46:54 -0400
From: Tobias Simon <tobias.simon@sp-ss.de>
To: linux-mtd@lists.infradead.org
Subject: flashcp
Date: Thu, 19 Jul 2007 20:46:46 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200707192046.47340.tobias.simon@sp-ss.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello everybody,

I am new in this list.
Today I found a bug in the flashcp program of the mtd-utils:

In Line 260 of flashcp.c, the following operation is performed:

erase.length =3D filestat.st_size & ~(mtd.erasesize - 1);

I think that is not correct, because if mtd.erasesize is not a power of 2,=
=20
using a bitmask is wrong. ARM dataflash, for instance has a erasesize of=20
1056. My suggestion is the following code replacement, which uses modular=20
arithmetics:

if (filestat.st_size <=3D mtd.erasesize)
{
   erase.length =3D mtd.erasesize;
}
else
{
   erase.length =3D filestat.st_size + mtd.erasesize - (filestat.st_size %=
=20
mtd.erasesize);
}

What's your opinion?

=2D-=20
Mit freundlichem Gru=DF / Kind regards

Tobias Simon
=2D Entwickler -

Simon + Puschmann Software-Systeme GbR
Tobias Simon, Andre Puschmann

Bergrat-Voigt-Stra=DFe 13
98693 Ilmenau
Tel.: 0173/2752144
E-Mail: tobias.simon@sp-ss.de
Internet: http://www.sp-ss.de

=2D-----------------------------------------------------------------------
Important Note: This e-mail and any attachments are confidential, may conta=
in=20
trade secrets and may well also be legally privileged or otherwise protecte=
d=20
from disclosure. If you have received it in error, you are on notice of its=
=20
status. Please notify us immediately by reply e-mail and then delete this=20
e-mail and any attachment from your system. If you are not the intended=20
recipient please understand that you must not copy this e-mail or any=20
attachments or disclose the contents to any other person. Thank you.
