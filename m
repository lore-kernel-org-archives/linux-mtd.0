Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA1BC388F9
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 22:10:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5800C2072C
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 22:10:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JGucXBgt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHNjyLqY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5800C2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=acmKS3Ze0aIdObSEjlzVqmeTnrBr9wyX/UN0huq3C/Y=; b=JGucXBgtEdeQ86geE2jieU7f/
	2OOS0nbyQpoef9AaiWI+2Pscu7e/Om94eVKdhpRZAHfI6XprN+Z/5cONOX/rNESc5s5gvGG7ARgm+
	JiK17JmigblaxBcHZYz1Z3wMf6p3bPFmz7tOStbkOVxKJNniJg1JlBCCbpjmg2L3pzPFhYZkf7zUx
	tNsrInQNd5t03IhEHDfdpxkDgRuIU1w6ySzXSkKYtQ9+5qUmeP5nHtcTmJv593B7OXnR/dpu62HMo
	HK2U+4X/mlaeysg6qIIFV91wTGDhfaMYXqEffUMf7lQC4cuE+8OqpigqoapOTl42okBaRixvsMTDz
	uJM9NNX4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYz4T-0007NB-4h; Sat, 31 Oct 2020 22:10:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYz4M-0007Ka-Hi
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2020 22:09:56 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7479D2076D;
 Sat, 31 Oct 2020 22:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604182193;
 bh=mU4u4OeBiyB0ajGFtgXeUtVhy39lvr5DXQg14RZoQVM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tHNjyLqYTwSXhVsJ1eW6WsK8fMTy/PMcW0EWoU2wlHm20ApQrIeE84yGxvMeExIb+
 FADZJdS5CtvF9EgYkt00zoFxOTLxR3ArG0krL6ujh73zsq+v3Xtt3tyiR95YD21kib
 WMQIkNpEBHW8ustesBzYUh5Q0PIpHx9WW669HT/0=
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Subject: [PATCH 4.19 3/5] fs,
 fscrypt: clear DCACHE_ENCRYPTED_NAME when unaliasing directory
Date: Sat, 31 Oct 2020 15:05:51 -0700
Message-Id: <20201031220553.1085782-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201031220553.1085782-1-ebiggers@kernel.org>
References: <20201031220553.1085782-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_180954_856925_5DD0D494 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Sarthak Kukreti <sarthakkukreti@chromium.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

commit 0bf3d5c1604ecbbd4e49e9f5b3c79152b87adb0d upstream.

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
Signed-off-by: Theodore Ts'o <tytso@mit.edu>
---
 fs/dcache.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index 20370a0997bf9..1897833a46685 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -2712,6 +2712,20 @@ static void copy_name(struct dentry *dentry, struct dentry *target)
 		call_rcu(&old_name->u.head, __d_free_external_name);
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
+#if IS_ENABLED(CONFIG_FS_ENCRYPTION)
+	dentry->d_flags &= ~DCACHE_ENCRYPTED_NAME;
+#endif
+}
+
 /*
  * __d_move - move a dentry
  * @dentry: entry to move
@@ -2787,6 +2801,7 @@ static void __d_move(struct dentry *dentry, struct dentry *target,
 	list_move(&dentry->d_child, &dentry->d_parent->d_subdirs);
 	__d_rehash(dentry);
 	fsnotify_update_flags(dentry);
+	fscrypt_handle_d_move(dentry);
 
 	write_seqcount_end(&target->d_seq);
 	write_seqcount_end(&dentry->d_seq);
-- 
2.29.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
