Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from mail01.isidesign.com
	([205.230.20.52] helo=mail01.doctordesign.com ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11lM6v-0005vr-00
	for mtd@infradead.org; Wed, 10 Nov 1999 00:59:42 +0000
Message-ID: <00e901bf2b17$42a84770$6600160a@isidesign.com>
From: "Jon Burford" <jburford@xsilogy.com>
To: <mtd@infradead.org>
Subject: IGEL DOC2000 flash driver performance
Date: Tue, 9 Nov 1999 17:02:29 -0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00E6_01BF2AD4.34680990"
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.

------=_NextPart_000_00E6_01BF2AD4.34680990
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have been using the IGEL flash driver on a Linux 2.2.12 system now for =
several months.  One very annoying "feature" is that it causes the =
entire OS to hang for 2-5 seconds after mounting or moderate write =
operations.  I talked with an M-Systems tech and although they did not =
write the driver, he thought it might be due to the garbage collection =
running in the DOC2000 firmware.  When a block becomes some configurable =
percentage utilized, the garbage collector tries to coallesce the used =
portion of this block with others to decrease block fragmentation and =
increase wearability.  His theory was that the driver would request =
space for a particular write operation and if garbage collection was =
necessary, the write operation would block.  My problem is that when =
this happens and the blocking lasts for > 1.5 seconds, my watchdog =
refresh process can't pet the watchdog and the system resets.  I have =
tried making the watchdog process a real-time thread with RTLinux, but =
the RTLinux beta11 is proving to be a little unstable for my blood right =
now.  I am wondering if anyone has encountered this problem and/or may =
have some advice for me.  Does the MTD DOC2000 driver suffer from this =
behavior and can it be patched into a 2.2.12 kernel?  Any other =
thoughts?

TIA!

Regards,
Jon

------=_NextPart_000_00E6_01BF2AD4.34680990
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2614.3401" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I have been using the IGEL flash driver =
on a Linux=20
2.2.12 system now for several months.&nbsp; One very annoying "feature" =
is that=20
it causes the entire OS to hang for 2-5 seconds after mounting or =
moderate write=20
operations.&nbsp; I talked with an M-Systems tech and although they did =
not=20
write the driver, he thought it might be due to the garbage collection =
running=20
in the DOC2000 firmware.&nbsp; When a block becomes some configurable =
percentage=20
utilized, the garbage collector tries to coallesce the used portion of =
this=20
block with others to decrease block fragmentation and increase=20
wearability.&nbsp; His theory was that the driver would request space =
for a=20
particular write operation and if garbage collection was necessary, the =
write=20
operation would block.&nbsp; My problem is that when this happens and =
the=20
blocking lasts for &gt; 1.5 seconds, my watchdog refresh process can't =
pet the=20
watchdog and the system resets.&nbsp; I have tried making the watchdog =
process a=20
real-time thread with RTLinux, but the RTLinux beta11 is proving to be a =
little=20
unstable for my blood right now.&nbsp; I am wondering if anyone has =
encountered=20
this problem and/or may have some advice for me.&nbsp; Does the MTD =
DOC2000=20
driver suffer from this behavior and can it be patched into a 2.2.12=20
kernel?&nbsp; Any other thoughts?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>TIA!</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Regards,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Jon</FONT></DIV></BODY></HTML>

------=_NextPart_000_00E6_01BF2AD4.34680990--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
