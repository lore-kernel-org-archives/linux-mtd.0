Return-Path: <SRS0=oK52=XY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C76BC352A9
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2019 14:05:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 218902082F
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2019 14:05:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xan9hjqz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 218902082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WmKPS62dRVYD9ItrWP/LgY2GdNUPyL+R0urehGcr40c=; b=Xan9hjqzWFsZHh
	OQc39qOIAZ8g2Zwk4/bNYD2N1nEsZ5cp6W/qeTiAniaxpSvOwyoF89p48YO0gnLQ6ORbwDiJHUyA1
	uhJllVUEdmxl1sypWB4XS+eWwmr/iTUoO4cZUj/1M3h/rydGspCHU/UjsBgz/0CU3dnQROF+b5W+5
	x9zO7gDwfU018NmMxXnmykJNb4trH0oiGj/RhJexxmJwlYFqjbTDQlSNebdRjOQ5vMFQODB0wby2J
	kcAaUvJjj2lWtuMS/zrVxfb7l7t1aQoJHB8DCXv8KUFXqiOCi9MRzKVj4SoGSeIZzTB3AaCU1hvGG
	oyo433E6WrlG9poP55rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEZpB-0000Ru-6U; Sun, 29 Sep 2019 14:05:21 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEZp7-0007pT-Q7
 for linux-mtd@lists.infradead.org; Sun, 29 Sep 2019 14:05:20 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 252308CB7E2E487017D2;
 Sun, 29 Sep 2019 22:05:08 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Sun, 29 Sep 2019
 22:05:03 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Richard
 Weinberger" <richard@nod.at>, Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [PATCH] mtd: blkdevs: protect tr->devs list by mtd_table_mutex
Date: Sun, 29 Sep 2019 22:11:57 +0800
Message-ID: <20190929141157.115845-1-houtao1@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190929_070518_813792_5FA7DD9F 
X-CRM114-Status: GOOD (  13.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There may be list corruption if there are concurrent list traversal
and list deletion on tr->devs as showed in the following case:

CPU 0                               CPU 1

open /dev/mtdblock1

// remove mtd1
blktrans_notify_remove()
    del_mtd_blktrans_dev()

close /dev/mtdblock1
  blktrans_release
    blktrans_dev_put
      acquire blktrans_ref_mutex     // remove mtd0
      // the final release           acquire mtd_table_mutex
      blktrans_dev_release()         blktrans_notify_remove()
        // remove mtdblock1            // next is mtdblock1
        list_del(&dev->list)           list_for_each_entry_safe()

We could fix the problem by acquiring blktrans_ref_mutex during
the traversal of tr->devs, but blktrans_ref_mutex needs to be released
before invoking tr->remote_dev(), so we also need to increase the kref
of current device else the device may be freed and decrease the kref
after the removal.

Or we could move the list deletion to del_mtd_blktrans_dev(), and protect
the operations on tr->devs by mtd_table_mutex which has already be taken.

The latter fix is simpler. We also can remove the unnecessary acquisitions
of blktrans_ref_mutex in add_mtd_blktrans_dev() because operations on
tr->devs have already been protected by mtd_table_mutex.

Fixes: 048d87199566 ("mtd: blktrans: Hotplug fixes")
Signed-off-by: Hou Tao <houtao1@huawei.com>
---
I found the problem by code review, and could not find a way to
ensure the problem, because the removal of mtd devices almost
comes from the removal of modules, and the open of /dev/mtdblockX
will prevent the module from removing.
---
 drivers/mtd/mtd_blkdevs.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 0c05f77f9b21..e04260237a25 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -35,7 +35,6 @@ static void blktrans_dev_release(struct kref *kref)
 	blk_mq_free_tag_set(dev->tag_set);
 	kfree(dev->tag_set);
 	put_disk(dev->disk);
-	list_del(&dev->list);
 	kfree(dev);
 }
 
@@ -350,7 +349,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 		BUG();
 	}
 
-	mutex_lock(&blktrans_ref_mutex);
 	list_for_each_entry(d, &tr->devs, list) {
 		if (new->devnum == -1) {
 			/* Use first free number */
@@ -362,7 +360,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 			}
 		} else if (d->devnum == new->devnum) {
 			/* Required number taken */
-			mutex_unlock(&blktrans_ref_mutex);
 			return -EBUSY;
 		} else if (d->devnum > new->devnum) {
 			/* Required number was free */
@@ -381,14 +378,12 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	 * with this number. */
 	if (new->devnum > (MINORMASK >> tr->part_bits) ||
 	    (tr->part_bits && new->devnum >= 27 * 26)) {
-		mutex_unlock(&blktrans_ref_mutex);
 		goto error1;
 	}
 
 	list_add_tail(&new->list, &tr->devs);
- added:
-	mutex_unlock(&blktrans_ref_mutex);
 
+ added:
 	mutex_init(&new->lock);
 	kref_init(&new->ref);
 	if (!tr->writesect)
@@ -484,6 +479,8 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 		BUG();
 	}
 
+	list_del(&old->list);
+
 	if (old->disk_attributes)
 		sysfs_remove_group(&disk_to_dev(old->disk)->kobj,
 						old->disk_attributes);
-- 
2.22.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
