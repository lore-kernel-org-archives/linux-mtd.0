Received: from mail.hot-smoke.com ([178.17.37.181])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z6wgF-00041y-FW
 for linux-mtd@lists.infradead.org; Mon, 22 Jun 2015 08:02:12 +0000
Received: from Pano100PC (77-95-183-131.ccsleeds.co.uk [77.95.183.131])
 by mail.hot-smoke.com (Hot Smoke Mail Server) with ESMTP id JOX04649
 for <linux-mtd@lists.infradead.org>; Mon, 22 Jun 2015 09:01:49 +0100
From: "David J Myers" <david.myers@amg-panogenics.com>
To: <linux-mtd@lists.infradead.org>
Subject: UBI-FS Master Node failure
Date: Mon, 22 Jun 2015 09:01:48 +0100
Message-ID: <002901d0acc1$b1956d10$14c04730$@myers@amg-panogenics.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Guys,
I have an embedded product running a system based on linux-2.6.29,
originally from the IC supplier, but patched and modified to our spec.
Recently we have had two units go down with the same UBI-FS Master Node
failure, both in LEB-2 at slightly different offsets. The console log looks
like this:-

[    6.645845] UBIFS error (pid 1): ubifs_scan: corrupt empty space at LEB
2:86016
[    6.653268] UBIFS error (pid 1): ubifs_scanned_corruption: corrupted data
at LEB 2:86016
[    6.668163] UBIFS error (pid 1): ubifs_scan: LEB 2 scanning failed
[    6.889661] UBIFS error (pid 1): ubifs_recover_master_node: failed to
recover master node
[    6.898497] List of all partitions:
[    6.902188] 1f00             128 mtdblock0 (driver?)
[    6.907218] 1f01             768 mtdblock1 (driver?)
[    6.912314] 1f02             128 mtdblock2 (driver?)
[    6.917318] 1f03            4096 mtdblock3 (driver?)
[    6.922395] 1f04            4096 mtdblock4 (driver?)
[    6.927397] 1f05           65536 mtdblock5 (driver?)
[    6.932464] 1f06          184320 mtdblock6 (driver?)
[    6.937455] No filesystem could mount root, tried:  ubifs
[    6.942988] Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)

I found two patches to fs/ubifs/recovery.c since 2.6.29 which I applied, but
they did not fix the corrupted flash. These two patches were this one:-

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index f94ddf7..31d09d1 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -299,6 +299,32 @@ int ubifs_recover_master_node(struct ubifs_info *c)
                      goto out_free;
              }
              memcpy(c->rcvrd_mst_node, c->mst_node, UBIFS_MST_NODE_SZ);
+
+              /*
+              * We had to recover the master node, which means there was an
+              * unclean reboot. However, it is possible that the master
node
+              * is clean at this point, i.e., %UBIFS_MST_DIRTY is not set.
+              * E.g., consider the following chain of events:
+              *
+              * 1. UBIFS was cleanly unmounted, so the master node is clean
+              * 2. UBIFS is being mounted R/W and starts changing the
master
+              *    node in the first (%UBIFS_MST_LNUM). A power cut
happens,
+              *    so this LEB ends up with some amount of garbage at the
+              *    end.
+              * 3. UBIFS is being mounted R/O. We reach this place and
+              *    recover the master node from the second LEB
+              *    (%UBIFS_MST_LNUM + 1). But we cannot update the media
+              *    because we are being mounted R/O. We have to defer the
+              *    operation.
+              * 4. However, this master node (@c->mst_node) is marked as
+              *    clean (since the step 1). And if we just return, the
+              *    mount code will be confused and won't recover the master
+              *    node when it is re-mounter R/W later.
+              *
+              *    Thus, to force the recovery by marking the master node
as
+              *    dirty.
+              */
+              c->mst_node->flags |= cpu_to_le32(UBIFS_MST_DIRTY);
       } else {
              /* Write the recovered master node */
              c->max_sqnum = le64_to_cpu(mst->ch.sqnum) - 1;
-- 
1.7.10.2

And this one:-
> diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
> index 5256f42..2c98d77 100644
> --- a/fs/ubifs/recovery.c
> +++ b/fs/ubifs/recovery.c
> @@ -273,7 +273,8 @@ int ubifs_recover_master_node(struct ubifs_info *c)
>                              if (cor1)
>                                     goto out_err;
>                              mst = mst1;
> -                    } else if (offs1 == 0 && offs2 + sz >= c->leb_size) {
> +                    } else if (offs1 == 0 &&
> +                               c->leb_size - offs2 - sz < sz) {
>                              /* 1st LEB was unmapped and written, 2nd not
*/
>                              if (cor1)
>                                     goto out_err;
>

Please advise.
-	J
