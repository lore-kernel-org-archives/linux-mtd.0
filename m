Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CCDC48BCF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 02:30:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50A6661407
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 02:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50A6661407
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ArG1Caf/03NhQlt3g8gOewSnHd26jlgkMnJRYxP936g=; b=46El9u/fZb4dvS
	+qY7obyqJRpHU2NvEypwFUl6m92fWaUgMzYMxiYv4eqkN7R3IGso7r16snknro+8IZwNiTziOXCcx
	kWgz0UyWyRJMarff1nYfee6pnT5rTIcWHt5VONJ6E4sdhNYgzLLlkPM6DgRNUO9y99PM+1P4X15Qw
	PAWvBcM/YjsxZWttGUI4FeePVxu+6KeUyAlvi14GXQD2j0iPBD4FsZEJmg+MzWeVeD00gbJ6V6SqR
	egHa0Nb7f6OxS7tXx0w/k3ZFKW76G5vAH4bURunknIU2gw2P5TKmqhuIw2C1RThIdTS+J2on0fht6
	d6jxwLUhClrAytvBrQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrARa-00GRpy-Es; Thu, 10 Jun 2021 02:29:18 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrARW-00GRoa-Vh
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 02:29:16 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G0nq72vLszWtkk;
 Thu, 10 Jun 2021 10:24:19 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 10 Jun 2021 10:28:57 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 10 Jun 2021 10:28:57 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd
 <linux-mtd@lists.infradead.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] mtd: inftl: remove unnecessary oom message
Date: Thu, 10 Jun 2021 10:28:50 +0800
Message-ID: <20210610022850.15397-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_192915_229977_B044D7F7 
X-CRM114-Status: UNSURE (   8.43  )
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

Fixes scripts/checkpatch.pl warning:
WARNING: Possible unnecessary 'out of memory' message

Remove it can help us save a bit of memory.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/mtd/inftlmount.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 39d024118610264..6276daa296dab62 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -259,20 +259,13 @@ static int find_boot_record(struct INFTLrecord *inftl)
 		/* Memory alloc */
 		inftl->PUtable = kmalloc_array(inftl->nb_blocks, sizeof(u16),
 					       GFP_KERNEL);
-		if (!inftl->PUtable) {
-			printk(KERN_WARNING "INFTL: allocation of PUtable "
-				"failed (%zd bytes)\n",
-				inftl->nb_blocks * sizeof(u16));
+		if (!inftl->PUtable)
 			return -ENOMEM;
-		}
 
 		inftl->VUtable = kmalloc_array(inftl->nb_blocks, sizeof(u16),
 					       GFP_KERNEL);
 		if (!inftl->VUtable) {
 			kfree(inftl->PUtable);
-			printk(KERN_WARNING "INFTL: allocation of VUtable "
-				"failed (%zd bytes)\n",
-				inftl->nb_blocks * sizeof(u16));
 			return -ENOMEM;
 		}
 
@@ -558,12 +551,8 @@ int INFTL_mount(struct INFTLrecord *s)
 
 	/* Temporary buffer to store ANAC numbers. */
 	ANACtable = kcalloc(s->nb_blocks, sizeof(u8), GFP_KERNEL);
-	if (!ANACtable) {
-		printk(KERN_WARNING "INFTL: allocation of ANACtable "
-				"failed (%zd bytes)\n",
-				s->nb_blocks * sizeof(u8));
+	if (!ANACtable)
 		return -ENOMEM;
-	}
 
 	/*
 	 * First pass is to explore each physical unit, and construct the
-- 
2.26.0.106.g9fadedd



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
