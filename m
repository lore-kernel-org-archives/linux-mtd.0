Return-Path: <SRS0=af1s=RU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B244C43381
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Mar 2019 20:08:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC5920896
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Mar 2019 20:08:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tqrA9NpZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iihmcneD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBC5920896
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nwZF1tsPQ96Z2D7CQ/jwpt1p3peSkikvfc7bYAXw7s=; b=tqrA9NpZo8I6r+
	Idx+GuI1StzZuBET5LmYn1bazVBrbywOkgp1DIFvSGjjP9mGLBtgFBal3Eh4oZm+4taT0cA/lprxL
	8+2bQGp7RSW0qtSDFhhkWwA5HVT9yKWHQPny25o709N/sLkxY37tdOiAkulmmkmHCtyeEWO7Vt1Aw
	ujcXQhfHjGAoEaWcdBt+VjcTVWrtttuJm6hBwdSqd7PT6FG18o0LEupvSa6PMS2TsQKRszkf8yDar
	1rjWY4+vBkIF7L7csMlmoAzmR4++e4IJG5iIJsl94LXJQSnX/lA7xofjyP4fHHigreIEw2VQ7ELn+
	W9ZNpgQ1Y36/pPmlkKgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5c4l-0004c1-SV; Sun, 17 Mar 2019 20:08:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5c3u-0003g8-3x
 for linux-mtd@lists.infradead.org; Sun, 17 Mar 2019 20:07:16 +0000
Received: from sol.localdomain (c-107-3-167-184.hsd1.ca.comcast.net
 [107.3.167.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42A2521741;
 Sun, 17 Mar 2019 20:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1552853233;
 bh=z+KQUUBIqy7fby+Bsr0TJzflcgCUzE4USn8oAT7n/ao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iihmcneDfnodYkTF4M5zZdEwLyhDiqRuudGSDDw9hCD2fAIaZTZ3S13qW0OEzbAvw
 PqPRcAXZz2j1E9vx9B3hfABRax/ClkiAn53iQtTjXbBChulH5mWk7FleonETWHBpz+
 KTMq46ikY3c/zEQiHsR12xZJC2epfZIDEXTnmXdY=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH 2/5] fscrypt: fix race allowing rename() and link() of
 ciphertext dentries
Date: Sun, 17 Mar 2019 13:04:41 -0700
Message-Id: <20190317200444.5967-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190317200444.5967-1-ebiggers@kernel.org>
References: <20190317200444.5967-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190317_130714_402698_0BB5000F 
X-CRM114-Status: GOOD (  12.37  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Gao Xiang <gaoxiang25@huawei.com>, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Sarthak Kukreti <sarthakkukreti@chromium.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Close some race conditions where fscrypt allowed rename() and link() on
ciphertext dentries that had been looked up just prior to the key being
concurrently added.  It's better to return -ENOKEY in this case.

This avoids doing the nonsensical thing of encrypting the names a second
time when searching for the actual on-disk dir entries.  It also
guarantees that DCACHE_ENCRYPTED_NAME dentries are never rename()d, so
the dcache won't have support all possible combinations of moving
DCACHE_ENCRYPTED_NAME around during __d_move().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/hooks.c       | 12 +++++++++++-
 include/linux/fscrypt.h |  9 +++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index a9492f75bbe1..2e7498a821a4 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -49,7 +49,8 @@ int fscrypt_file_open(struct inode *inode, struct file *filp)
 }
 EXPORT_SYMBOL_GPL(fscrypt_file_open);
 
-int __fscrypt_prepare_link(struct inode *inode, struct inode *dir)
+int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
+			   struct dentry *dentry)
 {
 	int err;
 
@@ -57,6 +58,10 @@ int __fscrypt_prepare_link(struct inode *inode, struct inode *dir)
 	if (err)
 		return err;
 
+	/* ... in case we looked up ciphertext name before key was added */
+	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME)
+		return -ENOKEY;
+
 	if (!fscrypt_has_permitted_context(dir, inode))
 		return -EXDEV;
 
@@ -78,6 +83,11 @@ int __fscrypt_prepare_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (err)
 		return err;
 
+	/* ... in case we looked up ciphertext name(s) before key was added */
+	if ((old_dentry->d_flags | new_dentry->d_flags) &
+	    DCACHE_ENCRYPTED_NAME)
+		return -ENOKEY;
+
 	if (old_dir != new_dir) {
 		if (IS_ENCRYPTED(new_dir) &&
 		    !fscrypt_has_permitted_context(new_dir,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 5a0c3fee1ea2..4ad7a856e0f1 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -214,7 +214,8 @@ extern int fscrypt_zeroout_range(const struct inode *, pgoff_t, sector_t,
 
 /* hooks.c */
 extern int fscrypt_file_open(struct inode *inode, struct file *filp);
-extern int __fscrypt_prepare_link(struct inode *inode, struct inode *dir);
+extern int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
+				  struct dentry *dentry);
 extern int __fscrypt_prepare_rename(struct inode *old_dir,
 				    struct dentry *old_dentry,
 				    struct inode *new_dir,
@@ -401,8 +402,8 @@ static inline int fscrypt_file_open(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-static inline int __fscrypt_prepare_link(struct inode *inode,
-					 struct inode *dir)
+static inline int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
+					 struct dentry *dentry)
 {
 	return -EOPNOTSUPP;
 }
@@ -497,7 +498,7 @@ static inline int fscrypt_prepare_link(struct dentry *old_dentry,
 				       struct dentry *dentry)
 {
 	if (IS_ENCRYPTED(dir))
-		return __fscrypt_prepare_link(d_inode(old_dentry), dir);
+		return __fscrypt_prepare_link(d_inode(old_dentry), dir, dentry);
 	return 0;
 }
 
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
