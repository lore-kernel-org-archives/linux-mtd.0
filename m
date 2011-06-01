Received: from nm7.bullet.mail.sp2.yahoo.com ([98.139.91.77])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QRgIf-0001UA-OV
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 07:57:11 +0000
Message-ID: <891190.21758.qm@web30201.mail.mud.yahoo.com>
Date: Wed, 1 Jun 2011 00:57:07 -0700 (PDT)
From: Lars Michael <lh_post@yahoo.com>
Subject: U-Boot: using nand write to flash an ubi image, ubi part fails
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,=0A=0AUsing mkfs.ubifs and ubinize I have created an image with 5 vol=
umes. In Linux I could flash it using "ubiformat /dev/mtd1 -f /root/ubi.img=
" and attach it using "ubiattach /dev/ubi_ctrl -m 1". It worked.=0A=0AIn pr=
oduction I would prefer to write the image from U-Boot. So in U-Boot I used=
 "nand erase" then "nand write" to flash the image. Then I want to attach b=
y "ubi part" command - but this fails: "UBI error: ubi_init: UBI error: can=
not initialize UBI, error -17"=0A=0AThen I booted Linux (via nfs) and tried=
 to re-format+attach, but now it fails. Format complains about eraseblock c=
ontents and missing erase counters: =0A=0Aubiformat: warning!: 1099 of 2036=
 eraseblocks contain non-ubifs data=0Aubiformat: warning!: only 937 of 2036=
 eraseblocks have valid erase counter=0A=0AThe ubiattach now reports lots o=
f:=0A...=0AUBI error: check_corruption: PEB 0 contains corrupted VID header=
, and the data does not contain all 0xFF, this may be a non-UBI PEB or a se=
vere VID header corruption which requires manual inspection=0A=0AUBI warnin=
g: process_eb: valid VID header but corrupted EC header at PEB 4=0A...=0A=
=0AI realize that the U-Boot 'nand erase' does not preserve the erase count=
ers. So what would be the correct way to erase and write in U-Boot? And why=
 is the ubiformat not able to correct the problems?=0A=0AMy kernel is 2.6.2=
9 patched with 165 patched from the ubi back port tree.=0AU-Boot is 2009.08=
 with ubifs support, but I am not sure if there are relevant patches. The C=
PU is a v4 ColdFire and 256MB Micron NAND.=0A=0AAny help is appreciated, th=
anks. Below are the detailed listing:=0A=0A=0A-> mtd=0A=0Adevice nand0 <NAN=
D>, # parts =3D 2=0A #: name=09=09size=09=09offset=09=09mask_flags=0A 0: u-=
boot              0x00100000=090x00000000=090=0A 1: ubi                 0x0=
ff00000=090x00100000=090=0A=0Aactive partition: nand0,0 - (u-boot) 0x001000=
00 @ 0x00000000=0A=0Adefaults:=0Amtdids  : nand0=3DNAND=0Amtdparts: mtdpart=
s=3DNAND:1m(u-boot),-(ubi)=0A=0A-> nand erase ubi=0A=0ANAND erase: device 0=
 offset 0x100000, size 0xff00000=0AErasing at 0x100000 --   0% complete.=0A=
<cut>=0AErasing at 0xfd60000 --  99% complete.=0ASkipping bad block at  0x0=
ff80000                                          =0A=0ASkipping bad block a=
t  0x0ffa0000                                          =0A=0ASkipping bad b=
lock at  0x0ffc0000                                          =0A=0ASkipping=
 bad block at  0x0ffe0000                                          =0A=0AOK=
=0A=0AUsing FEC0 device=0ATFTP from server 10.28.151.113; our IP address is=
 10.28.151.112=0AFilename '/twr5441x/ubi.img'.=0ALoad address: 0x40010000=
=0ALoading: *=08###########################################################=
######=0A=09 ##############################################################=
###=0A<cut>=0A=09 #########################################################=
########=0A=09 ########################################################=0Ad=
one=0ABytes transferred =3D 58064896 (3760000 hex)=0A-> md 40010000 100=0A=
=0A40010000: 55424923 01000000 00000000 00000000    UBI#............=0A4001=
0010: 00000800 00001000 27162ae3 00000000    ........'.*.....=0A40010020: 0=
0000000 00000000 00000000 00000000    ................=0A40010030: 00000000=
 00000000 00000000 7d780a89    ............}x..=0A40010040: ffffffff ffffff=
ff ffffffff ffffffff    ................=0A<cut>=0A400113f0: 00000000 00000=
000 00000000 00000000    ................=0A-> nand write ${loadaddr} 10000=
0 ${filesize}=0A=0ANAND write: device 0 offset 0x100000, size 0x3760000=0A =
58064896 bytes written: OK=0A-> ubi part ubi=0A=0ACreating 1 MTD partitions=
 on "nand0":=0A0x000000100000-0x000010000000 : "mtd=3D1"=0AUBI: attaching m=
