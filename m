Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF46606A333
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zW9KKolu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VaZ6rFBA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YPNx8eGK6tRvhqMM3DWY1nn/oPNy/asP5vc3dP10XU4=; b=zW9KKoluSaAqMEiSaGMHCN7TOb
	TFZ3eGrO9Pfdz0H/iFwN6gSc8SD0BQk2ps41RRVjS96EuHtjlI54IEySOZd9tCiHiNmOe2hAMKNw+
	sxsLC6clLfE6df0ikhvQyHbZ6sgR6QdeKKZDJ+wqHZMsTdIuItCE3rzdk3sNcxctW4c4QKlFeXWFw
	O8ymptpOCpfyFfB3p/1eopiBVaq2qig54OoGXwY/xVPl7UYXKc5yqVlV4IhPWVV9pDmqvBOy++366
	67bezb9B1HA5J2yAdy5Ypt3SXjtfUjla/k4o6PStSPKpLqTV3IuKPrz9UGTZx8wuosIKG24A9ly2g
	hC76zbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStMq-00000001q3V-40bl;
	Mon, 16 Nov 2026 09:51:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStMp-00000001q2m-3rj5
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 09:51:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AC3AC41197;
	Mon, 16 Nov 2026 09:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014C81F000C6;
	Mon, 16 Nov 2026 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794822675;
	bh=EzogT95rPEGnXO3ATl8QCqS0Fa+QqsMtxOYoDzHb5QM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VaZ6rFBAYjR/HM5+OlC/kYBh9eokBcyBlJyjLDEGD3pr/1owKWYUkIFonZyVuLy45
	 aXIGPPwoZFzAFIrDJPr3o4d1FYCF6gEzK4gRGZMRojP6nXuxOYWP66LFhY7XK4EIId
	 0F9FdRrfySm5SdHKaihGgGUwCpa5ozWOd3R+kAWEW0AOMp5LPHNYZv/BWBQ180WmCq
	 SGYcL6yKiAUlp1bl5aKgR19AOXfXXbOhxIdLs6gAifxrWtNtvWUXEAaCGYUZCiGaa7
	 +ReHVuM/M8xxPRelVNj4Hcpgf82OBXtXi/ghPvFAodx9BDyUzwtyIaiRzYrfov1A8G
	 2aAwCB6uJL+Jw==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 16 Nov 2026 10:28:32 +0100
Subject: [PATCH 3/3] jfs: refuse inodes with a negative size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261116-work-fs-sb_rdonly-fixes-v1-3-95a25ce917ad@kernel.org>
References: <20261116-work-fs-sb_rdonly-fixes-v1-0-95a25ce917ad@kernel.org>
In-Reply-To: <20261116-work-fs-sb_rdonly-fixes-v1-0-95a25ce917ad@kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: Jan Kara <jack@suse.com>, ecryptfs@vger.kernel.org, 
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, 
 ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-xfs@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=brauner@kernel.org;
 h=from:subject:message-id; bh=onsWAswaduk9DxHd2totA7LRgkoacrrwUPGlfjERZww=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9uvg/zPh7v4jJl9XJS1adTMmvc90Wskhx45urIQq/v
 +i4RRtkd5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzExJjhf0I6X6NS5kOr9nci
 S1rdsg7WHb7PbXFnnvjvWZ/2HONbz87I0MOYE+3LnyrOK2+kdcN71Zd5ak/MHTqmCyzTLfcoFP/
 EDgA=
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

copy_from_dinode() takes di_size as is and a crafted image can store a
size that is negative as a loff_t. For a symlink that passes the signed
i_size >= IDATASIZE test in jfs_iget(), so it's treated as a fast
symlink and i_link[i_size] = '\0' writes out of bounds. Refuse a
negative size when reading the inode like a corrupt dtroot.

Fixes: d69e83d99cf8 ("jfs: ensure symlinks are NUL-terminated")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/jfs/jfs_imap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index b84ba4d7dfb44..f88e228d12620 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -3079,6 +3079,10 @@ static int copy_from_dinode(struct dinode * dip, struct inode *ip)
 	}
 
 	ip->i_size = le64_to_cpu(dip->di_size);
+	if (ip->i_size < 0) {
+		jfs_error(ip->i_sb, "Negative inode size\n");
+		return -EIO;
+	}
 	inode_set_atime(ip, le32_to_cpu(dip->di_atime.tv_sec),
 			le32_to_cpu(dip->di_atime.tv_nsec));
 	inode_set_mtime(ip, le32_to_cpu(dip->di_mtime.tv_sec),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
