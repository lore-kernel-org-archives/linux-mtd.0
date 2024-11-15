Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D78FD68BC6
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 16:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lihbtwN0pyCsLOzE0y3aS9aX0rWiXH2kbmxnkoMYzoU=; b=jWKqgocA9Mo89j
	UxjM5uSawfskbqVzdDdG2ITphl30u2sU1vIz9iIW1QuY0PTo29HsPw3Fk5ysZKE3xKa2gKwr/FX1z
	LeUPX1J3SKLFe8Mh3/bx9AtDd52leGj7UPHKY+pJzsXHjZSqoMzjjplIIixY2xNam4J8WOtyuoTTv
	va3Q6hoKrcarU5b5gjEK8a/avo5WNGD3Xas9zuj09i7PDZVcRFgKTdRdbvGEO6700Dw2sEfHEocXX
	coZIUtTYY3hg6N2iBmj2RU1tEDLQLR+Hz3D24NbRe46xMAzO910oIKjTvE/TrKOJNvFkbuPXm++Ks
	G7PZ/+LRbHuvvJgLQW5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tByvO-00000003Ip3-1iSo;
	Fri, 15 Nov 2024 16:11:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tByvM-00000003IoL-0kNK
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 16:11:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6AD80A42AA4;
	Fri, 15 Nov 2024 16:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF34C4CECF;
	Fri, 15 Nov 2024 16:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731687115;
	bh=osgNz0gKptCvUBgqJAqxMcZYAThmuDPQIhZOKDwmIjw=;
	h=From:Date:Subject:To:Cc:From;
	b=GsHecrcC+rdfZhGzjeqqfOdp4K4d8SN5emtWij+2DXzbCHJEtWPinpGCJHARna/6e
	 Rna2zDLKzrthWl5m8MletxgK0t7gFsYcmmN7Zay3eKcshEp6Bd8jIl0vUCGi3Zw5pW
	 aEUtqWho17ibIDXeNBZQrOZtLWUxDbGFwULHB1Bqr/k5JwevoMBVZlc1gj0evfBWNE
	 cP9gqgys07s2SD+KU4EfOnMFWPTMp8hflpy73q2fcoz9g8OSbFXysaD82AkCs3adPC
	 RUZy4UBW2MTvoMlArbumRadfqzrnNmMNS22X6giJvKgcPOwxEfQgTNxcKqfjdCfg89
	 3N7giTWmeysCw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 15 Nov 2024 09:10:04 -0700
Subject: [PATCH] ubifs: Fix uninitialized use of err in
 ubifs_jnl_write_inode()
MIME-Version: 1.0
Message-Id: <20241115-ubifs-fix-uninitialized-err-v1-1-446849982e27@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFtyN2cC/x3MQQqDMBBG4avIrDvgiKbYq5Quoo72B4ll0ogo3
 t3g8oPHOyiqQSO9ioNMV0QsIUMeBfVfHyZlDNlUlVUtIg2nDmPkERungIA//IxdB1Yzbl3nnRd
 9Nq6nfPiZ5vC+vz/neQGQDUj5bQAAAA==
X-Change-ID: 20241115-ubifs-fix-uninitialized-err-96ba6a1e756c
To: Richard Weinberger <richard@nod.at>, 
 Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332; i=nathan@kernel.org;
 h=from:subject:message-id; bh=osgNz0gKptCvUBgqJAqxMcZYAThmuDPQIhZOKDwmIjw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOnmRacqN7FZfNOueJf48tTUp3d25QYG/+a+uqxwa9VMz
 cVa+S8NOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBENsQxMrzJWPk2+nzi4ojD
 c29nVD33MmdWaPgZyi/CeUtIq7RfRIqRYdqkqoxb3LHzLy1xslgozpyaJjXh1dsqdaO9Wnd0Yle
 18AIA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_081156_284027_16564B8E 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

Clang warns (or errors with CONFIG_WERROR=y):

  fs/ubifs/journal.c:986:20: error: variable 'err' is uninitialized when used here [-Werror,-Wuninitialized]
    986 |                 ubifs_ro_mode(c, err);
        |                                  ^~~

Set err to -EPERM before the call to ubifs_ro_mode() and reuse it in the
return statement to resolve the warning.

Fixes: 957e1c4e1779 ("ubifs: ubifs_jnl_write_inode: Only check once for the limitation of xattr count")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 fs/ubifs/journal.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 8e98be64237154105cd6f7cb62cf0338ac26d3e9..36ba79fbd2ff80ff3d5c1f0bf965e439d8c55ab2 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -983,8 +983,9 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 
 	if (kill_xattrs && ui->xattr_cnt > ubifs_xattr_max_cnt(c)) {
 		ubifs_err(c, "Cannot delete inode, it has too much xattrs!");
+		err = -EPERM;
 		ubifs_ro_mode(c, err);
-		return -EPERM;
+		return err;
 	}
 
 	/*

---
base-commit: fe051552f5078fa02d593847529a3884305a6ffe
change-id: 20241115-ubifs-fix-uninitialized-err-96ba6a1e756c

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