td1 to ubi0=0AUBI: physical eraseblock size:   131072 bytes (128 KiB)=0AUBI=
: logical eraseblock size:    126976 bytes=0AUBI: smallest flash I/O unit: =
   2048=0AUBI: VID header offset:          2048 (aligned 2048)=0AUBI: data =
offset:                4096=0AUBI warning: process_lvol: volume table copy =
#1 is corrupted=0AUBI: create volume table (copy #1)=0AUBI: volume table wa=
s restored=0AUBI: volume 5 ("datafs") re-sized from 133 to 1316 LEBs=0AUBI:=
 attached mtd1 to ubi0=0AUBI: MTD device name:            "mtd=3D1"=0AUBI: =
MTD device size:            255 MiB=0AUBI: number of good PEBs:        2036=
=0AUBI: number of bad PEBs:         4=0AUBI: max. allowed volumes:       12=
8=0AUBI: wear-leveling threshold:    4096=0AUBI: number of internal volumes=
: 1=0AUBI: number of user volumes:     5=0AUBI: available PEBs:            =
 0=0AUBI: total number of reserved PEBs: 2036=0AUBI: number of PEBs reserve=
d for bad PEB handling: 20=0AUBI: max/mean erase counter: 5/0=0AUBI error: =
ubi_init: cannot attach mtd1=0AUBI: mtd1 is detached from ubi0=0AUBI error:=
 ubi_init: UBI error: cannot initialize UBI, error -17=0AUBI init error -17=
=0Aexit not allowed from main input shell.=0A=0A------------------=0A=0A[ro=
ot@M54418TWR root]# ubiformat /dev/mtd1 -f /root/ubi.img=0Aubiformat: mtd1 =
(NAND), size 267386880 bytes (255.0 MiB), 131072 eraseblocks of 131072 byte=
s (128.0 KiB), min. I/O size 2048 bytes=0A=0Alibscan: scanning eraseblock 0=
 --  0 % complete  =0A...=0Alibscan: scanning eraseblock 2039 -- 100 % comp=
lete  =0Aubiformat: 303 eraseblocks have valid erase counter, mean value is=
 0=0Aubiformat: 643 eraseblocks are supposedly empty=0Aubiformat: bad erase=
blocks: 2036, 2037, 2038, 2039=0Aubiformat: warning!: 1090 of 2036 eraseblo=
cks contain non-ubifs data=0Aubiformat: continue? (yes/no)  yes=0Aubiformat=
: warning!: only 303 of 2036 eraseblocks have valid erase counter=0Aubiform=
at: erase counter 0 will be used for all eraseblocks=0Aubiformat: note, arb=
itrary erase counter value may be specified using -e option=0Aubiformat: co=
ntinue? (yes/no)  yes=0Aubiformat: use erase counter 0 for all eraseblocks=
=0A=0Aubiformat: flashing eraseblock 0 --  0 % complete  =0A...=0Aubiformat=
: flashing eraseblock 442 -- 100 % complete  =0A=0Aubiformat: formatting er=
aseblock 443 --  0 % complete  =0A...=0Aubiformat: formatting eraseblock 20=
39 -- 100 % complete  =0A=0A[root@M54418TWR root]# ubiattach /dev/ubi_ctrl =
-m 1=0AUBI: attaching mtd1 to ubi0=0A=0AUBI: physical eraseblock size:   13=
1072 bytes (128 KiB)=0A=0AUBI: logical eraseblock size:    126976 bytes=0A=
=0AUBI: smallest flash I/O unit:    2048=0A=0AUBI: VID header offset:      =
    2048 (aligned 2048)=0A=0AUBI: data offset:                4096=0A=0AUBI=
 error: check_corruption: PEB 0 contains corrupted VID header, and the data=
 does not contain all 0xFF, this may be a non-UBI PEB or a severe VID heade=
r corruption which requires manual inspection=0A=0AUBI warning: process_eb:=
 valid VID header but corrupted EC header at PEB 4=0A=0AUBI warning: proces=
s_eb: valid VID header but corrupted EC header at PEB 7=0A=0AUBI warning: p=
rocess_eb: valid VID header but corrupted EC header at PEB 8=0A=0AUBI warni=
ng: process_eb: valid VID header but corrupted EC header at PEB 12=0A=0AUBI=
 error: check_corruption: PEB 16 contains corrupted VID header, and the dat=
a does not contain all 0xFF, this may be a non-UBI PEB or a severe VID head=
er corruption which requires manual inspection=0A=0AUBI warning: process_eb=
: valid VID header but corrupted EC header at PEB 22=0A=0A...=0A=0A=0AThank=
s,=0A=0A- Lars=0A
