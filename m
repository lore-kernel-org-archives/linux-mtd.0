Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2125FCA0EC1
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 08:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWG1nlt5RGVUpN6EMOcargxwDhkZ/+aEOr5/WNdt0Ig=; b=LJXFU9ltpa8afV
	lx0fmClbE5qomWurtKFlzAC9I6JVobQTX/DcluyGkNTLosVLxUPT3tQbvd6wT+k5Eb30gy6zL9QQN
	Q3hotVo7M0IXil/ExhLoRUf5JG4Vp2rsGKEmey6owduMtByc/dQp96UnmVuq4nfJQFKBjxWWxNVBd
	PFYpdE6dMeN9xi3GVg3RcdKYdIUWU8b+YwnNYU6R35hTEkYXa7+naHCtjpeZf+SYpGKX5tDyzqfwk
	AZmggFAPis+DD9Xq0ppHb34qsQULiN9mOeH06bngk0MI+Cwfc0tA/A/PkSUSKZXm6ZHrVlfVokSYK
	v80qsIAfUE78eoLZYotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yb-00000005QOu-3snF;
	Sun, 10 Aug 2025 08:00:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yV-00000005QIh-0kYR
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 08:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9B82613AE;
	Sun, 10 Aug 2025 08:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2C7C4CEF9;
	Sun, 10 Aug 2025 08:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754812812;
	bh=mAk2HuPLK15i8Ku+xAc7HePI/XnULAPP/YM3x9265tc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rqdcDpAJoSITR9lcMi9rlgGgii+Fo12miTFMisZBALLfiW83XRzb99WcY11e9R1JD
	 WeC0crLpN370pkZOLTdGtu23gELfMSDcGRhPaANxbgwBfCOvNFm6D7ZsONCOCe3VOK
	 rUBV4j1Rp0yBAc5FpGToXFDIVEd3qeu0NRivNT+KOyxmLtdL5ZaRz38uzC/FfzYw7l
	 l2bhPafvNTlsflkyOGHdI20ETqliyQ6oOSmIxUcgCQ2DsVt4WpC6NCxQAMWZAgdtx2
	 4YB1bMU10EdiocZzGg+uwT/kwQ64HeB5Mt7XSptyLK5vU9hctWLtl+zK0ag2BP1JLj
	 93jGZQmovo8rQ==
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
Subject: [PATCH v5 10/13] f2fs: move verity info pointer to fs-specific part of inode
Date: Sun, 10 Aug 2025 00:57:03 -0700
Message-ID: <20250810075706.172910-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
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
inode by adding the field f2fs_inode_info::i_verity_info and configuring
fsverity_operations::inode_info_offs accordingly.

This is a prerequisite for a later commit that removes
inode::i_verity_info, saving memory and improving cache efficiency on
filesystems that don't support fsverity.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/f2fs/f2fs.h   | 3 +++
 fs/f2fs/super.c  | 3 +++
 fs/f2fs/verity.c | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2f5c30c069c3c..6e465bbc85ee5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -908,10 +908,13 @@ struct f2fs_inode_info {
 	unsigned int atomic_write_cnt;
 	loff_t original_i_size;		/* original i_size before atomic write */
 #ifdef CONFIG_FS_ENCRYPTION
 	struct fscrypt_inode_info *i_crypt_info; /* filesystem encryption info */
 #endif
+#ifdef CONFIG_FS_VERITY
+	struct fsverity_info *i_verity_info; /* filesystem verity info */
+#endif
 };
 
 static inline void get_read_extent_info(struct extent_info *ext,
 					struct f2fs_extent *i_ext)
 {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b42b55280d9e3..1db024b20e29b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -481,10 +481,13 @@ static void init_once(void *foo)
 
 	inode_init_once(&fi->vfs_inode);
 #ifdef CONFIG_FS_ENCRYPTION
 	fi->i_crypt_info = NULL;
 #endif
+#ifdef CONFIG_FS_VERITY
+	fi->i_verity_info = NULL;
+#endif
 }
 
 #ifdef CONFIG_QUOTA
 static const char * const quotatypes[] = INITQFNAMES;
 #define QTYPE2NAME(t) (quotatypes[t])
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 2287f238ae09e..f0ab9a3c7a82b 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -285,10 +285,12 @@ static int f2fs_write_merkle_tree_block(struct inode *inode, const void *buf,
 
 	return pagecache_write(inode, buf, size, pos);
 }
 
 const struct fsverity_operations f2fs_verityops = {
+	.inode_info_offs	= (int)offsetof(struct f2fs_inode_info, i_verity_info) -
+				  (int)offsetof(struct f2fs_inode_info, vfs_inode),
 	.begin_enable_verity	= f2fs_begin_enable_verity,
 	.end_enable_verity	= f2fs_end_enable_verity,
 	.get_verity_descriptor	= f2fs_get_verity_descriptor,
 	.read_merkle_tree_page	= f2fs_read_merkle_tree_page,
 	.write_merkle_tree_block = f2fs_write_merkle_tree_block,
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
