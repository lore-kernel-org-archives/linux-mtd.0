Received: from ns.hht.co.jp ([210.227.191.18])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwJhk-0003rU-UV
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2004 11:29:25 +0000
Date: Thu, 26 Feb 2004 20:33:14 +0900
From: Yuzuru Nitta <nitta@hht.co.jp>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1077782418.11584.1044.camel@imladris.demon.co.uk>
References: <20040226095217.4793.NITTA@hht.co.jp>
	<1077782418.11584.1044.camel@imladris.demon.co.uk>
Message-Id: <20040226193910.479F.NITTA@hht.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 for ST M29W320DT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Thank you for reply.

>=20
> So your 640DT devices are each in 8-bit mode, and the 320DT devices are
> in 16-bit mode? Are you sure about that?

Yes, ST320DT devices are 16-bit mode exactly.

>=20
> Ignore JFFS2 and write data to the chips directly via /dev/mtd<N>. See
> if there's a recognisable pattern.
>=20


I tried to copy "jffs2 Image" via /dev/mtdblock3.
I made the Image like this ...
prom> mkfs.jffs2 -r target-fs-0007/ -e 0x20000 -l -p -o jffs2.img;



Here is the message log when I tried to copy ,
/=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
root@ToughSoB:~# cp hitntp-logarea.img /dev/mtdblock3=20
mtdblock_open
ok
mtdblock: write on "LOG AREA" at 0x0, size 0x1000

=2E..

mtdblock: write on "LOG AREA" at 0x20000, size 0x1000
mtdblock: writing cached data for "LOG AREA" at 0x0, size 0x20000
mtdblock: write on "LOG AREA" at 0x21000, size 0x1000

=2E..

mtdblock: write on "LOG AREA" at 0x40000, size 0x1000
mtdblock: writing cached data for "LOG AREA" at 0x20000, size 0x20000
mtdblock: write on "LOG AREA" at 0x41000, size 0x1000

=2E..
=2E..
=2E..

mtdblock: write on "LOG AREA" at 0x560000, size 0x1000
mtdblock: writing cached data for "LOG AREA" at 0x540000, size 0x20000
mtdblock: write on "LOG AREA" at 0x561000, size 0x1000

=2E..

mtdblock: write on "LOG AREA" at 0x57f000, size 0x1000
mtdblock_release
mtdblock: writing cached data for "LOG AREA" at 0x560000, size 0x20000
ok
root@ToughSoB:~#
/=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

And I tried to mount "/dev/mtdblock3".

/=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
root@ToughSoB:~# mount -t jffs2 /dev/mtdblock3 /mnt/mtd3/
mtdblock_open
ok
jffs2_scan_eraseblock(): Node at 0x00000000 {0x1985, 0xe002, 0x0000002b) ha=
s invalid CRC 0xfddb6ee6=20
(calculated 0xfbb21c48)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004: 0x00=
2b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008: 0x6e=
e6 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c: 0x00=
01 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014: 0x00=
02 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018: 0x47=
62 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c: 0x04=
03 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020: 0x00=
65 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024: 0xa4=
5a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000028: 0x6d=
74 instead
Further such events for this erase block will not be printed
Old JFFS2 bitmask found at 0x000082b8
You cannot use older JFFS2 filesystems with newer kernels
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased

=2E..

JFFS2: Erase block at 0x00020000 is not formatted. It will be erased

=2E..
=2E..
=2E..

JFFS2: Erase block at 0x005e0000 is not formatted. It will be erased
Inode #6 was a directory with children - removing those too...
Inode #12 was a directory with children - removing those too...
Inode #13 was a directory with children - removing those too...
Inode #14 was a directory with children - removing those too...
Inode #45 was a directory with children - removing those too...
Inode #46 was a directory with children - removing those too...
Inode #49 was a directory with children - removing those too...
Inode #50 was a directory with children - removing those too...
Inode #51 was a directory with children - removing those too...
root@ToughSoB:~#=20
Newly-erased block contained word 0xc002ffff at offset 0x005e04e0
Newly-erased block contained word 0x2003ffff at offset 0x00760000
root@ToughSoB:~#=20
/=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

Then, I copied textfile to the /mnt/mtd3, and I unmounted and mounted it
again.

/=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
root@ToughSoB:~# cp textfile.txt /mnt/mtd3/
root@ToughSoB:~# cd /mnt/mtd3/
root@ToughSoB:/mnt/mtd3# ls -l
total 566
-rw-r--r--    1 root     root       578863 Jan  1 09:13 textfile.txt
root@ToughSoB:~# umount /mnt/mtd3/
mtdblock_release
ok
root@ToughSoB:~# mount -t jffs2 /dev/mtdblock3 /mnt/mtd3/
mtdblock_open
ok
jffs2_scan_eraseblock(): Node at 0x00080000 {0x1985, 0x2003, 0x00000834) ha=
s invalid CRC 0xe41e0a39=20
(calculated 0xdf923147)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080004: 0x08=
34 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080008: 0x0a=
39 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0008000c: 0x00=
b1 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080010: 0x00=
8e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080014: 0x81=
ed instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0008001c: 0x14=
04 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080020: 0x47=
63 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080024: 0x47=
63 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080028: 0x47=
63 instead
Further such events for this erase block will not be printed
Old JFFS2 bitmask found at 0x00093c94
You cannot use older JFFS2 filesystems with newer kernels
Old JFFS2 bitmask found at 0x000968c4
You cannot use older JFFS2 filesystems with newer kernels
JFFS2: Erase block at 0x00080000 is not formatted. It will be erased

=2E..

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00760008: 0xff=
ff instead
JFFS2: Erase block at 0x00760000 is not formatted. It will be erased
root@ToughSoB:~# Newly-erased block contained word 0x2003ffff at offset 0x0=
0660000
Newly-erased block contained word 0x2003ffff at offset 0x00640000

root@ToughSoB:~#
/=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

And I put "ls -l" command, following logs appeared. I cannot access the
textfile.

/=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
root@ToughSoB:/mnt/mtd3# ls -l
Unknown INCOMPAT nodetype FFFF at 0063FA64
Unknown INCOMPAT nodetype FFFF at 0063EA20

=2E..

Unde(): No data nodes found for ino #652
ls: textfile.txt: Input/output error
total 0
root@ToughSoB:/mnt/mtd3#
/=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D


What am I missing?

Best Regards,
Joe
---
Nitta (Joe) Yuzuru
HIJI HIGH-TECH CO.,LTD.
System Solution Group


mailto: nitta@hht.co.jp
http://www.hht.co.jp
