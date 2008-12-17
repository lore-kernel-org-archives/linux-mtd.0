Received: from aibo.runbox.com ([87.238.52.70])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCzud-0003rW-GZ
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 17:10:19 +0000
Received: from [10.9.9.160] (helo=penny.runbox.com)
	by greyhound.runbox.com with esmtp (Exim 4.50) id 1LCzue-0008JZ-VD
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 18:10:21 +0100
Received: from [74.94.155.203] (helo=[192.168.12.139])
	by penny.runbox.com with esmtpsa (uid:263104 )
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1LCzub-0007nn-L9
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 18:10:17 +0100
Message-ID: <49493276.703@runbox.com>
Date: Wed, 17 Dec 2008 12:10:14 -0500
From: Cal Page <pagcal@runbox.com>
MIME-Version: 1.0
To: ubifs <linux-mtd@lists.infradead.org>
Subject: ubifs: another scheduling while atomic back trace
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

Here's a second backtrace. When the ubifs partition fills up, I get 
'scheduling while atomic' from schedule().

Any ideas?

Cal Page

Backtrace: 

[<c0e1e580>] (schedule+0x0/0x6dc) from [<c0e1ff68>] (__mutex_lock_slowpath+0x84/0xe4)
[<c0e1fee4>] (__mutex_lock_slowpath+0x0/0xe4) from [<c0e1fd48>] (mutex_lock+0x20/0x28)
 r6 = C4C1D574  r5 = 00000000  r4 = C529A000 
[<c0e1fd28>] (mutex_lock+0x0/0x28) from [<c0c46460>] (make_reservation+0x78/0x6d0)
[<c0c463e8>] (make_reservation+0x0/0x6d0) from [<c0c474f0>] (ubifs_jnl_write_data+0x1e4/0x334
[<c0c4730c>] (ubifs_jnl_write_data+0x0/0x334) from [<c0c498c4>] (do_writepage+0xbc/0x204)
[<c0c49808>] (do_writepage+0x0/0x204) from [<c0c4aaa0>] (ubifs_writepage+0x240/0x278)
[<c0c4a860>] (ubifs_writepage+0x0/0x278) from [<c0bb6ce8>] (generic_writepages+0x1e8/0x388)
[<c0bb6b00>] (generic_writepages+0x0/0x388) from [<c0bb6ed0>] (do_writepages+0x48/0x60)
[<c0bb6e88>] (do_writepages+0x0/0x60) from [<c0bf2e20>] (__writeback_single_inode+0x1b8/0x384)
 r4 = 00000004 
[<c0bf2c68>] (__writeback_single_inode+0x0/0x384) from [<c0bf32a0>] (sync_sb_inodes+0x1d8/0x2c8)
[<c0bf30c8>] (sync_sb_inodes+0x0/0x2c8) from [<c0bf35a4>] (generic_sync_sb_inodes+0x10/0x14)
[<c0bf3594>] (generic_sync_sb_inodes+0x0/0x14) from [<c0c65534>] (ubifs_budget_space+0x98c/0xe98)
[<c0c64ba8>] (ubifs_budget_space+0x0/0xe98) from [<c0c4a578>] (ubifs_prepare_write+0x18c/0x1a4)
[<c0c4a3ec>] (ubifs_prepare_write+0x0/0x1a4) from [<c0bb22f4>] (generic_file_buffered_write+0x2a0/0x694)
[<c0bb2058>] (generic_file_buffered_write+0x4/0x694) from [<c0bb2c24>] (__generic_file_aio_write_nolock+0x53c/0x5bc)
[<c0bb26e8>] (__generic_file_aio_write_nolock+0x0/0x5bc) from [<c0bb2d20>] (generic_file_aio_write+0x7c/0xf0)
[<c0bb2ca8>] (generic_file_aio_write+0x4/0xf0) from [<c0c49220>] (ubifs_aio_write+0x1b4/0x244)
[<c0c49070>] (ubifs_aio_write+0x4/0x244) from [<c0bd2718>] (do_sync_write+0xc0/0x114)
[<c0bd2658>] (do_sync_write+0x0/0x114) from [<c0bd30d8>] (vfs_write+0xb8/0x194)
 r6 = C529BF80  r5 = BED58AF8  r4 = C5450B40 
[<c0bd3020>] (vfs_write+0x0/0x194) from [<c0bd37f0>] (sys_write+0x4c/0x80)
 r7 = 00000004  r6 = 00000000  r5 = 0012C000  r4 = C5450B40
[<c0bd37a4>] (sys_write+0x0/0x80) from [<c0b6fde0>] (ret_fast_syscall+0x0/0x2c)
 r6 = 4001D660  r5 = BED58AF8  r4 = 00002000 
Code: e59f0650 ebf5b474 ebf55526 e3a03000 (e5833000) 
 <6>prphw_disable Disable PRP CH 2

Kernel panic - not syncing: Aiee, killing interrupt handler!
