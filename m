Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05833C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 07:58:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8894120B80
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 07:58:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WOGkmJqM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETs/fepe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8894120B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=poWiJHTdTXa21yXKqJwwQXFeQawrPwAggy7jLgGByas=; b=WOGkmJqMzgnFMDgRhE+jwYSBf
	6ofcKiIRrSa654oIbbvi2b4jgJOT8aSj1U3DE8iRQS6CdLiRU71ZWP8fhL58we7z39ZmbZAt/N656
	DSF6QcI7nrfAj00d7brL0tK6h1L4nG3k5k2xnCHH0YV4qlzkH2+KPJUS/9fUwXrTQjEXrYk7ZLW19
	drBBlelMudX+48akmff0J/aYs5GuHTeWX2bLI26xZesYJhaG/wwWUP7re0fK2QVUnxi8f/7sPrijZ
	UnsE+ZbfYDBl/exdfyiQHHVdJuudSZTkohd0uW5lxljhVFLM0mdmv9Dzuz8m9b499b2Yk6+yNrSFw
	7w6veAR9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfILg-0002n5-BP; Wed, 18 Nov 2020 07:57:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfILW-0002kP-CD
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 07:57:43 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72022246B2;
 Wed, 18 Nov 2020 07:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605686261;
 bh=FaJPS+4AhsPK9Hjqvyuvxb/1dnxymbnVlmZfAPn5gcU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ETs/fepezweXiR3RVvD/V08ZO2J+3w+axT1045ZXG0ySoHoOPkv8KQGhsYkhLcqGs
 xVfQzJxdV+6XoMxfSSp/QZ/D0rjuhBJeN1gE+7S7o11NaQpjRy4O4ZLCXloc3aUcTV
 L4jkljPJYdapxPjojPTtKPw+RVYI5VVc0BNtD4bQ=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH 5/5] fscrypt: remove unnecessary calls to fscrypt_require_key()
Date: Tue, 17 Nov 2020 23:56:09 -0800
Message-Id: <20201118075609.120337-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118075609.120337-1-ebiggers@kernel.org>
References: <20201118075609.120337-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_025742_639352_53948998 
X-CRM114-Status: GOOD (  16.87  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

In an encrypted directory, a regular dentry (one that doesn't have the
no-key name flag) can only be created if the directory's encryption key
is available.

Therefore the calls to fscrypt_require_key() in __fscrypt_prepare_link()
and __fscrypt_prepare_rename() are unnecessary, as these functions
already check that the dentries they're given aren't no-key names.

Remove these unnecessary calls to fscrypt_require_key().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/hooks.c       | 26 ++++++++------------------
 include/linux/fscrypt.h |  3 +--
 2 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 061418be4b08..c582e2ddb39c 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -54,15 +54,12 @@ EXPORT_SYMBOL_GPL(fscrypt_file_open);
 int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
 			   struct dentry *dentry)
 {
-	int err;
-
-	err = fscrypt_require_key(dir);
-	if (err)
-		return err;
-
-	/* ... in case we looked up no-key name before key was added */
 	if (fscrypt_is_nokey_name(dentry))
 		return -ENOKEY;
+	/*
+	 * We don't need to separately check that the directory inode's key is
+	 * available, as it's implied by the dentry not being a no-key name.
+	 */
 
 	if (!fscrypt_has_permitted_context(dir, inode))
 		return -EXDEV;
@@ -75,20 +72,13 @@ int __fscrypt_prepare_rename(struct inode *old_dir, struct dentry *old_dentry,
 			     struct inode *new_dir, struct dentry *new_dentry,
 			     unsigned int flags)
 {
-	int err;
-
-	err = fscrypt_require_key(old_dir);
-	if (err)
-		return err;
-
-	err = fscrypt_require_key(new_dir);
-	if (err)
-		return err;
-
-	/* ... in case we looked up no-key name(s) before key was added */
 	if (fscrypt_is_nokey_name(old_dentry) ||
 	    fscrypt_is_nokey_name(new_dentry))
 		return -ENOKEY;
+	/*
+	 * We don't need to separately check that the directory inodes' keys are
+	 * available, as it's implied by the dentries not being no-key names.
+	 */
 
 	if (old_dir != new_dir) {
 		if (IS_ENCRYPTED(new_dir) &&
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 8e1d31c959bf..0c9e64969b73 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -710,8 +710,7 @@ static inline int fscrypt_require_key(struct inode *inode)
  *
  * A new link can only be added to an encrypted directory if the directory's
  * encryption key is available --- since otherwise we'd have no way to encrypt
- * the filename.  Therefore, we first set up the directory's encryption key (if
- * not already done) and return an error if it's unavailable.
+ * the filename.
  *
  * We also verify that the link will not violate the constraint that all files
  * in an encrypted directory tree use the same encryption policy.
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
