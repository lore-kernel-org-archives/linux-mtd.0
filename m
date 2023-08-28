Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BDAC83F16
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Aug 2023 06:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAwVzZXOGCbC8YZU7rFULC2uZQoqVGtZGwXR/L520Xc=; b=wWrxi+DPmWy3fN
	MJS4W759K3NniMJ8OM4xIRHYIYJdWFsuz2nMCw/+RGMcmSsVpPbJ+sJxGGk5JFZqjLsir/Lh2vd4I
	LjP6E4yBpTvA0FifHnn1AdpNG/M8am8tq/4ngXh5RKHmGo9Ag/P00iJ66SaWzmkhk4AJByDiEnO3T
	QH0Z2srSwLWWJX0g4azSV0rGl0zs+L/7fjXXzE68KBKvOha2n0pnWx/E8H3yNXjd26wJAsB2m4Dw6
	9wPIOvKsP5Yb8M/wnCV/weFEb77yyQGau51GCdhFzCj5YiNumyGC/TSkSJVuA9RiXMAQPefYBUwzb
	sA5xC+1GvXhfhYnrUtiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVyU-008yRx-2z;
	Mon, 28 Aug 2023 06:43:46 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVy6-008yBL-0y;
	Mon, 28 Aug 2023 06:43:25 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RZ1Bt5TKDzLp2d;
	Mon, 28 Aug 2023 14:40:06 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 28 Aug
 2023 14:43:16 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-mtd@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <bagasdotme@gmail.com>
Subject: [PATCH v2 07/12] ubi: fastmap: Remove unneeded break condition while filling pools
Date: Mon, 28 Aug 2023 14:38:40 +0800
Message-ID: <20230828063845.3142561-8-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828063845.3142561-1-chengzhihao1@huawei.com>
References: <20230828063845.3142561-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_234322_645572_D779552B 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

Change pool filling stop condition. Commit d09e9a2bddba ("ubi:
fastmap: Fix high cpu usage of ubi_bgt by making sure wl_pool
not empty") reserves fastmap data PEBs after filling 1 PEB in
wl_pool. Now wait_free_pebs_for_pool() makes enough free PEBs
before filling pool, there will still be at least 1 PEB in pool
and 1 PEB in wl_pool after doing ubi_refill_pools().

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap-wl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 12854717915a..7c4cfd80da31 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -142,8 +142,7 @@ static void wait_free_pebs_for_pool(struct ubi_device *ubi)
  * @ubi: UBI device description object
  *
  * This helper function checks whether there are enough free pebs (deducted
- * by fastmap pebs) to fill fm_pool and fm_wl_pool, above rule works after
- * there is at least one of free pebs is filled into fm_wl_pool.
+ * by fastmap pebs) to fill fm_pool and fm_wl_pool.
  */
 static bool has_enough_free_count(struct ubi_device *ubi)
 {
@@ -152,7 +151,7 @@ static bool has_enough_free_count(struct ubi_device *ubi)
 	if (!ubi->free.rb_node)
 		return false;
 
-	if (ubi->fm_wl_pool.size > 0 && !(ubi->ro_mode || ubi->fm_disabled))
+	if (!ubi->ro_mode && !ubi->fm_disabled)
 		fm_used = ubi->fm_size / ubi->leb_size - 1;
 
 	return ubi->free_count > fm_used;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
