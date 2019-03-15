Return-Path: <SRS0=5Vwq=RS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF3EC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 20:55:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 211BE218A1
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 20:55:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rv22k+jr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCjq3nlG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 211BE218A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=syNMPqeDAJ2f+Zcxntd1ZQld1o9XWfxHfISvam+QYo4=; b=rv22k+jraSH+hM
	FUFbSQi45OFGLznqxpXJZi89/nqviIilyczmA8W6i9gkt6AZKHs67cnPG0e8HmKehv7VJL/h6MonU
	HE3m6LytrkyFAz04xqgQRYhUD3Py9gdhEukqCXlcn9QepeqMsOL/H9+s5ZDDGPMMnIMgRi1CjK1vv
	rzHPfR+ytBd8Y/7mdu5Cbv4ILpcXe0GsvSjglzAye2izM0C/AVhFiFY7wP2uMPrvJF5L+0vLUu+Z7
	y/YPMQ25TI8Z6TsqkyHCdxt1NriDukjWuTvlcXBnmRcf3QxFM4o/+I8seBA9zhPkfnBXq4b8J9zzW
	LZPELEssVnb8w8BDBBKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4tr3-0005d5-8r; Fri, 15 Mar 2019 20:55:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4tr0-0005co-Fh
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2019 20:54:59 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B27B4218A1;
 Fri, 15 Mar 2019 20:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1552683297;
 bh=pg1zUG0MG4f6k5icB+Gdlt3BtHXMInEkU6/jrdNyaZQ=;
 h=From:To:Cc:Subject:Date:From;
 b=UCjq3nlG2FKQX3RTk7y0BjuVNJRrDKCEwexvoVi2Kiw6Vvn8AlOxmmpQV1QE/tsZ6
 2nhu85a44/kXHtFl+9pm72UAfWHtWfAF2WZXrVe2PYVmnZvPfHP2VEjunE2My6677k
 cswdu4LZPg50Uj6Obc/Rd+n4DKM4Lhs6POJgPmQo=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: remove unnecessary calls to set up directory key
Date: Fri, 15 Mar 2019 13:54:32 -0700
Message-Id: <20190315205432.195263-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.360.g471c308f928-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_135458_541278_37517D2B 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-fscrypt@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

In ubifs_unlink() and ubifs_rmdir(), remove the call to
fscrypt_get_encryption_info() that precedes fscrypt_setup_filename().
This call was unnecessary, because fscrypt_setup_filename() already
tries to set up the directory's encryption key.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/dir.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 5767b373a8ff..c3311ea68fe5 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -792,12 +792,6 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 		dentry, inode->i_ino,
 		inode->i_nlink, dir->i_ino);
 
-	if (ubifs_crypt_is_encrypted(dir)) {
-		err = fscrypt_get_encryption_info(dir);
-		if (err && err != -ENOKEY)
-			return err;
-	}
-
 	err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
 	if (err)
 		return err;
@@ -902,12 +896,6 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 	if (err)
 		return err;
 
-	if (ubifs_crypt_is_encrypted(dir)) {
-		err = fscrypt_get_encryption_info(dir);
-		if (err && err != -ENOKEY)
-			return err;
-	}
-
 	err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
 	if (err)
 		return err;
-- 
2.21.0.360.g471c308f928-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
