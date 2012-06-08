Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Scupd-0005Zj-T6
 for linux-mtd@lists.infradead.org; Fri, 08 Jun 2012 08:46:10 +0000
Message-ID: <4FD1BD03.60800@freescale.com>
Date: Fri, 8 Jun 2012 16:51:15 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Huang Shijie
 <shijie8@gmail.com>
Subject: Is there a bug in the UBIFS?
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem:
I tested the GPMI driver in imx28 board with Linus's latest tree.

The gpmi-nand driver passed the mtd_speedtest.ko and mtd_stresstest.ko
tests.

But when I test the UBIFS, i meet a bug:

-----------------------------------------------------------------------------------------------------
root@freescale ~$ ubiattach /dev/ubi_ctrl -m 1
[ 3243.960000] UBI: attaching mtd1 to ubi0
[ 3243.960000] UBI DBG (pid 379): ubi_attach_mtd_dev: sizeof(struct
ubi_ainf_peb) 48
[ 3243.970000] UBI DBG (pid 379): ubi_attach_mtd_dev: sizeof(struct
ubi_wl_entry) 20
[ 3243.980000] UBI DBG (pid 379): io_init: min_io_size 4096
[ 3243.980000] UBI DBG (pid 379): io_init: max_write_size 4096
[ 3243.990000] UBI DBG (pid 379): io_init: hdrs_min_io_size 4096
[ 3243.990000] UBI DBG (pid 379): io_init: ec_hdr_alsize 4096
[ 3244.000000] UBI DBG (pid 379): io_init: vid_hdr_alsize 4096
[ 3244.010000] UBI DBG (pid 379): io_init: vid_hdr_offset 4096
[ 3244.010000] UBI DBG (pid 379): io_init: vid_hdr_aloffset 4096
[ 3244.020000] UBI DBG (pid 379): io_init: vid_hdr_shift 0
[ 3244.020000] UBI DBG (pid 379): io_init: leb_start 8192
[ 3244.030000] UBI DBG (pid 379): io_init: max_erroneous 20
[ 3244.030000] UBI: physical eraseblock size: 524288 bytes (512 KiB)
[ 3244.040000] UBI: logical eraseblock size: 516096 bytes
[ 3244.050000] UBI: smallest flash I/O unit: 4096
[ 3244.050000] UBI: VID header offset: 4096 (aligned 4096)
[ 3244.060000] UBI: data offset: 8192
[ 3244.390000] UBI DBG (pid 379): scan_all: scanning is finished
[ 3244.390000] UBI: empty MTD device detected
[ 3244.400000] UBI: max. sequence number: 0
[ 3244.400000] UBI: create volume table (copy #1)
[ 3244.430000] UBI: create volume table (copy #2)
[ 3244.500000] UBI: attached mtd1 to ubi0
[ 3244.500000] UBI: MTD device name: "Kernel"
[ 3244.500000] UBI: MTD device size: 100 MiB
[ 3244.510000] UBI: number of good PEBs: 200
[ 3244.510000] UBI: number of bad PEBs: 0
[ 3244.520000] UBI: number of corrupted PEBs: 0
[ 3244.520000] UBI: max. allowed volumes: 128
[ 3244.530000] UBI: wear-leveling threshold: 4096
[ 3244.530000] UBI: number of internal volumes: 1
[ 3244.540000] UBI: number of user volumes: 0
[ 3244.540000] UBI: available PEBs: 194
[ 3244.550000] UBI: total number of reserved PEBs: 6
[ 3244.550000] UBI: number of PEBs reserved for bad PEB handling: 2
[ 3244.560000] UBI: max/mean erase counter: 0/0
[ 3244.560000] UBI: image sequence number: -1339417594
[ 3244.570000] UBI: background thread "ubi_bgt0d" started, PID 382
UBI device number 0, total 200 LEBs (103219200 bytes, 98.4 MiB),
available 194 LEBs (100122624 bytes, 95.5 MiB), LEB size 516096 bytes
(504.0 KiB)
root@freescale ~$ ubimkvol /dev/ubi
/dev/ubi0 /dev/ubi_ctrl
root@freescale ~$ ubimkvol /dev/ubi0 -N test -m
Set volume size to 100122624
Volume ID 0, size 194 LEBs (100122624 bytes, 95.5 MiB), LEB size 516096
bytes (504.0 KiB), dynamic, name "test", alignment 1

root@freescale ~$ mount -t ubifs ubi0:test tmp
[ 3526.770000] UBIFS: default file-system created
[ 3526.780000] UBIFS DBG (pid 391): ubifs_bg_thread: background thread
"ubifs_bgt0_0" started, PID 391
[ 3526.960000] UBIFS error (pid 389): ubifs_scan: garbage
[ 3527.140000] UBIFS error (pid 389): ubifs_recover_master_node: failed
to recover master node
[ 3527.150000] UBIFS DBG (pid 391): ubifs_bg_thread: background thread
"ubifs_bgt0_0" stops
mount: mounting ubi0:test on tmp failed: Invalid argument
------------------------------------------------------------------------------------------------------

I am not sure whether it's a UBIFS's bug, or the gpmi-nand's bug.

If you think it's not the UBIFS's bug, please tell me.

Anyway, i am debugging it now.

Best Regards
Huang Shijie
