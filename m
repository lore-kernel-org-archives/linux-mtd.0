Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24596C433E8
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 06:35:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1295523100
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 06:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q6zwjC7d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2050mad"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1295523100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SP9QyPzJS4prCJlJSLxU8OQGN/f2B6fyi4qG48d1uAo=; b=Q6zwjC7dzIo03TfryaKg80qLb
	3+HkcpM/leJATycX2BiOBMFiOsl4HU9Z9uqjvFBvYe43HGGteyD+fWZ5vdnLNFIqjdTXgIFqClXER
	ofgvJkDcEMEB3ql/KxHz6ymqMcdDdnQutYhK5b0YAFpqqW+1ScihHjKS8cxhqcvfsrJahKaQiGeS3
	I7KvBTx803Figx9cZeUf5Ymbqu2u+GMpcoDZyCuiPfVud+JE/4hPJ59zrLC185MyYAlQ6dHzpcvfk
	4sK5XdfZ0z1RlQumosM4m49w2Y6u7O7OTuVy57bMu5skfBwvJfy5XZj/MZl/OmzE+UgLMB9jWN39M
	fheSVMa6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA5oL-0003lE-Uq; Mon, 24 Aug 2020 06:18:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA5oC-0003hh-N5
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 06:18:23 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90CA6207D3;
 Mon, 24 Aug 2020 06:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598249898;
 bh=QdONhA25GuQQJmapNTQIWWWGH7achN6FFOfpot5lMGg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e2050mad+4BMjzCtGT254bX32Y57ZVPtbWQMoQ32OT3m9nxLEs1AyyyqNgsRbiXRZ
 QT/l38bY56Ows6Dz77k+6jZZieKpGieGImYQ2x0upL1GsY64XNmbcCCuQTqD6nxcy5
 EOd44g73ySC7xMwhc5Xioy2YrWtVXRk3pKMU+uk4=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [RFC PATCH 2/8] ext4: factor out ext4_xattr_credits_for_new_inode()
Date: Sun, 23 Aug 2020 23:17:06 -0700
Message-Id: <20200824061712.195654-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824061712.195654-1-ebiggers@kernel.org>
References: <20200824061712.195654-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_021821_219734_E992BE8A 
X-CRM114-Status: GOOD (  21.18  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

To compute a new inode's xattr credits, we need to know whether the
inode will be encrypted or not.  When we switch to use the new helper
function fscrypt_prepare_new_inode(), we won't find out whether the
inode will be encrypted until slightly later than is currently the case,
which requires moving the code block that computes the xattr credits.

To make this easier and reduce the length of __ext4_new_inode(), move
this code block into a new function ext4_xattr_credits_for_new_inode().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ialloc.c | 90 +++++++++++++++++++++++++++---------------------
 1 file changed, 51 insertions(+), 39 deletions(-)

diff --git a/fs/ext4/ialloc.c b/fs/ext4/ialloc.c
index df25d38d65393..0cc576005a923 100644
--- a/fs/ext4/ialloc.c
+++ b/fs/ext4/ialloc.c
@@ -742,6 +742,53 @@ static int find_inode_bit(struct super_block *sb, ext4_group_t group,
 	return 1;
 }
 
+static int ext4_xattr_credits_for_new_inode(struct inode *dir, mode_t mode,
+					    bool encrypt)
+{
+	struct super_block *sb = dir->i_sb;
+	int nblocks = 0;
+#ifdef CONFIG_EXT4_FS_POSIX_ACL
+	struct posix_acl *p = get_acl(dir, ACL_TYPE_DEFAULT);
+
+	if (IS_ERR(p))
+		return PTR_ERR(p);
+	if (p) {
+		int acl_size = p->a_count * sizeof(ext4_acl_entry);
+
+		nblocks += (S_ISDIR(mode) ? 2 : 1) *
+			__ext4_xattr_set_credits(sb, NULL /* inode */,
+						 NULL /* block_bh */, acl_size,
+						 true /* is_create */);
+		posix_acl_release(p);
+	}
+#endif
+
+#ifdef CONFIG_SECURITY
+	{
+		int num_security_xattrs = 1;
+
+#ifdef CONFIG_INTEGRITY
+		num_security_xattrs++;
+#endif
+		/*
+		 * We assume that security xattrs are never more than 1k.
+		 * In practice they are under 128 bytes.
+		 */
+		nblocks += num_security_xattrs *
+			__ext4_xattr_set_credits(sb, NULL /* inode */,
+						 NULL /* block_bh */, 1024,
+						 true /* is_create */);
+	}
+#endif
+	if (encrypt)
+		nblocks += __ext4_xattr_set_credits(sb,
+						    NULL /* inode */,
+						    NULL /* block_bh */,
+						    FSCRYPT_SET_CONTEXT_MAX_SIZE,
+						    true /* is_create */);
+	return nblocks;
+}
+
 /*
  * There are two policies for allocating an inode.  If the new inode is
  * a directory, then a forward search is made for a block group with both
@@ -796,45 +843,10 @@ struct inode *__ext4_new_inode(handle_t *handle, struct inode *dir,
 	}
 
 	if (!handle && sbi->s_journal && !(i_flags & EXT4_EA_INODE_FL)) {
-#ifdef CONFIG_EXT4_FS_POSIX_ACL
-		struct posix_acl *p = get_acl(dir, ACL_TYPE_DEFAULT);
-
-		if (IS_ERR(p))
-			return ERR_CAST(p);
-		if (p) {
-			int acl_size = p->a_count * sizeof(ext4_acl_entry);
-
-			nblocks += (S_ISDIR(mode) ? 2 : 1) *
-				__ext4_xattr_set_credits(sb, NULL /* inode */,
-					NULL /* block_bh */, acl_size,
-					true /* is_create */);
-			posix_acl_release(p);
-		}
-#endif
-
-#ifdef CONFIG_SECURITY
-		{
-			int num_security_xattrs = 1;
-
-#ifdef CONFIG_INTEGRITY
-			num_security_xattrs++;
-#endif
-			/*
-			 * We assume that security xattrs are never
-			 * more than 1k.  In practice they are under
-			 * 128 bytes.
-			 */
-			nblocks += num_security_xattrs *
-				__ext4_xattr_set_credits(sb, NULL /* inode */,
-					NULL /* block_bh */, 1024,
-					true /* is_create */);
-		}
-#endif
-		if (encrypt)
-			nblocks += __ext4_xattr_set_credits(sb,
-					NULL /* inode */, NULL /* block_bh */,
-					FSCRYPT_SET_CONTEXT_MAX_SIZE,
-					true /* is_create */);
+		ret2 = ext4_xattr_credits_for_new_inode(dir, mode, encrypt);
+		if (ret2 < 0)
+			return ERR_PTR(ret2);
+		nblocks += ret2;
 	}
 
 	ngroups = ext4_get_groups_count(sb);
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
