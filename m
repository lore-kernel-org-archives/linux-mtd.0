Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33303CA0ECB
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 08:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2lUl0YeqL0EYWHtwobJNP56oBb6BW4S4rImGc6vSB4=; b=uw1O+K+lPBrKP4
	a63kBz0UbqUWkm4RJxco2xjsOtgA0tdVdX5uXcvNhFoaclVRhcMVmGUrfVSVaQjj96P+CQYDuFlU4
	+qo5XzhP85QuCxKUxgyJS3FCRzigx27oE4GoOBU7udlgYgGwkRjg3fExVryFOd1jdZU3YzcaKqjyp
	G8GNKKidivmet/k1EZLntsCv94r5zqVeE4VsKGQxFVgE5mpRWm9+Kp94JpJWUjp7Gz4okSMmy1kBy
	U/3CR8JL82UN1N4i9OdFxQJrDN474No8h9kgM6lfHJhcIBM1Uk1XZxvZwnOHrFnKxEfKaZKPSiZDG
	mxoSaJIpj/FjrHlWPBTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yV-00000005QK6-48uL;
	Sun, 10 Aug 2025 08:00:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yQ-00000005QDy-2uSo
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 08:00:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 31BE45C56FD;
	Sun, 10 Aug 2025 08:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2CAC4CEF7;
	Sun, 10 Aug 2025 08:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754812809;
	bh=0QKYi4i563jkQBHgIWsIphouZcaUjg0BpGQZ0ifH+ao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QDcjjnngyBOJ5esSVTp3mHZ3is51fgNdzKZ8LmYnb33VmjyO9RcMLkqreDQTZwjrB
	 2Rl6SoPZ9JRA6iNZndXA9iVpPeh/w8BMSKuWPZBt+w/RQvB/3uKBDXfMFh6p/7GRSV
	 UgE3NLSJpf1mCsoM8OWYSmiwvjGefsN0I+CUPLy7lbyEuiQKbAK/MamSqDeEggHRBN
	 BoQw6FAVCBXodbd4VKYsNP+5j/531I3hzTyxmBD1qdvjet8VZdYSWx14mRU83iJioL
	 S3lzoNyBVxRI9jJ7QQ1L0oYfj7MOwRDwOpfXI9AVowxFIhA1A2xbk96nakWEhhadeK
	 MgFISk3CIGUnA==
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
Subject: [PATCH v5 03/13] ext4: move crypt info pointer to fs-specific part of inode
Date: Sun, 10 Aug 2025 00:56:56 -0700
Message-ID: <20250810075706.172910-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_010010_770943_60EFDA32 
X-CRM114-Status: GOOD (  11.30  )
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
the inode by adding the field ext4_inode_info::i_crypt_info and
configuring fscrypt_operations::inode_info_offs accordingly.

This is a prerequisite for a later commit that removes
inode::i_crypt_info, saving memory and improving cache efficiency with
filesystems that don't support fscrypt.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/ext4/crypto.c | 2 ++
 fs/ext4/ext4.h   | 4 ++++
 fs/ext4/super.c  | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/fs/ext4/crypto.c b/fs/ext4/crypto.c
index 0a056d97e6402..cf0a0970c0956 100644
--- a/fs/ext4/crypto.c
+++ b/fs/ext4/crypto.c
@@ -225,10 +225,12 @@ static bool ext4_has_stable_inodes(struct super_block *sb)
 {
 	return ext4_has_feature_stable_inodes(sb);
 }
 
 const struct fscrypt_operations ext4_cryptops = {
+	.inode_info_offs	= (int)offsetof(struct ext4_inode_info, i_crypt_info) -
+				  (int)offsetof(struct ext4_inode_info, vfs_inode),
 	.needs_bounce_pages	= 1,
 	.has_32bit_inodes	= 1,
 	.supports_subblock_data_units = 1,
 	.legacy_key_prefix	= "ext4:",
 	.get_context		= ext4_get_context,
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 01a6e2de7fc3e..c897109dadb15 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1180,10 +1180,14 @@ struct ext4_inode_info {
 
 	/* Precomputed uuid+inum+igen checksum for seeding inode checksums */
 	__u32 i_csum_seed;
 
 	kprojid_t i_projid;
+
+#ifdef CONFIG_FS_ENCRYPTION
+	struct fscrypt_inode_info *i_crypt_info;
+#endif
 };
 
 /*
  * File system states
  */
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index c7d39da7e733b..0c3059ecce37c 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1468,10 +1468,13 @@ static void init_once(void *foo)
 	INIT_LIST_HEAD(&ei->i_orphan);
 	init_rwsem(&ei->xattr_sem);
 	init_rwsem(&ei->i_data_sem);
 	inode_init_once(&ei->vfs_inode);
 	ext4_fc_init_inode(&ei->vfs_inode);
+#ifdef CONFIG_FS_ENCRYPTION
+	ei->i_crypt_info = NULL;
+#endif
 }
 
 static int __init init_inodecache(void)
 {
 	ext4_inode_cachep = kmem_cache_create_usercopy("ext4_inode_cache",
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
