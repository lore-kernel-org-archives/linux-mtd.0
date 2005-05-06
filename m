Received: from 207.88.121.43.ptr.us.xo.net ([207.88.121.43]
	helo=mail.realmsys.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DU6ao-0002dB-TF
	for linux-mtd@lists.infradead.org; Fri, 06 May 2005 13:26:29 -0400
From: Peter Grayson <pgrayson@realmsys.com>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>,
	linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 06 May 2005 11:25:58 -0600
Message-Id: <1115400358.4422.92.camel@pgrayson1.realmsys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Centralized Summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have been evaluating the centralized summary patch (jffs2-summary-
centsum-20050504.patch) and have discovered some problems. I am running
a 2.6.10 kernel on a PowerPC 405 platform. I am using a 256MB Samsung
NAND flash device.

The first problem occurs when mounting empty flash. In the test I am
doing, I erase an MTD partition, mount the partition, and then unmount
the partition.

  # flash_eraseall /dev/mtd4
  # mount -t jffs2 /dev/mtdblock4 /mnt
  # umount /dev/mtdblock4

When I do this, umount never returns. No kernel panic occurs. It appears
that some sort of deadlock is happening (the umount process is stuck in
uninterruptible sleep).

The second problem is a kernel panic when I try to create a file. In
this case, I pre-populate an MTD partition with a filesystem generated
by mkfs.jffs2 and sumtool2. If I mount, unmount, remount, and then try
to touch a new file, a kernel panic occurs. This problem is
reproducible.

# mount -t jffs2 /dev/mtdblock4 /mnt/mtdb4
# umount /dev/mtdblock4
# mount -t jffs2 /dev/mtdblock4 /mnt/mtdb4
# touch /mnt/mtdb4/foo
Eeep. Space accounting superblock info is screwed
free 0x03efffbc + dirty 0x0000b634 + used 000f4a10 + erasing 00000000 +
bad 00020000 + wasted 00000000 + unchecked 00000000 != total 04000000
kernel BUG in jffs2_add_physical_node_ref at fs/jffs2/nodemgmt.c:418!
Oops: Exception in kernel mode, sig: 5 [#1]
PREEMPT
NIP: C009BD1C LR: C009BD1C SP: C0233D60 REGS: c0233cb0 TRAP: 0700    Not
tainted
MSR: 00029030 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = c3e9e3d0[71] 'touch' THREAD: c0232000
Last syscall: 5
GPR00: C009BD1C C0233D60 C3E9E3D0 00000091 00000A98 FFFFFFFF 00000A07
C0180000
GPR08: C018E847 C01A0000 00000008 C0233C90 32080093 00005E5C 00108000
00090000
GPR16: 00000040 00000020 00000000 7FFFFB30 00000001 00000000 00000000
C3EDD434
GPR24: C3E9A6C8 00000000 C022C068 C3EDC4F4 00000000 C023FD64 C3EA9200
C0245A98
NIP [c009bd1c] jffs2_add_physical_node_ref+0x28c/0x2c8
LR [c009bd1c] jffs2_add_physical_node_ref+0x28c/0x2c8
Call trace:
 [c009e040] jffs2_write_dnode+0x51c/0x604
 [c009eab8] jffs2_do_create+0xa0/0x2bc
 [c0098a70] jffs2_create+0xbc/0x12c
 [c0057210] vfs_create+0x8c/0xa8
 [c00575c0] open_namei+0x1a0/0x6f0
 [c0045734] filp_open+0x38/0x64
 [c0045a7c] sys_open+0x4c/0x9c
 [c0002a20] ret_from_syscall+0x0/0x48
note: touch[71] exited with preempt_count 1
scheduling while atomic: touch/0x00000001/71
Call trace:
 [c015eca8] schedule+0x5c/0x6d8
 [c003c484] unmap_vmas+0x4b8/0x52c
 [c0040c50] exit_mmap+0x74/0x170
 [c0011524] mmput+0x40/0xf0
 [c0015c0c] do_exit+0x2bc/0xcd4
 [c00035f0] _exception+0x0/0x70
 [c0003628] _exception+0x38/0x70
 [c0003098] ret_from_except_full+0x0/0x4c
 [c009bd1c] jffs2_add_physical_node_ref+0x28c/0x2c8
 [c009e040] jffs2_write_dnode+0x51c/0x604
 [c009eab8] jffs2_do_create+0xa0/0x2bc
 [c0098a70] jffs2_create+0xbc/0x12c
 [c0057210] vfs_create+0x8c/0xa8
 [c00575c0] open_namei+0x1a0/0x6f0
 [c0045734] filp_open+0x38/0x64
Trace/breakpoint trap


I am seeing significant mount-time performance improvements with the
centralized summary patch. Keep up the good work.

Pete
