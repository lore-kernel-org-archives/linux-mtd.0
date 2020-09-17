Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83079C2BBD1
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 04:14:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AF9D22204
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 04:14:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="orlAZ2Dt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZU8LAn6O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AF9D22204
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=147+LXUjk+LGH/NMeFpzM8LcuhzU0ZZ1yyoUKdEUXDc=; b=orlAZ2DtLyGu0bU+z2hYaQn5b
	uyzJvNXaXdFE0RP8Ibmw/ya3muLKOoabDIptgko0b2zif9SZS+tD/7EOJfsoBVc0aPJtx7wL4oaX4
	UcBtKxzxh+ig66KNK+YQp5srHtjGqT4CaRzpLBAbQG2iVC1R2rXAVV4cTxVYCWDsMWkgfiF/ch9Mw
	l4zCAlyQJ55GGTwFeGOoDMu96QuOUisGE9J6dhVffSvalySOjgtcB6lm8sPbcPS3r0eufj1QKH1IJ
	ZCaz9OJr86F4XSCVnlAk+rVHoRo2f1FTEA9/ShnS0GizMHxZ8BhsBZL6OSDOphjnr7jrcxLn5ZEat
	7+DcRSeBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIlIR-0001Jp-I5; Thu, 17 Sep 2020 04:13:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIlID-0001DR-EL
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 04:13:12 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB72121973;
 Thu, 17 Sep 2020 04:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600315988;
 bh=b+br3C3cbfnBLBIC6l48f9MznNCXZDVFxP9oBuV6fkI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZU8LAn6Ou/W4N6ND26oun8qG5aZepZ6dTFMZDxiaRflydZRTsHZ35RWxtI5H1+IQl
 jmabDjvBJmMyQLQLBdXsgOZF4nY7Q7UNVBsq4RqsPzZiP4praeOA9Jzs90s2IcJ8eS
 +dfaFJXD+as/p7uWPMk6QpIGUokQ9QuvJWYc1YoM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v3 03/13] ext4: use fscrypt_prepare_new_inode() and
 fscrypt_set_context()
Date: Wed, 16 Sep 2020 21:11:26 -0700
Message-Id: <20200917041136.178600-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917041136.178600-1-ebiggers@kernel.org>
References: <20200917041136.178600-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_001309_635922_BA3C750C 
X-CRM114-Status: GOOD (  14.91  )
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

Convert ext4 to use the new functions fscrypt_prepare_new_inode() and
fscrypt_set_context().  This avoids calling
fscrypt_get_encryption_info() from within a transaction, which can
deadlock because fscrypt_get_encryption_info() isn't GFP_NOFS-safe.

For more details about this problem, see the earlier patch
"fscrypt: add fscrypt_prepare_new_inode() and fscrypt_set_context()".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ialloc.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/fs/ext4/ialloc.c b/fs/ext4/ialloc.c
index 0cc576005a923..698ca4a4db5f7 100644
--- a/fs/ext4/ialloc.c
+++ b/fs/ext4/ialloc.c
@@ -819,7 +819,7 @@ struct inode *__ext4_new_inode(handle_t *handle, struct inode *dir,
 	ext4_group_t i;
 	ext4_group_t flex_group;
 	struct ext4_group_info *grp;
-	int encrypt = 0;
+	bool encrypt = false;
 
 	/* Cannot create files in a deleted directory */
 	if (!dir || !dir->i_nlink)
@@ -831,24 +831,6 @@ struct inode *__ext4_new_inode(handle_t *handle, struct inode *dir,
 	if (unlikely(ext4_forced_shutdown(sbi)))
 		return ERR_PTR(-EIO);
 
-	if ((IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi)) &&
-	    (S_ISREG(mode) || S_ISDIR(mode) || S_ISLNK(mode)) &&
-	    !(i_flags & EXT4_EA_INODE_FL)) {
-		err = fscrypt_get_encryption_info(dir);
-		if (err)
-			return ERR_PTR(err);
-		if (!fscrypt_has_encryption_key(dir))
-			return ERR_PTR(-ENOKEY);
-		encrypt = 1;
-	}
-
-	if (!handle && sbi->s_journal && !(i_flags & EXT4_EA_INODE_FL)) {
-		ret2 = ext4_xattr_credits_for_new_inode(dir, mode, encrypt);
-		if (ret2 < 0)
-			return ERR_PTR(ret2);
-		nblocks += ret2;
-	}
-
 	ngroups = ext4_get_groups_count(sb);
 	trace_ext4_request_inode(dir, mode);
 	inode = new_inode(sb);
@@ -878,10 +860,25 @@ struct inode *__ext4_new_inode(handle_t *handle, struct inode *dir,
 	else
 		ei->i_projid = make_kprojid(&init_user_ns, EXT4_DEF_PROJID);
 
+	if (!(i_flags & EXT4_EA_INODE_FL)) {
+		err = fscrypt_prepare_new_inode(dir, inode, &encrypt);
+		if (err)
+			goto out;
+	}
+
 	err = dquot_initialize(inode);
 	if (err)
 		goto out;
 
+	if (!handle && sbi->s_journal && !(i_flags & EXT4_EA_INODE_FL)) {
+		ret2 = ext4_xattr_credits_for_new_inode(dir, mode, encrypt);
+		if (ret2 < 0) {
+			err = ret2;
+			goto out;
+		}
+		nblocks += ret2;
+	}
+
 	if (!goal)
 		goal = sbi->s_inode_goal;
 
@@ -1174,7 +1171,7 @@ struct inode *__ext4_new_inode(handle_t *handle, struct inode *dir,
 	 * prevent its deduplication.
 	 */
 	if (encrypt) {
-		err = fscrypt_inherit_context(dir, inode, handle, true);
+		err = fscrypt_set_context(inode, handle);
 		if (err)
 			goto fail_free_drop;
 	}
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
