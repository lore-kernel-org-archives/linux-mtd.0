From: tglx@linutronix.de (Thomas Gleixner)
Date: Wed, 19 Feb 2003 15:42:06 +0100
Subject: Kernel oops with an unclean unmounted filesystem
In-Reply-To: <lyr8a41m8y.fsf@ensc-pc.intern.sigma-chemnitz.de>
References: <lyr8a41m8y.fsf@ensc-pc.intern.sigma-chemnitz.de>
Message-ID: <200302191542.06920.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wednesday 19 February 2003 13:35, Enrico Scholz wrote:
> Indeed, when restarting the device and mounting the filesystem
> the kernel oopses:
> | jffs2_get_inode_nodes() for ino 283 returned -12
> | Checked all inodes but still 0x44 bytes of unchecked space?
> | kernel BUG at fs/jffs2/gc.c:140!
> | Unable to handle kernel NULL pointer dereference at virtual address
> | 00000000 ...
> | Backtrace:
> | [<c0026030>] (__bug+0x0/0x58) from [<c00c6f50>]
> | (jffs2_garbage_collect_pass+0x240/0x66c) r4 = C1E38000
> | [<c00c6d10>] (jffs2_garbage_collect_pass+0x0/0x66c) from [<c00c9ff8>]
> | (jffs2_garbage_collect_thread+0x1c4/0x200) r8 = FFFFFFFF  r7 = 00000000 
> | r6 = 00000000  r5 = C1F2E000
> |  r4 = C1E38000
> | [<c00c9e34>] (jffs2_garbage_collect_thread+0x0/0x200) from [<c0022040>]
> | (kernel_thread+0x40/0x48) r6 = C1F2E014  r5 = 00000000  r4 = C1F2E000
> | Code: 1b005243 e59f0014 eb005241 e3a03000 (e5833000)
Strange
> I am running the 2.5.59 kernel + rmk patches on an ARM XScale
> platform. I tried the recent jffs2 fs-driver from CVS also but
> the oops still happens. The unclean "unmounting" happened with
> the original 2.5.59 JFFS2 driver.
> I get an I/O error when reading the questionable directory before
> the gc-thread dies.
> Does there exists a way to recover or have I to recreate the
> filesystem from scratch?
It should be a way. But first we have to know how it happens

Can you please 
1. build a device image (cat /dev/mtdX >image)
2. turn on debugging in JFFS2 (JFFS2_DEBUG = 1) 
3. set debug level to 9 before mounting the fs (echo 9 
>/proc/sys/kernel/printk)
4. get logs from serial console (not from klogd) and record them.

Send the logs and image to me in private 

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
