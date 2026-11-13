Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8A2606A8AD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zS6Yknvm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JBumoDPl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JwtydYnkc/ybe9+ajDPo0C2F4pGk4lcB8gg4PEvSmoc=; b=zS6Yknvm8/o5rV6IKt9mrxFnHW
	AAUXCw/y89pjMA91n2mJpI8tiyQX0ZdS1/DN9FsZ8PY07ElI9+ZYeE3R1Vt1qRm5YM1BQUnbKPigi
	egR31ApiQ6SN5kURCO7ZL5oX3X78q2x2mCaYJG9t6cCbuzLeNIoyPHx013cj3JyraLie+gqf6EKGL
	inIMtO7LSodGJL+0DY3d3ipTDO9yw6WPfwY4lyTTZ913+HtWEC1PZgCLQs17UN2lRszJa0ZxfjJ5O
	+uKzwsTXS8lEv6AwUXg3H8iA1pu+XdTB+IXCI9Q9yi7zGZFXH9umeb/cJ8PCUBRWfeeHkavXqYU0e
	vUyBBupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpyS-0000000CchX-2zot;
	Fri, 13 Nov 2026 12:01:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpyQ-0000000Ccdq-2ZGO
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 12:01:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 12FFB62602;
	Fri, 13 Nov 2026 12:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D191F000C4;
	Fri, 13 Nov 2026 12:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794571301;
	bh=J7gadPQUzR3XBSmIK0cp3E2gwMCGpvAcu+l4Mgbphw4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JBumoDPlxQXXObG+ENpLQRg+t+pJCQJKdzOvzMvcSQDv2bqSEBwDjrp3w1ZJICxEW
	 B0guxIMp38vWFiJoKU7w63N+lTPzPQ2LkjFcT/QDyAAOI1O8kdAnuPRHrl3e3XuVCB
	 TSCr/0rlxJ5nsfX1kLTjNzzFjhDibzZaNloTL/oHrBBCwZYGzHDLviiPSTFD8XRChY
	 LcMmvS1DCAEFQIuJqxgaxVcaUHhhRZW9kBi2CQrHZD8rpXN2eItKeDApeZaNQZo+We
	 C2mGZ3sNNTlqHzUyc8xwf/zv5h4xzePYJAxJHtqB8Um42kkmVDme5JAozP/FP2acNh
	 zuOP4bYJCUSVg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 13 Nov 2026 12:59:17 +0100
Subject: [PATCH v3 21/33] ocfs2: keep the current mount options on remount
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-work-fs-sb_rdonly-v3-21-0be92bb73709@kernel.org>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
To: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, 
 ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-xfs@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851; i=brauner@kernel.org;
 h=from:subject:message-id; bh=MPSPYKPscgP2L/4Ifq6qWngN+LUYlTiiBsWETuYkkwI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9+71pS1J+tnkA9wxmpgChycfyqj1zb0/6KFzw6bjE7
 hnCRaV7OkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYybSLDf6eO6XvTK9W4zDY0
 sax5OT9H8csGnotPN5zN+rl+52WB/umMDK+4XvFKdtoqFeWvSzSvyZnu/6SE8yzjS4vTtccNdYs
 ncwMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ocfs2_init_fs_context() doesn't inherit the current mount options for a
reconfigure. But ocfs2_check_set_options() insists on exactly one
heartbeat mode and ocfs2_reconfigure() refuses to change the data mode.
So every remount without heartbeat= fails with EINVAL, including
emergency remount (sysrq u) which passes no options at all, and that
WARNs for every ocfs2 mounted read-write. A remount that does pass
heartbeat= silently resets every option it doesn't repeat, e.g. noacl,
errors=, barrier= and preferred_slot=.

So start a reconfigure from the current options like exfat and gfs2 do.
Asking for a different data or heartbeat mode still fails with EINVAL.

The next patch stops ocfs2 from setting SB_RDONLY after errors. An
errored ocfs2 then stays read-write and emergency remount would run into
this as well.

Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/ocfs2/super.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
index 0af2245ae3036..67283244426e0 100644
--- a/fs/ocfs2/super.c
+++ b/fs/ocfs2/super.c
@@ -1222,6 +1222,19 @@ static int ocfs2_init_fs_context(struct fs_context *fc)
 	mopt->resv_level = OCFS2_DEFAULT_RESV_LEVEL;
 	mopt->dir_resv_level = -1;
 
+	/*
+	 * Start from the current options so a remount only changes what it
+	 * specifies, emergency remount passes none at all.
+	 */
+	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE) {
+		struct ocfs2_super *osb = OCFS2_SB(fc->root->d_sb);
+
+		mopt->mount_opt = osb->s_mount_opt;
+		mopt->atime_quantum = osb->s_atime_quantum;
+		mopt->slot = osb->preferred_slot;
+		mopt->user_stack = ocfs2_userspace_stack(osb);
+	}
+
 	fc->fs_private = mopt;
 	fc->ops = &ocfs2_context_ops;
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
