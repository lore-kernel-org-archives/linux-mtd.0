Return-Path: <SRS0=oRr0=34=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF90C2BA83
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Feb 2020 01:36:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F419D20715
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Feb 2020 01:36:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HJewJW6P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="tHAHsO84"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F419D20715
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0a9DYtbct6IiDrs+KEbZm5LV02thZAsuNLV+P0P1XaI=; b=HJewJW6Pqea0VP
	dEpokqIfGNDfqNd14p/NLAiEGQcd9gqPPjhSJR5qL0gw2oqFVsp2RD29XqrbbrOILpYiBcALXmwbA
	3nOp2Pt0dKhHHEvr3BoK3G0YxGQb7shjNUbkSvRQabqx7f1G4+aleHqLxqMUwjgZfkEVrr+Y+1NzJ
	sxVjaRLs43q1qW6oSc3nYQixxyqZY7fgPXv4OjhLepQYECWv+clBrr5fRS67en61sdM1qS/Z5poXb
	gsusVu2VbhdJ960hPB2Zmar+ieBzei89GgrVHRq8GTT04fo5vHGQdmELU6aAVXAvWYuPCrJbCNMGn
	ZayhsWO8FRei4T8fk79Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j0F2y-00071v-4W; Sat, 08 Feb 2020 01:36:36 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j0F2Q-0006J7-Mm
 for linux-mtd@lists.infradead.org; Sat, 08 Feb 2020 01:36:04 +0000
Received: by mail-pj1-x104a.google.com with SMTP id hi12so2336369pjb.7
 for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2020 17:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=lQld5kNve/mYGx33ywgb3C2T81loeCfqKmMUxoorgwo=;
 b=tHAHsO84KZodW1A5q0UcxWbVd34YpN8bKrI45/UzTyYqtOtMHxtv9z1eu2YWmF3rp8
 pto73M5v2Zi1uc8Gh+/xbMcBwhSTjTm8IvlR413WLCCivWmR4vzwovxq+mf62QH7nkDU
 L+sBiYtHaxliorz2p0bcAhGmb+0qSNw2i+sSoyisJuR7x4NDMDUxs2lKvSsnNDXOv2OB
 pvlmy1N5G5zntq59sgU//zZcJbkE56oM4NZDlKr/fkGPPx2IH6izyOp1oeN1wgvzST28
 GFooSK5uattgEpIcNWFN1UdaaBMabjTSJ18At+opMzvVwQ2y0sxHoesTw8521mkBX/MJ
 MF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=lQld5kNve/mYGx33ywgb3C2T81loeCfqKmMUxoorgwo=;
 b=tk53rfWUzPoSoZJ5fH5PM1cccMnK1FXskh1h2DPkylgKMIrlf0I3HCqZ8mhCdLe949
 CnLKso7QB+S1aG52phKF0bqL9gMrKb9T4VPQFUqhNnn4XrOAn30U1bHltm518kIDSEs/
 ek0U2YLDUNEf4MLXiyVA0oeayXB52PkYb3KxrBG1MjB1WzX/Gm1IC121HDQMSUEIn0fJ
 Rj9eJnbSreXFYJlXV/J3c4bumt0cwIKLa3+CiItTQo+aUQTXPfleReGwTPdViyNc/wIp
 R5RYS3PKvCNuNskebHmIRAboq2BYzzutKzTx2P84crZaCaZA20P08hZABeQfEKaLuc1p
 hEQg==
X-Gm-Message-State: APjAAAX/xMJjBweRgpBGgr70OxFRCoX/u4uC6iGi7Mi4jv7iguneTz6X
 Fiy3FAepPUzXCwJD4/L9mPiUs6SzLzo=
X-Google-Smtp-Source: APXvYqxnNQ327ovtQHLo13uDQ5tgGKOObkOGRtYqXrH4MruUSC0Npomkwh/Lx38xaSz0tJRsjDFKBHOo3Nk=
X-Received: by 2002:a63:e30e:: with SMTP id f14mr2179384pgh.260.1581125761051; 
 Fri, 07 Feb 2020 17:36:01 -0800 (PST)
Date: Fri,  7 Feb 2020 17:35:46 -0800
In-Reply-To: <20200208013552.241832-1-drosen@google.com>
Message-Id: <20200208013552.241832-3-drosen@google.com>
Mime-Version: 1.0
References: <20200208013552.241832-1-drosen@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v7 2/8] fs: Add standard casefolding support
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_173602_783732_A537BB15 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This adds general supporting functions for filesystems that use
utf8 casefolding. It provides standard dentry_operations and adds the
necessary structures in struct super_block to allow this standardization.

