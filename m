Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35F2C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 10:33:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E8A12065F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 10:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="26kyqp50";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="blra8Dgw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/11CwLNn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E8A12065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GGjUS3HLrnsoHynx9GJoqyqIAU5OfiKJuG7I5rnUv84=; b=26kyqp50DdtEiopvA3hUoxG4pt
	r4DPt2zOLw8z6qtkjUQEHeu+ZFQLI9D5z76sa4RJFDnTn5iUzun9aFaHRb6uEmMiL10i41gIrcHCQ
	H8Xn//dev0ltjcIUIyAo3RvvjH4ytFqActl6mlNkoE3NahoAGkQqc3cq9Oxrp7irTEdhDKDDHiaEz
	cUXMKBwloiCJTJNmSAb8mPZPyGyBYc5PI8M9frRuhVOHL4UYjqqDzQaxY/8bk5rSMmraOKg8Q6m+J
	1oYDaFI0B+W0DlKhoKIcD/RUvdc448CxsHcbTbWW7LDtcvHWJhsWmtrhpm+lGYE247UCrzZFKFvJ9
	YR4g0JWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsktd-0003cO-8t; Tue, 07 Jul 2020 10:32:17 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsktX-0003Y5-39
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 10:32:13 +0000
From: Martin Kaistra <martin.kaistra@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1594117927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=USFW9P2SEx1J6Wl5NKxIUnni0TZLY+y2tVeMLY8iD+c=;
 b=blra8DgwjNPi7VjhRemGkkPogx/XI03TRUDqNBbpOdHYNdyCecodTyWo+tFmDJCNCEOY7A
 A2a0hjN9gzzT9EzFSgOSwGqIr1ZfVlufe9vZYF5SnSlaL5k8OVyIg7EA/+lzoJgLNJgxmS
 PGENQYcXkRim8/ty+9Yxi+6+nMCncftsNN0fY4dAx2RHVtQa4swFwqX4fLu4QTlQToHi1j
 F429oVGkX0xb9/fsnrfgusY4SYbTI953LkoVP2MNNsW3FQ/ftPd9Exqwh4RuJsvSb7z6sJ
 F4hFFffaUV5KWWcqvOGVee+pZbMemGDUjiagDlfr7YCwAzVlwhE4dZhMuoIYgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1594117927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=USFW9P2SEx1J6Wl5NKxIUnni0TZLY+y2tVeMLY8iD+c=;
 b=/11CwLNnrcOuPsT2AjWRvD/dVGl4wlHuWwJNUnYt8u8CvfGFJm5bm9ZMOXdH8Utyx/N3Az
 tXh0U2wDRidfhkBQ==
To: richard@nod.at
Subject: [PATCH] ubifs: add option to specify version for new file systems
Date: Tue,  7 Jul 2020 12:31:59 +0200
Message-Id: <20200707103159.12267-1-martin.kaistra@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_063211_291000_2CFBC81C 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: linux-mtd@lists.infradead.org,
 Martin Kaistra <martin.kaistra@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Instead of creating ubifs file systems with UBIFS_FORMAT_VERSION
by default, add a module parameter ubifs.default_version to allow
the user to specify the desired version. Valid values are 4 to
UBIFS_FORMAT_VERSION (currently 5).

This way, one can for example create a file system with version 4
on kernel 4.19 which can still be mounted rw when downgrading to
kernel 4.9.

Signed-off-by: Martin Kaistra <martin.kaistra@linutronix.de>
---
 fs/ubifs/sb.c    |  5 +++--
 fs/ubifs/super.c | 18 ++++++++++++++++++
 fs/ubifs/ubifs.h |  1 +
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 4b4b65b48c57..c0d3e4008d23 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -174,7 +174,8 @@ static int create_default_filesystem(struct ubifs_info *c)
 	tmp64 = (long long)max_buds * c->leb_size;
 	if (big_lpt)
 		sup_flags |= UBIFS_FLG_BIGLPT;
-	sup_flags |= UBIFS_FLG_DOUBLE_HASH;
+	if (ubifs_default_version > 4)
+		sup_flags |= UBIFS_FLG_DOUBLE_HASH;
 
 	if (ubifs_authenticated(c)) {
 		sup_flags |= UBIFS_FLG_AUTHENTICATION;
@@ -200,7 +201,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 	sup->jhead_cnt     = cpu_to_le32(DEFAULT_JHEADS_CNT);
 	sup->fanout        = cpu_to_le32(DEFAULT_FANOUT);
 	sup->lsave_cnt     = cpu_to_le32(c->lsave_cnt);
-	sup->fmt_version   = cpu_to_le32(UBIFS_FORMAT_VERSION);
+	sup->fmt_version   = cpu_to_le32(ubifs_default_version);
 	sup->time_gran     = cpu_to_le32(DEFAULT_TIME_GRAN);
 	if (c->mount_opts.override_compr)
 		sup->default_compr = cpu_to_le16(c->mount_opts.compr_type);
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 7fc2f3f07c16..a2420c900275 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -26,6 +26,24 @@
 #include <linux/writeback.h>
 #include "ubifs.h"
 
+static int ubifs_default_version_set(const char *val, const struct kernel_param *kp)
+{
+	int n = 0, ret;
+
+	ret = kstrtoint(val, 10, &n);
+	if (ret != 0 || n < 4 || n > UBIFS_FORMAT_VERSION)
+		return -EINVAL;
+	return param_set_int(val, kp);
+}
+
+static const struct kernel_param_ops ubifs_default_version_ops = {
+	.set = ubifs_default_version_set,
+	.get = param_get_int,
+};
+
+int ubifs_default_version = UBIFS_FORMAT_VERSION;
+module_param_cb(default_version, &ubifs_default_version_ops, &ubifs_default_version, 0600);
+
 /*
  * Maximum amount of memory we may 'kmalloc()' without worrying that we are
  * allocating too much.
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index bff682309fbe..4ffd832e3b93 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1504,6 +1504,7 @@ extern const struct file_operations ubifs_dir_operations;
 extern const struct inode_operations ubifs_dir_inode_operations;
 extern const struct inode_operations ubifs_symlink_inode_operations;
 extern struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
+extern int ubifs_default_version;
 
 /* auth.c */
 static inline int ubifs_authenticated(const struct ubifs_info *c)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
