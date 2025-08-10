Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE04CA0EC7
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5NIpdANbC/4zZRdp/86OSjRZ46w9sZPFY8x6zsGgFc=; b=opkKeK0yjqZPYa
	gSMXpAOVG3bvrMg8SlmCbxWJUGfMUgxmMF+z8G83NPfqcuw0CtgIAVHlrMV964gQ1XLbB0SCFad8h
	6HuHBOXEOq8l9z5mIwle0mxUl63G+cyyeUQ7Agx2/ChOSMVnlOpWpwJxOzPbjJDk6TXiCvBvpGkur
	LQ8LN/znwnxtMXDgyxAOVVG4fW80a90BZAbXVuXuMfEzk8XanUMEYuFE0fWkmag4s3XJ4ETA9OFdz
	RHuKNUARPgWDTc8Vo2dxuWkg8mWhl4/qVUcuC3XkmBQ7aw4msHtTZxMedaQw5+MqnjcXdmTCNtKXD
	Ix8UCI8nzbO+KCI6T5Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yW-00000005QKE-23vQ;
	Sun, 10 Aug 2025 08:00:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yQ-00000005QDz-3g2e
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 08:00:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C55EA55132;
	Sun, 10 Aug 2025 08:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D421C4CEEB;
	Sun, 10 Aug 2025 08:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754812809;
	bh=Qm1plsgVlmTBCpbZLW/xcJNpj1w2kpvFy1WqJ9hSAZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IBNeIHJ2heVgM/csrEC21oBuVod6FeprqFqd1W+zzBuMWSAFjawLCDuBK4bneu7ou
	 0AlF0wyE4wt//266UDH7gUEIzRcrV+jXb8aeubS8u1tpfdXci4muagNyNZfgTKW7z6
	 jF+JQtHOfsQEB/S3jXe+F3X3rWlXyf4VbWi7aYpAxVSjgjSsDaWRFTSxEVW7ec7/Rc
	 kHShVks2Ht5rGE4vyY02UuKKgzsrXLCZoQMGvSwhz/kAeIpVrCuHfxcKEFzFAG1/fr
	 XCR8JpQGpS8e3uHh5SXlecIvhE6bSOWV5WiT27UJA8SYlbR+nXiMx3EeZEKqt1YvaB
	 x54EA9wnkMuUw==
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
Subject: [PATCH v5 05/13] ubifs: move crypt info pointer to fs-specific part of inode
Date: Sun, 10 Aug 2025 00:56:58 -0700
Message-ID: <20250810075706.172910-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_010011_040796_7868A3C1 
X-CRM114-Status: GOOD (  11.87  )
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
the inode by adding the field ubifs_inode::i_crypt_info and configuring
fscrypt_operations::inode_info_offs accordingly.

This is a prerequisite for a later commit that removes
inode::i_crypt_info, saving memory and improving cache efficiency with
filesystems that don't support fscrypt.

Note that the initialization of ubifs_inode::i_crypt_info to NULL on
inode allocation is handled by the memset() in ubifs_alloc_inode().

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/ubifs/crypto.c | 2 ++
 fs/ubifs/ubifs.h  | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index fb5ac358077b1..0b14d004a095b 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -86,10 +86,12 @@ int ubifs_decrypt(const struct inode *inode, struct ubifs_data_node *dn,
 
 	return 0;
 }
 
 const struct fscrypt_operations ubifs_crypt_operations = {
+	.inode_info_offs	= (int)offsetof(struct ubifs_inode, i_crypt_info) -
+				  (int)offsetof(struct ubifs_inode, vfs_inode),
 	.legacy_key_prefix	= "ubifs:",
 	.get_context		= ubifs_crypt_get_context,
 	.set_context		= ubifs_crypt_set_context,
 	.empty_dir		= ubifs_crypt_empty_dir,
 };
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 5db45c9e26ee0..49e50431741cd 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -363,10 +363,11 @@ struct ubifs_gced_idx_leb {
  * @compr_type: default compression type used for this inode
  * @last_page_read: page number of last page read (for bulk read)
  * @read_in_a_row: number of consecutive pages read in a row (for bulk read)
  * @data_len: length of the data attached to the inode
  * @data: inode's data
+ * @i_crypt_info: inode's fscrypt information
  *
  * @ui_mutex exists for two main reasons. At first it prevents inodes from
  * being written back while UBIFS changing them, being in the middle of an VFS
  * operation. This way UBIFS makes sure the inode fields are consistent. For
  * example, in 'ubifs_rename()' we change 4 inodes simultaneously, and
@@ -414,10 +415,13 @@ struct ubifs_inode {
 	int flags;
 	pgoff_t last_page_read;
 	pgoff_t read_in_a_row;
 	int data_len;
 	void *data;
+#ifdef CONFIG_FS_ENCRYPTION
+	struct fscrypt_inode_info *i_crypt_info;
+#endif
 };
 
 /**
  * struct ubifs_unclean_leb - records a LEB recovered under read-only mode.
  * @list: list
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
