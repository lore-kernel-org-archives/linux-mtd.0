Received: from smtp.imp.bg.ac.yu ([147.91.50.101])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G8bFA-0003YM-3R
	for linux-mtd@lists.infradead.org; Thu, 03 Aug 2006 07:20:09 -0400
Received: from VLADIMIR (unknown [147.91.52.198])
	by smtp.imp.bg.ac.yu (Postfix) with SMTP id A6E2B3B76B
	for <linux-mtd@lists.infradead.org>;
	Thu,  3 Aug 2006 13:53:10 +0200 (CEST)
Message-ID: <001601c6b6ea$cb60f790$c6345b93@VLADIMIR>
From: "Iva Salom" <diva@kondor.imp.bg.ac.yu>
To: <linux-mtd@lists.infradead.org>
Subject: Problem with mounting JFFS2
Date: Thu, 3 Aug 2006 12:51:37 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0013_01C6B6FB.8ED1F9D0"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0013_01C6B6FB.8ED1F9D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!

I am a beginner in all these embedded linux - mtd - jffs stuff. I am =
using Intel FLASH 28F320 (2 interleaved 16b chips of 8MB, so we have =
32bit buswidth) (CFI) with TMS320C5471 platform. I turnd on MTD support, =
so I have 5 partitions: bootloader (/dev/mtd0), bootloader parameters =
(/dev/mtd1), kernel image (/dev/mtd2), ROMFS SDRAM image (/dev/mtd5), =
primary file system, which is romfs (/dev/mtd3) and I want the second to =
be jffs2 (/dev/mtd4):

c5471_init: CFI FLASH device size: 16384K

Creating 5 MTD partitions on "C5471 CFI":

0x00000000-0x000a0000 : "C5471 Bootloader"

0x000a0000-0x000c0000 : "C5471 Bootloader Parameters"

0x000c0000-0x001c0000 : "C5471 Kernel Image"

0x001c0000-0x00800000 : "C5471 Primary File System"

0x00800000-0x01000000 : "C5471 Secondary File System"

Creating 1 MTD partitions on "SDRAM":

0x00000000-0x006bffe0 : "SDRAM File System"


I have made jffs2 image:

arm-uclinux-mkjffs2 -d ./jffsfolder -l -e 0x00020000 -o jffs2.img =
>/dev/null

and I loaded it at addresses from 0x00800000, which correspond to fs2, =
i.e. /dev/mtd4.

When I try to mount jffs2:

# mount -t jffs2 /dev/mtd4 /mnt/ramdisk/tmp



it sends me messages:

jffs2: read_super for device 1f:04

jffs2_scan_eraseblock(): Scanning block at 0x0

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: =
0xface instead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004: =
0x0020 instead

Empty bitmask at 0x00000008

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c: =
0x5188 instead

jffs2_scan_dirent_node(): Node at 0x00000010

jffs2_get_ino_cache(): ino 1

jffs2_get_ino_cache found 00000000 for ino 1

Allocated inocache at 106dd2c0

