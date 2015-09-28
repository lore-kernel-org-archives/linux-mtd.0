Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgVOh-0005Gm-Bk
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 10:11:06 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: return ENOSPC if no enough space available
Date: Mon, 28 Sep 2015 17:57:19 +0000
Message-ID: <1443463039-8346-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBI: attaching mtd1 to ubi0
UBI: scanning is finished
UBI error: init_volumes: not enough PEBs, required 706, available 686
UBI error: ubi_wl_init: no enough physical eraseblocks (-20, need 1)
UBI error: ubi_attach_mtd_dev: failed to attach mtd1, error -12 <= NOT ENOMEM
UBI error: ubi_init: cannot attach mtd1

If available PEBs are not enough when initializing volumes, return -ENOSPC
directly. If available PEBs are not enough when initializing WL, return
-ENOSPC instead of -ENOMEM.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 drivers/mtd/ubi/vtbl.c | 1 +
 drivers/mtd/ubi/wl.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 80bdd5b..d85c197 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -649,6 +649,7 @@ static int init_volumes(struct ubi_device *ubi,
 		if (ubi->corr_peb_count)
 			ubi_err(ubi, "%d PEBs are corrupted and not used",
 				ubi->corr_peb_count);
+		return -ENOSPC;
 	}
 	ubi->rsvd_pebs += reserved_pebs;
 	ubi->avail_pebs -= reserved_pebs;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 275d9fb..eb4489f9 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1601,6 +1601,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		if (ubi->corr_peb_count)
 			ubi_err(ubi, "%d PEBs are corrupted and not used",
 				ubi->corr_peb_count);
+		err = -ENOSPC;
 		goto out_free;
 	}
 	ubi->avail_pebs -= reserved_pebs;
-- 
1.9.1
