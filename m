Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166AFE77180
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Dec 2024 11:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wlkbk5uRwoh1AMns64qVx2s3x6jXiqfZwfH5cKXQBqg=; b=mF5rtmJm71yxf9
	P8bTN/+lf835o9Jwtvfh/Qfrc6WZpItu1ZzFOHqNqMRIL5VzRxrHTVct23ILCjKWns7uIwT4aWdtG
	O104oNxFxuUDEZIm7utjddVp/Ehm48zqChuP6/NZhhTFfBuw6Di3evAt0YojrEvuWItkBE4qAN3Fb
	9rI79QvJh55kbZpnRHFSQJqkmQy5TkZ5KZVPoxsPbtPiEC6XQIBA/hquiXjochOREzjyonE1bbIJu
	jp8gT1lvD/8/QKKBzmqQVAi5oKwasVoM5xbHIerlNFjIjlN43NUCIOCg+XQ6/oHlfCinzMBG4/Xah
	ros6PHLFY6iXqjjGn5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMPxH-00000006DsA-47qI;
	Sat, 14 Dec 2024 11:05:03 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMPxF-00000006Dqf-0StO
	for linux-mtd@lists.infradead.org;
	Sat, 14 Dec 2024 11:05:03 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Y9NZn5Cb5z2DhMh;
	Sat, 14 Dec 2024 19:02:25 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D2EF1401DC;
	Sat, 14 Dec 2024 19:04:55 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 14 Dec
 2024 19:04:54 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <dennis.lamerice@gmail.com>, <vigneshr@ti.com>,
	<marten.lindahl@axis.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH] ubi: Revert "ubi: wl: Close down wear-leveling before nand is suspended"
Date: Sat, 14 Dec 2024 19:01:53 +0800
Message-ID: <20241214110153.684919-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_030501_499063_1A3B29A6 
X-CRM114-Status: GOOD (  11.54  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit 5580cdae05ae ("ubi: wl: Close down wear-leveling before nand is
suspended") added a reboot notification in UBI layer to shutdown the
wear-leveling subsystem, which imported an UAF problem[1]. Besides that,
the method also brings other potential UAF problems, for example:
       reboot             kworker
 ubi_wl_reboot_notifier
  ubi_wl_close
   ubi_fastmap_close
    kfree(ubi->fm)
                     update_fastmap_work_fn
		      ubi_update_fastmap
		       old_fm = ubi->fm
		       if (old_fm && old_fm->e[i]) // UAF!

Actually, the problem fixed by commit 5580cdae05ae ("ubi: wl: Close down
wear-leveling before nand is suspended") has been solved by commit
8cba323437a4 ("mtd: rawnand: protect access to rawnand devices while in
suspend"), which was discussed in [2]. So we can revert the commit
5580cdae05ae ("ubi: wl: Close down wear-leveling before nand is
suspended") directly.

[1] https://lore.kernel.org/linux-mtd/20241208175211.9406-2-dennis.lamerice@gmail.com/
[2] https://lore.kernel.org/all/9bf76f5d-12a4-46ff-90d4-4a7f0f47c381@axis.com/

Fixes: 5580cdae05ae ("ubi: wl: Close down wear-leveling before nand is suspended")
Reported-by: Dennis Lam <dennis.lamerice@gmail.com>
Closes: https://lore.kernel.org/linux-mtd/20241208175211.9406-2-dennis.lamerice@gmail.com/
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/ubi.h |  2 --
 drivers/mtd/ubi/wl.c  | 21 ---------------------
 2 files changed, 23 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 26cc53ad34ec..c792b9bcab9b 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -549,7 +549,6 @@ struct ubi_debug_info {
  * @peb_buf: a buffer of PEB size used for different purposes
  * @buf_mutex: protects @peb_buf
  * @ckvol_mutex: serializes static volume checking when opening
- * @wl_reboot_notifier: close all wear-leveling work before reboot
  *
  * @dbg: debugging information for this UBI device
  */
@@ -652,7 +651,6 @@ struct ubi_device {
 	void *peb_buf;
 	struct mutex buf_mutex;
 	struct mutex ckvol_mutex;
-	struct notifier_block wl_reboot_notifier;
 
 	struct ubi_debug_info dbg;
 };
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 4f6f339d8fb8..fbd399cf6503 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -89,7 +89,6 @@
 #include <linux/crc32.h>
 #include <linux/freezer.h>
 #include <linux/kthread.h>
-#include <linux/reboot.h>
 #include "ubi.h"
 #include "wl.h"
 
@@ -128,8 +127,6 @@ static int self_check_in_wl_tree(const struct ubi_device *ubi,
 				 struct ubi_wl_entry *e, struct rb_root *root);
 static int self_check_in_pq(const struct ubi_device *ubi,
 			    struct ubi_wl_entry *e);
-static int ubi_wl_reboot_notifier(struct notifier_block *n,
-				  unsigned long state, void *cmd);
 
 /**
  * wl_tree_add - add a wear-leveling entry to a WL RB-tree.
@@ -1953,13 +1950,6 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	if (!ubi->ro_mode && !ubi->fm_disabled)
 		ubi_ensure_anchor_pebs(ubi);
 #endif
-
-	if (!ubi->wl_reboot_notifier.notifier_call) {
-		ubi->wl_reboot_notifier.notifier_call = ubi_wl_reboot_notifier;
-		ubi->wl_reboot_notifier.priority = 1; /* Higher than MTD */
-		register_reboot_notifier(&ubi->wl_reboot_notifier);
-	}
-
 	return 0;
 
 out_free:
@@ -2005,17 +1995,6 @@ void ubi_wl_close(struct ubi_device *ubi)
 	kfree(ubi->lookuptbl);
 }
 
-static int ubi_wl_reboot_notifier(struct notifier_block *n,
-				  unsigned long state, void *cmd)
-{
-	struct ubi_device *ubi;
-
-	ubi = container_of(n, struct ubi_device, wl_reboot_notifier);
-	ubi_wl_close(ubi);
-
-	return NOTIFY_DONE;
-}
-
 /**
  * self_check_ec - make sure that the erase counter of a PEB is correct.
  * @ubi: UBI device description object
-- 
2.46.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
