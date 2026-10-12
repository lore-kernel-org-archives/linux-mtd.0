Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2247CA9ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6YB9GHWzC+9xm9yBTjL0dlwSyZsv9kaXJ5Iv/gL4as=; b=Cb1pE8CUHCjvr0
	xrzXoyYqJ5wCaghrFEzEi0V3+30QnutEGx+nLRjEV7UdczSdTaIpqr5FTB3T/aXZXNtfHtBfu1SqC
	Buc1Q9MdK18mwzrf78FiVA/DLgLxH8AYlYvLCajZGh2FQ+KoGKITN0k8aEJMG5mQ8HVN7xZiNpN4O
	hPVxrl+8kRn9PzpcELgJ+oQbmzMNJn/QMvyHi1hTLMSVMJUNE3z5NrazxJ9OskyW9ZO4VFasQV7gW
	VTAyDhXKt+XrDwjCDCHeJXNDqJmbGAPK3i0t3/bannRDh/hc/Neab4DqJYODjrkEZxbfaK5XA1Z3C
	7bFQqjA543sR2HwdVW5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDB1-0000000ADk7-0WCq;
	Mon, 12 Oct 2026 10:22:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAz-0000000ADhC-0pCV
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 10:22:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B0F1600C8;
	Mon, 12 Oct 2026 10:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F811F0089B;
	Mon, 12 Oct 2026 10:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791800556;
	bh=vgDedfjRwh4YOmxqrRRiPGBjHE9CSwlSfOA+t8Q4iXk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cpfEjfXH/JD0H59z1QgSGVj7YLRDW83lZfWly1Sj7cw99B7LxZeNl2oCLyoka6XXS
	 daqNpnjQ1xNYVUFPwAJKn7CKfkjLzPaLuX9nbW5kTJO+eBH1E5EnfRGIaTS6V+pbUS
	 1RLKgJkATl67XqL9Wa1SMSKSyAMzHFT/lxJOFGM66GcRywGs96VkbbN4VWqNk16MJf
	 2gYRC280kDAENlpL9kHwjxAOGEyxO41ZaRLOCBnV7h/32y7YwDfgtddIn2+NAXlJQW
	 zV3bQ3fraVzimrHW/Huk7wxsqHtkweb+fitbh+ckiPUpDd+tu9FGfrlfomz+85WMYC
	 z2gGxd2FR8Wqg==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 12 Oct 2026 12:21:05 +0200
Subject: [PATCH RFC 20/28] gfs2: wait for a pending withdraw before
 remounting read-only
MIME-Version: 1.0
Message-Id: <20261012-work-fs-sb_rdonly-v1-20-60743a3dc326@kernel.org>
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
In-Reply-To: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
To: Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, ntfs@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org, 
 gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-3d1b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4376; i=brauner@kernel.org;
 h=from:subject:message-id; bh=GYjqxZYqopzPnVVFYEWOx3r5MWCPbQX3XfzFmIIe7I4=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSd2TJZ5euW5F0Cj1L5dO6n+dpFv1ZUvryvImjyNIVrr
 yK0f7fN6yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhI4QlGhr6Dj0pD8p8k/X3g
 whSzO2xJFMuH6X88St9HcWzR1Dp5ToSR4Urug2A97UeSkhkPZl/aphGkeXpdxZPnWZwbcg5YPCl
 X5gMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Since commit 9c4a3de6cd5b ("gfs2: Asynchronous withdraw") most of a
withdraw happens in do_withdraw() from a work item and SDF_JOURNAL_LIVE
stays set until it ran. A remount to read-only in that window goes
through gfs2_make_fs_ro(). Its log flushes bail out early on the
withdrawn filesystem before FLUSH_SHUTDOWN can clear SDF_JOURNAL_LIVE
and then gfs2_quota_cleanup() hits its BUG_ON():

  kernel BUG at fs/gfs2/quota.c:1532!
  RIP: 0010:gfs2_quota_cleanup+0x562/0x6b0
   gfs2_make_fs_ro+0xf3/0x2e0
   gfs2_reconfigure+0x42e/0xfd0
   reconfigure_super+0x437/0xb20

Just flushing the withdraw work before the remount isn't enough.
gfs2_withdraw() sets SDF_WITHDRAWN, calls dump_stack() and only then
queues the work. So a remount can see a withdrawn filesystem while
there's nothing to flush yet. And a withdraw can also start in the
middle of gfs2_make_fs_ro().

So let do_withdraw() wake up waiters when it clears SDF_JOURNAL_LIVE and
let gfs2_make_fs_ro() wait for the bit after its log flushes, right
before gfs2_quota_cleanup(). On a healthy filesystem the shutdown flush
already cleared it. umount doesn't need to wait. gfs2_put_super() sets
SDF_NORECOVERY first and gfs2_quota_cleanup() only BUGs without it. Once
the bit is clear the journal isn't live anymore and gfs2_make_fs_ro()
doesn't write anything.

gfs2_make_fs_rw() can leave the bit set on a withdrawn filesystem as
well. It checks for a withdraw and then sets SDF_JOURNAL_LIVE. If
do_withdraw() runs in between it finds the journal not live yet and
returns. Nothing clears the bit then and the next remount to read-only
waits for it forever. So check for the withdraw and set the bit under
sd_log_flush_lock, which do_withdraw() holds while it tests the bit.
Then either the remount sees the withdraw or do_withdraw() sees the live
journal.

Reproducer, lock_nolock: a SCHED_FIFO task writes 1 to the withdraw
sysfs knob from cpu 1 and keeps cpu 1 busy (RT throttling and cpu 1's
fair server disabled) so do_withdraw() can't run, then from cpu 2:

  mount -o remount,ro /mnt

On lock_dlm the window lasts as long as the withdraw helper runs. The
window before the work is queued can be widened with a kprobe on
dump_stack_lvl() that delays the task writing to the withdraw knob by a
few seconds. A remount to read-only or sysrq u in that window hits the
same BUG_ON().

Fixes: 9c4a3de6cd5b ("gfs2: Asynchronous withdraw")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/gfs2/super.c | 22 ++++++++++++++++++----
 fs/gfs2/util.c  |  2 +-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 06302c29340f..1d7b39354d65 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -147,12 +147,23 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 	}
 
 	error = gfs2_quota_init(sdp);
-	if (!error && gfs2_withdrawn(sdp)) {
-		gfs2_quota_cleanup(sdp);
+	if (error)
+		return error;
+
+	/*
+	 * do_withdraw() only takes a live journal down. Check for a withdraw
+	 * under the lock it holds for that so that either we see the withdraw
+	 * or it sees the journal live. Otherwise gfs2_make_fs_ro() waits for
+	 * the bit forever.
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
 
@@ -565,6 +576,9 @@ void gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 				   HZ * 5);
 		gfs2_assert_warn(sdp, gfs2_log_is_empty(sdp));
 	}
+	/* A withdraw that do_withdraw() didn't finish yet leaves it live. */
+	if (!test_bit(SDF_NORECOVERY, &sdp->sd_flags))
+		wait_on_bit(&sdp->sd_flags, SDF_JOURNAL_LIVE, TASK_UNINTERRUPTIBLE);
 	gfs2_quota_cleanup(sdp);
 }
 
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 83b8bb6446e5..1535ce2b7aa8 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -122,7 +122,7 @@ static void do_withdraw(struct gfs2_sbd *sdp)
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
