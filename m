Received: from exprod5og113.obsmtp.com ([64.18.0.26])
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N7sIw-0005yj-3H
	for linux-mtd@lists.infradead.org; Tue, 10 Nov 2009 15:06:50 +0000
Received: from [3.26.69.241] (ES-F97H32J.edi.gefes.com [3.26.69.241])
	by doyen.ramix-uk.cho.ge.com (Postfix) with ESMTP id 94E66C8172
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Nov 2009 15:06:38 +0000 (GMT)
Message-ID: <4AF9817E.2020008@ge.com>
Date: Tue, 10 Nov 2009 15:06:38 +0000
From: Renaud barbier <renaud.barbier@ge.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBI help
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


I am booting busybox on a NOR flash.
30MB of the flash is used for 3 ubi volumes.
One contain Linux, another a redundant image of Linux and the third busybox.
I suspect the way the FS has been built is the problem as when we boot on
the NAND we see no such messages.
I will appreciate any inputs.

During boot I see the following error being printed:
r... [  110.009900] [dfaede60] [c0006ac8] show_stack+0x58/0x164 (unreliable)
[  110.094308] [dfaedea0] [c01104d8] ubifs_dirty_inode+0x58/0xb8
[  110.163091] [dfaedeb0] [c00a2f00] __mark_inode_dirty+0x3c/0x13c
[  110.233969] [dfaedec0] [c0188be0] random_write+0x78/0x90
[  110.297548] [dfaedef0] [c0086f48] vfs_write+0xb8/0x17c
[  110.359035] [dfaedf10] [c0087478] sys_write+0x4c/0x8c
[  110.419485] [dfaedf40] [c000ea18] ret_from_syscall+0x0/0x3c
done.


and periodically more messages:
# uname -a
Linux da923 2.6.32-rc6-da923rc-dev-1.0.0 #7 Tue Nov 10 12:29:58 GMT 2009 
ppc GNU
/Linux
# [  148.503537] UBIFS assert failed in ubifs_release_budget at 566 (pid 
296)
[  148.583778] Call Trace:
[  148.612979] [dfaefcd0] [c0006ac8] show_stack+0x58/0x164 (unreliable)
[  148.689073] [dfaefd10] [c012876c] ubifs_release_budget+0x420/0x560
[  148.763070] [dfaefd20] [c010b6c8] release_existing_page_budget+0x3c/0x50
[  148.843305] [dfaefd60] [c010c94c] do_writepage+0x174/0x1d8
[  148.908972] [dfaefda0] [c00672a4] __writepage+0x24/0x68
[  148.971500] [dfaefdb0] [c00676ac] write_cache_pages+0x230/0x368
[  149.042373] [dfaefe50] [c00a29a0] writeback_single_inode+0xac/0x228
[  149.117408] [dfaefe80] [c00a34bc] writeback_inodes_wb+0x34c/0x3f0
[  149.190358] [dfaefed0] [c00a36ac] wb_writeback+0x14c/0x1b4
[  149.256013] [dfaeff40] [c00a3984] wb_do_writeback+0x1b8/0x1e0
[  149.324796] [dfaeff80] [c00a39e4] bdi_writeback_task+0x38/0xa8
[  149.394629] [dfaeffa0] [c0071eec] bdi_start_fn+0x70/0xcc
[  149.458214] [dfaeffc0] [c00473a4] kthread+0x74/0x78
[  149.516586] [dfaefff0] [c000e798] kernel_thread+0x4c/0x68

===============================================
Here are some information from ubinfo

UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:62
Present UBI devices:            ubi0

ubi0
Volumes count:                           3
Logical eraseblock size:                 130944 bytes, 127.9 KiB
Total amount of logical eraseblocks:     240 (31426560 bytes, 30.0 MiB)
Amount of available logical eraseblocks: 21 (2749824 bytes, 2.6 MiB)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  0
Current maximum erase counter value:     2
Minimum input/output unit size:          1 byte
Character device major/minor:            254:0
Present volumes:                         0, 1, 2

Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        121 LEBs (15844224 bytes, 15.1 MiB)
State:       OK
Name:        boot
Character device major/minor: 254:1
-----------------------------------
Volume ID:   1 (on ubi0)
Type:        static
Alignment:   1
Size:        29 LEBs (3797376 bytes, 3.6 MiB)
Data bytes:  3404544 bytes (3.2 MiB)
State:       OK
Name:        factory
Character device major/minor: 254:2
-----------------------------------
Volume ID:   2 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        65 LEBs (8511360 bytes, 8.1 MiB)
State:       OK
Name:        busybox
Character device major/minor: 254:3
