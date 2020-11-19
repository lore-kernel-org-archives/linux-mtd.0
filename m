Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B304DC64E7D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 06:09:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C01246A5
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 06:09:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vAszQ2Oh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="UdP4FsE2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C01246A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7q+k2r3piF3XTEkEpiXTCGcRZQUIPraFv/Adp2zEDK0=; b=vAszQ2Ohq3dVa9X3OUJjDoioJ
	7tj2kqQN5HCHysWvhjnl+fQY687TwuwqkutJ23OWGVRNBlhLq9r3jrC22efCGbs8gIItimPpC3gR1
	wC1B3yHW4i6bPOum9fVMCOFI9hZfAxjFwvKFrpDZQOW7DjsvNuz+PDKgvBT0OdQalD5D14O3n7jsb
	rGjGewvEr3W9WtQZf/e7WDawG2B7I+UucjGfEBwG2kkuazcQOX2b7+DQsqMMTOH5Z7g0YmxKcgiJ2
	bIJyjuOqN/nzef4mYSipTbYy0wmdJoJx6H+69NcewBQQMRu1EHVmJ4yOvs2QKvThRErPqbF4vVgMg
	XRdTzknYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfd8B-0007jD-NI; Thu, 19 Nov 2020 06:09:19 +0000
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfd85-0007gv-4J
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 06:09:14 +0000
Received: by mail-qk1-x74a.google.com with SMTP id 143so4233490qkg.20
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2020 22:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=pqAPKMbmNsV52HR4YSyUKpkLgaKSoP3ZrEZXGq4Xu/0=;
 b=UdP4FsE2zGsI55Kgb/EznglwdoUlp7MKg1jEtYwlhVFENpfj/8/I9ohE9BAL2ok5SW
 7LgqtKDD3wIFaZhPkypkIZridSnJI2/sFOORkqVJhHxiDVFZfQYtobc0z/NeGKeNjp7a
 8Ywz9XEZBJpIHnJQetyCPYSVPN6b4Ue7u6CSNyVzNotQA5MaDINRMdi3n2uijg1PWolD
 7KTinqSAcCMZE+PPmmm4zGpXuTr+BC5rbOh1izgdk3cRqU7hpK0JuOKTt0gS/3RP6t8p
 fNXDYX0i3U/yDTdywJCCUDm6eZHZgOToG1BPc8KI7hooQ3KATbgwTbzLOVBLV1OX6kOg
 LZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=pqAPKMbmNsV52HR4YSyUKpkLgaKSoP3ZrEZXGq4Xu/0=;
 b=ug8SnC8Oz6dPXpU3HtMOMUlSYW7Q5o1E9XLhxWD5/G93Z3iIoTKSLHOrbXxzmzjzaq
 Ko08mWYD2nu0FxL28KUd8fwObhN3qBUTeF8O2qHU+zoZWu1NTimNBWzUuc1rNOaq4O+q
 kLqeUwHmRGmRyxKnT0EuAp8VTSHS3tcJniYjri1LfOGxX/X0lBb8h2iauBEQ5ISI2jGU
 4QvOyE8bW0Glh4M4kUmS3ik6TDIcNlepVwaMGwpskKbiyKlvwVSD4GfPogeY0Nrjd2h7
 2Xq45cOr/BzF9mEIbxCcsQm35eWbZW1WRS0WOvKN62iABij1/dnTvQYhIWKVj0UEMQoW
 atCA==
X-Gm-Message-State: AOAM532sMmkb7vj9jk1aH6QYZIpkiS5x9lANoXJddz06qldbzAabt8PM
 WVKVKAnUEUV5MctgTcC6EpMrPQycCHY=
X-Google-Smtp-Source: ABdhPJwSZBXfCOhHL8thch2tn2Vt6bs0hCoBOuuaINL7+x5ApwyTNO3KvT5pdGIltwoPqZXkM0FWkysQ8RM=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a0c:a681:: with SMTP id
 t1mr9304343qva.16.1605766149235; 
 Wed, 18 Nov 2020 22:09:09 -0800 (PST)
Date: Thu, 19 Nov 2020 06:09:02 +0000
In-Reply-To: <20201119060904.463807-1-drosen@google.com>
Message-Id: <20201119060904.463807-2-drosen@google.com>
Mime-Version: 1.0
References: <20201119060904.463807-1-drosen@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v4 1/3] libfs: Add generic function for setting dentry_ops
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_010913_260559_D17CAB99 
X-CRM114-Status: GOOD (  20.23  )
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
Cc: Daniel Rosenberg <drosen@google.com>, Eric Biggers <ebiggers@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
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
empty directories. Unlike in the encryption case, the dentry operations
used come from the parent. Since we don't know what set of functions
we'll eventually need, and cannot change them later, we enable the
casefolding operations if the filesystem supports them at all.

By splitting out the various cases, we support as few dentry operations
as we can get away with, maximizing compatibility with overlayfs, which
will not function if a filesystem supports certain dentry_operations.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
---
 fs/libfs.c         | 70 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  1 +
 2 files changed, 71 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index fc34361c1489..bac918699022 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1449,4 +1449,74 @@ int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
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
+#if defined(CONFIG_FS_ENCRYPTION) && defined(CONFIG_UNICODE)
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
+ * Casefolded directories need d_hash and d_compare set, so that the dentries
+ * contained in them are handled case-insensitively.  Note that these operations
+ * are needed on the parent directory rather than on the dentries in it, and
+ * while the casefolding flag can be toggled on and off on an empty directory,
+ * dentry_operations can't be changed later.  As a result, if the filesystem has
+ * casefolding support enabled at all, we have to give all dentries the
+ * casefolding operations even if their inode doesn't have the casefolding flag
+ * currently (and thus the casefolding ops would be no-ops for now).
+ *
+ * Encryption works differently in that the only dentry operation it needs is
+ * d_revalidate, which it only needs on dentries that have the no-key name flag.
+ * The no-key flag can't be set "later", so we don't have to worry about that.
+ *
+ * Finally, to maximize compatibility with overlayfs (which isn't compatible
+ * with certain dentry operations) and to avoid taking an unnecessary
+ * performance hit, we use custom dentry_operations for each possible
+ * combination rather than always installing all operations.
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
+		return;
+	}
 #endif
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
2.29.2.454.gaff20da3a2-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
