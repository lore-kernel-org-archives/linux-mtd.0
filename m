Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E4BC282DA
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 17:30:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A69F2229E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 17:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FXTYj2IH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ge19XQYO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A69F2229E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rt6f7gSy+6iglGUPDsXss4YBx383/nhe5fpJjBG36+M=; b=FXTYj2IHuidEVv
	3kkAyVKd9i/5h8VfZDcJX1PmUnBYHy2o7XmnPL838oWalBPPcKVJgBjgBMkwoG0DEv7OjZfN/lPWO
	PYZ0v/QG01jnS1w+P2X9dzsdYr63Be0a/pBodCTCyOsux3Xn+nv/pDsDaH2iBy3v+JB0GDZ+AS6Dv
	5l7nWJjdyMIXILSKApRKYfX8+nfytlg7T2VcoAD5sF0375l1s+B3SJLCYozZgkfoyQ4WeQstaWYk9
	NqJMmvukcxfdGBr7eE1DoinZxzdTT81jQQPjZnbEZWnXHIVMm05t+awdbejnvlaQrxwXPNkVHoq0Y
	hAyj7pYlGolC9Z9MfqRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtFPQ-0000Hj-MJ; Mon, 11 Feb 2019 17:30:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtFOl-0007HD-Rl
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 17:29:41 +0000
Received: from sol.localdomain (c-107-3-167-184.hsd1.ca.comcast.net
 [107.3.167.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACFFC222A1;
 Mon, 11 Feb 2019 17:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549906179;
 bh=5LYMT5g+CNbalpnPlcMdbfzsnzxCoHQt6lh+tMxW4tA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ge19XQYOlMt8XOpMEM18XV6plOCaMoKAWLsSD195xIfJlqhvd7WHCQBHyEwP8j+qu
 c6dzZik+4IHYQ9OHmvTWPTq7T75hLaF20GV9qKiANSQSmgGkZbP7NLLSfexMysvR83
 84hACENIlkuxqaQ1ZhTy2UfLdXlt87gkfX1FaMTQ=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [RFC PATCH v2 05/20] fscrypt: add ->ci_inode to fscrypt_info
Date: Mon, 11 Feb 2019 09:27:23 -0800
Message-Id: <20190211172738.4633-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190211172738.4633-1-ebiggers@kernel.org>
References: <20190211172738.4633-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_092940_059416_B74CB376 
X-CRM114-Status: GOOD (  11.40  )
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

Add an inode back-pointer to 'struct fscrypt_info', such that
inode->i_crypt_info->ci_inode == inode.

This will be useful for:

1. Evicting the inodes when a fscrypt key is removed, since we'll track
   the inodes using a given key by linking their fscrypt_infos together,
   rather than the inodes directly.  This avoids bloating 'struct inode'
   with a new list_head.

2. Simplifying the per-file key setup, since the inode pointer won't
   have to be passed around everywhere just in case something goes wrong
   and it's needed for fscrypt_warn().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h | 3 +++
 fs/crypto/keyinfo.c         | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 52e09ef40bfa..ac24edfc297f 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -73,6 +73,9 @@ struct fscrypt_info {
 	 */
 	struct fscrypt_mode *ci_mode;
 
+	/* Back-pointer to the inode */
+	struct inode *ci_inode;
+
 	/*
 	 * If non-NULL, then this inode uses a master key directly rather than a
 	 * derived key, and ci_ctfm will equal ci_master_key->mk_ctfm.
diff --git a/fs/crypto/keyinfo.c b/fs/crypto/keyinfo.c
index a8c1e886b0bc..6c1e675d4eef 100644
--- a/fs/crypto/keyinfo.c
+++ b/fs/crypto/keyinfo.c
@@ -542,6 +542,8 @@ int fscrypt_get_encryption_info(struct inode *inode)
 	if (!crypt_info)
 		return -ENOMEM;
 
+	crypt_info->ci_inode = inode;
+
 	crypt_info->ci_flags = ctx.flags;
 	crypt_info->ci_data_mode = ctx.contents_encryption_mode;
 	crypt_info->ci_filename_mode = ctx.filenames_encryption_mode;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
