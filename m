Return-Path: <SRS0=UdE+=DA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB8EC4727E
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 01:10:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C454C221EB
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 01:10:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KCb34ia7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Fw/pQ9kO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C454C221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4iwq9aiSwx9tnAmObGkAn2hUl7qaOMwpFqioYzr2JoI=; b=KCb34ia7oxwQu5piGSkxibjZs
	fucYTWw0TqozhzjsoeVrumO2pv4GZrD/sCkn5F/wcHk19VCa4X0eOnnA0QxA/oel7KO98AQUtIl4q
	Q/OupGUvU2JyAK4uwNlmETUwY5nw4Wdgfgij2NfcaePS7HO/JESyrLBoTWJUnKLUWQGyMXbEHN3M3
	/UdBEH4V5eaU4qawuWVd3sHSkMdOd0/qY31AY6SrTyfhZRm2U3KsD8cucvN+qVl5elA8/Rsx7jFqe
	TKq5LUnvkh+OWV/XWuB+LA+WiYDhxnYvHHN39mBVtbOC+L2ZEcs03pf53LMbvD3EcSuKQkUUOZfpO
	h5pO9cEjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKtHp-0000hF-VB; Wed, 23 Sep 2020 01:09:34 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKtHm-0000eP-NR
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2020 01:09:31 +0000
Received: by mail-pl1-x64a.google.com with SMTP id y10so6123229pll.6
 for <linux-mtd@lists.infradead.org>; Tue, 22 Sep 2020 18:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=6Jea0D8IQymzKa0cePGlWsc3mYiPTYFJmjhFuidHEKk=;
 b=Fw/pQ9kOsMZOp4qcT//rGk0Ty0QnPBIDZAQyCHbGz+EB0pENDjiV0Msb9s3Us7Rqy8
 LW694CF7h2UAEaewdIWmuHdo6GPeQxAY3OMDp4A30swVcAgrTfLA9IKzxZJbhW2PZdV4
 4El+U8pvEnZ2ke/FYErM9S7pWsuw25W9oV0xGx2RW3h0AZQ0QWD/TCHm+TdQsnsVamCU
 HP8rIZr6ZqIXyFSFq6oumaQoSIMxhMCoxpT8dXxHepR7EUpmiSTu9hAWCSGTl1ejKyC7
 Z5ARTwIW+48S7v6wv+Ryn4ULJPl8AS1R4hZUc5xYPa2P7yyEnjnn8uzXiByNpwqIICgl
 lI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6Jea0D8IQymzKa0cePGlWsc3mYiPTYFJmjhFuidHEKk=;
 b=ObJegaMSfd413BlkvPnnWrr33VqxZQVo0Sg1+WbZUxbXD0NYWvNL2qgr7ugtSquzY9
 dhz7+yWw8jqlmGD4ik2nQJi42wSKjvUVkErkglbfFTzeydbKr7bFF/09s+xLHnjiFYm7
 R7ZAxH8iqJ+34Mrpl+b61B4iQjX2U7wxCDujyaZFs4o9imby5AqZeOCuxwTE2q2jCu5Z
 cym0Qynb0Cmf6NHNEPAhEqx5HQOSD2fqENtJFeGGz9SYYrLZShjVPMalQcZUjM2eWC++
 MwhXXJBicHcGbWRBfKJOJrrzZJjPO93CfXKhcF8Es6l7AKXKWt75La2SzYgwX8w4VkNd
 nRcQ==
X-Gm-Message-State: AOAM531MPCHf8A0QRSh+b3h8oJt12ivnypdKW19vjolUMTVehMzq0QoR
 lkmow7TropvHt8Cnu2ErJ+epBbouDVg=
X-Google-Smtp-Source: ABdhPJw5cOhPCfYuz52eXjYlgKJA9wCJZI1O/01lTyF39qWXyCNTFLUsASASM8K3SUHFB6H7JtIckRIlheI=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a62:1451:0:b029:13e:d13d:a058
 with SMTP id
 78-20020a6214510000b029013ed13da058mr6581273pfu.30.1600823367027; Tue, 22 Sep
 2020 18:09:27 -0700 (PDT)
Date: Wed, 23 Sep 2020 01:01:49 +0000
In-Reply-To: <20200923010151.69506-1-drosen@google.com>
Message-Id: <20200923010151.69506-4-drosen@google.com>
Mime-Version: 1.0
References: <20200923010151.69506-1-drosen@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH 3/5] libfs: Add generic function for setting dentry_ops
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_210930_779009_D52DDFC6 
X-CRM114-Status: GOOD (  14.54  )
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This adds a function to set dentry operations at lookup time that will
work for both encrypted files and casefolded filenames.

A filesystem that supports both features simultaneously can use this
function during lookup preperations to set up its dentry operations once
fscrypt no longer does that itself.

Currently the casefolding dentry operation are always set because the
feature is toggleable on empty directories. Since we don't know what
set of functions we'll eventually need, and cannot change them later,
we add just add them.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/libfs.c         | 49 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  1 +
 2 files changed, 50 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index fc34361c1489..83303858f1fe 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1449,4 +1449,53 @@ int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 	return 0;
 }
 EXPORT_SYMBOL(generic_ci_d_hash);
+
+static const struct dentry_operations generic_ci_dentry_ops = {
+	.d_hash = generic_ci_d_hash,
+	.d_compare = generic_ci_d_compare,
+};
+#endif
+
+#ifdef CONFIG_FS_ENCRYPTION
+static const struct dentry_operations generic_encrypted_dentry_ops = {
+	.d_revalidate = fscrypt_d_revalidate,
+};
+#endif
+
+#if IS_ENABLED(CONFIG_UNICODE) && IS_ENABLED(CONFIG_FS_ENCRYPTION)
+static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
+	.d_hash = generic_ci_d_hash,
+	.d_compare = generic_ci_d_compare,
+	.d_revalidate = fscrypt_d_revalidate,
+};
+#endif
+
+/**
+ * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
+ * @dentry:	dentry to set ops on
+ *
+ * This function sets the dentry ops for the given dentry to handle both
+ * casefolding and encryption of the dentry name.
+ */
+void generic_set_encrypted_ci_d_ops(struct dentry *dentry)
+{
+#ifdef CONFIG_FS_ENCRYPTION
+	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME) {
+#ifdef CONFIG_UNICODE
+		if (dentry->d_sb->s_encoding) {
+			d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
+			return;
+		}
 #endif
+		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
+		return;
+	}
+#endif
+#ifdef CONFIG_UNICODE
+	if (dentry->d_sb->s_encoding) {
+		d_set_d_op(dentry, &generic_ci_dentry_ops);
+		return;
+	}
+#endif
+}
+EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index bc5417c61e12..6627896db835 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3277,6 +3277,7 @@ extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
 extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
 				const char *str, const struct qstr *name);
 #endif
+extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
 
 #ifdef CONFIG_MIGRATION
 extern int buffer_migrate_page(struct address_space *,
-- 
2.28.0.681.g6f77f65b4e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
