Received: from mail.theptrgroup.com ([71.178.251.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NMqpA-0006Ft-Cx
	for linux-mtd@lists.infradead.org; Mon, 21 Dec 2009 22:34:00 +0000
Received: from [10.11.13.90] (unknown [10.11.13.90])
	by mail.theptrgroup.com (Postfix) with ESMTP id 7B3B91E00D
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Dec 2009 17:33:43 -0500 (EST)
Message-ID: <4B2FF7CF.7040401@theptrgroup.com>
Date: Mon, 21 Dec 2009 17:33:51 -0500
From: Jeff Angielski <jeff@theptrgroup.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ubiattach fails with "bad image sequence number"
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


If I ubiformat my NAND partition with an UBIFS image I keep on getting 
"bad image sequence number" when I try to do the ubiattach.  If I just 
do a plain ubiformat with no image then everything works fine when I 
ubiattach.

I was wondering if somebody ran into something similar.  The steps are 
so trivial it seems like something fundamentally wrong with either the 
mkfs.ubifs or the ubiformat.

I did not see anything related to this on the UBFI FAQ or documentation.



Here is how the image is being created on the x86 host:
======================================================

$ mkfs.ubifs -r build/targetfs_tiny -m 4096 -e 262144 -c 2047 -o tiny.ubifs

$ ubinize -s 1024 -o ubifs1b.img -m 4096 -p 256KiB ubifs1.cfg

$ more ubifs1.cfg
[ubifs]
mode=ubi
image=tiny.ubifs
vol_id=0
vol_size=500MiB
vol_type=dynamic
vol_name=fs1
vol_alignment=1
vol_flags=autoresize


And here is the sequence on the PowerPC target where the problem has 
manifested itself:
==================================================================

# mtdinfo -u /dev/mtd8
mtd8
Name:                           fs1
Type:                           nand
Eraseblock size:                262144 bytes, 256.0 KiB
Amount of eraseblocks:          2048 (536870912 bytes, 512.0 MiB)
Minimum input/output unit size: 4096 bytes
Sub-page size:                  1024 bytes
OOB size:                       128 bytes
Character device major/minor:   90:16
Bad blocks are allowed:         true
Device is writable:             true
Default UBI VID header offset:  1024
Default UBI data offset:        4096
Default UBI LEB size:           258048 bytes, 252.0 KiB
Maximum UBI volumes count:      128

# ubiformat -s 1024 -f ubifs1b.img /dev/mtd8
ubiformat: mtd8 (nand), size 536870912 bytes (512.0 MiB), 2048 
eraseblocks of 262144 bytes (256.0 KiB), min. I/O size 4096 bytes
libscan: scanning eraseblock 2047 -- 100 % complete
ubiformat: 2045 eraseblocks have valid erase counter, mean value is 4
ubiformat: 3 bad eraseblocks found, numbers: 72, 930, 1846
ubiformat: flashing eraseblock 30 -- 100 % complete
ubiformat: formatting eraseblock 2047 -- 100 % complete

# ubiattach /dev/ubi_ctrl -m 8
[ 2614.265521] UBI: attaching mtd8 to ubi0
[ 2614.269732] UBI: physical eraseblock size:   262144 bytes (256 KiB)
[ 2614.276645] UBI: logical eraseblock size:    258048 bytes
[ 2614.282420] UBI: smallest flash I/O unit:    4096
[ 2614.287251] UBI: sub-page size:              1024
[ 2614.292063] UBI: VID header offset:          1024 (aligned 1024)
[ 2614.298178] UBI: data offset:                4096
[ 2614.321544] UBI error: process_eb: bad image sequence number 
1294632561 in PEB 31, expected 1571790334
[ 2614.331112] UBI error: ubi_attach_mtd_dev: failed to attach by 
scanning, error -22
ubiattach: error!: cannot attach mtd8
            error 22 (Invalid argument)



-- 
Jeff Angielski
The PTR Group
www.theptrgroup.com
