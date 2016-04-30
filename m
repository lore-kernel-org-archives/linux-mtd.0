Received: from dub004-omc3s31.hotmail.com ([157.55.2.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awQyY-0000l2-Ko
 for linux-mtd@lists.infradead.org; Sat, 30 Apr 2016 09:14:11 +0000
Message-ID: <DUB128-W4483C16A8F30A84AB9CB09C670@phx.gbl>
From: David Binderman <dcb314@hotmail.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: drivers/mtd/chips/cfi_cmdset_0002.c bug report
Date: Sat, 30 Apr 2016 09:13:47 +0000
Content-Type: text/plain; charset="iso-8859-1"
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

Hello there=2C=0A=
=0A=
drivers/mtd/chips/cfi_cmdset_0002.c:569]: (style) Redundant condition: extp=
.MajorVersion=3D=3D'1'. 'A || (!A && B)' is equivalent to 'A || B'=0A=
=0A=
Source code is=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (extp->MajorVersion !=3D '1' ||=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (extp->MajorVersion =3D=3D '1=
' && (extp->MinorVersion < '0' || extp->MinorVersion> '5'))) {=0A=
=0A=
Suggest new code=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (extp->MajorVersion !=3D '1' ||=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (extp->MinorVersion < '0' || =
extp->MinorVersion> '5')) {=0A=
=0A=
Also=2C some minor errors in the same file=0A=
=0A=
[drivers/mtd/chips/cfi_cmdset_0002.c:1106]: (style) Variable 'cfi' is assig=
ned a value that is never used.=0A=
[drivers/mtd/chips/cfi_cmdset_0002.c:2004]: (style) Variable 'cfi' is assig=
ned a value that is never used.=0A=
=0A=
=0A=
Regards=0A=
=0A=
David Binderman=0A=
=0A=
 		 	   		  =