jffs2_add_ino_cache: Add 106dd2c0 (ino #1)

jffs2_add_fd_to_list( 1023f6a0, 10219e60 (->00000000))

Dirent "config.last" (hash 0xca144fa2, ino #2

jffs2_scan_inode_node(): Node at 0x00000044

jffs2_get_ino_cache(): ino 2

jffs2_get_ino_cache found 00000000 for ino 2

Allocated inocache at 106dd2d4

jffs2_add_ino_cache: Add 106dd2d4 (ino #2)

Node is ino #2, version 1. Range 0x0-0x1000

jffs2_scan_inode_node(): Node at 0x00001088

jffs2_get_ino_cache(): ino 2

jffs2_get_ino_cache found 106dd2d4 for ino 2

Node is ino #2, version 2. Range 0x1000-0x2000

jffs2_scan_inode_node(): Node at 0x000020cc

jffs2_get_ino_cache(): ino 2

jffs2_get_ino_cache found 106dd2d4 for ino 2

Node is ino #2, version 3. Range 0x2000-0x27c4

jffs2_scan_dirent_node(): Node at 0x000028d4

jffs2_get_ino_cache(): ino 1

jffs2_get_ino_cache found 106dd2c0 for ino 1

jffs2_add_fd_to_list( 1023f6e0, 10219e60 (->1023f6a0))

Dirent "config.last~" (hash 0xaedfc2e3, ino #3

Dirent "config.last" (hash 0xca144fa2, ino #2

jffs2_scan_inode_node(): Node at 0x00002908

jffs2_get_ino_cache(): ino 3

jffs2_get_ino_cache found 00000000 for ino 3

Allocated inocache at 106dd2e8

jffs2_add_ino_cache: Add 106dd2e8 (ino #3)

Node is ino #3, version 1. Range 0x0-0x1000

jffs2_scan_inode_node(): Node at 0x0000394c

jffs2_get_ino_cache(): ino 3

jffs2_get_ino_cache found 106dd2e8 for ino 3

Node is ino #3, version 2. Range 0x1000-0x2000

jffs2_scan_inode_node(): Node at 0x00004990

jffs2_get_ino_cache(): ino 3

jffs2_get_ino_cache found 106dd2e8 for ino 3

Node is ino #3, version 3. Range 0x2000-0x27c4

Found empty flash at 0x5198

Empty flash detected from 0x00005198 to 0x00020000

Block at 0x00000000: free 0x0001ae68, dirty 0x00000010, used 0x00005188

jffs2_scan_eraseblock(): Scanning block at 0x20000

Empty flash detected from 0x00020000 to 0x00040000

Block at 0x00020000 is empty (erased)

jffs2_scan_eraseblock(): Scanning block at 0x40000

Empty flash detected from 0x00040000 to 0x00060000

Block at 0x00040000 is empty (erased)

jffs2_scan_eraseblock(): Scanning block at 0x60000

Empty flash detected from 0x00060000 to 0x00080000

Block at 0x00060000 is empty (erased)



etc., and finally:



Pass 3 complete

jffs2_read_super(): Getting root inode

jffs2_read_inode(): inode->i_ino =3D=3D 1

getting inocache

jffs2_get_ino_cache(): ino 1

jffs2_get_ino_cache found 106dd2c0 for ino 1

jffs2_read_inode(): Got inocache at 106dd2c0

jffs2_read_inode(): ino #1 nlink is 1

jffs2_get_inode_nodes(): ino #1

Node at 000028d4 is a dirent node

Adding fd "config.last~", ino #3

jffs2_add_fd_to_list( 1023f6a0, 10707d14 (->00000000))

Dirent "config.last~" (hash 0xaedfc2e3, ino #3

Node at 00000010 is a dirent node

Adding fd "config.last", ino #2

jffs2_add_fd_to_list( 1023f6e0, 10707d14 (->1023f6a0))

Dirent "config.last~" (hash 0xaedfc2e3, ino #3

Dirent "config.last" (hash 0xca144fa2, ino #2

jffs2_read_inode() returning

jffs2_read_super(): d_alloc_root()

thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 63, dirty_size =
0x10

thread_should_wake(): return 0

jffs2_garbage_collect_thread(): posle !thread_should_wake

jffs2_garbage_collect_thread sleeping...

JFFS2: Garbage collect thread is pid 37

jffs2_read_super(): pre return sb

thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 63, dirty_size =
0x10

thread_should_wake(): return 0

Starting erase of pending block 0x00620000

Freeing all node refs for eraseblock offset 0x00620000

erase.c: jffs2_free_all_node_refs(): end

jffs2_erase_pending_blocks(): TEST1=20

jffs2_erase_pending_blocks(): TEST2=20

jffs2_erase_block(): TEST1

jffs2_erase_block(): TEST2

jffs2_erase_block(): TEST3

do_erase_oneblock(): status_OK =3D CMD(0x80) =3D 0x800080

do_erase_oneblock(): chip->state1 =3D 0

do_erase_oneblock(): chip->state2 =3D 1

do_erase_o



and there it stops every time, with a few characters more or less. The =
situation was similar when I erased my flash before mounting the jffs2 =
(except it found completely empty flash).=20



Have enyone an idea what I did wrong or what I missed to do? Could a =
problem be with that thread thing - thread_should_wake()?



Thank you in advance!

Iva





------=_NextPart_000_0013_01C6B6FB.8ED1F9D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2900.2912" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DCourier size=3D2>Hi!</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>I am a beginner in all these embedded =
linux - mtd=20
- jffs&nbsp;stuff. I am using Intel FLASH 28F320 (2 interleaved 16b =
chips of=20
8MB,&nbsp;so we have 32bit buswidth)&nbsp;(CFI) with TMS320C5471 =
platform. I=20
turnd on MTD support, so I have 5 partitions: bootloader (/dev/mtd0), =
bootloader=20
parameters (/dev/mtd1),&nbsp;kernel image (/dev/mtd2),&nbsp;ROMFS SDRAM =
image=20
(/dev/mtd5), primary file system, which&nbsp;is romfs (/dev/mtd3) and I =
want the=20
second to be jffs2 (/dev/mtd4):</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">c5471_init: CFI FLASH =
device size:=20
16384K<?xml:namespace prefix =3D o ns =3D =
"urn:schemas-microsoft-com:office:office"=20
/><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Creating 5 MTD =
partitions on=20
"C5471 CFI":<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">0x00000000-0x000a0000 : =
"C5471=20
Bootloader"<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">0x000a0000-0x000c0000 : =
"C5471=20
Bootloader Parameters"<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">0x000c0000-0x001c0000 : =
"C5471=20
Kernel Image"<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">0x001c0000-0x00800000 : =
"C5471=20
Primary File System"<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">0x00800000-0x01000000 : =
"C5471=20
Secondary File System"<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Creating 1 MTD =
partitions on=20
"SDRAM":<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">0x00000000-0x006bffe0 : =
"SDRAM=20
File System"<o:p></o:p></SPAN></P></FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>I have made jffs2 image:</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>arm-uclinux-mkjffs2 -d ./jffsfolder =
-l -e=20
0x00020000 -o jffs2.img &gt;/dev/null</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>and I&nbsp;loaded it at addresses =
from=20
0x00800000, which correspond to fs2, i.e. /dev/mtd4.</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>When I try to mount =
jffs2:</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier"># mount -t jffs2 =
/dev/mtd4=20
/mnt/ramdisk/tmp</SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier"><o:p><FONT=20
face=3DCourier></FONT></o:p></SPAN>&nbsp;</P></FONT><FONT =
size=3D2></FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>it sends me messages:</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2: read_super for =
device=20
1f:04<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_scan_eraseblock(): =
Scanning=20
block at 0x0<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_scan_eraseblock(): =
Magic=20
bitmask 0x1985 not found at 0x00000000: 0xface =
instead<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_scan_eraseblock(): =
Magic=20
bitmask 0x1985 not found at 0x00000004: 0x0020 =
instead<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Empty bitmask at=20
0x00000008<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_scan_eraseblock(): =
Magic=20
bitmask 0x1985 not found at 0x0000000c: 0x5188 =
instead<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Courier">jffs2_scan_dirent_node(): Node at=20
0x00000010<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache(): =
ino=20
1<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache =
found 00000000=20
for ino 1<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Allocated inocache at=20
106dd2c0<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_add_ino_cache: Add =
106dd2c0=20
(ino #1)<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_add_fd_to_list( =
1023f6a0,=20
10219e60 (-&gt;00000000))<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Dirent "config.last" =
(hash=20
0xca144fa2, ino #2<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_scan_inode_node(): =
Node at=20
0x00000044<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache(): =
ino=20
2<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache =
found 00000000=20
for ino 2<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Allocated inocache at=20
106dd2d4<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_add_ino_cache: Add =
106dd2d4=20
(ino #2)<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Node is ino #2, version =
1. Range=20
0x0-0x1000<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_scan_inode_node(): =
Node at=20
0x00001088<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache(): =
ino=20
2<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache =
found 106dd2d4=20
for ino 2<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Node is ino #2, version =
2. Range=20
0x1000-0x2000<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_scan_inode_node(): =
Node at=20
0x000020cc<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache(): =
ino=20
2<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache =
found 106dd2d4=20
for ino 2<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Node is ino #2, version =
3. Range=20
0x2000-0x27c4<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Courier">jffs2_scan_dirent_node(): Node at=20
0x000028d4<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache(): =
ino=20
1<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache =
found 106dd2c0=20
for ino 1<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_add_fd_to_list( =
1023f6e0,=20
10219e60 (-&gt;1023f6a0))<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Dirent "config.last~" =
(hash=20
0xaedfc2e3, ino #3<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Dirent "config.last" =
(hash=20
0xca144fa2, ino #2<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_scan_inode_node(): =
Node at=20
0x00002908<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache(): =
ino=20
3<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache =
found 00000000=20
for ino 3<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Allocated inocache at=20
106dd2e8<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_add_ino_cache: Add =
106dd2e8=20
(ino #3)<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Node is ino #3, version =
1. Range=20
0x0-0x1000<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_scan_inode_node(): =
Node at=20
0x0000394c<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache(): =
ino=20
3<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache =
found 106dd2e8=20
for ino 3<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Node is ino #3, version =
2. Range=20
0x1000-0x2000<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_scan_inode_node(): =
Node at=20
0x00004990<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache(): =
ino=20
3<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache =
found 106dd2e8=20
for ino 3<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Node is ino #3, version =
3. Range=20
0x2000-0x27c4<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Found empty flash at=20
0x5198<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Empty flash detected =
from=20
0x00005198 to 0x00020000<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Block at 0x00000000: =
free=20
0x0001ae68, dirty 0x00000010, used 0x00005188<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_scan_eraseblock(): =
Scanning=20
block at 0x20000<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Empty flash detected =
from=20
0x00020000 to 0x00040000<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Block at 0x00020000 is =
empty=20
(erased)<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_scan_eraseblock(): =
Scanning=20
block at 0x40000<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Empty flash detected =
from=20
0x00040000 to 0x00060000<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Block at 0x00040000 is =
empty=20
(erased)<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_scan_eraseblock(): =
Scanning=20
block at 0x60000<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Empty flash detected =
from=20
0x00060000 to 0x00080000<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Block at 0x00060000 is =
empty=20
(erased)</SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier"><FONT=20
face=3DCourier></FONT></SPAN>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">etc., and =
finally:</SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier"></SPAN>&nbsp;</P><SPAN =
lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Pass 3=20
complete<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_read_super(): =
Getting root=20
inode<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_read_inode():=20
inode-&gt;i_ino =3D=3D 1<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">getting=20
inocache<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache(): =
ino=20
1<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_ino_cache =
found 106dd2c0=20
for ino 1<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_read_inode(): Got =
inocache=20
at 106dd2c0<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_read_inode(): ino =
#1 nlink=20
is 1<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_get_inode_nodes(): =
ino=20
#1<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Node at 000028d4 is a =
dirent=20
node<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Adding fd =
"config.last~", ino=20
#3<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_add_fd_to_list( =
1023f6a0,=20
10707d14 (-&gt;00000000))<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Dirent "config.last~" =
(hash=20
0xaedfc2e3, ino #3<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Node at 00000010 is a =
dirent=20
node<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Adding fd "config.last", =
ino=20
#2<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_add_fd_to_list( =
1023f6e0,=20
10707d14 (-&gt;1023f6a0))<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Dirent "config.last~" =
(hash=20
0xaedfc2e3, ino #3<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Dirent "config.last" =
(hash=20
0xca144fa2, ino #2<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_read_inode()=20
returning<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_read_super():=20
d_alloc_root()<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">thread_should_wake():=20
nr_free_blocks 0, nr_erasing_blocks 63, dirty_size =
0x10<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">thread_should_wake(): =
return=20
0<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Courier">jffs2_garbage_collect_thread():=20
posle !thread_should_wake<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Courier">jffs2_garbage_collect_thread=20
sleeping...<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">JFFS2: Garbage collect =
thread is=20
pid 37<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_read_super(): pre =
return=20
sb<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">thread_should_wake():=20
nr_free_blocks 0, nr_erasing_blocks 63, dirty_size =
0x10<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">thread_should_wake(): =
return=20
0<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Starting erase of =
pending block=20
0x00620000<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">Freeing all node refs =
for=20
eraseblock offset 0x00620000<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">erase.c:=20
jffs2_free_all_node_refs(): end<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Courier">jffs2_erase_pending_blocks():=20
TEST1 </SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Courier">jffs2_erase_pending_blocks():=20
TEST2 <o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_erase_block():=20
TEST1<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_erase_block():=20
TEST2<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">jffs2_erase_block():=20
TEST3<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">do_erase_oneblock(): =
status_OK =3D=20
CMD(0x80) =3D 0x800080<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">do_erase_oneblock():=20
chip-&gt;state1 =3D 0<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Courier">do_erase_oneblock():=20
chip-&gt;state2 =3D 1<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Courier">do_erase_o<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><o:p></o:p>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><o:p>and there it =
stops every=20
time, with a few characters more or less. The situation was similar =
when&nbsp;I=20
erased my&nbsp;flash before mounting the jffs2 (except it found =
completely empty=20
flash). </o:p></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><o:p></o:p>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><o:p>Have enyone an =
idea what I=20
did wrong or what I missed to do? Could a problem be with that thread =
thing -=20
<SPAN lang=3DSR-CYR=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Courier">thread_should_wake()?</SPAN></o:p></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><o:p></o:p>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><o:p>Thank you in=20
advance!</o:p></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt"><o:p>Iva</o:p></SPAN></P></FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0013_01C6B6FB.8ED1F9D0--
