Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E972CA0ECC
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 08:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gjuWKU2SLWCTt3NTvkmFjGFOeIuJh8QC0DC7aoPZvQ=; b=PC3Tj+6XmLaDxL
	cHgiBNu6IqbbqUM4v41KKPefN4pJecaqvzNJnAr6cVx7cli/0D39YTKbXpsbpw0XYmk2iNfo7FLDh
	t1DrR7C7v6TkUMpyvsukA0vYmbgLf+Sh03rTSg6hSAkRP85b15fDGrec/gDHD/DDKlq46ZFETImzB
	Bdqv8tfvQGKX1UCQjpdDh2/CJQ7ozXDSMGHrQ95RJ0tHiO3Z3H4VlV6FDCB5WJEVHoY6gb9DX05Rq
	kVA17n5GldOzYZlV3B4B47m2gpjW9H8cyG3F15iMsMUzwpAbgcy2GwfrbZ3sj0ZTCgQiJ2IKL3wr/
	Ov1mxt3q6JCQL+oTtlxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0ya-00000005QNh-3kPo;
	Sun, 10 Aug 2025 08:00:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yT-00000005QH9-0Kkb
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 08:00:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0C4945C74;
	Sun, 10 Aug 2025 08:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3376CC19421;
	Sun, 10 Aug 2025 08:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754812812;
	bh=uSWAqJvL/RiAtfpBphLEdbPpxmsErLOL7QyUHYYHGg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dvISGINgSttzGx8S1Yo6P0RNV1i2csXZr4uItP+Yiv8ictOEXawreDSudyFW5/fK3
	 TrwPhv1wyy4MawAWSn2oSte2ZGC1l5i5yo6Jtv2FSBFQ/p2zYBEF9QutXIQiBecGmi
	 JpxfpZIcybAHf26NvHx6M0iOxLRcc/g0TGocFP8mTe0GO5rP4SutVwcgL3p8EGl4uN
	 qUS2D/z/OLXWkHCjIv8gzAGFAcRuZoAivquHz1RBh847/S+SFMxhbYwiwFbk45SmQS
	 bBQlYp+rFGlZeRYHd59Wsn6XV4FG+gZ/PDxO+U3ame2WBmS/tDBEH2Tz1E4UFj/ith
	 d3raZqdhdM4RQ==
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
Subject: [PATCH v5 11/13] btrfs: move verity info pointer to fs-specific part of inode
Date: Sun, 10 Aug 2025 00:57:04 -0700
Message-ID: <20250810075706.172910-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_010013_185970_2FA35987 
X-CRM114-Status: GOOD (  11.54  )
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
inode by adding the field btrfs_inode::i_verity_info and configuring
fsverity_operations::inode_info_offs accordingly.

This is a prerequisite for a later commit that removes
inode::i_verity_info, saving memory and improving cache efficiency on
filesystems that don't support fsverity.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/btrfs/btrfs_inode.h | 5 +++++
 fs/btrfs/inode.c       | 3 +++
 fs/btrfs/verity.c      | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/fs/btrfs/btrfs_inode.h b/fs/btrfs/btrfs_inode.h
index b99fb02732929..2c9489497cbea 100644
--- a/fs/btrfs/btrfs_inode.h
+++ b/fs/btrfs/btrfs_inode.h
@@ -336,10 +336,15 @@ struct btrfs_inode {
 
 	/* Hook into fs_info->delayed_iputs */
 	struct list_head delayed_iput;
 
 	struct rw_semaphore i_mmap_lock;
+
+#ifdef CONFIG_FS_VERITY
+	struct fsverity_info *i_verity_info;
+#endif
+
 	struct inode vfs_inode;
 };
 
 static inline u64 btrfs_get_first_dir_index_to_log(const struct btrfs_inode *inode)
 {
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index b77dd22b8cdbe..de722b232ec14 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -7959,10 +7959,13 @@ int btrfs_drop_inode(struct inode *inode)
 static void init_once(void *foo)
 {
 	struct btrfs_inode *ei = foo;
 
 	inode_init_once(&ei->vfs_inode);
+#ifdef CONFIG_FS_VERITY
+	ei->i_verity_info = NULL;
+#endif
 }
 
 void __cold btrfs_destroy_cachep(void)
 {
 	/*
diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
index b7a96a005487e..4633cbcfcdb90 100644
--- a/fs/btrfs/verity.c
+++ b/fs/btrfs/verity.c
@@ -800,10 +800,12 @@ static int btrfs_write_merkle_tree_block(struct inode *inode, const void *buf,
 	return write_key_bytes(BTRFS_I(inode), BTRFS_VERITY_MERKLE_ITEM_KEY,
 			       pos, buf, size);
 }
 
 const struct fsverity_operations btrfs_verityops = {
+	.inode_info_offs         = (int)offsetof(struct btrfs_inode, i_verity_info) -
+				   (int)offsetof(struct btrfs_inode, vfs_inode),
 	.begin_enable_verity     = btrfs_begin_enable_verity,
 	.end_enable_verity       = btrfs_end_enable_verity,
 	.get_verity_descriptor   = btrfs_get_verity_descriptor,
 	.read_merkle_tree_page   = btrfs_read_merkle_tree_page,
 	.write_merkle_tree_block = btrfs_write_merkle_tree_block,
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
