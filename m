Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82496606A89D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jO3wzzeO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JRILRqwd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qO2NYy3BNjd8N+CYwPgKD2XVWIv3SQ+z6vSPdcFWLfI=; b=jO3wzzeOh2oIEhEpfMFn1tj13N
	GCWaYhySKWIsHt0VYMYjV+JzyNJ6JPW6jGiA3nNbJy4pPB34NJi7wqyR9v2pd2PkXZfu85AQASVtg
	aZswV7X9FVPuxJT8ysG2trxfl/ntHZS4tzC1hrtI631YPkqBBZSlH2bfVRJQ3VcsMmummhwz0JSaZ
	MPUeZJ38XGPn4VK+MMBUW6EKnlqZ6TR6cdt2U/sS3kfVrvzaegWDvD4bNL4Qp1rh1wm71TOnIgpCv
	tTtJYk3cs4C71ixNjFU2JsciwrEbSCUXPAOds+q1nPZRSoLVM5zmucuRX1ns431iWbWRg09etFIxX
	KB+KpaoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpxC-0000000CbsA-0vAp;
	Fri, 13 Nov 2026 12:00:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpxA-0000000Cbr4-1GcZ
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 12:00:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DEDD1421F3;
	Fri, 13 Nov 2026 12:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E811F000C5;
	Fri, 13 Nov 2026 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794571223;
	bh=fcUPAY7Omn+SLVKKp6rIXL2FdbTX+CoaPRplNDl/Les=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JRILRqwd4JRgYzxUqWzJjNJlZe50YGlY+OaXv6HHQUZ/YRL+egTShAGjpX/70665+
	 Nd9K1WH0rqdzRgv8HsOuog0O0NolbJ+thxfmrdZowu+oxZTtS5QzEQcOIUdVNmx8f0
	 UJQ4eQhxK+Fnl9k+68gHrlzlyKY1NN8Vyj/sEz9ODGaM5Rdxwnurz9lGIsrgOf3Lcj
	 SmgyiukO64uSDlM/RD3oySDk+ptebhvq18FN4TuIt6DchF+K+FbLsqScLqwKzVdZ8s
	 LrgCTVlLMbHT9Vv3dBRYuIx42nvdS3v4ICzRtq/RueTY/XtvzirWDph/Fv2B53Vl4Y
	 Cbno+lrB2kv9g==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 13 Nov 2026 12:58:59 +0100
Subject: [PATCH v3 03/33] ecryptfs: don't leak the inode when a lookup
 can't open the lower file
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-work-fs-sb_rdonly-v3-3-0be92bb73709@kernel.org>
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
 Farhad Alemi <farhad.alemi@berkeley.edu>, Tyler Hicks <code@tyhicks.com>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1544; i=brauner@kernel.org;
 h=from:subject:message-id; bh=YAwCWT/i/fjx/KfCi+3/MK6nbc2fiyWIJhkFODNNUZ8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9+z1HsaTv488H3xpWX/srV7CPeeZrxWrdNBszu55di
 c3reiZN6ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhIrjQjwySrtUH91ksq2b6F
 f2RuXzKXt/pX8WYeq3KBE7xBVrNFCxkZLgr684g+2JrpYdtgKnfy3fWJk3dof9NZl8QWURbxans
 0OwA=
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
index 48e520960d665..3a966348a578a 100644
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
