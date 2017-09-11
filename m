Received: from mail-it0-x229.google.com ([2607:f8b0:4001:c0b::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drJ2n-0000Tx-9t
 for linux-mtd@lists.infradead.org; Mon, 11 Sep 2017 07:22:32 +0000
Received: by mail-it0-x229.google.com with SMTP id c195so15757397itb.1
 for <linux-mtd@lists.infradead.org>; Mon, 11 Sep 2017 00:21:48 -0700 (PDT)
MIME-Version: 1.0
From: Narendra <narendralimbani@gmail.com>
Date: Mon, 11 Sep 2017 12:51:46 +0530
Message-ID: <CADGWHBMSYCrv1L1oySZ3cFGo5nNnxxRykOO8feuZ4KrG2wH63Q@mail.gmail.com>
Subject: What is "Amount of available logical eraseblocks"?
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

What is "Amount of available logical eraseblocks" shown in the out put
of "ubinfo -a"?

Is there any way to reduce this count to 0, so that the space used by
them can be used in some other UBI volume?

My partitions are as given below.

mtd partition :
==========
mtd1
Name:                           rootfs
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          993 (130154496 bytes, 124.1 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  2048 bytes
OOB size:                       64 bytes
Character device major/minor:   90:2
Bad blocks are allowed:         true
Device is writable:             true


UBI volumes
==========
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:58
Present UBI devices:            ubi0

ubi0
Volumes count:                           3
Logical eraseblock size:                 126976 bytes, 124.0 KiB
Total amount of logical eraseblocks:     993 (126087168 bytes, 120.2 MiB)
Amount of available logical eraseblocks: 24 (3047424 bytes, 2.9 MiB)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  20
Current maximum erase counter value:     288
Minimum input/output unit size:          2048 bytes
Character device major/minor:            250:0
Present volumes:                         0, 1, 2


Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        360 LEBs (45711360 bytes, 43.6 MiB)
State:       OK
Name:        rfs1
Character device major/minor: 250:1
-----------------------------------
Volume ID:   1 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        360 LEBs (45711360 bytes, 43.6 MiB)
State:       OK
Name:        rfs2
Character device major/minor: 250:2
-----------------------------------
Volume ID:   2 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        225 LEBs (28569600 bytes, 27.2 MiB)
State:       OK
Name:        FS
Character device major/minor: 250:3


Thanks & Regards,
Narendra
