Return-Path: <SRS0=DhJx=CW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77114C2D0E1
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 08:39:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3344D207C3
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 08:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UTIyRYtC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dt37vv3o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3344D207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kb7oiRQF4G0+LBjSnAS/NSnSFELkjwWmXOZd1lNdUFs=; b=UTIyRYtC+8DpSbpZKS27pnj2h
	O/n3rIav+XTdBOjGkMtx6UDNrKRxzmTqWDpRyaNoejTHx5H76Kuv9Sty0rFdgsaylxYmY2SJnQukv
	xg/JP3SN/GNM5MLr1g1471Q02v/GnYgcOyttmThitc09FFNJhKMQY9yxNwYclVokG28U61jUaT0wi
	PLt3tFWTG9qjbzdhwIM4SAyFcJ8fzeoHX3kRF31IsGw0QX0V3S+z/NgWBqH0FLCc4Ni4bQMwzm6Vt
	GfTtYGkGgfwwV47hdEtXh/O+Pmck4WtdPq7NHKp4yal0HkGquHJyujRnUKK6BjKw3SSXO+8Bcqo+Z
	4HFDqq6Eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHNWa-000146-7x; Sun, 13 Sep 2020 08:38:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHNWM-0000zh-Ot
 for linux-mtd@lists.infradead.org; Sun, 13 Sep 2020 08:38:06 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F82221974;
 Sun, 13 Sep 2020 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599986279;
 bh=kONvZL9ec2SBbE4EAel9mci0YCQN1pZc7hmFt/F6qwY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dt37vv3oahYtgL3ZyctM6QKg97LdSKU34ArCqE9y/U84AQImmjJjp3IWpIeQl2boS
 KR5a1PsbxdPL8JYbUIX8BxdraDjfMGMuehFFlmoxAmRLN8Iu8UVTjj0WRil4BKsjzY
 V8lffoJKumHVSbQOwdTzejpV6lXUi6DoBaK6UQQ4=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 05/11] ubifs: use fscrypt_prepare_new_inode() and
 fscrypt_set_context()
Date: Sun, 13 Sep 2020 01:36:14 -0700
Message-Id: <20200913083620.170627-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200913083620.170627-1-ebiggers@kernel.org>
References: <20200913083620.170627-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_043802_961163_12E14E43 
X-CRM114-Status: GOOD (  15.89  )
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
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Convert ubifs to use the new functions fscrypt_prepare_new_inode() and
fscrypt_set_context().

Unlike ext4 and f2fs, this doesn't appear to fix any deadlock bug.  But
it does shorten the code slightly and get all filesystems using the same
helper functions, so that fscrypt_inherit_context() can be removed.

It also fixes an incorrect error code where ubifs returned EPERM instead
of the expected ENOKEY.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/dir.c | 38 ++++++++++++++++----------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index a9c1f5a9c9bdd..155521e51ac57 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -81,19 +81,6 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 	struct ubifs_inode *ui;
 	bool encrypted = false;
 
-	if (IS_ENCRYPTED(dir)) {
-		err = fscrypt_get_encryption_info(dir);
-		if (err) {
-			ubifs_err(c, "fscrypt_get_encryption_info failed: %i", err);
-			return ERR_PTR(err);
-		}
-
-		if (!fscrypt_has_encryption_key(dir))
-			return ERR_PTR(-EPERM);
-
-		encrypted = true;
-	}
-
 	inode = new_inode(c->vfs_sb);
 	ui = ubifs_inode(inode);
 	if (!inode)
@@ -112,6 +99,12 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 			 current_time(inode);
 	inode->i_mapping->nrpages = 0;
 
+	err = fscrypt_prepare_new_inode(dir, inode, &encrypted);
+	if (err) {
+		ubifs_err(c, "fscrypt_prepare_new_inode failed: %i", err);
+		goto out_iput;
+	}
+
 	switch (mode & S_IFMT) {
 	case S_IFREG:
 		inode->i_mapping->a_ops = &ubifs_file_address_operations;
@@ -131,7 +124,6 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 	case S_IFBLK:
 	case S_IFCHR:
 		inode->i_op  = &ubifs_file_inode_operations;
-		encrypted = false;
 		break;
 	default:
 		BUG();
@@ -151,9 +143,8 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 		if (c->highest_inum >= INUM_WATERMARK) {
 			spin_unlock(&c->cnt_lock);
 			ubifs_err(c, "out of inode numbers");
-			make_bad_inode(inode);
-			iput(inode);
-			return ERR_PTR(-EINVAL);
+			err = -EINVAL;
+			goto out_iput;
 		}
 		ubifs_warn(c, "running out of inode numbers (current %lu, max %u)",
 			   (unsigned long)c->highest_inum, INUM_WATERMARK);
@@ -171,16 +162,19 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 	spin_unlock(&c->cnt_lock);
 
 	if (encrypted) {
-		err = fscrypt_inherit_context(dir, inode, &encrypted, true);
+		err = fscrypt_set_context(inode, NULL);
 		if (err) {
-			ubifs_err(c, "fscrypt_inherit_context failed: %i", err);
-			make_bad_inode(inode);
-			iput(inode);
-			return ERR_PTR(err);
+			ubifs_err(c, "fscrypt_set_context failed: %i", err);
+			goto out_iput;
 		}
 	}
 
 	return inode;
+
+out_iput:
+	make_bad_inode(inode);
+	iput(inode);
+	return ERR_PTR(err);
 }
 
 static int dbg_check_name(const struct ubifs_info *c,
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
