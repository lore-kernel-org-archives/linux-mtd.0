Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EAEC52D6F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 06:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+9sLc3iqlk6AdBDIcwIj7/jFdDbojtk0xmcD/jJSloA=; b=3CQJ5AQW3gp904
	U0zGMBICGVhqZZfCIau6qBNDtZTki9s+3+NRzsDX8SDR/9r6puT6gh2SlbJOCx7oBKpqUNbf6zpMD
	W3eM1PEAmu+tqL40Ew+FU8JBDDudgNfuG1e/k4LhxTa/MdSHCWlIenZCiyC8cYAFRNwYc38rMTmuy
	5ift9fbTC2YhxeTwloz4g112bRjXZ3ky2NikBztE9rHbSzDiaXaW37cFbVp0n55zY/8Pggbxu8+01
	rVdUO3msTqjaLV0noAtLIolI/RTQN3sv1SHkReSBQCRRB2AwM+UZ4vWHdAlCaoSQVPHEdoovlmesU
	8G7U+zFBVz4WjcXI6Z+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgezt-00000007kDc-1Pqb;
	Wed, 21 Aug 2024 06:39:09 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgezo-00000007kAr-1Jiz
	for linux-mtd@lists.infradead.org;
	Wed, 21 Aug 2024 06:39:06 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wpc5S1qywz6FGY7;
	Wed, 21 Aug 2024 14:35:08 +0800 (CST)
Received: from lhrpeml500002.china.huawei.com (unknown [7.191.160.78])
	by mail.maildlp.com (Postfix) with ESMTPS id 2370F1400D3;
	Wed, 21 Aug 2024 14:38:46 +0800 (CST)
Received: from huawei.com (10.67.174.89) by lhrpeml500002.china.huawei.com
 (7.191.160.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 Aug
 2024 07:38:44 +0100
From: Liu Mingrui <liumingrui@huawei.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <liumingrui@huawei.com>
Subject: [PATCH -next] ubifs: Display the inode number when orphan twice happens
Date: Wed, 21 Aug 2024 06:30:59 +0000
Message-ID: <20240821063059.2317249-1-liumingrui@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500002.china.huawei.com (7.191.160.78)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_233904_520003_A7C94A70 
X-CRM114-Status: UNSURE (   9.51  )
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

Display the inode number in error message when the same orphan inode
is added twice, which could provide more information for debugging.

Signed-off-by: Liu Mingrui <liumingrui@huawei.com>
---
 fs/ubifs/orphan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index fb957d963ba6..5555dd740889 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -76,7 +76,7 @@ int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
 		else if (inum > o->inum)
 			p = &(*p)->rb_right;
 		else {
-			ubifs_err(c, "orphaned twice");
+			ubifs_err(c, "ino %lu orphaned twice", (unsigned long)inum);
 			spin_unlock(&c->orphan_lock);
 			kfree(orphan);
 			return -EINVAL;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
