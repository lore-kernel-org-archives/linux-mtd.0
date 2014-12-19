Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y23DD-00015B-SO
 for linux-mtd@lists.infradead.org; Fri, 19 Dec 2014 19:27:44 +0000
Received: by mail-ie0-f180.google.com with SMTP id rp18so1325306iec.39
 for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2014 11:27:22 -0800 (PST)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: ezequiel@vanguardiasur.com.ar, richard.weinberger@gmail.com,
 gwendal@chromium.org, linux-mtd@lists.infradead.org
Subject: [PATCH v5] UBI: block: Continue creating ubiblocks after an
 initialization error
Date: Fri, 19 Dec 2014 11:27:18 -0800
Message-Id: <1419017238-28809-1-git-send-email-dehrenberg@chromium.org>
Cc: grundler@chromium.org, Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If one ubi volume is corrupted but another is not, it should be
possible to initialize that ubiblock from a kernel commandline which
includes both of them. This patch changes the error handling behavior
in initializing ubiblock to ensure that all parameters are attempted
even if one fails. If there is a failure, it is logged on dmesg.
It also makes error messages more descriptive by including the
name of the UBI volume that failed.

Tested: Formatted ubi volume /dev/ubi5_0 in a corrupt way and
dev/ubi3_0 properly and included "ubi.block=5,0 ubi.block=3,0" on
the kernel command line. At boot, I see the following in the console:
[   21.082420] UBI error: ubiblock_create_from_param: block: can't open volume on ubi5_0, err=-19
[   21.084268] UBI: ubiblock3_0 created from ubi3:0(rootfs)

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
Changes in v5:
- Rebased on current UBI sources and changed ubi_err to pr_err
Changes in v4:
- Removed Change-Id line
Changes in v3:
- Tried to fix the wraparound in sending the email
- Moved the 'changes' section to below the ---
Changes in v2:
- Added comments in the code explaning the intent of the error
  handling strategy.
- Fixed the code surrounding ubiblock initialization to not
  shut down the block devices after starting them up. In my
  test case, the initialization happened to not get called
  because the return value happened to be overwritten by the
  second successful case, but if the cases were reversed it
  would be removed. In the new code, ubiblock_create_from_param
  is simply a void function because no caller cares if one of
  the blocks failed to initialize.

 drivers/mtd/ubi/block.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 6b6bce2..c7449f6 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -583,22 +583,28 @@ open_volume_desc(const char *name, int ubi_num, int vol_id)
 		return ubi_open_volume(ubi_num, vol_id, UBI_READONLY);
 }
 
-static int __init ubiblock_create_from_param(void)
+static void __init ubiblock_create_from_param(void)
 {
-	int i, ret;
+	int i, ret = 0;
 	struct ubiblock_param *p;
 	struct ubi_volume_desc *desc;
 	struct ubi_volume_info vi;
 
+	/*
+	 * If there is an error creating one of the ubiblocks, continue on to
+	 * create the following ubiblocks. This helps in a circumstance where
+	 * the kernel command-line specifies multiple block devices and some
+	 * may be broken, but we still want the working ones to come up.
+	 */
 	for (i = 0; i < ubiblock_devs; i++) {
 		p = &ubiblock_param[i];
 
 		desc = open_volume_desc(p->name, p->ubi_num, p->vol_id);
 		if (IS_ERR(desc)) {
-			pr_err("UBI: block: can't open volume, err=%ld\n",
-			       PTR_ERR(desc));
-			ret = PTR_ERR(desc);
-			break;
+			pr_err(
+			       "UBI: block: can't open volume on ubi%d_%d, err=%ld",
+			       p->ubi_num, p->vol_id, PTR_ERR(desc));
+			continue;
 		}
 
 		ubi_get_volume_info(desc, &vi);
@@ -606,12 +612,12 @@ static int __init ubiblock_create_from_param(void)
 
 		ret = ubiblock_create(&vi);
 		if (ret) {
-			pr_err("UBI: block: can't add '%s' volume, err=%d\n",
-			       vi.name, ret);
-			break;
+			pr_err(
+			       "UBI: block: can't add '%s' volume on ubi%d_%d, err=%d",
+			       vi.name, p->ubi_num, p->vol_id, ret);
+			continue;
 		}
 	}
-	return ret;
 }
 
 static void ubiblock_remove_all(void)
@@ -639,10 +645,12 @@ int __init ubiblock_init(void)
 	if (ubiblock_major < 0)
 		return ubiblock_major;
 
-	/* Attach block devices from 'block=' module param */
-	ret = ubiblock_create_from_param();
-	if (ret)
-		goto err_remove;
+	/*
+	 * Attach block devices from 'block=' module param.
+	 * Even if one block device in the param list fails to come up,
+	 * still allow the module to load and leave any others up.
+	 */
+	ubiblock_create_from_param();
 
 	/*
 	 * Block devices are only created upon user requests, so we ignore
@@ -655,7 +663,6 @@ int __init ubiblock_init(void)
 
 err_unreg:
 	unregister_blkdev(ubiblock_major, "ubiblock");
-err_remove:
 	ubiblock_remove_all();
 	return ret;
 }
-- 
2.2.0.rc0.207.ga3a616c
