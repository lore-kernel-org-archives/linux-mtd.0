Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11yI3Z-0003rd-00
	for mtd-list@infradead.org; Wed, 15 Dec 1999 17:17:41 +0000
Received: from [200.16.153.9] (helo=mail.netizen.com.ar)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11yI2Q-0003rX-00
	for mtd@imladris.mvhi.com; Wed, 15 Dec 1999 17:16:44 +0000
Received: from salguero_1.grupoclave.com (gclave.netizen.com.ar [200.16.152.73])
	by mail.netizen.com.ar (8.9.3/8.9.3) with ESMTP id NAA13223
	for <mtd@imladris.mvhi.com>; Wed, 15 Dec 1999 13:40:16 -0300
Message-ID: <C0AA6C69A265D311ACCA0090274F09AD03D012@SALGUERO_1>
From: Diego Roig <diego.roig@grupoclave.com>
To: "MTD (E-mail)" <mtd@imladris.mvhi.com>
Subject: "FS over BLOCKDEV over FLASH" versus "FS over FLASH"
Date: Wed, 15 Dec 1999 13:43:47 -0300
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01BF471B.92AD9150"
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01BF471B.92AD9150
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
	There are two posibilities for implementing a filesystem over a
flash device (DiskOnChip or others).
	One, is implementing a block device emulation layer over flash, and
then a filesystem over it. The block device emulation layer can be a =
wear
leveliong one (like M'Systems NFTL) or one that just maps flash memory =
like
linear contiguous sectors. The filesystem over the block device needs =
to
have a journal or to be log structured to be inmune to power failures =
and
crashes.
	The other apporoach, is implementing a filesystem over flash
directly.
	What I don=B4t understand, is what is the difference between layering
the filesystem over the block device and directly over flash ? The =
"block
device" layer, isn=B4t just an abstraction for some REAL device that =
adapts
well to the concept of contiguous sectors? Doesn=B4t flash memory adapt =
to
that concept?
	What are the drawbacks of implementing a standard log structured
filesystem over a block device abstraction of the flash that doesn=B4t
implement wear leveling?


Diego Roig Seigneur
Gerencia de Desarrollo
Research & Development
Clave Electr=F3nica SA
=20
Mail Address:
Salguero 2493
(B1650BTG) San Mart=EDn
Argentina
Tel: +54-11-4755-4554
Fax: +54-11-4753-3265
mailto:diego.roig@grupoclave.com
http://www.grupoclave.com

------_=_NextPart_001_01BF471B.92AD9150
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2448.0">
<TITLE>&quot;FS over BLOCKDEV over FLASH&quot; versus &quot;FS over =
FLASH&quot;</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Hello,</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>There are =
two posibilities for implementing a filesystem over a flash device =
(DiskOnChip or others).</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>One, is =
implementing a block device emulation layer over flash, and then a =
filesystem over it. The block device emulation layer can be a wear =
leveliong one (like M'Systems NFTL) or one that just maps flash memory =
like linear contiguous sectors. The filesystem over the block device =
needs to have a journal or to be log structured to be inmune to power =
failures and crashes.</FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>The other =
apporoach, is implementing a filesystem over flash directly.</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>What I =
don=B4t understand, is what is the difference between layering the =
filesystem over the block device and directly over flash ? The =
&quot;block device&quot; layer, isn=B4t just an abstraction for some =
REAL device that adapts well to the concept of contiguous sectors? =
Doesn=B4t flash memory adapt to that concept?</FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>What are =
the drawbacks of implementing a standard log structured filesystem over =
a block device abstraction of the flash that doesn=B4t implement wear =
leveling?</FONT></P>
<BR>

<P><FONT SIZE=3D2>Diego Roig Seigneur</FONT>
<BR><FONT SIZE=3D2>Gerencia de Desarrollo</FONT>
<BR><FONT SIZE=3D2>Research &amp; Development</FONT>
<BR><FONT SIZE=3D2>Clave Electr=F3nica SA</FONT>
<BR><FONT SIZE=3D2>&nbsp;</FONT>
<BR><FONT SIZE=3D2>Mail Address:</FONT>
<BR><FONT SIZE=3D2>Salguero 2493</FONT>
<BR><FONT SIZE=3D2>(B1650BTG) San Mart=EDn</FONT>
<BR><FONT SIZE=3D2>Argentina</FONT>
<BR><FONT SIZE=3D2>Tel: +54-11-4755-4554</FONT>
<BR><FONT SIZE=3D2>Fax: +54-11-4753-3265</FONT>
<BR><FONT SIZE=3D2><A =
HREF=3D"mailto:diego.roig@grupoclave.com">mailto:diego.roig@grupoclave.c=
om</A></FONT>
<BR><FONT SIZE=3D2><A HREF=3D"http://www.grupoclave.com" =
TARGET=3D"_blank">http://www.grupoclave.com</A></FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01BF471B.92AD9150--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
