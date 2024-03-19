Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9067CD11DE
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+0Cxf89U1lylfWR9AOYtOxwvho5N2hSuKY7W3RwSp/E=; b=Uvj8iPUNgkQHRu
	rHIjdv47mfqKKndCu8THuavr0iWsdmDEuDnhZqtmCAlGBbDSYvVBmwKuVW82T9cal+41+XgXcGK5H
	y38NnjjxFsaNoS2BM6jxaCbPqZWgDUookr1AnFC8TaQLrKU6NqiqNCsABkid3Gud317szCDSh4zpk
	T+BF8SCrxybG78gvsYYc/yZ9OtHkLNuyq6e0TO+CWBLePMaAElPmrQeJpJceN9IqUW9aBZCmUFx0H
	Kosa569pXhIlYkGdhHsQtx44y0WGdysqmKJk5nCSGkormvv2wKZKXVd4FhfRM6IkfT2sS4UMFQ2yt
	zNh3gfnfKLYNBjgr8cYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmc9F-0000000DKHV-3Oo6;
	Tue, 19 Mar 2024 16:17:09 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmc9B-0000000DKDG-2Gsc
	for linux-mtd@lists.infradead.org;
	Tue, 19 Mar 2024 16:17:07 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4TzcKP4vPTz1vx43;
	Wed, 20 Mar 2024 00:16:09 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B0931A016C;
	Wed, 20 Mar 2024 00:16:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Wed, 20 Mar
 2024 00:16:55 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
CC: <lizetao1@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 1/5] ubifs: Implement POSIX Access Control Lists (ACLs)
Date: Wed, 20 Mar 2024 00:16:42 +0800
Message-ID: <20240319161646.2153867-2-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319161646.2153867-1-lizetao1@huawei.com>
References: <20240319161646.2153867-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_091705_970536_E3FA59F6 
X-CRM114-Status: GOOD (  22.50  )
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

Implement the ACLs feature for ubifs based on vfs Posix ACLs,
details as follows:
  * Initialize acl for newly created inode.
  * Provides get/set interface to access ACLs.

ACLs feature relies on xattr implementation which using specific key
names "system.posix_acl_default" and "system.posix_acl_access". Now Only
the v2 version of POSIX ACLs is supported, and ubifs does not need to
customize the storage format, which can simplify the implementation.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/ubifs/acl.c   | 140 +++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/ubifs.h |  13 +++++
 fs/ubifs/xattr.c |   1 -
 3 files changed, 153 insertions(+), 1 deletion(-)
 create mode 100644 fs/ubifs/acl.c

