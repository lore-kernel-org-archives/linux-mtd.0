From: enrico.scholz@sigma-chemnitz.de (Enrico Scholz)
Date: Wed, 19 Feb 2003 13:35:41 +0100
Subject: Kernel oops with an unclean unmounted filesystem
Message-ID: <lyr8a41m8y.fsf@ensc-pc.intern.sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hello,

after creating and/or modifying a file in a JFFS2 filesystem, I
turned off the device without unmounting/syncing the device.

Because the JFFS documentation states

| JFFS is aimed at providing a crash/powerdown-safe filesystem

JFFS2 should cope with such a situation.

Indeed, when restarting the device and mounting the filesystem
the kernel oopses:

| jffs2_get_inode_nodes() for ino 283 returned -12
| Checked all inodes but still 0x44 bytes of unchecked space?
| kernel BUG at fs/jffs2/gc.c:140!
| Unable to handle kernel NULL pointer dereference at virtual address 00000000
| ...
| Backtrace: 
| [<c0026030>] (__bug+0x0/0x58) from [<c00c6f50>] (jffs2_garbage_collect_pass+0x240/0x66c)
|  r4 = C1E38000 
| [<c00c6d10>] (jffs2_garbage_collect_pass+0x0/0x66c) from [<c00c9ff8>] (jffs2_garbage_collect_thread+0x1c4/0x200)
|  r8 = FFFFFFFF  r7 = 00000000  r6 = 00000000  r5 = C1F2E000
|  r4 = C1E38000 
| [<c00c9e34>] (jffs2_garbage_collect_thread+0x0/0x200) from [<c0022040>] (kernel_thread+0x40/0x48)
|  r6 = C1F2E014  r5 = 00000000  r4 = C1F2E000 
| Code: 1b005243 e59f0014 eb005241 e3a03000 (e5833000) 

I am running the 2.5.59 kernel + rmk patches on an ARM XScale
platform. I tried the recent jffs2 fs-driver from CVS also but
the oops still happens. The unclean "unmounting" happened with
the original 2.5.59 JFFS2 driver.

I get an I/O error when reading the questionable directory before
the gc-thread dies.


Does there exists a way to recover or have I to recreate the
filesystem from scratch?



Enrico

-- 
q: If you were young again, would you start writing TeX again or would
   you use Microsoft Word, or another word processor?
a: I hope to die before I have to use Microsoft Word.
  -- Harald Koenig <koenig@tat.physik.uni-tuebingen.de> asking D.E.Knuth
