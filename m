Received: from wp110.webpack.hosteurope.de ([80.237.132.117])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IBdEX-00011E-55
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 17:08:35 -0400
From: Tobias Simon <tobias.simon@sp-ss.de>
To: linux-mtd@lists.infradead.org
Subject: Re: flashcp
Date: Thu, 19 Jul 2007 23:08:21 +0200
References: <200707192046.47340.tobias.simon@sp-ss.de>
	<20070719195635.GA27750@lazybastard.org>
In-Reply-To: <20070719195635.GA27750@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200707192308.21410.tobias.simon@sp-ss.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello J=C3=B6rn,

> 1. You're off-by-one when (filestat.st_size % mtd.erasesize) yields
> zero.
Oops, you're right!

> 2. In principle the "patch" looks fine.  Except that it should be a
> patch and probably follow kernel coding style or something similar.

=2D-- mtd-utils-1.0.0/flashcp.c   2006-04-30 22:59:15.000000000 +0200
+++ mtd-utils-1.0.0_new/flashcp.c       2007-07-19 22:57:25.000000000 +0200
@@ -258,7 +258,14 @@
 #warning "Check for smaller erase regions"

    erase.start =3D 0;
=2D   erase.length =3D filestat.st_size & ~(mtd.erasesize - 1);
+
+   if (filestat.st_size % mtd.erasesize) {
+      erase.length =3D filestat.st_size + mtd.erasesize - (filestat.st_siz=
e %=20
mtd.erasesize);
+   }
+   else {
+      erase.length =3D filestat.st_size;
+   }
+
    if (filestat.st_size % mtd.erasesize) erase.length +=3D mtd.erasesize;
    if (flags & FLAG_VERBOSE)
         {

> 3. I keep wondering whether the oddball erasesize of dataflash makes
> sense.  Why did they pick 1056, the exact size of two 512 Byte nand
> pages with the standard 16 Bytes of OOB each?  Could they need ECC as
> well and should the "spare" 32 bytes be used for that instead?
The standard page/erase-size of the AT45DB642x Dataflash we use=20
(http://www.atmel.com/dyn/resources/prod_documents/doc3542.pdf) is 1056.
Although it is configurable to 1024 by software, the atmel_mtd.c driver=20
(linux-2.6.21) uses 1056 as the erase size. The driver itself is full of od=
d=20
erase-sizes:=20
/*
 * Detect and initialize DataFlash device:
 *
 *   Device      Density         ID code          #Pages PageSize  Offset
 *   AT45DB011B  1Mbit   (128K)  xx0011xx (0x0c)    512    264      9
 *   AT45DB021B  2Mbit   (256K)  xx0101xx (0x14)   1025    264      9
 *   AT45DB041B  4Mbit   (512K)  xx0111xx (0x1c)   2048    264      9
 *   AT45DB081B  8Mbit   (1M)    xx1001xx (0x24)   4096    264      9
 *   AT45DB0161B 16Mbit  (2M)    xx1011xx (0x2c)   4096    528     10
 *   AT45DB0321B 32Mbit  (4M)    xx1101xx (0x34)   8192    528     10
 *   AT45DB0642  64Mbit  (8M)    xx111xxx (0x3c)   8192   1056     11
 *   AT45DB1282  128Mbit (16M)   xx0100xx (0x10)  16384   1056     11
 */


=2D-=20
Mit freundlichem Gru=C3=9F / Kind regards

Tobias Simon
=2D Entwickler -

Simon + Puschmann Software-Systeme GbR
Tobias Simon, Andre Puschmann

Bergrat-Voigt-Stra=C3=9Fe 13
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
