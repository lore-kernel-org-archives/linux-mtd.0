Received: from shawidc-mo1.cg.shawcable.net ([24.71.223.10]
	helo=pd5mo3so.prod.shaw.ca)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AYsGZ-0004Rf-T6
	for linux-mtd@lists.infradead.org; Tue, 23 Dec 2003 19:32:28 +0000
Received: from pd3mr1so.prod.shaw.ca (pd3mr1so-ser.prod.shaw.ca
	[10.0.141.177])2003))linux-mtd@lists.infradead.org;
	Tue, 23 Dec 2003 12:25:27 -0700 (MST)
Received: from shaw.ca (pd2ms2so-con.prod.shaw.ca [10.0.122.118])
 by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28 2003))
 with ESMTP id <0HQD00K304MFJL@l-daemon> for linux-mtd@lists.infradead.org;
 Tue, 23 Dec 2003 12:25:27 -0700 (MST)
Date: Tue, 23 Dec 2003 11:25:27 -0800
From: thomaspang@shaw.ca
To: linux-mtd@lists.infradead.org
Message-id: <357032fbc0.2fbc035703@shaw.ca>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-language: en
Content-transfer-encoding: quoted-printable
Content-disposition: inline
Subject: Unable to access JFFS2 filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I repost this message as I do not get any response=2E

I integrated the MTD snapshot dated 2003/12/11 into my linux kernel 2=2E4=
=2E22=2E

Couple questions=3A

-  cfi=5Fcmdset=5F0002=3A Disabling fast programming due to code brokenne=
ss=2E  Any patch to cfi=5Fcmdset=5F0002=2Ec to fix this=2E

- What may be causes of those jffs2=5Fscan=5Feraseblock()=3A Mgaic bitmas=
k 0x1985 not found at =2E=2E=2E=3F   I have browsed the linux-mtd thread =
and still haven=27t figured it out=2E

- When I accessed the mounted JFFS2 file system=2C I got =22Chip not read=
y after erase suspended=22=2E  Subsequent access gives =22Input/output er=
ror=22=2E

Your help is greatly appreciated=2E


I turned on the CFI debugging flag and below show the detailed informatio=
n of the flash that I am using=2E

Number of erase regions=3A 3
Primary Vendor Command Set=3A 0002 (AMD/Fujitsu Standard)
Primary Algorithm Table at 0040
Alternative Vendor Command Set=3A 0000 (None)
No Alternate Algorithm Table
Vcc Minimum=3A  2=2E7 V
Vcc Maximum=3A  3=2E6 V
No Vpp line
Typical byte/word write timeout=3A 16 =B5s
Maximum byte/word write timeout=3A 512 =B5s
Full buffer write not supported
Typical block erase timeout=3A 1024 ms
Maximum block erase timeout=3A 16384 ms
Chip erase not supported
Device size=3A 0x800000 bytes (8 MiB)
Flash Device Interface description=3A 0x0002
  - supports x8 and x16 via BYTE=23 with asynchronous interface
Max=2E bytes in buffer write=3A 0x1
Number of Erase Block Regions=3A 3
  Erase Region =230=3A BlockSize 0x2000 bytes=2C 8 blocks
  Erase Region =231=3A BlockSize 0x10000 bytes=2C 126 blocks
  Erase Region =232=3A BlockSize 0x2000 bytes=2C 8 blocks
phys=5Fmapped=5Fflash=3A Found 1 x16 devices at 0x0 in 16-bit mode

phys=5Fmapped=5Fflash=3A Found 1 x16 devices at 0x2000000 in 16-bit mode
 Amd/Fujitsu Extended Query Table at 0x0040
  Silicon revision=3A 2
  Address sensitive unlock=3A Required
  Erase Suspend=3A Read/write
  Block protection=3A 1 sectors per group
  Temporary block unprotect=3A Supported
  Block protect/unprotect scheme=3A 4
  Number of simultaneous operations=3A 119
  Burst mode=3A Not supported
  Page mode=3A Not supported
  Vpp Supply Minimum Program/Erase Voltage=3A 8=2E5 V
  Vpp Supply Maximum Program/Erase Voltage=3A 9=2E5 V
  Top/Bottom Boot Block=3A 8x8KiB sectors at top =26 bottom=2C no WP
phys=5Fmapped=5Fflash=3A CFI does not contain boot bank location=2E Assum=
ing top=2E
number of CFI chips=3A 2
Using word write method
cfi=5Fcmdset=5F0002=3A Disabling fast programming due to code brokenness=2E=

