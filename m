Received: from smtp20.libero.it ([193.70.192.147])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCF3T-0004hI-Gq
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 06:17:59 -0400
Date: Tue, 28 Sep 2004 12:17:22 +0200
Message-Id: <I4QXWY$DC028C17BCE4F7375CD8E760DCF56467@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
From: "lp4u\@inwind\.it" <lp4u@inwind.it>
To: "Ben Dooks" <ben@fluff.org.uk>,
	"MTD mailing list" <linux-mtd@lists.infradead.org>
Cc: 
Subject: Nand detect
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 
 
I've a s3c24210 board with BAST architecture, with 2 NAND on boa=
rd. 
I've compiling the kernel 2.6.9-rc2 after patched it with: 
- patc=
h-2.6.9-rc2-bk11 
- dm9k-rc2.patch 
- patchin (mtd 2004/09/19) 
- nand=
_multi1.diff 
 
Now, the board start with NFS e detect the NAND Flash; =
but boot output is unusual, infact is: 
 
 FTL driver: nftlcore.c $Revi=
sion: 1.96 $, nftlmount.c $Revision: 1.36 $ 
S3C2410 NAND Driver, (c) 20=
04 Simtec Electronics 
s3c2410-nand: mapped registers at c4880000 
s3c2=
410-nand: timing Master 10ns, Tacls 70ns, Twrph0 70ns, Twrph1 70ns 
No N=
AND device found!!! 
NAND device: Manufacturer ID: 0x20, Chip ID: 0x76 (=
ST Micro NAND 64MiB 3,3V 8-bit) 
Scanning device for bad blocks 
Bad er=
aseblock 1154 at 0x01208000 
Bad eraseblock 4085 at 0x03fd4000 
NAND de=
vice: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB 3,3V 8-bit=
) 
Scanning device for bad blocks 
Bad eraseblock 17 at 0x00044000 
Ba=
d eraseblock 18 at 0x00048000 
Bad eraseblock 19 at 0x0004c000 
Bad era=
seblock 20 at 0x00050000 
Bad eraseblock 21 at 0x00054000 
Bad eraseblo=
ck 22 at 0x00058000 
Bad eraseblock 23 at 0x0005c000 
Bad eraseblock 24=
 at 0x00060000 
Bad eraseblock 25 at 0x00064000 
Bad eraseblock 27 at 0=
x0006c000 
Bad eraseblock 28 at 0x00070000 
Bad eraseblock 29 at 0x0007=
4000 
Bad eraseblock 30 at 0x00078000 
Bad eraseblock 31 at 0x0007c000 =

Bad eraseblock 32 at 0x00080000 
Bad eraseblock 33 at 0x00084000 
Bad=
 eraseblock 34 at 0x00088000 
Bad eraseblock 35 at 0x0008c000 
Bad eras=
eblock 36 at 0x00090000 
Bad eraseblock 37 at 0x00094000 
Bad erasebloc=
k 38 at 0x00098000 
Bad eraseblock 39 at 0x0009c000 
Bad eraseblock 40 =
at 0x000a0000 
Bad eraseblock 41 at 0x000a4000 
Bad eraseblock 42 at 0x=
000a8000 
Bad eraseblock 43 at 0x000ac000 
Bad eraseblock 44 at 0x000b0=
000 
Bad eraseblock 45 at 0x000b4000 
Bad eraseblock 46 at 0x000b8000 =0D
=
Bad eraseblock 47 at 0x000bc000 
Bad eraseblock 48 at 0x000c0000 
Bad e=
raseblock 49 at 0x000c4000 
Bad eraseblock 50 at 0x000c8000 
Bad eraseb=
lock 51 at 0x000cc000 
Bad eraseblock 52 at 0x000d0000 
Bad eraseblock =
53 at 0x000d4000 
Bad eraseblock 54 at 0x000d8000 
Bad eraseblock 55 at=
 0x000dc000 
Bad eraseblock 56 at 0x000e0000 
Bad eraseblock 57 at 0x00=
0e4000 
Bad eraseblock 58 at 0x000e8000 
Bad eraseblock 59 at 0x000ec00=
0 
Bad eraseblock 60 at 0x000f0000 
Bad eraseblock 61 at 0x000f4000 =0D
=
Bad eraseblock 62 at 0x000f8000 
Bad eraseblock 63 at 0x000fc000 
Bad e=
raseblock 64 at 0x00100000 
Bad eraseblock 65 at 0x00104000 
Bad eraseb=
lock 66 at 0x00108000 
Bad eraseblock 67 at 0x0010c000 
Bad eraseblock =
68 at 0x00110000 
Bad eraseblock 69 at 0x00114000 
Bad eraseblock 70 at=
 0x00118000 
Bad eraseblock 71 at 0x0011c000 
Bad eraseblock 72 at 0x00=
120000 
Bad eraseblock 73 at 0x00124000 
Bad eraseblock 74 at 0x0012800=
0 
Bad eraseblock 75 at 0x0012c000 
Bad eraseblock 76 at 0x00130000 =0D
=
Bad eraseblock 77 at 0x00134000 
Bad eraseblock 78 at 0x00138000 
Bad e=
raseblock 79 at 0x0013c000 
Bad eraseblock 80 at 0x00140000 
Bad eraseb=
lock 81 at 0x00144000 
Bad eraseblock 82 at 0x00148000 
Bad eraseblock =
83 at 0x0014c000 
Bad eraseblock 84 at 0x00150000 
Bad eraseblock 85 at=
 0x00154000 
Bad eraseblock 86 at 0x00158000 
Bad eraseblock 87 at 0x00=
15c000 
Bad eraseblock 88 at 0x00160000 
Bad eraseblock 89 at 0x0016400=
0 
Bad eraseblock 1193 at 0x012a4000 
Bad eraseblock 1500 at 0x01770000=
 
Bad eraseblock 1844 at 0x01cd0000 
Bad eraseblock 2290 at 0x023c8000 =

Bad eraseblock 3946 at 0x03da8000 
No NAND device found!!! 
s3c2410-n=
and: registered device sets: 
s3c2410-nand: set 0, SmartMedia:error 1 =0D
=
s3c2410-nand: set 1, chip0:ok: 
Creating 3 MTD partitions on "NAND 64MiB=
 3,3V 8-bit": 
0x00000000-0x00004000 : "Boot Agent" 
mtd: Giving out de=
vice 0 to Boot Agent 
0x00004000-0x00400000 : "/boot" 
mtd: Giving out =
device 1 to /boot 
0x00400000-0x04000000 : "user" 
mtd: Giving out devi=
ce 2 to user 
s3c2410-nand: set 2, chip1:ok: 
Creating 3 MTD partitions=
 on "NAND 64MiB 3,3V 8-bit": 
0x00000000-0x00004000 : "Boot Agent" 
mtd=
: Giving out device 3 to Boot Agent 
0x00004000-0x00400000 : "/boot" =0D
=
mtd: Giving out device 4 to /boot 
0x00400000-0x04000000 : "user" 
mtd:=
 Giving out device 5 to user 
s3c2410-nand: set 3, chip2:error 1 
 
I =
don't get work with the NAND, why? 
MTD detect 5 devices, I've only 2 NA=
ND. Why, occurs that? 
The proc/ is empty, there aren't device, why? =0D
=
Must I work with /dev/mtdN or /dev/mtdblockN? 
 
Thanks, 
Lorenzo 
