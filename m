Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F78C83F12
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Aug 2023 06:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRe2EZmDKbXMRxYsddjv4jg33gkr6tSOW04t5GyQUzA=; b=xNq/u4kK/Hhsx1
	ulTZer+URKHNvza8v3MUPuTNi0r33ACOKugQUoxVU0huUb8q/pBZ1Vqs882SDB2pEHJwYMjf0WfRx
	MJT0wjjKQlzQCWyPkuF4Q6qn64/nxz01w2eeOXK3BLV5E4wUGxf930N7E4NFliwafiH1CFYzwXsSr
	toksvB/8Y6wDKtxxcdxx9i7blBWmtIxqjK8pqACAdsxdJFKkLPvn0IjSi2aEMH/LbJ3c1lVBWUbTt
	41NuThtbgrAI8eP/d08RsNKfNbF6SfjpztvTNJKU8+dQuesYDGK4xeIfXiG1CzdWO0znvmGaeMlzB
	I6EdUabZUs3LXFBvYQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVzK-008z5B-1q;
	Mon, 28 Aug 2023 06:44:38 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVy8-008yBR-0c;
	Mon, 28 Aug 2023 06:43:28 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RZ1Cp37rqzVjXv;
	Mon, 28 Aug 2023 14:40:54 +0800 (CST)
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
Subject: [PATCH v2 08/12] ubi: fastmap: may_reserve_for_fm: Don't reserve PEB if fm_anchor exists
Date: Mon, 28 Aug 2023 14:38:41 +0800
Message-ID: <20230828063845.3142561-9-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828063845.3142561-1-chengzhihao1@huawei.com>
References: <20230828063845.3142561-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_234324_622239_506A4DDA 
X-CRM114-Status: GOOD (  14.10  )
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

This is the part 1 to fix cyclically reusing single fastmap data PEBs.

After running fsstress on UBIFS for a while, UBI (16384 blocks, fastmap
takes 2 blocks) has an erase block(PEB: 8031) with big erase counter
greater than any other pebs:

=========================================================
from              to     count      min      avg      max
---------------------------------------------------------
0        ..        9:        0        0        0        0
10       ..       99:      532       84       92       99
100      ..      999:    15787      100      147      229
1000     ..     9999:       64     4699     4765     4826
10000    ..    99999:        0        0        0        0
100000   ..      inf:        1   272935   272935   272935
---------------------------------------------------------
Total               :    16384       84      180   272935

Not like fm_anchor, there is no candidate PEBs for fastmap data area,
so old fastmap data pebs will be reused after all free pebs are filled
into pool/wl_pool:
ubi_update_fastmap
 for (i = 1; i < new_fm->used_blocks; i++)
  erase_block(ubi, old_fm->e[i]->pnum)
  new_fm->e[i] = old_fm->e[i]

According to wear leveling algorithm, UBI selects one small erase
counter PEB from ubi->used and one big erase counter PEB from wl_pool,
the reused fastmap data PEB is not in these trees. UBI won't schedule
this PEB for wl even it is in ubi->used because wl algorithm expects
small erase counter for used PEB.

Don't reserve PEB for fastmap in may_reserve_for_fm() if fm_anchor
already exists. Otherwise, when UBI is running out of free PEBs,
the only one free PEB (pnum < 64) will be skipped and fastmap data
will be written on the same old PEB.

Fixes: dbb7d2a88d2a ("UBI: Add fastmap core")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217787
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap-wl.c | 2 +-
 drivers/mtd/ubi/wl.c         | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 7c4cfd80da31..490514da1e00 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -521,7 +521,7 @@ static void ubi_fastmap_close(struct ubi_device *ubi)
 static struct ubi_wl_entry *may_reserve_for_fm(struct ubi_device *ubi,
 					   struct ubi_wl_entry *e,
 					   struct rb_root *root) {
-	if (e && !ubi->fm_disabled && !ubi->fm &&
+	if (e && !ubi->fm_disabled && !ubi->fm && !ubi->fm_anchor &&
 	    e->pnum < UBI_FM_MAX_START)
 		e = rb_entry(rb_next(root->rb_node),
 			     struct ubi_wl_entry, u.rb);
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 14edb65ce6a6..40a1c306b8af 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -367,9 +367,12 @@ static struct ubi_wl_entry *find_mean_wl_entry(struct ubi_device *ubi,
 	if (last->ec - first->ec < WL_FREE_MAX_DIFF) {
 		e = rb_entry(root->rb_node, struct ubi_wl_entry, u.rb);
 
-		/* If no fastmap has been written and this WL entry can be used
-		 * as anchor PEB, hold it back and return the second best
-		 * WL entry such that fastmap can use the anchor PEB later. */
+		/*
+		 * If no fastmap has been written and fm_anchor is not
+		 * reserved and this WL entry can be used as anchor PEB
+		 * hold it back and return the second best WL entry such
+		 * that fastmap can use the anchor PEB later.
+		 */
 		e = may_reserve_for_fm(ubi, e, root);
 	} else
 		e = find_wl_entry(ubi, root, WL_FREE_MAX_DIFF/2);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
