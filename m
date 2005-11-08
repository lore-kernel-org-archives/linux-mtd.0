Received: from mf2.realtek.com.tw ([220.128.56.22])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZPwV-0007nD-Lf
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 04:39:08 -0500
Received: from msx.realtek.com.tw (unverified [172.21.1.77]) by
	mf2.realtek.com.tw (Clearswift SMTPRS 5.1.4) with ESMTP id
	<T747d26fe25dc803816a9c@mf2.realtek.com.tw> for
	<linux-mtd@lists.infradead.org>; Tue, 8 Nov 2005 16:38:33 +0800
Message-ID: <010201c5e43f$796bd5f0$135415ac@realtek.com.tw>
From: =?big5?B?s6+s/bN4IFwoQ2h1Y2tcKQ==?= <ycchen@realtek.com.tw>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 8 Nov 2005 16:36:12 +0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00FF_01C5E482.8785A010"
Subject: CRC error of jffs2_get_inode_nodes() for JFFS2 on NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_00FF_01C5E482.8785A010
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset="big5"

Hello all,

Our system use JFFS2 on NAND flash, and code base is linux 2.6.10-rc3.
A few days ago, we dived into the JFFS2 for the CRC error after a system =
reboot.
We found that it is caused by an incomplete writing and it always =
happens in the end of file.=20
If we write some data into flash which size is not the multiple of =
page_size (512-byte),=20
there is a remainder (under a page-size) in 'wbuf' of function =
jffs2_flash_writev().
Then, at this time, we reset the system, JFFS2 will not yet write the =
remainder into flash and it will cause the inode incomplete.
Is it normal ? What time will JFFS2 flush wbuf out to sync the data if =
there is a remainder in wbuf ?

I appreciate if anyone can give us some suggestion.

best regards,
Chuck Chen                                                               =
                                                         
------=_NextPart_000_00FF_01C5E482.8785A010
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset="big5"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dbig5">
<META content=3D"MSHTML 6.00.2800.1498" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>Hello all,</DIV>
<DIV>&nbsp;</DIV>
<DIV>Our system use JFFS2 on NAND flash, and code base is linux=20
2.6.10-rc3.</DIV>
<DIV>A few days ago,&nbsp;we dived into the JFFS2 for the CRC error =
after a=20
system reboot.</DIV>
<DIV>We found&nbsp;that&nbsp;it&nbsp;is caused by an incomplete writing =
and it=20
always&nbsp;happens in the end of file. </DIV>
<DIV>If we write some data into flash which size is not the multiple of=20
page_size (512-byte), </DIV>
<DIV>there is a remainder (under a page-size) in 'wbuf' of function=20
jffs2_flash_writev().</DIV>
<DIV>Then, at this time, we reset the system, JFFS2 will not&nbsp;yet =
write the=20
remainder into flash and it will cause the inode incomplete.</DIV>
<DIV>Is it normal ? What time&nbsp;will JFFS2 flush&nbsp;wbuf out to =
sync the=20
data if there is a remainder in wbuf ?</DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV>I appreciate if anyone can give us some suggestion.</DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV>best regards,</DIV>
<DIV>Chuck=20
Chen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</DIV></BODY></HTML>

------=_NextPart_000_00FF_01C5E482.8785A010--
