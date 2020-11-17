Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0088AC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 04:04:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 927E32468E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 04:04:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jBTeisv2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="shg3+cQ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 927E32468E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ec1TxPXE3z+aYtPE4UE8tl+OfzguWO0v1Fc6TIqYSWA=; b=jBTeisv2EfrZ0zv0JbbVqtvhu
	4nOSBPu7LYx4ufeCh5M9yha9dRigM8mNpj91T7JnugD+VkiakWDoUdfBzcqevO442LBecQnZqbgLz
	Fit3tpFrlztzwHvtTy/tiqQ2yDdHedSxlyk6iQMuHfDsFiLMOk9zM6nFipztgNOS39bcc4Ht8l7kH
	Ygv0oSOu5Wd4irmUQCyGazFrGvrrP+Wh0WoT3ECmgWzSbaxkIB8Kb9eXhOlIKzVJrJfas6vpKoa9Y
	twu2Yvp5BW5SUE+IumQ/4Qy7Y5qoc5myhHMCQZLrzrkAfh+5IKvvA8OXBoz6GIP/dkaAa83pC3YjK
	Tb/FD+H/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kesDH-0008LN-Ix; Tue, 17 Nov 2020 04:03:27 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kesDE-0008Jf-Fr
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 04:03:25 +0000
Received: by mail-yb1-xb49.google.com with SMTP id e19so18376682ybc.5
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2020 20:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=26rm8pP8X1eqyqMFHjed3HgpBJsgTLVuVg1p5M5T4ac=;
 b=shg3+cQ9HKM0nPNtrMQTh+D5eQYXxiRjQHiCYna15DnDwGSI4q6hNF86FmwmCYrJ09
 0uszwptNamjvsfa2d+Ebp170YA7jdMrfds4LdsowSETcYPuptonfbiP7v8hpd4Y0MZkg
 TcH5aai3GlIlPjDRJOutLlBhbMbEKGMg5F5w3kD5/X0fqC2FyU3uSCyFeDu5RIXt/ixa
 9s2Vzm7JxAfAo2lWEtY1zChL12tD9p7+0mwGYHx+TBdw2Ath0P70x0MCBOufxM8RBgRH
 D/gZzY+rDOJ3wmUNZ5lYBs7E1V5A8uxoYtCXmruoFljhdbJ8IaBIehg5VrO1VZ4lsbQk
 6BPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=26rm8pP8X1eqyqMFHjed3HgpBJsgTLVuVg1p5M5T4ac=;
 b=BS46Sr7/5zx2dHtTXwONzakFWHnmWsPhAtKqSM1ZhEC2dh88PuyRo551gYoteCbUzN
 zGaxCmEygtiVuOdJnT5zfoGTiFrYiqoKnBm4grsD5zzzAw07qsOkiq3KBORGzxfG2wAp
 cj7qj0s3SXWheiNYPmT7JendgnHR5OHf3Rh8GyxO5SgmUhPotK1NDOX6/C8VdQ486eTJ
 LiusvbQTSHEqc85pdPQC4oW6NNdIrbq3NgiCK9siUDQBzl5Cp9/7K4Y5DmPTnGanDrH4
 yqdKrYkWGxq81v7l8O7t/k7BNXuteSNZidG0EL1yQe79FzKeH4jtOssVr3jBPXhXqebY
 Nw5Q==
X-Gm-Message-State: AOAM530RN7sCqaxp8bvBsPB3MalCKW1/1R+Awt9uZtAsMwJBiVc1HF3h
 6ByuwFCZglAm9foCwskLSM4H3TDjNXo=
X-Google-Smtp-Source: ABdhPJzKALm1EBPTQ18K+cplc9Rj54/XCyTrRJBcCgve7DfHa3FcRADsKoXoWVc+0ELNdGgH6frN1aEubL8=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a25:88a:: with SMTP id
 132mr26330262ybi.215.1605585800711; 
 Mon, 16 Nov 2020 20:03:20 -0800 (PST)
Date: Tue, 17 Nov 2020 04:03:13 +0000
In-Reply-To: <20201117040315.28548-1-drosen@google.com>
Message-Id: <20201117040315.28548-2-drosen@google.com>
Mime-Version: 1.0
References: <20201117040315.28548-1-drosen@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 1/3] libfs: Add generic function for setting dentry_ops
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_230324_606523_7B621CCB 
X-CRM114-Status: GOOD (  16.34  )
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
work for both encrypted filenames and casefolded filenames.

A filesystem that supports both features simultaneously can use this
function during lookup preparations to set up its dentry operations once
fscrypt no longer does that itself.

Currently the casefolding dentry operation are always set if the
filesystem defines an encoding because the features is toggleable on
empty directories. Since we don't know what set of functions we'll
eventually need, and cannot change them later, we add just add them.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/libfs.c         | 60 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  1 +
 2 files changed, 61 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index fc34361c1489..dd8504f3ff5d 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1449,4 +1449,64 @@ int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 	return 0;
 }
 EXPORT_SYMBOL(generic_ci_d_hash);
+
+static const struct dentry_operations generic_ci_dentry_ops = {
+	.d_hash = generic_ci_d_hash,
+	.d_compare = generic_ci_d_compare,
+};
 #endif
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
+ * casefolded and encrypted dentry names.
+ *
+ * Encryption requires d_revalidate to remove nokey names once the key is present.
+ * Casefolding is toggleable on an empty directory. Since we can't change the
+ * operations later on, we just add the casefolding ops if the filesystem defines an
+ * encoding.
+ */
+void generic_set_encrypted_ci_d_ops(struct dentry *dentry)
+{
+#ifdef CONFIG_FS_ENCRYPTION
+	bool needs_encrypt_ops = dentry->d_flags & DCACHE_NOKEY_NAME;
+#endif
+#ifdef CONFIG_UNICODE
+	bool needs_ci_ops = dentry->d_sb->s_encoding;
+#endif
+#if defined(CONFIG_FS_ENCRYPTION) && defined(CONFIG_UNICODE)
+	if (needs_encrypt_ops && needs_ci_ops) {
+		d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
+			return;
+	}
+#endif
+#ifdef CONFIG_FS_ENCRYPTION
+	if (needs_encrypt_ops) {
+		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
+		return;
+	}
+#endif
+#ifdef CONFIG_UNICODE
+	if (needs_ci_ops) {
+		d_set_d_op(dentry, &generic_ci_dentry_ops);
+		return;
+	}
+#endif
+}
+EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 8667d0cdc71e..11345e66353b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3202,6 +3202,7 @@ extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
 extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
 				const char *str, const struct qstr *name);
 #endif
+extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
 
 #ifdef CONFIG_MIGRATION
 extern int buffer_migrate_page(struct address_space *,
-- 
2.29.2.299.gdc1121823c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
