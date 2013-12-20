Received: from snt0-omc1-s6.snt0.hotmail.com ([65.55.90.17])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vu9wO-0003LN-8A
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 23:57:13 +0000
Message-ID: <SNT149-W87D22A89185B79CBEDFA3A84C40@phx.gbl>
From: C J <ccs_dba@hotmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Learning
Date: Fri, 20 Dec 2013 16:56:50 -0700
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi=2C newbie here (sorry).. trying to read and learn but haven't found =0A=
everything I'm looking for yet.=A0 I have a small 'ARMv7 Processor rev 2 =
=0A=
(v7l)' powered box running Ubuntu 10.04 LTS with kernel 2.6.37=A0=A0 The =
=0A=
environment is a squashfs rootfs with a small RW config area:=0A=
=0A=
# df=0A=
Filesystem=A0 =A0=A0 =A0 1K-blocks=A0=A0=A0=A0=A0 Used Available Use% Mount=
ed on=0A=
/dev/mtdblock11=A0=A0=A0=A0 246664=A0=A0=A0 246664=A0=A0=A0=A0=A0=A0=A0=A0 =
0 100% /=0A=
ubi1_0=A0=A0=A0=A0=A0=A0 =A0 =A0=A0=A0=A0=A0=A0 6648=A0=A0=A0=A0=A0=A0 100=
=A0=A0=A0=A0=A0 6548=A0=A0 2% /.profile=0A=
=0A=
There=0A=
 are other /dev/mtd devices but I don't know how to mount/view them to =0A=
