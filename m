Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aK87W-0004Db-3Y
 for linux-mtd@lists.infradead.org; Fri, 15 Jan 2016 17:25:07 +0000
Received: by mail-wm0-x22b.google.com with SMTP id f206so35202113wmf.0
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2016 09:24:45 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 15 Jan 2016 17:24:44 +0000
Message-ID: <CAO3V0Grneh8P053k=1eVucuSkW0oq5qf16-5k3mi6xAtcSY5bA@mail.gmail.com>
Subject: UBIFS - read only file system
From: Tiago Trota <tiagofgdt@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a system with ARM which is using a NAND flash to store kernel
and file system.
After a reboot  I get these errors and the UBIFS file system becomes
read-only. I can't revert this situation and it was the first time
this happened. Is there anyhing I can do to repair it?

UBIFS error (pid 454): ubifs_iget: failed to read inode 41930, error -2
UBIFS error (pid 454): ubifs_lookup: dead directory entry 'snmpd.pid', error -2
UBIFS warning (pid 454): ubifs_ro_mode: switched to read-only mode, error -2
Backtrace:
[<c000c38c>] (dump_backtrace+0x0/0x10c) from [<c049db38>] (dump_stack+0x18/0x1c)
 r6:e6c5d040 r5:e72c1d48 r4:e70ed400 r3:c063bbc0
[<c049db20>] (dump_stack+0x0/0x1c) from [<c01c2d08>] (ubifs_ro_mode+0x6c/0x78)
[<c01c2c9c>] (ubifs_ro_mode+0x0/0x78) from [<c01bc880>]
(ubifs_lookup+0x1bc/0x1d8)
 r5:fffffffe r4:e6c305d8
[<c01bc6c4>] (ubifs_lookup+0x0/0x1d8) from [<c00bc1c4>] (lookup_real+0x28/0x58)
[<c00bc19c>] (lookup_real+0x0/0x58) from [<c00bcc1c>] (__lookup_hash+0x3c/0x4c)
 r4:00000000 r3:e72c1db7
[<c00bcbe0>] (__lookup_hash+0x0/0x4c) from [<c00bcc70>] (lookup_slow+0x44/0xa4)
 r5:e72c1e18 r4:e72c1e78
[<c00bcc2c>] (lookup_slow+0x0/0xa4) from [<c00bed84>]
(path_lookupat+0x7a4/0x7f0)
 r7:00000050 r6:e72c0000 r5:00000000 r4:00000040
[<c00be5e0>] (path_lookupat+0x0/0x7f0) from [<c00bedf4>]
(do_path_lookup+0x24/0x64)
[<c00bedd0>] (do_path_lookup+0x0/0x64) from [<c00c0db0>]
(user_path_at_empty+0x5c/0x90)
 r7:e72c1f10 r6:e72c1e78 r5:00000000 r4:e71f1000
[<c00c0d54>] (user_path_at_empty+0x0/0x90) from [<c00c0e00>]
(user_path_at+0x1c/0x24)
 r8:c0009364 r7:000000c4 r6:be92feb0 r5:e72c1f40 r4:be92fb98
[<c00c0de4>] (user_path_at+0x0/0x24) from [<c00b6ba8>] (vfs_fstatat+0x38/0x70)
[<c00b6b70>] (vfs_fstatat+0x0/0x70) from [<c00b6c04>] (vfs_lstat+0x24/0x28)
 r5:00000000 r4:be92fb98
[<c00b6be0>] (vfs_lstat+0x0/0x28) from [<c00b6e60>] (sys_lstat64+0x1c/0x38)
[<c00b6e44>] (sys_lstat64+0x0/0x38) from [<c0009200>]
(ret_fast_syscall+0x0/0x30)
 r4:be92ff8e


Regards
