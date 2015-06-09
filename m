Received: from mail-ig0-x242.google.com ([2607:f8b0:4001:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2EV4-0003gu-Cl
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2015 08:03:11 +0000
Received: by igdj8 with SMTP id j8so1501548igd.2
 for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2015 01:02:46 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 9 Jun 2015 16:02:46 +0800
Message-ID: <CAOx4H9BWcd-8HNrXcnyP+YsnqDnjo-ucS7E9Zzvvr1WVd-os5A@mail.gmail.com>
Subject: Data integrity check after UBIFORMAT? Bad image sequence number error.
From: t kevin <kevint324@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are using kernel 2.6.36 and mtd-util-1.5.1 on our box.
During system upgrade, very very occasionally ( 1 in 100, maybe? ) I
get this error at ubiattach after ubiformat.

[ 1632.520000] UBI: attaching mtd8 to ubi0
[ 1632.520000] UBI: physical eraseblock size: 131072 bytes (128 KiB)
[ 1632.530000] UBI: logical eraseblock size: 126976 bytes
[ 1632.530000] UBI: smallest flash I/O unit: 2048
[ 1632.540000] UBI: sub-page size: 512
[ 1632.540000] UBI: VID header offset: 2048 (aligned 2048)
[ 1632.550000] UBI: data offset: 4096
[ 1633.190000] UBI error: process_eb: bad image sequence number
559476870 in PEB 635, expected 139654706

I understand ubiformat generate a random sequence number and write the
sequence number to all PEB. So it seems an expected sequence number
somehow is not written into nand flash correctly.

So I changed my upgrade sequence like below

ubiformat ubi.img /dev/mtdx
ubiattach /dev/mtdx

if [ "$?" != "0" ]
    #do ubiformat again
    ubiformat ubi.img /dev/mtdx
fi

This time the syndrome changed. After the re-format,

[ 9.630000] UBI: attaching mtd8 to ubi0
[ 9.630000] UBI: physical eraseblock size: 131072 bytes (128 KiB)
[ 9.640000] UBI: logical eraseblock size: 126976 bytes
[ 9.640000] UBI: smallest flash I/O unit: 2048
[ 9.650000] UBI: sub-page size: 512
[ 9.650000] UBI: VID header offset: 2048 (aligned 2048)
[ 9.660000] UBI: data offset: 4096
[ 10.490000] UBI: max. sequence number: 0
[ 10.550000] UBI: volume 0 ("system") re-sized from 897 to 980 LEBs
[ 10.560000] UBI: attached mtd8 to ubi0
[ 10.560000] UBI: MTD device name: "rootfs"
[ 10.570000] UBI: MTD device size: 128 MiB
[ 10.570000] UBI: number of good PEBs: 1024
[ 10.580000] UBI: number of bad PEBs: 0
[ 10.580000] UBI: max. allowed volumes: 128
[ 10.590000] UBI: wear-leveling threshold: 4096
[ 10.590000] UBI: number of internal volumes: 1
[ 10.590000] UBI: number of user volumes: 1
[ 10.600000] UBI: available PEBs: 0
[ 10.600000] UBI: total number of reserved PEBs: 1024
[ 10.610000] UBI: number of PEBs reserved for bad PEB handling: 40
[ 10.610000] UBI: max/mean erase counter: 1/0
[ 10.620000] UBI: image sequence number: 356225242
[ 10.620000] UBI: background thread "ubi_bgt0d" started, PID 332
UBI device number 0, total 1024 LEBs (130023424 bytes, 124.0 MiB),
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
[ 10.790000] UBIFS: mounted UBI device 0, volume 0, name "system"
[ 10.800000] UBIFS: mounted read-only
[ 10.800000] UBIFS: file system size: 123039744 bytes (120156 KiB, 117
MiB, 969 LEBs)
[ 10.810000] UBIFS: journal size: 9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
[ 10.820000] UBIFS: media format: w4/r0 (latest is w4/r0)
[ 10.830000] UBIFS: default compressor: none
[ 10.830000] UBIFS: reserved for root: 0 bytes (0 KiB)
[ 10.830000] UBIFS error (pid 333): ubifs_read_node: bad node type
(255 but expected 9)
[ 10.840000] UBIFS error (pid 333): ubifs_read_node: bad node at LEB 896:85496
[ 10.850000] UBIFS error (pid 333): ubifs_iget: failed to read inode
1, error -22


This time the sequence number check succeed, but ran into another
error, bad node type.
It seems something fishy with the driver. Some expected data is not
written into flash correctly.

My question are,
1. What could possibly be wrong that caused the ubiformat fail?
2. Is there a way to verify the data integrity after a UBIFORMAT
process? Something like "mtd verify" function.

Thanks a lot
Kevin
