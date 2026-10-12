Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56108CA9ED0
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 10:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czreiqpbEiKzBDWQ6YVm4yVKRwb497tVotonBqF1UkE=; b=qxn9GvDEiytvG1
	TVlB79kQ+GnmYf0L2gHqLQelub6BVtFow3t3fyOoW0Am9BTS9MR2A9tM4DCMCuUfiXUr4NvODfp4u
	8s6qByTUu9UN27Rz8H+xr8Jpapi/I++VB3/7YdjUISVU4NA/ryubttITc0o0S9I73Meri09cs3SC4
	gTDGveCVzi7xmzNzytzrx2KPF6V6eU76uHAQrubNTUtwY7uL5M+RdejMvnqU0spGOVfsMSa9A+AQs
	cnrSbwtcz1j6lZRYCdEUW7Ip5+SGz7HoiiQaKMhXiVL4s4MgNibrv35jmnc8UUnGf2z1mhluv0U/K
	EJMbyUOMbUu2NdMS+4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAL-0000000ACql-2tXj;
	Mon, 12 Oct 2026 10:21:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAK-0000000ACpK-2Uof
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 10:21:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 08478601FA;
	Mon, 12 Oct 2026 10:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CED1F0089C;
	Mon, 12 Oct 2026 10:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791800515;
	bh=QCZaEweOVnuPefoLn5iEwOBniO/HYyLMqrh8uS/GYvI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YymIlTxo4Qn7fqspYcXkU2wwWzOAiHzqTDcnQbs4NpZqG+VTnQp88mUevfj0LYV3x
	 b6B6sE+6yw4md9uJ3EgUTaNCxz+MdSDtgDfbVZWKLwOV/MJsohGSRZ4NYDa3J13SyT
	 dpD6GToxuubfiWkj44gmfnzRIOqyh/XPY0pBrdQSL15jEIxlpu0oKRl4eryLu2gXFI
	 a5gRJj6fEaq+32tcWlhWv6sLT3K/5b7pTmSBCXLES4rZpbHPuGps5HulG3m4P29FMx
	 zeg2w6Yc4CqZbqvPGfvw3xT2FVRQrJu6qpxb+MwTsUjS7j5L5onS2bkDjmm620uEFI
	 9FbZ+H/sVlJ3g==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 12 Oct 2026 12:20:55 +0200
Subject: [PATCH RFC 10/28] hfsplus: don't set SB_RDONLY when creating the
 attributes tree
MIME-Version: 1.0
Message-Id: <20261012-work-fs-sb_rdonly-v1-10-60743a3dc326@kernel.org>
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
In-Reply-To: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
To: Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, ntfs@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org, 
 gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-3d1b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=brauner@kernel.org;
 h=from:subject:message-id; bh=eHC9AXS5JoY98Sn21FuexgqVSRGcgjCOplpcFaIG+KI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSd2TJZdevbxqj1/nH3Cg5rS39Ub/wgUxG74WzYdVHt/
 1L+3BM4O0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACaS/ZDhF/MO1hVN79POrjsr
 sdr6nrkHo4x082teybNW8qci+nZt9GNk6Gq4KS7w0aFjT9n0pq9u58ymzg9hLlrCavjxlKh0Hhc
 TNwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
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

hfs_btree_open() sets SB_RDONLY when the map record of a b-tree doesn't
mark the header node as used. That's fine while mounting where the
mounter holds sb->s_umount. But hfsplus_create_attributes_file() calls
it too when the first extended attribute gets set on a filesystem that
doesn't have an attributes file yet. That runs on the live filesystem
without s_umount and a filesystem must not change SB_RDONLY behind the
VFS' back.

hfsplus_create_attributes_file() opens a tree it has just created
itself, with the header node marked as used. So there's nothing to
check there. Only do the check while the filesystem is being mounted.

No functional changes.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/hfsplus/btree.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/hfsplus/btree.c b/fs/hfsplus/btree.c
index 2ea8cd5658e1..967c457d843d 100644
--- a/fs/hfsplus/btree.c
+++ b/fs/hfsplus/btree.c
@@ -385,7 +385,12 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 	if (IS_ERR(node))
 		goto free_inode;
 
-	if (!hfs_bmap_test_bit(node, 0)) {
+	/*
+	 * Only a mount may set SB_RDONLY, later that needs s_umount. After the
+	 * mount this only opens the attributes tree that
+	 * hfsplus_create_attributes_file() just created with the bit set.
+	 */
+	if (!(sb->s_flags & SB_BORN) && !hfs_bmap_test_bit(node, 0)) {
 		pr_warn("(%s): %s (cnid 0x%x) map record invalid or bitmap corruption detected, forcing read-only.\n",
 				sb->s_id, hfs_btree_name(id), id);
 		pr_warn("Run fsck.hfsplus to repair.\n");

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
