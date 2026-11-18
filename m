Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6928606A330
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 00:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vydanKCG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lP3GMpvF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xLtvJXI66nimUmUT2DScUvKVhzkJg3mA3iqtB/BSjd4=; b=vydanKCGOAhq/pZXUnjEmCQpu1
	qPneLFSJmNRxedeITcdY79b3FrLPefBqZZpBnpVHuFqG41IBw116eWHOBrvX6snJVOlzqmJ0pm5Vp
	+JaReKTKtDn0dcuHHUnpsu+htI1V+m67raOsl9VjPJd6OrZjRiQLn54Hkz78+vXMrfWBFFtEre2tL
	IhWylAoPAJHlIcV2X4E3nZig44yqyVZ2LsDyDnG9Cx4vxemuwQCS3vw0ZHl/f+DShYvS7at0Hg71b
	WTbuqod1yFEvygBJfWFOm734Ys2dggU0iZ9KHbsjm9aSLB4qNfLufsOxR7iAwoWr6ca1BndEg5/yb
	kau7w4pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTYc-00000007MLZ-1Qc8;
	Wed, 18 Nov 2026 00:29:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTYb-00000007MK0-0jjZ
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 00:29:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DA2E61EE4;
	Wed, 18 Nov 2026 00:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7411F000C4;
	Wed, 18 Nov 2026 00:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794961788;
	bh=7p8hzQulzm2sdT6ljl53TR4xqlIGw1FUKTCUNJv0MWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lP3GMpvFvIEPM7v98/UaUS54HWXwJpqZEQTCiBzDHxv72y1Q5Hg/7gI59uQ8+G2rU
	 wbCh+AFvdJ6fdXjpEhgrDLxOu552gaoMCfkXw9ZO7mGtKfG0zH075ffsllhlYYaJnZ
	 siJEsDxgx0HtMFa1D6H2AXaCdAdLgobMe19vpXgC2CSAYPImdBNAYxfHyGy6vJ2Sq2
	 +1NmhPrUMwKjHWXduX8i/oAJ2URl3dfBOrj3gT/B9dX+QG56gF+tL7emg1tvHDMVl+
	 pZ/Ko3CglaLOm2d2CdAeQpNN/THkB/gi9FBCAMTaQOKe7eZzCgf9ePjUjX2NuHgHFf
	 4fQ0Brrss7xVA==
From: Thorsten Blum <blum@kernel.org>
To: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y. Ts'o" <tytso@mit.edu>
Cc: linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH 3/4] f2fs: Use FSTR() in f2fs_do_make_empty_dir()
Date: Wed, 18 Nov 2026 01:28:49 +0100
Message-ID: <20261118002845.574426-9-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002845.574426-6-blum@kernel.org>
References: <20261118002845.574426-6-blum@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=blum@kernel.org; h=from:subject; bh=grfMiZcoagjGMDC9TYISjWneu7iyoRjVgpowfER1HnI=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFl/PtrvevJS83nhl+U99vkmJ9OD2jemKS6ey25/41md5 iWNvB9fOkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAie/gZ/lcYZ7kVtX8pmD7l AjfbDl2fx3ciG1d9KN655ZnnfR3eTFtGhgMpL/f6HXcpsFg+ybi2vOhk5Iqz5hyf9+5Q2SdUuZf XiAEA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
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

Replace FSTR_INIT() with FSTR() and drop the hard-coded length argument.

Use FSTR() directly and remove the temporary variables.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 fs/f2fs/dir.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 97f7fef6b068..469c4cc7a3b7 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -515,14 +515,11 @@ static void init_dent_inode(struct inode *dir, struct inode *inode,
 void f2fs_do_make_empty_dir(struct inode *inode, struct inode *parent,
 					struct f2fs_dentry_ptr *d)
 {
-	struct fscrypt_str dot = FSTR_INIT(".", 1);
-	struct fscrypt_str dotdot = FSTR_INIT("..", 2);
-
 	/* update dirent of "." */
-	f2fs_update_dentry(inode->i_ino, inode->i_mode, d, &dot, 0, 0);
+	f2fs_update_dentry(inode->i_ino, inode->i_mode, d, &FSTR("."), 0, 0);
 
 	/* update dirent of ".." */
-	f2fs_update_dentry(parent->i_ino, parent->i_mode, d, &dotdot, 0, 1);
+	f2fs_update_dentry(parent->i_ino, parent->i_mode, d, &FSTR(".."), 0, 1);
 }
 
 static int make_empty_dir(struct inode *inode,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
