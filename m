Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A2AFF510F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Apr 2026 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rprVLBD1qNr44hixqqtl88sWM3FOhuV1j6vMDbjKRo4=; b=Zs4pCGgN/3Vktb
	4nOqoNK8vHuoQiIwJ1HQOplW7LYLAwUSWMpXaAkfhz0sUDF09TZojEx3xuRS3y3DDfDOjkaPgLe6E
	goxpAVHytPnUPABuEi4BcBjMq+7Z8zvIhUJmvn9WCPB6rCp4cz0lItM4Gwv6iV/61OZx0BKBGcfdC
	invjmjoID7NwRC87187vWGnC5oZznmfVE40eb3hUJPFk7JXvywfqolGdVYadTLk74VsC7eXeTWuez
	XUDv2FyXxPy1jyoyoXAmKQsSpayGN9WlRsUskI6HOv97EdHRJjkTwQxhCb+//QXvIEmyAEyAT3ZTB
	qPKJmovV59B/lTPTLGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8xY-00000006lDI-1YQh;
	Tue, 07 Apr 2026 16:07:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8xW-00000006lCo-3JXv
	for linux-mtd@bombadil.infradead.org;
	Tue, 07 Apr 2026 16:07:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aV/fuwwgF64NXAXTm3RaScaVX7Yweguho5BGffMkIIA=; b=mSuDvg41ZzD2+tfi1K+YAHp03W
	N9BUagsRccOWRMj6wtOYz6CbepZcyHRnqMmrZq2hM4FolHZSnFyGwDg9MH2Bjukh8ZKdVI0E6G3c8
	pBCRWamsHb5F+IO9T4qTOeK6t4xs4XOahIUdDq+YvhZE1vY43yGeX22WVvuREf5lmEd0JVi2g8sFR
	TVovE0hkoc+uRAaqATVkC1kQ/sCp7kLJVSQGnrNMJPlShPUX3HMB4h4FMT2Xo510oqI7WnBjhK5c/
	+5kPgXSy7rpcCzUkV1mqix7zNNiqGXpMY6S3n9YzcX0Caydgnz4X+NnFnFxoT3O2xSMnmUYE2UXgq
	+svGRLYA==;
Received: from forward103d.mail.yandex.net ([178.154.239.214])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8xT-00000008f12-3aIB
	for linux-mtd@lists.infradead.org;
	Tue, 07 Apr 2026 16:07:21 +0000
Received: from mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:d880:0:640:3563:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id E0752C0066;
	Tue, 07 Apr 2026 19:07:09 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 77HGUb5RY8c0-J77aZW5F;
	Tue, 07 Apr 2026 19:07:09 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1775578029; bh=aV/fuwwgF64NXAXTm3RaScaVX7Yweguho5BGffMkIIA=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=opWIMCtdmZRb83tK2h0SIX5vieQYE83CPNXJXvk/IVGF/XjPrqN5gDyp+bmvDctfY
	 Xi6lMBDOm7KF0i9aSja7HwCJYCQhrLSpeM/SWF4nFDLCgsrNNdi+qJwTsLJLd1+6eh
	 BqFOgv6mN7GC9xzopG8BPGPiSQu+DokTsE8MACio=
Authentication-Results: mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v3 2/2] ubifs: use strscpy() and kmemdup_nul() where appropriate
Date: Tue,  7 Apr 2026 19:05:18 +0300
Message-ID: <20260407160518.2825450-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407160518.2825450-1-dmantipov@yandex.ru>
References: <f20e6570-8b71-a6da-8e7f-4d25357c3978@huawei.com>
 <20260407160518.2825450-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_170720_057420_8B010DCD 
X-CRM114-Status: GOOD (  11.06  )
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

Go closer to the modern kernel API and use 'strscpy()' and 'kmemdup_nul()'
over an ad-hoc ensure-to-have-'\0' quirks where appropriate.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v3: fix strscpy() usage as noticed by Zhihao
v2: initial version to join the series
---
 fs/ubifs/journal.c | 18 ++++++------------
 fs/ubifs/replay.c  |  3 +--
 fs/ubifs/super.c   |  8 ++------
 3 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index e28ab4395e5c..b8c4ab8990c2 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -729,8 +729,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	dent->inum = deletion ? 0 : cpu_to_le64(inode->i_ino);
 	dent->type = get_dent_type(inode->i_mode);
 	dent->nlen = cpu_to_le16(fname_len(nm));
-	memcpy(dent->name, fname_name(nm), fname_len(nm));
-	dent->name[fname_len(nm)] = '\0';
+	strscpy(dent->name, fname_name(nm), dent->nlen + 1);
 	set_dent_cookie(c, dent);
 
 	zero_dent_node_unused(dent);
