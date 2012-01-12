Received: from nm36-vm6.bullet.mail.ne1.yahoo.com ([98.138.229.118])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RlLgs-0000nZ-5l
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2012 14:31:42 +0000
Message-ID: <1326378700.30000.YahooMailNeo@web121503.mail.ne1.yahoo.com>
Date: Thu, 12 Jan 2012 06:31:40 -0800 (PST)
From: Karsten Jeppesen <arm9263@yahoo.com>
Subject: Corrupted UBIFS, bad CRC
To: ubifs <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Reply-To: Karsten Jeppesen <arm9263@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi again,=0A=0AMaybe I should include all info you require, but sometimes t=
he brain is slower than the right pinkie....=0A=0A...=0A* run the MTD tests=
 to validate your flash=0ADone - nothing to report=0A=0A* enable the UBIFS =
extra self checks and try to reproduce the problem.=0ANot possible ??? =0A=
=0A# echo 3 > /sys/module/ubifs/=0Auevent=A0=A0 version=0A... no parameters=
 folder=0A=0A* make sure you use up-to-date UBIFS=0ASorry - best I can do r=
ight now is the 3.2.0 kernel. Is that ok?=0A=0A* make sure you have compile=
d the kernel symbols in =0A=0A# CONFIG_SYSCTL_SYSCALL is not set=0ACONFIG_K=
ALLSYMS=3Dy=0ACONFIG_KALLSYMS_ALL=3Dy=0ACONFIG_HOTPLUG=3Dy=0A=0A=0A* mark t=
he Enable debugging support =0A=0ACONFIG_UBIFS_FS=3Dy=0A# CONFIG_UBIFS_FS_X=
ATTR is not set=0A# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set=0ACONFIG_UBIF=
S_FS_LZO=3Dy=0ACONFIG_UBIFS_FS_ZLIB=3Dy=0ACONFIG_UBIFS_FS_DEBUG=3Dy=0A=0A=
=0A* include all the messages UBIFS prints=0A# dmesg -n8=0A# ubiattach /dev=
/ubi_ctrl -m 4=0AUBI: attaching mtd4 to ubi0=0AUBI: physical eraseblock siz=
e:=A0=A0 131072 bytes (128 KiB)=0AUBI: logical eraseblock size:=A0=A0=A0 13=
0944 bytes=0AUBI: smallest flash I/O unit:=A0=A0=A0 1=0AUBI: VID header off=
set:=A0=A0=A0=A0=A0=A0=A0=A0=A0 64 (aligned 64)=0AUBI: data offset:=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 128=0AUBI: max. sequence number:=A0=
=A0=A0=A0=A0=A0 17653=0AUBI: attached mtd4 to ubi0=0AUBI: MTD device name:=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "User"=0AUBI: MTD device size:=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 28 MiB=0AUBI: number of good PEBs:=A0=A0=A0=A0=A0=
=A0=A0 230=0AUBI: number of bad PEBs:=A0=A0=A0=A0=A0=A0=A0=A0 0=0AUBI: numb=
er of corrupted PEBs:=A0=A0 0=0AUBI: max. allowed volumes:=A0=A0=A0=A0=A0=
=A0 128=0AUBI: wear-leveling threshold:=A0=A0=A0 4096=0AUBI: number of inte=
rnal volumes: 1=0AUBI: number of user volumes:=A0=A0=A0=A0 1=0AUBI: availab=
le PEBs:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=0AUBI: total number of reser=
ved PEBs: 230=0AUBI: number of PEBs reserved for bad PEB handling: 0=0AUBI:=
 max/mean erase counter: 31/5=0AUBI: image sequence number:=A0 1704669600=
=0AUBI: background thread "ubi_bgt0d" started, PID 6374=0AUBI device number=
 0, total 230 LEBs (30117120 bytes, 28.7 MiB), available 0 LEBs (0 bytes), =
LEB size 130944 bytes (127.9 KiB)=0A# mkdir -p /skov/mnt/rootfs=0A# mount -=
t ubifs ubi0:rootfs /skov/mnt/rootfs=0AUBIFS: recovery needed=0AUBIFS error=
 (pid 6700): ubifs_recover_leb: corrupt empty space LEB 4:0, corruption sta=
