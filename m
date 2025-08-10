Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2EACA0EC8
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTsowij9/PFcOmJsHeDnUMSxFLeHyS6gqL4dFFJ+t8s=; b=zjAJEekHZAkfmF
	58m+m2xyKhKDU8u84TVayEuHsWY70clOQKjyxcb5slkskIRecSy9te65ClD8brwvKrymOjn9ILc+W
	KcktQ3uA0QPIro162irdhAPfZjzaetTJEmgCgKuYWhS2APt/099BZ3Q9YPZJOXkZz5VIXtBKBKIPv
	5v1J5qLvHU9h8XdnbEr5/lJrJyEUCPZNlai7EQTJCh+sMhLJGjEkY9haAZzsFcEmpmQBnseNrtDAj
	K37sg/MALxGNe78ecv59vUt+EppnzfozG4tkNH117ejmuw3ewsRRvm9nFbyfrEzjM0rWeAESBqvBn
	ZNcLd6yoZMon3OXv1BXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yX-00000005QKf-1xDm;
	Sun, 10 Aug 2025 08:00:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yQ-00000005QE0-2l5L
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 08:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6880B45C5F;
	Sun, 10 Aug 2025 08:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0353DC4CEFB;
	Sun, 10 Aug 2025 08:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754812810;
	bh=bmB+BqOK47AQ74zOAlenVEXHIBC1qQuTYrDPLOSDJDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o3Ppu9lCK+UMIRCJ649FLlexF8zz+c5Fny3h+DogkpOBxxoTI+SD12otxBd4HJPGN
	 KrDlaO+YuVwOT5khIksO9p/0SHCSpmXkMAtaa9ZYhjNb+HopBdHl5Dgaq7wIamHvE4
	 Lx0RUvlNHg9683rs5qCfE6WCKJafDQIjyfimusDQPjsBQCFnURsh7M1PygjfbmsQsO
	 TcauGSZNJ/T+xRc3iJJaE+4/RX8mbkSg3olk0B9E8OMQ3IYEwZXXP7hfpdQCMrWXxi
	 v6M244Sk1mMSGGyYMPXvvqKBHDNMb/N2yOcxgbUKe/kBGuifA8XvEt1Ov4Sxny0gpD
	 tevQolZt9j7OA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org,
	linux-btrfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v5 06/13] ceph: move crypt info pointer to fs-specific part of inode
Date: Sun, 10 Aug 2025 00:56:59 -0700
Message-ID: <20250810075706.172910-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_010010_720575_A2889ACC 
X-CRM114-Status: GOOD (  10.54  )
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

Move the fscrypt_inode_info pointer into the filesystem-specific part of
the inode by adding the field ceph_inode_info::i_crypt_info and
configuring fscrypt_operations::inode_info_offs accordingly.

This is a prerequisite for a later commit that removes
inode::i_crypt_info, saving memory and improving cache efficiency with
filesystems that don't support fscrypt.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/ceph/crypto.c | 2 ++
 fs/ceph/inode.c  | 1 +
 fs/ceph/super.h  | 1 +
 3 files changed, 4 insertions(+)

diff --git a/fs/ceph/crypto.c b/fs/ceph/crypto.c
index cab7226192073..7026e794813ca 100644
--- a/fs/ceph/crypto.c
+++ b/fs/ceph/crypto.c
@@ -131,10 +131,12 @@ static const union fscrypt_policy *ceph_get_dummy_policy(struct super_block *sb)
 {
 	return ceph_sb_to_fs_client(sb)->fsc_dummy_enc_policy.policy;
 }
 
 static struct fscrypt_operations ceph_fscrypt_ops = {
+	.inode_info_offs	= (int)offsetof(struct ceph_inode_info, i_crypt_info) -
+				  (int)offsetof(struct ceph_inode_info, netfs.inode),
 	.needs_bounce_pages	= 1,
 	.get_context		= ceph_crypt_get_context,
 	.set_context		= ceph_crypt_set_context,
 	.get_dummy_policy	= ceph_get_dummy_policy,
 	.empty_dir		= ceph_crypt_empty_dir,
diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index fc543075b827a..480cb3a1d639a 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -663,10 +663,11 @@ struct inode *ceph_alloc_inode(struct super_block *sb)
 
 	INIT_WORK(&ci->i_work, ceph_inode_work);
 	ci->i_work_mask = 0;
 	memset(&ci->i_btime, '\0', sizeof(ci->i_btime));
 #ifdef CONFIG_FS_ENCRYPTION
+	ci->i_crypt_info = NULL;
 	ci->fscrypt_auth = NULL;
 	ci->fscrypt_auth_len = 0;
 #endif
 	return &ci->netfs.inode;
 }
diff --git a/fs/ceph/super.h b/fs/ceph/super.h
index cf176aab0f823..25d8bacbcf440 100644
--- a/fs/ceph/super.h
+++ b/fs/ceph/super.h
@@ -461,10 +461,11 @@ struct ceph_inode_info {
 
 	struct work_struct i_work;
 	unsigned long  i_work_mask;
 
 #ifdef CONFIG_FS_ENCRYPTION
+	struct fscrypt_inode_info *i_crypt_info;
 	u32 fscrypt_auth_len;
 	u32 fscrypt_file_len;
 	u8 *fscrypt_auth;
 	u8 *fscrypt_file;
 #endif
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
