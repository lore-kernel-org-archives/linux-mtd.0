Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF8D606A32E
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RwI5n+kJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LBGAP223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+bTYFx7GzXKzfU9u4TtBmNSNFGZhBdAxkKtxeogAHY4=; b=RwI5n+kJK5+4j1bp8ATSxQWh6a
	EWp2Nm+xVVFndUceQrKvCB8Dre8DcAnKMdRVEvg9bHLiYQXYQiHuNd60VJRl2vnbSOPfU59yB82Fd
	byzUBFSrBs0Js6V2hlBvuGsI2jSpLwqkKNIdmKv1l6uq7CoChAdAivZtxerWKeRWAIzAq/wbTdzcR
	tm0hnOodHfqWcQfr72lmQj7uvbORwk1eECoIiFt3CKVqS+UtkuCN0q0NhaAfV8rt6I6MeYf9ckNPV
	nxe4l26D3geUV4CFJ/m5a9vgWwZYhUgzAbsCGnJw0XIDElV/j4p79FPdL2fjLfefMquBufEWPu7Qf
	7DQLumSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSh5-00000009lP4-3tnZ;
	Thu, 29 Oct 2026 16:09:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSh4-00000009lNV-2Jfb
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:09:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD3E460627;
	Thu, 29 Oct 2026 16:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFD41F01825;
	Thu, 29 Oct 2026 16:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290173;
	bh=5Pp7M5kHXjNf3+1q9VkVlIi5dRXg3Q7oc/xEP3VOCsw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LBGAP2234hdWhTWmkiwtcNBNLZv3kdKW7A12H240APspISuOw8K0/DrAk7cojALfy
	 eCHxkuc1RjFeg9gL9Niid947L2sIZw0O1vp4xM3WSlJ/cIZ+6GJwJzAmYhb1pUSigM
	 elffXST2g2mTJoisTvyydqNgN1fAMiS9HWcTtk4UGR/v1R9ojlbwgaxL0cJDVDkGH9
	 fLOAD9/SI1nCadBee7QduMMaKKYC16TUXwXDzVE2+RpABZBbICCzAn71NbYDalAJBA
	 xiIoaKYRb9NGzWeBGBwaNy4g1sVrHEexNQhZrmOdcjHIG9gTW2Z0Jjt2hJygAQl/kT
	 0cCHArmLVPfmA==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 29 Oct 2026 17:07:22 +0100
Subject: [PATCH v2 31/34] ext4: use the generic emergency read-only state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-work-fs-sb_rdonly-v2-31-2f44f64f0b66@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=brauner@kernel.org;
 h=from:subject:message-id; bh=QT9bEmgMx7HOZfltPAgtswWtwVjCWwJIOMw37FP7ctQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9zjeY/8T6pH+S+Yw5W3oCW1aZtRdPydBI8eCT75jgs
 r9D4FRARykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwET8kxkZDm07O8G75MpxzcAF
 s/+9sTCSZFr/8Vf0/KXT3zcKLp8yg53hf0Dn32fFXMe3rvnJUbozJu2VU4WVc/3d0K9vLs7e8dD
 mBxcA
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

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/ext4/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index ae5ba6823c01..afbdbb607b14 100644
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
