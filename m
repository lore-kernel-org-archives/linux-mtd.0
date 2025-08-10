Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1E0CA0EC0
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HOvp+eQINkKsTyvbaQnIgqiPFDk6/2cEK/PYiHt30Q=; b=e6Y5ZRp/p9/Pmv
	iOq7rkznsi8D8XJWMpS4MVbotBxDIqB6h0Cp+LSpRk97olECQ6DTSiR8whxIQeuxjkTW7Ra52GVjm
	/XRR1P6aFuHXvQWWUKyU0Qr7dZWxWd1GY7JzeI6pbBY8KoS5bsQDmTVtH08+i7Iys47UN9zV/w+wa
	Pao5xawVGkKZqUlO9aH+K++ukrJ105oqF6+2vH8OPtT0TF1mhFX+/THxU3W/OJ3gZKb6zU5ICAFfs
	/MRNOcEZ3TBWJzS/xYrsColDzq/AnlxkkR4r6p3I+pDhqYX0Q9G3z9b8OyiqDtKhYfiPcgZG70rkM
	J+Wpj8zHBGvfS6gTNlDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yX-00000005QKw-48h8;
	Sun, 10 Aug 2025 08:00:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yR-00000005QFc-3yjb
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 08:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 188EDA55134;
	Sun, 10 Aug 2025 08:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAB9C4CEEB;
	Sun, 10 Aug 2025 08:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754812810;
	bh=hTLksDqAG7iJZbJnGqd8JyQQhFVP3K3qP+WNZUyThvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SLFlFAFYjVyvx9ggNdb5bWTXUqjDAUbaAo7N9/6UnJmEJtn+vKgzQPSAsWKAsRRRL
	 So3V9vSSaOSZ6Ds6ARu8XEUs1FVfS4QUCRq4ZHQrfPc+rBVQhL3v9wIQaxwh3+aQXB
	 k2ubttllOoJvrh7zV/bz9kqO1TlYZEs1y0/O8Oyc1IkXRMPZ74rzJNYA4fyBXPEpMJ
	 /brqN4ToKmH+IcQQqnwa6y3VbfRNfVQosWIZdaAiMRv8+lLvNNZA8f1nmW1uL0/aTx
	 NURcg6NCqctDVHUqEvUCetLBqq3zGe3Ta/k9LE0yd/xaBpAv3jwBpD7nQrShG7pq1M
	 V6O2XmUIE9Lsg==
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
Subject: [PATCH v5 07/13] fs: remove inode::i_crypt_info
Date: Sun, 10 Aug 2025 00:57:00 -0700
Message-ID: <20250810075706.172910-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_010012_139273_D38A0CFB 
X-CRM114-Status: GOOD (  12.31  )
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

Now that all fscrypt-capable filesystems store the pointer to
fscrypt_inode_info in the filesystem-specific part of the inode
structure, inode::i_crypt_info is no longer needed.  Update
fscrypt_inode_info_addr() to no longer support the fallback to
inode::i_crypt_info.  Finally, remove inode::i_crypt_info itself along
with the now-unnecessary forward declaration of fscrypt_inode_info.

The end result of the migration to the filesystem-specific pointer is
memory savings on CONFIG_FS_ENCRYPTION=y kernels for all filesystems
that don't support fscrypt.  Specifically, their in-memory inodes are
now smaller by the size of a pointer: either 4 or 8 bytes.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/linux/fs.h      | 5 -----
 include/linux/fscrypt.h | 8 ++++++--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index d7ab4f96d7051..1dafa18169be6 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -70,11 +70,10 @@ struct vfsmount;
 struct cred;
 struct swap_info_struct;
 struct seq_file;
 struct workqueue_struct;
 struct iov_iter;
-struct fscrypt_inode_info;
 struct fscrypt_operations;
 struct fsverity_info;
 struct fsverity_operations;
 struct fsnotify_mark_connector;
 struct fsnotify_sb_info;
@@ -778,14 +777,10 @@ struct inode {
 	__u32			i_fsnotify_mask; /* all events this inode cares about */
 	/* 32-bit hole reserved for expanding i_fsnotify_mask */
 	struct fsnotify_mark_connector __rcu	*i_fsnotify_marks;
 #endif
 
-#ifdef CONFIG_FS_ENCRYPTION
-	struct fscrypt_inode_info	*i_crypt_info;
-#endif
-
 #ifdef CONFIG_FS_VERITY
 	struct fsverity_info	*i_verity_info;
 #endif
 
 	void			*i_private; /* fs or device private pointer */
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index d7ff53accbfef..516aba5b858b5 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -199,15 +199,19 @@ struct fscrypt_operations {
 };
 
 int fscrypt_d_revalidate(struct inode *dir, const struct qstr *name,
 			 struct dentry *dentry, unsigned int flags);
 
+/*
+ * Returns the address of the fscrypt info pointer within the
+ * filesystem-specific part of the inode.  (To save memory on filesystems that
+ * don't support fscrypt, a field in 'struct inode' itself is no longer used.)
+ */
 static inline struct fscrypt_inode_info **
 fscrypt_inode_info_addr(const struct inode *inode)
 {
-	if (inode->i_sb->s_cop->inode_info_offs == 0)
-		return (struct fscrypt_inode_info **)&inode->i_crypt_info;
+	VFS_WARN_ON_ONCE(inode->i_sb->s_cop->inode_info_offs == 0);
 	return (void *)inode + inode->i_sb->s_cop->inode_info_offs;
 }
 
 /*
  * Load the inode's fscrypt info pointer, using a raw dereference.  Since this
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
