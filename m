Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14O74g-00052v-00
	for mtd-list@infradead.org; Wed, 31 Jan 2001 23:54:06 +0000
Received: from holmes.infopro.spb.su ([195.242.2.2])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14O74d-00052p-00
	for mtd@infradead.org; Wed, 31 Jan 2001 23:54:04 +0000
Received: from barrymore.peterlink.ru (barrymore.peterlink.ru [195.242.2.8])
	by holmes.infopro.spb.su (8.9.1/8.9.1) with ESMTP id CAA24510
	for <mtd@infradead.org>; Thu, 1 Feb 2001 02:53:58 +0300 (MSK)
Received: from drakanworkst (spb-3-132.dialup.peterlink.ru [195.242.18.132])
	by barrymore.peterlink.ru (8.9.1/8.9.1) with SMTP id CAA08552
	for <mtd@infradead.org>; Thu, 1 Feb 2001 02:53:56 +0300 (MSK)
Message-ID: <001701c08be1$0c1be0f0$8412f2c3@drakanworkst>
From: "Andrey Glazunov" <lhfrjgtn@peterlink.ru>
To: <mtd@infradead.org>
Subject: lrp booting from M-Systems ISA flash card
Date: Thu, 1 Feb 2001 02:53:42 +0300
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0014_01C08BFA.2FE6E5C0"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0014_01C08BFA.2FE6E5C0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

i have a problem with booting lrp from PC-Flash drive card...
i will try to explain : card with 2Mb of flash EEPROM from M-Systems it =
appear as HardDrive with msdos filesystem and can boot as msdos drive =
well ... so i use syslinux to create linux 'boot sector' on it and copy =
all files from lrp diskette (except syslinux.sys) and correct =
boot=3D/dev/hda1 at syslinux.cfg (as it need to boot lrp from =
harddrive).
Now the problem - system start sucessfully  and load =
root.lrp............. (OK)
then load=20
linux..(hang :(   ) - 2 dots and full-hang - no ctrl-alt-del only =
reset...
when i try to load from diskette (PC-Flash drive card inserted) it loads =
good - i think at least no conflicts with linux code and 'flash-drive' =
code (it takes about 20...40 kb of conventional memory when initialise =
itself)... good...

the main question - i need only boot from this flash card but not use it =
as hardrive (drive),  are there any ideas how to prevent system's hang ? =
may be create some 'additional ramdrive' and copy there all .lrp files =
with kernel and then load from it ? does it mean i need to modify =
syslinux for it ?
i see some patches for 2.2.16 kernel - can they help me or i use =
extremely old flash card and these patches are only for DOC2000 and =
newer ?

thanx for any help.

------=_NextPart_000_0014_01C08BFA.2FE6E5C0
Content-Type: text/html;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Dkoi8-r" http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3103.1000" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3D"Arial CYR" size=3D2>i have a problem with booting lrp =
from=20
PC-Flash drive card...</FONT></DIV>
<DIV><FONT face=3D"Arial CYR" size=3D2>i will try to explain : card with =
2Mb of=20
flash EEPROM from M-Systems it appear as HardDrive with msdos filesystem =
and can=20
boot as msdos drive well ... so i use syslinux to create linux 'boot =
sector' on=20
it and copy all files from lrp diskette (except syslinux.sys) and =
correct=20
boot=3D/dev/hda1 at syslinux.cfg (as it need to boot lrp from=20
harddrive).</FONT></DIV>
<DIV><FONT face=3D"Arial CYR" size=3D2>Now the problem - system start=20
sucessfully&nbsp; and load root.lrp............. (OK)</FONT></DIV>
<DIV><FONT face=3D"Arial CYR" size=3D2>then load </FONT></DIV>
<DIV><FONT face=3D"Arial CYR" size=3D2>linux..(hang :(&nbsp;&nbsp; ) - 2 =
dots and=20
full-hang - no ctrl-alt-del only reset...</FONT></DIV>
<DIV><FONT face=3D"Arial CYR" size=3D2>when i try to load from diskette =
(PC-Flash=20
drive card inserted) it loads good - i think at least no conflicts with =
linux=20
code and 'flash-drive' code (it takes about 20...40 kb of conventional =
memory=20
when initialise itself)... good...</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3D"Arial CYR" size=3D2>the main question - i need only =
boot from=20
this flash card but not use it as hardrive (drive),&nbsp; are there any =
ideas=20
how to prevent system's hang ? may be create some 'additional ramdrive' =
and copy=20
there all .lrp files with kernel and then load from it ? does it mean i =
need to=20
modify syslinux for it ?</FONT></DIV>
<DIV>i see some patches for 2.2.16 kernel - can they help me or i use =
extremely=20
old flash card and these patches are only for DOC2000 and newer ?</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3D"Arial CYR" size=3D2>thanx for any=20
help.</FONT></DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_0014_01C08BFA.2FE6E5C0--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
