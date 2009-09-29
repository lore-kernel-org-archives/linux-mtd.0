Received: from na3sys009aog111.obsmtp.com ([74.125.149.205])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Msmb9-0001uT-Ko
	for linux-mtd@lists.infradead.org; Tue, 29 Sep 2009 23:59:17 +0000
Received: by pzk4 with SMTP id 4so4050080pzk.32
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Sep 2009 16:59:03 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 30 Sep 2009 09:59:02 +1000
Message-ID: <ed62800909291659i2de751aftdcb6ee879c0ebca0@mail.gmail.com>
Subject: Unable to handle kernel paging request, jffs2_gcd (maybe)
From: Aras Vaichas <arasv@magellan-technology.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I'm using 2.6.26.3 + AT91 patches, AT91RM9200, NAND with JFFS2.

I ran a test where I continuously FTP'd the same 15MB file to the
device over and over again. This simulates a firmware upgrade.

The file causes the NAND device to reach about 80% full. I'm running
this test because I noticed some weird interactions between our
application,ftpd (linux-ftpd-0.17) and the CPU load. The problem could
even be that the system is running our of RAM. Not sure, but I wanted
to run an overnight stress test and see what occurred.

What follows are the stack dumps that I saw this morning. I've tried
my best to break them up. The only reason I'm starting at Linux-MTD is
because the traces feature the jffs2_gcd. I'm happy to skip to another
mailing list if this is the wrong list.

Note that this device is still running, the CPU load is 34.00, and
there are 20 instances of ftpd running in the process list. Yes, it's
in a very sick state. I'd like to understand how the system got into
this state.

