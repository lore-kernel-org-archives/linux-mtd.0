Return-Path: <SRS0=YFz0=RR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674D2C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 17:16:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E9D3217F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 17:16:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xvlpmu8Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E9D3217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Mmd45AU0+F2RjPsD2lo2FFKgf7Qsdxy7FW/m5yo6Ek=; b=Xvlpmu8ZcBrdau
	KvkgSYmQ+5zeMkugBgiuBGL7/FtBmMHzDqXIrPMazlyxt/GGgY7nXwPB6vfU9EkXSCEN/UNm+6pIf
	V9KzpoxlN+uogKJ9awEivL49KinmU3BX1NbcA92/HJgp7yNM8urt7/V8FKPBB4e3NybMnaCusx79p
	TD2s/JKFKknaib/gmhA9UmDqIfAmFyoynABQkZI5M8QTEKw+XrZAHokx90/2x7D2G6BL8aaJmGnQk
	Ba6viMeGXCi4MNtSAfhBdDeivQLMQ0Lw1nntabNMOCPA5tuBO3h0+C9NSwqvMTi76RQp6AA2mHx5G
	J2hX25aoY4rMKHnaui8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4TyF-00018i-A6; Thu, 14 Mar 2019 17:16:43 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4Ty7-00015n-2k
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2019 17:16:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 175C21802DF74;
 Thu, 14 Mar 2019 18:16:16 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] fscrypt: Export fscrypt_d_ops
Date: Thu, 14 Mar 2019 18:15:57 +0100
Message-Id: <20190314171559.27584-3-richard@nod.at>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190314171559.27584-1-richard@nod.at>
References: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
 <20190314171559.27584-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_101635_267935_82771656 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: tytso@mit.edu, miklos@szeredi.hu, Richard Weinberger <richard@nod.at>,
 amir73il@gmail.com, linux-unionfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, paullawrence@google.com,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If a filesystem manages dentry operations itself it might want to
re-use fscrypt_d_ops.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/crypto/crypto.c          | 1 +
 fs/crypto/fscrypt_private.h | 1 -
 include/linux/fscrypt.h     | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 4dc788e3bc96..8018f8bba50d 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -357,6 +357,7 @@ static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 const struct dentry_operations fscrypt_d_ops = {
 	.d_revalidate = fscrypt_d_revalidate,
 };
+EXPORT_SYMBOL(fscrypt_d_ops);
 
 void fscrypt_restore_control_page(struct page *page)
 {
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 7da276159593..bced1ee4fd64 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -125,7 +125,6 @@ extern int fscrypt_do_page_crypto(const struct inode *inode,
 				  gfp_t gfp_flags);
 extern struct page *fscrypt_alloc_bounce_page(struct fscrypt_ctx *ctx,
 					      gfp_t gfp_flags);
-extern const struct dentry_operations fscrypt_d_ops;
 
 extern void __printf(3, 4) __cold
 fscrypt_msg(struct super_block *sb, const char *level, const char *fmt, ...);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 7139a110ac4f..2b9577e4707f 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -231,6 +231,7 @@ extern int __fscrypt_encrypt_symlink(struct inode *inode, const char *target,
 extern const char *fscrypt_get_symlink(struct inode *inode, const void *caddr,
 				       unsigned int max_size,
 				       struct delayed_call *done);
+extern const struct dentry_operations fscrypt_d_ops;
 #else  /* !CONFIG_FS_ENCRYPTION */
 
 static inline bool fscrypt_has_encryption_key(const struct inode *inode)
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
