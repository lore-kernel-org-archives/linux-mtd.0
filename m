Received: from mail-vc0-x232.google.com ([2607:f8b0:400c:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5xTy-0000yS-5J
 for linux-mtd@lists.infradead.org; Sat, 12 Jul 2014 13:36:54 +0000
Received: by mail-vc0-f178.google.com with SMTP id ij19so4195706vcb.23
 for <linux-mtd@lists.infradead.org>; Sat, 12 Jul 2014 06:36:32 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 12 Jul 2014 21:36:32 +0800
Message-ID: <CAEGnBBSC=k5kkQYkLn37Q8KLLC+n43KiNr9ZZ-8NPJaGkGf0Qg@mail.gmail.com>
Subject: ubifs issue about xattr node when replay journal
From: =?UTF-8?B?546L5LiB?= <walklook@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Now we use xattr based on ubifs, and find some issues about it.
Situation like that:
1.poweron ->2.create a file -> 3.set xattr -> 4.delete the file -> 5.power cut
After several cycles with above steps, we can not boot up the device
with the error below.


Analysis:
when delete a file, ubifs will remove the xent node from tnc, if gc
happend, it will remove the xent node data from the GCed LEB because
of it has been removed form tnc ,
then if a power cut happen, the journal replay may also try to remove
the related xattr node, the error occurred because of it has been
GCed.


Now I run commit when ubifs_jnl_delete_inode called, and it's OK.
Does anyone have a better way for the issue?


-------- kernel 3.10 log --------
[   64.916532] UBIFS: background thread "ubifs_bgt0_16" started, PID 92
[   64.926411] UBIFS: recovery needed
[   65.013786] UBIFS error (pid 91): ubifs_read_node: bad node type
(255 but expected 3)
[   65.021595] UBIFS error (pid 91): ubifs_read_node: bad node at LEB
88:39680, LEB mapping status 1
[   65.030431] Not a node, first 24 bytes:
[   65.034073] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff
........................
[   65.047529] cpufreq_scx35: 600000 --> 1000000, real=1000000, index=0
[   65.047557] CPU: 0 PID: 91 Comm: mount Not tainted
3.10.17-g3891906-dirty #66-Tizen
[   65.047598] [<c00136c4>] (unwind_backtrace+0x0/0x120) from
[<c0011fd4>] (show_stack+0x10/0x14)
[   65.047617] [<c0011fd4>] (show_stack+0x10/0x14) from [<c0189880>]
(ubifs_read_node+0x2a4/0x2d0)
[   65.047635] [<c0189880>] (ubifs_read_node+0x2a4/0x2d0) from
[<c01a8d60>] (ubifs_tnc_read_node+0x4c/0x1dc)
[   65.047650] [<c01a8d60>] (ubifs_tnc_read_node+0x4c/0x1dc) from
[<c018af5c>] (tnc_read_node_nm+0xb4/0x1b4)
[   65.047666] [<c018af5c>] (tnc_read_node_nm+0xb4/0x1b4) from
[<c018e6e0>] (ubifs_tnc_next_ent+0x1ec/0x244)
[   65.047681] [<c018e6e0>] (ubifs_tnc_next_ent+0x1ec/0x244) from
[<c018e7c8>] (ubifs_tnc_remove_ino+0x90/0x1dc)
[   65.047698] [<c018e7c8>] (ubifs_tnc_remove_ino+0x90/0x1dc) from
[<c0191bdc>] (ubifs_replay_journal+0x1164/0x173c)
[   65.047713] [<c0191bdc>] (ubifs_replay_journal+0x1164/0x173c) from
[<c0184c04>] (ubifs_mount+0x1158/0x1eac)
[   65.047733] [<c0184c04>] (ubifs_mount+0x1158/0x1eac) from
[<c00b44ec>] (mount_fs+0x10/0xb4)
[   65.047750] [<c00b44ec>] (mount_fs+0x10/0xb4) from [<c00cb4a0>]
(vfs_kern_mount+0x4c/0xc0)
[   65.047764] [<c00cb4a0>] (vfs_kern_mount+0x4c/0xc0) from
[<c00cd468>] (do_mount+0x6e0/0x800)
[   65.047778] [<c00cd468>] (do_mount+0x6e0/0x800) from [<c00cd60c>]
(SyS_mount+0x84/0xb8)
[   65.047794] [<c00cd60c>] (SyS_mount+0x84/0xb8) from [<c000f1c0>]
(ret_fast_syscall+0x0/0x30)
[   65.048019] UBIFS: background thread "ubifs_bgt0_16" stops


----debug patch test ok----


diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index f755a24..eba555e 100755
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -900,6 +900,9 @@ int ubifs_jnl_delete_inode(struct ubifs_info *c,
const struct inode *inode)
        else
                ubifs_delete_orphan(c, inode->i_ino);
        up_read(&c->commit_sem);
+
+       ubifs_run_commit(c);
+
        return err;
}
