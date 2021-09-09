Return-Path: <SRS0=lC14=N7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A81C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Sep 2021 18:46:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FAE2606A5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Sep 2021 18:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FAE2606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FR6fpJZmXRpFLViLCJ0dOhoL8+DYlzCnTmi81Ekj0qw=; b=Tn3VZx1Uj8J9jg
	MM7k5bbpFWus2jGlCzoOqs1GKFtP+kZ/eKktKck8Zr6vAckvd6IqEYj4E4ZMb2pIzdCb/b/hiwsua
	K0qDLuZETVjzHd7GghYmMUJ2edStoOWldcliWuHQyjdpkx37Vr0a5GeFmH962bL+1Vei3qamPFc8K
	TEqIG4NzIWCUgShiTHlk5b2yWKqtiyHk3eFJFD5cbHFtcO4XhsvN6TGX3diVnxSKs6HzrTRjl/fkE
	VOMn8UvnTF8MNkijcfRulBb9+lThxmpgJSphHad8AFW8UW7pR5IQSpN2AUvGyt4igMAl8a3VkxwvK
	uU8kxtOdVe9qaGgZZcPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOP3O-00Ada5-5a; Thu, 09 Sep 2021 18:45:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOP3L-00AdZm-JO
 for linux-mtd@lists.infradead.org; Thu, 09 Sep 2021 18:45:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE7B8610CE;
 Thu,  9 Sep 2021 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631213139;
 bh=aoyQEZvSd1+vYy9qkBjguGDggRTI0dLHoK9hq7Mx2yY=;
 h=From:To:Cc:Subject:Date:From;
 b=KXvkGpIrxCmJIdH1Km0g/8dgNjJHNKJJjqP5enlPVfhL+RYlDftQ7viPPIy8THpR8
 quKG2AnonGHE5r2rhH8iPJejTdvE+0/IKAS0AlZTE67DfWfmStoSo1STy0uhp3O/3J
 WzJBeoe1XtOeeVT+d4oRzrcQ82eexPguYWwiRLqDzRxQ4LQqnZ2m9Ag3wmcOquaCWs
 POCb9PUcH+dYTMwRwMYHI81XtGSSfr9/S5+/s63PsGqNWuoW0q+O6HTBPmUYgojO3i
 fQEADAswkp/rtccTS8vLlJ49dNtxGcC8gtcM5JdR1CWyxizM4p2g65XnKOJp5rMYZ8
 SANHIGYjwBAVA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org
Subject: [PATCH] fscrypt: remove fscrypt_operations::max_namelen
Date: Thu,  9 Sep 2021 11:45:13 -0700
Message-Id: <20210909184513.139281-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_114539_712982_40261AAB 
X-CRM114-Status: GOOD (  11.67  )
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

From: Eric Biggers <ebiggers@google.com>

The max_namelen field is unnecessary, as it is set to 255 (NAME_MAX) on
all filesystems that support fscrypt (or plan to support fscrypt).  For
simplicity, just use NAME_MAX directly instead.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fname.c       | 3 +--
 fs/ext4/super.c         | 1 -
 fs/f2fs/super.c         | 1 -
 fs/ubifs/crypto.c       | 1 -
 include/linux/fscrypt.h | 3 ---
 5 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index eb538c28df940..a9be4bc74a94a 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -429,8 +429,7 @@ int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
 
 	if (fscrypt_has_encryption_key(dir)) {
 		if (!fscrypt_fname_encrypted_size(&dir->i_crypt_info->ci_policy,
-						  iname->len,
-						  dir->i_sb->s_cop->max_namelen,
+						  iname->len, NAME_MAX,
 						  &fname->crypto_buf.len))
 			return -ENAMETOOLONG;
 		fname->crypto_buf.name = kmalloc(fname->crypto_buf.len,
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 136940af00b88..47212d7c02b84 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1566,7 +1566,6 @@ static const struct fscrypt_operations ext4_cryptops = {
 	.set_context		= ext4_set_context,
 	.get_dummy_policy	= ext4_get_dummy_policy,
 	.empty_dir		= ext4_empty_dir,
-	.max_namelen		= EXT4_NAME_LEN,
 	.has_stable_inodes	= ext4_has_stable_inodes,
 	.get_ino_and_lblk_bits	= ext4_get_ino_and_lblk_bits,
 };
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78ebc306ee2b5..cf049a042482b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2976,7 +2976,6 @@ static const struct fscrypt_operations f2fs_cryptops = {
 	.set_context		= f2fs_set_context,
 	.get_dummy_policy	= f2fs_get_dummy_policy,
 	.empty_dir		= f2fs_empty_dir,
-	.max_namelen		= F2FS_NAME_LEN,
 	.has_stable_inodes	= f2fs_has_stable_inodes,
 	.get_ino_and_lblk_bits	= f2fs_get_ino_and_lblk_bits,
 	.get_num_devices	= f2fs_get_num_devices,
diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index 22be7aeb96c4f..c57b46a352d8f 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -82,5 +82,4 @@ const struct fscrypt_operations ubifs_crypt_operations = {
 	.get_context		= ubifs_crypt_get_context,
 	.set_context		= ubifs_crypt_set_context,
 	.empty_dir		= ubifs_crypt_empty_dir,
-	.max_namelen		= UBIFS_MAX_NLEN,
 };
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index e912ed9141d9d..91ea9477e9bd2 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -118,9 +118,6 @@ struct fscrypt_operations {
 	 */
 	bool (*empty_dir)(struct inode *inode);
 
-	/* The filesystem's maximum ciphertext filename length, in bytes */
-	unsigned int max_namelen;
-
 	/*
 	 * Check whether the filesystem's inode numbers and UUID are stable,
 	 * meaning that they will never be changed even by offline operations
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
