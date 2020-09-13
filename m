Return-Path: <SRS0=DhJx=CW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC98C2D0E1
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 08:39:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DEC7207C3
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 08:39:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r/x7pSsr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUtAxnwO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DEC7207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JWq8WAnCS+FI5oiIL1nr7IJvV++ekS/aUAL+29/PEos=; b=r/x7pSsrxgQUDi38IAzXYEYCw
	8QQj9E8FH2zFkx7CrxISXZiZeUVL8kgZ9UtZLaBcBxSXFOyTCqoqPxM5NylzMBGXIbl/dhWpOWHgy
	WWT+1YuaNQZXE59oAbgCsWxo3HtE8Qg7EPn+YQydWVYoX9qSQ5zOBtVSNz6Qc2/bBIGuKcz2T9HYd
	MLqpXZFS5ow8r2K81g6VW8v1xOJJe5ULLTvrW/wT/m/Cd4b0bSJkLJrEXUmn5JDiw9agcdXlOaxNT
	FXvLlddZw1R0awi4N17eFeNTpMWgeQWKMqZAvmaPfCOP1CfvETiJ8eqooHlRqCGKyzZ0kJJ8Kw1VO
	OCa1dCXOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHNWc-00014Y-4g; Sun, 13 Sep 2020 08:38:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHNWN-000104-13
 for linux-mtd@lists.infradead.org; Sun, 13 Sep 2020 08:38:06 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 668D421D1A;
 Sun, 13 Sep 2020 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599986279;
 bh=QcAYVOOtDATZpIRqzv/LkDypHnDI6SB1ZfPpGvjEMKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oUtAxnwOQeM7Dr2kgVlV4dfly4HkPpXojureiWqD3KugJJtonikaBJ/0WmS3mzwuK
 qMm4vt2DVIHEOZTV+hdqzAxhm6zjVO48B+OZgoviTP4C8OaMEwnUsQFSxeKIaiKp0X
 OfnRS1CorFgwModQHk4r5wqxh3MkMjhLTDRNgh6Y=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 06/11] fscrypt: remove fscrypt_inherit_context()
Date: Sun, 13 Sep 2020 01:36:15 -0700
Message-Id: <20200913083620.170627-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200913083620.170627-1-ebiggers@kernel.org>
References: <20200913083620.170627-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_043803_244245_4341E49E 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Now that all filesystems have been converted to use
fscrypt_prepare_new_inode() and fscrypt_set_context(),
fscrypt_inherit_context() is no longer used.  Remove it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/policy.c      | 37 -------------------------------------
 include/linux/fscrypt.h |  9 ---------
 2 files changed, 46 deletions(-)

diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 7e96953d385ec..4ff893f7b030a 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -628,43 +628,6 @@ int fscrypt_has_permitted_context(struct inode *parent, struct inode *child)
 }
 EXPORT_SYMBOL(fscrypt_has_permitted_context);
 
-/**
- * fscrypt_inherit_context() - Sets a child context from its parent
- * @parent: Parent inode from which the context is inherited.
- * @child:  Child inode that inherits the context from @parent.
- * @fs_data:  private data given by FS.
- * @preload:  preload child i_crypt_info if true
- *
- * Return: 0 on success, -errno on failure
- */
-int fscrypt_inherit_context(struct inode *parent, struct inode *child,
-						void *fs_data, bool preload)
-{
-	u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
-	union fscrypt_context ctx;
-	int ctxsize;
-	struct fscrypt_info *ci;
-	int res;
-
-	res = fscrypt_get_encryption_info(parent);
-	if (res < 0)
-		return res;
-
-	ci = fscrypt_get_info(parent);
-	if (ci == NULL)
-		return -ENOKEY;
-
-	get_random_bytes(nonce, FSCRYPT_FILE_NONCE_SIZE);
-	ctxsize = fscrypt_new_context(&ctx, &ci->ci_policy, nonce);
-
-	BUILD_BUG_ON(sizeof(ctx) != FSCRYPT_SET_CONTEXT_MAX_SIZE);
-	res = parent->i_sb->s_cop->set_context(child, &ctx, ctxsize, fs_data);
-	if (res)
-		return res;
-	return preload ? fscrypt_get_encryption_info(child): 0;
-}
-EXPORT_SYMBOL(fscrypt_inherit_context);
-
 /**
  * fscrypt_set_context() - Set the fscrypt context of a new inode
  * @inode: a new inode
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 9cf7ca90f3abb..81d6ded243288 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -156,8 +156,6 @@ int fscrypt_ioctl_get_policy(struct file *filp, void __user *arg);
 int fscrypt_ioctl_get_policy_ex(struct file *filp, void __user *arg);
 int fscrypt_ioctl_get_nonce(struct file *filp, void __user *arg);
 int fscrypt_has_permitted_context(struct inode *parent, struct inode *child);
-int fscrypt_inherit_context(struct inode *parent, struct inode *child,
-			    void *fs_data, bool preload);
 int fscrypt_set_context(struct inode *inode, void *fs_data);
 
 struct fscrypt_dummy_context {
@@ -343,13 +341,6 @@ static inline int fscrypt_has_permitted_context(struct inode *parent,
 	return 0;
 }
 
-static inline int fscrypt_inherit_context(struct inode *parent,
-					  struct inode *child,
-					  void *fs_data, bool preload)
-{
-	return -EOPNOTSUPP;
-}
-
 static inline int fscrypt_set_context(struct inode *inode, void *fs_data)
 {
 	return -EOPNOTSUPP;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
