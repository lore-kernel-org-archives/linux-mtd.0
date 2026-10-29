Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C05D60A5BE1
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YRjXqeii;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABt2RYVA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1v+MKpvNbEGVBOOgIjKqduA7ocK587nI5Hv7E2AnQlk=; b=YRjXqeii0+e0gj4oLQrDtV90ad
	8FxGSDzgZ5zX6diCWHgqUxjvZL8nEWPJOrOJzacSI4/jTwIl3IGl8d/+oP67C5wVVsrRPwFiLUVLw
	fXMHB5OyHEZB5c30JBW4MPWFOVHAjbY9dojxvFmGuXz04XwhC7GFx9iXNE+MkhTUBCZHSFWvR/4Y7
	nQKgPJRBD83Pc5/G+Iq2fgbYW2VhL+pBNd8ssXlVT3AWPaOHr0Tap0v7Ua70ST9I+NMIgocerGUQC
	cNKvL+hhcXg64n5YNkf5zcX/6rG3AAbTrep9Q3FXxwyzFinllSXsUXG8ymT70vBdobdr12te0ed6H
	+GG80W2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSgf-00000009l4m-3MvP;
	Thu, 29 Oct 2026 16:09:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSge-00000009l3q-37JU
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:09:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 291BD60627;
	Thu, 29 Oct 2026 16:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F217E1F01816;
	Thu, 29 Oct 2026 16:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290147;
	bh=9ADr5uxJPXuGSjmeSGOe/2HYqgziipL7CUE4bWIG/18=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ABt2RYVA2KoxIjSG5vgRH3ki49HTifsqyx/g/KB/M0qNec6zvvg+0UnIB8Mwd9ns9
	 +BCcX2Bb7Vi4XfGkfOTHETD5v691H0hkfOoj/53iBnqgfLG5j5meEED3gUuR5+HzC1
	 9Nbe93wzU77lHWbxmi19/YgvmxTKHDY7q/z1PxSMql4a6jLJcyPI10OceZrVRjtxX8
	 rzVeodpu/5ORvMc6LNRhIWzcb/6Q1zeozVR3SqtFitE4PJaW5FAdh3yrBz/E92aIu1
	 IPVv/bplo0PbZvP3hHhYhbb/nL+bdgfvUD+gFW0cBSalx5WWcG9bzO2KG1myYgNHFu
	 yGXS1LRKG6QjA==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 29 Oct 2026 17:07:16 +0100
Subject: [PATCH v2 25/34] gfs2: wait for a pending withdraw before
 remounting read-only
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-work-fs-sb_rdonly-v2-25-2f44f64f0b66@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796; i=brauner@kernel.org;
 h=from:subject:message-id; bh=vPcA48zGmDM3VG6ECx06EweZE2j9qUmDjvB8EUFB68s=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9zjco1fonfk/gZn31p9D/R6s+58c9Pn994u6dS/J2H
 2vv4n6xtKOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAiMq8ZGQ7IqfSquD3f8W6t
 /vTZ1exK2Zrsne6eWrLJ8487hrzfocHIsIuDi1O36d2MaQJqrSXOJfKzBSw+fSxeuurLgrK3csb
 23AA=
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

Since commit 9c4a3de6cd5b ("gfs2: Asynchronous withdraw") most of a
withdraw happens in do_withdraw() from a work item and SDF_JOURNAL_LIVE
stays set until then. A remount to read-only in that window bails out of
its log flushes on the withdrawn filesystem and gfs2_quota_cleanup()
hits its BUG_ON(). Flushing the work isn't enough because
gfs2_withdraw() only queues it after setting SDF_WITHDRAWN and a
withdraw can also start in the middle of gfs2_make_fs_ro().

So let do_withdraw() wake up waiters when it clears SDF_JOURNAL_LIVE and
let gfs2_make_fs_ro() wait for that right before gfs2_quota_cleanup().
umount doesn't need to wait because it sets SDF_NORECOVERY first.

gfs2_make_fs_rw() could leave the bit set on a withdrawn filesystem too
if do_withdraw() ran between its withdraw check and setting the bit. So
do both under sd_log_flush_lock which do_withdraw() holds while it tests
the bit.

Fixes: 9c4a3de6cd5b ("gfs2: Asynchronous withdraw")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/gfs2/super.c | 20 ++++++++++++++++----
 fs/gfs2/util.c  |  2 +-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 04bb4cf787d4..f61c309368ef 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -146,12 +146,21 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 	}
 
 	error = gfs2_quota_init(sdp);
-	if (!error && gfs2_withdrawn(sdp)) {
-		gfs2_quota_cleanup(sdp);
+	if (error)
+		return error;
+
+	/*
+	 * Check for a withdraw under the lock do_withdraw() holds while it
+	 * takes a live journal down, so one of them sees the other.
+	 */
+	down_write(&sdp->sd_log_flush_lock);
+	if (gfs2_withdrawn(sdp))
 		error = -EIO;
-	}
-	if (!error)
+	else
 		set_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
+	up_write(&sdp->sd_log_flush_lock);
+	if (error)
+		gfs2_quota_cleanup(sdp);
 	return error;
 }
 
@@ -567,6 +576,9 @@ void gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 				   HZ * 5);
 		gfs2_assert_warn(sdp, gfs2_log_is_empty(sdp));
 	}
+	/* A withdraw that do_withdraw() didn't finish yet leaves it live. */
+	if (!test_bit(SDF_NORECOVERY, &sdp->sd_flags))
+		wait_on_bit(&sdp->sd_flags, SDF_JOURNAL_LIVE, TASK_UNINTERRUPTIBLE);
 	gfs2_quota_cleanup(sdp);
 }
 
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 529c3ec37a18..888e0d6bf512 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -121,7 +121,7 @@ static void do_withdraw(struct gfs2_sbd *sdp)
 		up_write(&sdp->sd_log_flush_lock);
 		return;
 	}
-	clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
+	clear_and_wake_up_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 	gfs2_ail_drain(sdp); /* frees all transactions */
 	up_write(&sdp->sd_log_flush_lock);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
