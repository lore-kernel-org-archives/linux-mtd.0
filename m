Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB232606A321
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LWWgC0Iy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m9szMX/f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6DIC5hMlQ1Fih86Sv72dwovvzo2SymrR48PLdzIGhSQ=; b=LWWgC0IyIdM8HwxZnjNpXhyLw0
	HUpgDwUJlcEaLObFLfZ29UcDD/l4SFXxcb0gZbeSyOOELF6LS+WHAYvKJwgFtCu71R+msrjYnpjiC
	kUeQ+zL2T4LBqgkDY/InFcrZWo/F3TKt90ZEvgAjLwI48NWUsZNkIlw/qRQwvHGdZfIZzXsSOl2LV
	xk+rk5ohbUyWG9V2JIGi8BVcMhXGchJnTUEKzXDOaqNrPg1r7rp/3YpeO9MK0+4EzBDnFHWhN8sXS
	sLF1W7e29slMgcEeqi7mg4kIb6O1zhKvNQk3/45uKQvXNRqx64jID2iX6exso2SYyIjsCIFyq4hpQ
	E2mj+YMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSf2-00000009jpE-1iHm;
	Thu, 29 Oct 2026 16:07:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSf0-00000009jog-1L7A
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:07:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B4EF960617;
	Thu, 29 Oct 2026 16:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EA01F01816;
	Thu, 29 Oct 2026 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290045;
	bh=uBzHd4puvf7PelR0/56wwfcOU7QQK1cg7vOg9biOXQ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=m9szMX/fEVXD68Fjo3EeIkbSZWBiFCaUdnZ+VIh59ux0qGOuLrE6FOEM4OJ1WZJSQ
	 f9sjcBIGp3cmwtR0Vr1suMoxuUz16RM22QVCXpsDoj7hgG+YtZpQhzQ+8ERPTwSOx+
	 FENqtUXhbWb6AJt7guMCyWwmoiN2tg6DAlUgnisQ768405K+ORmRZs5e5Mai6t3IC7
	 JCG+wlnqB5yg7zzE/v6YXROVwr2DAybfz/I3VBKz/fd7tFcRlVQ9jktvnhDRhYblg5
	 /ZXlk9pRMGfEiSj5AyGOVRF7ifG92+RvMqsktF5VXStBqOVxXjmAQApSiLmPU3bTZN
	 rhuPH0MlQETDw==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 29 Oct 2026 17:06:52 +0100
Subject: [PATCH v2 01/34] ecryptfs: don't leak the inode when a lookup
 can't open the lower file
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-work-fs-sb_rdonly-v2-1-2f44f64f0b66@kernel.org>
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
 Farhad Alemi <farhad.alemi@berkeley.edu>, Tyler Hicks <code@tyhicks.com>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542; i=brauner@kernel.org;
 h=from:subject:message-id; bh=x7sC/M8PNJXXdVBMQkSwa4kj/sguCVJ7hcSWkzP5Ueg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9ztfzU+27Xxy89YL9ydKruYr84d16Vtu6Xx3cYmlqd
 2qRy3v1jlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIlI8DIyHLp2+rNUvlLI3k6/
 3/ESRv/2vGuTuqrwxpzRw0Za2C/LgZHhgMcuQdFr2SV/T3svv3sy4ytP6qPJq7j+hG79yNS0x2Y
 vMwA=
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

ecryptfs_lookup_interpose() opens the lower file of a regular file to
read the size from the header. If that fails it marks the inode bad and
returns, but a new inode is still I_NEW and nobody ever unlocks or puts
it. So it leaks together with its lower inode, a concurrent lookup
through another hard link waits for it forever and umount complains
about busy inodes. The lower open fails e.g. with ETXTBSY while the
lower file is executed. A cached inode is marked bad for all its other
users instead.

Use iget_failed() for a new inode and iput() for a cached one.

Fixes: 3b06b3ebf441 ("eCryptfs: Fix new inode race condition")
Cc: stable@vger.kernel.org
Reported-by: Farhad Alemi <farhad.alemi@berkeley.edu>
Closes: https://lore.kernel.org/r/CA+0ovCgYP920GT68hAJK6Trjyv1kGv2dZAuem4LEunycQ=POww@mail.gmail.com
Acked-by: Tyler Hicks <code@tyhicks.com>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/ecryptfs/inode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 48e520960d66..3a966348a578 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -362,7 +362,10 @@ static struct dentry *ecryptfs_lookup_interpose(struct dentry *dentry,
 	if (S_ISREG(inode->i_mode)) {
 		rc = ecryptfs_i_size_read(dentry, inode);
 		if (rc) {
-			make_bad_inode(inode);
+			if (inode_state_read_once(inode) & I_NEW)
+				iget_failed(inode);
+			else
+				iput(inode);
 			return ERR_PTR(rc);
 		}
 	}

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
