Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26963C001DC
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 12:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r8iC4PV8QrmfqCCv1tNE/m5Nh8nvLKSQTPaInPBkDlU=; b=xKmDmJZ4qZ+CUD
	5pEFobVY4W/NtGHEOGm0FlzBJhG+9KtuB6KIHX+BTKNWW2ghNb2JoyR070xC3EZ4XRMvol5fG6QV2
	i0yW83sLfzyL+X7Ue4D+CHUlp0SrY8OtO21YJFXugNXIvEfF6QVww813WU9LjCcGX+72RS7mMXQPQ
	nQlrEY7bczR4/mjmnsRL3lTAY9lBbqw9PJPr7rnN/cK2ohMKbxasyz7loE7AuGKr96uxxlB9TqHlO
	Aj11ZpwJrDmYD1EQmmMBHLbBMoKEib0Eq3AlgIzA7HkuDc22ubs1Y7jo6qxV89IhZ4wbh402qSWRd
	twl+lY4ZO/RHj6cb9xIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRbW-00FUCx-09;
	Mon, 31 Jul 2023 12:02:26 +0000
Received: from [192.55.52.136] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRbT-00FUBn-00
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 12:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690804942; x=1722340942;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TxVEE+RDmFPfYpBZxp/lPsIAG0lDwzsaVJF72iXWIhc=;
  b=KH+3ek9P6/S+/FVdBdPbHl3ehTPSa4+lXnOk5NC1gOaQuRA9px2EWbZY
   Qw3Pq9q07VHclqvEchAkBP/t2+OFjRnLtn8UyXjZ+j7bbKnt0iZassP51
   tFuvuH2xSkrkdzt/oXo9YPQCBpeL6kwT7baLZeu16KfUi2PLgG2Ampy3y
   77DN5U3qzRh1YfyLfEE8EyYR2pbzsUNS25s8zhGkB/FjOXPpmVeWVbSkb
   1G/rEB9AAhjrNme+zJ6QF4WOKwGmodzm8B7nL3FqI1+OlVgcp+P0WhRuf
   IxXgCH4QxSAqKcuZ9cFSqGYBiNCAqDFnxiqi3BOhml/joFCfPtNAQ6kG3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="348597404"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="348597404"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 05:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="852009165"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="852009165"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 05:02:14 -0700
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
Subject: [PATCH v2] mtd: fix use-after-free in mtd release
Date: Mon, 31 Jul 2023 14:58:36 +0300
Message-Id: <20230731115836.542747-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_050223_076747_80FC133B 
X-CRM114-Status: GOOD (  13.27  )
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

I case of partition device_unregister() in mtd_device_release()
calls mtd_release() which frees mtd_info structure for partition.
All code after device_unregister in mtd_device_release thus
uses already freed memory.

Move part of code to mtd_release() and restict mtd->dev cleanup
to non-partion object.
For partition object such cleanup have no sense as partition
mtd_info is removed.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Fixes: 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
Reviewed-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---

V2: Fix commit messsge wording

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
