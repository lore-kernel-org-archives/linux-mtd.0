Received: from h154.195-230-144.ukrpack.net ([195.230.144.154] helo=srv1.lrpeople.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vb0C-0002H2-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 May 2001 09:31:54 +0100
Message-ID: <002b01c0d46c$5334ce60$5502010a@lrpeople.com>
From: "Alexander Melichenko" <AlexanderM@lrpeople.com>
To: "Vipin Malik" <vipin.malik@daniel.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: SC520 CDP: When set the CFG1 switch to ON --> nb0 command says that bank not present
Date: Fri, 4 May 2001 11:32:03 +0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0028_01C0D48D.D76D0FA0"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.

------=_NextPart_000_0028_01C0D48D.D76D0FA0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello, Vipin!
I want to place the lstart16.abs file  to BIOS flash memory =
(29F040-DIP). In lstart16.asm I found that it necessary set the CFG1 =
switch to ON. But when I run :
    z
    yi
    nb0
I see a message : bank not present.
When I set CFG1 to OFF the command "nb0" works fine :
changed to bank 0, 512 KB, Device 29F040

Would You help me?=20

Thank You.

     Alexander Melichenko.

------=_NextPart_000_0028_01C0D48D.D76D0FA0
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
<DIV><FONT face=3DArial size=3D2>Hello, Vipin!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I&nbsp;want to place the lstart16.abs =
file  to BIOS=20
flash memory (29F040-DIP). In lstart16.asm I found that it necessary set =
the=20
CFG1 switch to ON. But when I run :</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; z</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; yi</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; nb0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I see&nbsp;a message : bank not=20
present.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>When I set CFG1 <FONT face=3DArial =
size=3D2>to OFF=20
</FONT>the command "nb0" works fine :</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>changed to bank 0, 512&nbsp;KB, Device=20
29F040</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Would&nbsp;You help =
me?</FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thank You.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp; Alexander=20
Melichenko.</FONT></DIV></BODY></HTML>

------=_NextPart_000_0028_01C0D48D.D76D0FA0--
