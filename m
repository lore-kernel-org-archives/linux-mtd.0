Received: from wproxy.gmail.com ([64.233.184.200])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DG1RQ-0001FQ-Dl
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2005 16:06:33 -0500
Received: by wproxy.gmail.com with SMTP id 57so349926wri
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Mar 2005 13:06:26 -0800 (PST)
Message-ID: <a2cb6db605032812442a21b82a@mail.gmail.com>
Date: Mon, 28 Mar 2005 21:44:58 +0100
From: Zeri Virgo <sillyzeri@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: flash_eraseall with jffs2 corrupts separate partition?
Reply-To: Zeri Virgo <sillyzeri@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a few 64MB diskonchip 2000 (not TSOP). Given the apparent lack
of support in linuxbios, u-boot and RedBoot for my x86-based Boser
HS-4020 (and my lack of time), I'm trying the method of booting with
GRUB, loading a kernel from a small NFTL/ext2 partition and then
mounting a jffs2 partition as root.
I've been trying this with linux kernel 2.6.11.5 and the utils from MTD CVS.

I've made a two-line change to diskonchip.c to shift the "BDTL
partition" it creates along a couple of MB to allow me to use the
following layout (is this ok?).
# cat /proc/mtd0
dev:    size    erasesize       name
mtd0: 04000000 00004000 "DiskOnChip 2000 (NFTL Model)"
mtd1: 03de0000 00004000 " DiskOnChip BDTL partition"

I want...
mtd0: grub_firmware and media headers totalling 131072 bytes.
mtd0: 2097152 bytes with ./nftl_format /dev/mtd0 131072 2097152 and ext2
mtd1: 64880640 bytes with jffs2

(BTW, I did try modifying diskonchip.c to give me an mtd1 of 2MB and
mtd2 of the rest, but, after running nftl_format /dev/mtd1, I didn't
get a /dev/nftla, b or anything to fdisk ???)

So, I run something like this...
# modprobe diskonchip    ( and get cat /proc/mtd0 results as above )
# flash_eraseall /dev/mtd0
# nftl_format /dev/mtd0 131072 2097152
# modprobe nftl
# fdisk /dev/nftla
[NB: fdisk seems to see the whole chip as available, but I create a
partition of 32 cylinders (65536 bytes a cylinder)].
# mke2fs /dev/nftla1
# nanddump -f /tmp/a -l 3000000 -b -p
[Things are as I'd expected - nothing touched before 0x20000 or after
0x220000, and /dev/nftla1 mounts and unmounts without any problems -
2MB as desired.]

# flash_eraseall -j /dev/mtd1
# nanddump -f /tmp/b -l 3000000 -b -p

/dev/nftla1 no longer mounts - group descriptors corrupted! A diff of
the two nanddumps shows the expected changes to the mtd1 area, but
also a few bytes near the beginning of the nftl partition have been
played with! Nearly 2MB before the mtd1 partition!
I have reproduced this a couple of times on different chips. Also,
making the nftl/ext2 partition after the jffs2 one seems to screw up
the jffs2 partition, though I can't see anything changed in the mtd1
area.

Interestingly, flash_eraseall without the -j option doesn't seem to
affect the nftl area. I've put debug in flash_eraseall, and I can't
see anything wrong with the start and length values passed to the
ioctl calls.

There must be something I'm not understanding here, though I've read
all I can find......help!?

- Zeri
