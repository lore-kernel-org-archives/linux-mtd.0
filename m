Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886FB606A9C7
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ol//rMZv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nMjZ/AQE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dYA8FwTGN4fFMNSdfDrSk7SvVg5VfM052t4JDbIGKxs=; b=ol//rMZvKLuobfrTQiC7z0TTvB
	qC7aNl2X3xhzg0Lv2pLnp1O16OvDiEk2YJ4NHeljHm/gCro1ZCxD+UU5XnrgF+JBWxIsn1/LUG7C2
	J+NJIvmKfhoxtn8ezA32HSS7NmSv1+y2ob5A2J8EUeF6gkJZ2l8fK4UVPqZkTzwxI2Yh3XahzIoXS
	63bWb8wH878dS4uSR41zrpXINndNIkSdTMEnLA+afnmPgWvt/Lmg19k7HdY5RdrsdKvF53NRUa968
	0i0AhUXbLibTV52COYjsU381D+yE3KhOgmkKyTVje1nFGFuV8dxVdrloai560BO44fJT7vizf//e4
	0VcE9ySA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMShD-00000009lUO-11xC;
	Thu, 29 Oct 2026 16:09:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMShC-00000009lTg-1g0U
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:09:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D25D4400C;
	Thu, 29 Oct 2026 16:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0168F1F01825;
	Thu, 29 Oct 2026 16:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290182;
	bh=uu2WZyDd3RZlZWsibqonNb2mhu+3OgxLhhAg+SnBEig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nMjZ/AQEmAxledocQ9n+3ExKHoDEzHnf0mT+qoruM99B/d+FhxzlfdtRVlmt3+iCx
	 IwzpcFh7kugD3gwuTS9UxbnfonMQCdfrr7oKzA5E2T6EDI4rTB2cqtcAhGMSbw02M8
	 Ln8vA1wzgrdhCfq0EYl+yLzfRhyU+o6Q5p4s7vDMU87X5a0cSuKZK5rMcwWp/RsBiv
	 zOYeZQh+1uCd9Epg2VMVj8Uq3/P68Qlf9ffbS13vOiEfBVGe4T2BFmNIWQv6L26HUN
	 km/Kayv7uhrohDU0JU7L+XvpBIeVqCAiK+BrnCuylApb6wPnkl3/BQXRf/EMaxfyXp
	 VDORzaitoD+bQ==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 29 Oct 2026 17:07:24 +0100
Subject: [PATCH v2 33/34] xfs: allow remounting read-only after a shutdown
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-work-fs-sb_rdonly-v2-33-2f44f64f0b66@kernel.org>
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
 "Christian Brauner (Amutable)" <brauner@kernel.org>, stable@vger.kernel.org, 
 Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2140; i=brauner@kernel.org;
 h=from:subject:message-id; bh=3Kb6qOKbZ504nrKdu5KYQnNbjYN4iHgbKmRWzuk322Q=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9zjdInCYZ5rLtdpyYVoEzQ3Vh8D/eS8sNopf0/lyTd
 cnA+ndKRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwEQuqzD8L479erR1WmD8TYYZ
 bb8fbl/56OjM+fXX/jcfVVvPeGrejXCGv/JtQZsquVR7XNepyVmqvg1ufriNmz+MdVKf2vWSC6s
 YOQE=
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
index 5a06132aa384..59c83438d402 100644
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