diff --git a/fs/ubifs/acl.c b/fs/ubifs/acl.c
new file mode 100644
index 000000000000..253568baf097
--- /dev/null
+++ b/fs/ubifs/acl.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * This file is part of UBIFS.
+ *
+ * Copyright (C) 2024 Huawei Tech. Co., Ltd.
+ *
+ * Authors: Li Zetao <lizetao1@huawei.com>
+ */
+
+/* This file implements POSIX Access Control Lists (ACLs) */
+
+#include "ubifs.h"
+
+#include <linux/posix_acl_xattr.h>
+
+struct posix_acl *ubifs_get_inode_acl(struct inode *inode, int type, bool rcu)
+{
+	char *xattr_value = NULL;
+	const char *xattr_name;
+	struct posix_acl *acl;
+	ssize_t size;
+
+	if (rcu)
+		return ERR_PTR(-ECHILD);
+
+	xattr_name = posix_acl_xattr_name(type);
+	if (unlikely(!strcmp(xattr_name, "")))
+		return ERR_PTR(-EINVAL);
+
+	size = ubifs_xattr_get(inode, xattr_name, NULL, 0);
+	if (size > 0) {
+		xattr_value = kzalloc(size, GFP_KERNEL);
+		if (unlikely(!xattr_value))
+			return ERR_PTR(-ENOMEM);
+
+		size = ubifs_xattr_get(inode, xattr_name, xattr_value, size);
+	}
+
+	if (size > 0)
+		acl = posix_acl_from_xattr(&init_user_ns, xattr_value, size);
+	else if (size == -ENODATA || size == 0)
+		acl = NULL;
+	else
+		acl = ERR_PTR(size);
+
+	kfree(xattr_value);
+
+	return acl;
+}
+
+static int __ubifs_set_acl(struct inode *inode, int type, struct posix_acl *acl, int flags)
+{
+	void *xattr_value = NULL;
+	const char *xattr_name;
+	size_t size = 0;
+	int error;
+
+	xattr_name = posix_acl_xattr_name(type);
+	if (unlikely(!strcmp(xattr_name, "")))
+		return -EINVAL;
+
+	if (unlikely(!strcmp(xattr_name, XATTR_NAME_POSIX_ACL_DEFAULT) && !S_ISDIR(inode->i_mode)))
+		return acl ? -EACCES : 0;
+
+	if (acl) {
+		size = posix_acl_xattr_size(acl->a_count);
+		xattr_value = kmalloc(size, GFP_KERNEL);
+		if (unlikely(!xattr_value))
+			return -ENOMEM;
+
+		error = posix_acl_to_xattr(&init_user_ns, acl, xattr_value, size);
+		if (unlikely(error < 0))
+			goto out;
+	}
+
+	error = ubifs_xattr_set(inode, xattr_name, xattr_value, size, flags, false);
+	if (likely(!error))
+		set_cached_acl(inode, type, acl);
+out:
+	kfree(xattr_value);
+	return error;
+}
+
+int ubifs_set_acl(struct mnt_idmap *idmap, struct dentry *dentry, struct posix_acl *acl, int type)
+{
+	struct inode *inode = d_inode(dentry);
+	umode_t old_mode = inode->i_mode;
+	int error;
+
+	if (type == ACL_TYPE_ACCESS && acl) {
+		error = posix_acl_update_mode(idmap, inode, &inode->i_mode, &acl);
+		if (unlikely(error))
+			return error;
+	}
+
+	error = __ubifs_set_acl(inode, type, acl, 0);
+	if (unlikely(error))
+		inode->i_mode = old_mode;
+
+	return error;
+
+}
+
+/**
+ * ubifs_init_acl - initialize the ACLs for a new inode.
+ * @inode: newly created inode
+ * @dir: parent directory inode
+ *
+ * This function initialize ACLs, including inheriting the
+ * default ACLs of parent directory or modifying the default
+ * ACLs according to the mode parameter in open() / creat()
+ * system calls.
+ */
+int ubifs_init_acl(struct inode *inode, struct inode *dir)
+{
+	struct posix_acl *default_acl;
+	struct posix_acl *acl;
+	int error;
+
+	error = posix_acl_create(dir, &inode->i_mode, &default_acl, &acl);
+	if (unlikely(error))
+		return error;
+
+	if (default_acl) {
+		error = __ubifs_set_acl(inode, ACL_TYPE_DEFAULT, default_acl, XATTR_CREATE);
+		posix_acl_release(default_acl);
+	} else {
+		inode->i_default_acl = NULL;
+	}
+
+	if (acl) {
+		if (likely(!error))
+			error = __ubifs_set_acl(inode, ACL_TYPE_ACCESS, acl, XATTR_CREATE);
+		posix_acl_release(acl);
+	} else {
+		inode->i_acl = NULL;
+	}
+
+	return error;
+}
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 3916dc4f30ca..b0d3b076290d 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -2069,6 +2069,19 @@ static inline int ubifs_init_security(struct inode *dentry,
 }
 #endif
 
+#ifdef CONFIG_UBIFS_FS_POSIX_ACL
+struct posix_acl *ubifs_get_inode_acl(struct inode *inode, int type, bool rcu);
+int ubifs_set_acl(struct mnt_idmap *idmap, struct dentry *dentry, struct posix_acl *acl, int type);
+int ubifs_init_acl(struct inode *inode, struct inode *dir);
+
+#else /* CONFIG_UBIFS_FS_POSIX_ACL */
+#define ubifs_get_inode_acl NULL
+#define ubifs_set_acl NULL
+static inline int ubifs_init_acl(struct inode *inode, struct inode *dir)
+{
+	return 0;
+}
+#endif /* CONFIG_UBIFS_FS_POSIX_ACL */
 
 /* super.c */
 struct inode *ubifs_iget(struct super_block *sb, unsigned long inum);
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 0847db521984..eb1c1f5d10df 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -40,7 +40,6 @@
  * in the VFS inode cache. The xentries are cached in the LNC cache (see
  * tnc.c).
  *
- * ACL support is not implemented.
  */
 
 #include "ubifs.h"
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
