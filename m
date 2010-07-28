Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oe8xr-0000AW-J4
	for linux-mtd@lists.infradead.org; Wed, 28 Jul 2010 15:54:40 +0000
Received: by bwz15 with SMTP id 15so5031758bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Jul 2010 08:54:38 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] MTD: blkdevs: fix crash related to sysfs attributes.
Date: Wed, 28 Jul 2010 18:53:16 +0300
Message-Id: <1280332397-6031-2-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1280332397-6031-1-git-send-email-maximlevitsky@gmail.com>
References: <1280332397-6031-1-git-send-email-maximlevitsky@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the attributes group before disk to avoid use after free

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 03e19c1..75aba70 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -409,13 +409,14 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 		BUG();
 	}
 
-	/* Stop new requests to arrive */
-	del_gendisk(old->disk);
-
 	if (old->disk_attributes)
 		sysfs_remove_group(&disk_to_dev(old->disk)->kobj,
 						old->disk_attributes);
 
+	/* Stop new requests to arrive */
+	del_gendisk(old->disk);
+
+
 	/* Stop the thread */
 	kthread_stop(old->thread);
 
-- 
1.7.0.4
