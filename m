Received: from mail-qc0-x230.google.com ([2607:f8b0:400d:c01::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wmg6o-0004MR-PR
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 09:13:19 +0000
Received: by mail-qc0-f176.google.com with SMTP id r5so262072qcx.21
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 02:12:55 -0700 (PDT)
From: Helmut Schaa <helmut.schaa@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: block: Fix error path on alloc_workqueue failure
Date: Tue, 20 May 2014 11:13:48 +0200
Message-Id: <1400577228-7835-1-git-send-email-helmut.schaa@googlemail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Helmut Schaa <helmut.schaa@googlemail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Otherwise we'd return a random value if allocation of the workqueue fails.

Signed-off-by: Helmut Schaa <helmut.schaa@googlemail.com>
---
Just stumbled over that one while playing with UBI block devices.

 drivers/mtd/ubi/block.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 8d659e6..389e5f0 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -432,8 +432,10 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	 * Rembember workqueues are cheap, they're not threads.
 	 */
 	dev->wq = alloc_workqueue("%s", 0, 0, gd->disk_name);
-	if (!dev->wq)
+	if (!dev->wq) {
+		ret = -ENOMEM;
 		goto out_free_queue;
+	}
 	INIT_WORK(&dev->work, ubiblock_do_work);
 
 	mutex_lock(&devices_mutex);
-- 
1.8.4.5
