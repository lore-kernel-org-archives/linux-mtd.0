Received: from e34.co.us.ibm.com ([32.97.110.152])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IFYN4-0005gZ-VI
	for linux-mtd@lists.infradead.org; Mon, 30 Jul 2007 12:45:34 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e34.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l6UGjBqF026144
	for <linux-mtd@lists.infradead.org>; Mon, 30 Jul 2007 12:45:11 -0400
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.4) with ESMTP id
	l6UGjBkR217044
	for <linux-mtd@lists.infradead.org>; Mon, 30 Jul 2007 10:45:11 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l6UGjAZN028896
	for <linux-mtd@lists.infradead.org>; Mon, 30 Jul 2007 10:45:11 -0600
Subject: Re: JFFS2 deadlock with alloc_sem
From: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1185799508.3083.20.camel@pmac.infradead.org>
References: <af3ea28a0707262032h7ee22775t6ef54e364a9cd704@mail.gmail.com>
	<af3ea28a0707262038i733d0a0rf6fda8e1fc82dd74@mail.gmail.com>
	<1185543729.13873.10.camel@kleikamp.austin.ibm.com>
	<af3ea28a0707270935v3a8191acl5f2dc5780c56a3d9@mail.gmail.com>
	<1185557896.22352.4.camel@kleikamp.austin.ibm.com>
	<1185799508.3083.20.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Mon, 30 Jul 2007 11:45:09 -0500
Message-Id: <1185813909.9523.42.camel@kleikamp.austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, ye janboe <janboe.ye@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-07-30 at 13:45 +0100, David Woodhouse wrote:
> On Fri, 2007-07-27 at 12:38 -0500, Dave Kleikamp wrote:
> > I could only speculate, since I really don't know the code.  I suspect
> > the writer of the comment had some other deadlock scenario in mind and
> > didn't foresee the one that was encountered. 
> 
> I'm still confused because we deliberately ensure the page is up to date
> in prepare_write -- so read_cache_page() should never have to lock it,
> and we should never deadlock.

I got involved in this because of a deadlock we found on the 2.4 kernel
which is similar to the one that Nathan reported, but there are some
differences.  Our deadlock didn't involve a thread in vfs_write.

In our case, the page is locked in jffs2_readpage, then blocks on the
file lock.

I don't think prepare_write() get called in this case, and there isn't a
guarantee that the page is up-to-date.

> Or did I miss something in your analysis (or elsewhere)?jffs2_gc_fetch_page

My analysis is of a race between the gc thread and jffs2_readpage, so
it's a bit different.

> Why is read_cache_page() ever trying to lock this page in the first
> place? It should be up to date.

1) In our case, I don't think the page is up-to-date.

2) In Nathan's case, I don't know.  Could there have been another thread
locking a page that wasn't in his report?

3) I see a problem in linux-2.6.22 and later.  It looks like
read_cache_page() will wait for the page to become unlocked, regardless
of whether or not the page is up to date.

For some background, here is a comment from an internal bug report that
explains the deadlock we found:
-------------------------
Although the scenario of this failure may vary from bug 4168, the crux of the 
problem is still the deadlock caused by jffs2 layer. 


Digging deeper, the deadlock involves two threads: pid 75 and pid 17169
PID: 75     TASK: c22b0000  CPU: 0   COMMAND: "jffs2_gcd_mtd17"
 #0 [c22b1dc0] crash_save_current_state at c00190d4
 #1 [c22b1e00] __lock_page at c0038be0
 #2 [c22b1e30] read_cache_page at c003b5dc
 #3 [c22b1e60] jffs2_garbage_collect_dnode at c00960fc
 #4 [c22b1f10] jffs2_garbage_collect_pass at c00951b0
 #5 [c22b1f50] jffs2_garbage_collect_thread at c0097994
 #6 [c22b1ff0] original_kernel_thread at c00055ac
PID: 17169  TASK: c171a000  CPU: 0   COMMAND: "netsCommonMsgSe"
 #0 [c171bdf0] crash_save_current_state at c00190d4
 #1 [c171be30] __down at c0008150
 #2 [c171be60] jffs2_readpage at c008f658
 #3 [c171be80] do_generic_file_read at c00394fc
 #4 [c171bed0] generic_file_read at c0039b28
 #5 [c171bf10] sys_read at c0048bd0
 #6 [c171bf30] ret_from_syscall_1 at c0002b48
syscall [c00] exception frame:
R0:  00000003   R1:  7f5ff1b0   R2:  00000000   R3:  0000000e
R4:  3002a008   R5:  00020000   R6:  1002d8a0   R7:  00000001
R8:  0000002c   R9:  0fdcd918   R10: 7f5ffc00   R11: 7f5fffff
R12: 28428884   R13: 1001ba28   R14: 0000439a   R15: 00fbce5c
R16: 80a00701   R17: 00000000   R18: 7f5ff3d0   R19: 7f5ff71c
R20: 7f5ff390   R21: 00000000   R22: 3002a008   R23: 7f5ff370
R24: 7f5ff2f0   R25: 3002a008   R26: 00020000   R27: 00020000
R28: 3002a008   R29: 0000000e   R30: 0fb8ef24   R31: 00000000
NIP: 0fb1e310   MSR: 0002d030   OR3: 0000000e   CTR: 0faccd0c
LR:  0fdb48cc   XER: 20000000   CCR: 28424884   MQ:  00000000
DAR: 3002a000 DSISR: 00800000        Syscall Result: 00000000
Switching to user space stack (no more symbol info).
foreach: invalid kernel virtual address: c000000  type: "mm_struct pgd"

Thread 75 (gc thread) is holding file lock of /alt/extucode/81e002ff.lid
and waiting for the page lock, while thread 17169 is holding the page lock and 
waiting for the same file lock. 

Thus we conclude that the root cause of the problem is that jffs2 is not 
conforming to the strict order of acquiring multiple locks, ie., all code 
paths resulting in acquiring multiple locks must do so in the same order. 
In this case, gc thread requests first the file lock, then the page lock, 
however jffs2_readpage function requests the page lock first, then the file 
lock. Another potential deadlock source is in jffs2_prepare_write, in which it 
requests page lock, then the file lock. 
-- 
David Kleikamp
IBM Linux Technology Center
