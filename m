Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC6DC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 18:40:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C41342146E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 18:40:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YDFNwE4X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0Y8/2ajX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C41342146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGap+xKHyYtDnZr8QiTxir/DcMig3/O20BLNnlNZYYY=; b=YDFNwE4XmpuQiU
	r6uXpgcNC9D000D5H1D3Dmj79Gt8i7Qntc8/sxeZomygHmhyaK3cmodsTSbQGBbWyPmE9ImrA4gc8
	aiSUSH7dvefPCvdgKjHB2+u1dKtBc0kW3x/dOdu7GmWpsfJRQXn4c97SjtR86aigwYur1f14hFAYk
	ISPhhQtqMrIzVcMKO+7t5yZVSUYt4OGSrXAhMyh5Wn3IatQqo+dS5QHPhRrJjGtFEJU5iAS0J6UnM
	FwEAQqM036um8FLvX2Cdv824BovYmysQQT82TsjTpnyMOymync2HuwllCx05JoxWAvNem4uS8ghow
	wHOPXpEcfRAdURTNxQzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6g93-00010A-BK; Wed, 20 Mar 2019 18:40:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6g8N-0008Uw-CF
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 18:40:17 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD93B21873;
 Wed, 20 Mar 2019 18:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553107215;
 bh=GVgaWnQRVDs7JRYe6xnoJZc6eiXCKyqXo6bHkLGC1Rk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0Y8/2ajXXylCpL94BCn1e/yyk7Dy9TuPTbDGiY3kRwbwE3ldpc1fNoGMtRj8w/boP
 S56eq7xpwINi4YBF4SduNyFX1FQNMh0TY9Rlc75/i647zHz/s68hEW2dKCTJcLZZay
 ULqAZ530hqJSJNLGGnuZOzF01ai2/kfpobmEKHHQ=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 3/5] fs,
 fscrypt: clear DCACHE_ENCRYPTED_NAME when unaliasing directory
Date: Wed, 20 Mar 2019 11:39:11 -0700
Message-Id: <20190320183913.12686-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.225.g810b269d1ac-goog
In-Reply-To: <20190320183913.12686-1-ebiggers@kernel.org>
References: <20190320183913.12686-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_114015_666033_0657EBE6 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: Gao Xiang <gaoxiang25@huawei.com>, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Sarthak Kukreti <sarthakkukreti@chromium.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Make __d_move() clear DCACHE_ENCRYPTED_NAME on the source dentry.  This
is needed for when d_splice_alias() moves a directory's encrypted alias
to its decrypted alias as a result of the encryption key being added.

Otherwise, the decrypted alias will incorrectly be invalidated on the
next lookup, causing problems such as unmounting a mount the user just
mount()ed there.

Note that we don't have to support arbitrary moves of this flag because
fscrypt doesn't allow dentries with DCACHE_ENCRYPTED_NAME to be the
source or target of a rename().

Fixes: 28b4c263961c ("ext4 crypto: revalidate dentry after adding or removing the key")
Reported-by: Sarthak Kukreti <sarthakkukreti@chromium.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/dcache.c             |  2 ++
 include/linux/fscrypt.h | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index aac41adf47433..647e6ed426e20 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -18,6 +18,7 @@
 #include <linux/string.h>
 #include <linux/mm.h>
 #include <linux/fs.h>
+#include <linux/fscrypt.h>
 #include <linux/fsnotify.h>
 #include <linux/slab.h>
 #include <linux/init.h>
@@ -2795,6 +2796,7 @@ static void __d_move(struct dentry *dentry, struct dentry *target,
 	list_move(&dentry->d_child, &dentry->d_parent->d_subdirs);
 	__d_rehash(dentry);
 	fsnotify_update_flags(dentry);
+	fscrypt_handle_d_move(dentry);
 
 	write_seqcount_end(&target->d_seq);
 	write_seqcount_end(&dentry->d_seq);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 4ad7a856e0f1c..39bd2619a3424 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -88,6 +88,18 @@ static inline bool fscrypt_dummy_context_enabled(struct inode *inode)
 		inode->i_sb->s_cop->dummy_context(inode);
 }
 
+/*
+ * When d_splice_alias() moves a directory's encrypted alias to its decrypted
+ * alias as a result of the encryption key being added, DCACHE_ENCRYPTED_NAME
+ * must be cleared.  Note that we don't have to support arbitrary moves of this
+ * flag because fscrypt doesn't allow encrypted aliases to be the source or
+ * target of a rename().
+ */
+static inline void fscrypt_handle_d_move(struct dentry *dentry)
+{
+	dentry->d_flags &= ~DCACHE_ENCRYPTED_NAME;
+}
+
 /* crypto.c */
 extern void fscrypt_enqueue_decrypt_work(struct work_struct *);
 extern struct fscrypt_ctx *fscrypt_get_ctx(const struct inode *, gfp_t);
@@ -243,6 +255,10 @@ static inline bool fscrypt_dummy_context_enabled(struct inode *inode)
 	return false;
 }
 
+static inline void fscrypt_handle_d_move(struct dentry *dentry)
+{
+}
+
 /* crypto.c */
 static inline void fscrypt_enqueue_decrypt_work(struct work_struct *work)
 {
-- 
2.21.0.225.g810b269d1ac-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
