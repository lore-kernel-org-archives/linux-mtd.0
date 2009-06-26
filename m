Received: from [61.155.106.76] (helo=www.mid-fun.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MK8HC-0004ey-Rt
	for linux-mtd@lists.infradead.org; Fri, 26 Jun 2009 10:03:30 +0000
Subject: about ubiformat mtdblock
From: tommy <jiujin.hong@mid-fun.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 26 Jun 2009 18:03:12 +0800
Message-Id: <1246010592.12367.0.camel@tommy-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,dear all!

My kernel version is 2.6.24 ,patch ubifs !

I met error on ubiformat .
Following is my step!


# ./ubiformat /dev/mtd2 -f /ubi.img
ubiformat: mtd2 (NAND), size 654311424 bytes (624.0 MiB), 262144
eraseblocks of 262144 bytes (256.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 2495 -- 100 % complete
ubiformat: 2496 eraseblocks have valid erase counter, mean value is 0
ubiformat: flashing eraseblock 383 -- 100 % complete
ubiformat: formatting eraseblock 2495 -- 100 % complete
# ./ubiattach /dev/ubi_ctrl -m 2
vmalloc is used.
UBI: physical eraseblock size:   262144 bytes (256 KiB)
UBI: logical eraseblock size:    258048 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: volume 0 ("ubifs0") re-sized from 407 to 2468 LEBs
UBI: attached mtd2 to ubi0
UBI: MTD device name:            "File System"
UBI: MTD device size:            624 MiB
UBI: number of good PEBs:        2496
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 2496
UBI: number of PEBs reserved for bad PEB handling: 24
UBI: max/mean erase counter: 2/1
UBI: background thread "ubi_bgt0d" started, PID 306
UBI device number 0, total 2496 LEBs (644087808 bytes, 614.2 MiB),
available 0 LEBs (0 bytes), LEB size 258048 bytes (252.0 KiB)
# mount -t ubifs ubi0_0 /tmp/
UBIFS error (pid 307): ubifs_read_superblock: on-flash format version
is 4, but software only supports up to version 3
mount: mounting ubi0_0 on /tmp/ failed: Invalid argument


can anyone help me ?thanks!
