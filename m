Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D399AC0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 15:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qpLpEInNzRvP9wO+hdmGqot7HpPI6tpAlAqyOZ5uAg8=; b=5FdckvpawP3cN1
	9vKsTacZoKTwKanzsz5TLSY1YgJszWh8Nnq0r26fOk+6VAaXHyP748xAIxRrMBkxh7qdnWvt4vvP2
	ZVNHrsyJAlyhVoMGrjqzwUfMSlET4FK76cdSTfEKUgFCRP3jB0qTEF1YSYJsNWKyfATsUryKFZgv8
	eanJe5lY/fsHTdtFIIk8FtPZKZXzOm3WYZpPEVaGRYYB6VEj+T3atK0TnXT7Begae63vkyGGK4HcN
	iXwfk2RObY9HQN6NUKtGYuhGGp6rfoI4rWTBxte2dSFUXlqv2WNynXMt0X+2PQZRkOZe2SldrkPs0
	z2jHKe19IlgsI31T2PVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2cW-00Ffdq-1z;
	Thu, 27 Jul 2023 15:09:40 +0000
Received: from [134.134.136.126] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2cS-00FfaJ-2N
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 15:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690470576; x=1722006576;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cZOumbvz7d5c3xoly7L/DH5QKt5aCye/K29l+UqNRao=;
  b=OapRWINrDR5OwVGdIhh33Smf4PycsAI/1224qfcCHHJFQzuHMNGINDMU
   pMv4O282qqM5OVNRWzNDYvnbgWurbpOaOPds+H4D6bo51t5VxHzMlowr4
   tpVml5ln1XV307wSeSUnV1AzhRruEy4+WdikPnDtxPxSDQiWlbV7uy6Mw
   LecviQkSEMX7PjVfQA0ib6iUfAaZp5mVzlv2kScuWW36EJHnTu1NPmIux
   RBusQ77dt/hViGHdZ2HdSMbwe2z2gr+rhi0pKkpK71YH+Qn8o251Azhb2
   bXPV5m0GQLEok29TvlQSe7GcY49FFScrIkxTeW0rsDTufRMnn6LyrxIvI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353246760"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="353246760"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 08:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="792404744"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="792404744"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 08:01:39 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tomas Winkler <tomas.winkler@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Vitaly Lubart <vitaly.lubart@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: [PATCH] mtd: fix use-after-free in mtd release
Date: Thu, 27 Jul 2023 17:57:58 +0300
Message-Id: <20230727145758.3880967-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_080936_879754_F6511458 
X-CRM114-Status: GOOD (  13.10  )
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

I case of partition device_unregister in mtd_device_release
calls mtd_release which frees mtd_info structure for partition.
All code after device_unregister in mtd_device_release thus
works already freed memory.

Move part of code to mtd_release and restict mtd->dev cleanup
to non-partion object.
For partition object such cleanup have no sense as partition
mtd_info is removed.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Fixes: 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
Reviewed-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/mtdcore.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2466ea466466..46f15f676491 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -93,6 +93,9 @@ static void mtd_release(struct device *dev)
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	dev_t index = MTD_DEVT(mtd->index);
 
+	idr_remove(&mtd_idr, mtd->index);
+	of_node_put(mtd_get_of_node(mtd));
+
 	if (mtd_is_partition(mtd))
 		release_mtd_partition(mtd);
 
@@ -103,6 +106,7 @@ static void mtd_release(struct device *dev)
 static void mtd_device_release(struct kref *kref)
 {
 	struct mtd_info *mtd = container_of(kref, struct mtd_info, refcnt);
+	bool is_partition = mtd_is_partition(mtd);
 
 	debugfs_remove_recursive(mtd->dbg.dfs_dir);
 
@@ -111,11 +115,13 @@ static void mtd_device_release(struct kref *kref)
 
 	device_unregister(&mtd->dev);
 
-	/* Clear dev so mtd can be safely re-registered later if desired */
-	memset(&mtd->dev, 0, sizeof(mtd->dev));
-
-	idr_remove(&mtd_idr, mtd->index);
-	of_node_put(mtd_get_of_node(mtd));
+	/*
+	 *  Clear dev so mtd can be safely re-registered later if desired.
+	 *  Should not be done for partition,
+	 *  as it was already destroyed in device_unregister().
+	 */
+	if (!is_partition)
+		memset(&mtd->dev, 0, sizeof(mtd->dev));
 
 	module_put(THIS_MODULE);
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
