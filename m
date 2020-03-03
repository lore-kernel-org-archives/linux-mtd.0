Return-Path: <SRS0=aQsM=4U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEC0C3F2C6
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 09:33:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0542321556
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 09:33:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s1zfHdbS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0542321556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iUKHkyCacOGA/9+eqG+5tRAkUpSE5oDCX/9N3xaaVo=; b=s1zfHdbSxfJfO/
	zHsxMRqq1OTnbH8rfEQD5/fGR3SiJm20r7JfOGqHjaLVw03C/IFMUttA5590wVA0KoFx9DaRIUI3a
	YCDYG2ut6YV/lIL5x/Od4nRIuCEkEGgR11gqBk9cNf4egvU4G1KARfde/wutgUWFBOBjEV0e90zhx
	NlKlT3Eq6EMM3KSOMgmQrhgoAU8JbtD1oD1EHV8VRRaurBODfJXeaIWzBSnTqcXPej9mUA9cpg9/R
	qfRV/Re9nQSC/mNGadSZgt/RbpCDEC+xEdZa8g0i4fFHPcVcFOUzfWzXSpmplmUCwxoXpUL2DkhyI
	KeEe0N/Zng/db4FRPMag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j93vi-0002Yw-Rn; Tue, 03 Mar 2020 09:33:34 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j93vf-0002XE-13
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2020 09:33:32 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A86E17559CD094A3360F;
 Tue,  3 Mar 2020 17:33:21 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Mar 2020
 17:33:13 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>, <yi.zhang@huawei.com>
Subject: [PATCH 2/2] ubifs: ubifs_add_orphan: Fix a memory leak bug
Date: Tue, 3 Mar 2020 17:40:23 +0800
Message-ID: <1583228423-60816-3-git-send-email-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583228423-60816-1-git-send-email-chengzhihao1@huawei.com>
References: <1583228423-60816-1-git-send-email-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_013331_237624_4CC2B941 
X-CRM114-Status: GOOD (  10.52  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Memory leak occurs when files with extended attributes are added to
orphan list.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Fixes: 988bec41318f3fa897e2f8("ubifs: orphan: Handle xattrs like files")
---
 fs/ubifs/orphan.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index edf43ddd7dce..c769bf67e526 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -157,7 +157,7 @@ int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
 	int err = 0;
 	ino_t xattr_inum;
 	union ubifs_key key;
-	struct ubifs_dent_node *xent;
+	struct ubifs_dent_node *xent, *pxent = NULL;
 	struct fscrypt_name nm = {0};
 	struct ubifs_orphan *xattr_orphan;
 	struct ubifs_orphan *orphan;
@@ -181,11 +181,16 @@ int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
 		xattr_inum = le64_to_cpu(xent->inum);
 
 		xattr_orphan = orphan_add(c, xattr_inum, orphan);
-		if (IS_ERR(xattr_orphan))
+		if (IS_ERR(xattr_orphan)) {
+			kfree(xent);
 			return PTR_ERR(xattr_orphan);
+		}
 
+		kfree(pxent);
+		pxent = xent;
 		key_read(c, &xent->key, &key);
 	}
+	kfree(pxent);
 
 	return 0;
 }
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
