Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE06C71155
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 02:23:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69EEE22206
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 02:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69EEE22206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vuHAw6dzy48tpw/nedSDzyG1lfpZhYk5rW2ctjSIeco=; b=Tutu4XgImUn47CtfTZIhWBAet
	lVU7ifT5KisyZlUlXWyTqhn4WkO7Hr9+BtV3lsaPb3E5gqCcVorKeyTYI0EkMJOAmQ1Up1JMQ5Dts
	i1GtF4meq6n3xjdMYgnbmiiZou0qh/kSvUezlMnpnZljBAdW2opw8fZk/sDOGWoJLm2zD7rvJmfV0
	ZJB/hcMW91eCPkLjdUi4n8rbSP1x+clRthMG7asGsq7PI2p9O8s09OU7nIpv2iWwo/bfLn6VKkMfB
	rxmnrlYokKqzrQ4Ex266hREDCwDl8kk1BfUOspehBbCHIEsPDb230H2C4qPOi96b0spiqXMEd/KzJ
	oo2+InXjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkeGt-0007CZ-C5; Thu, 03 Dec 2020 02:23:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkeGh-00078S-3S
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 02:22:54 +0000
From: Eric Biggers <ebiggers@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 8/9] fscrypt: unexport fscrypt_get_encryption_info()
Date: Wed,  2 Dec 2020 18:20:40 -0800
Message-Id: <20201203022041.230976-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203022041.230976-1-ebiggers@kernel.org>
References: <20201203022041.230976-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_212251_280304_21FC12BF 
X-CRM114-Status: GOOD (  11.10  )
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

Now that fscrypt_get_encryption_info() is only called from files in
fs/crypto/ (due to all key setup now being handled by higher-level
helper functions instead of directly by filesystems), unexport it and
move its declaration to fscrypt_private.h.

Reviewed-by: Andreas Dilger <adilger@dilger.ca>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h | 2 ++
 fs/crypto/keysetup.c        | 1 -
 include/linux/fscrypt.h     | 7 +------
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 16dd55080127a..c1c302656c345 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -571,6 +571,8 @@ int fscrypt_derive_dirhash_key(struct fscrypt_info *ci,
 void fscrypt_hash_inode_number(struct fscrypt_info *ci,
 			       const struct fscrypt_master_key *mk);
 
+int fscrypt_get_encryption_info(struct inode *inode);
+
 /**
  * fscrypt_require_key() - require an inode's encryption key
  * @inode: the inode we need the key for
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 50675b42d5b7c..6339b3069a400 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -589,7 +589,6 @@ int fscrypt_get_encryption_info(struct inode *inode)
 		res = 0;
 	return res;
 }
-EXPORT_SYMBOL(fscrypt_get_encryption_info);
 
 /**
  * fscrypt_prepare_new_inode() - prepare to create a new inode in a directory
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index a07610f279266..4b163f5e58e9f 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -75,7 +75,7 @@ struct fscrypt_operations {
 static inline struct fscrypt_info *fscrypt_get_info(const struct inode *inode)
 {
 	/*
-	 * Pairs with the cmpxchg_release() in fscrypt_get_encryption_info().
+	 * Pairs with the cmpxchg_release() in fscrypt_setup_encryption_info().
 	 * I.e., another task may publish ->i_crypt_info concurrently, executing
 	 * a RELEASE barrier.  We need to use smp_load_acquire() here to safely
 	 * ACQUIRE the memory the other task published.
@@ -200,7 +200,6 @@ int fscrypt_ioctl_remove_key_all_users(struct file *filp, void __user *arg);
 int fscrypt_ioctl_get_key_status(struct file *filp, void __user *arg);
 
 /* keysetup.c */
-int fscrypt_get_encryption_info(struct inode *inode);
 int fscrypt_prepare_new_inode(struct inode *dir, struct inode *inode,
 			      bool *encrypt_ret);
 void fscrypt_put_encryption_info(struct inode *inode);
@@ -408,10 +407,6 @@ static inline int fscrypt_ioctl_get_key_status(struct file *filp,
 }
 
 /* keysetup.c */
-static inline int fscrypt_get_encryption_info(struct inode *inode)
-{
-	return -EOPNOTSUPP;
-}
 
 static inline int fscrypt_prepare_new_inode(struct inode *dir,
 					    struct inode *inode,
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
