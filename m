Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3473606A330
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 00:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I2SKWWKj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UuEw1cbt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gfyyya4mUHenKNfNj48o/dVDAO+c2kYzC3pLj8rDSiw=; b=I2SKWWKjD1BtmAjgeXsEdVBZsz
	CmbW43OXepMO8dq572/MFi4qcG4gT/7qT03cpI9PlG76EpwiEQf56MUdTiesUrePjElPEWIcULXVI
	GDbnxWE5Jxj4z1MoNmy43a4XW40In1TbWu1RfQHE1lMQlShqyyoOjRRNSsaJvmWbZmX1NuUVvhjbh
	GdsueDUeLHt2hwYnW1roMylbXQsQH1VLwr+XqkFVlS/1m4TePKaNT7j5GGcz3ylSqQi4nf3ocCMGt
	B6B0zjh/pYck+G4J1NxGH3zgVgRNEDOgJETmiC6uEaFgOfl2GiplKzFxzUL5NmMtgQWefZJf3kuMX
	xrRe5VQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTYg-00000007MNt-2O9S;
	Wed, 18 Nov 2026 00:29:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTYf-00000007MNC-11Qv
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 00:29:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE542618FD;
	Wed, 18 Nov 2026 00:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270F41F000CC;
	Wed, 18 Nov 2026 00:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794961792;
	bh=XgXrwef3GSdcgoeGpprzCP9+LfeU52zOGFONlLtqopU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UuEw1cbtOFp4TZZlU/lzFOH+uJKcG6CGL/dfukobmupQG0yY0iLuhvoQ1vXICETNR
	 huuTvtM41iyL42N95j/ndGletCBCyM+71NEYMobYA6J7/OPxVSzLyOhqTtQ/2NDFAf
	 T6difwT78ibb3hHwyqX0+VGrFM24wltdIQBBDx+5r/ze70jFJkLM/o19zhIWH52B/t
	 rfWG5izVuLLEA6eQEYVpZxu0VjX4XCeWGuQ7Zre1OkeSPsN8L9k/Vt9Hj3nl0SNTrO
	 F5uMdm0Lib2MG25zvXue8MJTopqXYdFwzI2n16+laauBVKG1syMvA7SxevwJLcfzIi
	 4YHbDl/scnfUA==
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
Subject: [PATCH 4/4] ubifs: Use FSTR() in ubifs_xattr_{set,get,remove}()
Date: Wed, 18 Nov 2026 01:28:50 +0100
Message-ID: <20261118002845.574426-10-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002845.574426-6-blum@kernel.org>
References: <20261118002845.574426-6-blum@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526; i=blum@kernel.org; h=from:subject; bh=WDBVonVI9poJWjMd/98XRPyVKKRQHMEiFwUXmeGohbE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFl/PtpzGvoq1YpZXE1nFdg5d6r69nbd31K6j/fFReVcE D379qVqRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExkbg/DP9ub5Yd2J+94fCW0 24VFvituzp1C0eIpyftfha255JrFr8nI8Le94ZLGTtPky04bWC0Ui/6bTvNMPFQwUVuHdd+ZGd9 O8wMA
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

Replace FSTR_INIT() with FSTR() and drop the explicit length argument.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 fs/ubifs/xattr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 3b0e8a270f59..036eb7e2be0b 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -252,7 +252,7 @@ int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
 {
 	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
-	struct fscrypt_name nm = { .disk_name = FSTR_INIT((char *)name, strlen(name))};
+	struct fscrypt_name nm = { .disk_name = FSTR((char *)name) };
 	struct ubifs_dent_node *xent;
 	union ubifs_key key;
 	int err;
@@ -315,7 +315,7 @@ ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 {
 	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
-	struct fscrypt_name nm = { .disk_name = FSTR_INIT((char *)name, strlen(name))};
+	struct fscrypt_name nm = { .disk_name = FSTR((char *)name) };
 	struct ubifs_inode *ui;
 	struct ubifs_dent_node *xent;
 	union ubifs_key key;
@@ -557,7 +557,7 @@ static int ubifs_xattr_remove(struct inode *host, const char *name)
 {
 	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
-	struct fscrypt_name nm = { .disk_name = FSTR_INIT((char *)name, strlen(name))};
+	struct fscrypt_name nm = { .disk_name = FSTR((char *)name) };
 	struct ubifs_dent_node *xent;
 	union ubifs_key key;
 	int err;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
