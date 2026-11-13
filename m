Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81571606A33E
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0LztYI3m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cf+yeFhO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oth1g7Bjb4T9rasdfnIFzrYjcjudB3lGqh69Fi99cF0=; b=0LztYI3mHoj0ehJvy3hcZaKT8q
	DG/bytCDD3vDW8Squ7GC8Zp5iyIrtOGNJ62gaLL4H6Af0yIaLOX63mzX9lfY9RHvAxpNwTzNB/i/+
	e8pZuGz2uMmURKerFQPZsZuw0mnFWH263GG5I2DbATJTASuRVbsItULOcL//tCZeuFDOF7n58vugv
	hgVJsUTJCRpSWAId9bte5ykJwf/biG2LqugThgNAdIQwTxMIjCCCcLDfyMXU2Bqsiiy6uEfJreG40
	j4RIbViQU0VCMJrlmq31O7rLccKLtaH2bJ3Dgs+m2+d/3F+wzgMCT45Stbjyd2WLE2wsNqBiVsHKV
	qw8MC+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpzJ-0000000CdIj-0yH0;
	Fri, 13 Nov 2026 12:02:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpzH-0000000CdHp-2cJh
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 12:02:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 13E0562236;
	Fri, 13 Nov 2026 12:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF12E1F000C4;
	Fri, 13 Nov 2026 12:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794571354;
	bh=nqpl7OV39r2iQfy91FqwaHd5ZOtj6zGRSvahZGEYD+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cf+yeFhOxffbF4Gcf34O35WTxadG12WvPaCmfzpM4r32A0Zx6mgMDJc1sLO/YM6kO
	 AttOejPt8vjAVMDguouOKgG4chNWLadxzD+/+x0udw00EWdrBxZXjjyUGxXiNfr0KL
	 2Cy4hMfY6XBfQRpX+3tRTOLMyM9ycZzFnmbhGe4vQX/XMXAN8zxW+nTIQRZUDSPFN+
	 UA0HoX/cY+5dUrCcKOGhiq27KEj1oYfFrxgN2XYCRdQGCGFk9rXYAWmgfrTpRTXfVE
	 pkxsl//WEYBESVhL4XDuY4okx74G61h8X8gdb9K34VBxKOCwUYhd2LlsYSC6gjpuqG
	 xJXrsVuVLfs5g==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 13 Nov 2026 12:59:29 +0100
Subject: [PATCH v3 33/33] xfs: allow remounting read-only after a shutdown
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-work-fs-sb_rdonly-v3-33-0be92bb73709@kernel.org>
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
 "Christian Brauner (Amutable)" <brauner@kernel.org>, stable@vger.kernel.org, 
 Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Wv1rk/34mZRddPCwhZsrnHdy4Y6/8eX5Up6b2ymQePk=;
 b=kA0DAAoWkcYbwGV43KIByyZiAGr2+8Ci+Z4+6tOwi97X6NaG06NaC9t14B0Ks88kXi6ffXLsd
 Yh1BAAWCgAdFiEEQIc0Vx6nDHizMmkokcYbwGV43KIFAmr2+8AACgkQkcYbwGV43KJHWwD/VEUp
 qHV8TWkuKU4bX3KINk6z04cdivoCpFl2Vn3AuVEBANhCoTbo2sLJQwZevodePoMGYTNnOhgh2Gr
 V9nOa3SIE
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

xfs_remount_ro() starts with sync_filesystem() which fails with EIO
after a shutdown. So a shut down xfs can't be remounted read-only and
emergency remount (sysrq u) WARNs in reconfigure_super(), a panic with
panic_on_warn:

  forced remount of a xfs fs returned -5

Going read-only doesn't need to write anything. So ignore the errors
from flushing and from freeing the COW and post-EOF blocks once xfs is
shut down, also if the flush shut it down itself. The rest of
xfs_remount_ro() copes with a shutdown like unmount does. And refuse
going back to read-write with EIO, xfs_remount_rw() didn't check for a
shutdown at all.

Fixes: b97cca3ba909 ("xfs: only bother with sync_filesystem during readonly remount")
Cc: stable@vger.kernel.org
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/xfs/xfs_super.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 5a06132aa3846..59c83438d402b 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -2041,6 +2041,10 @@ xfs_remount_rw(
 	struct xfs_sb		*sbp = &mp->m_sb;
 	int error;
 
+	/* Nothing can be written anymore after a shutdown. */
+	if (xfs_is_shutdown(mp))
+		return -EIO;
+
 	if (mp->m_logdev_targp && mp->m_logdev_targp != mp->m_ddev_targp &&
 	    xfs_readonly_buftarg(mp->m_logdev_targp)) {
 		xfs_warn(mp,
@@ -2115,9 +2119,12 @@ xfs_remount_ro(
 	};
 	int			error;
 
-	/* Flush all the dirty data to disk. */
+	/*
+	 * Flush all the dirty data to disk. That fails after a shutdown, also
+	 * one the flush itself caused, but going read-only still has to work.
+	 */
 	error = sync_filesystem(mp->m_super);
-	if (error)
+	if (error && !xfs_is_shutdown(mp))
 		return error;
 
 	/*
@@ -2133,7 +2140,7 @@ xfs_remount_ro(
 	 * cached inode, so this requires a synchronous cache scan.
 	 */
 	error = xfs_blockgc_free_space(mp, &icw);
-	if (error) {
+	if (error && !xfs_is_shutdown(mp)) {
 		xfs_force_shutdown(mp, SHUTDOWN_CORRUPT_INCORE);
 		return error;
 	}

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
