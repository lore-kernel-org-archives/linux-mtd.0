Received: from crown.reflexsecurity.com ([72.54.139.163])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTi4O-0000fj-TD
	for linux-mtd@lists.infradead.org; Tue, 20 Mar 2007 13:24:26 -0400
Received: from metaxa.reflex ([172.16.8.100])
	by crown.reflexsecurity.com with smtp (Exim 4.63)
	(envelope-from <lunz@reflexsecurity.com>) id 1HTi4G-0007Tp-8s
	for linux-mtd@lists.infradead.org; Tue, 20 Mar 2007 13:24:16 -0400
Date: Tue, 20 Mar 2007 13:24:16 -0400
From: Jason Lunz <lunz@falooley.org>
To: linux-mtd@lists.infradead.org
Subject: jffs2 crash in jffs2_mark_node_obsolete
Message-ID: <20070320172415.GC17996@metaxa.reflex>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I got this bug on a 4-way xeon with a 53M jffs2 partition on block2mtd:

br0: port 2(eth1) entering forwarding state
JFFS2 error: (3556) __jffs2_dbg_acct_sanity_check_nolock: eeep, space accounting superblock info is screwed.
JFFS2 error: (3556) __jffs2_dbg_acct_sanity_check_nolock: free 0x0fbf20 + dirty 0x2093a04 + used 0x125065c + erasing 0x020000 + bad 0x000000 + wasted 0x000074 + unchecked 0x000000 != total 0x3400000.
------------[ cut here ]------------
Kernel BUG at f89720f3 [verbose debug info unavailable]
invalid opcode: 0000 [#1]
SMP 
Modules linked in: af_packet button ac battery bridge llc aufs squashfs rd jffs2 zlib_deflate zlib_inflate block2mtd mtdpart mtdcore dm_mod generic sd_mod ide_core ata_piix i2c_i801 iTCO_wdt serio_raw iTCO_vendor_support ehci_hcd psmouse rtc ata_generic libata uhci_hcd tg3 evdev pcspkr i2c_core scsi_mod e1000 usbcore e752x_edac edac_mc fan
CPU:    2
EIP:    0060:[<f89720f3>]    Not tainted VLI
EFLAGS: 00010296   (2.6.20.3-x86 #2)
EIP is at __jffs2_dbg_acct_sanity_check_nolock+0x147/0x151 [jffs2]
eax: 000000cb   ebx: dfe75400   ecx: c02c82b0   edx: 00000086
esi: dfd7a358   edi: 00000000   ebp: 00000838   esp: e5482e34
ds: 007b   es: 007b   ss: 0068
Process rsync (pid: 3556, ti=e5482000 task=f46bb570 task.ti=e5482000)
Stack: f8977890 00000de4 f8974ce0 000fbf20 02093a04 0125065c 00020000 00000000 
       00000074 00000000 03400000 dfd7a358 dfe75400 f896a4c0 dfe75400 dfd7941c 
       dfc3ed3c f4f95710 f4831788 dfe75400 dfe7e7c8 f8968f39 00000001 f4831788 
Call Trace:
 [<f896a4c0>] jffs2_mark_node_obsolete+0x104/0x231 [jffs2]
 [<f8968f39>] jffs2_kill_fragtree+0x43/0x7d [jffs2]
 [<f896ac6a>] jffs2_do_clear_inode+0x64/0xc3 [jffs2]
 [<c015eadb>] clear_inode+0x6f/0xbd
 [<c013c392>] truncate_inode_pages+0x17/0x1d
 [<c015ebb3>] generic_delete_inode+0x8a/0xd7
 [<c015e3fc>] iput+0x5f/0x61
 [<c015d340>] dput+0xfb/0x113
 [<c0156db1>] sys_renameat+0x163/0x1be
 [<c0156e33>] sys_rename+0x27/0x2b
 [<c0102ce4>] syscall_call+0x7/0xb
 [<c0260033>] __inet6_lookup_established+0x3c/0x194
 =======================
Code: 8b 43 50 89 44 24 14 8b 43 54 89 44 24 10 8b 43 5c 89 44 24 0c 8b 82 b8 00 00 00 c7 04 24 90 78 97 f8 89 44 24 04 e8 05 70 7a c7 <0f> 0b eb fe 83 c4 2c 5b 5e c3 56 89 d6 53 89 c3 8d 80 ec 00 00 
EIP: [<f89720f3>] __jffs2_dbg_acct_sanity_check_nolock+0x147/0x151 [jffs2] SS:ESP 0068:e5482e34


Following this, the rsync process and a pdflush thread seem to be
deadlocked. They trigger these soft lockup warnings:

BUG: soft lockup detected on CPU#3!
 [<c0132e68>] softlockup_tick+0xa6/0xb4
 [<c011ff51>] update_process_times+0x3b/0x5e
 [<c010d3ff>] smp_apic_timer_interrupt+0x72/0x83
 [<c010373c>] apic_timer_interrupt+0x28/0x30
 [<c02627d5>] _spin_lock+0x7/0xf
 [<f89705fa>] jffs2_erase_pending_blocks+0x296/0x5a0 [jffs2]
 [<f8970bfc>] jffs2_write_super+0x21/0x2d [jffs2]
 [<c01506ee>] sync_supers+0x4f/0x8c
 [<c013ab2a>] wb_kupdate+0x23/0xe6
 [<c013ae5e>] pdflush+0x0/0x19d
 [<c013af67>] pdflush+0x109/0x19d
 [<c013ab07>] wb_kupdate+0x0/0xe6
 [<c012825a>] kthread+0xb2/0xdc
 [<c01281a8>] kthread+0x0/0xdc
 [<c01038bf>] kernel_thread_helper+0x7/0x10
 =======================
BUG: soft lockup detected on CPU#0!
 [<c0132e68>] softlockup_tick+0xa6/0xb4
 [<c011ff51>] update_process_times+0x3b/0x5e
 [<c010d3ff>] smp_apic_timer_interrupt+0x72/0x83
 [<c010373c>] apic_timer_interrupt+0x28/0x30
 [<c02627d5>] _spin_lock+0x7/0xf
 [<f896ab73>] jffs2_reserve_space+0xfe/0x173 [jffs2]
 [<c01569a4>] link_path_walk+0xa9/0xb3
 [<f8970d99>] jffs2_do_setattr+0x191/0x52c [jffs2]
 [<c015f7c1>] notify_change+0x12d/0x268
 [<c0168a2d>] do_utimes+0xd1/0xf0
 [<c0168a7b>] sys_futimesat+0x2f/0x38
 [<c0168aa3>] sys_utimes+0x1f/0x23
 [<c0102ce4>] syscall_call+0x7/0xb


I ran 'df', and it too locked up, adding these to the softlockup
warnings:

BUG: soft lockup detected on CPU#1!
 [<c0132e68>] softlockup_tick+0xa6/0xb4
 [<c011ff51>] update_process_times+0x3b/0x5e
 [<c010d3ff>] smp_apic_timer_interrupt+0x72/0x83
 [<c010373c>] apic_timer_interrupt+0x28/0x30
 [<c02627d5>] _spin_lock+0x7/0xf
 [<f897120b>] jffs2_statfs+0x58/0x8f [jffs2]
 [<c014d2ab>] vfs_statfs+0x47/0x5f
 [<c014d39d>] vfs_statfs64+0x10/0x21
 [<c014e24e>] sys_statfs64+0x49/0x80
 [<c0112bde>] __wake_up+0x32/0x43
 [<c01e163b>] tty_ldisc_deref+0x55/0x64
 [<c01e2fd7>] tty_write+0x1c9/0x1da
 [<c014f143>] vfs_write+0x11f/0x159
 [<c014f6e5>] sys_write+0x41/0x67
 [<c0102ce4>] syscall_call+0x7/0xb
 [<c0260033>] __inet6_lookup_established+0x3c/0x194


I have the filesystem image if anyone wants to try further debugging.
This is a development system, and there's a possibility the filesystem
was corrupted, but I imagine we still don't want the kernel to get
wedged like this.

thanks,

Jason
