Received: from orngca-mls01.socal.rr.com ([66.75.160.16])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QFOi-00081K-6G
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 00:52:56 +0100
Received: from [192.168.2.4] (66-75-241-113.san.rr.com [66.75.241.113])
	h5BNoeD14223	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 16:50:40 -0700 (PDT)
From: roger <rogerxxmaillist@san.rr.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1055322846.2097.18.camel@passion.cambridge.redhat.com>
References: <1055118239.10424.49.camel@localhost3.localdomain>
	 <1055322085.31819.31.camel@localhost3.localdomain>
	 <1055322846.2097.18.camel@passion.cambridge.redhat.com>
Message-Id: <1055375590.31819.567.camel@localhost3.localdomain>
Mime-Version: 1.0
Date: 11 Jun 2003 16:53:10 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Re: Problems with using doc2001 module - 000F0000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-11 at 02:14, David Woodhouse wrote:
> On Wed, 2003-06-11 at 10:01, roger wrote:
> > ok. just for kicks. i booted into DOS using M-SYS's tffs_5.1.4_DOS_TOOLS
> > and dinfo and dformat refused to find the DiskonChip even after
> > specifing it's address of 0xfff00000.
> > 
> > something isn't right here.  it's obviously something with the code.  I
> > also get the same results on a duplicate 440BX motherboard.
> > 
> > arrrghh.
> 
> The Linux DiskOnChip code doesn't do anything special to enable write
> accesses to that region in your chipset. The DOS tools certainly won't.
> 
> Did you look at drivers/mtd/maps/amd76xrom.c, as I suggested? Did you
> make a DOS tool to perform the same configuration, and run it before
> attempting to use DFORMAT under DOS?

ok. thanks for the tip.  after noticing l440gx.c addressing the same
location as my bios chip on my motherboard (0xfff00000), i decided to
compile this module and load it prior to mtdcore (actually, mtdcore
autoloaded with only doing "modprobe l440gx"..just needed to
additionally load mtdchar.o to get the /dev/mtd/0 & /dev/mtd/0ro
devices.

With this note, l440gx.o memory map module was successful in finding the
original Tyan Tiger 1832dl Bios chip also with this Intel 440bx chipset
(from a brief research, l440gx supports the same type of h/w and only
seems to differ in th l440gx having a PIIXE instead of a PIIX (for
440BX)).

I'd like to also make note in this post that I did find enabling the mtd
l440gx map module trivial in make menuconfig/xconfig!

in brief, it took me awhile to figure out what would allow me to enable
selecting the l440gx.o option in xconfig/menuconfig.  Simply making a
note in the "HELP file" of the l440gx.o module stating to "To enable
this module, you need to first enable "CONFIG_MTD_JEDECPROBE" (or
jedec_probe option).  i'm also seeing map_rom.o loaded along with the
l440gx.o & jedec_probe.o modules...dunno if map_rom.o is needed also? no
matter tho. it *just* works ;-)


ok. l440gx.o gets me /dev/mtd/0  with the motherboards orginal bios
chip. hexedit/hexdump /dev/mtd/0 shows it to look like the real thing.

however, when inserting a DoC into the bios slot and loading l440gx
(with doc2001/docprobe & options), i only get:

/dev/mtd (no other char devices)(ok. now i see it. odd)


So here's a breakdown of what I get with doing what and the procinfo and
dmesg info.

USING THE DEFAULT BIOS CHIP -- tyantiger 1832dl bios chip
# cat /proc/mtd/0
dev:    size   erasesize  name
mtd0: 00100000 00020000 "L440GX BIOS"

/var/log/messages 
Jun 11 12:29:32  window_addr = 0xfddd4000
Jun 11 12:29:32  Enabled WE line to L440GX BIOS flash chip.
Jun 11 12:29:32  JEDEC: Found no L440GX BIOS device at location zero
Jun 11 12:29:32  JEDEC probe on BIOS chip failed. Using ROM
Jun 11 12:29:32  mtd: Giving out device 0 to L440GX BIOS



USING THE DoC -- in the tyantiger 1832dl bios slot
# cat /proc/mtd (*note, no /proc/mtd/0)
dev:    size   erasesize  name
mtd0: 00100000 00020000 "L440GX BIOS"

