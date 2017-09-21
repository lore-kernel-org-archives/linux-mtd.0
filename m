Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dv3uQ-0001X3-Q1
 for linux-mtd@lists.infradead.org; Thu, 21 Sep 2017 16:01:05 +0000
Received: by mail-pg0-x244.google.com with SMTP id j16so3655222pga.2
 for <linux-mtd@lists.infradead.org>; Thu, 21 Sep 2017 09:00:41 -0700 (PDT)
From: Jake Daryll Obina <jake.obina@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 Jake Daryll Obina <jake.obina@gmail.com>
Subject: [PATCH] jffs2: Fix use-after-free bug in jffs2_iget()'s error
 handling path
Date: Fri, 22 Sep 2017 00:00:14 +0800
Message-Id: <1506009614-3277-1-git-send-email-jake.obina@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If jffs2_iget() fails for a newly-allocated inode, jffs2_do_clear_inode()
can get called twice in the error handling path, the first call in
jffs2_iget() itself and the second through iget_failed(). This can result
to a use-after-free error in the second jffs2_do_clear_inode() call, such
as shown by the oops below wherein the second jffs2_do_clear_inode() call
was trying to free node fragments that were already freed in the first
jffs2_do_clear_inode() call.

[   78.178860] jffs2: error: (1904) jffs2_do_read_inode_internal: CRC failed for read_inode of inode 24 at physical location 0x1fc00c
[   78.178914] Unable to handle kernel paging request at virtual address 6b6b6b6b6b6b6b7b
[   78.185871] pgd = ffffffc03a567000
[   78.188794] [6b6b6b6b6b6b6b7b] *pgd=0000000000000000, *pud=0000000000000000
[   78.194968] Internal error: Oops: 96000004 [#1] PREEMPT SMP
...
[   78.513147] PC is at rb_first_postorder+0xc/0x28
[   78.516503] LR is at jffs2_kill_fragtree+0x28/0x90 [jffs2]
[   78.520672] pc : [<ffffff8008323d28>] lr : [<ffffff8000eb1cc8>] pstate: 60000105
[   78.526757] sp : ffffff800cea38f0
[   78.528753] x29: ffffff800cea38f0 x28: ffffffc01f3f8e80
[   78.532754] x27: 0000000000000000 x26: ffffff800cea3c70
[   78.536756] x25: 00000000dc67c8ae x24: ffffffc033d6945d
[   78.540759] x23: ffffffc036811740 x22: ffffff800891a5b8
[   78.544760] x21: 0000000000000000 x20: 0000000000000000
[   78.548762] x19: ffffffc037d48910 x18: ffffff800891a588
[   78.552764] x17: 0000000000000800 x16: 0000000000000c00
[   78.556766] x15: 0000000000000010 x14: 6f2065646f6e695f
[   78.560767] x13: 6461657220726f66 x12: 2064656c69616620
[   78.564769] x11: 435243203a6c616e x10: 7265746e695f6564
[   78.568771] x9 : 6f6e695f64616572 x8 : ffffffc037974038
[   78.572774] x7 : bbbbbbbbbbbbbbbb x6 : 0000000000000008
[   78.576775] x5 : 002f91d85bd44a2f x4 : 0000000000000000
[   78.580777] x3 : 0000000000000000 x2 : 000000403755e000
[   78.584779] x1 : 6b6b6b6b6b6b6b6b x0 : 6b6b6b6b6b6b6b6b
...
[   79.038551] [<ffffff8008323d28>] rb_first_postorder+0xc/0x28
[   79.042962] [<ffffff8000eb5578>] jffs2_do_clear_inode+0x88/0x100 [jffs2]
[   79.048395] [<ffffff8000eb9ddc>] jffs2_evict_inode+0x3c/0x48 [jffs2]
[   79.053443] [<ffffff8008201ca8>] evict+0xb0/0x168
[   79.056835] [<ffffff8008202650>] iput+0x1c0/0x200
[   79.060228] [<ffffff800820408c>] iget_failed+0x30/0x3c
[   79.064097] [<ffffff8000eba0c0>] jffs2_iget+0x2d8/0x360 [jffs2]
[   79.068740] [<ffffff8000eb0a60>] jffs2_lookup+0xe8/0x130 [jffs2]
[   79.073434] [<ffffff80081f1a28>] lookup_slow+0x118/0x190
[   79.077435] [<ffffff80081f4708>] walk_component+0xfc/0x28c
[   79.081610] [<ffffff80081f4dd0>] path_lookupat+0x84/0x108
[   79.085699] [<ffffff80081f5578>] filename_lookup+0x88/0x100
[   79.089960] [<ffffff80081f572c>] user_path_at_empty+0x58/0x6c
[   79.094396] [<ffffff80081ebe14>] vfs_statx+0xa4/0x114
[   79.098138] [<ffffff80081ec44c>] SyS_newfstatat+0x58/0x98
[   79.102227] [<ffffff800808354c>] __sys_trace_return+0x0/0x4
[   79.106489] Code: d65f03c0 f9400001 b40000e1 aa0103e0 (f9400821)

The jffs2_do_clear_inode() call in jffs2_iget() is unnecessary since
iget_failed() will eventually call jffs2_do_clear_inode() if needed, so
just remove it.

Signed-off-by: Jake Daryll Obina <jake.obina@gmail.com>
---
 fs/jffs2/fs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index e96c6b0..3c96f4b 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -362,7 +362,6 @@ struct inode *jffs2_iget(struct super_block *sb, unsigned long ino)
 	ret = -EIO;
 error:
 	mutex_unlock(&f->sem);
-	jffs2_do_clear_inode(c, f);
 	iget_failed(inode);
 	return ERR_PTR(ret);
 }
-- 
2.7.4