rts at 144=0AUBIFS error (pid 6700): ubifs_scanned_corruption: corruption a=
t LEB 4:144=0AUBIFS error (pid 6700): ubifs_scanned_corruption: first 8192 =
bytes from LEB 4:144=0A00000000: 00000000 00000000 00000000 00000000 ffffff=
ff ffffffff ffffffff ffffffff=A0 ................................=0A0000002=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
=A0 ................................=0A...many lines of ffffff=0A00001fc0: =
ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=A0 =
................................=0A00001fe0: ffffffff ffffffff ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff=A0 ..............................=
..=0AUBIFS error (pid 6700): ubifs_recover_leb: LEB 4 scanning failed=0Amou=
nt: mounting ubi0:rootfs on /skov/mnt/rootfs failed: Structure needs cleani=
ng=0A#=0A=0A=0A* explicitly tell about whether you did any checking=0AThe U=
BI config looks like this:=0ACONFIG_MTD_UBI=3Dy=0ACONFIG_MTD_UBI_WL_THRESHO=
LD=3D4096=0ACONFIG_MTD_UBI_BEB_RESERVE=3D1=0A# CONFIG_MTD_UBI_GLUEBI is not=
 set=0A# CONFIG_MTD_UBI_DEBUG is not set=0A=0A=0A* describe your flash devi=
ce=0A# mtdinfo -a=0ACount of MTD devices:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5=
=0APresent MTD devices:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mtd0, mtd1, mtd2, =
mtd3, mtd4=0ASysfs interface supported:=A0=A0=A0=A0=A0 yes=0A=0Amtd0=0AName=
:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 u-boot=0AType:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 nor=0AEraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 131072 bytes, 128.0 KiB=0AAmount of eraseblocks:=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 3 (393216 bytes, 384.0 KiB)=0AMinimum input/output un=
it size: 1 byte=0ASub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 1 byte=0ACharacter device major/minor:=A0=A0 90:0=0ABad blocks ar=
e allowed:=A0=A0=A0=A0=A0=A0=A0=A0 false=0ADevice is writable:=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=0Amtd1=0AName:=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Env=0AType:=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nor=0AEr=
aseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes, 1=
28.0 KiB=0AAmount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 (131072 byte=
s, 128.0 KiB)=0AMinimum input/output unit size: 1 byte=0ASub-page size:=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 byte=0ACharacter device =
major/minor:=A0=A0 90:2=0ABad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 f=
alse=0ADevice is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=0Amt=
d2=0AName:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 Linux=0AType:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nor=0AEraseblock size:=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes, 128.0 KiB=0AAmount of eraseblocks=
:=A0=A0=A0=A0=A0=A0=A0=A0=A0 16 (2097152 bytes, 2.0 MiB)=0AMinimum input/ou=
tput unit size: 1 byte=0ASub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 1 byte=0ACharacter device major/minor:=A0=A0 90:4=0ABad blo=
cks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 false=0ADevice is writable:=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=0Amtd3=0AName:=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Bmp_Image=0AType:=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 nor=0AEraseblock size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131=
072 bytes, 128.0 KiB=0AAmount of eraseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 6 =
(786432 bytes, 768.0 KiB)=0AMinimum input/output unit size: 1 byte=0ASub-pa=
ge size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 byte=0ACharac=
ter device major/minor:=A0=A0 90:6=0ABad blocks are allowed:=A0=A0=A0=A0=A0=
=A0=A0=A0 false=0ADevice is writable:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 t=
rue=0A=0Amtd4=0AName:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 User=0AType:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nor=0AEraseblock size:=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 131072 bytes, 128.0 KiB=0AAmount of er=
aseblocks:=A0=A0=A0=A0=A0=A0=A0=A0=A0 230 (30146560 bytes, 28.8 MiB)=0AMini=
mum input/output unit size: 1 byte=0ASub-page size:=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 1 byte=0ACharacter device major/minor:=A0=A0 90=
:8=0ABad blocks are allowed:=A0=A0=A0=A0=A0=A0=A0=A0 false=0ADevice is writ=
able:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 true=0A=0A=0A* describe how the p=
roblem can be reproduced=0AI have 16 machines running powercycle 20secs-on =
3secs-off. In 24=A0 hrs roughly 2 will fail this way.=0A=0A=0ANow I think I=
 have added all I could think of.=0A=0ASincerely,=0ADr. Karsten Jeppesen
