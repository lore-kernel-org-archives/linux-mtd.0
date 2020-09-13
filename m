Return-Path: <SRS0=DhJx=CW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBE8C2D0A7
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 08:39:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 050732098B
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 08:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BP2e3sU+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="htn5yvO7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 050732098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CE28vl2cYUS6o0c2Ef1E178LGay0pbj2audtem8oQ5k=; b=BP2e3sU+DiiYXSsnDFUQue4Lp
	+mxvzJrwuPDhm1XxExignLsj+itX7ZsorPhdBG6IeGf5FPfsIgvdUTEE3NljpgOBMHYzxzrUVSLi/
	fmhcQxLnKX1RkYiXlJdlW98fR8Hd4N2LFNDXamYOeuAMSNxmwnjkmbFduRrUbL5qAY55atJcOE7GM
	86KZQ7QV7R4lbg8ABYBgC77ExLB8aCOKYCa/CKogKWlJNgbvmhsSOgfJyuky82yMj3G1B22tf0yCu
	lQr1p0Jcf70qxm8sBVKK2SWjRlrGuXPPOEX6rwtPbu4Q3dHxGB2ANZ2ciVV5jN0U+l9O0Ftbcysyu
	izLgpXpjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHNWY-00013j-Te; Sun, 13 Sep 2020 08:38:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHNWM-0000zk-Ow
 for linux-mtd@lists.infradead.org; Sun, 13 Sep 2020 08:38:04 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ADEDA21897;
 Sun, 13 Sep 2020 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599986279;
 bh=ZzMv1pUhY0NvnbJHjrS2ra7ESt6vtXPBJHTWIdsGFCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=htn5yvO7LimZHQRe0sNzsC6HWpNV2ozCcjLCoxA2U9dMCvVUhX+F3sLgJGNsNeThm
 Qpm56LCeKLX/y+YPmuNFV3XiL6WWzw4EGH/L7x1ZgQem4c6oYP9lj9QNygbClngGw9
 gIDlHOloDtyrRG1uzwwilmGP9u8I6vN0pvLAbntk=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 07/11] fscrypt: require that fscrypt_encrypt_symlink()
 already has key
Date: Sun, 13 Sep 2020 01:36:16 -0700
Message-Id: <20200913083620.170627-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200913083620.170627-1-ebiggers@kernel.org>
References: <20200913083620.170627-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_043802_904995_0A6BB211 
X-CRM114-Status: GOOD (  14.56  )
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

Now that all filesystems have been converted to use
fscrypt_prepare_new_inode(), the encryption key for new symlink inodes
is now already set up whenever we try to encrypt the symlink target.
Enforce this rather than try to set up the key again when it may be too
late to do so safely.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/hooks.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 491b252843eb9..7748db5092409 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -217,9 +217,13 @@ int __fscrypt_encrypt_symlink(struct inode *inode, const char *target,
 	struct fscrypt_symlink_data *sd;
 	unsigned int ciphertext_len;
 
-	err = fscrypt_require_key(inode);
-	if (err)
-		return err;
+	/*
+	 * fscrypt_prepare_new_inode() should have already set up the new
+	 * symlink inode's encryption key.  We don't wait until now to do it,
+	 * since we may be in a filesystem transaction now.
+	 */
+	if (WARN_ON_ONCE(!fscrypt_has_encryption_key(inode)))
+		return -ENOKEY;
 
 	if (disk_link->name) {
 		/* filesystem-provided buffer */
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
