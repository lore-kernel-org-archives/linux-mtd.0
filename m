Received: from ironport2-out.teksavvy.com ([206.248.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KHKuW-0005Cz-8x
	for linux-mtd@lists.infradead.org; Fri, 11 Jul 2008 15:51:52 +0000
Message-ID: <2558.128.100.203.197.1215792621.squirrel@128.100.203.197>
Date: Fri, 11 Jul 2008 12:10:21 -0400 (EDT)
Subject: Re: DiskOnChip 2000
From: "Jesse Malone" <jmalone@jsoft.ca>
To: anbadeol@gmail.com
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: jmalone@jsoft.ca
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying your driver on a diskonchip 2000 D2202-D16 and seem to be
running into problems writing to the DOC. Have you had success writing to
the DOC? I'm using a 2.6.22 kernel with your patch. I fairly conistently
get a bunch of kernel Oops's after writing a significant amount of data (a
few megabytes). I'll post the Ooops's for you, hopefully they might
provide a clue. Any thoughts?


printing eip:
c0188dc5
*pde = 00000000
Oops: 0000 [#1]
Modules linked in:
CPU:    0
EIP:    0060:[<c0188dc5>]    Not tainted VLI
EFLAGS: 00010046   (2.6.22 #1)
EIP is at rb_insert_color+0x1d/0xc4
eax: 00000000   ebx: c1155498   ecx: 00000000   edx: c1155438
esi: 00000000   edi: c1e3ae04   ebp: c1155438   esp: c10b3c5c
ds: 007b   es: 007b   fs: 0000  gs: 0000  ss: 0068
Process pdflush (pid: 41, ti=c10b2000 task=c1094a00 task.ti=c10b2000)
Stack: 00005a84 c1e3adc0 c1155438 c10bc900 c017afa0 c1155438 c1e3adc0
c1155420
       c01839a3 c1e3adc0 c1155420 c10bc900 00000000 c0184b90 c1e3adc0
c10cade0
       00000000 c017b41d 00000000 00000000 c015f710 c1e3adc0 c10cade0
00000000
Call Trace:
 [<c017afa0>] elv_rb_add+0x44/0x54
 [<c01839a3>] cfq_add_rq_rb+0x2b/0x74
 [<c0184b90>] cfq_insert_request+0x1c/0x3c
 [<c017b41d>] elv_insert+0x105/0x148
 [<c015f710>] bio_phys_segments+0x14/0x18
 [<c017e783>] __make_request+0xb3/0x2e0
 [<c017eb6e>] generic_make_request+0x142/0x1c0
 [<c017dabd>] blk_alloc_request+0x41/0x5c
 [<c017ec31>] submit_bio+0x45/0xb8
 [<c015e72f>] bio_alloc_bioset+0x7b/0x150
 [<c015e1b7>] submit_bh+0xbf/0xfc
 [<c015ca75>] __block_write_full_page+0x101/0x2cc
 [<c0188abd>] radix_tree_gang_lookup_tag+0x99/0xb0
 [<c015f89c>] blkdev_get_block+0x0/0x38
 [<c015e070>] block_write_full_page+0xb4/0xb8
 [<c015f89c>] blkdev_get_block+0x0/0x38
 [<c01300bc>] __writepage+0x8/0x20
 [<c012ffb6>] write_cache_pages+0x1c6/0x2c4
 [<c01300b4>] __writepage+0x0/0x20
 [<c022dc08>] __sched_text_start+0x2e8/0x5a4
 [<c01300d4>] generic_writepages+0x0/0x28
 [<c01300f7>] generic_writepages+0x23/0x28
 [<c013011b>] do_writepages+0x1f/0x38
 [<c0158ac6>] __sync_single_inode+0x4e/0x1b4
 [<c0158c73>] __writeback_single_inode+0x47/0x16c
 [<c022e494>] schedule_timeout+0x4c/0x8c
 [<c0115588>] process_timeout+0x0/0x8
 [<c0133930>] congestion_wait+0x6c/0x78
 [<c011d6b8>] autoremove_wake_function+0x0/0x34
 [<c0158f0b>] sync_sb_inodes+0x173/0x240
 [<c0159047>] writeback_inodes+0x6f/0x74
 [<c012fc8c>] wb_kupdate+0x74/0xe0
 [<c01305be>] __pdflush+0x8e/0x12c
 [<c013065c>] pdflush+0x0/0x28
 [<c013067f>] pdflush+0x23/0x28
 [<c012fc18>] wb_kupdate+0x0/0xe0
 [<c011d394>] kthread+0x58/0x5c
 [<c011d33c>] kthread+0x0/0x5c
 [<c0102df3>] kernel_thread_helper+0x7/0x10
 =======================
Code: c3 90 89 56 04 eb ed 8d 76 00 89 17 eb e6 55 57 56 53 8b 18 83 e3 fc
89 c
EIP: [<c0188dc5>] rb_insert_color+0x1d/0xc4 SS:ESP 0068:c10b3c5c
estart.
process '/usr/bin/tail------------[ cut here ]------------
kernel BUG at block/elevator.c:780!
invalid opcode: 0000 [#2]
Modules linked in:
CPU:    0
EIP:    0060:[<c017b65e>]    Not tainted VLI
EFLAGS: 00010246   (2.6.22 #1)
EIP is at elv_dequeue_request+0x3a/0x40
eax: c10cade0   ebx: c10cade0   ecx: c1e3adc0   edx: c1e3adc0
esi: 00000001   edi: c017d6b8   ebp: c1081fa4   esp: c1081f34
ds: 007b   es: 007b   fs: 0000  gs: 0000  ss: 0068
Process kblockd/0 (pid: 23, ti=c1080000 task=c1078a00 task.ti=c1080000)
Stack: c1e3adc0 c017f286 c1e3adc0 c10cade0 c01bc684 c10cade0 c104c340
c017d69d
       c10cae60 c017d6a6 c017d6c0 c011a902 00000000 df960f00 0000007f
c104c340
       c104c340 c104c348 c1081fb8 c011aa3c 00000000 c1078a00 c011d6b8
c1081fb0
Call Trace:
 [<c017f286>] end_request+0x2a/0x38
 [<c01bc684>] doc2000_request+0x20/0x38
 [<c017d69d>] __generic_unplug_device+0x21/0x24
 [<c017d6a6>] generic_unplug_device+0x6/0x8
 [<c017d6c0>] blk_unplug_work+0x8/0xc
 [<c011a902>] run_workqueue+0x4a/0xe8
 [<c011aa3c>] worker_thread+0x9c/0xb0
 [<c011d6b8>] autoremove_wake_function+0x0/0x34
 [<c010b857>] __wake_up_common+0x33/0x58
 [<c011d6b8>] autoremove_wake_function+0x0/0x34
 [<c011a9a0>] worker_thread+0x0/0xb0
 [<c011d394>] kthread+0x58/0x5c
 [<c011d33c>] kthread+0x0/0x5c
 [<c0102df3>] kernel_thread_helper+0x7/0x10
 =======================
Code: 23 8b 42 04 89 41 04 89 08 80 7a 14 00 89 12 89 52 04 79 06 83 7a 18
01 7
EIP: [<c017b65e>] elv_dequeue_request+0x3a/0x40 SS:ESP 0068:c1081f34
 -f /var/log/messages' (pid 3490) exited. Scheduling it for restart.
process '/sbin/BUG: unable to handle kernel NULL pointer dereference at
virtual2
 printing eip:
c013e58c
*pde = 00000000
Oops: 0000 [#3]
Modules linked in:
CPU:    0
EIP:    0060:[<c013e58c>]    Not tainted VLI
EFLAGS: 00010002   (2.6.22 #1)
EIP is at kmem_cache_alloc+0x28/0x58
eax: 00000000   ebx: 00000286   ecx: c1022aa0   edx: 00000002
esi: c10493c0   edi: 000000d0   ebp: c10fb630   esp: c105fed4
ds: 007b   es: 007b   fs: 0000  gs: 0000  ss: 0068
Process init (pid: 1, ti=c105e000 task=c105c000 task.ti=c105e000)
Stack: c1168340 c1155478 00000001 00000000 00000001 c010c8c8 c1155ee0
c1168374
       c1168034 c1155490 c1155494 c1155484 c1168000 c1168340 c1078a00
00000000
       c10a7ed0 c10a7d80 c010cacb c1078a00 c010d1d4 c01534a7 00000000
c105ff44
Call Trace:
 [<c010c8c8>] dup_mm+0x158/0x2d4
 [<c010cacb>] copy_mm+0x87/0x94
 [<c010d1d4>] copy_process+0x340/0xac8
 [<c01534a7>] mntput_no_expire+0x13/0x4c
 [<c010d9c0>] do_fork+0x64/0x198
 [<c018af8b>] copy_to_user+0x27/0x30
 [<c01013b8>] sys_fork+0x2c/0x30
 [<c0102b6a>] syscall_call+0x7/0xb
 [<c0220000>] devinet_ioctl+0x1f8/0x554
 =======================
Code: 8d 76 00 57 56 53 83 ec 08 89 d7 89 c6 8b 54 24 14 9c 5b fa 8b 88 88
00 0
EIP: [<c013e58c>] kmem_cache_alloc+0x28/0x58 SS:ESP 0068:c105fed4
