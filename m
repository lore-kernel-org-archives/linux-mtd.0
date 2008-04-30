Received: from smtp124.sbc.mail.sp1.yahoo.com ([69.147.64.97])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jr46U-0002Ev-Rz
	for linux-mtd@lists.infradead.org; Wed, 30 Apr 2008 04:39:39 +0000
From: David Brownell <david-b@pacbell.net>
To: linux-mtd@lists.infradead.org
Subject: jffs2 lockdep warning
Date: Tue, 29 Apr 2008 21:39:35 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200804292139.35426.david-b@pacbell.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This little surprise happened from busybox 1.7.2 "ash" when I typed:

	$ echo $(( 2 + 2 ))

I didn't try to reproduce it.  The kernel used GIT that was current
as of sometime this afternoon.

- Dave

=======================================================
[ INFO: possible circular locking dependency detected ]
2.6.25 #316
-------------------------------------------------------
ash/378 is trying to acquire lock:
 (&c->alloc_sem){--..}, at: [<900b9ea4>] jffs2_reserve_space+0x28/0x120

but task is already holding lock:
 (&ei->sem){--..}, at: [<900c0584>] jffs2_new_inode+0x4c/0x180

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&ei->sem){--..}:
       [<90034b48>] lock_acquire+0x40/0x58
       [<90159b2a>] mutex_lock_nested+0x82/0x1bc
       [<900c0a4a>] jffs2_do_setattr+0x13a/0x618
       [<900c0f9c>] jffs2_setattr+0x18/0x1c
       [<900615d0>] notify_change+0xd8/0x100
       [<90069d30>] do_utimes+0x168/0x198
       [<90069ed2>] sys_utime+0x6a/0x8c
       [<90010136>] syscall_return+0x0/0x12

-> #0 (&c->alloc_sem){--..}:
       [<90034b48>] lock_acquire+0x40/0x58
       [<90159b2a>] mutex_lock_nested+0x82/0x1bc
       [<900b9ea4>] jffs2_reserve_space+0x28/0x120
       [<900bc90a>] jffs2_do_create+0x26/0x220
       [<900b75ba>] jffs2_create+0x6e/0xc8
       [<90058cc8>] vfs_create+0x48/0x54
       [<9005a830>] do_filp_open+0x174/0x614
       [<90052914>] do_sys_open+0x30/0x5c
       [<90052956>] sys_open+0xe/0x10
       [<90010136>] syscall_return+0x0/0x12

other info that might help us debug this:

2 locks held by ash/378:
 #0:  (&type->i_mutex_dir_key#2){--..}, at: [<9005a7a0>] do_filp_open+0xe4/0x614
 #1:  (&ei->sem){--..}, at: [<900c0584>] jffs2_new_inode+0x4c/0x180

stack backtrace:
Call trace:
 [<90013320>] dump_stack+0x18/0x20
 [<90032f36>] print_circular_bug_tail+0x4a/0x60
 [<90034308>] __lock_acquire+0x7a8/0x9b0
 [<90034b48>] lock_acquire+0x40/0x58
 [<90159b2a>] mutex_lock_nested+0x82/0x1bc
 [<900b9ea4>] jffs2_reserve_space+0x28/0x120
 [<900bc90a>] jffs2_do_create+0x26/0x220
 [<900b75ba>] jffs2_create+0x6e/0xc8
 [<90058cc8>] vfs_create+0x48/0x54
 [<9005a830>] do_filp_open+0x174/0x614
 [<90052914>] do_sys_open+0x30/0x5c
 [<90052956>] sys_open+0xe/0x10
 [<90010136>] syscall_return+0x0/0x12