=2E=2E=2E
Using physmap partition definition
Creating 4 MTD partitions on =22phys=5Fmapped=5Fflash=22=3A
0x00000000-0x00800000 =3A =22Physically mapped flash=22
mtd=3A Giving out device 0 to Physically mapped flash
0x00000000-0x00400000 =3A =22boot=22
mtd=3A Giving out device 1 to boot
0x00400000-0x00500000 =3A =22root=22
mtd=3A Giving out device 2 to root
0x00500000-0x00800000 =3A =22fs=22
mtd=3A Giving out device 3 to fs
NET4=3A Linux TCP/IP 1=2E0 for NET4=2E0
IP Protocols=3A ICMP=2C UDP=2C TCP
IP=3A routing cache hash table of 512 buckets=2C 4Kbytes
TCP=3A Hash tables configured (established 512 bind 512)
NET4=3A Unix domain sockets 1=2E0/SMP for Linux NET4=2E0=2E
Fast Floating Point Emulator V0=2E9 (c) Peter Teichmann=2E
mtdblock=5Fopen
ok
VFS=3A Mounted root (cramfs filesystem)=2E
Freeing init memory=3A 48K
init started=3A  BusyBox v0=2E60=2E5 (2003=2E12=2E11-19=3A24+0000) multi-=
call binary

=2E=2E=2E

The system is successfully booted up=2E

=23 uname -a
Linux (none) 2=2E4=2E22 =2367 Tue Dec 23 10=3A50=3A28 PST 2003 armv5EJb u=
nknown

=23 more /proc/mtd
dev=3A    size   erasesize  name
mtd0=3A 00800000 00010000 =22Physically mapped flash=22
mtd1=3A 00400000 00010000 =22boot=22
mtd2=3A 00100000 00010000 =22root=22
mtd3=3A 00300000 00010000 =22fs=22

=23 mount -t jffs2 /dev/mtdblock3 /mnt
mtdblock=5Fopen
ok
jffs2=5Fscan=5Feraseblock()=3A Magic bitmask 0x1985 not found at 0x000510=
00=3A 0xc38f instead
jffs2=5Fscan=5Feraseblock()=3A Magic bitmask 0x1985 not found at 0x000510=
04=3A 0xfa34 instead
jffs2=5Fscan=5Feraseblock()=3A Magic bitmask 0x1985 not found at 0x000510=
08=3A 0x18d9 instead
jffs2=5Fscan=5Feraseblock()=3A Magic bitmask 0x1985 not found at 0x000510=
0c=3A 0xea31 instead
jffs2=5Fscan=5Feraseblock()=3A Magic bitmask 0x1985 not found at 0x000510=
10=3A 0xd01e instead
jffs2=5Fscan=5Feraseblock()=3A Magic bitmask 0x1985 not found at 0x000510=
14=3A 0x3a50 instead
jffs2=5Fscan=5Feraseblock()=3A Magic bitmask 0x1985 not found at 0x000510=
18=3A 0xc271 instead
jffs2=5Fscan=5Feraseblock()=3A Magic bitmask 0x1985 not found at 0x000510=
1c=3A 0x017f instead
jffs2=5Fscan=5Feraseblock()=3A Magic bitmask 0x1985 not found at 0x000510=
20=3A 0x7a20 instead
jffs2=5Fscan=5Feraseblock()=3A Magic bitmask 0x1985 not found at 0x000510=
24=3A 0x9eb2 instead
Further such events for this erase block will not be printed
=23 cd mnt
=23 ls
Chip not ready after erase suspended=3A status =3D 0x1985
error -5 reading node at 0x0000003c in get=5Finode=5Fnodes()
jffs2=5Fget=5Finode=5Fnodes() for ino 2 returned -5
ls=3A =2E/20031209=3A Input/output error
Chip not ready after erase suspended=3A status =3D 0x1985
error -5 reading node at 0x00000278 in get=5Finode=5Fnodes()
jffs2=5Fget=5Finode=5Fnodes() for ino 3 returned -5
ls=3A =2E/20031210=3A Input/output error
Chip not ready after erase suspended=3A status =3D 0x1985
error -5 reading node at 0x000006cc in get=5Finode=5Fnodes()
jffs2=5Fget=5Finode=5Fnodes() for ino 4 returned -5
ls=3A =2E/20031211=3A Input/output error
Chip not ready after erase suspended=3A status =3D 0x1985
error -5 reading node at 0x00000af0 in get=5Finode=5Fnodes()
jffs2=5Fget=5Finode=5Fnodes() for ino 5 returned -5
ls=3A =2E/20031217=3A Input/output error
Chip not ready after erase suspended=3A status =3D 0x1985
error -5 reading node at 0x00001254 in get=5Finode=5Fnodes()
jffs2=5Fget=5Finode=5Fnodes() for ino 6 returned -5
ls=3A =2E/20031218=3A Input/output error
Chip not ready after erase suspended=3A status =3D 0x1985
error -5 reading node at 0x00001524 in get=5Finode=5Fnodes()
jffs2=5Fget=5Finode=5Fnodes() for ino 7 returned -5
ls=3A =2E/20031219=3A Input/output error
=23 ls
ls=3A =2E/20031209=3A Input/output error
ls=3A =2E/20031210=3A Input/output error
ls=3A =2E/20031211=3A Input/output error
ls=3A =2E/20031217=3A Input/output error
ls=3A =2E/20031218=3A Input/output error
ls=3A =2E/20031219=3A Input/output error


(Please note that 2003XXXX are simply plain text files in the JFFS2 files=
ystem)



- Thomas
