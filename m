Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2733B606A323
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qzfi01bh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ndmzvTxe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gL9lzGlusxXulZ1/PkZmYiluMrkyL3buU1BZq//JQkU=; b=qzfi01bhVCLeWlwnBkjKG3rMfJ
	4x/Em9BvOavMqDThu/KZPR8ZVJiaAsiSZvyQxHa9MU1EP0lH8R3JxsAnJYpY00H196VB6nYuqkiTN
	R9vOlVK1OLVZanqDlHMWW0siIngNW83DVxaJZ4VmQxzTH0+NWR35E7HZksqcS4JEFSWoWq7B7jf7q
	U3G1oMxwbXkTWm+rV1QMezAUZmfNp/I4LpkuK4AveS0YWDtHQGKkoZQjhzSMJfTwMYTWYbLrVGrKy
	rylBB9Gqdd+Kxh9HdR1Hba8XIJqxmZUzJ+p7EIjqIH5i1AiEKiMMhp6b8fPsmmJQJLODmoxd07Z9j
	FFgpLiKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStMm-00000001q0T-3eli;
	Mon, 16 Nov 2026 09:51:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStMk-00000001pz4-3VqV
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 09:51:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 973B344F03;
	Mon, 16 Nov 2026 09:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3FB1F000CE;
	Mon, 16 Nov 2026 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794822670;
	bh=L1lZ5wfKib47+5cbYuK6ksYT98WTq4lYB0XvmtFMUsk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ndmzvTxeL7W9/Jdvz6YxY8P8py51Wjc6qNExCmjwvS+9JImEf9epaC85hzjy9eYR9
	 uVUDbSmgWHfI5S2ZpnyUY95j+V+6dUc4x/eYgmcYHu6230ISr7IQbxB7A14/qh1SKI
	 z/tb+w3N095FxQ0FXm2/FU4pUUqM9RlWmH+HUlWsxVqgM3WeZNtSwQQrNUl/6m6qRh
	 pcxjjekvdoG0jkzcO1CZNWORgA41hbfuqMidkny80LdqROFR2yYY9l3tEwpYUDW1B3
	 90dJoUAo/iHmuVyrQsl3XF0DD0Bz1kpLrlqVa624COZ5W1omJ7iv9DbKGwbhBw+vM0
	 xBZY/TU+9NFfg==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 16 Nov 2026 10:28:31 +0100
Subject: [PATCH 2/3] exfat: keep the volume marked dirty after a shutdown
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261116-work-fs-sb_rdonly-fixes-v1-2-95a25ce917ad@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=brauner@kernel.org;
 h=from:subject:message-id; bh=IuQsw0bjMfs69fKlB5zik2hJtUUfvF+Vp2c63qEi16c=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9uvhPuTT10dTm9V9DF81rmlGTNHO/a0zqhAtKP+fGb
 i+6d0DjQUcpC4MYF4OsmCKLQ7tJuNxynorNRpkaMHNYmUCGMHBxCsBEUm4zMvwL2pdfVbTdiSvs
 MMdFJu780kSe1jUN1zMVOM8IHBO6uoHhf+KNiUcqlSdfkfxX1DlX5Cf711LOF4I9HiELIqeWdgu
 WsgEA
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

After a shutdown exfat_write_inode() and exfat_writepages() drop
whatever is still dirty. But exfat_put_super() and a remount to
read-only still clear VOLUME_DIRTY through exfat_set_vol_flags() which
only leaves the boot sector alone on a read-only superblock. So after a
shutdown with EXFAT_GOING_DOWN_NOSYNC the volume ends up marked clean
although it may be inconsistent. Leave the boot sector alone after a
shutdown too.

Fixes: f761fcdd289d ("exfat: Implement sops->shutdown and ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/exfat/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 4943cef977418..eef7c159d32f4 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -98,8 +98,9 @@ static int exfat_set_vol_flags(struct super_block *sb, unsigned short new_flags)
 
 	/* skip updating volume dirty flag,
 	 * if this volume has been mounted with read-only
+	 * or was shut down (it stays dirty then)
 	 */
-	if (sb_rdonly(sb))
+	if (sb_rdonly(sb) || exfat_forced_shutdown(sb))
 		return 0;
 
 	p_boot->vol_flags = cpu_to_le16(new_flags);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
