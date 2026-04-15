Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5860BFA0C3E
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2026 07:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrngAi5WsyDaLzJWIBqXRHK5It59GO9Uzd/Kxk2WOBE=; b=AhrLiliW5Xg1Fj
	BDvO9x+UYkaIUTOwr+2GN32kayp8o4ZRd1eZ5BtebZPW5HI7WAn/8awbCttq/bK5pSwOXrHiWseyY
	kDE8IcspE3E+kphogK4FUKTXYdlF/puO2XShtmJpQ0KpaDCIVcdacjXOTcdhpJvJU/59FO56CxhPe
	j245XkukhRWQK/A2cGBdAO8TdstebvSYGWGBihHtydxRLGq86OUQiJlXX44I1+GdcZ2juTkQYxCM1
	7ivzTfjUxbNHcJxpbkLjg7C40+nmtedObX1+lugRXXmOT8MXgSLAorypFrKbOIHihBUPy1BLkuEtA
	zfGxuZRvvXsfKaiaEdYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuWY-00000000hw8-2xsV;
	Wed, 15 Apr 2026 07:18:58 +0000
Received: from forward100a.mail.yandex.net ([178.154.239.83])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuWU-00000000huQ-1ukk
	for linux-mtd@lists.infradead.org;
	Wed, 15 Apr 2026 07:18:56 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:489d:0:640:baa6:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id 70DF2C03CB;
	Wed, 15 Apr 2026 10:18:49 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id kIGRDIAS44Y0-MAfZTJRm;
	Wed, 15 Apr 2026 10:18:48 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1776237528; bh=xJhGyuKJG1TrBNLiB9oLeQRJIGjE67W01CzbqBVp378=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=McCB1ay9ucM0StT0c2SEyKlCH8m8iJWcBy8bCJ5WEbZ8WGOUOpxKpig1lRhNpfxr4
	 s+6FURpeEJy5VETSIO8Sn41GuFtOEiyGMAJ02OzYqyjyfPQXrBJoawyok/LwvRuprC
	 /I83ttEb8rYKjpIL94WGgUSm5qqc88fKI25ttOoA=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Zhihao Cheng <chengzhihao1@huawei.com>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v5 3/3] ubifs: avoid redundant calls to memset()
Date: Wed, 15 Apr 2026 10:18:12 +0300
Message-ID: <20260415071812.1139054-3-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415071812.1139054-1-dmantipov@yandex.ru>
References: <20260415071812.1139054-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_001854_733289_A2A198E3 
X-CRM114-Status: GOOD (  14.36  )
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

Rely on partial implicit initialization of 'struct ubifs_budget_req'
objects and so simplify 'ubifs_release_dirty_inode_budget()', 'do_rename()'
and 'do_truncation()' by dropping explicit calls to 'memset()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v5: initial version to join the series
---
 fs/ubifs/budget.c |  9 ++++-----
 fs/ubifs/dir.c    |  4 +---
 fs/ubifs/file.c   | 10 +++++-----
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
index d76eb7b39f56..a73f1e969f7c 100644
--- a/fs/ubifs/budget.c
+++ b/fs/ubifs/budget.c
@@ -590,11 +590,10 @@ void ubifs_convert_page_budget(struct ubifs_info *c)
 void ubifs_release_dirty_inode_budget(struct ubifs_info *c,
 				      struct ubifs_inode *ui)
 {
-	struct ubifs_budget_req req;
-
-	memset(&req, 0, sizeof(struct ubifs_budget_req));
-	/* The "no space" flags will be cleared because dd_growth is > 0 */
-	req.dd_growth = c->bi.inode_budget + ALIGN(ui->data_len, 8);
+	struct ubifs_budget_req req = {
+		/* The "no space" flags will be cleared because dd_growth is > 0 */
+		.dd_growth = c->bi.inode_budget + ALIGN(ui->data_len, 8)
+	};
 	ubifs_release_budget(c, &req);
 }
 
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 86d41e077e4d..c1602e8aff01 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1335,7 +1335,7 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 					.dirtied_ino = 3 };
 	struct ubifs_budget_req ino_req = { .dirtied_ino = 1,
 			.dirtied_ino_d = ALIGN(old_inode_ui->data_len, 8) };
-	struct ubifs_budget_req wht_req;
+	struct ubifs_budget_req wht_req = { .new_ino = 1 };
 	unsigned int saved_nlink;
 	struct fscrypt_name old_nm, new_nm;
 
@@ -1422,8 +1422,6 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 		whiteout_ui->data_len = ubifs_encode_dev(dev, MKDEV(0, 0));
 		ubifs_assert(c, !whiteout_ui->dirty);
 
-		memset(&wht_req, 0, sizeof(struct ubifs_budget_req));
-		wht_req.new_ino = 1;
 		wht_req.new_ino_d = ALIGN(whiteout_ui->data_len, 8);
 		/*
 		 * To avoid deadlock between space budget (holds ui_mutex and
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index e73c28b12f97..35061a587e3c 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1101,13 +1101,16 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 			 const struct iattr *attr)
 {
 	int err;
-	struct ubifs_budget_req req;
+	struct ubifs_budget_req req = {
+		.dirtied_ino = 1,
+		/* A funny way to budget for truncation node */
+		.dirtied_ino_d = UBIFS_TRUN_NODE_SZ
+	};
 	loff_t old_size = inode->i_size, new_size = attr->ia_size;
 	int offset = new_size & (UBIFS_BLOCK_SIZE - 1), budgeted = 1;
 	struct ubifs_inode *ui = ubifs_inode(inode);
 
 	dbg_gen("ino %llu, size %lld -> %lld", inode->i_ino, old_size, new_size);
-	memset(&req, 0, sizeof(struct ubifs_budget_req));
 
 	/*
 	 * If this is truncation to a smaller size, and we do not truncate on a
@@ -1117,9 +1120,6 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 	if (new_size & (UBIFS_BLOCK_SIZE - 1))
 		req.dirtied_page = 1;
 
-	req.dirtied_ino = 1;
-	/* A funny way to budget for truncation node */
-	req.dirtied_ino_d = UBIFS_TRUN_NODE_SZ;
 	err = ubifs_budget_space(c, &req);
 	if (err) {
 		/*
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
