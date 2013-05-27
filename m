Received: from moutng.kundenserver.de ([212.227.17.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UgsRC-0000Rg-20
 for linux-mtd@lists.infradead.org; Mon, 27 May 2013 08:05:50 +0000
From: Thomas Weber <thomas@tomweber.eu>
To: 
Subject: [PATCH] UBI: Fastmap: Fix memory leak
Date: Mon, 27 May 2013 10:02:24 +0200
Message-Id: <1369641744-13534-1-git-send-email-thomas@tomweber.eu>
In-Reply-To: <CAFLxGvw5gj-dfQeMKQVJpHPAXi4ZeNTaG3u3yXOAkshJRavXVA@mail.gmail.com>
References: <CAFLxGvw5gj-dfQeMKQVJpHPAXi4ZeNTaG3u3yXOAkshJRavXVA@mail.gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 wang bo <wang.bo116@zte.com.cn>, David Woodhouse <dwmw2@infradead.org>,
 Thomas Weber <thomas@tomweber.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: wang bo <wang.bo116@zte.com.cn>

[fix whitespace errors]

Tested with linux-v3.10-rc3 on Devkit8000.
Signed-off-by: Thomas Weber <thomas@tomweber.eu>

The discussion about this patch can be found:
https://lkml.org/lkml/2013/5/2/118

This patches fixes the following bug for me:
When CONFIG_DEBUG_VM is active and making
ubiattach ... ; ubidetach...; ubiattach ...
the second ubiattach stops with:

[   37.918304] UBI: default fastmap pool size: 95
[   37.923004] UBI: default fastmap WL pool size: 25
[   37.928741] UBI: attaching mtd4 to ubi0
[   37.933197] kmem_cache_sanity_check (ubi_aeb_slab_cache): Cache name already exists.
[   37.941864] CPU: 0 PID: 757 Comm: ubiattach Not tainted 3.10.0-rc3 #66
[   37.949066] [<c0013d90>] (unwind_backtrace+0x0/0xec) from [<c0011660>] (show_stack+0x20/0x24)
[   37.958343] [<c0011660>] (show_stack+0x20/0x24) from [<c041527c>] (dump_stack+0x20/0x28)
[   37.967163] [<c041527c>] (dump_stack+0x20/0x28) from [<c00d70b4>] (kmem_cache_create_memcg+0x120/0x2a4)
[   37.977478] [<c00d70b4>] (kmem_cache_create_memcg+0x120/0x2a4) from [<c00d7280>] (kmem_cache_create+0x48/0x50)
[   37.988281] [<c00d7280>] (kmem_cache_create+0x48/0x50) from [<c02fa090>] (alloc_ai+0x84/0xb0)
[   37.997528] [<c02fa090>] (alloc_ai+0x84/0xb0) from [<c02fbde4>] (ubi_attach+0x28/0x34c)
[   38.006225] [<c02fbde4>] (ubi_attach+0x28/0x34c) from [<c02f07c8>] (ubi_attach_mtd_dev+0x69c/0xca4)
[   38.016021] [<c02f07c8>] (ubi_attach_mtd_dev+0x69c/0xca4) from [<c02f1078>] (ctrl_cdev_ioctl+0xe4/0x190)
[   38.026275] [<c02f1078>] (ctrl_cdev_ioctl+0xe4/0x190) from [<c00fee00>] (do_vfs_ioctl+0x554/0x5c4)
[   38.035980] [<c00fee00>] (do_vfs_ioctl+0x554/0x5c4) from [<c00feebc>] (SyS_ioctl+0x4c/0x6c)
[   38.045043] [<c00feebc>] (SyS_ioctl+0x4c/0x6c) from [<c000dca0>] (ret_fast_syscall+0x0/0x48)
[   38.054168] UBI error: ubi_attach_mtd_dev: failed to attach mtd4, error -12
ubiattach: error!: cannot attach "/dev/mtd4"
           error 12 (Cannot allocate memory)
---
 drivers/mtd/ubi/attach.c  | 58 +++++++++++++++++++++++++++--------------------
 drivers/mtd/ubi/fastmap.c | 13 -----------
 2 files changed, 33 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index c071d41..e9f64bc 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1212,6 +1212,30 @@ static void destroy_ai(struct ubi_attach_info *ai)
 	kfree(ai);
 }
 
+static struct ubi_attach_info *alloc_ai(const char *slab_name)
+{
+	struct ubi_attach_info *ai;
+
+	ai = kzalloc(sizeof(struct ubi_attach_info), GFP_KERNEL);
+	if (!ai)
+		return ai;
+
+	INIT_LIST_HEAD(&ai->corr);
+	INIT_LIST_HEAD(&ai->free);
+	INIT_LIST_HEAD(&ai->erase);
+	INIT_LIST_HEAD(&ai->alien);
+	ai->volumes = RB_ROOT;
+	ai->aeb_slab_cache = kmem_cache_create(slab_name,
+					       sizeof(struct ubi_ainf_peb),
+					       0, 0, NULL);
+	if (!ai->aeb_slab_cache) {
+		kfree(ai);
+		ai = NULL;
+	}
+
+	return ai;
+}
+
 /**
  * scan_all - scan entire MTD device.
  * @ubi: UBI device description object
@@ -1315,8 +1339,13 @@ static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	int err, pnum, fm_anchor = -1;
 	unsigned long long max_sqnum = 0;
 
+	struct ubi_attach_info *fm_temp_ai = NULL;
 	err = -ENOMEM;
 
+	fm_temp_ai = alloc_ai("ubi_scan_fastmap_slab_cache");
+	if (!fm_temp_ai)
+		goto out;
+
 	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 	if (!ech)
 		goto out;
@@ -1331,7 +1360,7 @@ static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		cond_resched();
 
 		dbg_gen("process PEB %d", pnum);
-		err = scan_peb(ubi, ai, pnum, &vol_id, &sqnum);
+		err = scan_peb(ubi, fm_temp_ai, pnum, &vol_id, &sqnum);
 		if (err < 0)
 			goto out_vidh;
 
@@ -1343,6 +1372,7 @@ static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info *ai)
 
 	ubi_free_vid_hdr(ubi, vidh);
 	kfree(ech);
+	destroy_ai(fm_temp_ai);
 
 	if (fm_anchor < 0)
 		return UBI_NO_FASTMAP;
@@ -1351,6 +1381,7 @@ static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info *ai)
 
 out_vidh:
 	ubi_free_vid_hdr(ubi, vidh);
+	destroy_ai(fm_temp_ai);
 out_ech:
 	kfree(ech);
 out:
@@ -1359,29 +1390,6 @@ out:
 
 #endif
 
-static struct ubi_attach_info *alloc_ai(const char *slab_name)
-{
-	struct ubi_attach_info *ai;
-
-	ai = kzalloc(sizeof(struct ubi_attach_info), GFP_KERNEL);
-	if (!ai)
-		return ai;
-
-	INIT_LIST_HEAD(&ai->corr);
-	INIT_LIST_HEAD(&ai->free);
-	INIT_LIST_HEAD(&ai->erase);
-	INIT_LIST_HEAD(&ai->alien);
-	ai->volumes = RB_ROOT;
-	ai->aeb_slab_cache = kmem_cache_create(slab_name,
-					       sizeof(struct ubi_ainf_peb),
-					       0, 0, NULL);
-	if (!ai->aeb_slab_cache) {
-		kfree(ai);
-		ai = NULL;
-	}
-
-	return ai;
-}
 
 /**
  * ubi_attach - attach an MTD device.
@@ -1419,7 +1427,7 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 					return -ENOMEM;
 			}
 
-			err = scan_all(ubi, ai, UBI_FM_MAX_START);
+			err = scan_all(ubi, ai, 0);
 		}
 	}
 #else
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 0648c69..7b73d23 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -552,21 +552,8 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	INIT_LIST_HEAD(&used);
 	INIT_LIST_HEAD(&free);
 	INIT_LIST_HEAD(&eba_orphans);
-	INIT_LIST_HEAD(&ai->corr);
-	INIT_LIST_HEAD(&ai->free);
-	INIT_LIST_HEAD(&ai->erase);
-	INIT_LIST_HEAD(&ai->alien);
-	ai->volumes = RB_ROOT;
 	ai->min_ec = UBI_MAX_ERASECOUNTER;
 
-	ai->aeb_slab_cache = kmem_cache_create("ubi_ainf_peb_slab",
-					       sizeof(struct ubi_ainf_peb),
-					       0, 0, NULL);
-	if (!ai->aeb_slab_cache) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
 	fmsb = (struct ubi_fm_sb *)(fm_raw);
 	ai->max_sqnum = fmsb->sqnum;
 	fm_pos += sizeof(struct ubi_fm_sb);
-- 
1.8.2.3
