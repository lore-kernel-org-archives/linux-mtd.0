Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14nEms-00048m-00
	for mtd-list@infradead.org; Wed, 11 Apr 2001 08:11:34 +0100
Received: from h154.195-230-144.ukrpack.net ([195.230.144.154] helo=srv1.lrpeople.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14nEmq-00048g-00
	for mtd@infradead.org; Wed, 11 Apr 2001 08:11:33 +0100
Message-ID: <00ae01c0c24e$5b566480$4d02010a@lrpeople.com>
From: "Alexander Melichenko" <AlexanderM@lrpeople.com>
To: <mtd@infradead.org>
Subject: Elan SC520 - problem with MTD
Date: Wed, 11 Apr 2001 10:12:16 +0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00AB_01C0C26F.E25EDCC0"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.

------=_NextPart_000_00AB_01C0C26F.E25EDCC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello!
We use Elan SC520 CDP Rev.1.3.
I have linux-2.2.18 (on hard drive) with MTD support. I use MTD MAKEDEV =
script to make MTD devices. I want to place kernel image into flash. But =
when I do=20
  #cat zFlashImage > /dev/mtd0
I see the message : bash: /dev/mtd0: No such device
=20
During booting I see following messages :
AMD Elan SC520 flash mapping: 1000000 at 4800000=20
mapped physical memory to c4800000
Elan SC520 Physically mapped flash: Found no CFI device at location zero
JFFS version 1.0, (C) 1999, 2000 Axis Communications AB

When I inspect directory /proc  I see 2 (!!!) files mtd with no =
information about MTD devices.
=20
How can I solve this problem?

Thanks for any help.
Alexander Melichenko.


------=_NextPart_000_00AB_01C0C26F.E25EDCC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2919.6307" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello!<BR>We use Elan SC520 CDP =
Rev.1.3.<BR>I have=20
linux-2.2.18&nbsp;(on hard drive) with MTD support. I use MTD MAKEDEV =
script to=20
make MTD devices. I want to place kernel image into flash. But when I do =

<BR>&nbsp; #cat zFlashImage &gt; /dev/mtd0<BR>I see the message : bash:=20
/dev/mtd0: No such device<BR>&nbsp;<BR>During booting I see following =
messages=20
:<BR>AMD Elan SC520 flash mapping: 1000000 at 4800000 <BR>mapped =
physical memory=20
to c4800000<BR>Elan SC520 Physically mapped flash: Found no CFI device =
at=20
location zero<BR>JFFS version 1.0, (C) 1999, 2000 Axis Communications=20
AB</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>When I inspect directory /proc&nbsp; I =
see 2 (!!!)=20
files mtd with no information about MTD devices.<BR>&nbsp;<BR>How can I =
solve=20
this problem?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks for any help.<BR>Alexander=20
Melichenko.<BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_00AB_01C0C26F.E25EDCC0--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
