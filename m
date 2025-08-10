Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD0FC87FCA
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 08:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISbTK34c8igqcHbS4S14ymbEGn4wvYmiBmzzBqJg9OY=; b=g/MgLom3Syro/p
	EffkaJblFwN+PK5jis6qIG2z5t6zRvVbTba82XVGyKRa0ARUFtfZwnJk4AB+JjUEJSYAf6METTlgY
	pS0dl4OCufp4psWkmEZmoi3CyLa7qSRJaUIMLog3diMp0Bi1DYZq5PFxiUexgnUyDICL/oRfrOz8v
	Wuhz3WkgAHB/+Nx6UJ7hBVJdgML6Vj8ahDmoT91nKeOb7Sb7g1nD8tBbwVzuT3siKU0pQ70s9VUjv
	txLZrTMPvNIjXqALEtZwZ89BsYf0jn4gHr1tvSoogdvUfKjlHVnzUr0twwxOEqErabwzgNAnjFMIk
	sBNcUYeyF9JaYZN3jV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yc-00000005QPF-1yml;
	Sun, 10 Aug 2025 08:00:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yT-00000005QHz-35hs
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 08:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C3D445C59;
	Sun, 10 Aug 2025 08:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199D3C4CEEB;
	Sun, 10 Aug 2025 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754812813;
	bh=rH4xOjWHyO4rXuGnXUPR48o6Mlex3OOttISDvsv5E9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sMaXqJKa2KxH6f4tMBBaWdPiIEWUPBUacPolQNKXvYj7y1z5EdTS9Ztn04re75Tzb
	 Von+ZDv71Est4yhSEseq9WQNpCJ5tYDDeTnayh3M7Ljc6Z5LkP+X1xTHvCmVmnK62o
	 3fFoQXIgkxTTpk30YcZ1TJeOyR6HE6cw0xQlu6QUNcpP4gKaVMPy6BWuJYymPZm+si
	 9rGzeRe7mySUbOWFc0+2EcQHLZTC4EgyqFre8OARwwRm7N8e3UuA4+gMwWTizV3tt5
	 i+cgenU4mq/isXW8C68emNfvbILzzQPczeVWKyKRxfEEbcTnIOkWQnm7zeTHl03ugW
	 6uTqLHCGI1q/g==
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
Subject: [PATCH v5 13/13] fsverity: check IS_VERITY() in fsverity_cleanup_inode()
Date: Sun, 10 Aug 2025 00:57:06 -0700
Message-ID: <20250810075706.172910-14-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_010013_802375_E1D6587A 
X-CRM114-Status: GOOD (  13.00  )
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

Since getting the address of the fsverity_info has gotten a bit more
expensive, make fsverity_cleanup_inode() check for IS_VERITY() instead.
This avoids adding more overhead to non-verity files.

This assumes that verity info is never set when !IS_VERITY(), which is
currently true, but add a VFS_WARN_ON_ONCE() that asserts that.  (This
of course defeats the optimization, but only when CONFIG_VFS_DEBUG=y.)

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/linux/fsverity.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 844f7b8b56bbc..5bc7280425a71 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -188,12 +188,19 @@ void __fsverity_cleanup_inode(struct inode *inode);
  *
  * Filesystems must call this on inode eviction to free the inode's verity info.
  */
 static inline void fsverity_cleanup_inode(struct inode *inode)
 {
-	if (*fsverity_info_addr(inode))
+	/*
+	 * Only IS_VERITY() inodes can have verity info, so start by checking
+	 * for IS_VERITY() (which is faster than retrieving the pointer to the
+	 * verity info).  This minimizes overhead for non-verity inodes.
+	 */
+	if (IS_VERITY(inode))
 		__fsverity_cleanup_inode(inode);
+	else
+		VFS_WARN_ON_ONCE(*fsverity_info_addr(inode) != NULL);
 }
 
 /* read_metadata.c */
 
 int fsverity_ioctl_read_metadata(struct file *filp, const void __user *uarg);
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
