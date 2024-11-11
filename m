Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC360D2E9C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wf/vsDh2r8e7rx81C601VQpmX/xIZjA/ILY+F6CiXEY=; b=hyRQb6J5vO05tB
	iK0WtIN664mN2gQvaXivKiSWmftJ/SvklrLMhd/c0ASMPr+ocUSnA7V9C2dyFRhFZJ9qo/BabK8Jl
	JIStp67s0ryUaOlD9/wj9jaRTjT70m5zn37DcGhHjqLnCivgcqBw40dTjyXTEXaYa7ishiVnPl8xd
	AkvE67NisrZAQM0s5Yfh45f/O7+SxgpTepgGZrPAjkmonsmjIXffKSny/VUY8LJx2SmQ4eQy1VIg6
	eWuoMGKnkc3g/urSWe6Dy7AecpA+HxGWM7uh1cXlmWcLz+J4HPrMQopetq0DGkl03iD+xOj9OULtj
	BexGXMxwes+EEWTpBw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQJm-0000000Gxko-3akZ;
	Mon, 11 Nov 2024 09:02:42 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQJj-0000000Gxi2-2SYN
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:02:41 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Xn3Qx1b4fz1TB5P;
	Mon, 11 Nov 2024 17:00:09 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 99B3A180064;
	Mon, 11 Nov 2024 17:02:35 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:02:34 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 040/102] ubifs-utils: Adapt master.c in libubifs
Date: Mon, 11 Nov 2024 17:00:54 +0800
Message-ID: <20241111090124.2070455-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_010239_801919_2B8BEC2F 
X-CRM114-Status: UNSURE (   9.44  )
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
