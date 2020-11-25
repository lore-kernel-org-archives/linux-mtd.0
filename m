Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7CDC56202
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 00:25:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB33F2151B
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 00:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eas+8/hK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Or7jtegO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB33F2151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Ef0JMc7NYuGTioIxlrMtRvhZxZWFoiRIPYUegb37ss=; b=Eas+8/hKbgLs4lDxiRARtQ5V1
	W8QiChUmE8F8pFMP8+Vqq+S+mTN5209Gj4gX9EZunQEqPRq6I/l5Eshu4N25yIRRwksb6mpv8i8cf
	QfVE6hYIeWAjj4egW2m3eUVCEK/GYu4TQRhq5wL8oov9+4vLyx+7/VD6HtRQsfmlxDWb5A3NRyBRy
	/neQzfwgHY08pf3Jl+hDCR3k7HuA174NZTRzMaXHWrRJVIacfHDwdeHgcLNSq8v8WBle8UnuQ8n+b
	ujG4zQmcFEl06woKtwHhYqf1SKCxbWqCTef1LjRRJa6uqUhD+T7DPrk/QsmE6HeB5InYJv/bvHpE6
	vOM3ykhsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khicQ-0001bJ-Or; Wed, 25 Nov 2020 00:25:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khic4-0001Te-Me
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 00:24:51 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48A7121734;
 Wed, 25 Nov 2020 00:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606263887;
 bh=GcIDgPOioF2enf4UU7puDpYrUGLkFezb8sSeAZk5UsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Or7jtegODYCPin3wnbGFqeaYo4hDY+OxiIiEAowN8CUBQ6bTDLf73iBgbHeyhFqjL
 NJcr+qxkJUxfy0EFiF5xdWTVIQE7rXw2wp0AnOyphxIZU1Z9HuAxERl6pSDZ4ZBlzu
 g5BYjw6/bP+k+SA7ND0XOIPbOngJ56i2VNYOop9w=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH 6/9] fscrypt: move body of fscrypt_prepare_setattr()
 out-of-line
Date: Tue, 24 Nov 2020 16:23:33 -0800
Message-Id: <20201125002336.274045-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125002336.274045-1-ebiggers@kernel.org>
References: <20201125002336.274045-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_192448_908534_394DA697 
X-CRM114-Status: GOOD (  16.13  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

In preparation for reducing the visibility of fscrypt_require_key() by
moving it to fscrypt_private.h, move the call to it from
fscrypt_prepare_setattr() to an out-of-line function.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/hooks.c       |  8 ++++++++
 include/linux/fscrypt.h | 11 +++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 82f351d3113a..1c16dba222d9 100644
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
index 8cbb26f55695..b20900bb829f 100644
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
