Return-Path: <SRS0=9iyA=2K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98208C43603
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2019 02:08:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B3B9206CB
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2019 02:08:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fASL4VIL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B3B9206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbJOn5TB53SBJI0teNTopm43DaLI4s00x3eRrYtjAIs=; b=fASL4VIL9hY7KQ
	dBNAY2YyREhfVPS1KOL5Za06NjDH9WRt5slXMNPF8RpKqFluWskCMqZU6CpCVXIa0MVy/zXPqYMhV
	TiGFcK2dpMjBVhi4x/VuX/JnyWxnEs+Kcs0HdET/VknZKJDZtPazQ0hvWBdRQ30WMvElzvLKQzdas
	hDc9STxhHQTWJt1JZo5iN0wvNqOEHOkqvBhIGrTa9+SuyyCpsrWEzeVfAKGZlaPTIVhurOVFdSrOd
	7cE0ILyDz1gZ//nzkOTgLpVp5OFpGjY+J8KOXjEkC5aifROjb9AgM5k0IROqYmyH6I2cLgG5UWDm+
	AQPurPHgPfDXR4apVoTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii7hm-0005iY-P7; Fri, 20 Dec 2019 02:07:50 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii7hj-0005hb-T7
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2019 02:07:49 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 504D6C25543792C45FA4;
 Fri, 20 Dec 2019 10:07:37 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Dec 2019
 10:07:28 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <richard@nod.at>, <s.hauer@pengutronix.de>
Subject: [PATCH] UBI: Fastmap: free unused fastmap anchor peb during detach
Date: Fri, 20 Dec 2019 10:14:49 +0800
Message-ID: <20191220021449.120639-1-houtao1@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <0000000000006d0a820599366088@google.com>
References: <0000000000006d0a820599366088@google.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_180748_119724_130259E0 
X-CRM114-Status: GOOD (  10.45  )
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
Cc: houtao1@huawei.com, vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When CONFIG_MTD_UBI_FASTMAP is enabled, fm_anchor will be assigned
a free PEB during ubi_wl_init() or ubi_update_fastmap(). However
if fastmap is not used or disabled on the MTD device, ubi_wl_entry
related with the PEB will not be freed during detach.

So Fix it by freeing the unused fastmap anchor during detach.

And also don't generate the initial fm_anchor when fastmap is disabled.

Fixes: f9c34bb52997 ("ubi: Fix producing anchor PEBs")
Reported-by: syzbot+f317896aae32eb281a58@syzkaller.appspotmail.com
Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 drivers/mtd/ubi/fastmap-wl.c | 15 +++++++++++++--
 drivers/mtd/ubi/wl.c         |  3 ++-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 426820ab9afe..b486250923c5 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -39,6 +39,13 @@ static struct ubi_wl_entry *find_anchor_wl_entry(struct rb_root *root)
 	return victim;
 }
 
+static inline void return_unused_peb(struct ubi_device *ubi,
+				     struct ubi_wl_entry *e)
+{
+	wl_tree_add(e, &ubi->free);
+	ubi->free_count++;
+}
+
 /**
  * return_unused_pool_pebs - returns unused PEB to the free tree.
  * @ubi: UBI device description object
@@ -52,8 +59,7 @@ static void return_unused_pool_pebs(struct ubi_device *ubi,
 
 	for (i = pool->used; i < pool->size; i++) {
 		e = ubi->lookuptbl[pool->pebs[i]];
-		wl_tree_add(e, &ubi->free);
-		ubi->free_count++;
+		return_unused_peb(ubi, e);
 	}
 }
 
@@ -361,6 +367,11 @@ static void ubi_fastmap_close(struct ubi_device *ubi)
 	return_unused_pool_pebs(ubi, &ubi->fm_pool);
 	return_unused_pool_pebs(ubi, &ubi->fm_wl_pool);
 
+	if (ubi->fm_anchor) {
+		return_unused_peb(ubi, ubi->fm_anchor);
+		ubi->fm_anchor = NULL;
+	}
+
 	if (ubi->fm) {
 		for (i = 0; i < ubi->fm->used_blocks; i++)
 			kfree(ubi->fm->e[i]);
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 5d77a38dba54..c6c2b8dc96c7 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1876,7 +1876,8 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		goto out_free;
 
 #ifdef CONFIG_MTD_UBI_FASTMAP
-	ubi_ensure_anchor_pebs(ubi);
+	if (!ubi->fm_disabled)
+		ubi_ensure_anchor_pebs(ubi);
 #endif
 	return 0;
 
-- 
2.22.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
