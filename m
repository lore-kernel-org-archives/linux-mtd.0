Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JeyN-00071p-00
	for mtd-list@infradead.org; Tue, 01 Aug 2000 17:32:55 +0100
Received: from pop.gmx.net ([194.221.183.20] helo=mail.gmx.net)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13JeyL-00071a-00
	for mtd@infradead.org; Tue, 01 Aug 2000 17:32:53 +0100
Message-ID: <002b01bffbd5$73f7f8e0$fd8907d4@gallien>
From: "Markus Thiesmeyer" <mthi@gmx.de>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: CFI-Read-Command
Date: Tue, 1 Aug 2000 18:23:00 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0027_01BFFBE5.86188660"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0027_01BFFBE5.86188660
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

after I've integrated the cfi-support (from mtd-20000704.tar.gz) I =
noticed a problem when I was tying to read bytes from odd addresses. It =
it seems as if I've located the problem:

Before the flash =EDs read, the read-function tries to read the =
cfi-statemachine. And this operation must be an aligned 16-bit read. But =
the read-operation uses the given, odd address and gets confused. As a =
fast bugfix I wrote a wrapper which handles unaligned accesses and =
forwards aligned accesses to the given read-command.

regards

Markus Thiesmeyer

------=_NextPart_000_0027_01BFFBE5.86188660
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2314.1000" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>after I've integrated the cfi-support =
(from=20
mtd-20000704.tar.gz) I noticed a problem when I was tying to read bytes =
from odd=20
addresses. It it seems as if I've located the problem:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Before the flash =EDs read, the =
read-function tries=20
to read the cfi-statemachine. And this operation must be an aligned =
16-bit read.=20
But the read-operation uses the given, odd address and gets confused. As =
a fast=20
bugfix I wrote a wrapper which handles unaligned accesses and forwards =
aligned=20
accesses to the given read-command.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>regards</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Markus =
Thiesmeyer</FONT></DIV></BODY></HTML>

------=_NextPart_000_0027_01BFFBE5.86188660--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
