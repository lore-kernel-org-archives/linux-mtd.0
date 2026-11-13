Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518A060A6F46
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 12:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QPjpvZJt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mwYSclny
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L8jWC7lmA4Gk37AQqr87xFSfdhhQAJsgkZ6TaEvOcmg=; b=QPjpvZJtNK1gIOljceaE/4aOJI
	hti7vzRIE/hLEWzZ2Y2PrqbpIMa9aC+tYqfUsX9qTls8Q8larNPLjoSld65gj0Ng6QHJhju5n/s8i
	PnviILjl+SRJdqIC7umVJMIr/TckPI90BHfXEcgw2gUHCVYqyREyw7fVy/dlIVvyz8U2j65VrJH+8
	+8Y+n2vbPHODwVD4qRP3xsURITtJn5gcXf4R2Sv/AACiCXf5/k9Y+6cGakuaXLevm3Bm5ZBLtS07d
	nyHiRSTW9moIp+u3fJeLiiI3MoY8P5KTXxY074V6/qguVKD2XQ51OFSGmbWcet+0dOV9nXiLmF83d
	3iGjG7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpzE-0000000CdFG-00Hg;
	Fri, 13 Nov 2026 12:02:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpzC-0000000CdDM-2g3T
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 12:02:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 60B88411A4;
	Fri, 13 Nov 2026 12:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5F71F000C5;
	Fri, 13 Nov 2026 12:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794571350;
	bh=Qt0v88hxlQUHI5QSZLphXypscQRdWRHgm1ofeIg78vE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mwYSclnymZN538OO44zhjeiEF6ZBwOXg+mNWuDn2mVMpnozTukYByPU2VgZwWVlDc
	 8xvcI8z68lxnamK03WoMc/sB/4yH0m1mIAy22y/0RN0mL5Pip9ZsoY8rM536vNcpRO
	 Fp9Yfhil3dDe21+/vxCwhBUlwdHiJ8sYmcN3wgI//hBpOa9+a8+MZggxdslsmwdHKk
	 /PtldJ1cR3JjJTGX1l58yZ4uFbBE56y458DWqBNcap2sbf7u7VQmpCwLN2C7t+Xkv5
	 EoeS8LhRnwEcexIRsxUlQqnxWH0U01IxyKtPS18Og0Ph9Um1ZWSD3IiKJYuaOlhIMx
	 m5h4cQZ/ZZhIw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 13 Nov 2026 12:59:28 +0100
Subject: [PATCH v3 32/33] ext4: use the generic emergency read-only state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-work-fs-sb_rdonly-v3-32-0be92bb73709@kernel.org>
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
 Jan Kara <jack@suse.cz>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1968; i=brauner@kernel.org;
 h=from:subject:message-id; bh=zrZfOrGsMUXliH43rTDbUbAuKN/ihY34a/GnGYlk2N0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9+70/IHPi5j8ze6a9MUj6Ed4VbFn6fMHhxGfa69pff
 LpexvHrSEcpC4MYF4OsmCKLQ7tJuNxynorNRpkaMHNYmUCGMHBxCsBEBJcwMkz8vWXzrYkLLY+d
 Whp69v8jweSr7KumH5kkxXtikSHHrzwLhv8Bj4w+WD5692yWYNEenn+bWBdNqHVfUBEgWtKXeyj
 xXBcvAA==
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

Set SB_STATE_EMERGENCY_RO next to EXT4_FLAGS_EMERGENCY_RO when an error
makes the filesystem read-only. The VFS then refuses modifications
before they reach ext4 and reports the superblock as read-only like it
did when ext4 still set SB_RDONLY. The shutdown state stays ext4's own
and so do all of ext4's checks because they cover both states. ext4
keeps showing "emergency_ro" in its mount options.

EXT4_IOC_SHUTDOWN with EXT4_GOING_FLAGS_DEFAULT fails after an error on
mainline today because ext4_sync_fs() fails the freeze. freeze_super()
refuses it in the emergency state now. ext4 refuses writes in that state
anyway and the journal is aborted, so shut down without the freeze like
EXT4_GOING_FLAGS_NOLOGFLUSH does.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/ext4/ioctl.c | 4 ++++
 fs/ext4/super.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index e8e579498c990..ce0e0ebdded61 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -821,6 +821,10 @@ int ext4_force_shutdown(struct super_block *sb, u32 flags)
 	ext4_msg(sb, KERN_ALERT, "shut down requested (%d)", flags);
 	trace_ext4_shutdown(sb, flags);
 
+	/* After an error there is nothing to flush and freezing fails. */
+	if (flags == EXT4_GOING_FLAGS_DEFAULT && ext4_emergency_ro(sb))
+		flags = EXT4_GOING_FLAGS_NOLOGFLUSH;
+
 	switch (flags) {
 	case EXT4_GOING_FLAGS_DEFAULT:
 		ret = bdev_freeze(sb->s_bdev);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index ae5ba6823c01c..afbdbb607b144 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -757,6 +757,7 @@ static void ext4_handle_error(struct super_block *sb, bool force_ro, int error,
 	 * and other problems.
 	 */
 	set_bit(EXT4_FLAGS_EMERGENCY_RO, &EXT4_SB(sb)->s_ext4_flags);
+	sb_set_emergency_ro(sb);
 }
 
 static void update_super_work(struct work_struct *work)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
