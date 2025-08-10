Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92E9CA0ECA
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eSmlGlszv7WzAG5ovNzVYwBBV75xx6fvv2hOo2X7xMA=; b=wFealA9eYy9FkZ
	qd//ww15YlRgsNADk8fOyJP8av8z0J+zsRNsUNYmzFSAC5Lx6xyJB+GSlhQPY28Tq2n2MiIbLxMqL
	f/Z4cRpTc4ioZB15m5l7t115qlKqgg5yzseUHfxRlUZRz8QxVkp/NkjNqCsoTlJaUcnfXatkrDuIH
	hytWQf/ULx0hRiJ6SphHUu35Hhd9vlDVFGqmmgLiC9IHwUWzFgkpKx2uTkZ66U+Xz8m1pzChuI6b9
	93PsicIrYc8s7kGeklPYMVneTuwREMHp1/zW37ugMUD3Ayo08P8ZPbEctDZR4mCCEm8+3mD21quyP
	4641wlueZOE6devqIqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0ya-00000005QNK-1PN7;
	Sun, 10 Aug 2025 08:00:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yS-00000005QG0-1nGt
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 08:00:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA4825C5721;
	Sun, 10 Aug 2025 08:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFA2C4CEF0;
	Sun, 10 Aug 2025 08:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754812811;
	bh=0W2QfxH3SEgQE9yRuqSbCQDiVKMNeIT6t0Ume6h8gTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nbO0fBqNeeMZN0WDI+kgBFdzKJGAGVEHnaPJxNqqowTDLniJGOt0j4uw17U+6FdFo
	 H1Rc+/DvLZMsGO2D5fctgnRrjZXcK7So5ofrPTD2H2yqTs1twguCtFJ2JNW4cMPtPp
	 TrBjF8WHO/Fqi8b5bl1QcFjUuAV1wELwTmlaoVQa+YVbKZI//49bHAJwmSo25dwBt1
	 9Velrja88wsmjHCfWt9uhUSDzFuUBb8Ukug6Giba73mFWBZs8MnCbze0Ch6npBgJ7e
	 PSD9t23xAMkrpUHkqc+5V+32XM9Fgs/eeDPf3ADl5GWNi5DG2oJSS8jBlPWdvKu8/N
	 WR+Wmk3zLpjvA==
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
Subject: [PATCH v5 09/13] ext4: move verity info pointer to fs-specific part of inode
Date: Sun, 10 Aug 2025 00:57:02 -0700
Message-ID: <20250810075706.172910-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_010012_503371_9173ECBF 
X-CRM114-Status: GOOD (  11.38  )
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

Move the fsverity_info pointer into the filesystem-specific part of the
inode by adding the field ext4_inode_info::i_verity_info and configuring
fsverity_operations::inode_info_offs accordingly.

This is a prerequisite for a later commit that removes
inode::i_verity_info, saving memory and improving cache efficiency on
filesystems that don't support fsverity.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/ext4/ext4.h   | 4 ++++
 fs/ext4/super.c  | 3 +++
 fs/ext4/verity.c | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index c897109dadb15..6cb784a56b3ba 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1184,10 +1184,14 @@ struct ext4_inode_info {
 	kprojid_t i_projid;
 
 #ifdef CONFIG_FS_ENCRYPTION
 	struct fscrypt_inode_info *i_crypt_info;
 #endif
+
+#ifdef CONFIG_FS_VERITY
+	struct fsverity_info *i_verity_info;
+#endif
 };
 
 /*
  * File system states
  */
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 0c3059ecce37c..46138a6cb32a3 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1471,10 +1471,13 @@ static void init_once(void *foo)
 	inode_init_once(&ei->vfs_inode);
 	ext4_fc_init_inode(&ei->vfs_inode);
 #ifdef CONFIG_FS_ENCRYPTION
 	ei->i_crypt_info = NULL;
 #endif
+#ifdef CONFIG_FS_VERITY
+	ei->i_verity_info = NULL;
+#endif
 }
 
 static int __init init_inodecache(void)
 {
 	ext4_inode_cachep = kmem_cache_create_usercopy("ext4_inode_cache",
diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index d9203228ce979..b0acb0c503137 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -387,10 +387,12 @@ static int ext4_write_merkle_tree_block(struct inode *inode, const void *buf,
 
 	return pagecache_write(inode, buf, size, pos);
 }
 
 const struct fsverity_operations ext4_verityops = {
+	.inode_info_offs	= (int)offsetof(struct ext4_inode_info, i_verity_info) -
+				  (int)offsetof(struct ext4_inode_info, vfs_inode),
 	.begin_enable_verity	= ext4_begin_enable_verity,
 	.end_enable_verity	= ext4_end_enable_verity,
 	.get_verity_descriptor	= ext4_get_verity_descriptor,
 	.read_merkle_tree_page	= ext4_read_merkle_tree_page,
 	.write_merkle_tree_block = ext4_write_merkle_tree_block,
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
