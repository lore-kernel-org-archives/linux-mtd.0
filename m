Received: from mx1.bticino.it ([91.208.195.90] helo=bticino.it)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QK4vL-0007e4-DZ
	for linux-mtd@lists.infradead.org; Wed, 11 May 2011 08:37:40 +0000
Date: Wed, 11 May 2011 10:37:29 +0200
From: Fabio Mauri <fabio.mauri@bticino.it>
To: linux-mtd@lists.infradead.org
Subject: ubi_io_read error after ubiattach
Message-ID: <20110511083729.GA6803@BT22268.eu.dir.grpleg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi there,
  i have a problem using ubifs on a NAND flash.

I follow this procedure in order to format a MTD partition:

mkfs.ubifs -g 3 -r home/boot -m 2048 -e 129024 -c 32 -o ubifs_kernel.img
ubinize -o kernel.ubi -m 2048 -p 128KiB -s 512 ubi.cfg
ubiformat /dev/mtd3 -s 512 -f kernel.ubi
ubiattach /dev/ubi_ctrl -m 3
mount -t ubifs ubi:kernel /home/bticino/cfg/extra

ubi.cfg is:
[ubifs]
mode=ubi
image=ubifs_kernel.img
vol_id=0
vol_size=4MiB
vol_type=dynamic
vol_name=kernel
vol_flags=autoresize

and the mtdinfo output is:
mtd3
Name:                           kernel_copy
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          40 (5242880 bytes, 5.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:6
Bad blocks are allowed:         true
Device is writable:             true


Everything is working fine at this point.
I can successfully read/write files into the filesystem.

But if I umount the fs, detach and reattach the volume, I start to get these errors:

UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 32:512, read 512 bytes
UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 2:512, read 512 bytes
UBI: run torture test for PEB 2
UBI: PEB 2 passed torture test, do not mark it a bad
UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 32:512, read 512 bytes
UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 2:512, read 512 bytes
UBI: run torture test for PEB 2
UBI: PEB 2 passed torture test, do not mark it a bad
UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 32:512, read 512 bytes
UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 2:512, read 512 bytes
UBI: run torture test for PEB 2
UBI: PEB 2 passed torture test, do not mark it a bad
UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 32:512, read 512 bytes
UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 2:512, read 512 bytes
UBI: run torture test for PEB 2
UBI: PEB 2 passed torture test, do not mark it a bad
UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 32:512, read 512 bytes
UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 2:512, read 512 bytes
UBI: run torture test for PEB 2
UBI: PEB 2 passed torture test, do not mark it a bad
UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 32:512, read 512 bytes
UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 2:512, read 512 bytes
UBI: run torture test for PEB 2

It makes the UBIFS very slow (not usable).. maybe I did something wrong in the procedure?

Any help would be appreciated.

Regards,
Fabio