@@ -1232,8 +1231,7 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
 	dent1->inum = cpu_to_le64(fst_inode->i_ino);
 	dent1->type = get_dent_type(fst_inode->i_mode);
 	dent1->nlen = cpu_to_le16(fname_len(snd_nm));
-	memcpy(dent1->name, fname_name(snd_nm), fname_len(snd_nm));
-	dent1->name[fname_len(snd_nm)] = '\0';
+	strscpy(dent1->name, fname_name(snd_nm), dent1->nlen + 1);
 	set_dent_cookie(c, dent1);
 	zero_dent_node_unused(dent1);
 	ubifs_prep_grp_node(c, dent1, dlen1, 0);
@@ -1248,8 +1246,7 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
 	dent2->inum = cpu_to_le64(snd_inode->i_ino);
 	dent2->type = get_dent_type(snd_inode->i_mode);
 	dent2->nlen = cpu_to_le16(fname_len(fst_nm));
-	memcpy(dent2->name, fname_name(fst_nm), fname_len(fst_nm));
-	dent2->name[fname_len(fst_nm)] = '\0';
+	strscpy(dent2->name, fname_name(fst_nm), dent2->nlen + 1);
 	set_dent_cookie(c, dent2);
 	zero_dent_node_unused(dent2);
 	ubifs_prep_grp_node(c, dent2, dlen2, 0);
@@ -1424,8 +1421,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	dent->inum = cpu_to_le64(old_inode->i_ino);
 	dent->type = get_dent_type(old_inode->i_mode);
 	dent->nlen = cpu_to_le16(fname_len(new_nm));
-	memcpy(dent->name, fname_name(new_nm), fname_len(new_nm));
-	dent->name[fname_len(new_nm)] = '\0';
+	strscpy(dent->name, fname_name(new_nm), dent->nlen + 1);
 	set_dent_cookie(c, dent);
 	zero_dent_node_unused(dent);
 	ubifs_prep_grp_node(c, dent, dlen1, 0);
@@ -1446,8 +1442,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 		dent2->type = DT_UNKNOWN;
 	}
 	dent2->nlen = cpu_to_le16(fname_len(old_nm));
-	memcpy(dent2->name, fname_name(old_nm), fname_len(old_nm));
-	dent2->name[fname_len(old_nm)] = '\0';
+	strscpy(dent2->name, fname_name(old_nm), dent2->nlen + 1);
 	set_dent_cookie(c, dent2);
 	zero_dent_node_unused(dent2);
 	ubifs_prep_grp_node(c, dent2, dlen2, 0);
@@ -1897,8 +1892,7 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
 	xent->inum = 0;
 	xent->type = get_dent_type(inode->i_mode);
 	xent->nlen = cpu_to_le16(fname_len(nm));
-	memcpy(xent->name, fname_name(nm), fname_len(nm));
-	xent->name[fname_len(nm)] = '\0';
+	strscpy(xent->name, fname_name(nm), xent->nlen + 1);
 	zero_dent_node_unused(xent);
 	ubifs_prep_grp_node(c, xent, xlen, 0);
 
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index a9a568f4a868..ef6ae63792d1 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -463,8 +463,7 @@ static int insert_dent(struct ubifs_info *c, int lnum, int offs, int len,
 	r->sqnum = sqnum;
 	key_copy(c, key, &r->key);
 	fname_len(&r->nm) = nlen;
-	memcpy(nbuf, name, nlen);
-	nbuf[nlen] = '\0';
+	strscpy(nbuf, name, nlen + 1);
 	fname_name(&r->nm) = nbuf;
 
 	list_add_tail(&r->list, &c->replay_list);
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 03bf924756ca..da2f1067f054 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -168,13 +168,11 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 		inode->i_op = &ubifs_file_inode_operations;
 		inode->i_fop = &ubifs_file_operations;
 		if (ui->xattr) {
-			ui->data = kmalloc(ui->data_len + 1, GFP_NOFS);
+			ui->data = kmemdup_nul(ino->data, ui->data_len, GFP_NOFS);
 			if (!ui->data) {
 				err = -ENOMEM;
 				goto out_ino;
 			}
-			memcpy(ui->data, ino->data, ui->data_len);
-			((char *)ui->data)[ui->data_len] = '\0';
 		} else if (ui->data_len != 0) {
 			err = 10;
 			goto out_invalid;
@@ -194,13 +192,11 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 			err = 12;
 			goto out_invalid;
 		}
-		ui->data = kmalloc(ui->data_len + 1, GFP_NOFS);
+		ui->data = kmemdup_nul(ino->data, ui->data_len, GFP_NOFS);
 		if (!ui->data) {
 			err = -ENOMEM;
 			goto out_ino;
 		}
-		memcpy(ui->data, ino->data, ui->data_len);
-		((char *)ui->data)[ui->data_len] = '\0';
 		break;
 	case S_IFBLK:
 	case S_IFCHR:
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
