Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5194FC27C6E
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wf/vsDh2r8e7rx81C601VQpmX/xIZjA/ILY+F6CiXEY=; b=35SOinIu3G2RfU
	SlYJRLzhJPzq9DRa/2ZMUJQy8o4iifa4x1a8/g76BuQ1L7vLu1DzwLAYtHmCJk7MRE52a/gnL+cIt
	DXtkNd1+fccX6LJ2cOHfXKY9/jXOvNLizV2seMQZa5iRov0k5uErmXP4p3EaFouKq2wE05PLPfU4u
	yrNG8yZrrfH/7i305En3/162IsRxMZp476FaugMVxx+Hv8+5Evs5cPXIOOfr2Xs7XUqkxcpwujAtq
	wkRLZ3WAVwksSksuge6tTF4CbzIx/jZI52Z71qa3RHZfLyybudB17E5x2ixc+by1ofrr/tyPthYVv
	Jtq0wAQ5CG2qLJCRtXFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRE6-0000000CI7T-376x;
	Fri, 07 Jun 2024 04:29:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCE-0000000CGdJ-1nhd
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=LoIy4TUVi+9TixekRdNtEJC2CmUeRkSMwtIVVShwhNg=; b=nJJkQaHFzSK7X2KKi4vluwY8LZ
	MZpDvUaDOP5VyDxiY6iBlROQCo60g9kSlvENOZVbfGSFhCcNs52rGbweQoo4g2UHWofJGuZTU/TN5
	4zq7z6fIptxkuxgBw+MDRCpXgLvNQ/Szigv8eUtednRF7te11lhZmojooGtf/RX7otMscfK+L0JoH
	F7I1yWRYbohJ9FW5xwltRv2dwHP2njWaura9ycrN34MpjireMsc7PLVsHa/Sirs2efryk6wb63p8n
	9oFTAlatO9atG1Om7EgcNCHEFdBRyOXFJImnhe/cRxNoV13vDf1GfWfee/eNzRhJ0p/qaUqbxVWik
	+Z4SShfA==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCA-00000004TqA-20Hm
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:21 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4VwSkc3gDFzPpnZ;
	Fri,  7 Jun 2024 12:23:52 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id C86E018007E;
	Fri,  7 Jun 2024 12:27:11 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:03 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 049/110] ubifs-utils: Adapt master.c in libubifs
Date: Fri, 7 Jun 2024 12:25:14 +0800
Message-ID: <20240607042615.2069840-50-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052718_852885_12D3F0D3 
X-CRM114-Status: UNSURE (   7.77  )
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

Adapt master.c in libubifs, compared with linux kernel implementations:
 1. Remove authentication related implementations
    (eg. mst_node_check_hash), authentication is not supported in fsck
    for now.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/libubifs/master.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/ubifs-utils/libubifs/master.c b/ubifs-utils/libubifs/master.c
index 7adc37c1..cce1a415 100644
--- a/ubifs-utils/libubifs/master.c
+++ b/ubifs-utils/libubifs/master.c
@@ -10,7 +10,11 @@
 
 /* This file implements reading and writing the master node */
 
+#include "linux_err.h"
+#include "kmem.h"
 #include "ubifs.h"
+#include "defs.h"
+#include "debug.h"
 
 /**
  * ubifs_compare_master_node - compare two UBIFS master nodes
@@ -21,7 +25,7 @@
  * This function compares two UBIFS master nodes. Returns 0 if they are equal
  * and nonzero if not.
  */
-int ubifs_compare_master_node(struct ubifs_info *c, void *m1, void *m2)
+int ubifs_compare_master_node(__unused struct ubifs_info *c, void *m1, void *m2)
 {
 	int ret;
 	int behind;
@@ -61,20 +65,11 @@ int ubifs_compare_master_node(struct ubifs_info *c, void *m1, void *m2)
  *
  * Returns 0 if the hashes are equal, a negative error code otherwise.
  */
-static int mst_node_check_hash(const struct ubifs_info *c,
-			       const struct ubifs_mst_node *mst,
-			       const u8 *expected)
+static int mst_node_check_hash(__unused const struct ubifs_info *c,
+			       __unused const struct ubifs_mst_node *mst,
+			       __unused const u8 *expected)
 {
-	u8 calc[UBIFS_MAX_HASH_LEN];
-	const void *node = mst;
-
-	crypto_shash_tfm_digest(c->hash_tfm, node + sizeof(struct ubifs_ch),
-				UBIFS_MST_NODE_SZ - sizeof(struct ubifs_ch),
-				calc);
-
-	if (ubifs_check_hash(c, expected, calc))
-		return -EPERM;
-
+	// To be implemented
 	return 0;
 }
 
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
