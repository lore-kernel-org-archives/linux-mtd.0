Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A21CCA0EC5
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ih3HMb6MCAXIP1NvaCgPOk7MDI4aEOQdbREItslfRI4=; b=4Rp0y9DdvVEAKQ
	+lCaDrIwsmxQfKWNEhj6RlEbhA9XSA2s3zfHGUfZLmeIjeSNGCaKg0sUgVSRAdYIMV5kx5FHqWWyy
	rQj5ah7KqTA2+lNfSFwbS/9JtU+btaCikqOtzs6z7oRusW+VDFZe9rX3CX+3jWX4ONYKr7kwLrxdw
	5NWt1QQchKFTOJels4aYb4MkcnHl29mln/VqO0iG8fGQxJG2VykdC9blqpu3vNTh3rWwDrU2gpy/6
	m/Ok7hP0yuuGEHtvxFyuqVNdV7r8CDWtdxZFwkz1FY/cMvqqYnu9aJXepRXiU6cuRQh+5ThwcW+L6
	rTHALjqY+qxClSTAZrmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yU-00000005QIk-30Mf;
	Sun, 10 Aug 2025 08:00:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yQ-00000005QDu-2Arb
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 08:00:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8528245C60;
	Sun, 10 Aug 2025 08:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C70C4CEF8;
	Sun, 10 Aug 2025 08:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754812809;
	bh=Dg7N4Yxhd1Q0fVMr+QNgQgiF2vNBJPVNwSrIaGVuBhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VEb0L+26rIN6EuClQPwD6XWh/x1ogGk1gHqNfKeABEaGso81WskiRPvahQXrAuCOZ
	 w2k9gwPcM4MVzy2Xtu93ICIZqwGAZiFUmW03irgpEFgGPONzVBlgA6iWwZdW2VAjvp
	 ckA/LCdmP5MZbWj/9vUZG482qZtgY9xS1gsOTEm/SHQJRHZ0jQf5v0AOB5kVLhzAr5
	 SOjntj25+qR6WW2NoRSLMXpdEylk+m4qP1c0l4gHM7T7zu0GwfPp1aBhPwApR2RcmI
	 cIXrdjVQsfxC0fsbYUTOYO6xUsGL+VNBvyFbKBM5ODIr83OGKk7cOz9+EyNoG4ihpm
	 vskpt49wZ+FMw==
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
Subject: [PATCH v5 04/13] f2fs: move crypt info pointer to fs-specific part of inode
Date: Sun, 10 Aug 2025 00:56:57 -0700
Message-ID: <20250810075706.172910-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_010010_601258_03AA27CE 
X-CRM114-Status: GOOD (  13.34  )
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
the inode by adding the field f2fs_inode_info::i_crypt_info and
configuring fscrypt_operations::inode_info_offs accordingly.

This is a prerequisite for a later commit that removes
inode::i_crypt_info, saving memory and improving cache efficiency with
filesystems that don't support fscrypt.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/f2fs/f2fs.h  | 3 +++
 fs/f2fs/super.c | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 46be7560548ce..2f5c30c069c3c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -905,10 +905,13 @@ struct f2fs_inode_info {
 	unsigned char i_compress_flag;		/* compress flag */
 	unsigned int i_cluster_size;		/* cluster size */
 
 	unsigned int atomic_write_cnt;
 	loff_t original_i_size;		/* original i_size before atomic write */
+#ifdef CONFIG_FS_ENCRYPTION
+	struct fscrypt_inode_info *i_crypt_info; /* filesystem encryption info */
+#endif
 };
 
 static inline void get_read_extent_info(struct extent_info *ext,
 					struct f2fs_extent *i_ext)
 {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e16c4e2830c29..b42b55280d9e3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -478,10 +478,13 @@ static inline void adjust_unusable_cap_perc(struct f2fs_sb_info *sbi)
 static void init_once(void *foo)
 {
 	struct f2fs_inode_info *fi = (struct f2fs_inode_info *) foo;
 
 	inode_init_once(&fi->vfs_inode);
+#ifdef CONFIG_FS_ENCRYPTION
+	fi->i_crypt_info = NULL;
+#endif
 }
 
 #ifdef CONFIG_QUOTA
 static const char * const quotatypes[] = INITQFNAMES;
 #define QTYPE2NAME(t) (quotatypes[t])
@@ -3568,10 +3571,12 @@ static struct block_device **f2fs_get_devices(struct super_block *sb,
 	*num_devs = sbi->s_ndevs;
 	return devs;
 }
 
 static const struct fscrypt_operations f2fs_cryptops = {
+	.inode_info_offs	= (int)offsetof(struct f2fs_inode_info, i_crypt_info) -
+				  (int)offsetof(struct f2fs_inode_info, vfs_inode),
 	.needs_bounce_pages	= 1,
 	.has_32bit_inodes	= 1,
 	.supports_subblock_data_units = 1,
 	.legacy_key_prefix	= "f2fs:",
 	.get_context		= f2fs_get_context,
@@ -3579,11 +3584,11 @@ static const struct fscrypt_operations f2fs_cryptops = {
 	.get_dummy_policy	= f2fs_get_dummy_policy,
 	.empty_dir		= f2fs_empty_dir,
 	.has_stable_inodes	= f2fs_has_stable_inodes,
 	.get_devices		= f2fs_get_devices,
 };
-#endif
+#endif /* CONFIG_FS_ENCRYPTION */
 
 static struct inode *f2fs_nfs_get_inode(struct super_block *sb,
 		u64 ino, u32 generation)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
