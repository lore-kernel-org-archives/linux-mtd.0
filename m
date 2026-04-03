Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF502E8537A
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2026 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7TCwkyjBLvZr8z+dthrHvLOf+P8KWSkZPeJCznnfNw=; b=kRDq2pp9/XTC6H
	c1vHtltU1s1wdNsg9++NMCZLuCP0XGs3E2Ut9EfInjim/CMoroUs/l8PjL/1RTuIuwFhfqOs8PfOG
	hMK77NfrN6IvcQbykE78+RMyHp2wD284awPuqc4N0jJCwrz0GtBJOCT4qQqi9jCgUFtdVzHwNCfwQ
	Vbd7P7WfdtW/r5BOY1xPNkEGnCmr6cFrg4edYCaG4ok9tMJQ6KjfehpQKtBmSdArXfXXhBJuuIvGi
	GjSqS5rb7f5Wjy4w52maRfYtNK1QNfnYdWpzecTr0EeS89UvbX4C1k+A95GysdkyTitk0S8dFtNn7
	9/Cy5CHBztgqu+wl7YDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hY4-00000002L49-3cPZ;
	Fri, 03 Apr 2026 16:39:08 +0000
Received: from forward102a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hXz-00000002L1f-3QCF
	for linux-mtd@lists.infradead.org;
	Fri, 03 Apr 2026 16:39:06 +0000
Received: from mail-nwsmtp-smtp-production-main-92.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:251b:0:640:cb7f:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id A1029C0063;
	Fri, 03 Apr 2026 19:38:53 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id pcg2buER9mI0-ePC8Qvkh;
	Fri, 03 Apr 2026 19:38:53 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1775234333; bh=XVWgAv6XvNduTtlZO3tPzBIGWEjQ9P6aF2g0hzg8ZN0=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=cT8rQkYHSThM2SEM/HiGpOJK/kyTXjY0UqM2e8UyP+pqQuympRUWIGFIrkC7OLcc2
	 9KFVb47KXE/57xayCZurkxzx7i2Wgd5By4h4sxUnaknVZ8qP5KcqjYUTw4eL8/lvjq
	 VF8kFI+mIT1hrxvalxzDegZ1tkNcnm7iRHG238s4=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v2 2/2] ubifs: use strscpy() and kmemdup_nul() where appropriate
Date: Fri,  3 Apr 2026 19:37:51 +0300
Message-ID: <20260403163751.1303250-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403163751.1303250-1-dmantipov@yandex.ru>
References: <67df08d1-6bbf-560c-de40-9cf1e88c406a@huawei.com>
 <20260403163751.1303250-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_093904_400446_C43A3F81 
X-CRM114-Status: GOOD (  11.18  )
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
v2: initial version to join the series
---
 fs/ubifs/journal.c | 18 ++++++------------
 fs/ubifs/replay.c  |  3 +--
 fs/ubifs/super.c   |  8 ++------
 3 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index e28ab4395e5c..fa13e988e8b2 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -729,8 +729,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	dent->inum = deletion ? 0 : cpu_to_le64(inode->i_ino);
 	dent->type = get_dent_type(inode->i_mode);
 	dent->nlen = cpu_to_le16(fname_len(nm));
-	memcpy(dent->name, fname_name(nm), fname_len(nm));
-	dent->name[fname_len(nm)] = '\0';
+	strscpy(dent->name, fname_name(nm), fname_len(nm));
 	set_dent_cookie(c, dent);
 
 	zero_dent_node_unused(dent);
@@ -1232,8 +1231,7 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
 	dent1->inum = cpu_to_le64(fst_inode->i_ino);
 	dent1->type = get_dent_type(fst_inode->i_mode);
 	dent1->nlen = cpu_to_le16(fname_len(snd_nm));
-	memcpy(dent1->name, fname_name(snd_nm), fname_len(snd_nm));
-	dent1->name[fname_len(snd_nm)] = '\0';
+	strscpy(dent1->name, fname_name(snd_nm), fname_len(snd_nm));
 	set_dent_cookie(c, dent1);
 	zero_dent_node_unused(dent1);
 	ubifs_prep_grp_node(c, dent1, dlen1, 0);
@@ -1248,8 +1246,7 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
 	dent2->inum = cpu_to_le64(snd_inode->i_ino);
 	dent2->type = get_dent_type(snd_inode->i_mode);
 	dent2->nlen = cpu_to_le16(fname_len(fst_nm));
-	memcpy(dent2->name, fname_name(fst_nm), fname_len(fst_nm));
-	dent2->name[fname_len(fst_nm)] = '\0';
+	strscpy(dent2->name, fname_name(fst_nm), fname_len(fst_nm));
 	set_dent_cookie(c, dent2);
 	zero_dent_node_unused(dent2);
 	ubifs_prep_grp_node(c, dent2, dlen2, 0);
@@ -1424,8 +1421,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	dent->inum = cpu_to_le64(old_inode->i_ino);
 	dent->type = get_dent_type(old_inode->i_mode);
 	dent->nlen = cpu_to_le16(fname_len(new_nm));
-	memcpy(dent->name, fname_name(new_nm), fname_len(new_nm));
-	dent->name[fname_len(new_nm)] = '\0';
+	strscpy(dent->name, fname_name(new_nm), fname_len(new_nm));
 	set_dent_cookie(c, dent);
 	zero_dent_node_unused(dent);
 	ubifs_prep_grp_node(c, dent, dlen1, 0);
@@ -1446,8 +1442,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 		dent2->type = DT_UNKNOWN;
 	}
 	dent2->nlen = cpu_to_le16(fname_len(old_nm));
-	memcpy(dent2->name, fname_name(old_nm), fname_len(old_nm));
-	dent2->name[fname_len(old_nm)] = '\0';
+	strscpy(dent2->name, fname_name(old_nm), fname_len(old_nm));
 	set_dent_cookie(c, dent2);
 	zero_dent_node_unused(dent2);
 	ubifs_prep_grp_node(c, dent2, dlen2, 0);
@@ -1897,8 +1892,7 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
 	xent->inum = 0;
 	xent->type = get_dent_type(inode->i_mode);
 	xent->nlen = cpu_to_le16(fname_len(nm));
-	memcpy(xent->name, fname_name(nm), fname_len(nm));
-	xent->name[fname_len(nm)] = '\0';
+	strscpy(xent->name, fname_name(nm), fname_len(nm));
 	zero_dent_node_unused(xent);
 	ubifs_prep_grp_node(c, xent, xlen, 0);
 
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index a9a568f4a868..cb1c3fafa5c5 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -463,8 +463,7 @@ static int insert_dent(struct ubifs_info *c, int lnum, int offs, int len,
 	r->sqnum = sqnum;
 	key_copy(c, key, &r->key);
 	fname_len(&r->nm) = nlen;
-	memcpy(nbuf, name, nlen);
-	nbuf[nlen] = '\0';
+	strscpy(nbuf, name, nlen);
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
