Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13NW7v-0000nH-00
	for mtd-list@infradead.org; Sat, 12 Aug 2000 08:54:43 +0100
Received: from [202.108.126.193] (helo=dns.rabbit.redflag-linux.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13NW7s-0000nB-00
	for mtd@infradead.org; Sat, 12 Aug 2000 08:54:40 +0100
Received: from zheng ([192.9.200.44])
	by dns.rabbit.redflag-linux.com (8.9.3/8.8.7) with SMTP id PAA25201
	for <mtd@infradead.org>; Sat, 12 Aug 2000 15:56:06 +0800
Message-ID: <00ea01c00432$f84f5b00$2cc809c0@zheng.redflag-linux.com>
From: "zhengliangchen" <liangchenzheng@redflag-linux.com>
To: <mtd@infradead.org>
Subject: Help me: How to support two Msys Diskonchip devices?
Date: Sat, 12 Aug 2000 15:57:32 +0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00E7_01C00476.0661D220"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.

------=_NextPart_000_00E7_01C00476.0661D220
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

        I have meet some problems to deal with Msys Diskonchips.=20
I have a task to provide a linux distribution to support some type
machine. In this machine ,there are two 8M Msys diskonchips. But the two
Msys diskonchips is not a whole. I find they are driver C: and Driver D: =
=20
in the MSDOS. This to say ,they will be  treated as two devices by =
linux.
I have gotten the linux kernel patch and the guide provided by MSYS.=20
The guide tells me  how to add the diskonchip driver to the kernel and  =
how to=20
make the flash devices such as fla,fla... . I have done it.=20
         Now the problem I are facing with is that I have two Diskonchip =
devices
in the system. This is to say, I must have a devices "flb" in the /dev/ =
to
deal with the second Diskonchip device. I have read the guide for =
several times.
But I can't find a way to make the device "flb".=20
        So,could you tell  a way to support two or more Msys Diskonchip =
devices=20
in the Linux system?  It is in the urgent need.=20
        I hope I can get help from you. Thanks
=20
=20
LC.Zheng
Beijing,PR China
TEL    : (8610)82656655 ext.2618
Email  : liangchenzheng@redflag-linux.com

------=_NextPart_000_00E7_01C00476.0661D220
Content-Type: text/html;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD W3 HTML//EN">
<HTML>
<HEAD>

<META content=3Dtext/html;charset=3Dgb2312 http-equiv=3DContent-Type>
<META content=3D'"MSHTML 4.72.3110.7"' name=3DGENERATOR>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have meet some =
problems to=20
deal with Msys Diskonchips.=20
<DIV><FONT size=3D3>I have a task to provide a linux distribution to =
support some=20
type</FONT></DIV>
<DIV><FONT size=3D3>machine. In this machine ,there are two 8M Msys =
diskonchips.=20
But the two</FONT></DIV>
<DIV><FONT size=3D3>Msys diskonchips is not a whole. I find they are =
driver C: and=20
Driver D:&nbsp; </FONT></DIV>
<DIV><FONT size=3D3>in the MSDOS. This to say ,they will be&nbsp; =
treated as two=20
devices by linux.</FONT></DIV>
<DIV><FONT size=3D3>I have gotten the linux kernel patch and the guide =
provided by=20
MSYS. </FONT></DIV>
<DIV><FONT size=3D3>The guide tells me&nbsp; how to add the diskonchip =
driver to=20
the kernel and&nbsp; how to&nbsp;</FONT></DIV>
<DIV><FONT size=3D3>make the flash devices such as fla,fla... . I have =
done it.=20
</FONT></DIV>
<DIV><FONT color=3D#000000><FONT=20
size=3D3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Now the =
problem I are=20
facing with is that I have two Diskonchip devices</FONT></FONT><FONT=20
size=3D3></FONT></DIV>
<DIV><FONT size=3D3>in the system. This is to say, I must have a devices =

&quot;flb&quot; in the /dev/ to</FONT></DIV>
<DIV><FONT size=3D3>deal with the second Diskonchip device. I have read =
the guide=20
for several times.</FONT></DIV>
<DIV><FONT size=3D3>But I can't find a way to make the device =
&quot;flb&quot;.=20
</FONT></DIV>
<DIV><FONT size=3D3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So,could =
you=20
tell&nbsp; a way to support two or more Msys Diskonchip devices =
</FONT></DIV>
<DIV><FONT size=3D3>in the Linux system?&nbsp; It is in the urgent need. =

</FONT></DIV>
<DIV><FONT size=3D3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I hope I =
can get=20
help from you. Thanks</FONT></DIV>
<DIV><FONT size=3D3>&nbsp;</FONT></DIV>
<DIV><FONT color=3D#000000><FONT size=3D3></FONT></FONT><FONT=20
size=3D3>&nbsp;</FONT></DIV>
<DIV><FONT color=3D#000000><FONT size=3D3>LC.Zheng</FONT></FONT><FONT=20
size=3D3></FONT></DIV>
<DIV><FONT size=3D3>Beijing,PR China</FONT></DIV>
<DIV><FONT color=3D#000000><FONT size=3D3>TEL&nbsp;&nbsp;&nbsp; : =
(8610)82656655=20
ext.2618</FONT></FONT><FONT size=3D3></FONT></DIV>
<DIV><FONT color=3D#000000 face=3D"" size=3D3>Email&nbsp; : <A=20
href=3D"mailto:liangchenzheng@redflag-linux.com">liangchenzheng@redflag-l=
inux.com</A></FONT></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_00E7_01C00476.0661D220--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