see what is there.=A0 I've been reading the mtd and ubi/ubifs info on the =
=0A=
web site=2C and feel like I am dangerous enough to do damage :)=A0 but don'=
t=0A=
 want to.. (initially just want to backup what is there and be able to =0A=
modify the roots=2C and understand how it all works in the process (boot =
=0A=
process=2C possibly replacing kernel=2C etc))=0A=
=0A=
I've tried to use the =0A=
ubiattach command to attach to the other mtd devices but only mtd0 so =0A=
far will attach but I don't see a volume there so don't know what to =0A=
do..=A0 Looking for a little help to know how to see what is on these =0A=
other volumes/devices.=A0 Here is some info about my system:=0A=
=0A=
# /usr/sbin/mtdinfo -a=0A=
Count of MTD devices:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 12=0A=
Present MTD devices:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mtd0=2C mtd1=2C mtd2=
=2C mtd3=2C mtd4=2C mtd5=2C mtd6=2C mtd7=2C mtd8=2C mtd9=2C mtd10=2C mtd11=
=0A=
Sysfs interface supported:=A0=A0=A0=A0=A0 yes=0A=
=0A=
mtd0=0A=
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 mlo=0A=
Type:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nand=0A=
Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes=
=2C 128.0 KiB=0A=
Amount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 4 (524288 bytes=2C 512.0 =
KiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 bytes=
=0A=
OOB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 64 bytes=0A=
Character device major/minor:=A0=A0 90:0=0A=
Bad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Device is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
=0A=
mtd1=0A=
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 uboot-1=0A=
Type:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nand=0A=
Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes=
=2C 128.0 KiB=0A=
Amount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 8 (1048576 bytes=2C 1024.=
0 KiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 bytes=
=0A=
OOB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 64 bytes=0A=
Character device major/minor:=A0=A0 90:2=0A=
Bad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Device is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
=0A=
mtd2=0A=
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 uboot-2=0A=
Type:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nand=0A=
Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes=
=2C 128.0 KiB=0A=
Amount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 8 (1048576 bytes=2C 1024.=
0 KiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 bytes=
=0A=
OOB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 64 bytes=0A=
Character device major/minor:=A0=A0 90:4=0A=
Bad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Device is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
=0A=
mtd3=0A=
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 u-boot-env=0A=
Type:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nand=0A=
Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes=
=2C 128.0 KiB=0A=
Amount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 16 (2097152 bytes=2C 2.0 =
MiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 bytes=
=0A=
OOB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 64 bytes=0A=
Character device major/minor:=A0=A0 90:6=0A=
Bad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Device is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
=0A=
mtd4=0A=
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 kernel=0A=
Type:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nand=0A=
Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes=
=2C 128.0 KiB=0A=
Amount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 96 (12582912 bytes=2C 12.=
0 MiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 bytes=
=0A=
OOB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 64 bytes=0A=
Character device major/minor:=A0=A0 90:8=0A=
Bad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Device is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
=0A=
mtd5=0A=
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 initrd=0A=
Type:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nand=0A=
Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes=
=2C 128.0 KiB=0A=
Amount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 96 (12582912 bytes=2C 12.=
0 MiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 bytes=
=0A=
OOB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 64 bytes=0A=
Character device major/minor:=A0=A0 90:10=0A=
Bad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Device is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
=0A=
mtd6=0A=
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 miniinitrd=0A=
Type:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nand=0A=
Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes=
=2C 128.0 KiB=0A=
Amount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 80 (10485760 bytes=2C 10.=
0 MiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 bytes=
=0A=
OOB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 64 bytes=0A=
Character device major/minor:=A0=A0 90:12=0A=
Bad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Device is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
=0A=
mtd7=0A=
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 atb-1=0A=
Type:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nand=0A=
Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes=
=2C 128.0 KiB=0A=
Amount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 160 (20971520 bytes=2C 20=
.0 MiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 bytes=
=0A=
OOB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 64 bytes=0A=
Character device major/minor:=A0=A0 90:14=0A=
Bad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Device is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
=0A=
mtd8=0A=
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 atb-2=0A=
Type:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nand=0A=
Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes=
=2C 128.0 KiB=0A=
Amount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 160 (20971520 bytes=2C 20=
.0 MiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 bytes=
=0A=
OOB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 64 bytes=0A=
Character device major/minor:=A0=A0 90:16=0A=
Bad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Device is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
=0A=
mtd9=0A=
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 profile=0A=
Type:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nand=0A=
Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes=
=2C 128.0 KiB=0A=
Amount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 80 (10485760 bytes=2C 10.=
0 MiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 bytes=
=0A=
OOB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 64 bytes=0A=
Character device major/minor:=A0=A0 90:18=0A=
Bad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Device is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
=0A=
mtd10=0A=
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 backup=0A=
Type:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nand=0A=
Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes=
=2C 128.0 KiB=0A=
Amount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 320 (41943040 bytes=2C 40=
.0 MiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 bytes=
=0A=
OOB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 64 bytes=0A=
Character device major/minor:=A0=A0 90:20=0A=
Bad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Device is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
=0A=
mtd11=0A=
Name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 root-fs=0A=
Type:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nand=0A=
Eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes=
=2C 128.0 KiB=0A=
Amount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 3068 (402128896 bytes=2C =
383.5 MiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 512 bytes=
=0A=
OOB size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 64 bytes=0A=
Character device major/minor:=A0=A0 90:22=0A=
Bad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
Device is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=
=0A=
=0A=
# /usr/sbin/ubinfo -a=0A=
UBI version:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
Count of UBI devices:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
UBI control device major/minor: 10:63=0A=
Present UBI devices:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ubi1=0A=
=0A=
ubi1=0A=
Volumes count:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 1=0A=
Logical eraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 12=
6976 bytes=2C 124.0 KiB=0A=
Total amount of logical eraseblocks:=A0=A0=A0=A0 80 (10158080 bytes=2C 9.7 =
MiB)=0A=
Amount of available logical eraseblocks: 0 (0 bytes)=0A=
Maximum count of volumes=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 12=
8=0A=
Count of bad physical eraseblocks:=A0=A0=A0=A0=A0=A0 0=0A=
Count of reserved physical eraseblocks:=A0 2=0A=
Current maximum erase counter value:=A0=A0=A0=A0 14=0A=
Minimum input/output unit size:=A0=A0=A0=A0=A0=A0=A0=A0=A0 2048 bytes=0A=
Character device major/minor:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 251:0=0A=
Present volumes:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0=0A=
=0A=
Volume ID:=A0=A0 0 (on ubi1)=0A=
Type:=A0=A0=A0=A0=A0=A0=A0 dynamic=0A=
Alignment:=A0=A0 1=0A=
Size:=A0=A0=A0=A0=A0=A0=A0 74 LEBs (9396224 bytes=2C 9.0 MiB)=0A=
State:=A0=A0=A0=A0=A0=A0 OK=0A=
Name:=A0=A0=A0=A0=A0=A0=A0 profile=0A=
Character device major/minor: 251:1=0A=
=0A=
=0A=
# ls -l /dev | egrep "mtd|ubi"=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0=A0 0 Jan=A0 1=A0 2000 mtd0=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0=A0 1 Jan=A0 1=A0 2000 mtd0ro=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0=A0 2 Jan=A0 1=A0 2000 mtd1=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0 20 Jan=A0 1=A0 2000 mtd10=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0 21 Jan=A0 1=A0 2000 mtd10ro=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0 22 Jan=A0 1=A0 2000 mtd11=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0 23 Jan=A0 1=A0 2000 mtd11ro=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0=A0 3 Jan=A0 1=A0 2000 mtd1ro=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0=A0 4 Jan=A0 1=A0 2000 mtd2=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0=A0 5 Jan=A0 1=A0 2000 mtd2ro=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0=A0 6 Jan=A0 1=A0 2000 mtd3=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0=A0 7 Jan=A0 1=A0 2000 mtd3ro=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0=A0 8 Jan=A0 1=A0 2000 mtd4=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0=A0 9 Jan=A0 1=A0 2000 mtd4ro=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0 10 Jan=A0 1=A0 2000 mtd5=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0 11 Jan=A0 1=A0 2000 mtd5ro=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0 12 Jan=A0 1=A0 2000 mtd6=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0 13 Jan=A0 1=A0 2000 mtd6ro=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0 14 Jan=A0 1=A0 2000 mtd7=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0 15 Jan=A0 1=A0 2000 mtd7ro=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0 16 Jan=A0 1=A0 2000 mtd8=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0 17 Jan=A0 1=A0 2000 mtd8ro=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0 18 Jan=A0 1=A0 2000 mtd9=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 90=2C=A0 19 Jan=A0 1=A0 2000 mtd9ro=0A=
brw-rw---- 1 root disk=A0=A0=A0=A0 31=2C=A0=A0 0 Jan=A0 1=A0 2000 mtdblock0=
=0A=
brw-rw---- 1 root disk=A0=A0=A0=A0 31=2C=A0=A0 1 Jan=A0 1=A0 2000 mtdblock1=
=0A=
brw-rw---- 1 root disk=A0=A0=A0=A0 31=2C=A0 10 Jan=A0 1=A0 2000 mtdblock10=
=0A=
brw-rw---- 1 root disk=A0=A0=A0=A0 31=2C=A0 11 Jan=A0 1=A0 2000 mtdblock11=
=0A=
brw-rw---- 1 root disk=A0=A0=A0=A0 31=2C=A0=A0 2 Jan=A0 1=A0 2000 mtdblock2=
=0A=
brw-rw---- 1 root disk=A0=A0=A0=A0 31=2C=A0=A0 3 Jan=A0 1=A0 2000 mtdblock3=
=0A=
brw-rw---- 1 root disk=A0=A0=A0=A0 31=2C=A0=A0 4 Jan=A0 1=A0 2000 mtdblock4=
=0A=
brw-rw---- 1 root disk=A0=A0=A0=A0 31=2C=A0=A0 5 Jan=A0 1=A0 2000 mtdblock5=
=0A=
brw-rw---- 1 root disk=A0=A0=A0=A0 31=2C=A0=A0 6 Jan=A0 1=A0 2000 mtdblock6=
=0A=
brw-rw---- 1 root disk=A0=A0=A0=A0 31=2C=A0=A0 7 Jan=A0 1=A0 2000 mtdblock7=
=0A=
brw-rw---- 1 root disk=A0=A0=A0=A0 31=2C=A0=A0 8 Jan=A0 1=A0 2000 mtdblock8=
=0A=
brw-rw---- 1 root disk=A0=A0=A0=A0 31=2C=A0=A0 9 Jan=A0 1=A0 2000 mtdblock9=
=0A=
lrwxrwxrwx 1 root root=A0=A0=A0=A0=A0=A0=A0=A0=A0 10 Jan=A0 1=A0 2000 root =
-> mtdblock11=0A=
crw-rw---- 1 root root=A0=A0=A0 251=2C=A0=A0 0 Jan=A0 1=A0 2000 ubi1=0A=
crw-rw---- 1 root root=A0=A0=A0 251=2C=A0=A0 1 Jan=A0 1=A0 2000 ubi1_0=0A=
crw-rw---- 1 root root=A0=A0=A0=A0 10=2C=A0 63 Jan=A0 1=A0 2000 ubi_ctrl=0A=
=0A=
any help is greatly appreciated.. 		 	   		  =
