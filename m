Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JeyA-00071i-00
	for mtd-list@infradead.org; Tue, 01 Aug 2000 17:32:42 +0100
Received: from pop.gmx.net ([194.221.183.20] helo=mail.gmx.net)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13Jey8-00071W-00
	for mtd@infradead.org; Tue, 01 Aug 2000 17:32:40 +0100
Message-ID: <002a01bffbd5$6e5da560$fd8907d4@gallien>
From: "Markus Thiesmeyer" <mthi@gmx.de>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: Is JFFS a full featured filesystem?
Date: Tue, 1 Aug 2000 18:15:31 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001F_01BFFBE4.7AAF7E60"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.

------=_NextPart_000_001F_01BFFBE4.7AAF7E60
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I've integrated the JFFS into a 2.2.16 kernel and it works almost fine.
But I cannot use an editor like pico to create a file on a =
JFFS-filesystem. It leads to an serious error. Other operations like =
copying or moving files are no problem.
So I've written a small program which uses file-mapping to change given =
files. And the results were very strange: When I run this application it =
should open a file called map.txt and change the first bytes into the =
sequence "abcdef...xyz". But when I read the file after I've run that =
application, the file seems to be unchanged. Changes appear first when I =
unmount that fs and mount in again. Then the file looks like a =
concatenation of the unchanged and the changed version.

Is this a bug? And if it is a bug, is this a known bug?


regards

Markus Thiesmeyer

------=_NextPart_000_001F_01BFFBE4.7AAF7E60
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
<DIV><FONT face=3DArial size=3D2>I've integrated the JFFS into a 2.2.16 =
kernel and=20
it works almost fine.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>But I cannot use an editor like pico to =
create a=20
file on a JFFS-filesystem. It leads to an serious error. Other =
operations like=20
copying or moving files are no problem.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>So I've written a small program which =
uses=20
file-mapping to change given files. And the results were very strange: =
When I=20
run this application it should open a file called map.txt and change the =
first=20
bytes into the sequence "abcdef...xyz". But when I read the file after =
I've run=20
that application, the file seems to be unchanged. Changes appear first =
when I=20
unmount that fs and mount in again. Then the file looks like a =
concatenation of=20
the unchanged and the changed version.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Is this a bug? And if it is a bug, is =
this a known=20
bug?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>regards</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Markus =
Thiesmeyer</FONT></DIV></BODY></HTML>

------=_NextPart_000_001F_01BFFBE4.7AAF7E60--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
