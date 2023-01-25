Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E53C54E94
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 11:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=keGNTIKoPVuVfV+pVpuYSPddnBrZV5DZWU1VZW/w8sQ=; b=vjyFF46vdSQsfa
	LT6AhJttnzQkgkP8d34kL9L4cNnFDCujVG4+2kj2GOND5K+0jl2jJTpHMJtL6bwFrA/Jgp2c3ozak
	O22gTXECEARZe0LIoNRszaL2lt5ChdCzh2mW+IJtsLhrdWCjGfF7B8Bc0au+vS8gKzr9YBiEVEAm+
	PcFUMd7AlH3g4Ff+0T9s9RBKamXkS/HyIrtoYMTxOU6w7tSU3jraBYeb/uG2Tqjy6Z0WKfoty6t8P
	XJZnFFxWNLgLKTmWFHMfXHMydv+cD2blzerbkFb/rFvptaTf8qolUFKTjA+vnMex9sOuk55XjSTRX
	mfbL8bvRQERupJkv50CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKdyR-007ATI-Vq; Wed, 25 Jan 2023 11:29:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKdyO-007ASB-1o
	for linux-mtd@lists.infradead.org; Wed, 25 Jan 2023 11:29:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 62E3AB81992;
	Wed, 25 Jan 2023 11:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49036C4339C;
	Wed, 25 Jan 2023 11:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674646185;
	bh=6r8RQh6tLH90oDxRR8sLeViDQoVA80avbvRgVwUU3Yg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XMDpKqbpUAVmqDTm7pZEcTXvThgRxpkDZG6NtSYWVWJcCDJ4ZYdSJG/M9J0PIOlLc
	 JEQb9AObtaef/Chu2cyOPTd9p55hF5A6Krv6a8ep7zfYg8+4Onr2Lg25SX8yTVlo8b
	 ThM9sd6AeyLe8T1d0aGsmiHp+3mhccXL70LA5gXUIh/fP6t6eo7cB9pah6rwDt0Vu+
	 a6YucsiQOSurAeM4GvAF6GvD+uGc7qktMEXPLUsuYMT9ywpg/3D2QBNQcfjAAOsLlk
	 WngOziFjEPfV+/PQYsSRgBIPxHfWj54SB/DrGNELcKMeFWoBPS/S4APE//9ciR8kMu
	 0FeMmMO9MtthQ==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 25 Jan 2023 12:28:54 +0100
Subject: [PATCH 09/12] jffs2: drop posix acl handlers
MIME-Version: 1.0
Message-Id: <20230125-fs-acl-remove-generic-xattr-handlers-v1-9-6cf155b492b6@kernel.org>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v1-0-6cf155b492b6@kernel.org>
In-Reply-To: <20230125-fs-acl-remove-generic-xattr-handlers-v1-0-6cf155b492b6@kernel.org>
To: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Seth Forshee <sforshee@kernel.org>, 
 "Christian Brauner (Microsoft)" <brauner@kernel.org>, 
 linux-mtd@lists.infradead.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3423; i=brauner@kernel.org;
 h=from:subject:message-id; bh=6r8RQh6tLH90oDxRR8sLeViDQoVA80avbvRgVwUU3Yg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMSRfFJp05d+95bf+fmCyPWl0U6v0p6vtw/e5F6S+PJ15bNrZ
 z677eTpKWRjEuBhkxRRZHNpNwuWW81RsNsrUgJnDygQyhIGLUwAmkj6XkeFy0LJJL9/naQo/EEi2eP
 t5XYH6vCeO6g5C+ur6Bg6vwmUYGa43NLzrOTbrj6pMeecD45Ufp2hLdjwKrpin+CB9nVqSMjsA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_032948_416851_39C60A4E 
X-CRM114-Status: GOOD (  15.30  )
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

Last cycle we introduced a new posix acl api. Filesystems now only need
to implement the inode operations for posix acls. The generic xattr
handlers aren't used anymore by the vfs and will be completely removed.
Keeping the handler around is confusing and gives the false impression
that the xattr infrastructure of the vfs is used to interact with posix
acls when it really isn't anymore.

For this to work we simply rework the ->listxattr() inode operation to
not rely on the generix posix acl handlers anymore.

Cc: <linux-mtd@lists.infradead.org>
Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
---
 fs/jffs2/xattr.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index da3e18503c65..40cf03dc34be 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -919,43 +919,46 @@ const struct xattr_handler *jffs2_xattr_handlers[] = {
 	&jffs2_user_xattr_handler,
 #ifdef CONFIG_JFFS2_FS_SECURITY
 	&jffs2_security_xattr_handler,
-#endif
-#ifdef CONFIG_JFFS2_FS_POSIX_ACL
-	&posix_acl_access_xattr_handler,
-	&posix_acl_default_xattr_handler,
 #endif
 	&jffs2_trusted_xattr_handler,
 	NULL
 };
 
-static const struct xattr_handler *xprefix_to_handler(int xprefix) {
-	const struct xattr_handler *ret;
+static const char *jffs2_xattr_prefix(int xprefix, struct dentry *dentry)
+{
+	const char *name = NULL;
+	const struct xattr_handler *handler = NULL;
 
 	switch (xprefix) {
 	case JFFS2_XPREFIX_USER:
-		ret = &jffs2_user_xattr_handler;
+		handler = &jffs2_user_xattr_handler;
+		break;
+	case JFFS2_XPREFIX_TRUSTED:
+		handler = &jffs2_trusted_xattr_handler;
 		break;
 #ifdef CONFIG_JFFS2_FS_SECURITY
 	case JFFS2_XPREFIX_SECURITY:
-		ret = &jffs2_security_xattr_handler;
+		handler = &jffs2_security_xattr_handler;
 		break;
 #endif
 #ifdef CONFIG_JFFS2_FS_POSIX_ACL
 	case JFFS2_XPREFIX_ACL_ACCESS:
-		ret = &posix_acl_access_xattr_handler;
+		if (posix_acl_dentry_list(dentry))
+			name = XATTR_NAME_POSIX_ACL_ACCESS;
 		break;
 	case JFFS2_XPREFIX_ACL_DEFAULT:
-		ret = &posix_acl_default_xattr_handler;
+		if (posix_acl_dentry_list(dentry))
+			name = XATTR_NAME_POSIX_ACL_DEFAULT;
 		break;
 #endif
-	case JFFS2_XPREFIX_TRUSTED:
-		ret = &jffs2_trusted_xattr_handler;
-		break;
 	default:
-		ret = NULL;
-		break;
+		return NULL;
 	}
-	return ret;
+
+	if (xattr_dentry_list(handler, dentry))
+		name = xattr_prefix(handler);
+
+	return name;
 }
 
 ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
@@ -966,7 +969,6 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	struct jffs2_inode_cache *ic = f->inocache;
 	struct jffs2_xattr_ref *ref, **pref;
 	struct jffs2_xattr_datum *xd;
-	const struct xattr_handler *xhandle;
 	const char *prefix;
 	ssize_t prefix_len, len, rc;
 	int retry = 0;
@@ -998,10 +1000,10 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
 					goto out;
 			}
 		}
-		xhandle = xprefix_to_handler(xd->xprefix);
-		if (!xhandle || (xhandle->list && !xhandle->list(dentry)))
+
+		prefix = jffs2_xattr_prefix(xd->xprefix, dentry);
+		if (!prefix)
 			continue;
-		prefix = xhandle->prefix ?: xhandle->name;
 		prefix_len = strlen(prefix);
 		rc = prefix_len + xd->name_len + 1;
 

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
