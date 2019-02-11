Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C283FC169C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 17:32:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CB042229E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 17:32:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ldAdxHPb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHC+TaMM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CB042229E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XbOoYgJ7vpRWCVpOAFVisKJMg+uXVRemB0U6bNS83Rk=; b=ldAdxHPbiNvc+3
	ou2N6fcre9pGXqCcX3UogrQjqIjIrdBB13LCADwnMsTT+mEgA1YrdJ5dwlaHNza9Bfs9+o66Hg8oL
	ZFTE/QcwfpDkgbZbOZizZ6mGpL5d5AFbAl/3P6ePgJUdV6yMENmkQFf9K5s6ey7G5+DZmAN/vi8XO
	CZMdB3r1NYE6Ch+6n2t73hKHrmLDLLKi4kTCCIEOrehoO8vQSF886xaWg2rcHSRlM7WJHD1CJo2ot
	Cc4f5YmpnRb2ikH4CdAOobS80lXddaOnxbAOLObe3rwm9Fq52yxVfIuTo37hbeJukMIJWuKNlsR9M
	TUgJYBdVJKsbSevN+VPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtFQy-0002JC-VP; Mon, 11 Feb 2019 17:31:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtFOn-0007Iz-N4
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 17:29:52 +0000
Received: from sol.localdomain (c-107-3-167-184.hsd1.ca.comcast.net
 [107.3.167.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A352222A9;
 Mon, 11 Feb 2019 17:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549906181;
 bh=LHU0VKAUPXgaadVEq89d1supnSav2nCovQtUB0yGf0M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HHC+TaMMTJM3NpzleY+Gsh4zsYqdjXl27kj8EKGOxvdOQMUV76TXes1bBxZgZVLUc
 btxFfSTT/164wINdM4xan+haMIICRG1pQZ0tdBp1uEF5+go7g4s7oWC4rG4zRwFgEA
 kMuj9c9HL7pLK4CsqZRWGYgB90wmkpsHcUOPIcA4=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [RFC PATCH v2 10/20] fs/dcache.c: add shrink_dcache_inode()
Date: Mon, 11 Feb 2019 09:27:28 -0800
Message-Id: <20190211172738.4633-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190211172738.4633-1-ebiggers@kernel.org>
References: <20190211172738.4633-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_092942_113876_02D2B526 
X-CRM114-Status: GOOD (  12.54  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

When a filesystem encryption key is removed, we need all files which had
been "unlocked" (had ->i_crypt_info set up) with it to appear "locked"
again.  This is most easily done by evicting the inodes.  This can
currently be done using 'echo 2 > /proc/sys/vm/drop_caches'; however,
that is overkill and not usable by non-root users.

To evict just the needed inodes we also need the ability to evict those
inodes' dentries, since an inode is pinned by its dentries.  Therefore,
add a function shrink_dcache_inode() which iterates through an inode's
dentries and evicts any unused ones as well as any unused descendants
(since there may be negative dentries pinning the inode's dentries).

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/dcache.c            | 32 ++++++++++++++++++++++++++++++++
 include/linux/dcache.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index 2593153471cf..6a7db8797b2d 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1484,6 +1484,38 @@ void shrink_dcache_parent(struct dentry *parent)
 }
 EXPORT_SYMBOL(shrink_dcache_parent);
 
+/**
+ * shrink_dcache_inode - prune dcache for inode
+ * @inode: inode to prune
+ *
+ * Evict all unused aliases of the specified inode from the dcache.  This is
+ * intended to be used when trying to evict a specific inode, since inodes are
+ * pinned by their dentries.  We also have to descend to ->d_subdirs for each
+ * alias, since aliases may be pinned by negative child dentries.
+ */
+void shrink_dcache_inode(struct inode *inode)
+{
+	for (;;) {
+		struct select_data data;
+		struct dentry *dentry;
+
+		INIT_LIST_HEAD(&data.dispose);
+		data.start = NULL;
+		data.found = 0;
+
+		spin_lock(&inode->i_lock);
+		hlist_for_each_entry(dentry, &inode->i_dentry, d_u.d_alias)
+			d_walk(dentry, &data, select_collect);
+		spin_unlock(&inode->i_lock);
+
+		if (!data.found)
+			break;
+
+		shrink_dentry_list(&data.dispose);
+		cond_resched();
+	}
+}
+
 static enum d_walk_ret umount_check(void *_data, struct dentry *dentry)
 {
 	/* it has busy descendents; complain about those instead */
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index ef4b70f64f33..c02dab98bc97 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -245,6 +245,7 @@ extern struct dentry * d_obtain_alias(struct inode *);
 extern struct dentry * d_obtain_root(struct inode *);
 extern void shrink_dcache_sb(struct super_block *);
 extern void shrink_dcache_parent(struct dentry *);
+extern void shrink_dcache_inode(struct inode *);
 extern void shrink_dcache_for_umount(struct super_block *);
 extern void d_invalidate(struct dentry *);
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
