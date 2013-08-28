Received: from mail-qe0-x22b.google.com ([2607:f8b0:400d:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEcky-0006xX-KG
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 10:13:45 +0000
Received: by mail-qe0-f43.google.com with SMTP id t7so3279765qeb.2
 for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2013 03:13:23 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 28 Aug 2013 12:13:23 +0200
Message-ID: <CAAXf6LX44diB36-aFUFh1mcWcgj3X7z1jg-gwpeFyKaROjjaKQ@mail.gmail.com>
Subject: ubifs: bad node type (255 but expected 6)
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to enable NAND+UBI/UBIFS on a PowerPC based system. I can
ubiformat and ubimkvol without errors, but when I mount the volume I
get following error:

# ubiformat /dev/mtd0
# ubiattach -p /dev/mtd0
# ubimkvol /dev/ubi0 -N test  -s 10MiB
# mount -t ubifs ubi0:test /mnt/nand
[67759.519436] UBIFS error (pid 12990): ubifs_read_node: bad node type
(255 but expected 6)
[67759.616359] UBIFS error (pid 12990): ubifs_read_node: bad node at LEB 0:0


I have searched the internet, found some people with a similar error,
but could not find a solution or patch. I also went through the linux
git log for ubi and ubifs directories. There have been some patches
that are related to power cuts, but in the above scenario there is no
power cut at all between formatting and mounting.

This is on an old 2.6.36.4-based kernel. I have tried updating to a
much more recent 3.8 kernel, but failed miserably in areas not related
to ubi.

The NAND driver is fsl_elbc_nand.c, which I had to modify by adding
support for NAND_CMD_RNDOUT which is used by UBI(FS) but wasn't
provided in the driver. I can't guarantee that this change isn't part
of the problem, but without it I can't even start to use UBI.

Here is some further info:
~ # ubinfo /dev/ubi0
ubi0
Volumes count:                           1
Logical eraseblock size:                 129024 bytes, 126.0 KiB
Total amount of logical eraseblocks:     2044 (263725056 bytes, 251.5 MiB)
Amount of available logical eraseblocks: 1938 (250048512 bytes, 238.5 MiB)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       4
Count of reserved physical eraseblocks:  20
Current maximum erase counter value:     2
Minimum input/output unit size:          2048 bytes
Character device major/minor:            251:0
Present volumes:                         0

The NAND device is:
[   10.396748] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda
(Micron NAND 256MiB 3,3V 8-bit)


Is this a known problem, fixed in a later release?
Could it be just a bad NAND flash?
Could it be a problem with the underlying MTD driver (or my modification to it)?

Any help is appreciated.

Thanks,
Thomas
