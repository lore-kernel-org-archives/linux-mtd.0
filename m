Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOCro-0007By-5D
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 15:46:06 +0000
Subject: Re: ubiattach problem
From: Artem Bityutskiy <dedekind@infradead.org>
To: Oren <oren_s3@VERIFONE.com>
In-Reply-To: <1246981097.2208.19.camel@tlvorens3lnx>
References: <baa101c9fe67$d7b31f0a$b65b1ec0@verifone.com>
	<1246947926.20721.299.camel@localhost.localdomain>
	<1246962761.1775.7.camel@tlvorens3lnx>
	<1246963327.20721.306.camel@localhost.localdomain>
	<1246968515.2208.4.camel@tlvorens3lnx>
	<1246971115.20721.308.camel@localhost.localdomain>
	<1246972892.2208.5.camel@tlvorens3lnx>
	<1246973292.20721.313.camel@localhost.localdomain>
	<1246975692.2208.7.camel@tlvorens3lnx>
	<1246977486.20721.315.camel@localhost.localdomain>
	<1246978172.2208.13.camel@tlvorens3lnx>
	<1246978420.20721.317.camel@localhost.localdomain>
	<1246981097.2208.19.camel@tlvorens3lnx>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jul 2009 18:45:42 +0300
Message-Id: <1246981542.20721.327.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-07-07 at 18:38 +0300, Oren wrote:
> cp /mnt/pc/Linux_2_6_27_old/mtd-utils/ubi_format.sh .
> ~ # chmod 777 ubi_format.sh 
> ~ # ./ubi_format.sh 
> cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 01000000 00020000 "NAND-block1"
> mtd1: 01e00000 00020000 "jffs2"
> mtd2: 05200000 00020000 "NAND-block2"
> ubinfo
> UBI version:                    1
> Count of UBI devices:           0
> UBI control device major/minor: 10:63
> ubiformat /dev/mtd0 -s 2048 -f ubi_ncomp.img
> ubiformat: mtd0 (nand), size 16777216 by[42949488.970000] Uncorrectable
> ECC error!!!!  :f0000fff 
> tes (16.0 MiB), 128 eraseblocks [42949488.980000] Uncorrectable ECC
> error!!!!  :f0000fff 
> of 131072 bytes (128.0 KiB), min[42949488.990000] Uncorrectable ECC
> error!!!!  :f0000fff 
> . I/O size 2048 bytes
> libscan: [42949489.000000] Uncorrectable ECC error!!!!  :f0000fff 
> start scanning eraseblocks 0-128[42949489.010000] Uncorrectable ECC
> error!!!!  :f0000fff 
> 
> libscan: scanning eraseblock 0[42949489.010000] Uncorrectable ECC
> error!!!!  :f0000fff 
> : empty
> libscan: scanning eraseblock 1: empty
> libscan: scanning eraseblock 2: empty
> libscan: scanning eraseblock 3: empty
> libscan: scanning eraseblock 4: empty
> libscan: scanning eraseblock 5: empty
> libscan: scanning eraseblock 6: empty
> libscan: scanning eraseblock 7: empty
> libscan: scanning eraseblock 8: empty
> libscan: scanning eraseblock 9: empty
> libscan: scanning eraseblock 10: empty
> libscan: scanning eraseblock 11: empty
> libscan: scanning eraseblock 12: empty
> libscan:[42949489.060000] Uncorrectable ECC error!!!!  :f0000fff 
>  scanning eraseblock 13: empty
> [42949489.070000] Uncorrectable ECC error!!!!  :f0000fff 
> libscan: scanning eraseblock 14:[42949489.080000] Uncorrectable ECC
> error!!!!  :f0000fff 
>  empty
> libscan: scanning eraseb[42949489.090000] Uncorrectable ECC
> error!!!!  :f0000fff 
> lock 15: empty
> libscan: scannin[42949489.090000] Uncorrectable ECC
> error!!!!  :f0000fff 
> g eraseblock 16: empty
> libscan:[42949489.100000] Uncorrectable ECC error!!!!  :f0000fff 
>  scanning eraseblock 17: empty
> libscan: scanning eraseblock 18: empty
> libscan: scanning eraseblock 19: empty
> libscan: scanning eraseblock 20: empty
> libscan: scanning eraseblock 21: empty

...

> [42949490.870000] UBI: logical eraseblock size:    126976 bytes
> [42949490.880000] UBI: smallest flash I/O unit:    2048
> [42949490.880000] UBI: VID header offset:          2048 (aligned 2048)
> [42949490.890000] UBI: data offset:                4096
> [42949490.900000] UBI DBG (pid 90): ubi_scan: process PEB 0
> [42949490.910000] UBI DBG (pid 90): process_eb: scan PEB 0
> [42949490.910000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
> detected at PEB 0
> [42949490.920000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
> PEB 0: 15400000 instead of 55424923
> [42949490.930000] Erase counter header dump:
> [42949490.930000] 	magic          0x15400000
> [42949490.940000] 	version        0
> [42949490.940000] 	ec             0
> [42949490.940000] 	vid_hdr_offset 0
> [42949490.950000] 	data_offset    0
> [42949490.950000] 	hdr_crc        0x000000
> [42949490.950000] erase counter header hexdump:
> [42949490.960000] 00000000: 15 40 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00  .@..............................
> [42949490.970000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00  ................................

OK, I admit UBI should print a better error message when it finds
nothing but rubbish on flash. I'll try to implement this.

But you probably now noticed that UBI could not find a valid nodes, so
something is wrong with your flash. You should check your driver.

:-)

I suggest you nandtests:
http://git.infradead.org/users/ahunter/nand-tests.git

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
