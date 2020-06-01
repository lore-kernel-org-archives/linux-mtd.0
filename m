Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0A8C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 09:12:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5490C207ED
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 09:12:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KppuR6va"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5490C207ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pNso6sY5AN++pK6HECooUDmGH6V/ONtt4Im+J1l+OuI=; b=KppuR6vazsy8OG
	aN3rWEth6IQpwyTiK+OGmZh0rHxSgxxjv1oEMWx97uTaMO3FUdGnGuljDmI6EbeqZ4Yfj7cBxKZ0n
	QQUROeUX0HAuizbGOYvJFvl3jmyuy91xx7cv4a9llQOLn67g+V3ZK88VM5YOig+GogXHjvgpHlQ3Y
	ItQ0ILe3bju0xn1x6D7cpDEdR+sKoDRAeVQIvQnuKny8rXokljbgDul2p3r+aTip6phxEC6gA82Mj
	vjgm9ldZLHzhnOwLA/dXYvZMB1taFuF8eUQ0XuFdqrK3Du0WzX/98OxNdaV1BUsQGwbokaHf8E9qD
	oULYJgsGdvw7CSxQpSdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfgUM-0003Xb-5w; Mon, 01 Jun 2020 09:12:10 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfgUJ-0003Wj-2o
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 09:12:08 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id ADBEF49AA1705597C5FD;
 Mon,  1 Jun 2020 17:12:05 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Mon, 1 Jun 2020
 17:11:54 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] ubi: fastmap: Don't produce the initial anchor PEB when
 fastmap is disabled
Date: Mon, 1 Jun 2020 17:11:34 +0800
Message-ID: <20200601091134.3794265-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_021207_296579_A5AC2371 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, s.hauer@pengutronix.de, yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Following process triggers a memleak caused by forgetting to release the
initial anchor PEB (CONFIG_MTD_UBI_FASTMAP is disabled):
1. attach -> __erase_worker -> produce the initial anchor PEB
2. detach -> ubi_fastmap_close (Do nothing, it should have released the
   initial anchor PEB)

Don't produce the initial anchor PEB in __erase_worker() when fastmap
is disabled.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Fixes: f9c34bb529975fe ("ubi: Fix producing anchor PEBs")
Reported-by: syzbot+d9aab50b1154e3d163f5@syzkaller.appspotmail.com
---
 drivers/mtd/ubi/wl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 5146cce5fe32..5ebe1084a8e7 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1079,13 +1079,19 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 	if (!err) {
 		spin_lock(&ubi->wl_lock);
 
-		if (!ubi->fm_anchor && e->pnum < UBI_FM_MAX_START) {
+#ifdef CONFIG_MTD_UBI_FASTMAP
+		if (!ubi->fm_disabled && !ubi->fm_anchor &&
+		    e->pnum < UBI_FM_MAX_START) {
 			ubi->fm_anchor = e;
 			ubi->fm_do_produce_anchor = 0;
 		} else {
 			wl_tree_add(e, &ubi->free);
 			ubi->free_count++;
 		}
+#else
+		wl_tree_add(e, &ubi->free);
+		ubi->free_count++;
+#endif
 
 		spin_unlock(&ubi->wl_lock);
 
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
