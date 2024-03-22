Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE74C54E71
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2024 15:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOjJkuv6L3F/BhSFW8YAtBbMx4C4kjv3ILX669cgV3s=; b=qBJVnJyG0KOVOZ
	I76OZpGuhJCLfvfbtOTT636lmwgJTUWtsp1n45Vd5OcKG2cHh+LXBg+6BiM7WULc35Hh9g9i/sLEc
	h+kLzaL1WaV6W7YQmbOXlcCLiydApPvXjfekp3cVfAFfYZP6vwgFWhrST0O5vPwgTKYYnCPIZS7LB
	2H9u+XMYSOJuQzIDOA40Gfog1QxzrwcT2EhnidThDsHlS19F2QFaMP+fUzs1y5q1z3NR6Hi0tIqpj
	g73dLLgAV2EhkRcuVc5R5Ra8Hxwt4EhGtYhE0XrvKyA4LQkK6i8gLQ4L0is2cCyGpkR8OqeToS8JP
	6YP1ER/pqRAa4BYXye8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnh8E-00000007o91-06HA;
	Fri, 22 Mar 2024 15:48:34 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnh89-00000007o5g-4BMT
	for linux-mtd@lists.infradead.org;
	Fri, 22 Mar 2024 15:48:32 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V1RYR1YfSz1GClV;
	Fri, 22 Mar 2024 23:47:55 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id D7F271400CF;
	Fri, 22 Mar 2024 23:48:20 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Fri, 22 Mar
 2024 23:48:20 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>, <corbet@lwn.net>,
	<kent.overstreet@linux.dev>, <agruenba@redhat.com>
CC: <lizetao1@huawei.com>, <linux-mtd@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v2 4/5] ubifs: Support accessing ACLs through inode_operations
Date: Fri, 22 Mar 2024 23:48:11 +0800
Message-ID: <20240322154812.215369-5-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322154812.215369-1-lizetao1@huawei.com>
References: <20240322154812.215369-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_084830_298957_6215C2A6 
X-CRM114-Status: UNSURE (   7.68  )
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
v1 -> v2: There are no changes to this patch.
v1: https://lore.kernel.org/all/20240319161646.2153867-4-lizetao1@huawei.com/

 fs/ubifs/dir.c  | 2 ++
 fs/ubifs/file.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 243dfb478984..145ada316a46 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1730,6 +1730,8 @@ const struct inode_operations ubifs_dir_inode_operations = {
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
 	.listxattr   = ubifs_listxattr,
+	.get_inode_acl = ubifs_get_inode_acl,
+	.set_acl     = ubifs_set_acl,
 	.update_time = ubifs_update_time,
 	.tmpfile     = ubifs_tmpfile,
 	.fileattr_get = ubifs_fileattr_get,
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 808a2ded4f8c..ba428af0a235 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1664,6 +1664,8 @@ const struct inode_operations ubifs_file_inode_operations = {
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
