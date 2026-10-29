Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA5F60A2622
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cwi/oj+Z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S1VrcVdR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LXr3n510XQ8Ej5Xh6KO2OmhUlvOjeusbvGzTKAz7Wio=; b=Cwi/oj+Z4YFTD1Y8vbr+orVZ0A
	dSX0oCwQ3WdgykoXxq+wSe0Y9KHnOgJ2uELmDum5ihwpXH1hT3Aw3ETO1PhkrPl7uU474v/xAQNUo
	9Q+4AVqrp8qQ7WBiFOArWpRgV66hiY27ovpb/7aoieaHvCvML+fZ2BxHxmDiSY4oUJL3pAjihqybv
	oiR6cXBVMx7FNYI876CycsBpZ3tI3Ii+gUBqMsmA4Dhcds7nAqdEU0RmNqjd9KbHXpQJb4dEklCFv
	hhbOUxmMLaX63fsuA5YeO9txBgEvXcgEcfWWC0vufERim4DbyPkKQOqCeBiigIrZ9rDPcesj5OKp/
	SJz5EUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSgk-00000009l8Z-05C4;
	Thu, 29 Oct 2026 16:09:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSgi-00000009l7G-2Cck
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:09:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B3CE41408;
	Thu, 29 Oct 2026 16:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DD91F031E1;
	Thu, 29 Oct 2026 16:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290152;
	bh=16Wgozw7LT1A5dnMoJk9SHvNZZAzQHZiP5/cR8RnnG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=S1VrcVdRnOvjP4guVATOUYSh2lSw7KvpmtRZJkenH5WiiCzWXOMSugsIQ6KKG9ruY
	 zQp8jE3B0+Uq23U/Ke7WU85HbFvw+Zb4NvrwlZnKgVYSwJ44OALdo0VacN9o6XWAyY
	 rODHyJbrdd7wMxHesIuwViARaA8X3D0GGo0NsDvwe53p+vre+zuUNphRHyenQrHCJT
	 mZJvMH77+58E/EqBVgo3e/Le0z7pZqJYjfvT/7NXGOZ9aVpjuppQvc2tvW7HdnijBR
	 xJVQk2g5Z12Jn6bLsmqmSM0vFsTSdC4FrxF6im6ITyi8u1ViGKwnEjkfEUhnpJrPkF
	 +1u4PBKBdrdtw==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 29 Oct 2026 17:07:17 +0100
Subject: [PATCH v2 26/34] gfs2: don't set SB_RDONLY on withdraw
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-work-fs-sb_rdonly-v2-26-2f44f64f0b66@kernel.org>
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
 "Christian Brauner (Amutable)" <brauner@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4731; i=brauner@kernel.org;
 h=from:subject:message-id; bh=KWX2HXFYLWOE6OyGqLY2drCdSkcUPo4c9Q5+N17QpVI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9zjcQu27C9P4ik4DW6xNqGsUX+Lx2fJEUnPPhla/hF
 jYNfcUHHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPpfsPIsETt1cbFfxv2XNc9
 2r3/akT6ueTH5/Kd1LV0RLKarokkfmb47yJw4KrX53/3BaZMyXzMK9aiOiPL3/CVPpv5d7OY5md
 SjAA=
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

do_withdraw() sets SB_RDONLY from the withdraw work without holding
s_umount, also on a frozen filesystem. FITHAW then fails because a
withdrawn filesystem can't take the freeze glock. Emergency thaw and the
gfs2 "freeze" sysfs file see SB_RDONLY and leave the s_writers rwsems
locked. Writers hang and umount warns. And freezing after a withdraw
fails and leaves the superblock frozen.

SDF_WITHDRAWN already stops all modifications, so stop setting
SB_RDONLY. A few things have to come with that:

(1) gfs2_evict_inode() and gfs2_quota_sync() check gfs2_withdrawn()
    next to sb_rdonly().
(2) gfs2_write_inode() returns EIO once withdrawn because sync and
    umount don't skip writeback for a read-only superblock anymore.
(3) gfs2_do_thaw() thaws even if the freeze glock can't be taken again.
(4) gfs2_freeze_super() refuses a withdrawn filesystem with EIO and
    thaws the superblock itself if the withdraw happens while it tries
    to freeze.

This can't be split up. With only (3) FITHAW leaks the rwsems of the
read-only superblock. With only the SB_RDONLY change FITHAW can't
release the rwsems a freeze took after a withdraw.

