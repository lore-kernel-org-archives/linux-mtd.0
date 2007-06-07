Received: from e35.co.us.ibm.com ([32.97.110.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HwJ5w-0000qv-Q5
	for linux-mtd@lists.infradead.org; Thu, 07 Jun 2007 15:36:14 +0100
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l57EY2wM024105
	for <linux-mtd@lists.infradead.org>; Thu, 7 Jun 2007 10:34:02 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l57EY0ED231764
	for <linux-mtd@lists.infradead.org>; Thu, 7 Jun 2007 08:34:01 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l57EXxhk006101
	for <linux-mtd@lists.infradead.org>; Thu, 7 Jun 2007 08:33:59 -0600
Subject: Re: JFFS2 deadlock with alloc_sem
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1180806125.25232.134.camel@pmac.infradead.org>
References: <F0A7A3D5461CB54F878D218854074FCE01F7425F@de01exm63.ds.mot.com>
	<1180806125.25232.134.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Thu, 07 Jun 2007 09:29:59 -0500
Message-Id: <1181226599.464.76.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Roberts Nathan-mcg31137 <Nathan.Roberts@motorola.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-06-02 at 18:42 +0100, David Woodhouse wrote:
> On Mon, 2007-04-30 at 15:41 -0400, Roberts Nathan-mcg31137 wrote:
> > Has anyone seen this deadlock before? It seems to be a classic deadlock 
> > situation so I'm not sure if maybe I'm misinterpreting things or 
> > the use case (several postmark tests running in parallel on a
> > preemptible kernel) is especially vulnerable. 
> 
> I think Josh has spotted the real problem here. Does this help? If so,
> as better fix will be forthcoming....

Hm... so the deadlock I was discussing looks a bit different than the
one Nathan reported.  There, we were thinking that the race was between
page locking and the locking of f->sem by GC.  Below are the stack
traces:

PID: 75     TASK: c22b0000  CPU: 0   COMMAND: "jffs2_gcd_mtd17"
 #0 [c22b1dc0] crash_save_current_state at c00190d4
 #1 [c22b1e00] __lock_page at c0038be0
 #2 [c22b1e30] read_cache_page at c003b5dc
 #3 [c22b1e60] jffs2_garbage_collect_dnode at c00960fc
 #4 [c22b1f10] jffs2_garbage_collect_pass at c00951b0
 #5 [c22b1f50] jffs2_garbage_collect_thread at c0097994
 #6 [c22b1ff0] original_kernel_thread at c00055ac
PID: 17169  TASK: c171a000  CPU: 0   COMMAND: "application"
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

What I can't immediately determine is if it's just a general race
between GC and reading/writing threads when it comes to locking the
pages before locking alloc_sem and/or f->sem, or if these are two
separate races.

The patch you had should fix the above condition, but will it aggravate
the condition Nathan reported?

/me is now confused

josh
