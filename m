Return-Path: <SRS0=5rSU=GA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9DCC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Dec 2020 18:56:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 712FE229EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Dec 2020 18:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 712FE229EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QXzV3LLDh0LZxLLeskkHUqGeottDdwWlpX9wD3ZxHNI=; b=jW5GmCzhH83rMtKj2PvxA1AMd
	DUmRmOFvleEXtGEEdosQodQyB9JZtH/5/hZIscQDQxDb+FmDI3PsuHUmw0gjFUlJ4h1kqLED8jS8f
	zyApsc1k8ALPYoSDfx8mRHO10mSnzqyI/POl30gwKSA+VZmMtqSmI30/R1zMLG+dqHr1a5FllSFts
	/dVc38V3d14BCQv1cTU/ljoMEV8rryfuA9P183aUnxvVUfJP9bB1rNVoG0fDlf5s06xS0BlOnHy8i
	8EccAHBcv+ufah+lHbbSLRXdXSQ41A5Rh0NXMC8Ucdp2Ox17pIQghme4vU0mhL3hvt7oPTIKb6+05
	PJHYTTfOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktxgG-0007J2-Q9; Mon, 28 Dec 2020 18:55:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktxg6-0007Fn-Qa
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2020 18:55:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FF7822B2A;
 Mon, 28 Dec 2020 18:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609181729;
 bh=AM4SZDPH0pYqGNnbfRm/8TPtkieKxQQnEo9JrY1d/L0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ay/InPrZKA8998PTQNbH6QB1A6ChsCgP3BrVvi2UdjpLhi1uwG1Yk3Dr1W57szGyR
 jk6FYEWb/RG/VdnXR5ubDKN3dbKhZTtSoD70mUuTzUGqv3d1SKQUg2JtfVryzXXmSD
 mBa7FrvEu8ZQHfDlgzoW8p5Kf3eJv7ACV4cuudo95nLhJXkGaUFEkFkS4QrYOZIfhK
 8yl3w2Ho/lHg9DhBzCmed+LaYHdRhGvKyLzvsSJzR0Qq64NDtwLqZCP1z+N8IqXx2J
 2JWoxKk9gztQRvpRZ6nPrMcW5o6QYQMIoT+bGOjHLZineJdFZuBkXTeEzccv4uM/zO
 tiOiQsbYk1lew==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Subject: [PATCH 5.4 4/4] ubifs: prevent creating duplicate encrypted filenames
Date: Mon, 28 Dec 2020 10:54:33 -0800
Message-Id: <20201228185433.61129-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228185433.61129-1-ebiggers@kernel.org>
References: <20201228185433.61129-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_135535_076892_67F05DC8 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

commit 76786a0f083473de31678bdb259a3d4167cf756d upstream.

As described in "fscrypt: add fscrypt_is_nokey_name()", it's possible to
create a duplicate filename in an encrypted directory by creating a file
concurrently with adding the directory's encryption key.

Fix this bug on ubifs by rejecting no-key dentries in ubifs_create(),
ubifs_mkdir(), ubifs_mknod(), and ubifs_symlink().

Note that ubifs doesn't actually report the duplicate filenames from
readdir, but rather it seems to replace the original dentry with a new
one (which is still wrong, just a different effect from ext4).

On ubifs, this fixes xfstest generic/595 as well as the new xfstest I
wrote specifically for this bug.

Fixes: f4f61d2cc6d8 ("ubifs: Implement encrypted filenames")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20201118075609.120337-5-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/dir.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 6c0e19f7a21f4..a5e5e9b9d4e31 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -278,6 +278,15 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 	return d_splice_alias(inode, dentry);
 }
 
+static int ubifs_prepare_create(struct inode *dir, struct dentry *dentry,
+				struct fscrypt_name *nm)
+{
+	if (fscrypt_is_nokey_name(dentry))
+		return -ENOKEY;
+
+	return fscrypt_setup_filename(dir, &dentry->d_name, 0, nm);
+}
+
 static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 			bool excl)
 {
@@ -301,7 +310,7 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 	if (err)
 		return err;
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	err = ubifs_prepare_create(dir, dentry, &nm);
 	if (err)
 		goto out_budg;
 
@@ -961,7 +970,7 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 	if (err)
 		return err;
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	err = ubifs_prepare_create(dir, dentry, &nm);
 	if (err)
 		goto out_budg;
 
@@ -1046,7 +1055,7 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 		return err;
 	}
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	err = ubifs_prepare_create(dir, dentry, &nm);
 	if (err) {
 		kfree(dev);
 		goto out_budg;
@@ -1130,7 +1139,7 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 	if (err)
 		return err;
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	err = ubifs_prepare_create(dir, dentry, &nm);
 	if (err)
 		goto out_budg;
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
