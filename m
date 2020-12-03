Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB446C71156
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 02:23:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18F2022201
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 02:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18F2022201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AiZd4melL8ETHuy3tAYpNOdfkg4Rp9p4AaVNKUUML4c=; b=vWTvgnVC1kpbiSWXAbnw5X69I
	GefnN3RVdNUrwzgx+jGw8BZklW6u7ddHyNXuc2U3gXaDyLYG7Y8iLM6wPyVKvZBsW4M/wcoGUq9eD
	ODOyX/pubFLwKPUstgQ/CuFAX2fjzs2KoZwoN1QDPib2exeyS0qAsLRw73f5SimLam89j0rT5Xm2/
	nbVgLdPTrapAWIJOKz7dXccQlsykwFFS2AIrEH5rOCAp079CYldRyehe1Z9rElzA0gnSRssF2S+6D
	Gh1nrptYFjoooNwtoD5XzRLYkD/WUIkqtHNJokwu3iLF/A/maudGnL3s5Uaq0G62dxKRGNJ9xw3ut
	5P8+7IJqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkeGv-0007D7-KZ; Thu, 03 Dec 2020 02:23:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkeGg-00078P-Cv
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 02:22:54 +0000
From: Eric Biggers <ebiggers@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 6/9] fscrypt: move body of fscrypt_prepare_setattr()
 out-of-line
Date: Wed,  2 Dec 2020 18:20:38 -0800
Message-Id: <20201203022041.230976-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203022041.230976-1-ebiggers@kernel.org>
References: <20201203022041.230976-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_212250_782561_0A8B97F7 
X-CRM114-Status: GOOD (  12.15  )
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
Cc: linux-fsdevel@vger.kernel.org, Andreas Dilger <adilger@dilger.ca>,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

In preparation for reducing the visibility of fscrypt_require_key() by
moving it to fscrypt_private.h, move the call to it from
fscrypt_prepare_setattr() to an out-of-line function.

Reviewed-by: Andreas Dilger <adilger@dilger.ca>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/hooks.c       |  8 ++++++++
 include/linux/fscrypt.h | 11 +++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 82f351d3113ac..1c16dba222d95 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -120,6 +120,14 @@ int __fscrypt_prepare_readdir(struct inode *dir)
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_readdir);
 
+int __fscrypt_prepare_setattr(struct dentry *dentry, struct iattr *attr)
+{
+	if (attr->ia_valid & ATTR_SIZE)
+		return fscrypt_require_key(d_inode(dentry));
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
+
 /**
  * fscrypt_prepare_setflags() - prepare to change flags with FS_IOC_SETFLAGS
  * @inode: the inode on which flags are being changed
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 8cbb26f556952..b20900bb829fc 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -243,6 +243,7 @@ int __fscrypt_prepare_rename(struct inode *old_dir, struct dentry *old_dentry,
 int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 			     struct fscrypt_name *fname);
 int __fscrypt_prepare_readdir(struct inode *dir);
+int __fscrypt_prepare_setattr(struct dentry *dentry, struct iattr *attr);
 int fscrypt_prepare_setflags(struct inode *inode,
 			     unsigned int oldflags, unsigned int flags);
 int fscrypt_prepare_symlink(struct inode *dir, const char *target,
@@ -543,6 +544,12 @@ static inline int __fscrypt_prepare_readdir(struct inode *dir)
 	return -EOPNOTSUPP;
 }
 
+static inline int __fscrypt_prepare_setattr(struct dentry *dentry,
+					    struct iattr *attr)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int fscrypt_prepare_setflags(struct inode *inode,
 					   unsigned int oldflags,
 					   unsigned int flags)
@@ -840,8 +847,8 @@ static inline int fscrypt_prepare_readdir(struct inode *dir)
 static inline int fscrypt_prepare_setattr(struct dentry *dentry,
 					  struct iattr *attr)
 {
-	if (attr->ia_valid & ATTR_SIZE)
-		return fscrypt_require_key(d_inode(dentry));
+	if (IS_ENCRYPTED(d_inode(dentry)))
+		return __fscrypt_prepare_setattr(dentry, attr);
 	return 0;
 }
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