Ext4 and F2fs are switch to these implementations.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/libfs.c         | 77 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h | 22 +++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index c686bd9caac67..433c283df3099 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -20,6 +20,9 @@
 #include <linux/fs_context.h>
 #include <linux/pseudo_fs.h>
 #include <linux/fsnotify.h>
+#include <linux/unicode.h>
+#include <linux/fscrypt.h>
+#include <linux/stringhash.h>
 
 #include <linux/uaccess.h>
 
@@ -1361,3 +1364,77 @@ bool is_empty_dir_inode(struct inode *inode)
 	return (inode->i_fop == &empty_dir_operations) &&
 		(inode->i_op == &empty_dir_inode_operations);
 }
+
+#ifdef CONFIG_UNICODE
+bool needs_casefold(const struct inode *dir)
+{
+	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding &&
+			(!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir));
+}
+EXPORT_SYMBOL(needs_casefold);
+
+int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
+			  const char *str, const struct qstr *name)
+{
+	const struct dentry *parent = READ_ONCE(dentry->d_parent);
+	const struct inode *inode = READ_ONCE(parent->d_inode);
+	const struct super_block *sb = dentry->d_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	struct qstr entry = QSTR_INIT(str, len);
+	int ret;
+
+	if (!inode || !needs_casefold(inode))
+		goto fallback;
+
+	ret = utf8_strncasecmp(um, name, &entry);
+	if (ret >= 0)
+		return ret;
+
+	if (sb_has_enc_strict_mode(sb))
+		return -EINVAL;
+fallback:
+	if (len != name->len)
+		return 1;
+	return !!memcmp(str, name->name, len);
+}
+EXPORT_SYMBOL(generic_ci_d_compare);
+
+struct hash_ctx {
+	struct utf8_itr_context ctx;
+	unsigned long hash;
+};
+
+static int do_generic_ci_hash(struct utf8_itr_context *ctx, int byte, int pos)
+{
+	struct hash_ctx *hctx = container_of(ctx, struct hash_ctx, ctx);
+
+	hctx->hash = partial_name_hash((unsigned char)byte, hctx->hash);
+	return 0;
+}
+
+int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
+{
+	const struct inode *inode = READ_ONCE(dentry->d_inode);
+	struct super_block *sb = dentry->d_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	int ret = 0;
+	struct hash_ctx hctx;
+
+	if (!inode || !needs_casefold(inode))
+		return 0;
+
+	hctx.hash = init_name_hash(dentry);
+	hctx.ctx.actor = do_generic_ci_hash;
+	ret = utf8_casefold_iter(um, str, &hctx.ctx);
+	if (ret < 0)
+		goto err;
+	str->hash = end_name_hash(hctx.hash);
+
+	return 0;
+err:
+	if (sb_has_enc_strict_mode(sb))
+		ret = -EINVAL;
+	return ret;
+}
+EXPORT_SYMBOL(generic_ci_d_hash);
+#endif
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 6eae91c0668f9..a260afbc06d22 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1382,6 +1382,12 @@ extern int send_sigurg(struct fown_struct *fown);
 #define SB_ACTIVE	(1<<30)
 #define SB_NOUSER	(1<<31)
 
+/* These flags relate to encoding and casefolding */
+#define SB_ENC_STRICT_MODE_FL	(1 << 0)
+
+#define sb_has_enc_strict_mode(sb) \
+	(sb->s_encoding_flags & SB_ENC_STRICT_MODE_FL)
+
 /*
  *	Umount options
  */
@@ -1449,6 +1455,10 @@ struct super_block {
 #endif
 #ifdef CONFIG_FS_VERITY
 	const struct fsverity_operations *s_vop;
+#endif
+#ifdef CONFIG_UNICODE
+	struct unicode_map *s_encoding;
+	__u16 s_encoding_flags;
 #endif
 	struct hlist_bl_head	s_roots;	/* alternate root dentries for NFS */
 	struct list_head	s_mounts;	/* list of mounts; _not_ for fs use */
@@ -3361,6 +3371,18 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 
 extern int generic_check_addressable(unsigned, u64);
 
+#ifdef CONFIG_UNICODE
+extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
+extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
+				const char *str, const struct qstr *name);
+extern bool needs_casefold(const struct inode *dir);
+#else
+static inline bool needs_casefold(const struct inode *dir)
+{
+	return 0;
+}
+#endif
+
 #ifdef CONFIG_MIGRATION
 extern int buffer_migrate_page(struct address_space *,
 				struct page *, struct page *,
-- 
2.25.0.341.g760bfbb309-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
