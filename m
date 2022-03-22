Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A90C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EN5w/NiejisgyieoyoNMr6T+5hqswgNvYh7N16VdCW0=; b=uTCbZ5hoL8aTim
	OoFE6KqdTQEHpAwREcNr18mbkz+y6m+eXI25eMBsmGK3S1P7ovPmxwhkel2uxsTQSl0v15BjjO+GP
	7HXhANl4fl6uIIEPpFNsxftqNzziTfWUEdGu9wowxjtdcSGlJSIh/EtpJwUVlTG5kNeQg4lmMuy23
	qRxTbNitjSwy/TNroe7i2zubaRplhm9LWfACPlq5EEVLbvIG7Z0GIVIpDud2xm3myljYFVa2DzymR
	Q1qFV1gs1IApbxE9uUDD/6cfTTmbA8bZZ/xczD4ZyqoHt32yqWd5IB7I8HjNXabYo6z7i3qdivVJO
	TAxAWvAr4tCsjj+WGIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWbbp-00AhAM-3n; Tue, 22 Mar 2022 10:19:25 +0000
Received: from edge01.meizu.com ([14.29.68.187] helo=mail.meizu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWbbm-00Ah9s-8p
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 10:19:23 +0000
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail04.meizu.com
 (172.16.1.16) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 22 Mar
 2022 18:13:10 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 22 Mar
 2022 18:13:06 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Haowen
 Bai" <baihaowen@meizu.com>
Subject: [PATCH] fs: ubifs: use NULL instead of using plain integer as pointer
Date: Tue, 22 Mar 2022 18:13:04 +0800
Message-ID: <1647943984-1646-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_031922_635327_EC5752F6 
X-CRM114-Status: UNSURE (   8.98  )
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

This fixes the following sparse warnings:
fs/ubifs/xattr.c:680:58: warning: Using plain integer as NULL pointer

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 fs/ubifs/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index e4f193e..e4c4761 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -677,7 +677,7 @@ int ubifs_init_security(struct inode *dentry, struct inode *inode,
 	int err;
 
 	err = security_inode_init_security(inode, dentry, qstr,
-					   &init_xattrs, 0);
+					   &init_xattrs, NULL);
 	if (err) {
 		struct ubifs_info *c = dentry->i_sb->s_fs_info;
 		ubifs_err(c, "cannot initialize security for inode %lu, error %d",
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
