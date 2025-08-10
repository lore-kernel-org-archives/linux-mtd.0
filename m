Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC7CCA0ED0
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 08:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJF2WpaHxBKEvC/vEv1X+YYWcuXb7QcONi7sPaPnoFo=; b=Hwhfs7lmFiaamq
	MsBUffCwEo9o0vUlGl99U8UVaiTKbddYFy4/TyFCjurFfGRB+sevgxfdNofFZp61mIRt4gLRgIB7t
	quXT3zw3vsU5uhQVuT2sllrkOS9FxOHyoIWUvjhx59sL4JApu62DR75XUyQh5YubMZl6pkrJzw2VZ
	kvyYQYKP+HX7j4rbwRPdLGiEqBbXc+Uw5mqBEB2DFRkdP5clyZ8p/vC2+mv/zbHaNQTQD/TOoTx2J
	DA1uLMdBOnHpwZVkl+pj+S9Wdd/9zTpwj+n+s+tWLoY2S3QLN1E8xgizrQp8L8M2FrSaEpOoGWcjb
	0DR8TJClpIkNSrzdAqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yb-00000005QO4-1cNI;
	Sun, 10 Aug 2025 08:00:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yT-00000005QHP-1GzE
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 08:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11AD845C51;
	Sun, 10 Aug 2025 08:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EBCC113CF;
	Sun, 10 Aug 2025 08:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754812813;
	bh=4ALZh1TX6fbceabPFA2hm4uM38KlRQdFwuBGPkO3fiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WrdsILbDUeHsSLCqkLIk932Dt2ft5mbjyrE14aQEF/nn2Pq8A94dxpPvu46Rx5hQe
	 8tzKe7dmDUzJgfofTapEb1rVqKkqr/QkF4KfBsSMYp4lMGHNXAf1D47sA4az5MAfEV
	 BCJ0OimXCSWvozt+8XYBZKApWRzQlt7Puqaz3lm06hfjSVR87qCb/HIam2C5DpXefv
	 +ByHz8g72FZi9U6OiqvWWhkIaIrGxCJnkGLcmtRdOrzozekuhoRfC663e53fBT3tvu
	 8J17CNaXveiknAWq1luhFlgs6mRJxXvOCcaccTW6LguZC6s8JAbk+v80HBcAGcCqea
	 YHJcypJNTou/A==
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
Subject: [PATCH v5 12/13] fs: remove inode::i_verity_info
Date: Sun, 10 Aug 2025 00:57:05 -0700
Message-ID: <20250810075706.172910-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_010013_403579_D3D8E5A2 
X-CRM114-Status: GOOD (  13.32  )
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

Now that all fsverity-capable filesystems store the pointer to
fsverity_info in the filesystem-specific part of the inode structure,
inode::i_verity_info is no longer needed.  Update fsverity_info_addr()
to no longer support the fallback to inode::i_verity_info.  Finally,
remove inode::i_verity_info itself, and move the forward declaration of
struct fsverity_info from fs.h (which no longer needs it) to fsverity.h.

The end result of the migration to the filesystem-specific pointer is
memory savings on CONFIG_FS_VERITY=y kernels for all filesystems that
don't support fsverity.  Specifically, their in-memory inodes are now
smaller by the size of a pointer: either 4 or 8 bytes.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/linux/fs.h       |  5 -----
 include/linux/fsverity.h | 10 ++++++++--
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 1dafa18169be6..12ecc6b0e6f96 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -71,11 +71,10 @@ struct cred;
 struct swap_info_struct;
 struct seq_file;
 struct workqueue_struct;
 struct iov_iter;
 struct fscrypt_operations;
-struct fsverity_info;
 struct fsverity_operations;
 struct fsnotify_mark_connector;
 struct fsnotify_sb_info;
 struct fs_context;
 struct fs_parameter_spec;
@@ -777,14 +776,10 @@ struct inode {
 	__u32			i_fsnotify_mask; /* all events this inode cares about */
 	/* 32-bit hole reserved for expanding i_fsnotify_mask */
 	struct fsnotify_mark_connector __rcu	*i_fsnotify_marks;
 #endif
 
-#ifdef CONFIG_FS_VERITY
-	struct fsverity_info	*i_verity_info;
-#endif
-
 	void			*i_private; /* fs or device private pointer */
 } __randomize_layout;
 
 static inline void inode_set_cached_link(struct inode *inode, char *link, int linklen)
 {
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index e0f132cb78393..844f7b8b56bbc 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -24,10 +24,12 @@
 #define FS_VERITY_MAX_DIGEST_SIZE	SHA512_DIGEST_SIZE
 
 /* Arbitrary limit to bound the kmalloc() size.  Can be changed. */
 #define FS_VERITY_MAX_DESCRIPTOR_SIZE	16384
 
+struct fsverity_info;
+
 /* Verity operations for filesystems */
 struct fsverity_operations {
 	/**
 	 * The offset of the pointer to struct fsverity_info in the
 	 * filesystem-specific part of the inode, relative to the beginning of
@@ -128,15 +130,19 @@ struct fsverity_operations {
 				       u64 pos, unsigned int size);
 };
 
 #ifdef CONFIG_FS_VERITY
 
+/*
+ * Returns the address of the verity info pointer within the filesystem-specific
+ * part of the inode.  (To save memory on filesystems that don't support
+ * fsverity, a field in 'struct inode' itself is no longer used.)
+ */
 static inline struct fsverity_info **
 fsverity_info_addr(const struct inode *inode)
 {
-	if (inode->i_sb->s_vop->inode_info_offs == 0)
-		return (struct fsverity_info **)&inode->i_verity_info;
+	VFS_WARN_ON_ONCE(inode->i_sb->s_vop->inode_info_offs == 0);
 	return (void *)inode + inode->i_sb->s_vop->inode_info_offs;
 }
 
 static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
 {
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
