Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E636606A8E2
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 12:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a8UrNY6B;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZJfhb5IL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=urrolBAZfBTZvxXQC443+9rIrjBflJLUui3IfuQFyGg=; b=a8UrNY6BVlIl8DYntZP9SPaEgc
	Iv8K7NVvcKkYVSXn/rpnRHLPXYSvzWzLxUZriBYi2SWOgAfI31tlGriLHojSOKdRqz5mr2/01k4YG
	4xfwPYWtesKX9GKVAOcmMvlMa7dithBHnuFAaKgekY/Xz40YXasUMQpaB6vq1KmMj+DtqESwq8PC8
	Xioxme5cLhHU1gXr3ywPhx0nwktuWveHWKkCf6IYD6+Iu0OxlAYZVPItZGccEPVK57mfH57A5bXaD
	h4wteic0Soi0rm16DvLCHELFp0GRJSGGQ4T9gXUNUftliRuAOlj+oWUQyFPCPAoIctviWilSy8bOj
	4YfcSbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpyP-0000000CcdP-41eH;
	Fri, 13 Nov 2026 12:01:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpyL-0000000Ccb0-2rq4
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 12:01:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 702CB43405;
	Fri, 13 Nov 2026 12:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7403E1F000C5;
	Fri, 13 Nov 2026 12:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794571297;
	bh=A2Mek4ReTKOWqsv1h8QyMHMt7wP/aUz43Y3WUWGVO7k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZJfhb5ILCT5Ww7IzbAHXIEwx4QQEzEajk5W9+X/w+QICV0GrPzMrCmUeqvjm8RncE
	 t2LXoOfkyMgznf3QQC0LTw92cTzYpHI59hutKJvzDlUmMc/uAnohDPmronKnMZlhV6
	 XucWvVj5oBNQgGBewNMkF1AbuiynjfCQLWR1eWCkyt/gbgoS0APv2kHJYytn1+8ncI
	 skZbWnKF8h83KOdIu2pf+2f2SE9m/O6MGYQMSkgmnxaQ5HHwzQvR36irqGe4s0Dbwm
	 sPeffckKCCm33c51BC2QulHdT6cLH6hUhJRpLzQygCxjDi3tD2H2ZD3I37EdoB2MDa
	 guNYBXIh2oQ6Q==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 13 Nov 2026 12:59:16 +0100
Subject: [PATCH v3 20/33] ntfs: use the generic emergency read-only state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-work-fs-sb_rdonly-v3-20-0be92bb73709@kernel.org>
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
 Hyunchul Lee <hyc.lee@gmail.com>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3392; i=brauner@kernel.org;
 h=from:subject:message-id; bh=rqltzwzmIzd1i0bsKbMRQ6pbej91F4Gd2d0Lwm7wM4w=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9+71xtdWe10ekrv0Wu79tut43lXtZJ/IMFkf93yNz2
 WNpMNP/ZR2lLAxiXAyyYoosDu0m4XLLeSo2G2VqwMxhZQIZwsDFKQAT4TvEyLBIxL7lUqtigdi1
 TXNdpLm3WziKJ92cVH1oEuf8S9EGPMqMDOc/HBXbPG3mBM9jKjeUNkr9u/E4WqzcT0pB9Oyvm4m
 357MAAA==
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

Set SB_STATE_EMERGENCY_RO instead of the NV_EmergencyRO volume flag when
an error makes the volume read-only. ntfs_emergency_state() keeps
telling a shutdown (EIO) and the emergency state (EROFS) apart so all of
its callers stay as they are. /proc/mounts shows the volume read-only
again.

The VFS also refuses to freeze the superblock in that state. So
FS_IOC_SHUTDOWN with FS_SHUTDOWN_FLAGS_DEFAULT or _LOGFLUSH shuts down
without the freeze after an error, there's nothing left to flush
anyway.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/ntfs/super.c  | 14 +++++++++-----
 fs/ntfs/volume.h |  7 ++-----
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 91290688d2898..660fd145731fd 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -441,13 +441,12 @@ void ntfs_handle_error(struct super_block *sb)
 			sb->s_flags |= SB_RDONLY;
 		} else {
 			/*
-			 * NV_EmergencyRO makes the volume refuse modifications
-			 * instead and NV_Errors keeps it from being remounted
-			 * read-write. The error work marks the volume dirty on
-			 * disk.
+			 * SB_RDONLY needs s_umount, see sb_set_emergency_ro().
+			 * NV_Errors keeps the volume from being remounted
+			 * read-write and the error work marks it dirty.
 			 */
 			NVolSetErrors(vol);
-			if (test_and_set_bit(NV_EmergencyRO, &vol->flags))
+			if (!sb_set_emergency_ro(sb))
 				return;
 			queue_work(ntfs_wq, &vol->error_work);
 		}
@@ -2272,6 +2271,11 @@ int ntfs_force_shutdown(struct super_block *sb, u32 flags)
 	if (NVolShutdown(vol))
 		return 0;
 
+	/* After an error there is nothing to flush and freezing fails. */
+	if ((flags == FS_SHUTDOWN_FLAGS_DEFAULT ||
+	     flags == FS_SHUTDOWN_FLAGS_LOGFLUSH) && sb_emergency_ro(sb))
+		flags = FS_SHUTDOWN_FLAGS_NOLOGFLUSH;
+
 	switch (flags) {
 	case FS_SHUTDOWN_FLAGS_DEFAULT:
 	case FS_SHUTDOWN_FLAGS_LOGFLUSH:
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index 1ce81b260b15c..911a27983e138 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -16,6 +16,7 @@
 #include <linux/uidgid.h>
 #include <linux/workqueue.h>
 #include <linux/errseq.h>
+#include <linux/fs.h>
 
 #include "layout.h"
 
@@ -200,8 +201,6 @@ struct ntfs_volume {
  * NV_NativeSymlinkRel		Translate absolute Windows reparse targets (native_symlink=rel).
  * NV_MftBootstrap		Mount is still assembling $MFT's own runlist.
  * NV_StreamsWindows		Interpret the final path component as file:stream.
- * NV_EmergencyRO		An error made the volume read-only until it is
- *				unmounted (errors=remount-ro).
  */
 enum {
 	NV_Errors,
@@ -224,7 +223,6 @@ enum {
 	NV_SymlinkNative,
 	NV_MftBootstrap,
 	NV_StreamsWindows,
-	NV_EmergencyRO,
 };
 
 /*
@@ -266,14 +264,13 @@ DEFINE_NVOL_BIT_OPS(NativeSymlinkRel)
 DEFINE_NVOL_BIT_OPS(SymlinkNative)
 DEFINE_NVOL_BIT_OPS(MftBootstrap)
 DEFINE_NVOL_BIT_OPS(StreamsWindows)
-DEFINE_NVOL_BIT_OPS(EmergencyRO)
 
 /* -EIO after a shutdown, -EROFS after an error with errors=remount-ro */
 static inline int ntfs_emergency_state(struct ntfs_volume *vol)
 {
 	if (unlikely(NVolShutdown(vol)))
 		return -EIO;
-	if (unlikely(NVolEmergencyRO(vol)))
+	if (unlikely(sb_emergency_ro(vol->sb)))
 		return -EROFS;
 	return 0;
 }

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