Jun 11 12:36:52  window_addr = 0xfddd4000
Jun 11 12:36:52  Enabled WE line to L440GX BIOS flash chip.
Jun 11 12:36:52  JEDEC: Found no L440GX BIOS device at location zero
Jun 11 12:36:52  JEDEC probe on BIOS chip failed. Using ROM
Jun 11 12:36:52  mtd: Giving out device 0 to L440GX BIOS
(but it doesn't create a /dev/mtd/0 device with the DoC. ok. take this
back. i'm now seeing a /dev/mtd/0 device.  odd.)


- hexedit/hexdump shows me this -
(i'm clipping only where the data starts showing on the chip at
approximately 000F0000)

TYAN TIGER 1832DL Original Flash chip

000EFE98   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000EFEB0   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000EFEC8   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000EFEE0   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000EFEF8   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000EFF10   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000EFF28   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000EFF40   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000EFF58   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000EFF70   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000EFF88   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000EFFA0   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000EFFB8   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000EFFD0   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000EFFE8   FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF FF  FF FF FF
FF  FF FF FF FF  ........................
000F0000   11 A8 E7 C8  62 F6 74 B1  B2 1A 84 CB  6E 8F 41 DF  33 88 2F
EF  22 35 3A E6  ....b.t.....n.A.3./."5:.
000F0018   C8 F5 A1 DD  91 5F 74 7E  6B 33 09 96  C9 BF 10 94  7E EA D2
FA  D7 47 C2 24  ....._t~k3......~....G.$
000F0030   35 1A 86 57  47 83 D6 E6  E8 D4 57 67  88 D1 72 89  15 72 ED
91  1E 17 53 57  5..WG.....Wg..r..r....SW
000F0048   4C 46 45 74  50 42 6E 4D  F2 17 50 EE  C3 F5 60 10  72 2B E8
57  2E 71 5C 99  LFEtPBnM..P...`.r+.W.q\.
000F0060   9D 6B 56 41  AA 91 8F A1  88 AC 72 24  50 46 C8 D0  EE 8E 28
39  72 31 EB EE  .kVA......r$PF....(9r1..
000F0078   CF F3 F4 59  F7 E7 E7 ED  F5 E1 8C 05  D8 F9 C4 97  13 4E 17
05  B5 4A F6 54  ...Y.............N...J.T
000F0090   EA E6 9C 07  72 A4 00 8A  BD DF C8 40  38 FE 9D 85  54 16 3B
E6  38 6C 07 77  ....r......@8...T.;.8l.w
000F00A8   C6 A4 EE 96  27 6D D5 EF  87 90 6A BD  E3 90 01 98  56 E8 62
E5  81 21 AA 32  ....'m....j.....V.b..!.2
000F00C0   89 D0 97 11  1C 66 A0 74  1F F5 1E 87  A4 B7 93 E1  03 0D 50
A4  4D A6 55 21  .....f.t..........P.M.U!
000F00D8   2E 6A 1D 2A  35 3C B5 99  2D 84 78 45  6D 3E D5 3A  CF 6D FA
27  58 47 1D 01  .j.*5<..-.xEm>.:.m.'XG..
000F00F0   00 BF 49 40  0B 75 52 03  58 8C 32 5A  A5 D8 F4 2A  9A DC 21
60  99 45 0A 2B  ..I@.uR.X.2Z...*..!`.E.+
000F0108   0A 42 C7 C4  6A 85 5A 2F  0E E6 CB E0  AE A0 6F 66  B6 93 3F
40  A5 35 12 52  .B..j.Z/......of..?@.5.R
000F0120   5B 97 C2 76  C4 3D 4A 48  98 A8 77 E1  F7 0E 91 76  92 25 F8
4A  66 82 70 5C  [..v.=JH..w....v.%.Jf.p\
000F0138   EE 7A 80 BE  2A 3A EB 0B  CB 8E C9 7B  78 0C F5 02  D4 C6 09
36  42 B8 08 C1  .z..*:.....{x......6B...
000F0150   DB 98 83 22  56 25 40 08  CE 5A EF 3F  45 14 39 C5  1D C1 83
56  41 7F 4E 8C  ..."V%@..Z.?E.9....VA.N.
000F0168   6C FC 04 25  5E 19 97 87  6C 6E 16 01  97 B6 AC A3  53 8A D4
58  FE 57 6E 5E  l..%^...ln......S..X.Wn^


The DiskOnChip (DoC) Shows the following (data doesn't start again until
approximately  000F57F0)
000F5718   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F5730   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F5748   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F5760   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F5778   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F5790   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F57A8   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F57C0   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F57D8   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F57F0   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  55 AA 10
EB  3C 00 00 28  ................U...<..(
000F5808   43 29 4D 2D  53 79 73 74  65 6D 73 31  39 39 38 00  00 00 21
00  00 04 00 1C  C)M-Systems1998...!.....
000F5820   55 24 50 6E  50 01 02 00  00 00 1E 6D  1A 01 10 00  00 00 00
00  80 01 94 00  U$PnP......m............
000F5838   00 00 00 00  00 00 00 00  00 9C 50 53  51 52 56 57  55 1E 06
BA  C0 1F 33 C0  ..........PSQRVWU.....3.
000F5850   8E C0 33 FF  83 C2 40 8E  DA 81 FA 00  A0 74 1A 33  F6 B9 00
02  FC AD 0B C0  ..3...@......t.3........
000F5868   75 E8 E2 F9  83 FF 00 75  02 1E 07 47  83 FF 30 72  DB 83 FF
30  73 05 BA 00  u......u...G..0r...0s...
000F5880   58 8E C2 0E  1F 8B EC 83  EC 04 8C C0  8C 46 FE C7  46 FC AB
00  0E E8 13 00  X............F..F.......
000F5898   8B 46 FE 8E  C0 33 FF B9  00 60 33 C0  FC F3 AB 8B  E5 EB 74
55  8B EC 8B 46  .F...3...`3.......tU...F
000F58B0   04 8E D8 BB  00 00 C6 87  03 10 00 C6  87 02 10 85  C6 87 02
10  85 BE 00 08  ........................
000F58C8   B1 FF E8 5D  00 FC 32 E4  B1 00 E8 55  00 2E 8B 0E  1E 00 33
FF  F7 C1 FF 01  ...]..2....U......3.....
000F58E0   75 23 C6 87  04 10 0D 2E  8B 16 1C 00  03 D7 D0 EE  88 14 88
34  33 D2 88 14  u#.................43...
000F58F8   C6 87 1E 10  00 C6 87 04  10 09 E8 36  00 84 87 0D  10 AC 02
E0  AA 4E E2 CC  ...........6.........N..
000F5910   2E 3A 26 20  00 75 06 5D  06 33 C0 50  CB 5D CB 07  1F 5D 5F
5E  5A 59 5B 58  .:& .u.].3.P.]...]_^ZY[X
000F5928   9D CB C6 87  04 10 0B 88  0C C6 87 1E  10 00 C6 87  04 10 09
F6  87 20 10 80  ..................... ..
000F5940   F6 87 20 10  80 F6 87 20  10 80 F6 87  20 10 80 F6  87 04 10
80  74 F9 F6 87  .. .... .... .......t...
000F5958   20 10 80 F6  87 20 10 80  C3 1C 00 00  00 00 00 00  00 00 00
00  00 00 00 00   .... ..................
000F5970   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F5988   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F59A0   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F59B8   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F59D0   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F59E8   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00
00  00 00 00 00  ........................
000F5A00   55 AA 10 EB  3C 00 00 28  43 29 4D 2D  53 79 73 74  65 6D 73
31  39 39 38 00  U...<..(C)M-Systems1998.
000F5A18   00 00 21 00  00 04 00 1C  55 24 50 6E  50 01 02 00  00 00 1E
6D  1A 01 10 00  ..!.....U$PnP......m....
000F5A30   00 00 00 00  80 01 94 00  00 00 00 00  00 00 00 00  00 9C 50
53  51 52 56 57  ..................PSQRVW


When I use dd to image (dd if=/dev/mtd/0 of=~/blah.img) to a file, the
file of both the chips is approximately 1MB:

1048576 Jun 11 10:49 /home/roger/tmporiginalbios.img
1048576 Jun 11 13:06 /home/roger/tmpdoc.img

or

1.0M Jun 11 10:49 /home/roger/tmporiginalbios.img
1.0M Jun 11 13:06 /home/roger/tmpdoc.img

This original bios chip is a Winbond W29CO20-90 and is 256KB size.
The DiskOnChip is an 8MB module.

It certainly looks like i'm looking at the actual chips through the
L440GX memory map and the modules load fine without having to induce the
kernel panic.  However, the offset of the start & ending of the hardware
chip appears incorrect.  I'm guessing I only have to modify the l440gx.c
code to reflect the proper parameters?  On the cosemetic side of things,
the module labels the DoC as a "L440GX BIOS" instead of a "DOC
MIL"....another small oddity.



-- 

Roger
http://www.eskimo.com/~roger/index.html
