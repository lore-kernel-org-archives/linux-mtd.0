Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRKUu-0000dC-M9
 for linux-mtd@lists.infradead.org; Tue, 09 Sep 2014 12:26:13 +0000
Received: by mail-wi0-f176.google.com with SMTP id bs8so4331321wib.9
 for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2014 05:25:48 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH] UBI: add missing kmem_cache_free() in process_pool_aeb error
 path
Date: Tue,  9 Sep 2014 14:25:01 +0200
Message-Id: <1410265519-25111-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I ran into this error after a ubiupdatevol, because I forgot to backport
e9110361a9a4 UBI: fix the volumes tree sorting criteria.

UBI error: process_pool_aeb: orphaned volume in fastmap pool
UBI error: ubi_scan_fastmap: Attach by fastmap failed, doing a full scan!
kmem_cache_destroy ubi_ainf_peb_slab: Slab cache still has objects
CPU: 0 PID: 1 Comm: swapper Not tainted 3.14.18-00053-gf05cac8dbf85 #1
[<c000d298>] (unwind_backtrace) from [<c000baa8>] (show_stack+0x10/0x14)
[<c000baa8>] (show_stack) from [<c01b7a68>] (destroy_ai+0x230/0x244)
[<c01b7a68>] (destroy_ai) from [<c01b8fd4>] (ubi_attach+0x98/0x1ec)
[<c01b8fd4>] (ubi_attach) from [<c01ade90>] (ubi_attach_mtd_dev+0x2b8/0x868)
[<c01ade90>] (ubi_attach_mtd_dev) from [<c038b510>] (ubi_init+0x1dc/0x2ac)
[<c038b510>] (ubi_init) from [<c0008860>] (do_one_initcall+0x94/0x140)
[<c0008860>] (do_one_initcall) from [<c037aadc>] (kernel_init_freeable+0xe8/0x1b0)
[<c037aadc>] (kernel_init_freeable) from [<c02730ac>] (kernel_init+0x8/0xe4)
[<c02730ac>] (kernel_init) from [<c00093f0>] (ret_from_fork+0x14/0x24)
UBI: scanning is finished

Freeing the cache in the error path fixes the Slab error.

Tested on at91sam9g35 (3.14.18+fastmap backports)

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Cc: stable <stable@vger.kernel.org> # >= 3.10
---
 drivers/mtd/ubi/fastmap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 0431b46d9fd9..c701369090fb 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -330,6 +330,7 @@ static int process_pool_aeb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		av = tmp_av;
 	else {
 		ubi_err("orphaned volume in fastmap pool!");
+		kmem_cache_free(ai->aeb_slab_cache, new_aeb);
 		return UBI_BAD_FASTMAP;
 	}
 
-- 
2.0.0