Unable to handle kernel paging request at virtual address 05690000
pgd = c0004000
[05690000] *pgd=00000000
Internal error: Oops: 5 [#1] PREEMPT
Modules linked in: readerdrv g_ether vfat fat nls_base
CPU: 0    Not tainted  (2.6.26.3-magarm #110)
PC is at jffs2_thread_should_wake+0x94/0xa4
LR is at 0x1c000
pc : [<c00fa200>]    lr : [<0001c000>]    psr: 80000013
sp : c1d05f3c  ip : 00000007  fp : c1d05f54
r10: 00000000  r9 : 00000000  r8 : 00000000
r7 : 00000001  r6 : 00000003  r5 : 00000001  r4 : c1cff000
r3 : 00000039  r2 : 05690000  r1 : c1cff08c  r0 : 00000000
Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: c000317f  Table: 21f50000  DAC: 00000017
Process jffs2_gcd_mtd5 (pid: 199, stack limit = 0xc1d04260)
Stack: (0xc1d05f3c to 0xc1d06000)
5f20:                                                                40000013
5f40: c1d04000 c1cff000 c1d05ff4 c1d05f58 c0101c4c c00fa17c 00000001 00000000
5f60: 00000080 00000000 00000000 00000000 00000093 00017b46 c1d05f98 c1d05f88
5f80: c01ee8e4 c01ee560 c1d04000 c1d05fac c1d05f9c c0035f70 c01ee8b8 00000000
5fa0: 00000000 c1d05fb0 c0023b84 c0035f48 00000000 c1cff000 c0101bcc c003c894
5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
5fe0: 00000000 00000000 00000000 c1d05ff8 c003c894 c0101bdc d7eb7ecd f9078c11
Backtrace:
[<c00fa16c>] (jffs2_thread_should_wake+0x0/0xa4) from [<c0101c4c>]
(jffs2_garbage_collect_thread+0x80/0x1bc)
 r6:c1cff000 r5:c1d04000 r4:40000013
[<c0101bcc>] (jffs2_garbage_collect_thread+0x0/0x1bc) from
[<c003c894>] (do_exit+0x0/0x65c)
 r7:00000000 r6:00000000 r5:00000000 r4:00000000
Code: e5d4306d e2866001 e1560003 0affffe5 (e5922000)
---[ end trace 1218c359973afa01 ]---



Unable to handle kernel NULL pointer dereference at virtual address 00000034
pgd = c1f5c000
[00000034] *pgd=21d4c031, *pte=00000000, *ppte=00000000
Internal error: Oops: 17 [#2] PREEMPT
Modules linked in: readerdrv g_ether vfat fat nls_base
CPU: 0    Tainted: G      D    (2.6.26.3-magarm #110)
PC is at prepare_signal+0x14/0x18c
LR is at send_signal+0x24/0x1e0
pc : [<c004579c>]    lr : [<c0045b50>]    psr: 80000093
sp : c1f5bbcc  ip : c1f5bbec  fp : c1f5bbe8
r10: c1c58000  r9 : 00000000  r8 : c1cff000
r7 : 00000001  r6 : c1c58000  r5 : 00000000  r4 : c1f5a000
r3 : 00000000  r2 : c1c58000  r1 : c1c58000  r0 : 00000001
Flags: Nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: c000317f  Table: 21f5c000  DAC: 00000015
Process ftpd (pid: 579, stack limit = 0xc1f5a260)
Stack: (0xc1f5bbcc to 0xc1f5c000)
bbc0:                            c1f5a000 80000013 00000001 00000001 c1f5bc14
bbe0: c1f5bbec c0045b50 c0045798 c1f5a000 80000013 c1cf5000 c187aa80 c1cff000
bc00: 002fe000 00000000 c1f5bc24 c1f5bc18 c0045d38 c0045b3c c1f5bc40 c1f5bc28
bc20: c00462c4 c0045d34 c1f5a000 c1cff000 c1cf5000 c1f5bc50 c1f5bc44 c0046310
bc40: c0046298 c1f5bc68 c1f5bc54 c0101ab0 c0046300 c1cff000 00000000 c1f5bc7c
bc60: c1f5bc6c c00f95ac c0101a78 c0fc43e0 c1f5bcd4 c1f5bc80 c00fcc5c c00f95a8
bc80: 00000c88 00000003 00000000 00000000 c170d000 00000c88 00000c88 c170d000
bca0: 00000ccc be05e31d be05e31d 00001000 00000000 c187aa80 c1cf5000 c187aaa8
bcc0: 00000000 c02c31a0 c1f5bd2c c1f5bcd8 c00f7b5c c00fc9bc 002fe000 00001000
bce0: c1f5bcf8 c187aae8 00000000 00001000 002fe000 00000000 00000000 00000947
bd00: 00000947 c01f8400 c1f5a000 002fe000 00000000 00001000 00001000 00000000
bd20: c1f5bdc0 c1f5bd30 c0067e2c c00f7a14 00001000 00001000 c02c31a0 00000947
bd40: c187ab40 c01b7b70 bc00fea9 00000014 00000002 c0181e80 c1c12840 00001000
bd60: 00000000 00000000 c01f8400 c187aaa8 c01f8400 c187ab40 c1fd9880 c1f5bea8
bd80: 00000947 c02c31a0 c1f5bea0 00000001 00000000 00002000 002fe000 00000000
bda0: 00300000 00000000 00000000 c1f5bdf4 c1f5bdf0 c1f5be54 c1f5bdc8 c0068b60
bdc0: c0067ca8 002fe000 00000000 c1f5bef0 00002000 00000000 00000000 c187ab40
bde0: c1fd9880 c1f5bef0 c1f5bea0 c1f5bea8 00002000 002fe000 00000000 00002000
be00: 00000001 00000008 00000001 c1c3ed20 c028da80 c027f7b4 c1f5a000 c1f5be54
be20: c1f5be2c c0182fd0 c019cad8 c1f5bea8 c187aaa8 002fe000 00000000 c1f5bef0
be40: c1f5bea0 c187ab14 c1f5be94 c1f5be58 c0068c10 c0068624 c028da68 c0286ebc
be60: c187ab40 c1fd9880 00000001 c1f5bea8 c1f5bef0 c1fd9880 c1f5bf78 c1f5bea0
be80: 00000000 0001f9f0 c1f5bf50 c1f5be9c c0087794 c0068ba4 002fe000 00000000
bea0: be890f20 00002000 c1f5bed4 c1f5beb8 00000000 00000001 ffffffff c1fd9880
bec0: 00000000 00000000 00000000 00000000 c0800b80 00000000 00000000 c1f5bf08
bee0: c0800b80 c004fa44 c1f5bee8 c1f5bee8 002fe000 00000000 00000001 c1f5bf74
bf00: c1f5bf0c c002371c 00002000 0000000e 00002000 c01f849c c1f5bf78 c1fd9880
bf20: be890f20 c1f5bf78 002fe000 c1fd9880 be890f20 c1f5bf78 00002000 00000000
bf40: c1f5a000 c1f5bf74 c1f5bf54 c00878a8 c00876e4 0001f9f0 c1fd98a0 c1fd9880
bf60: c1f5bf78 002fe000 c1f5bfa4 c1f5bf78 c00879ec c00877f4 002fe000 00000000
bf80: 00000000 00002000 be890f20 00024988 00000004 c0023ca4 00000000 c1f5bfa8
bfa0: c0023b00 c00879b0 00002000 be890f20 00000004 be890f20 00002000 fbad2484
bfc0: 00002000 be890f20 00024988 00024698 00012848 00000000 0001f9f0 be893594
bfe0: 00000000 be890f18 0000b570 401110b4 60000010 00000004 3e6bae52 36ccfe99
Backtrace:
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000
Code: e92dd8f0 e24cb004 e5915230 e1a06001 (e5953034)
---[ end trace 1218c359973afa01 ]---


note: ftpd[579] exited with preempt_count 2
BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000



Unable to handle kernel NULL pointer dereference at virtual address 00000034
pgd = c0004000
[00000034] *pgd=00000000
Internal error: Oops: 17 [#3] PREEMPT
Modules linked in: readerdrv g_ether vfat fat nls_base
CPU: 0    Tainted: G      D    (2.6.26.3-magarm #110)
PC is at prepare_signal+0x14/0x18c
LR is at send_signal+0x24/0x1e0
pc : [<c004579c>]    lr : [<c0045b50>]    psr: 80000093
sp : c1c69e74  ip : c1c69e94  fp : c1c69e90
r10: c1c58000  r9 : 00000000  r8 : c1c69f54
r7 : 00000001  r6 : c1c58000  r5 : 00000000  r4 : c1c68000
r3 : 00000000  r2 : c1c58000  r1 : c1c58000  r0 : 00000001
Flags: Nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: c000317f  Table: 21f50000  DAC: 00000017
Process pdflush (pid: 75, stack limit = 0xc1c68260)
Stack: (0xc1c69e74 to 0xc1c6a000)
9e60:                                              c1c68000 80000013 00000001
9e80: 00000001 c1c69ebc c1c69e94 c0045b50 c0045798 c1c68000 80000013 c1cf8e3c
9ea0: c0275e48 c1c69f54 00000000 00000000 c1c69ecc c1c69ec0 c0045d38 c0045b3c
9ec0: c1c69ee8 c1c69ed0 c00462c4 c0045d34 c1c68000 c1cff000 c1cf8e3c c1c69ef8
9ee0: c1c69eec c0046310 c0046298 c1c69f10 c1c69efc c0101ab0 c0046300 c1cff000
9f00: 00000000 c1c69f28 c1c69f14 c010297c c0101a78 c1cf8e00 c1c68000 c1c69f48
9f20: c1c69f2c c0089640 c0102960 c1c68000 c1c69fb0 c0271788 c1c69fa4 c1c69f9c
9f40: c1c69f4c c006d9b8 c00895a4 c1c588a0 c1c69f70 00000000 00000000 c1c69f4c
9f60: 00000000 00000000 00000000 00000000 00000000 00000000 00000025 c1c68000
9f80: c1c69fb0 c02759e0 c1c69fa4 c0271788 c1c69fdc c1c69fa0 c006ecc0 c006d970
9fa0: 00000001 c1c588a0 c006d960 00000000 c1c69fb0 c1c69fb0 0020630b fffffffc
9fc0: c006eb1c 00000000 00000000 00000000 c1c69ff4 c1c69fe0 c004f36c c006eb2c
9fe0: 00000000 00000000 00000000 c1c69ff8 c003c894 c004f328 420f4ffa fd32e9ff
Backtrace:
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1c68000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf8e3c r5:c1cff000 r4:c1c68000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c010297c>] (jffs2_write_super+0x2c/0x48)
 r5:00000000 r4:c1cff000
[<c0102950>] (jffs2_write_super+0x0/0x48) from [<c0089640>]
(sync_supers+0xac/0x10c)
 r5:c1c68000 r4:c1cf8e00
[<c0089594>] (sync_supers+0x0/0x10c) from [<c006d9b8>] (wb_kupdate+0x58/0x14c)
 r7:c1c69fa4 r6:c0271788 r5:c1c69fb0 r4:c1c68000
[<c006d960>] (wb_kupdate+0x0/0x14c) from [<c006ecc0>] (pdflush+0x1a4/0x298)
 r8:c0271788 r7:c1c69fa4 r6:c02759e0 r5:c1c69fb0 r4:c1c68000
[<c006eb1c>] (pdflush+0x0/0x298) from [<c004f36c>] (kthread+0x54/0x7c)
 r8:00000000 r7:00000000 r6:00000000 r5:c006eb1c r4:fffffffc
[<c004f318>] (kthread+0x0/0x7c) from [<c003c894>] (do_exit+0x0/0x65c)
 r5:00000000 r4:00000000
Code: e92dd8f0 e24cb004 e5915230 e1a06001 (e5953034)
---[ end trace 1218c359973afa01 ]---


------------[ cut here ]------------
WARNING: at kernel/exit.c:965 do_exit+0x34/0x65c()
Modules linked in: readerdrv g_ether vfat fat nls_base
[<c0027650>] (dump_stack+0x0/0x14) from [<c0039f44>]
(warn_on_slowpath+0x4c/0x68)
[<c0039ef8>] (warn_on_slowpath+0x0/0x68) from [<c003c8c8>] (do_exit+0x34/0x65c)
 r6:0000000b r5:c1c588a0 r4:c1c68000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1c69e2c r6:00000017 r5:c1c588a0 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1c69e2c to 0xc1c69e74)
9e20:                            00000001 c1c58000 c1c58000 00000000 c1c68000
9e40: 00000000 c1c58000 00000001 c1c69f54 00000000 c1c58000 c1c69e90 c1c69e94
9e60: c1c69e74 c0045b50 c004579c 80000093 ffffffff
 r8:c1c69f54 r7:00000001 r6:c1c58000 r5:c1c69e60 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1c68000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf8e3c r5:c1cff000 r4:c1c68000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c010297c>] (jffs2_write_super+0x2c/0x48)
 r5:00000000 r4:c1cff000
[<c0102950>] (jffs2_write_super+0x0/0x48) from [<c0089640>]
(sync_supers+0xac/0x10c)
 r5:c1c68000 r4:c1cf8e00
[<c0089594>] (sync_supers+0x0/0x10c) from [<c006d9b8>] (wb_kupdate+0x58/0x14c)
 r7:c1c69fa4 r6:c0271788 r5:c1c69fb0 r4:c1c68000
[<c006d960>] (wb_kupdate+0x0/0x14c) from [<c006ecc0>] (pdflush+0x1a4/0x298)
 r8:c0271788 r7:c1c69fa4 r6:c02759e0 r5:c1c69fb0 r4:c1c68000
[<c006eb1c>] (pdflush+0x0/0x298) from [<c004f36c>] (kthread+0x54/0x7c)
 r8:00000000 r7:00000000 r6:00000000 r5:c006eb1c r4:fffffffc
[<c004f318>] (kthread+0x0/0x7c) from [<c003c894>] (do_exit+0x0/0x65c)
 r5:00000000 r4:00000000
---[ end trace 1218c359973afa01 ]---


note: pdflush[75] exited with preempt_count 2
BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c0076530>] (unmap_vmas+0x5a8/0x620)
 r4:c1f5a000
[<c0075f88>] (unmap_vmas+0x0/0x620) from [<c007bcbc>] (exit_mmap+0x84/0x140)
[<c007bc38>] (exit_mmap+0x0/0x140) from [<c0037a0c>] (mmput+0x40/0xec)
 r8:c1f5bb84 r7:c0800b80 r6:c1fb77b8 r5:c1fb7780 r4:00000000
[<c00379cc>] (mmput+0x0/0xec) from [<c003c4d0>] (exit_mm+0x10c/0x110)
 r5:c1fb7780 r4:c1f5a000
[<c003c3c4>] (exit_mm+0x0/0x110) from [<c003ca5c>] (do_exit+0x1c8/0x65c)
 r7:00000001 r6:0000000b r5:c0800b80 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c003c214>]
(put_files_struct+0x90/0xd4)
 r4:0000001f
[<c003c184>] (put_files_struct+0x0/0xd4) from [<c003c2ac>]
(exit_files+0x54/0x58)
 r8:c1f5bb84 r7:00000001 r6:0000000b r5:c0800b80 r4:c1fb6840
[<c003c258>] (exit_files+0x0/0x58) from [<c003ca6c>] (do_exit+0x1d8/0x65c)
 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


BUG: scheduling while atomic: ftpd/579/0x40000003


[<c0027650>] (dump_stack+0x0/0x14) from [<c0035554>] (__schedule_bug+0x48/0x54)
[<c003550c>] (__schedule_bug+0x0/0x54) from [<c01ee5c0>]
(__sched_text_start+0x70/0x358)
 r4:c1f5a000
[<c01ee550>] (__sched_text_start+0x0/0x358) from [<c0037040>]
(__cond_resched+0x24/0x44)
[<c003701c>] (__cond_resched+0x0/0x44) from [<c01eedc8>]
(_cond_resched+0x44/0x50)
 r4:00000001
[<c01eed84>] (_cond_resched+0x0/0x50) from [<c003c214>]
(put_files_struct+0x90/0xd4)
 r4:00000001
[<c003c184>] (put_files_struct+0x0/0xd4) from [<c003c2ac>]
(exit_files+0x54/0x58)
 r8:c1f5bb84 r7:00000001 r6:0000000b r5:c0800b80 r4:c1fb6840
[<c003c258>] (exit_files+0x0/0x58) from [<c003ca6c>] (do_exit+0x1d8/0x65c)
 r4:c1f5a000
[<c003c894>] (do_exit+0x0/0x65c) from [<c0027884>] (die+0x1d8/0x210)
[<c00276ac>] (die+0x0/0x210) from [<c0028d0c>] (__do_kernel_fault+0x6c/0x7c)
[<c0028ca0>] (__do_kernel_fault+0x0/0x7c) from [<c0029044>]
(do_page_fault+0x208/0x224)
 r7:c1f5bb84 r6:00000017 r5:c0800b80 r4:ffffffff
[<c0028e3c>] (do_page_fault+0x0/0x224) from [<c0023228>]
(do_DataAbort+0x3c/0xa0)
[<c00231ec>] (do_DataAbort+0x0/0xa0) from [<c00236c0>] (__dabt_svc+0x40/0x60)
Exception stack(0xc1f5bb84 to 0xc1f5bbcc)
bb80:          00000001 c1c58000 c1c58000 00000000 c1f5a000 00000000 c1c58000
bba0: 00000001 c1cff000 00000000 c1c58000 c1f5bbe8 c1f5bbec c1f5bbcc c0045b50
bbc0: c004579c 80000093 ffffffff
 r8:c1cff000 r7:00000001 r6:c1c58000 r5:c1f5bbb8 r4:ffffffff
[<c0045788>] (prepare_signal+0x0/0x18c) from [<c0045b50>]
(send_signal+0x24/0x1e0)
 r7:00000001 r6:00000001 r5:80000013 r4:c1f5a000
[<c0045b2c>] (send_signal+0x0/0x1e0) from [<c0045d38>]
(specific_send_sig_info+0x14/0x18)
[<c0045d24>] (specific_send_sig_info+0x0/0x18) from [<c00462c4>]
(send_sig_info+0x3c/0x68)
[<c0046288>] (send_sig_info+0x0/0x68) from [<c0046310>] (send_sig+0x20/0x24)
 r6:c1cf5000 r5:c1cff000 r4:c1f5a000
[<c00462f0>] (send_sig+0x0/0x24) from [<c0101ab0>]
(jffs2_garbage_collect_trigger+0x48/0x68)
[<c0101a68>] (jffs2_garbage_collect_trigger+0x0/0x68) from
[<c00f95ac>] (jffs2_complete_reservation+0x14/0x20)
 r5:00000000 r4:c1cff000
[<c00f9598>] (jffs2_complete_reservation+0x0/0x20) from [<c00fcc5c>]
(jffs2_write_inode_range+0x2b0/0x31c)
 r4:c0fc43e0
[<c00fc9ac>] (jffs2_write_inode_range+0x0/0x31c) from [<c00f7b5c>]
(jffs2_write_end+0x158/0x294)
[<c00f7a04>] (jffs2_write_end+0x0/0x294) from [<c0067e2c>]
(generic_file_buffered_write+0x198/0x680)
[<c0067c98>] (generic_file_buffered_write+0x4/0x680) from [<c0068b60>]
(__generic_file_aio_write_nolock+0x54c/0x57c)
[<c0068614>] (__generic_file_aio_write_nolock+0x0/0x57c) from
[<c0068c10>] (generic_file_aio_write+0x80/0xf4)
[<c0068b94>] (generic_file_aio_write+0x4/0xf4) from [<c0087794>]
(do_sync_write+0xc0/0x110)
[<c00876d4>] (do_sync_write+0x0/0x110) from [<c00878a8>] (vfs_write+0xc4/0x148)
 r9:c1f5a000 r8:00000000 r7:00002000 r6:c1f5bf78 r5:be890f20
r4:c1fd9880
[<c00877e4>] (vfs_write+0x0/0x148) from [<c00879ec>] (sys_write+0x4c/0x74)
 r7:002fe000 r6:c1f5bf78 r5:c1fd9880 r4:c1fd98a0
[<c00879a0>] (sys_write+0x0/0x74) from [<c0023b00>] (ret_fast_syscall+0x0/0x2c)
 r8:c0023ca4 r7:00000004 r6:00024988 r5:be890f20 r4:00002000


Aras
