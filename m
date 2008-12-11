Received: from aibo.runbox.com ([87.238.52.70])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LAlnP-000521-2l
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 13:41:39 +0000
Received: from [10.9.9.160] (helo=penny.runbox.com)
	by greyhound.runbox.com with esmtp (Exim 4.50) id 1LAlnL-0000tM-W1
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 14:41:36 +0100
Received: from [74.94.155.203] (helo=[192.168.12.139])
	by penny.runbox.com with esmtpsa (uid:263104 )
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1LAlnJ-00060D-OM
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 14:41:33 +0100
Message-ID: <4941188A.30303@runbox.com>
Date: Thu, 11 Dec 2008 08:41:30 -0500
From: Cal Page <pagcal@runbox.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ubiattach fails with bad VID header offset 2048, expected 512 ???
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubiattach fails with bad VID header offset 2048, expected 512 ???

The is the first thing out of the box. It reads block 0 to get the 
ubi_ec_hdr then parses it.

Our system reads/writes 2048 byte blocks with only 32 bytes available in 
the oob area per block.

For my system, is vid_hdr_offset supposed to be 2048, ie point into the 
oob area?

How do I get it working?

Thanks,
Cal Page

here's the log

UBI DBG (pid 2785): ctrl_cdev_ioctl: attach MTD device
UBI: attaching mtd12 to ubi0
UBI DBG (pid 2785): io_init: min_io_size      2048
UBI DBG (pid 2785): io_init: hdrs_min_io_size 512
UBI DBG (pid 2785): io_init: ec_hdr_alsize    512
UBI DBG (pid 2785): io_init: vid_hdr_alsize   512
UBI DBG (pid 2785): io_init: vid_hdr_offset   512
UBI DBG (pid 2785): io_init: vid_hdr_aloffset 512
UBI DBG (pid 2785): io_init: vid_hdr_shift    0
UBI DBG (pid 2785): io_init: leb_start        2048
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI DBG (pid 2785): ubi_scan: process PEB 0
UBI DBG (pid 2785): ubi_io_read_ec_hdr: read EC header from PEB 0
UBI DBG (pid 2785): ubi_io_read: read 64 bytes from PEB 0:0
UBI DBG (pid 2785): ubi_io_read: read: addr = 0, len = 64, 
ubi->mtd->read = 0xc0
cfe16c
UBI error: validate_ec_hdr: bad VID header offset 2048, expected 512
UBI error: validate_ec_hdr: bad EC header
Erase counter header dump:
        magic          0x55424923
        version        1
        ec             1
        vid_hdr_offset 2048
        data_offset    4096
        hdr_crc        0x7f585319
erase counter header hexdump:
00000000: 55 42 49 23 01 00 00 00 00 00 00 00 00 00 00 01 00 00 08 00 00 
00 10 0
0 00 00 00 00 00 00 00 00  UBI#............................
00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 0
0 00 00 00 00 7f 58 53 19  .............................XS.
UBI error: ubi_io_read_ec_hdr: validation failed for PEB 0
UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -22