A remount to read-only writes nothing once do_withdraw() ran and waits
for it since the previous patch, so sysrq u works on a withdrawn gfs2.
Going read-write still fails with EIO. A withdrawn filesystem stays "rw"
in /proc/mounts and statfs() doesn't report ST_RDONLY anymore. The
withdraw file in sysfs still shows it.

Fixes: 601ef0d52e96 ("gfs2: Force withdraw to replay journals and wait for it to finish")
Fixes: b77b4a4815a9 ("gfs2: Rework freeze / thaw logic")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/gfs2/quota.c |  2 +-
 fs/gfs2/super.c | 20 ++++++++++++++++++--
 fs/gfs2/util.c  |  5 +++--
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index b2984fb7b35c..affe4c3451f5 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1335,7 +1335,7 @@ int gfs2_quota_sync(struct super_block *sb, int type)
 	u64 sync_gen;
 	int error = 0;
 
-	if (sb_rdonly(sdp->sd_vfs))
+	if (sb_rdonly(sdp->sd_vfs) || gfs2_withdrawn(sdp))
 		return 0;
 
 	qda = kzalloc_objs(struct gfs2_quota_data *, max_qd);
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index f61c309368ef..82f9d90f3578 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -455,6 +455,9 @@ static int gfs2_write_inode(struct inode *inode, struct writeback_control *wbc)
 	int ret = 0;
 	bool flush_all = (wbc->sync_mode == WB_SYNC_ALL || gfs2_is_jdata(ip));
 
+	if (gfs2_withdrawn(sdp))
+		return -EIO;
+
 	if (flush_all)
 		gfs2_log_flush(GFS2_SB(inode), gl,
 			       GFS2_LOG_HEAD_FLUSH_NORMAL |
@@ -686,7 +689,8 @@ static int gfs2_do_thaw(struct gfs2_sbd *sdp, enum freeze_holder who, const void
 	int error;
 
 	error = gfs2_freeze_lock_shared(sdp);
-	if (error)
+	/* A withdrawn filesystem can't get the freeze glock back, thaw anyway. */
+	if (error && !gfs2_withdrawn(sdp))
 		goto fail;
 	error = thaw_super(sb, who, freeze_owner);
 	if (!error)
@@ -751,6 +755,11 @@ static int gfs2_freeze_super(struct super_block *sb, enum freeze_holder who,
 		mutex_unlock(&sdp->sd_freeze_mutex);
 		return -EBUSY;
 	}
+	/* A withdrawn filesystem can't take the freeze glock anymore. */
+	if (gfs2_withdrawn(sdp)) {
+		mutex_unlock(&sdp->sd_freeze_mutex);
+		return -EIO;
+	}
 
 	for (;;) {
 		error = freeze_super(sb, who, freeze_owner);
@@ -767,6 +776,13 @@ static int gfs2_freeze_super(struct super_block *sb, enum freeze_holder who,
 			break;
 		}
 
+		/* Withdrawn meanwhile, don't take the freeze glock again. */
+		if (gfs2_withdrawn(sdp)) {
+			(void)thaw_super(sb, who, freeze_owner);
+			error = -EIO;
+			goto out;
+		}
+
 		(void)gfs2_do_thaw(sdp, who, freeze_owner);
 
 		if (error == -EBUSY)
@@ -1488,7 +1504,7 @@ static void gfs2_evict_inode(struct inode *inode)
 	int ret;
 
 	gfs2_holder_mark_uninitialized(&gh);
-	if (sb_rdonly(sb) || !ip->i_no_addr || !gl)
+	if (sb_rdonly(sb) || gfs2_withdrawn(sdp) || !ip->i_no_addr || !gl)
 		goto out;
 
 	/*
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 888e0d6bf512..e720f73b7b24 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -132,9 +132,10 @@ static void do_withdraw(struct gfs2_sbd *sdp)
 			   gfs2_log_is_empty(sdp),
 			   HZ * 5);
 
-	sdp->sd_vfs->s_flags |= SB_RDONLY;
-
 	/*
+	 * No SB_RDONLY, that needs s_umount. SDF_WITHDRAWN already stops all
+	 * modifications.
+	 *
 	 * Dequeue any pending non-system glock holders that can no
 	 * longer be granted because the file system is withdrawn.
 	 */

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
