Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA5DCD11BF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzCOPKDf7azAf/P0Mt1WdxwHJR+5ZfnVpM58aswC2qc=; b=ksMX56xfI/rjip
	M3Z7auoDg4Ct6HbUghEqRtsltSi/mXVs+4Fj+yhIeSGGmMVALFxWIxgiMWEmgjJXv+0cods91Hs3P
	cw0fl0anQCQ8KVc2S3hbqNpkHJjeWRCmgmr+wm1u8xmwBOumGETktEfRdmJyQkpZbYG45UMT2IXGG
	DyVy2CtlfmRaNfAvOdl/3Fh4DWL+/NwKWEGndiHJPiRoMaB/OzddEE7HyQJ/B7ZgeMChSZNBexyvL
	S10I8l3snKn0jV4srrlkAlyRB9oNgGjeuAJ4GI/LrEbU6nnXGhfQpqJhy2gH8+MEh6O2BwIbFbI3r
	Y0KQbyQ++bjxocYxYWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmc9E-0000000DKGm-44S4;
	Tue, 19 Mar 2024 16:17:08 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmc9A-0000000DKDF-3XLL
	for linux-mtd@lists.infradead.org;
	Tue, 19 Mar 2024 16:17:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4TzcHj1RB5z1Q9nB;
	Wed, 20 Mar 2024 00:14:41 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 3AC8A14040D;
	Wed, 20 Mar 2024 00:16:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Wed, 20 Mar
 2024 00:16:55 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
CC: <lizetao1@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 3/5] ubifs: Support accessing ACLs through inode_operations
Date: Wed, 20 Mar 2024 00:16:44 +0800
Message-ID: <20240319161646.2153867-4-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319161646.2153867-1-lizetao1@huawei.com>
References: <20240319161646.2153867-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_091705_080367_05E346FB 
X-CRM114-Status: UNSURE (   7.86  )
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

Register the get/set interfaces to the inode operations whilch
allows access to the ACL through the vfs layer.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/ubifs/dir.c  | 2 ++
 fs/ubifs/file.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index dfb6823cc953..59784349ba21 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1724,6 +1724,8 @@ const struct inode_operations ubifs_dir_inode_operations = {
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
 	.listxattr   = ubifs_listxattr,
+	.get_inode_acl = ubifs_get_inode_acl,
+	.set_acl     = ubifs_set_acl,
 	.update_time = ubifs_update_time,
 	.tmpfile     = ubifs_tmpfile,
 	.fileattr_get = ubifs_fileattr_get,
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 8f964f8b0f96..80def8734b13 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1665,6 +1665,8 @@ const struct inode_operations ubifs_file_inode_operations = {
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
 	.listxattr   = ubifs_listxattr,
+	.get_inode_acl = ubifs_get_inode_acl,
+	.set_acl      = ubifs_set_acl,
 	.update_time = ubifs_update_time,
 	.fileattr_get = ubifs_fileattr_get,
 	.fileattr_set = ubifs_fileattr_set,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
