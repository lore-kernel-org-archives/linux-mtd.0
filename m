Received: from smtp.bredband2.com ([83.219.192.166])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcWUv-0006tg-S3
 for linux-mtd@lists.infradead.org; Wed, 24 Aug 2016 11:37:35 +0000
Received: from vera.mazeda.se
 (dynamic.1.14.01de6d18880.80ee73b7fc77.cust.bredband2.com [31.208.72.41])
 (Authenticated sender: ee8704)
 by smtp.bredband2.com (Postfix) with ESMTPSA id 1A1D6473EA
 for <linux-mtd@lists.infradead.org>; Wed, 24 Aug 2016 13:37:06 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by vera.mazeda.se (8.15.2/8.15.2/Debian-4) with ESMTP id u7OBb538017835
 for <linux-mtd@lists.infradead.org>; Wed, 24 Aug 2016 13:37:05 +0200
To: linux-mtd@lists.infradead.org
From: Anders Olofsson <pingu@mazeda.se>
Subject: UBI: Race between fastmap_write and wear_leveling_worker
Message-ID: <7595faa3-6baa-a3d2-0bd6-ea0468a007f3@mazeda.se>
Date: Wed, 24 Aug 2016 13:37:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After enabling fastmap I sometimes get the following warning at boot:

[    2.612424] ubi1: default fastmap pool size: 8
[    2.616802] ubi1: default fastmap WL pool size: 4
[    2.621412] ubi1: attaching mtd3
[    2.739113] ------------[ cut here ]------------
[    2.743623] WARNING: CPU: 0 PID: 102 at drivers/mtd/ubi/fastmap.c:832 
ubi_scan_fastmap+0x145c/0x1464()
[    2.752929] Modules linked in:
[    2.755932] CPU: 0 PID: 102 Comm: ubiattach Not tainted 4.4.19 #24
[    2.762077] Stack : 80916aaa 00000036 80910000 00000000 00000000 
00000000 80095c08 8081fca7
           8fef19d8 00000066 00000000 80904f60 8f49c400 8f592000 
00000000 80095c38
           00000000 803b0078 00000002 00000000 807659f8 8f5a7c14 
8f5a7bfc 8012b6c0
           00000009 80044808 8f49c400 8f592000 8f5a7c14 00000082 
00000200 8075ccd8
           00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000
           ...
[    2.797492] Call Trace:
[    2.799939] [<80020894>] show_stack+0x94/0xb0
[    2.804277] [<803a17d8>] dump_stack+0x88/0xc0
[    2.808633] [<8004497c>] warn_slowpath_common+0xa4/0xe0
[    2.813822] [<800449dc>] warn_slowpath_null+0x24/0x30
[    2.818860] [<80454e98>] ubi_scan_fastmap+0x145c/0x1464
[    2.824077] [<80451754>] ubi_attach+0x2e8/0x4b4
[    2.828585] [<80441400>] ubi_attach_mtd_dev+0x9f4/0x10fc
[    2.833872] [<80441e10>] ctrl_cdev_ioctl+0x100/0x204
[    2.838837] [<8018d010>] do_vfs_ioctl+0xa4/0x6e4
[    2.843420] [<8018d6b0>] SyS_ioctl+0x60/0xa0
[    2.847680] [<800293c8>] syscall_common+0x30/0x54
[    2.852353]
[    2.853906] ---[ end trace 02b9cbc0208a022b ]---
[    2.858486] ubi1 error: ubi_scan_fastmap: Attach by fastmap failed, 
doing a full scan!

After some analysis I've found that the fault is not a lost PEB as the 
comment above the warning seems to indicate but instead a duplicate 
entry. One of the PEBs is present both in the free list and the WL pool. 
The PEB is free so scan_pool() puts it in the free list again with the 
result that count_fastmap_pebs() returns a higher count than expected 
due to the now duplicated entry in the free list.

I've done some debugging of how the fastmap is written and have found 
the following chain of events causing the duplicate entry:
- ubi_update_fastmap() calls ubi_refill_pools() resulting in the pools 
having only unused PEBs.
- ubi_update_fastmap() continues to run without wl_lock while it 
allocates a PEB for the fastmap.
- wear_leveling_worker() wakes up and tries to move a PEB but fails. 
I've seen both "PEB x has no VID header" and ubi_eba_copy_leb() 
returning MOVE_RETRY, but both result in a goto to out_not_moved which 
will call do_sync_erase() that results in the PEB being added to the 
free list.
- ubi_write_fastmap() takes wl_lock and creates a fastmap which includes 
a pool with used entries and the used PEB also being in the free list.

That's how far I've followed this. I guess either the worker thread 
needs to stay away from the pools until ubi_update_fastmap() has 
completed or this error needs to checked for and handled either in 
ubi_write_fastmap() or ubi_scan_fastmap().

I do not know why I'm seeing this so often (happens roughly 1/5 to 1/10 
of every boot on my device) or why it only happens with one of the two 
UBI partitions, but it seems to always include the same PEB being 
duplicated. According to my debug prints, the wear leveling worker is 
very fond of trying and failing to move things to PEB 85 and thus 
erasing it again at every boot even though no data is ever written to it 
(except the EC header).


ubinfo for the partition which I'm seeing the problem on:

# ubinfo /dev/ubi1
ubi1
Volumes count:                           2
Logical eraseblock size:                 129024 bytes, 126.0 KiB
Total amount of logical eraseblocks:     160 (20643840 bytes, 19.7 MiB)
Amount of available logical eraseblocks: 48 (6193152 bytes, 5.9 MiB)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  40
Current maximum erase counter value:     55
Minimum input/output unit size:          2048 bytes
Character device major/minor:            250:0
Present volumes:                         15, 24
# ubinfo /dev/ubi1_15
Volume ID:   15 (on ubi1)
Type:        dynamic
Alignment:   1
Size:        1 LEBs (129024 bytes, 126.0 KiB)
State:       OK
Name:        bootblockpar
Character device major/minor: 250:16
# ubinfo /dev/ubi1_24
Volume ID:   24 (on ubi1)
Type:        dynamic
Alignment:   1
Size:        65 LEBs (8386560 bytes, 8.0 MiB)
State:       OK
Name:        persistent
Character device major/minor: 250:25


I'm seeing this problem on multiple systems (all with same partition 
layout) running both 32bit MIPS and 32bit ARM, most of them with muliple 
cores but fault has also been seen at least once on a single core system.
Currently using Linux 4.4.19 but haven't seen any changes in 4.8-rc3 
that should make any difference for this problem.

/Anders
