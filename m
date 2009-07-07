Received: from cluster-g.mailcontrol.com ([208.87.233.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOCm3-0007sw-NC
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 15:40:15 +0000
Received: from rly30g.srv.mailcontrol.com (localhost.localdomain [127.0.0.1])
	by rly30g.srv.mailcontrol.com (MailControl) with ESMTP id
	n67FdPZk032232
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jul 2009 16:40:00 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by rly30g.srv.mailcontrol.com (MailControl) id n67FcSWw023017
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jul 2009 16:38:28 +0100
Subject: Re: ubiattach problem
From: Oren <oren_s3@VERIFONE.com>
To: dedekind@infradead.org
In-Reply-To: <1246978420.20721.317.camel@localhost.localdomain>
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
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 7 Jul 2009 18:38:17 +0300
Message-ID: <1246981097.2208.19.camel@tlvorens3lnx>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

cp /mnt/pc/Linux_2_6_27_old/mtd-utils/ubi_format.sh .
~ # chmod 777 ubi_format.sh 
~ # ./ubi_format.sh 
cat /proc/mtd
dev:    size   erasesize  name
mtd0: 01000000 00020000 "NAND-block1"
mtd1: 01e00000 00020000 "jffs2"
mtd2: 05200000 00020000 "NAND-block2"
ubinfo
UBI version:                    1
Count of UBI devices:           0
UBI control device major/minor: 10:63
ubiformat /dev/mtd0 -s 2048 -f ubi_ncomp.img
ubiformat: mtd0 (nand), size 16777216 by[42949488.970000] Uncorrectable
ECC error!!!!  :f0000fff 
tes (16.0 MiB), 128 eraseblocks [42949488.980000] Uncorrectable ECC
error!!!!  :f0000fff 
of 131072 bytes (128.0 KiB), min[42949488.990000] Uncorrectable ECC
error!!!!  :f0000fff 
. I/O size 2048 bytes
libscan: [42949489.000000] Uncorrectable ECC error!!!!  :f0000fff 
start scanning eraseblocks 0-128[42949489.010000] Uncorrectable ECC
error!!!!  :f0000fff 

libscan: scanning eraseblock 0[42949489.010000] Uncorrectable ECC
error!!!!  :f0000fff 
: empty
libscan: scanning eraseblock 1: empty
libscan: scanning eraseblock 2: empty
libscan: scanning eraseblock 3: empty
libscan: scanning eraseblock 4: empty
libscan: scanning eraseblock 5: empty
libscan: scanning eraseblock 6: empty
libscan: scanning eraseblock 7: empty
libscan: scanning eraseblock 8: empty
libscan: scanning eraseblock 9: empty
libscan: scanning eraseblock 10: empty
libscan: scanning eraseblock 11: empty
libscan: scanning eraseblock 12: empty
libscan:[42949489.060000] Uncorrectable ECC error!!!!  :f0000fff 
 scanning eraseblock 13: empty
[42949489.070000] Uncorrectable ECC error!!!!  :f0000fff 
libscan: scanning eraseblock 14:[42949489.080000] Uncorrectable ECC
error!!!!  :f0000fff 
 empty
libscan: scanning eraseb[42949489.090000] Uncorrectable ECC
error!!!!  :f0000fff 
lock 15: empty
libscan: scannin[42949489.090000] Uncorrectable ECC
error!!!!  :f0000fff 
g eraseblock 16: empty
libscan:[42949489.100000] Uncorrectable ECC error!!!!  :f0000fff 
 scanning eraseblock 17: empty
libscan: scanning eraseblock 18: empty
libscan: scanning eraseblock 19: empty
libscan: scanning eraseblock 20: empty
libscan: scanning eraseblock 21: empty
libscan: scanning eraseblock 22: empty
libscan: scanning eraseblock 23: empty
libscan: scanning eraseblock 24: empty
libscan: scanning eraseblock 25: empty
libscan: scanning eraseblock 26: empty
libscan: scanning eraseblock 27: empty
libscan: scanning eraseblock 28: empty
libscan: scanning eraseblock 29: empty
libscan: scanning eraseblock 30: empty
libscan: scanning eraseblock 31: empty
libscan: scanning eraseblock 32: empty
libscan: scanning eraseblock 33: empty
libscan: scanning eraseblock 34: empty
libscan: scanning eraseblock 35: empty
libscan: scanning eraseblock 36: empty
libscan: scanning eraseblock 37: empty
libscan: scanning eraseblock 38: empty
libscan: scanning eraseblock 39: empty
libscan: scanning eraseblock 40: empty
libscan: scanning eraseblock 41: empty
libscan: scanning eraseblock 42: empty
libscan: scanning eraseblock 43: empty
libscan: scanning eraseblock 44: empty
libscan: scanning eraseblock 45: empty
libscan: scanning eraseblock 46: empty
libscan: scanning eraseblock 47: empty
libscan: scanning eraseblock 48: empty
libscan: scanning eraseblock 49: empty
libscan: scanning eraseblock 50: empty
libscan: scanning eraseblock 51: empty
libscan: scanning eraseblock 52: empty
libscan: scanning eraseblock 53: empty
libscan: scanning eraseblock 54: empty
libscan: scanning eraseblock 55: empty
libscan: scanning eraseblock 56: empty
libscan: scanning eraseblock 57: empty
libscan: scanning eraseblock 58: empty
libscan: scanning eraseblock 59: empty
libscan: scanning eraseblock 60: empty
libscan: scanning eraseblock 61: empty
libscan: scanning eraseblock 62: empty
libscan: scanning eraseblock 63: empty
libscan: scanning eraseblock 64: empty
libscan: scanning eraseblock 65: empty
libscan: scanning eraseblock 66: empty
libscan: scanning eraseblock 67: empty
libscan: scanning eraseblock 68: empty
libscan: scanning eraseblock 69: empty
libscan: scanning eraseblock 70: empty
libscan: scanning eraseblock 71: empty
libscan: scanning eraseblock 72: empty
libscan: scanning eraseblock 73: empty
libscan: scanning eraseblock 74: empty
libscan: scanning eraseblock 75: empty
libscan: scanning eraseblock 76: empty
libscan: scanning eraseblock 77: empty
libscan: scanning eraseblock 78: empty
libscan: scanning eraseblock 79: empty
libscan: scanning eraseblock 80: empty
libscan: scanning eraseblock 81: empty
libscan: scanning eraseblock 82: empty
libscan: scanning eraseblock 83: empty
libscan: scanning eraseblock 84: empty
libscan: scanning eraseblock 85: empty
libscan: scanning eraseblock 86: empty
libscan: scanning eraseblock 87: empty
libscan: scanning eraseblock 88: empty
libscan: scanning eraseblock 89: empty
libscan: scanning eraseblock 90: empty
libscan: scanning eraseblock 91: empty
libscan: scanning eraseblock 92: empty
libscan: scanning eraseblock 93: empty
libscan: scanning eraseblock 94: empty
libscan: scanning eraseblock 95: empty
libscan: scanning eraseblock 96: empty
libscan: scanning eraseblock 97: empty
libscan: scanning eraseblock 98: empty
libscan: scanning eraseblock 99: empty
libscan: scanning eraseblock 100: empty
libscan: scanning eraseblock 101: empty
libscan: scanning eraseblock 102: empty
libscan: scanning eraseblock 103: empty
libscan: scanning eraseblock 104: empty
libscan: scanning eraseblock 105: empty
libscan: scanning eraseblock 106: empty
libscan: scanning eraseblock 107: empty
libscan: scanning eraseblock 108: empty
libscan: scanning eraseblock 109: empty
libscan: scanning eraseblock 110: empty
libscan: scanning eraseblock 111: empty
libscan: scanning eraseblock 112: empty
libscan: scanning eraseblock 113: empty
libscan: scanning eraseblock 114: empty
libscan: scanning eraseblock 115: empty
libscan: scanning eraseblock 116: empty
libscan: scanning eraseblock 117: empty
libscan: scanning eraseblock 118: empty
libscan: scanning eraseblock 119: empty
libscan: scanning eraseblock 120: empty
libscan: scanning eraseblock 121: empty
libscan: scanning eraseblock 122: empty
libscan: scanning eraseblock 123: empty
libscan: scanning eraseblock 124: empty
libscan: scanning eraseblock 125: empty
libscan: scanning eraseblock 126: empty
libscan: scanning eraseblock 127: empty
libscan: finished, mean EC 0, 0 OK, 0 corrupted, 128 empty, 0 alien, bad
0
ubiformat: 128 eraseblocks are supposedly empty
ubiformat: will write 17 eraseblocks
ubiformat: eraseblock 0: erase, change EC to 0, write data
ubiformat: eraseblock 1: erase, change EC to 0, write data
ubiformat: eraseblock 2: erase, change EC to 0, write data
ubiformat: eraseblock 3: erase, change EC to 0, write data
ubiformat: eraseblock 4: erase, change EC to 0, write data
ubiformat: eraseblock 5: erase, change EC to 0, write data
ubiformat: eraseblock 6: erase, change EC to 0, write data
ubiformat: eraseblock 7: erase, change EC to 0, write data
ubiformat: eraseblock 8: erase, change EC to 0, write data
ubiformat: eraseblock 9: erase, change EC to 0, write data
ubiformat: eraseblock 10: erase, change EC to 0, write data
ubiformat: eraseblock 11: erase, change EC to 0, write data
ubiformat: eraseblock 12: erase, change EC to 0, write data
ubiformat: eraseblock 13: erase, change EC to 0, write data
ubiformat: eraseblock 14: erase, change EC to 0, write data
ubiformat: eraseblock 15: erase, change EC to 0, write data
ubiformat: eraseblock 16: erase, change EC to 0, write data
ubiformat: eraseblock 17: erase, write EC 0
ubiformat: eraseblock 18: erase, write EC 0
ubiformat: eraseblock 19: erase, write EC 0
ubiformat: eraseblock 20: erase, write EC 0
ubiformat: eraseblock 21: erase, write EC 0
ubiformat: eraseblock 22: erase, write EC 0
ubiformat: eraseblock 23: erase, write EC 0
ubiformat: eraseblock 24: erase, write EC 0
ubiformat: eraseblock 25: erase, write EC 0
ubiformat: eraseblock 26: erase, write EC 0
ubiformat: eraseblock 27: erase, write EC 0
ubiformat: eraseblock 28: erase, write EC 0
ubiformat: eraseblock 29: erase, write EC 0
ubiformat: eraseblock 30: erase, write EC 0
ubiformat: eraseblock 31: erase, write EC 0
ubiformat: eraseblock 32: erase, write EC 0
ubiformat: eraseblock 33: erase, write EC 0
ubiformat: eraseblock 34: erase, write EC 0
ubiformat: eraseblock 35: erase, write EC 0
ubiformat: eraseblock 36: erase, write EC 0
ubiformat: eraseblock 37: erase, write EC 0
ubiformat: eraseblock 38: erase, write EC 0
ubiformat: eraseblock 39: erase, write EC 0
ubiformat: eraseblock 40: erase, write EC 0
ubiformat: eraseblock 41: erase, write EC 0
ubiformat: eraseblock 42: erase, write EC 0
ubiformat: eraseblock 43: erase, write EC 0
ubiformat: eraseblock 44: erase, write EC 0
ubiformat: eraseblock 45: erase, write EC 0
ubiformat: eraseblock 46: erase, write EC 0
ubiformat: eraseblock 47: erase, write EC 0
ubiformat: eraseblock 48: erase, write EC 0
ubiformat: eraseblock 49: erase, write EC 0
ubiformat: eraseblock 50: erase, write EC 0
ubiformat: eraseblock 51: erase, write EC 0
ubiformat: eraseblock 52: erase, write EC 0
ubiformat: eraseblock 53: erase, write EC 0
ubiformat: eraseblock 54: erase, write EC 0
ubiformat: eraseblock 55: erase, write EC 0
ubiformat: eraseblock 56: erase, write EC 0
ubiformat: eraseblock 57: erase, write EC 0
ubiformat: eraseblock 58: erase, write EC 0
ubiformat: eraseblock 59: erase, write EC 0
ubiformat: eraseblock 60: erase, write EC 0
ubiformat: eraseblock 61: erase, write EC 0
ubiformat: eraseblock 62: erase, write EC 0
ubiformat: eraseblock 63: erase, write EC 0
ubiformat: eraseblock 64: erase, write EC 0
ubiformat: eraseblock 65: erase, write EC 0
ubiformat: eraseblock 66: erase, write EC 0
ubiformat: eraseblock 67: erase, write EC 0
ubiformat: eraseblock 68: erase, write EC 0
ubiformat: eraseblock 69: erase, write EC 0
ubiformat: eraseblock 70: erase, write EC 0
ubiformat: eraseblock 71: erase, write EC 0
ubiformat: eraseblock 72: erase, write EC 0
ubiformat: eraseblock 73: erase, write EC 0
ubiformat: eraseblock 74: erase, write EC 0
ubiformat: eraseblock 75: erase, write EC 0
ubiformat: eraseblock 76: erase, write EC 0
ubiformat: eraseblock 77: erase, write EC 0
ubiformat: eraseblock 78: erase, write EC 0
ubiformat: eraseblock 79: erase, write EC 0
ubiformat: eraseblock 80: erase, write EC 0
ubiformat: eraseblock 81: erase, write EC 0
ubiformat: eraseblock 82: erase, write EC 0
ubiformat: eraseblock 83: erase, write EC 0
ubiformat: eraseblock 84: erase, write EC 0
ubiformat: eraseblock 85: erase, write EC 0
ubiformat: eraseblock 86: erase, write EC 0
ubiformat: eraseblock 87: erase, write EC 0
ubiformat: eraseblock 88: erase, write EC 0
ubiformat: eraseblock 89: erase, write EC 0
ubiformat: eraseblock 90: erase, write EC 0
ubiformat: eraseblock 91: erase, write EC 0
ubiformat: eraseblock 92: erase, write EC 0
ubiformat: eraseblock 93: erase, write EC 0
ubiformat: eraseblock 94: erase, write EC 0
ubiformat: eraseblock 95: erase, write EC 0
ubiformat: eraseblock 96: erase, write EC 0
ubiformat: eraseblock 97: erase, write EC 0
ubiformat: eraseblock 98: erase, write EC 0
ubiformat: eraseblock 99: erase, write EC 0
ubiformat: eraseblock 100: erase, write EC 0
ubiformat: eraseblock 101: erase, write EC 0
ubiformat: eraseblock 102: erase, write EC 0
ubiformat: eraseblock 103: erase, write EC 0
ubiformat: eraseblock 104: erase, write EC 0
ubiformat: eraseblock 105: erase, write EC 0
ubiformat: eraseblock 106: erase, write EC 0
ubiformat: eraseblock 107: erase, write EC 0
ubiformat: eraseblock 108: erase, write EC 0
ubiformat: eraseblock 109: erase, write EC 0
ubiformat: eraseblock 110: erase, write EC 0
ubiformat: eraseblock 111: erase, write EC 0
ubiformat: eraseblock 112: erase, write EC 0
ubiformat: eraseblock 113: erase, write EC 0
ubiformat: eraseblock 114: erase, write EC 0
ubiformat: eraseblock 115: erase, write EC 0
ubiformat: eraseblock 116: erase, write EC 0
ubiformat: eraseblock 117: erase, write EC 0
ubiformat: eraseblock 118: erase, write EC 0
ubiformat: eraseblock 119: erase, write EC 0
ubiformat: eraseblock 120: erase, write EC 0
ubiformat: eraseblock 121: erase, write EC 0
ubiformat: eraseblock 122: erase, write EC 0
ubiformat: eraseblock 123: erase, write EC 0
ubiformat: eraseblock 124: erase, write EC 0
ubiformat: eraseblock 125: erase, write EC 0
ubiformat: eraseblock 126: erase, write EC 0
ubiformat: eraseblock 127: erase, write EC 0
ubiattach /dev/ubi_ctrl -m 0
[42949490.810000] UBI DBG (pid 90): ctrl_cdev_ioctl: attach MTD device
[42949490.810000] UBI: attaching mtd0 to ubi0
[42949490.820000] UBI DBG (pid 90): io_init: min_io_size      2048
[42949490.820000] UBI DBG (pid 90): io_init: hdrs_min_io_size 2048
[42949490.830000] UBI DBG (pid 90): io_init: ec_hdr_alsize    2048
[42949490.840000] UBI DBG (pid 90): io_init: vid_hdr_alsize   2048
[42949490.840000] UBI DBG (pid 90): io_init: vid_hdr_offset   2048
[42949490.850000] UBI DBG (pid 90): io_init: vid_hdr_aloffset 2048
[42949490.850000] UBI DBG (pid 90): io_init: vid_hdr_shift    0
[42949490.860000] UBI DBG (pid 90): io_init: leb_start        4096
[42949490.860000] UBI: physical eraseblock size:   131072 bytes (128
KiB)
[42949490.870000] UBI: logical eraseblock size:    126976 bytes
[42949490.880000] UBI: smallest flash I/O unit:    2048
[42949490.880000] UBI: VID header offset:          2048 (aligned 2048)
[42949490.890000] UBI: data offset:                4096
[42949490.900000] UBI DBG (pid 90): ubi_scan: process PEB 0
[42949490.910000] UBI DBG (pid 90): process_eb: scan PEB 0
[42949490.910000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 0
[42949490.920000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 0: 15400000 instead of 55424923
[42949490.930000] Erase counter header dump:
[42949490.930000] 	magic          0x15400000
[42949490.940000] 	version        0
[42949490.940000] 	ec             0
[42949490.940000] 	vid_hdr_offset 0
[42949490.950000] 	data_offset    0
[42949490.950000] 	hdr_crc        0x000000
[42949490.950000] erase counter header hexdump:
[42949490.960000] 00000000: 15 40 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  .@..............................
[42949490.970000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949490.980000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 0
[42949490.980000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 0: 00000000 instead of 55424921
[42949490.990000] Volume identifier header dump:
[42949491.000000] 	magic     00000000
[42949491.000000] 	version   0
[42949491.000000] 	vol_type  0
[42949491.010000] 	copy_flag 0
[42949491.010000] 	compat    0
[42949491.010000] 	vol_id    0
[42949491.020000] 	lnum      0
[42949491.020000] 	data_size 0
[42949491.020000] 	used_ebs  0
[42949491.020000] 	data_pad  0
[42949491.030000] 	sqnum     0
[42949491.030000] 	hdr_crc   00000000
[42949491.030000] Volume identifier header hexdump:
[42949491.040000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949491.050000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949491.060000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
0, EC -1
[42949491.080000] UBI DBG (pid 90): ubi_scan: process PEB 1
[42949491.080000] UBI DBG (pid 90): process_eb: scan PEB 1
[42949491.090000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 1
[42949491.100000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 1: 40000000 instead of 55424923
[42949491.110000] Erase counter header dump:
[42949491.110000] 	magic          0x40000000
[42949491.110000] 	version        0
[42949491.120000] 	ec             0
[42949491.120000] 	vid_hdr_offset 0
[42949491.120000] 	data_offset    0
[42949491.130000] 	hdr_crc        0x000000
[42949491.130000] erase counter header hexdump:
[42949491.130000] 00000000: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
@...............................
[42949491.140000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949491.150000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 1
[42949491.160000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 1: 40000000 instead of 55424921
[42949491.170000] Volume identifier header dump:
[42949491.170000] 	magic     40000000
[42949491.180000] 	version   0
[42949491.180000] 	vol_type  0
[42949491.180000] 	copy_flag 0
[42949491.190000] 	compat    0
[42949491.190000] 	vol_id    0
[42949491.190000] 	lnum      0
[42949491.190000] 	data_size 0
[42949491.200000] 	used_ebs  0
[42949491.200000] 	data_pad  0
[42949491.200000] 	sqnum     0
[42949491.210000] 	hdr_crc   00000000
[42949491.210000] Volume identifier header hexdump:
[42949491.210000] 00000000: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
@...............................
[42949491.220000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949491.230000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
1, EC -1
[42949491.250000] UBI DBG (pid 90): ubi_scan: process PEB 2
[42949491.260000] UBI DBG (pid 90): process_eb: scan PEB 2
[42949491.260000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 2
[42949491.270000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 2: 40000000 instead of 55424923
[42949491.280000] Erase counter header dump:
[42949491.290000] 	magic          0x40000000
[42949491.290000] 	version        0
[42949491.290000] 	ec             0
[42949491.300000] 	vid_hdr_offset 0
[42949491.300000] 	data_offset    0
[42949491.300000] 	hdr_crc        0x000000
[42949491.310000] erase counter header hexdump:
[42949491.310000] 00000000: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
@...............................
[42949491.320000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949491.330000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 2
[42949491.340000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 2: 40000000 instead of 55424921
[42949491.350000] Volume identifier header dump:
[42949491.350000] 	magic     40000000
[42949491.350000] 	version   0
[42949491.360000] 	vol_type  0
[42949491.360000] 	copy_flag 0
[42949491.360000] 	compat    0
[42949491.370000] 	vol_id    0
[42949491.370000] 	lnum      0
[42949491.370000] 	data_size 0
[42949491.370000] 	used_ebs  0
[42949491.380000] 	data_pad  0
[42949491.380000] 	sqnum     0
[42949491.380000] 	hdr_crc   00000000
[42949491.390000] Volume identifier header hexdump:
[42949491.390000] 00000000: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
@...............................
[42949491.400000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949491.410000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
2, EC -1
[42949491.430000] UBI DBG (pid 90): ubi_scan: process PEB 3
[42949491.430000] UBI DBG (pid 90): process_eb: scan PEB 3
[42949491.440000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 3
[42949491.450000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 3: 40000000 instead of 55424923
[42949491.460000] Erase counter header dump:
[42949491.460000] 	magic          0x40000000
[42949491.470000] 	version        0
[42949491.470000] 	ec             0
[42949491.470000] 	vid_hdr_offset 0
[42949491.480000] 	data_offset    0
[42949491.480000] 	hdr_crc        0x000000
[42949491.480000] erase counter header hexdump:
[42949491.490000] 00000000: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
@...............................
[42949491.500000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949491.520000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 3
[42949491.520000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 3: 40000000 instead of 55424921
[42949491.530000] Volume identifier header dump:
[42949491.540000] 	magic     40000000
[42949491.540000] 	version   0
[42949491.540000] 	vol_type  0
[42949491.550000] 	copy_flag 0
[42949491.550000] 	compat    0
[42949491.550000] 	vol_id    0
[42949491.550000] 	lnum      0
[42949491.560000] 	data_size 0
[42949491.560000] 	used_ebs  0
[42949491.560000] 	data_pad  0
[42949491.570000] 	sqnum     0
[42949491.570000] 	hdr_crc   00000000
[42949491.570000] Volume identifier header hexdump:
[42949491.580000] 00000000: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
@...............................
[42949491.590000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949491.600000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
3, EC -1
[42949491.630000] UBI DBG (pid 90): ubi_scan: process PEB 4
[42949491.630000] UBI DBG (pid 90): process_eb: scan PEB 4
[42949491.640000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 4
[42949491.640000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 4: 40000000 instead of 55424923
[42949491.650000] Erase counter header dump:
[42949491.660000] 	magic          0x40000000
[42949491.660000] 	version        0
[42949491.670000] 	ec             0
[42949491.670000] 	vid_hdr_offset 0
[42949491.670000] 	data_offset    0
[42949491.680000] 	hdr_crc        0x000000
[42949491.680000] erase counter header hexdump:
[42949491.680000] 00000000: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
@...............................
[42949491.690000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949491.700000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 4
[42949491.710000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 4: 40000000 instead of 55424921
[42949491.720000] Volume identifier header dump:
[42949491.720000] 	magic     40000000
[42949491.730000] 	version   0
[42949491.730000] 	vol_type  0
[42949491.730000] 	copy_flag 0
[42949491.740000] 	compat    0
[42949491.740000] 	vol_id    0
[42949491.740000] 	lnum      0
[42949491.740000] 	data_size 0
[42949491.750000] 	used_ebs  0
[42949491.750000] 	data_pad  0
[42949491.750000] 	sqnum     0
[42949491.750000] 	hdr_crc   00000000
[42949491.760000] Volume identifier header hexdump:
[42949491.760000] 00000000: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
@...............................
[42949491.770000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949491.780000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
4, EC -1
[42949491.800000] UBI DBG (pid 90): ubi_scan: process PEB 5
[42949491.810000] UBI DBG (pid 90): process_eb: scan PEB 5
[42949491.810000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 5
[42949491.820000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 5: 40000000 instead of 55424923
[42949491.830000] Erase counter header dump:
[42949491.830000] 	magic          0x40000000
[42949491.840000] 	version        0
[42949491.840000] 	ec             0
[42949491.840000] 	vid_hdr_offset 0
[42949491.850000] 	data_offset    0
[42949491.850000] 	hdr_crc        0x000000
[42949491.860000] erase counter header hexdump:
[42949491.860000] 00000000: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
@...............................
[42949491.870000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949491.880000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 5
[42949491.890000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 5: 40000000 instead of 55424921
[42949491.890000] Volume identifier header dump:
[42949491.900000] 	magic     40000000
[42949491.900000] 	version   0
[42949491.910000] 	vol_type  0
[42949491.910000] 	copy_flag 0
[42949491.910000] 	compat    0
[42949491.910000] 	vol_id    0
[42949491.920000] 	lnum      0
[42949491.920000] 	data_size 0
[42949491.920000] 	used_ebs  0
[42949491.920000] 	data_pad  0
[42949491.930000] 	sqnum     0
[42949491.930000] 	hdr_crc   00000000
[42949491.930000] Volume identifier header hexdump:
[42949491.940000] 00000000: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
@...............................
[42949491.950000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949491.960000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
5, EC -1
[42949491.980000] UBI DBG (pid 90): ubi_scan: process PEB 6
[42949491.980000] UBI DBG (pid 90): process_eb: scan PEB 6
[42949491.990000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 6
[42949492.000000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 6: 40000000 instead of 55424923
[42949492.010000] Erase counter header dump:
[42949492.010000] 	magic          0x40000000
[42949492.010000] 	version        0
[42949492.020000] 	ec             0
[42949492.020000] 	vid_hdr_offset 0
[42949492.020000] 	data_offset    0
[42949492.030000] 	hdr_crc        0x000000
[42949492.030000] erase counter header hexdump:
[42949492.040000] 00000000: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
@...............................
[42949492.050000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.060000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 6
[42949492.070000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 6: 40000000 instead of 55424921
[42949492.080000] Volume identifier header dump:
[42949492.090000] 	magic     40000000
[42949492.090000] 	version   0
[42949492.090000] 	vol_type  0
[42949492.090000] 	copy_flag 0
[42949492.100000] 	compat    0
[42949492.100000] 	vol_id    0
[42949492.100000] 	lnum      0
[42949492.110000] 	data_size 0
[42949492.110000] 	used_ebs  0
[42949492.110000] 	data_pad  0
[42949492.110000] 	sqnum     0
[42949492.120000] 	hdr_crc   00000000
[42949492.120000] Volume identifier header hexdump:
[42949492.120000] 00000000: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
@...............................
[42949492.130000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.140000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
6, EC -1
[42949492.160000] UBI DBG (pid 90): ubi_scan: process PEB 7
[42949492.170000] UBI DBG (pid 90): process_eb: scan PEB 7
[42949492.180000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 7
[42949492.180000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 7: 40000000 instead of 55424923
[42949492.190000] Erase counter header dump:
[42949492.200000] 	magic          0x40000000
[42949492.200000] 	version        0
[42949492.200000] 	ec             0
[42949492.210000] 	vid_hdr_offset 0
[42949492.210000] 	data_offset    0
[42949492.210000] 	hdr_crc        0x000000
[42949492.220000] erase counter header hexdump:
[42949492.220000] 00000000: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
@...............................
[42949492.230000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.240000] UBI DBG (pid 90): ubi_io_read: fixable bit-flip
detected at PEB 7
[42949492.250000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 7: 40000000 instead of 55424921
[42949492.260000] Volume identifier header dump:
[42949492.260000] 	magic     40000000
[42949492.260000] 	version   0
[42949492.270000] 	vol_type  0
[42949492.270000] 	copy_flag 0
[42949492.270000] 	compat    0
[42949492.280000] 	vol_id    0
[42949492.280000] 	lnum      0
[42949492.280000] 	data_size 0
[42949492.280000] 	used_ebs  0
[42949492.290000] 	data_pad  0
[42949492.290000] 	sqnum     0
[42949492.290000] 	hdr_crc   00000000
[42949492.300000] Volume identifier header hexdump:
[42949492.300000] 00000000: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
@...............................
[42949492.310000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.320000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
7, EC -1
[42949492.340000] UBI DBG (pid 90): ubi_scan: process PEB 8
[42949492.350000] UBI DBG (pid 90): process_eb: scan PEB 8
[42949492.350000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 8: 00000000 instead of 55424923
[42949492.360000] Erase counter header dump:
[42949492.370000] 	magic          0x000000
[42949492.370000] 	version        0
[42949492.370000] 	ec             0
[42949492.380000] 	vid_hdr_offset 0
[42949492.380000] 	data_offset    0
[42949492.380000] 	hdr_crc        0x000000
[42949492.390000] erase counter header hexdump:
[42949492.390000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.400000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.410000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 8: 00000000 instead of 55424921
[42949492.420000] Volume identifier header dump:
[42949492.420000] 	magic     00000000
[42949492.430000] 	version   0
[42949492.430000] 	vol_type  0
[42949492.430000] 	copy_flag 0
[42949492.430000] 	compat    0
[42949492.440000] 	vol_id    0
[42949492.440000] 	lnum      0
[42949492.440000] 	data_size 0
[42949492.450000] 	used_ebs  0
[42949492.450000] 	data_pad  0
[42949492.450000] 	sqnum     0
[42949492.450000] 	hdr_crc   00000000
[42949492.460000] Volume identifier header hexdump:
[42949492.460000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.470000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.480000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
8, EC -1
[42949492.500000] UBI DBG (pid 90): ubi_scan: process PEB 9
[42949492.510000] UBI DBG (pid 90): process_eb: scan PEB 9
[42949492.510000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 9: 00000000 instead of 55424923
[42949492.520000] Erase counter header dump:
[42949492.530000] 	magic          0x000000
[42949492.530000] 	version        0
[42949492.530000] 	ec             0
[42949492.540000] 	vid_hdr_offset 0
[42949492.540000] 	data_offset    0
[42949492.540000] 	hdr_crc        0x000000
[42949492.550000] erase counter header hexdump:
[42949492.550000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.560000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.570000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 9: 00000000 instead of 55424921
[42949492.580000] Volume identifier header dump:
[42949492.580000] 	magic     00000000
[42949492.590000] 	version   0
[42949492.590000] 	vol_type  0
[42949492.590000] 	copy_flag 0
[42949492.590000] 	compat    0
[42949492.600000] 	vol_id    0
[42949492.600000] 	lnum      0
[42949492.600000] 	data_size 0
[42949492.610000] 	used_ebs  0
[42949492.610000] 	data_pad  0
[42949492.610000] 	sqnum     0
[42949492.610000] 	hdr_crc   00000000
[42949492.620000] Volume identifier header hexdump:
[42949492.620000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.630000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.640000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
9, EC -1
[42949492.660000] UBI DBG (pid 90): ubi_scan: process PEB 10
[42949492.670000] UBI DBG (pid 90): process_eb: scan PEB 10
[42949492.670000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 10: 00000000 instead of 55424923
[42949492.680000] Erase counter header dump:
[42949492.690000] 	magic          0x000000
[42949492.690000] 	version        0
[42949492.690000] 	ec             0
[42949492.700000] 	vid_hdr_offset 0
[42949492.700000] 	data_offset    0
[42949492.700000] 	hdr_crc        0x000000
[42949492.710000] erase counter header hexdump:
[42949492.710000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.720000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.730000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 10: 00000000 instead of 55424921
[42949492.740000] Volume identifier header dump:
[42949492.740000] 	magic     00000000
[42949492.750000] 	version   0
[42949492.750000] 	vol_type  0
[42949492.750000] 	copy_flag 0
[42949492.760000] 	compat    0
[42949492.760000] 	vol_id    0
[42949492.760000] 	lnum      0
[42949492.760000] 	data_size 0
[42949492.770000] 	used_ebs  0
[42949492.770000] 	data_pad  0
[42949492.770000] 	sqnum     0
[42949492.780000] 	hdr_crc   00000000
[42949492.780000] Volume identifier header hexdump:
[42949492.780000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.790000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.800000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
10, EC -1
[42949492.820000] UBI DBG (pid 90): ubi_scan: process PEB 11
[42949492.830000] UBI DBG (pid 90): process_eb: scan PEB 11
[42949492.830000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 11: 00000000 instead of 55424923
[42949492.840000] Erase counter header dump:
[42949492.850000] 	magic          0x000000
[42949492.850000] 	version        0
[42949492.850000] 	ec             0
[42949492.860000] 	vid_hdr_offset 0
[42949492.860000] 	data_offset    0
[42949492.860000] 	hdr_crc        0x000000
[42949492.870000] erase counter header hexdump:
[42949492.870000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.880000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.890000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 11: 00000000 instead of 55424921
[42949492.900000] Volume identifier header dump:
[42949492.900000] 	magic     00000000
[42949492.910000] 	version   0
[42949492.910000] 	vol_type  0
[42949492.910000] 	copy_flag 0
[42949492.920000] 	compat    0
[42949492.920000] 	vol_id    0
[42949492.920000] 	lnum      0
[42949492.920000] 	data_size 0
[42949492.930000] 	used_ebs  0
[42949492.930000] 	data_pad  0
[42949492.930000] 	sqnum     0
[42949492.940000] 	hdr_crc   00000000
[42949492.940000] Volume identifier header hexdump:
[42949492.940000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.950000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949492.960000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
11, EC -1
[42949492.980000] UBI DBG (pid 90): ubi_scan: process PEB 12
[42949492.990000] UBI DBG (pid 90): process_eb: scan PEB 12
[42949492.990000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 12: 00000000 instead of 55424923
[42949493.000000] Erase counter header dump:
[42949493.010000] 	magic          0x000000
[42949493.010000] 	version        0
[42949493.010000] 	ec             0
[42949493.020000] 	vid_hdr_offset 0
[42949493.020000] 	data_offset    0
[42949493.020000] 	hdr_crc        0x000000
[42949493.030000] erase counter header hexdump:
[42949493.030000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.040000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.050000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 12: 00000000 instead of 55424921
[42949493.060000] Volume identifier header dump:
[42949493.060000] 	magic     00000000
[42949493.070000] 	version   0
[42949493.070000] 	vol_type  0
[42949493.070000] 	copy_flag 0
[42949493.080000] 	compat    0
[42949493.080000] 	vol_id    0
[42949493.080000] 	lnum      0
[42949493.080000] 	data_size 0
[42949493.090000] 	used_ebs  0
[42949493.090000] 	data_pad  0
[42949493.090000] 	sqnum     0
[42949493.100000] 	hdr_crc   00000000
[42949493.100000] Volume identifier header hexdump:
[42949493.100000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.110000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.120000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
12, EC -1
[42949493.140000] UBI DBG (pid 90): ubi_scan: process PEB 13
[42949493.150000] UBI DBG (pid 90): process_eb: scan PEB 13
[42949493.150000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 13: 00000000 instead of 55424923
[42949493.160000] Erase counter header dump:
[42949493.170000] 	magic          0x000000
[42949493.170000] 	version        0
[42949493.170000] 	ec             0
[42949493.180000] 	vid_hdr_offset 0
[42949493.180000] 	data_offset    0
[42949493.180000] 	hdr_crc        0x000000
[42949493.190000] erase counter header hexdump:
[42949493.190000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.200000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.210000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 13: 00000000 instead of 55424921
[42949493.220000] Volume identifier header dump:
[42949493.230000] 	magic     00000000
[42949493.230000] 	version   0
[42949493.230000] 	vol_type  0
[42949493.230000] 	copy_flag 0
[42949493.240000] 	compat    0
[42949493.240000] 	vol_id    0
[42949493.240000] 	lnum      0
[42949493.250000] 	data_size 0
[42949493.250000] 	used_ebs  0
[42949493.250000] 	data_pad  0
[42949493.250000] 	sqnum     0
[42949493.260000] 	hdr_crc   00000000
[42949493.260000] Volume identifier header hexdump:
[42949493.260000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.270000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.280000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
13, EC -1
[42949493.300000] UBI DBG (pid 90): ubi_scan: process PEB 14
[42949493.310000] UBI DBG (pid 90): process_eb: scan PEB 14
[42949493.320000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 14: 00000000 instead of 55424923
[42949493.320000] Erase counter header dump:
[42949493.330000] 	magic          0x000000
[42949493.330000] 	version        0
[42949493.340000] 	ec             0
[42949493.340000] 	vid_hdr_offset 0
[42949493.340000] 	data_offset    0
[42949493.350000] 	hdr_crc        0x000000
[42949493.350000] erase counter header hexdump:
[42949493.350000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.360000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.370000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 14: 00000000 instead of 55424921
[42949493.380000] Volume identifier header dump:
[42949493.390000] 	magic     00000000
[42949493.390000] 	version   0
[42949493.390000] 	vol_type  0
[42949493.390000] 	copy_flag 0
[42949493.400000] 	compat    0
[42949493.400000] 	vol_id    0
[42949493.400000] 	lnum      0
[42949493.410000] 	data_size 0
[42949493.410000] 	used_ebs  0
[42949493.410000] 	data_pad  0
[42949493.410000] 	sqnum     0
[42949493.420000] 	hdr_crc   00000000
[42949493.420000] Volume identifier header hexdump:
[42949493.430000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.440000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.450000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
14, EC -1
[42949493.470000] UBI DBG (pid 90): ubi_scan: process PEB 15
[42949493.480000] UBI DBG (pid 90): process_eb: scan PEB 15
[42949493.490000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 15: 00000000 instead of 55424923
[42949493.490000] Erase counter header dump:
[42949493.500000] 	magic          0x000000
[42949493.500000] 	version        0
[42949493.510000] 	ec             0
[42949493.510000] 	vid_hdr_offset 0
[42949493.510000] 	data_offset    0
[42949493.520000] 	hdr_crc        0x000000
[42949493.520000] erase counter header hexdump:
[42949493.520000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.530000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.540000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 15: 00000000 instead of 55424921
[42949493.550000] Volume identifier header dump:
[42949493.560000] 	magic     00000000
[42949493.560000] 	version   0
[42949493.560000] 	vol_type  0
[42949493.570000] 	copy_flag 0
[42949493.570000] 	compat    0
[42949493.570000] 	vol_id    0
[42949493.570000] 	lnum      0
[42949493.580000] 	data_size 0
[42949493.580000] 	used_ebs  0
[42949493.580000] 	data_pad  0
[42949493.580000] 	sqnum     0
[42949493.590000] 	hdr_crc   00000000
[42949493.590000] Volume identifier header hexdump:
[42949493.600000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.610000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.620000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
15, EC -1
[42949493.640000] UBI DBG (pid 90): ubi_scan: process PEB 16
[42949493.650000] UBI DBG (pid 90): process_eb: scan PEB 16
[42949493.660000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 16: 00000000 instead of 55424923
[42949493.670000] Erase counter header dump:
[42949493.670000] 	magic          0x000000
[42949493.670000] 	version        0
[42949493.680000] 	ec             0
[42949493.680000] 	vid_hdr_offset 0
[42949493.680000] 	data_offset    0
[42949493.690000] 	hdr_crc        0x000000
[42949493.690000] erase counter header hexdump:
[42949493.690000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.700000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.710000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 16: 00000000 instead of 55424921
[42949493.720000] Volume identifier header dump:
[42949493.730000] 	magic     00000000
[42949493.730000] 	version   0
[42949493.730000] 	vol_type  0
[42949493.740000] 	copy_flag 0
[42949493.740000] 	compat    0
[42949493.740000] 	vol_id    0
[42949493.740000] 	lnum      0
[42949493.750000] 	data_size 0
[42949493.750000] 	used_ebs  0
[42949493.750000] 	data_pad  0
[42949493.750000] 	sqnum     0
[42949493.760000] 	hdr_crc   00000000
[42949493.760000] Volume identifier header hexdump:
[42949493.770000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.780000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.790000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
16, EC -1
[42949493.810000] UBI DBG (pid 90): ubi_scan: process PEB 17
[42949493.820000] UBI DBG (pid 90): process_eb: scan PEB 17
[42949493.830000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 17: 00000000 instead of 55424923
[42949493.840000] Erase counter header dump:
[42949493.840000] 	magic          0x000000
[42949493.840000] 	version        0
[42949493.850000] 	ec             0
[42949493.850000] 	vid_hdr_offset 0
[42949493.850000] 	data_offset    0
[42949493.860000] 	hdr_crc        0x000000
[42949493.860000] erase counter header hexdump:
[42949493.860000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.870000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.880000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 17: 00000000 instead of 55424921
[42949493.890000] Volume identifier header dump:
[42949493.900000] 	magic     00000000
[42949493.900000] 	version   0
[42949493.900000] 	vol_type  0
[42949493.910000] 	copy_flag 0
[42949493.910000] 	compat    0
[42949493.910000] 	vol_id    0
[42949493.910000] 	lnum      0
[42949493.920000] 	data_size 0
[42949493.920000] 	used_ebs  0
[42949493.920000] 	data_pad  0
[42949493.930000] 	sqnum     0
[42949493.930000] 	hdr_crc   00000000
[42949493.930000] Volume identifier header hexdump:
[42949493.940000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.950000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949493.960000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
17, EC -1
[42949493.980000] UBI DBG (pid 90): ubi_scan: process PEB 18
[42949493.990000] UBI DBG (pid 90): process_eb: scan PEB 18
[42949494.000000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 18: 00000000 instead of 55424923
[42949494.010000] Erase counter header dump:
[42949494.010000] 	magic          0x000000
[42949494.010000] 	version        0
[42949494.020000] 	ec             0
[42949494.020000] 	vid_hdr_offset 0
[42949494.020000] 	data_offset    0
[42949494.030000] 	hdr_crc        0x000000
[42949494.030000] erase counter header hexdump:
[42949494.040000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.050000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.060000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 18: 00000000 instead of 55424921
[42949494.070000] Volume identifier header dump:
[42949494.080000] 	magic     00000000
[42949494.080000] 	version   0
[42949494.080000] 	vol_type  0
[42949494.090000] 	copy_flag 0
[42949494.090000] 	compat    0
[42949494.090000] 	vol_id    0
[42949494.100000] 	lnum      0
[42949494.100000] 	data_size 0
[42949494.100000] 	used_ebs  0
[42949494.100000] 	data_pad  0
[42949494.110000] 	sqnum     0
[42949494.110000] 	hdr_crc   00000000
[42949494.110000] Volume identifier header hexdump:
[42949494.120000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.130000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.140000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
18, EC -1
[42949494.170000] UBI DBG (pid 90): ubi_scan: process PEB 19
[42949494.170000] UBI DBG (pid 90): process_eb: scan PEB 19
[42949494.180000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 19: 00000000 instead of 55424923
[42949494.190000] Erase counter header dump:
[42949494.190000] 	magic          0x000000
[42949494.200000] 	version        0
[42949494.200000] 	ec             0
[42949494.200000] 	vid_hdr_offset 0
[42949494.210000] 	data_offset    0
[42949494.210000] 	hdr_crc        0x000000
[42949494.210000] erase counter header hexdump:
[42949494.220000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.230000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.240000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 19: 00000000 instead of 55424921
[42949494.250000] Volume identifier header dump:
[42949494.260000] 	magic     00000000
[42949494.260000] 	version   0
[42949494.260000] 	vol_type  0
[42949494.270000] 	copy_flag 0
[42949494.270000] 	compat    0
[42949494.270000] 	vol_id    0
[42949494.280000] 	lnum      0
[42949494.280000] 	data_size 0
[42949494.280000] 	used_ebs  0
[42949494.280000] 	data_pad  0
[42949494.290000] 	sqnum     0
[42949494.290000] 	hdr_crc   00000000
[42949494.290000] Volume identifier header hexdump:
[42949494.300000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.310000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.320000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
19, EC -1
[42949494.340000] UBI DBG (pid 90): ubi_scan: process PEB 20
[42949494.340000] UBI DBG (pid 90): process_eb: scan PEB 20
[42949494.350000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 20: 00000000 instead of 55424923
[42949494.360000] Erase counter header dump:
[42949494.360000] 	magic          0x000000
[42949494.370000] 	version        0
[42949494.370000] 	ec             0
[42949494.370000] 	vid_hdr_offset 0
[42949494.380000] 	data_offset    0
[42949494.380000] 	hdr_crc        0x000000
[42949494.380000] erase counter header hexdump:
[42949494.390000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.400000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.420000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 20: 00000000 instead of 55424921
[42949494.430000] Volume identifier header dump:
[42949494.430000] 	magic     00000000
[42949494.430000] 	version   0
[42949494.440000] 	vol_type  0
[42949494.440000] 	copy_flag 0
[42949494.440000] 	compat    0
[42949494.440000] 	vol_id    0
[42949494.450000] 	lnum      0
[42949494.450000] 	data_size 0
[42949494.450000] 	used_ebs  0
[42949494.460000] 	data_pad  0
[42949494.460000] 	sqnum     0
[42949494.460000] 	hdr_crc   00000000
[42949494.460000] Volume identifier header hexdump:
[42949494.470000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.480000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.490000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
20, EC -1
[42949494.510000] UBI DBG (pid 90): ubi_scan: process PEB 21
[42949494.510000] UBI DBG (pid 90): process_eb: scan PEB 21
[42949494.520000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 21: 00000000 instead of 55424923
[42949494.530000] Erase counter header dump:
[42949494.530000] 	magic          0x000000
[42949494.540000] 	version        0
[42949494.540000] 	ec             0
[42949494.540000] 	vid_hdr_offset 0
[42949494.550000] 	data_offset    0
[42949494.550000] 	hdr_crc        0x000000
[42949494.550000] erase counter header hexdump:
[42949494.560000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.570000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.580000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 21: 00000000 instead of 55424921
[42949494.590000] Volume identifier header dump:
[42949494.590000] 	magic     00000000
[42949494.590000] 	version   0
[42949494.600000] 	vol_type  0
[42949494.600000] 	copy_flag 0
[42949494.600000] 	compat    0
[42949494.610000] 	vol_id    0
[42949494.610000] 	lnum      0
[42949494.610000] 	data_size 0
[42949494.610000] 	used_ebs  0
[42949494.620000] 	data_pad  0
[42949494.620000] 	sqnum     0
[42949494.620000] 	hdr_crc   00000000
[42949494.630000] Volume identifier header hexdump:
[42949494.630000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.640000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.650000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
21, EC -1
[42949494.670000] UBI DBG (pid 90): ubi_scan: process PEB 22
[42949494.670000] UBI DBG (pid 90): process_eb: scan PEB 22
[42949494.680000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 22: 00000000 instead of 55424923
[42949494.690000] Erase counter header dump:
[42949494.690000] 	magic          0x000000
[42949494.700000] 	version        0
[42949494.700000] 	ec             0
[42949494.700000] 	vid_hdr_offset 0
[42949494.710000] 	data_offset    0
[42949494.710000] 	hdr_crc        0x000000
[42949494.710000] erase counter header hexdump:
[42949494.720000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.730000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.740000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 22: 00000000 instead of 55424921
[42949494.750000] Volume identifier header dump:
[42949494.750000] 	magic     00000000
[42949494.750000] 	version   0
[42949494.760000] 	vol_type  0
[42949494.760000] 	copy_flag 0
[42949494.760000] 	compat    0
[42949494.770000] 	vol_id    0
[42949494.770000] 	lnum      0
[42949494.770000] 	data_size 0
[42949494.770000] 	used_ebs  0
[42949494.780000] 	data_pad  0
[42949494.780000] 	sqnum     0
[42949494.780000] 	hdr_crc   00000000
[42949494.790000] Volume identifier header hexdump:
[42949494.790000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.800000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.810000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
22, EC -1
[42949494.830000] UBI DBG (pid 90): ubi_scan: process PEB 23
[42949494.830000] UBI DBG (pid 90): process_eb: scan PEB 23
[42949494.840000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 23: 00000000 instead of 55424923
[42949494.850000] Erase counter header dump:
[42949494.850000] 	magic          0x000000
[42949494.860000] 	version        0
[42949494.860000] 	ec             0
[42949494.860000] 	vid_hdr_offset 0
[42949494.870000] 	data_offset    0
[42949494.870000] 	hdr_crc        0x000000
[42949494.880000] erase counter header hexdump:
[42949494.880000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.890000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.900000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 23: 00000000 instead of 55424921
[42949494.910000] Volume identifier header dump:
[42949494.910000] 	magic     00000000
[42949494.920000] 	version   0
[42949494.920000] 	vol_type  0
[42949494.920000] 	copy_flag 0
[42949494.920000] 	compat    0
[42949494.930000] 	vol_id    0
[42949494.930000] 	lnum      0
[42949494.930000] 	data_size 0
[42949494.930000] 	used_ebs  0
[42949494.940000] 	data_pad  0
[42949494.940000] 	sqnum     0
[42949494.940000] 	hdr_crc   00000000
[42949494.950000] Volume identifier header hexdump:
[42949494.950000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.970000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949494.980000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
23, EC -1
[42949495.000000] UBI DBG (pid 90): ubi_scan: process PEB 24
[42949495.010000] UBI DBG (pid 90): process_eb: scan PEB 24
[42949495.010000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 24: 00000000 instead of 55424923
[42949495.020000] Erase counter header dump:
[42949495.020000] 	magic          0x000000
[42949495.030000] 	version        0
[42949495.030000] 	ec             0
[42949495.040000] 	vid_hdr_offset 0
[42949495.040000] 	data_offset    0
[42949495.040000] 	hdr_crc        0x000000
[42949495.050000] erase counter header hexdump:
[42949495.050000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.060000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.070000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 24: 00000000 instead of 55424921
[42949495.080000] Volume identifier header dump:
[42949495.080000] 	magic     00000000
[42949495.090000] 	version   0
[42949495.090000] 	vol_type  0
[42949495.090000] 	copy_flag 0
[42949495.090000] 	compat    0
[42949495.100000] 	vol_id    0
[42949495.100000] 	lnum      0
[42949495.100000] 	data_size 0
[42949495.110000] 	used_ebs  0
[42949495.110000] 	data_pad  0
[42949495.110000] 	sqnum     0
[42949495.110000] 	hdr_crc   00000000
[42949495.120000] Volume identifier header hexdump:
[42949495.120000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.130000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.140000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
24, EC -1
[42949495.160000] UBI DBG (pid 90): ubi_scan: process PEB 25
[42949495.170000] UBI DBG (pid 90): process_eb: scan PEB 25
[42949495.170000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 25: 00000000 instead of 55424923
[42949495.180000] Erase counter header dump:
[42949495.190000] 	magic          0x000000
[42949495.190000] 	version        0
[42949495.190000] 	ec             0
[42949495.200000] 	vid_hdr_offset 0
[42949495.200000] 	data_offset    0
[42949495.200000] 	hdr_crc        0x000000
[42949495.210000] erase counter header hexdump:
[42949495.210000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.220000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.230000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 25: 00000000 instead of 55424921
[42949495.240000] Volume identifier header dump:
[42949495.240000] 	magic     00000000
[42949495.250000] 	version   0
[42949495.250000] 	vol_type  0
[42949495.250000] 	copy_flag 0
[42949495.250000] 	compat    0
[42949495.260000] 	vol_id    0
[42949495.260000] 	lnum      0
[42949495.260000] 	data_size 0
[42949495.270000] 	used_ebs  0
[42949495.270000] 	data_pad  0
[42949495.270000] 	sqnum     0
[42949495.270000] 	hdr_crc   00000000
[42949495.280000] Volume identifier header hexdump:
[42949495.280000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.290000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.300000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
25, EC -1
[42949495.320000] UBI DBG (pid 90): ubi_scan: process PEB 26
[42949495.330000] UBI DBG (pid 90): process_eb: scan PEB 26
[42949495.330000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 26: 00000000 instead of 55424923
[42949495.340000] Erase counter header dump:
[42949495.350000] 	magic          0x000000
[42949495.350000] 	version        0
[42949495.350000] 	ec             0
[42949495.360000] 	vid_hdr_offset 0
[42949495.360000] 	data_offset    0
[42949495.360000] 	hdr_crc        0x000000
[42949495.370000] erase counter header hexdump:
[42949495.370000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.380000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.390000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 26: 00000000 instead of 55424921
[42949495.400000] Volume identifier header dump:
[42949495.400000] 	magic     00000000
[42949495.410000] 	version   0
[42949495.410000] 	vol_type  0
[42949495.410000] 	copy_flag 0
[42949495.420000] 	compat    0
[42949495.420000] 	vol_id    0
[42949495.420000] 	lnum      0
[42949495.420000] 	data_size 0
[42949495.430000] 	used_ebs  0
[42949495.430000] 	data_pad  0
[42949495.430000] 	sqnum     0
[42949495.430000] 	hdr_crc   00000000
[42949495.440000] Volume identifier header hexdump:
[42949495.440000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.450000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.460000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
26, EC -1
[42949495.480000] UBI DBG (pid 90): ubi_scan: process PEB 27
[42949495.490000] UBI DBG (pid 90): process_eb: scan PEB 27
[42949495.490000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 27: 00000000 instead of 55424923
[42949495.500000] Erase counter header dump:
[42949495.510000] 	magic          0x000000
[42949495.510000] 	version        0
[42949495.510000] 	ec             0
[42949495.520000] 	vid_hdr_offset 0
[42949495.520000] 	data_offset    0
[42949495.520000] 	hdr_crc        0x000000
[42949495.530000] erase counter header hexdump:
[42949495.530000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.540000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.550000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 27: 00000000 instead of 55424921
[42949495.560000] Volume identifier header dump:
[42949495.560000] 	magic     00000000
[42949495.570000] 	version   0
[42949495.570000] 	vol_type  0
[42949495.570000] 	copy_flag 0
[42949495.580000] 	compat    0
[42949495.580000] 	vol_id    0
[42949495.580000] 	lnum      0
[42949495.580000] 	data_size 0
[42949495.590000] 	used_ebs  0
[42949495.590000] 	data_pad  0
[42949495.590000] 	sqnum     0
[42949495.600000] 	hdr_crc   00000000
[42949495.600000] Volume identifier header hexdump:
[42949495.600000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.610000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.620000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
27, EC -1
[42949495.640000] UBI DBG (pid 90): ubi_scan: process PEB 28
[42949495.650000] UBI DBG (pid 90): process_eb: scan PEB 28
[42949495.650000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 28: 00000000 instead of 55424923
[42949495.660000] Erase counter header dump:
[42949495.670000] 	magic          0x000000
[42949495.670000] 	version        0
[42949495.670000] 	ec             0
[42949495.680000] 	vid_hdr_offset 0
[42949495.680000] 	data_offset    0
[42949495.680000] 	hdr_crc        0x000000
[42949495.690000] erase counter header hexdump:
[42949495.690000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.700000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.710000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 28: 00000000 instead of 55424921
[42949495.720000] Volume identifier header dump:
[42949495.720000] 	magic     00000000
[42949495.730000] 	version   0
[42949495.730000] 	vol_type  0
[42949495.730000] 	copy_flag 0
[42949495.740000] 	compat    0
[42949495.740000] 	vol_id    0
[42949495.740000] 	lnum      0
[42949495.740000] 	data_size 0
[42949495.750000] 	used_ebs  0
[42949495.750000] 	data_pad  0
[42949495.750000] 	sqnum     0
[42949495.760000] 	hdr_crc   00000000
[42949495.760000] Volume identifier header hexdump:
[42949495.760000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.770000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.780000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
28, EC -1
[42949495.800000] UBI DBG (pid 90): ubi_scan: process PEB 29
[42949495.810000] UBI DBG (pid 90): process_eb: scan PEB 29
[42949495.810000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 29: 00000000 instead of 55424923
[42949495.820000] Erase counter header dump:
[42949495.830000] 	magic          0x000000
[42949495.830000] 	version        0
[42949495.830000] 	ec             0
[42949495.840000] 	vid_hdr_offset 0
[42949495.840000] 	data_offset    0
[42949495.840000] 	hdr_crc        0x000000
[42949495.850000] erase counter header hexdump:
[42949495.850000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.860000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.870000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 29: 00000000 instead of 55424921
[42949495.880000] Volume identifier header dump:
[42949495.880000] 	magic     00000000
[42949495.890000] 	version   0
[42949495.890000] 	vol_type  0
[42949495.890000] 	copy_flag 0
[42949495.900000] 	compat    0
[42949495.900000] 	vol_id    0
[42949495.900000] 	lnum      0
[42949495.900000] 	data_size 0
[42949495.910000] 	used_ebs  0
[42949495.910000] 	data_pad  0
[42949495.910000] 	sqnum     0
[42949495.920000] 	hdr_crc   00000000
[42949495.920000] Volume identifier header hexdump:
[42949495.920000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.930000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949495.940000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
29, EC -1
[42949495.960000] UBI DBG (pid 90): ubi_scan: process PEB 30
[42949495.970000] UBI DBG (pid 90): process_eb: scan PEB 30
[42949495.970000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 30: 00000000 instead of 55424923
[42949495.980000] Erase counter header dump:
[42949495.990000] 	magic          0x000000
[42949495.990000] 	version        0
[42949495.990000] 	ec             0
[42949496.000000] 	vid_hdr_offset 0
[42949496.000000] 	data_offset    0
[42949496.000000] 	hdr_crc        0x000000
[42949496.010000] erase counter header hexdump:
[42949496.010000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.020000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.030000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 30: 00000000 instead of 55424921
[42949496.040000] Volume identifier header dump:
[42949496.050000] 	magic     00000000
[42949496.050000] 	version   0
[42949496.050000] 	vol_type  0
[42949496.050000] 	copy_flag 0
[42949496.060000] 	compat    0
[42949496.060000] 	vol_id    0
[42949496.060000] 	lnum      0
[42949496.070000] 	data_size 0
[42949496.070000] 	used_ebs  0
[42949496.070000] 	data_pad  0
[42949496.070000] 	sqnum     0
[42949496.080000] 	hdr_crc   00000000
[42949496.080000] Volume identifier header hexdump:
[42949496.080000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.090000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.100000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
30, EC -1
[42949496.120000] UBI DBG (pid 90): ubi_scan: process PEB 31
[42949496.130000] UBI DBG (pid 90): process_eb: scan PEB 31
[42949496.140000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 31: 00000000 instead of 55424923
[42949496.140000] Erase counter header dump:
[42949496.150000] 	magic          0x000000
[42949496.150000] 	version        0
[42949496.160000] 	ec             0
[42949496.160000] 	vid_hdr_offset 0
[42949496.160000] 	data_offset    0
[42949496.170000] 	hdr_crc        0x000000
[42949496.170000] erase counter header hexdump:
[42949496.170000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.180000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.190000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 31: 00000000 instead of 55424921
[42949496.200000] Volume identifier header dump:
[42949496.210000] 	magic     00000000
[42949496.210000] 	version   0
[42949496.210000] 	vol_type  0
[42949496.210000] 	copy_flag 0
[42949496.220000] 	compat    0
[42949496.220000] 	vol_id    0
[42949496.220000] 	lnum      0
[42949496.230000] 	data_size 0
[42949496.230000] 	used_ebs  0
[42949496.230000] 	data_pad  0
[42949496.230000] 	sqnum     0
[42949496.240000] 	hdr_crc   00000000
[42949496.240000] Volume identifier header hexdump:
[42949496.250000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.260000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.270000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
31, EC -1
[42949496.290000] UBI DBG (pid 90): ubi_scan: process PEB 32
[42949496.300000] UBI DBG (pid 90): process_eb: scan PEB 32
[42949496.310000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 32: 00000000 instead of 55424923
[42949496.310000] Erase counter header dump:
[42949496.320000] 	magic          0x000000
[42949496.320000] 	version        0
[42949496.330000] 	ec             0
[42949496.330000] 	vid_hdr_offset 0
[42949496.330000] 	data_offset    0
[42949496.340000] 	hdr_crc        0x000000
[42949496.340000] erase counter header hexdump:
[42949496.340000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.350000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.360000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 32: 00000000 instead of 55424921
[42949496.370000] Volume identifier header dump:
[42949496.380000] 	magic     00000000
[42949496.380000] 	version   0
[42949496.380000] 	vol_type  0
[42949496.390000] 	copy_flag 0
[42949496.390000] 	compat    0
[42949496.390000] 	vol_id    0
[42949496.390000] 	lnum      0
[42949496.400000] 	data_size 0
[42949496.400000] 	used_ebs  0
[42949496.400000] 	data_pad  0
[42949496.400000] 	sqnum     0
[42949496.410000] 	hdr_crc   00000000
[42949496.410000] Volume identifier header hexdump:
[42949496.420000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.430000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.440000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
32, EC -1
[42949496.460000] UBI DBG (pid 90): ubi_scan: process PEB 33
[42949496.470000] UBI DBG (pid 90): process_eb: scan PEB 33
[42949496.480000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 33: 00000000 instead of 55424923
[42949496.490000] Erase counter header dump:
[42949496.490000] 	magic          0x000000
[42949496.490000] 	version        0
[42949496.500000] 	ec             0
[42949496.500000] 	vid_hdr_offset 0
[42949496.500000] 	data_offset    0
[42949496.510000] 	hdr_crc        0x000000
[42949496.510000] erase counter header hexdump:
[42949496.510000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.520000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.530000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 33: 00000000 instead of 55424921
[42949496.540000] Volume identifier header dump:
[42949496.550000] 	magic     00000000
[42949496.550000] 	version   0
[42949496.550000] 	vol_type  0
[42949496.560000] 	copy_flag 0
[42949496.560000] 	compat    0
[42949496.560000] 	vol_id    0
[42949496.560000] 	lnum      0
[42949496.570000] 	data_size 0
[42949496.570000] 	used_ebs  0
[42949496.570000] 	data_pad  0
[42949496.580000] 	sqnum     0
[42949496.580000] 	hdr_crc   00000000
[42949496.580000] Volume identifier header hexdump:
[42949496.590000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.600000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.610000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
33, EC -1
[42949496.630000] UBI DBG (pid 90): ubi_scan: process PEB 34
[42949496.640000] UBI DBG (pid 90): process_eb: scan PEB 34
[42949496.650000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 34: 00000000 instead of 55424923
[42949496.660000] Erase counter header dump:
[42949496.660000] 	magic          0x000000
[42949496.660000] 	version        0
[42949496.670000] 	ec             0
[42949496.670000] 	vid_hdr_offset 0
[42949496.670000] 	data_offset    0
[42949496.680000] 	hdr_crc        0x000000
[42949496.680000] erase counter header hexdump:
[42949496.680000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.690000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.700000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 34: 00000000 instead of 55424921
[42949496.710000] Volume identifier header dump:
[42949496.720000] 	magic     00000000
[42949496.720000] 	version   0
[42949496.720000] 	vol_type  0
[42949496.730000] 	copy_flag 0
[42949496.730000] 	compat    0
[42949496.730000] 	vol_id    0
[42949496.730000] 	lnum      0
[42949496.740000] 	data_size 0
[42949496.740000] 	used_ebs  0
[42949496.740000] 	data_pad  0
[42949496.750000] 	sqnum     0
[42949496.750000] 	hdr_crc   00000000
[42949496.750000] Volume identifier header hexdump:
[42949496.760000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.770000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.780000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
34, EC -1
[42949496.800000] UBI DBG (pid 90): ubi_scan: process PEB 35
[42949496.810000] UBI DBG (pid 90): process_eb: scan PEB 35
[42949496.820000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 35: 00000000 instead of 55424923
[42949496.830000] Erase counter header dump:
[42949496.830000] 	magic          0x000000
[42949496.830000] 	version        0
[42949496.840000] 	ec             0
[42949496.840000] 	vid_hdr_offset 0
[42949496.840000] 	data_offset    0
[42949496.850000] 	hdr_crc        0x000000
[42949496.850000] erase counter header hexdump:
[42949496.850000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.860000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.870000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 35: 00000000 instead of 55424921
[42949496.880000] Volume identifier header dump:
[42949496.890000] 	magic     00000000
[42949496.890000] 	version   0
[42949496.890000] 	vol_type  0
[42949496.900000] 	copy_flag 0
[42949496.900000] 	compat    0
[42949496.900000] 	vol_id    0
[42949496.900000] 	lnum      0
[42949496.910000] 	data_size 0
[42949496.910000] 	used_ebs  0
[42949496.910000] 	data_pad  0
[42949496.920000] 	sqnum     0
[42949496.920000] 	hdr_crc   00000000
[42949496.920000] Volume identifier header hexdump:
[42949496.930000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.940000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949496.950000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
35, EC -1
[42949496.980000] UBI DBG (pid 90): ubi_scan: process PEB 36
[42949496.980000] UBI DBG (pid 90): process_eb: scan PEB 36
[42949496.990000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 36: 00000000 instead of 55424923
[42949497.000000] Erase counter header dump:
[42949497.000000] 	magic          0x000000
[42949497.010000] 	version        0
[42949497.010000] 	ec             0
[42949497.010000] 	vid_hdr_offset 0
[42949497.010000] 	data_offset    0
[42949497.020000] 	hdr_crc        0x000000
[42949497.020000] erase counter header hexdump:
[42949497.030000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.040000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.050000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 36: 00000000 instead of 55424921
[42949497.060000] Volume identifier header dump:
[42949497.070000] 	magic     00000000
[42949497.070000] 	version   0
[42949497.070000] 	vol_type  0
[42949497.080000] 	copy_flag 0
[42949497.080000] 	compat    0
[42949497.080000] 	vol_id    0
[42949497.090000] 	lnum      0
[42949497.090000] 	data_size 0
[42949497.090000] 	used_ebs  0
[42949497.090000] 	data_pad  0
[42949497.100000] 	sqnum     0
[42949497.100000] 	hdr_crc   00000000
[42949497.100000] Volume identifier header hexdump:
[42949497.110000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.120000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.130000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
36, EC -1
[42949497.150000] UBI DBG (pid 90): ubi_scan: process PEB 37
[42949497.150000] UBI DBG (pid 90): process_eb: scan PEB 37
[42949497.160000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 37: 00000000 instead of 55424923
[42949497.170000] Erase counter header dump:
[42949497.170000] 	magic          0x000000
[42949497.180000] 	version        0
[42949497.180000] 	ec             0
[42949497.180000] 	vid_hdr_offset 0
[42949497.190000] 	data_offset    0
[42949497.190000] 	hdr_crc        0x000000
[42949497.190000] erase counter header hexdump:
[42949497.200000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.210000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.220000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 37: 00000000 instead of 55424921
[42949497.230000] Volume identifier header dump:
[42949497.240000] 	magic     00000000
[42949497.240000] 	version   0
[42949497.250000] 	vol_type  0
[42949497.250000] 	copy_flag 0
[42949497.250000] 	compat    0
[42949497.250000] 	vol_id    0
[42949497.260000] 	lnum      0
[42949497.260000] 	data_size 0
[42949497.260000] 	used_ebs  0
[42949497.260000] 	data_pad  0
[42949497.270000] 	sqnum     0
[42949497.270000] 	hdr_crc   00000000
[42949497.270000] Volume identifier header hexdump:
[42949497.280000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.290000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.300000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
37, EC -1
[42949497.320000] UBI DBG (pid 90): ubi_scan: process PEB 38
[42949497.320000] UBI DBG (pid 90): process_eb: scan PEB 38
[42949497.330000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 38: 00000000 instead of 55424923
[42949497.340000] Erase counter header dump:
[42949497.340000] 	magic          0x000000
[42949497.350000] 	version        0
[42949497.350000] 	ec             0
[42949497.350000] 	vid_hdr_offset 0
[42949497.360000] 	data_offset    0
[42949497.360000] 	hdr_crc        0x000000
[42949497.360000] erase counter header hexdump:
[42949497.370000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.380000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.400000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 38: 00000000 instead of 55424921
[42949497.410000] Volume identifier header dump:
[42949497.410000] 	magic     00000000
[42949497.410000] 	version   0
[42949497.420000] 	vol_type  0
[42949497.420000] 	copy_flag 0
[42949497.420000] 	compat    0
[42949497.420000] 	vol_id    0
[42949497.430000] 	lnum      0
[42949497.430000] 	data_size 0
[42949497.430000] 	used_ebs  0
[42949497.440000] 	data_pad  0
[42949497.440000] 	sqnum     0
[42949497.440000] 	hdr_crc   00000000
[42949497.440000] Volume identifier header hexdump:
[42949497.450000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.460000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.470000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
38, EC -1
[42949497.490000] UBI DBG (pid 90): ubi_scan: process PEB 39
[42949497.490000] UBI DBG (pid 90): process_eb: scan PEB 39
[42949497.500000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 39: 00000000 instead of 55424923
[42949497.510000] Erase counter header dump:
[42949497.510000] 	magic          0x000000
[42949497.520000] 	version        0
[42949497.520000] 	ec             0
[42949497.520000] 	vid_hdr_offset 0
[42949497.530000] 	data_offset    0
[42949497.530000] 	hdr_crc        0x000000
[42949497.530000] erase counter header hexdump:
[42949497.540000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.550000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.560000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 39: 00000000 instead of 55424921
[42949497.570000] Volume identifier header dump:
[42949497.570000] 	magic     00000000
[42949497.570000] 	version   0
[42949497.580000] 	vol_type  0
[42949497.580000] 	copy_flag 0
[42949497.580000] 	compat    0
[42949497.580000] 	vol_id    0
[42949497.590000] 	lnum      0
[42949497.590000] 	data_size 0
[42949497.590000] 	used_ebs  0
[42949497.600000] 	data_pad  0
[42949497.600000] 	sqnum     0
[42949497.600000] 	hdr_crc   00000000
[42949497.600000] Volume identifier header hexdump:
[42949497.610000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.620000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.630000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
39, EC -1
[42949497.650000] UBI DBG (pid 90): ubi_scan: process PEB 40
[42949497.650000] UBI DBG (pid 90): process_eb: scan PEB 40
[42949497.660000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 40: 00000000 instead of 55424923
[42949497.670000] Erase counter header dump:
[42949497.670000] 	magic          0x000000
[42949497.680000] 	version        0
[42949497.680000] 	ec             0
[42949497.680000] 	vid_hdr_offset 0
[42949497.690000] 	data_offset    0
[42949497.690000] 	hdr_crc        0x000000
[42949497.690000] erase counter header hexdump:
[42949497.700000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.710000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.720000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 40: 00000000 instead of 55424921
[42949497.730000] Volume identifier header dump:
[42949497.730000] 	magic     00000000
[42949497.730000] 	version   0
[42949497.740000] 	vol_type  0
[42949497.740000] 	copy_flag 0
[42949497.740000] 	compat    0
[42949497.740000] 	vol_id    0
[42949497.750000] 	lnum      0
[42949497.750000] 	data_size 0
[42949497.750000] 	used_ebs  0
[42949497.760000] 	data_pad  0
[42949497.760000] 	sqnum     0
[42949497.760000] 	hdr_crc   00000000
[42949497.760000] Volume identifier header hexdump:
[42949497.770000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.780000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.790000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
40, EC -1
[42949497.810000] UBI DBG (pid 90): ubi_scan: process PEB 41
[42949497.810000] UBI DBG (pid 90): process_eb: scan PEB 41
[42949497.820000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 41: 00000000 instead of 55424923
[42949497.830000] Erase counter header dump:
[42949497.830000] 	magic          0x000000
[42949497.840000] 	version        0
[42949497.840000] 	ec             0
[42949497.840000] 	vid_hdr_offset 0
[42949497.850000] 	data_offset    0
[42949497.850000] 	hdr_crc        0x000000
[42949497.850000] erase counter header hexdump:
[42949497.860000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.870000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.880000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 41: 00000000 instead of 55424921
[42949497.890000] Volume identifier header dump:
[42949497.890000] 	magic     00000000
[42949497.890000] 	version   0
[42949497.900000] 	vol_type  0
[42949497.900000] 	copy_flag 0
[42949497.900000] 	compat    0
[42949497.900000] 	vol_id    0
[42949497.910000] 	lnum      0
[42949497.910000] 	data_size 0
[42949497.910000] 	used_ebs  0
[42949497.920000] 	data_pad  0
[42949497.920000] 	sqnum     0
[42949497.920000] 	hdr_crc   00000000
[42949497.920000] Volume identifier header hexdump:
[42949497.930000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.940000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949497.950000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
41, EC -1
[42949497.970000] UBI DBG (pid 90): ubi_scan: process PEB 42
[42949497.970000] UBI DBG (pid 90): process_eb: scan PEB 42
[42949497.980000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 42: 00000000 instead of 55424923
[42949497.990000] Erase counter header dump:
[42949497.990000] 	magic          0x000000
[42949498.000000] 	version        0
[42949498.000000] 	ec             0
[42949498.000000] 	vid_hdr_offset 0
[42949498.010000] 	data_offset    0
[42949498.010000] 	hdr_crc        0x000000
[42949498.010000] erase counter header hexdump:
[42949498.020000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.030000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.040000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 42: 00000000 instead of 55424921
[42949498.050000] Volume identifier header dump:
[42949498.050000] 	magic     00000000
[42949498.050000] 	version   0
[42949498.060000] 	vol_type  0
[42949498.060000] 	copy_flag 0
[42949498.060000] 	compat    0
[42949498.070000] 	vol_id    0
[42949498.070000] 	lnum      0
[42949498.070000] 	data_size 0
[42949498.070000] 	used_ebs  0
[42949498.080000] 	data_pad  0
[42949498.080000] 	sqnum     0
[42949498.080000] 	hdr_crc   00000000
[42949498.090000] Volume identifier header hexdump:
[42949498.090000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.100000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.110000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
42, EC -1
[42949498.130000] UBI DBG (pid 90): ubi_scan: process PEB 43
[42949498.130000] UBI DBG (pid 90): process_eb: scan PEB 43
[42949498.140000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 43: 00000000 instead of 55424923
[42949498.150000] Erase counter header dump:
[42949498.150000] 	magic          0x000000
[42949498.160000] 	version        0
[42949498.160000] 	ec             0
[42949498.160000] 	vid_hdr_offset 0
[42949498.170000] 	data_offset    0
[42949498.170000] 	hdr_crc        0x000000
[42949498.180000] erase counter header hexdump:
[42949498.180000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.190000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.200000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 43: 00000000 instead of 55424921
[42949498.210000] Volume identifier header dump:
[42949498.210000] 	magic     00000000
[42949498.220000] 	version   0
[42949498.220000] 	vol_type  0
[42949498.220000] 	copy_flag 0
[42949498.220000] 	compat    0
[42949498.230000] 	vol_id    0
[42949498.230000] 	lnum      0
[42949498.230000] 	data_size 0
[42949498.230000] 	used_ebs  0
[42949498.240000] 	data_pad  0
[42949498.240000] 	sqnum     0
[42949498.240000] 	hdr_crc   00000000
[42949498.250000] Volume identifier header hexdump:
[42949498.250000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.260000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.270000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
43, EC -1
[42949498.290000] UBI DBG (pid 90): ubi_scan: process PEB 44
[42949498.300000] UBI DBG (pid 90): process_eb: scan PEB 44
[42949498.300000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 44: 00000000 instead of 55424923
[42949498.310000] Erase counter header dump:
[42949498.320000] 	magic          0x000000
[42949498.320000] 	version        0
[42949498.320000] 	ec             0
[42949498.330000] 	vid_hdr_offset 0
[42949498.330000] 	data_offset    0
[42949498.330000] 	hdr_crc        0x000000
[42949498.340000] erase counter header hexdump:
[42949498.340000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.350000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.360000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 44: 00000000 instead of 55424921
[42949498.370000] Volume identifier header dump:
[42949498.370000] 	magic     00000000
[42949498.380000] 	version   0
[42949498.380000] 	vol_type  0
[42949498.380000] 	copy_flag 0
[42949498.380000] 	compat    0
[42949498.390000] 	vol_id    0
[42949498.390000] 	lnum      0
[42949498.390000] 	data_size 0
[42949498.400000] 	used_ebs  0
[42949498.400000] 	data_pad  0
[42949498.400000] 	sqnum     0
[42949498.400000] 	hdr_crc   00000000
[42949498.410000] Volume identifier header hexdump:
[42949498.410000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.420000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.430000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
44, EC -1
[42949498.450000] UBI DBG (pid 90): ubi_scan: process PEB 45
[42949498.460000] UBI DBG (pid 90): process_eb: scan PEB 45
[42949498.460000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 45: 00000000 instead of 55424923
[42949498.470000] Erase counter header dump:
[42949498.480000] 	magic          0x000000
[42949498.480000] 	version        0
[42949498.480000] 	ec             0
[42949498.490000] 	vid_hdr_offset 0
[42949498.490000] 	data_offset    0
[42949498.490000] 	hdr_crc        0x000000
[42949498.500000] erase counter header hexdump:
[42949498.500000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.510000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.520000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 45: 00000000 instead of 55424921
[42949498.530000] Volume identifier header dump:
[42949498.530000] 	magic     00000000
[42949498.540000] 	version   0
[42949498.540000] 	vol_type  0
[42949498.540000] 	copy_flag 0
[42949498.550000] 	compat    0
[42949498.550000] 	vol_id    0
[42949498.550000] 	lnum      0
[42949498.550000] 	data_size 0
[42949498.560000] 	used_ebs  0
[42949498.560000] 	data_pad  0
[42949498.560000] 	sqnum     0
[42949498.560000] 	hdr_crc   00000000
[42949498.570000] Volume identifier header hexdump:
[42949498.570000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.580000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.590000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
45, EC -1
[42949498.610000] UBI DBG (pid 90): ubi_scan: process PEB 46
[42949498.620000] UBI DBG (pid 90): process_eb: scan PEB 46
[42949498.620000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 46: 00000000 instead of 55424923
[42949498.630000] Erase counter header dump:
[42949498.640000] 	magic          0x000000
[42949498.640000] 	version        0
[42949498.640000] 	ec             0
[42949498.650000] 	vid_hdr_offset 0
[42949498.650000] 	data_offset    0
[42949498.650000] 	hdr_crc        0x000000
[42949498.660000] erase counter header hexdump:
[42949498.660000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.670000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.680000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 46: 00000000 instead of 55424921
[42949498.690000] Volume identifier header dump:
[42949498.690000] 	magic     00000000
[42949498.700000] 	version   0
[42949498.700000] 	vol_type  0
[42949498.700000] 	copy_flag 0
[42949498.710000] 	compat    0
[42949498.710000] 	vol_id    0
[42949498.710000] 	lnum      0
[42949498.710000] 	data_size 0
[42949498.720000] 	used_ebs  0
[42949498.720000] 	data_pad  0
[42949498.720000] 	sqnum     0
[42949498.730000] 	hdr_crc   00000000
[42949498.730000] Volume identifier header hexdump:
[42949498.730000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.740000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.750000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
46, EC -1
[42949498.770000] UBI DBG (pid 90): ubi_scan: process PEB 47
[42949498.780000] UBI DBG (pid 90): process_eb: scan PEB 47
[42949498.780000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 47: 00000000 instead of 55424923
[42949498.790000] Erase counter header dump:
[42949498.800000] 	magic          0x000000
[42949498.800000] 	version        0
[42949498.800000] 	ec             0
[42949498.810000] 	vid_hdr_offset 0
[42949498.810000] 	data_offset    0
[42949498.810000] 	hdr_crc        0x000000
[42949498.820000] erase counter header hexdump:
[42949498.820000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.830000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.840000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 47: 00000000 instead of 55424921
[42949498.850000] Volume identifier header dump:
[42949498.850000] 	magic     00000000
[42949498.860000] 	version   0
[42949498.860000] 	vol_type  0
[42949498.860000] 	copy_flag 0
[42949498.870000] 	compat    0
[42949498.870000] 	vol_id    0
[42949498.870000] 	lnum      0
[42949498.870000] 	data_size 0
[42949498.880000] 	used_ebs  0
[42949498.880000] 	data_pad  0
[42949498.880000] 	sqnum     0
[42949498.890000] 	hdr_crc   00000000
[42949498.890000] Volume identifier header hexdump:
[42949498.890000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.900000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.910000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
47, EC -1
[42949498.930000] UBI DBG (pid 90): ubi_scan: process PEB 48
[42949498.940000] UBI DBG (pid 90): process_eb: scan PEB 48
[42949498.940000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 48: 00000000 instead of 55424923
[42949498.950000] Erase counter header dump:
[42949498.960000] 	magic          0x000000
[42949498.960000] 	version        0
[42949498.960000] 	ec             0
[42949498.970000] 	vid_hdr_offset 0
[42949498.970000] 	data_offset    0
[42949498.970000] 	hdr_crc        0x000000
[42949498.980000] erase counter header hexdump:
[42949498.980000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949498.990000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.000000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 48: 00000000 instead of 55424921
[42949499.010000] Volume identifier header dump:
[42949499.010000] 	magic     00000000
[42949499.020000] 	version   0
[42949499.020000] 	vol_type  0
[42949499.020000] 	copy_flag 0
[42949499.030000] 	compat    0
[42949499.030000] 	vol_id    0
[42949499.030000] 	lnum      0
[42949499.030000] 	data_size 0
[42949499.040000] 	used_ebs  0
[42949499.040000] 	data_pad  0
[42949499.040000] 	sqnum     0
[42949499.050000] 	hdr_crc   00000000
[42949499.050000] Volume identifier header hexdump:
[42949499.050000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.060000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.070000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
48, EC -1
[42949499.090000] UBI DBG (pid 90): ubi_scan: process PEB 49
[42949499.100000] UBI DBG (pid 90): process_eb: scan PEB 49
[42949499.100000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 49: 00000000 instead of 55424923
[42949499.110000] Erase counter header dump:
[42949499.120000] 	magic          0x000000
[42949499.120000] 	version        0
[42949499.130000] 	ec             0
[42949499.130000] 	vid_hdr_offset 0
[42949499.130000] 	data_offset    0
[42949499.140000] 	hdr_crc        0x000000
[42949499.140000] erase counter header hexdump:
[42949499.140000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.150000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.160000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 49: 00000000 instead of 55424921
[42949499.170000] Volume identifier header dump:
[42949499.180000] 	magic     00000000
[42949499.180000] 	version   0
[42949499.180000] 	vol_type  0
[42949499.180000] 	copy_flag 0
[42949499.190000] 	compat    0
[42949499.190000] 	vol_id    0
[42949499.190000] 	lnum      0
[42949499.200000] 	data_size 0
[42949499.200000] 	used_ebs  0
[42949499.200000] 	data_pad  0
[42949499.200000] 	sqnum     0
[42949499.210000] 	hdr_crc   00000000
[42949499.210000] Volume identifier header hexdump:
[42949499.220000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.230000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.240000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
49, EC -1
[42949499.260000] UBI DBG (pid 90): ubi_scan: process PEB 50
[42949499.270000] UBI DBG (pid 90): process_eb: scan PEB 50
[42949499.280000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 50: 00000000 instead of 55424923
[42949499.290000] Erase counter header dump:
[42949499.290000] 	magic          0x000000
[42949499.290000] 	version        0
[42949499.300000] 	ec             0
[42949499.300000] 	vid_hdr_offset 0
[42949499.300000] 	data_offset    0
[42949499.310000] 	hdr_crc        0x000000
[42949499.310000] erase counter header hexdump:
[42949499.310000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.320000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.330000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 50: 00000000 instead of 55424921
[42949499.340000] Volume identifier header dump:
[42949499.350000] 	magic     00000000
[42949499.350000] 	version   0
[42949499.350000] 	vol_type  0
[42949499.360000] 	copy_flag 0
[42949499.360000] 	compat    0
[42949499.360000] 	vol_id    0
[42949499.360000] 	lnum      0
[42949499.370000] 	data_size 0
[42949499.370000] 	used_ebs  0
[42949499.370000] 	data_pad  0
[42949499.380000] 	sqnum     0
[42949499.380000] 	hdr_crc   00000000
[42949499.380000] Volume identifier header hexdump:
[42949499.390000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.400000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.410000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
50, EC -1
[42949499.430000] UBI DBG (pid 90): ubi_scan: process PEB 51
[42949499.440000] UBI DBG (pid 90): process_eb: scan PEB 51
[42949499.450000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 51: 00000000 instead of 55424923
[42949499.460000] Erase counter header dump:
[42949499.460000] 	magic          0x000000
[42949499.460000] 	version        0
[42949499.470000] 	ec             0
[42949499.470000] 	vid_hdr_offset 0
[42949499.470000] 	data_offset    0
[42949499.480000] 	hdr_crc        0x000000
[42949499.480000] erase counter header hexdump:
[42949499.480000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.490000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.500000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 51: 00000000 instead of 55424921
[42949499.510000] Volume identifier header dump:
[42949499.520000] 	magic     00000000
[42949499.520000] 	version   0
[42949499.520000] 	vol_type  0
[42949499.530000] 	copy_flag 0
[42949499.530000] 	compat    0
[42949499.530000] 	vol_id    0
[42949499.530000] 	lnum      0
[42949499.540000] 	data_size 0
[42949499.540000] 	used_ebs  0
[42949499.540000] 	data_pad  0
[42949499.550000] 	sqnum     0
[42949499.550000] 	hdr_crc   00000000
[42949499.550000] Volume identifier header hexdump:
[42949499.560000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.570000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.580000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
51, EC -1
[42949499.600000] UBI DBG (pid 90): ubi_scan: process PEB 52
[42949499.610000] UBI DBG (pid 90): process_eb: scan PEB 52
[42949499.620000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 52: 00000000 instead of 55424923
[42949499.630000] Erase counter header dump:
[42949499.630000] 	magic          0x000000
[42949499.630000] 	version        0
[42949499.640000] 	ec             0
[42949499.640000] 	vid_hdr_offset 0
[42949499.640000] 	data_offset    0
[42949499.650000] 	hdr_crc        0x000000
[42949499.650000] erase counter header hexdump:
[42949499.650000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.660000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.670000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 52: 00000000 instead of 55424921
[42949499.680000] Volume identifier header dump:
[42949499.690000] 	magic     00000000
[42949499.690000] 	version   0
[42949499.690000] 	vol_type  0
[42949499.700000] 	copy_flag 0
[42949499.700000] 	compat    0
[42949499.700000] 	vol_id    0
[42949499.700000] 	lnum      0
[42949499.710000] 	data_size 0
[42949499.710000] 	used_ebs  0
[42949499.710000] 	data_pad  0
[42949499.720000] 	sqnum     0
[42949499.720000] 	hdr_crc   00000000
[42949499.720000] Volume identifier header hexdump:
[42949499.730000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.740000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.750000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
52, EC -1
[42949499.770000] UBI DBG (pid 90): ubi_scan: process PEB 53
[42949499.780000] UBI DBG (pid 90): process_eb: scan PEB 53
[42949499.790000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 53: 00000000 instead of 55424923
[42949499.800000] Erase counter header dump:
[42949499.800000] 	magic          0x000000
[42949499.800000] 	version        0
[42949499.810000] 	ec             0
[42949499.810000] 	vid_hdr_offset 0
[42949499.810000] 	data_offset    0
[42949499.820000] 	hdr_crc        0x000000
[42949499.820000] erase counter header hexdump:
[42949499.830000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.840000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.850000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 53: 00000000 instead of 55424921
[42949499.860000] Volume identifier header dump:
[42949499.870000] 	magic     00000000
[42949499.870000] 	version   0
[42949499.870000] 	vol_type  0
[42949499.880000] 	copy_flag 0
[42949499.880000] 	compat    0
[42949499.880000] 	vol_id    0
[42949499.880000] 	lnum      0
[42949499.890000] 	data_size 0
[42949499.890000] 	used_ebs  0
[42949499.890000] 	data_pad  0
[42949499.900000] 	sqnum     0
[42949499.900000] 	hdr_crc   00000000
[42949499.900000] Volume identifier header hexdump:
[42949499.910000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.920000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949499.930000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
53, EC -1
[42949499.960000] UBI DBG (pid 90): ubi_scan: process PEB 54
[42949499.960000] UBI DBG (pid 90): process_eb: scan PEB 54
[42949499.970000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 54: 00000000 instead of 55424923
[42949499.980000] Erase counter header dump:
[42949499.980000] 	magic          0x000000
[42949499.980000] 	version        0
[42949499.990000] 	ec             0
[42949499.990000] 	vid_hdr_offset 0
[42949499.990000] 	data_offset    0
[42949500.000000] 	hdr_crc        0x000000
[42949500.000000] erase counter header hexdump:
[42949500.010000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.020000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.030000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 54: 00000000 instead of 55424921
[42949500.040000] Volume identifier header dump:
[42949500.050000] 	magic     00000000
[42949500.050000] 	version   0
[42949500.050000] 	vol_type  0
[42949500.060000] 	copy_flag 0
[42949500.060000] 	compat    0
[42949500.060000] 	vol_id    0
[42949500.070000] 	lnum      0
[42949500.070000] 	data_size 0
[42949500.070000] 	used_ebs  0
[42949500.070000] 	data_pad  0
[42949500.080000] 	sqnum     0
[42949500.080000] 	hdr_crc   00000000
[42949500.080000] Volume identifier header hexdump:
[42949500.090000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.100000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.110000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
54, EC -1
[42949500.130000] UBI DBG (pid 90): ubi_scan: process PEB 55
[42949500.130000] UBI DBG (pid 90): process_eb: scan PEB 55
[42949500.140000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 55: 00000000 instead of 55424923
[42949500.150000] Erase counter header dump:
[42949500.150000] 	magic          0x000000
[42949500.160000] 	version        0
[42949500.160000] 	ec             0
[42949500.160000] 	vid_hdr_offset 0
[42949500.170000] 	data_offset    0
[42949500.170000] 	hdr_crc        0x000000
[42949500.170000] erase counter header hexdump:
[42949500.180000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.190000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.210000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 55: 00000000 instead of 55424921
[42949500.210000] Volume identifier header dump:
[42949500.220000] 	magic     00000000
[42949500.220000] 	version   0
[42949500.230000] 	vol_type  0
[42949500.230000] 	copy_flag 0
[42949500.230000] 	compat    0
[42949500.230000] 	vol_id    0
[42949500.240000] 	lnum      0
[42949500.240000] 	data_size 0
[42949500.240000] 	used_ebs  0
[42949500.240000] 	data_pad  0
[42949500.250000] 	sqnum     0
[42949500.250000] 	hdr_crc   00000000
[42949500.250000] Volume identifier header hexdump:
[42949500.260000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.270000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.280000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
55, EC -1
[42949500.300000] UBI DBG (pid 90): ubi_scan: process PEB 56
[42949500.300000] UBI DBG (pid 90): process_eb: scan PEB 56
[42949500.310000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 56: 00000000 instead of 55424923
[42949500.320000] Erase counter header dump:
[42949500.320000] 	magic          0x000000
[42949500.330000] 	version        0
[42949500.330000] 	ec             0
[42949500.330000] 	vid_hdr_offset 0
[42949500.340000] 	data_offset    0
[42949500.340000] 	hdr_crc        0x000000
[42949500.340000] erase counter header hexdump:
[42949500.350000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.360000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.380000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 56: 00000000 instead of 55424921
[42949500.380000] Volume identifier header dump:
[42949500.390000] 	magic     00000000
[42949500.390000] 	version   0
[42949500.400000] 	vol_type  0
[42949500.400000] 	copy_flag 0
[42949500.400000] 	compat    0
[42949500.400000] 	vol_id    0
[42949500.410000] 	lnum      0
[42949500.410000] 	data_size 0
[42949500.410000] 	used_ebs  0
[42949500.420000] 	data_pad  0
[42949500.420000] 	sqnum     0
[42949500.420000] 	hdr_crc   00000000
[42949500.420000] Volume identifier header hexdump:
[42949500.430000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.440000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.450000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
56, EC -1
[42949500.470000] UBI DBG (pid 90): ubi_scan: process PEB 57
[42949500.470000] UBI DBG (pid 90): process_eb: scan PEB 57
[42949500.480000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 57: 00000000 instead of 55424923
[42949500.490000] Erase counter header dump:
[42949500.490000] 	magic          0x000000
[42949500.500000] 	version        0
[42949500.500000] 	ec             0
[42949500.500000] 	vid_hdr_offset 0
[42949500.510000] 	data_offset    0
[42949500.510000] 	hdr_crc        0x000000
[42949500.510000] erase counter header hexdump:
[42949500.520000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.530000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.540000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 57: 00000000 instead of 55424921
[42949500.550000] Volume identifier header dump:
[42949500.550000] 	magic     00000000
[42949500.550000] 	version   0
[42949500.560000] 	vol_type  0
[42949500.560000] 	copy_flag 0
[42949500.560000] 	compat    0
[42949500.560000] 	vol_id    0
[42949500.570000] 	lnum      0
[42949500.570000] 	data_size 0
[42949500.570000] 	used_ebs  0
[42949500.580000] 	data_pad  0
[42949500.580000] 	sqnum     0
[42949500.580000] 	hdr_crc   00000000
[42949500.580000] Volume identifier header hexdump:
[42949500.590000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.600000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.610000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
57, EC -1
[42949500.630000] UBI DBG (pid 90): ubi_scan: process PEB 58
[42949500.630000] UBI DBG (pid 90): process_eb: scan PEB 58
[42949500.640000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 58: 00000000 instead of 55424923
[42949500.650000] Erase counter header dump:
[42949500.650000] 	magic          0x000000
[42949500.660000] 	version        0
[42949500.660000] 	ec             0
[42949500.660000] 	vid_hdr_offset 0
[42949500.670000] 	data_offset    0
[42949500.670000] 	hdr_crc        0x000000
[42949500.670000] erase counter header hexdump:
[42949500.680000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.690000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.700000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 58: 00000000 instead of 55424921
[42949500.710000] Volume identifier header dump:
[42949500.710000] 	magic     00000000
[42949500.710000] 	version   0
[42949500.720000] 	vol_type  0
[42949500.720000] 	copy_flag 0
[42949500.720000] 	compat    0
[42949500.730000] 	vol_id    0
[42949500.730000] 	lnum      0
[42949500.730000] 	data_size 0
[42949500.730000] 	used_ebs  0
[42949500.740000] 	data_pad  0
[42949500.740000] 	sqnum     0
[42949500.740000] 	hdr_crc   00000000
[42949500.750000] Volume identifier header hexdump:
[42949500.750000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.760000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.770000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
58, EC -1
[42949500.790000] UBI DBG (pid 90): ubi_scan: process PEB 59
[42949500.790000] UBI DBG (pid 90): process_eb: scan PEB 59
[42949500.800000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 59: 00000000 instead of 55424923
[42949500.810000] Erase counter header dump:
[42949500.810000] 	magic          0x000000
[42949500.820000] 	version        0
[42949500.820000] 	ec             0
[42949500.820000] 	vid_hdr_offset 0
[42949500.830000] 	data_offset    0
[42949500.830000] 	hdr_crc        0x000000
[42949500.830000] erase counter header hexdump:
[42949500.840000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.850000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.860000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 59: 00000000 instead of 55424921
[42949500.870000] Volume identifier header dump:
[42949500.870000] 	magic     00000000
[42949500.870000] 	version   0
[42949500.880000] 	vol_type  0
[42949500.880000] 	copy_flag 0
[42949500.880000] 	compat    0
[42949500.890000] 	vol_id    0
[42949500.890000] 	lnum      0
[42949500.890000] 	data_size 0
[42949500.890000] 	used_ebs  0
[42949500.900000] 	data_pad  0
[42949500.900000] 	sqnum     0
[42949500.900000] 	hdr_crc   00000000
[42949500.910000] Volume identifier header hexdump:
[42949500.910000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.920000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949500.930000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
59, EC -1
[42949500.950000] UBI DBG (pid 90): ubi_scan: process PEB 60
[42949500.950000] UBI DBG (pid 90): process_eb: scan PEB 60
[42949500.960000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 60: 00000000 instead of 55424923
[42949500.970000] Erase counter header dump:
[42949500.970000] 	magic          0x000000
[42949500.980000] 	version        0
[42949500.980000] 	ec             0
[42949500.980000] 	vid_hdr_offset 0
[42949500.990000] 	data_offset    0
[42949500.990000] 	hdr_crc        0x000000
[42949500.990000] erase counter header hexdump:
[42949501.000000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.010000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.020000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 60: 00000000 instead of 55424921
[42949501.030000] Volume identifier header dump:
[42949501.030000] 	magic     00000000
[42949501.030000] 	version   0
[42949501.040000] 	vol_type  0
[42949501.040000] 	copy_flag 0
[42949501.040000] 	compat    0
[42949501.050000] 	vol_id    0
[42949501.050000] 	lnum      0
[42949501.050000] 	data_size 0
[42949501.050000] 	used_ebs  0
[42949501.060000] 	data_pad  0
[42949501.060000] 	sqnum     0
[42949501.060000] 	hdr_crc   00000000
[42949501.070000] Volume identifier header hexdump:
[42949501.070000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.080000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.090000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
60, EC -1
[42949501.110000] UBI DBG (pid 90): ubi_scan: process PEB 61
[42949501.120000] UBI DBG (pid 90): process_eb: scan PEB 61
[42949501.120000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 61: 00000000 instead of 55424923
[42949501.130000] Erase counter header dump:
[42949501.130000] 	magic          0x000000
[42949501.140000] 	version        0
[42949501.140000] 	ec             0
[42949501.150000] 	vid_hdr_offset 0
[42949501.150000] 	data_offset    0
[42949501.150000] 	hdr_crc        0x000000
[42949501.160000] erase counter header hexdump:
[42949501.160000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.170000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.180000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 61: 00000000 instead of 55424921
[42949501.190000] Volume identifier header dump:
[42949501.190000] 	magic     00000000
[42949501.200000] 	version   0
[42949501.200000] 	vol_type  0
[42949501.200000] 	copy_flag 0
[42949501.200000] 	compat    0
[42949501.210000] 	vol_id    0
[42949501.210000] 	lnum      0
[42949501.210000] 	data_size 0
[42949501.220000] 	used_ebs  0
[42949501.220000] 	data_pad  0
[42949501.220000] 	sqnum     0
[42949501.220000] 	hdr_crc   00000000
[42949501.230000] Volume identifier header hexdump:
[42949501.230000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.240000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.250000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
61, EC -1
[42949501.270000] UBI DBG (pid 90): ubi_scan: process PEB 62
[42949501.280000] UBI DBG (pid 90): process_eb: scan PEB 62
[42949501.280000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 62: 00000000 instead of 55424923
[42949501.290000] Erase counter header dump:
[42949501.300000] 	magic          0x000000
[42949501.300000] 	version        0
[42949501.300000] 	ec             0
[42949501.310000] 	vid_hdr_offset 0
[42949501.310000] 	data_offset    0
[42949501.310000] 	hdr_crc        0x000000
[42949501.320000] erase counter header hexdump:
[42949501.320000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.330000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.340000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 62: 00000000 instead of 55424921
[42949501.350000] Volume identifier header dump:
[42949501.350000] 	magic     00000000
[42949501.360000] 	version   0
[42949501.360000] 	vol_type  0
[42949501.360000] 	copy_flag 0
[42949501.360000] 	compat    0
[42949501.370000] 	vol_id    0
[42949501.370000] 	lnum      0
[42949501.370000] 	data_size 0
[42949501.380000] 	used_ebs  0
[42949501.380000] 	data_pad  0
[42949501.380000] 	sqnum     0
[42949501.380000] 	hdr_crc   00000000
[42949501.390000] Volume identifier header hexdump:
[42949501.390000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.400000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.410000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
62, EC -1
[42949501.430000] UBI DBG (pid 90): ubi_scan: process PEB 63
[42949501.440000] UBI DBG (pid 90): process_eb: scan PEB 63
[42949501.440000] UBI warning: ubi_io_read_ec_hdr: bad magic number at
PEB 63: 00000000 instead of 55424923
[42949501.450000] Erase counter header dump:
[42949501.460000] 	magic          0x000000
[42949501.460000] 	version        0
[42949501.460000] 	ec             0
[42949501.470000] 	vid_hdr_offset 0
[42949501.470000] 	data_offset    0
[42949501.470000] 	hdr_crc        0x000000
[42949501.480000] erase counter header hexdump:
[42949501.480000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.490000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.500000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 63: 00000000 instead of 55424921
[42949501.510000] Volume identifier header dump:
[42949501.510000] 	magic     00000000
[42949501.520000] 	version   0
[42949501.520000] 	vol_type  0
[42949501.520000] 	copy_flag 0
[42949501.530000] 	compat    0
[42949501.530000] 	vol_id    0
[42949501.530000] 	lnum      0
[42949501.530000] 	data_size 0
[42949501.540000] 	used_ebs  0
[42949501.540000] 	data_pad  0
[42949501.540000] 	sqnum     0
[42949501.540000] 	hdr_crc   00000000
[42949501.550000] Volume identifier header hexdump:
[42949501.550000] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.560000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00  ................................
[42949501.570000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
63, EC -1
[42949501.590000] UBI DBG (pid 90): ubi_scan: process PEB 64
[42949501.600000] UBI DBG (pid 90): process_eb: scan PEB 64
[42949501.600000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 64: 42492301 instead of 55424921
[42949501.610000] Volume identifier header dump:
[42949501.620000] 	magic     42492301
[42949501.620000] 	version   0
[42949501.620000] 	vol_type  0
[42949501.630000] 	copy_flag 0
[42949501.630000] 	compat    0
[42949501.630000] 	vol_id    0
[42949501.640000] 	lnum      0
[42949501.640000] 	data_size 1048576
[42949501.640000] 	used_ebs  0
[42949501.640000] 	data_pad  0
[42949501.650000] 	sqnum     0
[42949501.650000] 	hdr_crc   ce7b5555
[42949501.650000] Volume identifier header hexdump:
[42949501.660000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949501.670000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949501.680000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
64, EC 0
[42949501.690000] UBI DBG (pid 90): ubi_scan: process PEB 65
[42949501.700000] UBI DBG (pid 90): process_eb: scan PEB 65
[42949501.700000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 65: 42492301 instead of 55424921
[42949501.710000] Volume identifier header dump:
[42949501.720000] 	magic     42492301
[42949501.720000] 	version   0
[42949501.720000] 	vol_type  0
[42949501.730000] 	copy_flag 0
[42949501.730000] 	compat    0
[42949501.730000] 	vol_id    0
[42949501.730000] 	lnum      0
[42949501.740000] 	data_size 1048576
[42949501.740000] 	used_ebs  0
[42949501.740000] 	data_pad  0
[42949501.750000] 	sqnum     0
[42949501.750000] 	hdr_crc   ce7b5555
[42949501.750000] Volume identifier header hexdump:
[42949501.760000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949501.770000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949501.780000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
65, EC 0
[42949501.790000] UBI DBG (pid 90): ubi_scan: process PEB 66
[42949501.800000] UBI DBG (pid 90): process_eb: scan PEB 66
[42949501.800000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 66: 42492301 instead of 55424921
[42949501.810000] Volume identifier header dump:
[42949501.820000] 	magic     42492301
[42949501.820000] 	version   0
[42949501.820000] 	vol_type  0
[42949501.830000] 	copy_flag 0
[42949501.830000] 	compat    0
[42949501.830000] 	vol_id    0
[42949501.830000] 	lnum      0
[42949501.840000] 	data_size 1048576
[42949501.840000] 	used_ebs  0
[42949501.840000] 	data_pad  0
[42949501.850000] 	sqnum     0
[42949501.850000] 	hdr_crc   ce7b5555
[42949501.850000] Volume identifier header hexdump:
[42949501.860000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949501.870000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949501.880000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
66, EC 0
[42949501.890000] UBI DBG (pid 90): ubi_scan: process PEB 67
[42949501.900000] UBI DBG (pid 90): process_eb: scan PEB 67
[42949501.900000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 67: 42492301 instead of 55424921
[42949501.910000] Volume identifier header dump:
[42949501.920000] 	magic     42492301
[42949501.920000] 	version   0
[42949501.920000] 	vol_type  0
[42949501.930000] 	copy_flag 0
[42949501.930000] 	compat    0
[42949501.930000] 	vol_id    0
[42949501.930000] 	lnum      0
[42949501.940000] 	data_size 1048576
[42949501.940000] 	used_ebs  0
[42949501.940000] 	data_pad  0
[42949501.950000] 	sqnum     0
[42949501.950000] 	hdr_crc   ce7b5555
[42949501.950000] Volume identifier header hexdump:
[42949501.960000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949501.970000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949501.980000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
67, EC 0
[42949502.000000] UBI DBG (pid 90): ubi_scan: process PEB 68
[42949502.010000] UBI DBG (pid 90): process_eb: scan PEB 68
[42949502.010000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 68: 42492301 instead of 55424921
[42949502.020000] Volume identifier header dump:
[42949502.030000] 	magic     42492301
[42949502.030000] 	version   0
[42949502.030000] 	vol_type  0
[42949502.040000] 	copy_flag 0
[42949502.040000] 	compat    0
[42949502.040000] 	vol_id    0
[42949502.040000] 	lnum      0
[42949502.050000] 	data_size 1048576
[42949502.050000] 	used_ebs  0
[42949502.050000] 	data_pad  0
[42949502.060000] 	sqnum     0
[42949502.060000] 	hdr_crc   ce7b5555
[42949502.060000] Volume identifier header hexdump:
[42949502.070000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949502.080000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949502.100000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
68, EC 0
[42949502.110000] UBI DBG (pid 90): ubi_scan: process PEB 69
[42949502.120000] UBI DBG (pid 90): process_eb: scan PEB 69
[42949502.120000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 69: 42492301 instead of 55424921
[42949502.130000] Volume identifier header dump:
[42949502.140000] 	magic     42492301
[42949502.140000] 	version   0
[42949502.140000] 	vol_type  0
[42949502.150000] 	copy_flag 0
[42949502.150000] 	compat    0
[42949502.150000] 	vol_id    0
[42949502.150000] 	lnum      0
[42949502.160000] 	data_size 1048576
[42949502.160000] 	used_ebs  0
[42949502.160000] 	data_pad  0
[42949502.170000] 	sqnum     0
[42949502.170000] 	hdr_crc   ce7b5555
[42949502.170000] Volume identifier header hexdump:
[42949502.180000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949502.190000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949502.200000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
69, EC 0
[42949502.210000] UBI DBG (pid 90): ubi_scan: process PEB 70
[42949502.220000] UBI DBG (pid 90): process_eb: scan PEB 70
[42949502.220000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 70: 42492301 instead of 55424921
[42949502.230000] Volume identifier header dump:
[42949502.240000] 	magic     42492301
[42949502.240000] 	version   0
[42949502.240000] 	vol_type  0
[42949502.250000] 	copy_flag 0
[42949502.250000] 	compat    0
[42949502.250000] 	vol_id    0
[42949502.250000] 	lnum      0
[42949502.260000] 	data_size 1048576
[42949502.260000] 	used_ebs  0
[42949502.260000] 	data_pad  0
[42949502.270000] 	sqnum     0
[42949502.270000] 	hdr_crc   ce7b5555
[42949502.270000] Volume identifier header hexdump:
[42949502.280000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949502.290000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949502.300000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
70, EC 0
[42949502.320000] UBI DBG (pid 90): ubi_scan: process PEB 71
[42949502.330000] UBI DBG (pid 90): process_eb: scan PEB 71
[42949502.330000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 71: 42492301 instead of 55424921
[42949502.340000] Volume identifier header dump:
[42949502.350000] 	magic     42492301
[42949502.350000] 	version   0
[42949502.350000] 	vol_type  0
[42949502.360000] 	copy_flag 0
[42949502.360000] 	compat    0
[42949502.360000] 	vol_id    0
[42949502.360000] 	lnum      0
[42949502.370000] 	data_size 1048576
[42949502.370000] 	used_ebs  0
[42949502.370000] 	data_pad  0
[42949502.380000] 	sqnum     0
[42949502.380000] 	hdr_crc   ce7b5555
[42949502.380000] Volume identifier header hexdump:
[42949502.390000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949502.400000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949502.410000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
71, EC 0
[42949502.430000] UBI DBG (pid 90): ubi_scan: process PEB 72
[42949502.440000] UBI DBG (pid 90): process_eb: scan PEB 72
[42949502.440000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 72: 42492301 instead of 55424921
[42949502.450000] Volume identifier header dump:
[42949502.460000] 	magic     42492301
[42949502.460000] 	version   0
[42949502.460000] 	vol_type  0
[42949502.470000] 	copy_flag 0
[42949502.470000] 	compat    0
[42949502.470000] 	vol_id    0
[42949502.470000] 	lnum      0
[42949502.480000] 	data_size 1048576
[42949502.480000] 	used_ebs  0
[42949502.480000] 	data_pad  0
[42949502.490000] 	sqnum     0
[42949502.490000] 	hdr_crc   ce7b5555
[42949502.490000] Volume identifier header hexdump:
[42949502.500000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949502.510000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949502.520000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
72, EC 0
[42949502.540000] UBI DBG (pid 90): ubi_scan: process PEB 73
[42949502.550000] UBI DBG (pid 90): process_eb: scan PEB 73
[42949502.550000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 73: 42492301 instead of 55424921
[42949502.560000] Volume identifier header dump:
[42949502.570000] 	magic     42492301
[42949502.570000] 	version   0
[42949502.570000] 	vol_type  0
[42949502.580000] 	copy_flag 0
[42949502.580000] 	compat    0
[42949502.580000] 	vol_id    0
[42949502.580000] 	lnum      0
[42949502.590000] 	data_size 1048576
[42949502.590000] 	used_ebs  0
[42949502.590000] 	data_pad  0
[42949502.600000] 	sqnum     0
[42949502.600000] 	hdr_crc   ce7b5555
[42949502.600000] Volume identifier header hexdump:
[42949502.610000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949502.620000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949502.630000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
73, EC 0
[42949502.650000] UBI DBG (pid 90): ubi_scan: process PEB 74
[42949502.660000] UBI DBG (pid 90): process_eb: scan PEB 74
[42949502.660000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 74: 42492301 instead of 55424921
[42949502.670000] Volume identifier header dump:
[42949502.680000] 	magic     42492301
[42949502.680000] 	version   0
[42949502.680000] 	vol_type  0
[42949502.690000] 	copy_flag 0
[42949502.690000] 	compat    0
[42949502.690000] 	vol_id    0
[42949502.690000] 	lnum      0
[42949502.700000] 	data_size 1048576
[42949502.700000] 	used_ebs  0
[42949502.700000] 	data_pad  0
[42949502.710000] 	sqnum     0
[42949502.710000] 	hdr_crc   ce7b5555
[42949502.710000] Volume identifier header hexdump:
[42949502.720000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949502.730000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949502.740000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
74, EC 0
[42949502.760000] UBI DBG (pid 90): ubi_scan: process PEB 75
[42949502.770000] UBI DBG (pid 90): process_eb: scan PEB 75
[42949502.770000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 75: 42492301 instead of 55424921
[42949502.780000] Volume identifier header dump:
[42949502.790000] 	magic     42492301
[42949502.790000] 	version   0
[42949502.790000] 	vol_type  0
[42949502.800000] 	copy_flag 0
[42949502.800000] 	compat    0
[42949502.800000] 	vol_id    0
[42949502.800000] 	lnum      0
[42949502.810000] 	data_size 1048576
[42949502.810000] 	used_ebs  0
[42949502.810000] 	data_pad  0
[42949502.820000] 	sqnum     0
[42949502.820000] 	hdr_crc   ce7b5555
[42949502.820000] Volume identifier header hexdump:
[42949502.830000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949502.840000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949502.860000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
75, EC 0
[42949502.870000] UBI DBG (pid 90): ubi_scan: process PEB 76
[42949502.880000] UBI DBG (pid 90): process_eb: scan PEB 76
[42949502.880000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 76: 42492301 instead of 55424921
[42949502.890000] Volume identifier header dump:
[42949502.900000] 	magic     42492301
[42949502.900000] 	version   0
[42949502.900000] 	vol_type  0
[42949502.910000] 	copy_flag 0
[42949502.910000] 	compat    0
[42949502.910000] 	vol_id    0
[42949502.910000] 	lnum      0
[42949502.920000] 	data_size 1048576
[42949502.920000] 	used_ebs  0
[42949502.920000] 	data_pad  0
[42949502.930000] 	sqnum     0
[42949502.930000] 	hdr_crc   ce7b5555
[42949502.930000] Volume identifier header hexdump:
[42949502.940000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949502.950000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949502.960000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
76, EC 0
[42949502.970000] UBI DBG (pid 90): ubi_scan: process PEB 77
[42949502.980000] UBI DBG (pid 90): process_eb: scan PEB 77
[42949502.980000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 77: 42492301 instead of 55424921
[42949502.990000] Volume identifier header dump:
[42949503.000000] 	magic     42492301
[42949503.000000] 	version   0
[42949503.000000] 	vol_type  0
[42949503.010000] 	copy_flag 0
[42949503.010000] 	compat    0
[42949503.010000] 	vol_id    0
[42949503.020000] 	lnum      0
[42949503.020000] 	data_size 1048576
[42949503.020000] 	used_ebs  0
[42949503.020000] 	data_pad  0
[42949503.030000] 	sqnum     0
[42949503.030000] 	hdr_crc   ce7b5555
[42949503.030000] Volume identifier header hexdump:
[42949503.040000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949503.050000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949503.060000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
77, EC 0
[42949503.070000] UBI DBG (pid 90): ubi_scan: process PEB 78
[42949503.080000] UBI DBG (pid 90): process_eb: scan PEB 78
[42949503.080000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 78: 42492301 instead of 55424921
[42949503.090000] Volume identifier header dump:
[42949503.100000] 	magic     42492301
[42949503.100000] 	version   0
[42949503.100000] 	vol_type  0
[42949503.110000] 	copy_flag 0
[42949503.110000] 	compat    0
[42949503.110000] 	vol_id    0
[42949503.120000] 	lnum      0
[42949503.120000] 	data_size 1048576
[42949503.120000] 	used_ebs  0
[42949503.120000] 	data_pad  0
[42949503.130000] 	sqnum     0
[42949503.130000] 	hdr_crc   ce7b5555
[42949503.130000] Volume identifier header hexdump:
[42949503.140000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949503.150000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949503.160000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
78, EC 0
[42949503.170000] UBI DBG (pid 90): ubi_scan: process PEB 79
[42949503.180000] UBI DBG (pid 90): process_eb: scan PEB 79
[42949503.180000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 79: 42492301 instead of 55424921
[42949503.190000] Volume identifier header dump:
[42949503.200000] 	magic     42492301
[42949503.200000] 	version   0
[42949503.210000] 	vol_type  0
[42949503.210000] 	copy_flag 0
[42949503.210000] 	compat    0
[42949503.210000] 	vol_id    0
[42949503.220000] 	lnum      0
[42949503.220000] 	data_size 1048576
[42949503.220000] 	used_ebs  0
[42949503.230000] 	data_pad  0
[42949503.230000] 	sqnum     0
[42949503.230000] 	hdr_crc   ce7b5555
[42949503.230000] Volume identifier header hexdump:
[42949503.240000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949503.250000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949503.260000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
79, EC 0
[42949503.270000] UBI DBG (pid 90): ubi_scan: process PEB 80
[42949503.280000] UBI DBG (pid 90): process_eb: scan PEB 80
[42949503.280000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 80: 42492301 instead of 55424921
[42949503.290000] Volume identifier header dump:
[42949503.300000] 	magic     42492301
[42949503.300000] 	version   0
[42949503.310000] 	vol_type  0
[42949503.310000] 	copy_flag 0
[42949503.310000] 	compat    0
[42949503.310000] 	vol_id    0
[42949503.320000] 	lnum      0
[42949503.320000] 	data_size 1048576
[42949503.320000] 	used_ebs  0
[42949503.330000] 	data_pad  0
[42949503.330000] 	sqnum     0
[42949503.330000] 	hdr_crc   ce7b5555
[42949503.330000] Volume identifier header hexdump:
[42949503.340000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949503.350000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949503.360000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
80, EC 0
[42949503.370000] UBI DBG (pid 90): ubi_scan: process PEB 81
[42949503.380000] UBI DBG (pid 90): process_eb: scan PEB 81
[42949503.380000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 81: 42492301 instead of 55424921
[42949503.390000] Volume identifier header dump:
[42949503.400000] 	magic     42492301
[42949503.400000] 	version   0
[42949503.400000] 	vol_type  0
[42949503.410000] 	copy_flag 0
[42949503.410000] 	compat    0
[42949503.410000] 	vol_id    0
[42949503.420000] 	lnum      0
[42949503.420000] 	data_size 1048576
[42949503.420000] 	used_ebs  0
[42949503.430000] 	data_pad  0
[42949503.430000] 	sqnum     0
[42949503.430000] 	hdr_crc   ce7b5555
[42949503.430000] Volume identifier header hexdump:
[42949503.440000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949503.450000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949503.460000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
81, EC 0
[42949503.470000] UBI DBG (pid 90): ubi_scan: process PEB 82
[42949503.480000] UBI DBG (pid 90): process_eb: scan PEB 82
[42949503.480000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 82: 42492301 instead of 55424921
[42949503.490000] Volume identifier header dump:
[42949503.500000] 	magic     42492301
[42949503.500000] 	version   0
[42949503.500000] 	vol_type  0
[42949503.510000] 	copy_flag 0
[42949503.510000] 	compat    0
[42949503.510000] 	vol_id    0
[42949503.520000] 	lnum      0
[42949503.520000] 	data_size 1048576
[42949503.520000] 	used_ebs  0
[42949503.520000] 	data_pad  0
[42949503.530000] 	sqnum     0
[42949503.530000] 	hdr_crc   ce7b5555
[42949503.530000] Volume identifier header hexdump:
[42949503.540000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949503.550000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949503.560000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
82, EC 0
[42949503.570000] UBI DBG (pid 90): ubi_scan: process PEB 83
[42949503.580000] UBI DBG (pid 90): process_eb: scan PEB 83
[42949503.580000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 83: 42492301 instead of 55424921
[42949503.590000] Volume identifier header dump:
[42949503.600000] 	magic     42492301
[42949503.600000] 	version   0
[42949503.600000] 	vol_type  0
[42949503.610000] 	copy_flag 0
[42949503.610000] 	compat    0
[42949503.610000] 	vol_id    0
[42949503.620000] 	lnum      0
[42949503.620000] 	data_size 1048576
[42949503.620000] 	used_ebs  0
[42949503.620000] 	data_pad  0
[42949503.630000] 	sqnum     0
[42949503.630000] 	hdr_crc   ce7b5555
[42949503.630000] Volume identifier header hexdump:
[42949503.640000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949503.650000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949503.660000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
83, EC 0
[42949503.670000] UBI DBG (pid 90): ubi_scan: process PEB 84
[42949503.680000] UBI DBG (pid 90): process_eb: scan PEB 84
[42949503.680000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 84: 42492301 instead of 55424921
[42949503.690000] Volume identifier header dump:
[42949503.700000] 	magic     42492301
[42949503.700000] 	version   0
[42949503.700000] 	vol_type  0
[42949503.710000] 	copy_flag 0
[42949503.710000] 	compat    0
[42949503.710000] 	vol_id    0
[42949503.720000] 	lnum      0
[42949503.720000] 	data_size 1048576
[42949503.720000] 	used_ebs  0
[42949503.720000] 	data_pad  0
[42949503.730000] 	sqnum     0
[42949503.730000] 	hdr_crc   ce7b5555
[42949503.730000] Volume identifier header hexdump:
[42949503.740000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949503.750000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949503.760000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
84, EC 0
[42949503.770000] UBI DBG (pid 90): ubi_scan: process PEB 85
[42949503.780000] UBI DBG (pid 90): process_eb: scan PEB 85
[42949503.780000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 85: 42492301 instead of 55424921
[42949503.790000] Volume identifier header dump:
[42949503.800000] 	magic     42492301
[42949503.800000] 	version   0
[42949503.800000] 	vol_type  0
[42949503.810000] 	copy_flag 0
[42949503.810000] 	compat    0
[42949503.810000] 	vol_id    0
[42949503.820000] 	lnum      0
[42949503.820000] 	data_size 1048576
[42949503.820000] 	used_ebs  0
[42949503.820000] 	data_pad  0
[42949503.830000] 	sqnum     0
[42949503.830000] 	hdr_crc   ce7b5555
[42949503.830000] Volume identifier header hexdump:
[42949503.840000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949503.850000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949503.860000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
85, EC 0
[42949503.870000] UBI DBG (pid 90): ubi_scan: process PEB 86
[42949503.880000] UBI DBG (pid 90): process_eb: scan PEB 86
[42949503.880000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 86: 42492301 instead of 55424921
[42949503.890000] Volume identifier header dump:
[42949503.900000] 	magic     42492301
[42949503.900000] 	version   0
[42949503.900000] 	vol_type  0
[42949503.910000] 	copy_flag 0
[42949503.910000] 	compat    0
[42949503.910000] 	vol_id    0
[42949503.920000] 	lnum      0
[42949503.920000] 	data_size 1048576
[42949503.920000] 	used_ebs  0
[42949503.920000] 	data_pad  0
[42949503.930000] 	sqnum     0
[42949503.930000] 	hdr_crc   ce7b5555
[42949503.930000] Volume identifier header hexdump:
[42949503.940000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949503.950000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949503.960000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
86, EC 0
[42949503.970000] UBI DBG (pid 90): ubi_scan: process PEB 87
[42949503.980000] UBI DBG (pid 90): process_eb: scan PEB 87
[42949503.980000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 87: 42492301 instead of 55424921
[42949503.990000] Volume identifier header dump:
[42949504.000000] 	magic     42492301
[42949504.000000] 	version   0
[42949504.000000] 	vol_type  0
[42949504.010000] 	copy_flag 0
[42949504.010000] 	compat    0
[42949504.010000] 	vol_id    0
[42949504.020000] 	lnum      0
[42949504.020000] 	data_size 1048576
[42949504.020000] 	used_ebs  0
[42949504.020000] 	data_pad  0
[42949504.030000] 	sqnum     0
[42949504.030000] 	hdr_crc   ce7b5555
[42949504.030000] Volume identifier header hexdump:
[42949504.040000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949504.050000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949504.060000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
87, EC 0
[42949504.070000] UBI DBG (pid 90): ubi_scan: process PEB 88
[42949504.080000] UBI DBG (pid 90): process_eb: scan PEB 88
[42949504.080000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 88: 42492301 instead of 55424921
[42949504.090000] Volume identifier header dump:
[42949504.100000] 	magic     42492301
[42949504.100000] 	version   0
[42949504.100000] 	vol_type  0
[42949504.110000] 	copy_flag 0
[42949504.110000] 	compat    0
[42949504.110000] 	vol_id    0
[42949504.120000] 	lnum      0
[42949504.120000] 	data_size 1048576
[42949504.120000] 	used_ebs  0
[42949504.120000] 	data_pad  0
[42949504.130000] 	sqnum     0
[42949504.130000] 	hdr_crc   ce7b5555
[42949504.130000] Volume identifier header hexdump:
[42949504.140000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949504.150000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949504.160000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
88, EC 0
[42949504.170000] UBI DBG (pid 90): ubi_scan: process PEB 89
[42949504.180000] UBI DBG (pid 90): process_eb: scan PEB 89
[42949504.180000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 89: 42492301 instead of 55424921
[42949504.190000] Volume identifier header dump:
[42949504.200000] 	magic     42492301
[42949504.200000] 	version   0
[42949504.200000] 	vol_type  0
[42949504.210000] 	copy_flag 0
[42949504.210000] 	compat    0
[42949504.210000] 	vol_id    0
[42949504.220000] 	lnum      0
[42949504.220000] 	data_size 1048576
[42949504.220000] 	used_ebs  0
[42949504.220000] 	data_pad  0
[42949504.230000] 	sqnum     0
[42949504.230000] 	hdr_crc   ce7b5555
[42949504.230000] Volume identifier header hexdump:
[42949504.240000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949504.250000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949504.260000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
89, EC 0
[42949504.270000] UBI DBG (pid 90): ubi_scan: process PEB 90
[42949504.280000] UBI DBG (pid 90): process_eb: scan PEB 90
[42949504.280000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 90: 42492301 instead of 55424921
[42949504.290000] Volume identifier header dump:
[42949504.300000] 	magic     42492301
[42949504.300000] 	version   0
[42949504.300000] 	vol_type  0
[42949504.310000] 	copy_flag 0
[42949504.310000] 	compat    0
[42949504.310000] 	vol_id    0
[42949504.310000] 	lnum      0
[42949504.320000] 	data_size 1048576
[42949504.320000] 	used_ebs  0
[42949504.320000] 	data_pad  0
[42949504.330000] 	sqnum     0
[42949504.330000] 	hdr_crc   ce7b5555
[42949504.330000] Volume identifier header hexdump:
[42949504.340000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949504.350000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949504.360000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
90, EC 0
[42949504.370000] UBI DBG (pid 90): ubi_scan: process PEB 91
[42949504.380000] UBI DBG (pid 90): process_eb: scan PEB 91
[42949504.380000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 91: 42492301 instead of 55424921
[42949504.390000] Volume identifier header dump:
[42949504.400000] 	magic     42492301
[42949504.400000] 	version   0
[42949504.400000] 	vol_type  0
[42949504.410000] 	copy_flag 0
[42949504.410000] 	compat    0
[42949504.410000] 	vol_id    0
[42949504.410000] 	lnum      0
[42949504.420000] 	data_size 1048576
[42949504.420000] 	used_ebs  0
[42949504.420000] 	data_pad  0
[42949504.430000] 	sqnum     0
[42949504.430000] 	hdr_crc   ce7b5555
[42949504.430000] Volume identifier header hexdump:
[42949504.440000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949504.450000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949504.460000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
91, EC 0
[42949504.470000] UBI DBG (pid 90): ubi_scan: process PEB 92
[42949504.480000] UBI DBG (pid 90): process_eb: scan PEB 92
[42949504.480000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 92: 42492301 instead of 55424921
[42949504.490000] Volume identifier header dump:
[42949504.500000] 	magic     42492301
[42949504.500000] 	version   0
[42949504.500000] 	vol_type  0
[42949504.510000] 	copy_flag 0
[42949504.510000] 	compat    0
[42949504.510000] 	vol_id    0
[42949504.510000] 	lnum      0
[42949504.520000] 	data_size 1048576
[42949504.520000] 	used_ebs  0
[42949504.520000] 	data_pad  0
[42949504.530000] 	sqnum     0
[42949504.530000] 	hdr_crc   ce7b5555
[42949504.530000] Volume identifier header hexdump:
[42949504.540000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949504.550000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949504.560000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
92, EC 0
[42949504.580000] UBI DBG (pid 90): ubi_scan: process PEB 93
[42949504.590000] UBI DBG (pid 90): process_eb: scan PEB 93
[42949504.590000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 93: 42492301 instead of 55424921
[42949504.600000] Volume identifier header dump:
[42949504.610000] 	magic     42492301
[42949504.610000] 	version   0
[42949504.610000] 	vol_type  0
[42949504.620000] 	copy_flag 0
[42949504.620000] 	compat    0
[42949504.620000] 	vol_id    0
[42949504.620000] 	lnum      0
[42949504.630000] 	data_size 1048576
[42949504.630000] 	used_ebs  0
[42949504.630000] 	data_pad  0
[42949504.640000] 	sqnum     0
[42949504.640000] 	hdr_crc   ce7b5555
[42949504.640000] Volume identifier header hexdump:
[42949504.650000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949504.660000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949504.670000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
93, EC 0
[42949504.690000] UBI DBG (pid 90): ubi_scan: process PEB 94
[42949504.700000] UBI DBG (pid 90): process_eb: scan PEB 94
[42949504.700000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 94: 42492301 instead of 55424921
[42949504.710000] Volume identifier header dump:
[42949504.720000] 	magic     42492301
[42949504.720000] 	version   0
[42949504.720000] 	vol_type  0
[42949504.730000] 	copy_flag 0
[42949504.730000] 	compat    0
[42949504.730000] 	vol_id    0
[42949504.730000] 	lnum      0
[42949504.740000] 	data_size 1048576
[42949504.740000] 	used_ebs  0
[42949504.740000] 	data_pad  0
[42949504.750000] 	sqnum     0
[42949504.750000] 	hdr_crc   ce7b5555
[42949504.750000] Volume identifier header hexdump:
[42949504.760000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949504.770000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949504.780000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
94, EC 0
[42949504.800000] UBI DBG (pid 90): ubi_scan: process PEB 95
[42949504.810000] UBI DBG (pid 90): process_eb: scan PEB 95
[42949504.810000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 95: 42492301 instead of 55424921
[42949504.820000] Volume identifier header dump:
[42949504.830000] 	magic     42492301
[42949504.830000] 	version   0
[42949504.830000] 	vol_type  0
[42949504.840000] 	copy_flag 0
[42949504.840000] 	compat    0
[42949504.840000] 	vol_id    0
[42949504.840000] 	lnum      0
[42949504.850000] 	data_size 1048576
[42949504.850000] 	used_ebs  0
[42949504.850000] 	data_pad  0
[42949504.860000] 	sqnum     0
[42949504.860000] 	hdr_crc   ce7b5555
[42949504.860000] Volume identifier header hexdump:
[42949504.870000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949504.880000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949504.890000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
95, EC 0
[42949504.910000] UBI DBG (pid 90): ubi_scan: process PEB 96
[42949504.920000] UBI DBG (pid 90): process_eb: scan PEB 96
[42949504.920000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 96: 42492301 instead of 55424921
[42949504.930000] Volume identifier header dump:
[42949504.940000] 	magic     42492301
[42949504.940000] 	version   0
[42949504.940000] 	vol_type  0
[42949504.950000] 	copy_flag 0
[42949504.950000] 	compat    0
[42949504.950000] 	vol_id    0
[42949504.950000] 	lnum      0
[42949504.960000] 	data_size 1048576
[42949504.960000] 	used_ebs  0
[42949504.960000] 	data_pad  0
[42949504.970000] 	sqnum     0
[42949504.970000] 	hdr_crc   ce7b5555
[42949504.970000] Volume identifier header hexdump:
[42949504.980000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949504.990000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949505.000000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
96, EC 0
[42949505.020000] UBI DBG (pid 90): ubi_scan: process PEB 97
[42949505.030000] UBI DBG (pid 90): process_eb: scan PEB 97
[42949505.030000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 97: 42492301 instead of 55424921
[42949505.040000] Volume identifier header dump:
[42949505.050000] 	magic     42492301
[42949505.050000] 	version   0
[42949505.050000] 	vol_type  0
[42949505.060000] 	copy_flag 0
[42949505.060000] 	compat    0
[42949505.060000] 	vol_id    0
[42949505.060000] 	lnum      0
[42949505.070000] 	data_size 1048576
[42949505.070000] 	used_ebs  0
[42949505.070000] 	data_pad  0
[42949505.080000] 	sqnum     0
[42949505.080000] 	hdr_crc   ce7b5555
[42949505.080000] Volume identifier header hexdump:
[42949505.090000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949505.100000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949505.110000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
97, EC 0
[42949505.130000] UBI DBG (pid 90): ubi_scan: process PEB 98
[42949505.140000] UBI DBG (pid 90): process_eb: scan PEB 98
[42949505.140000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 98: 42492301 instead of 55424921
[42949505.150000] Volume identifier header dump:
[42949505.160000] 	magic     42492301
[42949505.160000] 	version   0
[42949505.160000] 	vol_type  0
[42949505.160000] 	copy_flag 0
[42949505.170000] 	compat    0
[42949505.170000] 	vol_id    0
[42949505.170000] 	lnum      0
[42949505.180000] 	data_size 1048576
[42949505.180000] 	used_ebs  0
[42949505.180000] 	data_pad  0
[42949505.180000] 	sqnum     0
[42949505.190000] 	hdr_crc   ce7b5555
[42949505.190000] Volume identifier header hexdump:
[42949505.200000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949505.210000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949505.220000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
98, EC 0
[42949505.240000] UBI DBG (pid 90): ubi_scan: process PEB 99
[42949505.250000] UBI DBG (pid 90): process_eb: scan PEB 99
[42949505.250000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 99: 42492301 instead of 55424921
[42949505.260000] Volume identifier header dump:
[42949505.270000] 	magic     42492301
[42949505.270000] 	version   0
[42949505.270000] 	vol_type  0
[42949505.280000] 	copy_flag 0
[42949505.280000] 	compat    0
[42949505.280000] 	vol_id    0
[42949505.280000] 	lnum      0
[42949505.290000] 	data_size 1048576
[42949505.290000] 	used_ebs  0
[42949505.290000] 	data_pad  0
[42949505.300000] 	sqnum     0
[42949505.300000] 	hdr_crc   ce7b5555
[42949505.300000] Volume identifier header hexdump:
[42949505.310000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949505.320000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949505.330000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
99, EC 0
[42949505.350000] UBI DBG (pid 90): ubi_scan: process PEB 100
[42949505.360000] UBI DBG (pid 90): process_eb: scan PEB 100
[42949505.360000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 100: 42492301 instead of 55424921
[42949505.370000] Volume identifier header dump:
[42949505.380000] 	magic     42492301
[42949505.380000] 	version   0
[42949505.380000] 	vol_type  0
[42949505.390000] 	copy_flag 0
[42949505.390000] 	compat    0
[42949505.390000] 	vol_id    0
[42949505.390000] 	lnum      0
[42949505.400000] 	data_size 1048576
[42949505.400000] 	used_ebs  0
[42949505.400000] 	data_pad  0
[42949505.410000] 	sqnum     0
[42949505.410000] 	hdr_crc   ce7b5555
[42949505.410000] Volume identifier header hexdump:
[42949505.420000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949505.430000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949505.440000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
100, EC 0
[42949505.460000] UBI DBG (pid 90): ubi_scan: process PEB 101
[42949505.470000] UBI DBG (pid 90): process_eb: scan PEB 101
[42949505.470000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 101: 42492301 instead of 55424921
[42949505.480000] Volume identifier header dump:
[42949505.490000] 	magic     42492301
[42949505.490000] 	version   0
[42949505.490000] 	vol_type  0
[42949505.500000] 	copy_flag 0
[42949505.500000] 	compat    0
[42949505.500000] 	vol_id    0
[42949505.500000] 	lnum      0
[42949505.510000] 	data_size 1048576
[42949505.510000] 	used_ebs  0
[42949505.510000] 	data_pad  0
[42949505.520000] 	sqnum     0
[42949505.520000] 	hdr_crc   ce7b5555
[42949505.520000] Volume identifier header hexdump:
[42949505.530000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949505.540000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949505.550000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
101, EC 0
[42949505.570000] UBI DBG (pid 90): ubi_scan: process PEB 102
[42949505.580000] UBI DBG (pid 90): process_eb: scan PEB 102
[42949505.580000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 102: 42492301 instead of 55424921
[42949505.590000] Volume identifier header dump:
[42949505.600000] 	magic     42492301
[42949505.600000] 	version   0
[42949505.600000] 	vol_type  0
[42949505.610000] 	copy_flag 0
[42949505.610000] 	compat    0
[42949505.610000] 	vol_id    0
[42949505.610000] 	lnum      0
[42949505.620000] 	data_size 1048576
[42949505.620000] 	used_ebs  0
[42949505.620000] 	data_pad  0
[42949505.630000] 	sqnum     0
[42949505.630000] 	hdr_crc   ce7b5555
[42949505.630000] Volume identifier header hexdump:
[42949505.640000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949505.650000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949505.660000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
102, EC 0
[42949505.680000] UBI DBG (pid 90): ubi_scan: process PEB 103
[42949505.690000] UBI DBG (pid 90): process_eb: scan PEB 103
[42949505.690000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 103: 42492301 instead of 55424921
[42949505.700000] Volume identifier header dump:
[42949505.710000] 	magic     42492301
[42949505.710000] 	version   0
[42949505.710000] 	vol_type  0
[42949505.720000] 	copy_flag 0
[42949505.720000] 	compat    0
[42949505.720000] 	vol_id    0
[42949505.730000] 	lnum      0
[42949505.730000] 	data_size 1048576
[42949505.730000] 	used_ebs  0
[42949505.730000] 	data_pad  0
[42949505.740000] 	sqnum     0
[42949505.740000] 	hdr_crc   ce7b5555
[42949505.740000] Volume identifier header hexdump:
[42949505.750000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949505.760000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949505.770000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
103, EC 0
[42949505.780000] UBI DBG (pid 90): ubi_scan: process PEB 104
[42949505.790000] UBI DBG (pid 90): process_eb: scan PEB 104
[42949505.790000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 104: 42492301 instead of 55424921
[42949505.800000] Volume identifier header dump:
[42949505.810000] 	magic     42492301
[42949505.810000] 	version   0
[42949505.810000] 	vol_type  0
[42949505.820000] 	copy_flag 0
[42949505.820000] 	compat    0
[42949505.820000] 	vol_id    0
[42949505.830000] 	lnum      0
[42949505.830000] 	data_size 1048576
[42949505.830000] 	used_ebs  0
[42949505.830000] 	data_pad  0
[42949505.840000] 	sqnum     0
[42949505.840000] 	hdr_crc   ce7b5555
[42949505.840000] Volume identifier header hexdump:
[42949505.850000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949505.860000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949505.870000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
104, EC 0
[42949505.880000] UBI DBG (pid 90): ubi_scan: process PEB 105
[42949505.890000] UBI DBG (pid 90): process_eb: scan PEB 105
[42949505.890000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 105: 42492301 instead of 55424921
[42949505.900000] Volume identifier header dump:
[42949505.910000] 	magic     42492301
[42949505.910000] 	version   0
[42949505.910000] 	vol_type  0
[42949505.920000] 	copy_flag 0
[42949505.920000] 	compat    0
[42949505.920000] 	vol_id    0
[42949505.930000] 	lnum      0
[42949505.930000] 	data_size 1048576
[42949505.930000] 	used_ebs  0
[42949505.930000] 	data_pad  0
[42949505.940000] 	sqnum     0
[42949505.940000] 	hdr_crc   ce7b5555
[42949505.940000] Volume identifier header hexdump:
[42949505.950000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949505.960000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949505.970000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
105, EC 0
[42949505.980000] UBI DBG (pid 90): ubi_scan: process PEB 106
[42949505.990000] UBI DBG (pid 90): process_eb: scan PEB 106
[42949505.990000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 106: 42492301 instead of 55424921
[42949506.000000] Volume identifier header dump:
[42949506.010000] 	magic     42492301
[42949506.010000] 	version   0
[42949506.010000] 	vol_type  0
[42949506.020000] 	copy_flag 0
[42949506.020000] 	compat    0
[42949506.020000] 	vol_id    0
[42949506.030000] 	lnum      0
[42949506.030000] 	data_size 1048576
[42949506.030000] 	used_ebs  0
[42949506.030000] 	data_pad  0
[42949506.040000] 	sqnum     0
[42949506.040000] 	hdr_crc   ce7b5555
[42949506.040000] Volume identifier header hexdump:
[42949506.050000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949506.060000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949506.070000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
106, EC 0
[42949506.080000] UBI DBG (pid 90): ubi_scan: process PEB 107
[42949506.090000] UBI DBG (pid 90): process_eb: scan PEB 107
[42949506.090000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 107: 42492301 instead of 55424921
[42949506.100000] Volume identifier header dump:
[42949506.110000] 	magic     42492301
[42949506.110000] 	version   0
[42949506.110000] 	vol_type  0
[42949506.120000] 	copy_flag 0
[42949506.120000] 	compat    0
[42949506.120000] 	vol_id    0
[42949506.130000] 	lnum      0
[42949506.130000] 	data_size 1048576
[42949506.130000] 	used_ebs  0
[42949506.130000] 	data_pad  0
[42949506.140000] 	sqnum     0
[42949506.140000] 	hdr_crc   ce7b5555
[42949506.140000] Volume identifier header hexdump:
[42949506.150000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949506.160000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949506.170000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
107, EC 0
[42949506.180000] UBI DBG (pid 90): ubi_scan: process PEB 108
[42949506.190000] UBI DBG (pid 90): process_eb: scan PEB 108
[42949506.190000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 108: 42492301 instead of 55424921
[42949506.200000] Volume identifier header dump:
[42949506.210000] 	magic     42492301
[42949506.210000] 	version   0
[42949506.210000] 	vol_type  0
[42949506.220000] 	copy_flag 0
[42949506.220000] 	compat    0
[42949506.220000] 	vol_id    0
[42949506.230000] 	lnum      0
[42949506.230000] 	data_size 1048576
[42949506.230000] 	used_ebs  0
[42949506.230000] 	data_pad  0
[42949506.240000] 	sqnum     0
[42949506.240000] 	hdr_crc   ce7b5555
[42949506.240000] Volume identifier header hexdump:
[42949506.250000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949506.260000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949506.270000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
108, EC 0
[42949506.280000] UBI DBG (pid 90): ubi_scan: process PEB 109
[42949506.290000] UBI DBG (pid 90): process_eb: scan PEB 109
[42949506.290000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 109: 42492301 instead of 55424921
[42949506.300000] Volume identifier header dump:
[42949506.310000] 	magic     42492301
[42949506.310000] 	version   0
[42949506.310000] 	vol_type  0
[42949506.320000] 	copy_flag 0
[42949506.320000] 	compat    0
[42949506.320000] 	vol_id    0
[42949506.330000] 	lnum      0
[42949506.330000] 	data_size 1048576
[42949506.330000] 	used_ebs  0
[42949506.330000] 	data_pad  0
[42949506.340000] 	sqnum     0
[42949506.340000] 	hdr_crc   ce7b5555
[42949506.340000] Volume identifier header hexdump:
[42949506.350000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949506.360000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949506.370000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
109, EC 0
[42949506.380000] UBI DBG (pid 90): ubi_scan: process PEB 110
[42949506.390000] UBI DBG (pid 90): process_eb: scan PEB 110
[42949506.390000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 110: 42492301 instead of 55424921
[42949506.400000] Volume identifier header dump:
[42949506.410000] 	magic     42492301
[42949506.410000] 	version   0
[42949506.420000] 	vol_type  0
[42949506.420000] 	copy_flag 0
[42949506.420000] 	compat    0
[42949506.420000] 	vol_id    0
[42949506.430000] 	lnum      0
[42949506.430000] 	data_size 1048576
[42949506.430000] 	used_ebs  0
[42949506.440000] 	data_pad  0
[42949506.440000] 	sqnum     0
[42949506.440000] 	hdr_crc   ce7b5555
[42949506.440000] Volume identifier header hexdump:
[42949506.450000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949506.460000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949506.470000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
110, EC 0
[42949506.480000] UBI DBG (pid 90): ubi_scan: process PEB 111
[42949506.490000] UBI DBG (pid 90): process_eb: scan PEB 111
[42949506.500000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 111: 42492301 instead of 55424921
[42949506.500000] Volume identifier header dump:
[42949506.510000] 	magic     42492301
[42949506.510000] 	version   0
[42949506.520000] 	vol_type  0
[42949506.520000] 	copy_flag 0
[42949506.520000] 	compat    0
[42949506.520000] 	vol_id    0
[42949506.530000] 	lnum      0
[42949506.530000] 	data_size 1048576
[42949506.530000] 	used_ebs  0
[42949506.540000] 	data_pad  0
[42949506.540000] 	sqnum     0
[42949506.540000] 	hdr_crc   ce7b5555
[42949506.540000] Volume identifier header hexdump:
[42949506.550000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949506.560000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949506.570000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
111, EC 0
[42949506.580000] UBI DBG (pid 90): ubi_scan: process PEB 112
[42949506.590000] UBI DBG (pid 90): process_eb: scan PEB 112
[42949506.600000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 112: 42492301 instead of 55424921
[42949506.610000] Volume identifier header dump:
[42949506.610000] 	magic     42492301
[42949506.610000] 	version   0
[42949506.620000] 	vol_type  0
[42949506.620000] 	copy_flag 0
[42949506.620000] 	compat    0
[42949506.620000] 	vol_id    0
[42949506.630000] 	lnum      0
[42949506.630000] 	data_size 1048576
[42949506.630000] 	used_ebs  0
[42949506.640000] 	data_pad  0
[42949506.640000] 	sqnum     0
[42949506.640000] 	hdr_crc   ce7b5555
[42949506.640000] Volume identifier header hexdump:
[42949506.650000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949506.660000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949506.670000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
112, EC 0
[42949506.680000] UBI DBG (pid 90): ubi_scan: process PEB 113
[42949506.690000] UBI DBG (pid 90): process_eb: scan PEB 113
[42949506.700000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 113: 42492301 instead of 55424921
[42949506.710000] Volume identifier header dump:
[42949506.710000] 	magic     42492301
[42949506.710000] 	version   0
[42949506.720000] 	vol_type  0
[42949506.720000] 	copy_flag 0
[42949506.720000] 	compat    0
[42949506.720000] 	vol_id    0
[42949506.730000] 	lnum      0
[42949506.730000] 	data_size 1048576
[42949506.730000] 	used_ebs  0
[42949506.740000] 	data_pad  0
[42949506.740000] 	sqnum     0
[42949506.740000] 	hdr_crc   ce7b5555
[42949506.740000] Volume identifier header hexdump:
[42949506.750000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949506.760000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949506.770000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
113, EC 0
[42949506.780000] UBI DBG (pid 90): ubi_scan: process PEB 114
[42949506.790000] UBI DBG (pid 90): process_eb: scan PEB 114
[42949506.800000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 114: 42492301 instead of 55424921
[42949506.810000] Volume identifier header dump:
[42949506.810000] 	magic     42492301
[42949506.810000] 	version   0
[42949506.820000] 	vol_type  0
[42949506.820000] 	copy_flag 0
[42949506.820000] 	compat    0
[42949506.820000] 	vol_id    0
[42949506.830000] 	lnum      0
[42949506.830000] 	data_size 1048576
[42949506.830000] 	used_ebs  0
[42949506.840000] 	data_pad  0
[42949506.840000] 	sqnum     0
[42949506.840000] 	hdr_crc   ce7b5555
[42949506.840000] Volume identifier header hexdump:
[42949506.850000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949506.860000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949506.870000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
114, EC 0
[42949506.880000] UBI DBG (pid 90): ubi_scan: process PEB 115
[42949506.890000] UBI DBG (pid 90): process_eb: scan PEB 115
[42949506.900000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 115: 42492301 instead of 55424921
[42949506.910000] Volume identifier header dump:
[42949506.910000] 	magic     42492301
[42949506.910000] 	version   0
[42949506.920000] 	vol_type  0
[42949506.920000] 	copy_flag 0
[42949506.920000] 	compat    0
[42949506.920000] 	vol_id    0
[42949506.930000] 	lnum      0
[42949506.930000] 	data_size 1048576
[42949506.930000] 	used_ebs  0
[42949506.940000] 	data_pad  0
[42949506.940000] 	sqnum     0
[42949506.940000] 	hdr_crc   ce7b5555
[42949506.940000] Volume identifier header hexdump:
[42949506.950000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949506.960000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949506.970000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
115, EC 0
[42949506.980000] UBI DBG (pid 90): ubi_scan: process PEB 116
[42949506.990000] UBI DBG (pid 90): process_eb: scan PEB 116
[42949507.000000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 116: 42492301 instead of 55424921
[42949507.010000] Volume identifier header dump:
[42949507.010000] 	magic     42492301
[42949507.010000] 	version   0
[42949507.020000] 	vol_type  0
[42949507.020000] 	copy_flag 0
[42949507.020000] 	compat    0
[42949507.020000] 	vol_id    0
[42949507.030000] 	lnum      0
[42949507.030000] 	data_size 1048576
[42949507.030000] 	used_ebs  0
[42949507.040000] 	data_pad  0
[42949507.040000] 	sqnum     0
[42949507.040000] 	hdr_crc   ce7b5555
[42949507.040000] Volume identifier header hexdump:
[42949507.050000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949507.060000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949507.070000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
116, EC 0
[42949507.080000] UBI DBG (pid 90): ubi_scan: process PEB 117
[42949507.090000] UBI DBG (pid 90): process_eb: scan PEB 117
[42949507.100000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 117: 42492301 instead of 55424921
[42949507.110000] Volume identifier header dump:
[42949507.110000] 	magic     42492301
[42949507.110000] 	version   0
[42949507.120000] 	vol_type  0
[42949507.120000] 	copy_flag 0
[42949507.120000] 	compat    0
[42949507.120000] 	vol_id    0
[42949507.130000] 	lnum      0
[42949507.130000] 	data_size 1048576
[42949507.130000] 	used_ebs  0
[42949507.140000] 	data_pad  0
[42949507.140000] 	sqnum     0
[42949507.140000] 	hdr_crc   ce7b5555
[42949507.150000] Volume identifier header hexdump:
[42949507.150000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949507.160000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949507.170000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
117, EC 0
[42949507.180000] UBI DBG (pid 90): ubi_scan: process PEB 118
[42949507.190000] UBI DBG (pid 90): process_eb: scan PEB 118
[42949507.200000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 118: 42492301 instead of 55424921
[42949507.210000] Volume identifier header dump:
[42949507.210000] 	magic     42492301
[42949507.210000] 	version   0
[42949507.220000] 	vol_type  0
[42949507.220000] 	copy_flag 0
[42949507.220000] 	compat    0
[42949507.220000] 	vol_id    0
[42949507.230000] 	lnum      0
[42949507.230000] 	data_size 1048576
[42949507.230000] 	used_ebs  0
[42949507.240000] 	data_pad  0
[42949507.240000] 	sqnum     0
[42949507.240000] 	hdr_crc   ce7b5555
[42949507.250000] Volume identifier header hexdump:
[42949507.250000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949507.260000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949507.270000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
118, EC 0
[42949507.280000] UBI DBG (pid 90): ubi_scan: process PEB 119
[42949507.290000] UBI DBG (pid 90): process_eb: scan PEB 119
[42949507.300000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 119: 42492301 instead of 55424921
[42949507.310000] Volume identifier header dump:
[42949507.310000] 	magic     42492301
[42949507.310000] 	version   0
[42949507.320000] 	vol_type  0
[42949507.320000] 	copy_flag 0
[42949507.320000] 	compat    0
[42949507.330000] 	vol_id    0
[42949507.330000] 	lnum      0
[42949507.330000] 	data_size 1048576
[42949507.330000] 	used_ebs  0
[42949507.340000] 	data_pad  0
[42949507.340000] 	sqnum     0
[42949507.340000] 	hdr_crc   ce7b5555
[42949507.350000] Volume identifier header hexdump:
[42949507.350000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949507.360000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949507.370000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
119, EC 0
[42949507.380000] UBI DBG (pid 90): ubi_scan: process PEB 120
[42949507.390000] UBI DBG (pid 90): process_eb: scan PEB 120
[42949507.400000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 120: 42492301 instead of 55424921
[42949507.410000] Volume identifier header dump:
[42949507.410000] 	magic     42492301
[42949507.410000] 	version   0
[42949507.420000] 	vol_type  0
[42949507.420000] 	copy_flag 0
[42949507.420000] 	compat    0
[42949507.430000] 	vol_id    0
[42949507.430000] 	lnum      0
[42949507.430000] 	data_size 1048576
[42949507.430000] 	used_ebs  0
[42949507.440000] 	data_pad  0
[42949507.440000] 	sqnum     0
[42949507.440000] 	hdr_crc   ce7b5555
[42949507.450000] Volume identifier header hexdump:
[42949507.450000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949507.460000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949507.470000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
120, EC 0
[42949507.480000] UBI DBG (pid 90): ubi_scan: process PEB 121
[42949507.490000] UBI DBG (pid 90): process_eb: scan PEB 121
[42949507.500000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 121: 42492301 instead of 55424921
[42949507.510000] Volume identifier header dump:
[42949507.510000] 	magic     42492301
[42949507.510000] 	version   0
[42949507.520000] 	vol_type  0
[42949507.520000] 	copy_flag 0
[42949507.520000] 	compat    0
[42949507.530000] 	vol_id    0
[42949507.530000] 	lnum      0
[42949507.530000] 	data_size 1048576
[42949507.530000] 	used_ebs  0
[42949507.540000] 	data_pad  0
[42949507.540000] 	sqnum     0
[42949507.540000] 	hdr_crc   ce7b5555
[42949507.550000] Volume identifier header hexdump:
[42949507.550000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949507.560000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949507.570000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
121, EC 0
[42949507.580000] UBI DBG (pid 90): ubi_scan: process PEB 122
[42949507.590000] UBI DBG (pid 90): process_eb: scan PEB 122
[42949507.600000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 122: 42492301 instead of 55424921
[42949507.610000] Volume identifier header dump:
[42949507.610000] 	magic     42492301
[42949507.610000] 	version   0
[42949507.620000] 	vol_type  0
[42949507.620000] 	copy_flag 0
[42949507.620000] 	compat    0
[42949507.630000] 	vol_id    0
[42949507.630000] 	lnum      0
[42949507.630000] 	data_size 1048576
[42949507.630000] 	used_ebs  0
[42949507.640000] 	data_pad  0
[42949507.640000] 	sqnum     0
[42949507.640000] 	hdr_crc   ce7b5555
[42949507.650000] Volume identifier header hexdump:
[42949507.650000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949507.660000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949507.670000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
122, EC 0
[42949507.680000] UBI DBG (pid 90): ubi_scan: process PEB 123
[42949507.690000] UBI DBG (pid 90): process_eb: scan PEB 123
[42949507.700000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 123: 42492301 instead of 55424921
[42949507.710000] Volume identifier header dump:
[42949507.710000] 	magic     42492301
[42949507.710000] 	version   0
[42949507.720000] 	vol_type  0
[42949507.720000] 	copy_flag 0
[42949507.720000] 	compat    0
[42949507.730000] 	vol_id    0
[42949507.730000] 	lnum      0
[42949507.730000] 	data_size 1048576
[42949507.730000] 	used_ebs  0
[42949507.740000] 	data_pad  0
[42949507.740000] 	sqnum     0
[42949507.740000] 	hdr_crc   ce7b5555
[42949507.750000] Volume identifier header hexdump:
[42949507.750000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949507.760000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949507.770000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
123, EC 0
[42949507.780000] UBI DBG (pid 90): ubi_scan: process PEB 124
[42949507.790000] UBI DBG (pid 90): process_eb: scan PEB 124
[42949507.800000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 124: 42492301 instead of 55424921
[42949507.810000] Volume identifier header dump:
[42949507.810000] 	magic     42492301
[42949507.810000] 	version   0
[42949507.820000] 	vol_type  0
[42949507.820000] 	copy_flag 0
[42949507.820000] 	compat    0
[42949507.830000] 	vol_id    0
[42949507.830000] 	lnum      0
[42949507.830000] 	data_size 1048576
[42949507.830000] 	used_ebs  0
[42949507.840000] 	data_pad  0
[42949507.840000] 	sqnum     0
[42949507.840000] 	hdr_crc   ce7b5555
[42949507.850000] Volume identifier header hexdump:
[42949507.850000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949507.860000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949507.870000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
124, EC 0
[42949507.880000] UBI DBG (pid 90): ubi_scan: process PEB 125
[42949507.890000] UBI DBG (pid 90): process_eb: scan PEB 125
[42949507.900000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 125: 42492301 instead of 55424921
[42949507.910000] Volume identifier header dump:
[42949507.910000] 	magic     42492301
[42949507.910000] 	version   0
[42949507.920000] 	vol_type  0
[42949507.920000] 	copy_flag 0
[42949507.920000] 	compat    0
[42949507.930000] 	vol_id    0
[42949507.930000] 	lnum      0
[42949507.930000] 	data_size 1048576
[42949507.930000] 	used_ebs  0
[42949507.940000] 	data_pad  0
[42949507.940000] 	sqnum     0
[42949507.940000] 	hdr_crc   ce7b5555
[42949507.950000] Volume identifier header hexdump:
[42949507.950000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949507.960000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949507.970000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
125, EC 0
[42949507.980000] UBI DBG (pid 90): ubi_scan: process PEB 126
[42949507.990000] UBI DBG (pid 90): process_eb: scan PEB 126
[42949508.000000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 126: 42492301 instead of 55424921
[42949508.010000] Volume identifier header dump:
[42949508.010000] 	magic     42492301
[42949508.010000] 	version   0
[42949508.020000] 	vol_type  0
[42949508.020000] 	copy_flag 0
[42949508.020000] 	compat    0
[42949508.030000] 	vol_id    0
[42949508.030000] 	lnum      0
[42949508.030000] 	data_size 1048576
[42949508.030000] 	used_ebs  0
[42949508.040000] 	data_pad  0
[42949508.040000] 	sqnum     0
[42949508.040000] 	hdr_crc   ce7b5555
[42949508.050000] Volume identifier header hexdump:
[42949508.050000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949508.060000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949508.070000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
126, EC 0
[42949508.090000] UBI DBG (pid 90): ubi_scan: process PEB 127
[42949508.090000] UBI DBG (pid 90): process_eb: scan PEB 127
[42949508.100000] UBI warning: ubi_io_read_vid_hdr: bad magic number at
PEB 127: 42492301 instead of 55424921
[42949508.110000] Volume identifier header dump:
[42949508.110000] 	magic     42492301
[42949508.120000] 	version   0
[42949508.120000] 	vol_type  0
[42949508.120000] 	copy_flag 0
[42949508.120000] 	compat    0
[42949508.130000] 	vol_id    0
[42949508.130000] 	lnum      0
[42949508.130000] 	data_size 1048576
[42949508.140000] 	used_ebs  0
[42949508.140000] 	data_pad  0
[42949508.140000] 	sqnum     0
[42949508.140000] 	hdr_crc   ce7b5555
[42949508.150000] Volume identifier header hexdump:
[42949508.150000] 00000000: 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00
00 00 08 00 00 00 10 00 00 00 00 00 00 00 00 00 00
BI#.............................
[42949508.160000] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 dc ce 7b 55
55  .............................{UU
[42949508.170000] UBI DBG (pid 90): add_to_list: add to corrupted: PEB
127, EC 0
[42949508.180000] UBI DBG (pid 90): ubi_scan: scanning is finished
[42949508.180000] UBI error: ubi_read_volume_table: the layout volume
was not found
[42949508.190000] UBI error: ubi_attach_mtd_dev: failed to attach by
scanning, error -22
ubiattach: error!: cannot attach mtd0
           error 22 (Invalid argument)
~ # 
On Tue, 2009-07-07 at 17:53 +0300, Artem Bityutskiy wrote:
> On Tue, 2009-07-07 at 17:49 +0300, Oren wrote:
> > Do not see any UBI msg...
> > Is there any other configuration options i need to set up?
> 
> Did you try dmesg?
> 
> The link I provided contains the description about how to capture the
> messages:
> 
> http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug
> 
> See the "Debugging messages" sub-section.
> 
