Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629A260A3802
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kwOlXbly;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T4FHlTua
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vj60oQ4vvHVyb2ovnFDvdg7+rvF3/tgf+3n04mR1Wqo=; b=kwOlXblyriJ/C3yfKaQAAY/pik
	puYI9SkKxsZkBSo3z1zdjIyXs4CLhYe1J0l5O6qMHa3vvkAhyiUk7COOPNdbGnQN27Pq5TL9oVKki
	aJTgXQMb75BBAlujvN5At1AsIokaoB/HM5eNHeyGWP0r3g6a+WRf6iUQ9cgDhQvHAxyLC+SkAdxv3
	JJhQdmp/esj1abhFRCBbpS5lCw7MIbNIfJJeTIxVlpX+UfXTI1hx9pEgpU7mizORndYsshIQ3JK/7
	8OIA51qHN8Oy0CZJD0iN+GndEVwNYn8m3DwWC58XKrbkIRjayMdoKMcBeIPsSh/3sBlPIXSIpQ7b5
	7sbG3V5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSgH-00000009km0-0LAM;
	Thu, 29 Oct 2026 16:08:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSgF-00000009kkJ-1Pb6
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:08:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4D0460623;
	Thu, 29 Oct 2026 16:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5271F01824;
	Thu, 29 Oct 2026 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290122;
	bh=/BWnxppliWOmynaxs29fGFYt24wOTlqSg4Z+oJtQIpE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=T4FHlTuaqRfJAzhzCJ1btbf9e9sQyfvqdPREw/hMRAZdwLVUfHioRc2GTMQk7m/Av
	 2o8qceLJnuQ2Yniqjw/EI832tf2PwdxCwRlaxHl16mcmqJZO4D6F6+vJvM2CccQq7S
	 d8IbekTfL7lPE3H8b7JebgeIIlsg3LMhu4lP5zsXw1KzJmDjPCMqNHAe3cqFv0NnYI
	 y8vSgEvao271qfeUB+qAukuKn9h2OT+A+b4YvvRN1s3kwce9Xm0dE9Taa/eLsXMr+B
	 RULIjQrSOsznLFzL+PV2X0/RQEIiZXkdAy/pbh/jXxpbd4uSL9f/ixbr+wf9ftMbCu
	 SIkpazprBoNQQ==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 29 Oct 2026 17:07:10 +0100
Subject: [PATCH v2 19/34] ocfs2: keep the current mount options on remount
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-work-fs-sb_rdonly-v2-19-2f44f64f0b66@kernel.org>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
To: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, 
 ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-xfs@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795; i=brauner@kernel.org;
 h=from:subject:message-id; bh=eukLrrIxQyicjG2U7lt02AzXtZXtBti4CMni+Zukyzg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9ztfv235vgZqSUfy7nl9S1Zb3vNWKDwVoPmOSTdg12
 eA617SFHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPxYGRk+L9wWf2hvo7qmqqP
 2+Zo8Fumh+e/Y//8tNqO69baothaA4b/VbffPt52dXHp0bKpmSd+bP3lIOr3Iuey5iGbpa+27no
 rxQAA
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

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/ocfs2/super.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
index 0af2245ae303..67283244426e 100644
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
