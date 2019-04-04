Return-Path: <SRS0=4b6q=SG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F25EC4360F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 22:35:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7E9E206DF
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 22:35:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cfdz2EDA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7E9E206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJ2owMxNDCHT4U4LlHyeTf0yE0r9I79F4JxkcVmsUYQ=; b=cfdz2EDAehJKjq
	2cIm32hKfQS9g/JQ3P7KTxyHjtRZ6R+fgPF0nsBbnQKKOU8EaQ5CO6x9Fyr9ZMH8r0FVNBisAF9/S
	WGO4oq6CRl8k0b6NGspNeyZV7fYpiZG9DOfIknY9DSTKHE8YKWmPSmf2ZCPi3y/U94D15DRxWBMKm
	YShRwLSmItD4AOIQDDX4/pUqqXAN1+CVhFLfH3CtZf9IKPnsUC8k1dNIy845VfR5RUY8KkVFd0sid
	yEqfHEutbqBQB0m0cKbZmibEQ1h6M+m0riF4+gFy9+Zo4jGbHCO0KUWz3NN3e2Kl2V6TEu3m1YdMl
	HVtAAeeVWDIjM52uczgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCAwy-0000g7-N9; Thu, 04 Apr 2019 22:35:12 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCAwo-0007mg-9P
 for linux-mtd@lists.infradead.org; Thu, 04 Apr 2019 22:35:04 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 22DB21801442E;
 Fri,  5 Apr 2019 00:35:00 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] ubifs: journal: Handle xattrs like files
Date: Fri,  5 Apr 2019 00:34:36 +0200
Message-Id: <20190404223438.29408-2-richard@nod.at>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190404223438.29408-1-richard@nod.at>
References: <20190404223438.29408-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_153502_691527_BB6B6745 
X-CRM114-Status: GOOD (  13.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, stefan@agner.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If an inode hosts xattrs, create deletion entries for each
inode. That way we can make sure that upon journal replay UBIFS
can find find all xattr inodes.
Otherwise it can happen that GC consumed already a LEB which contained
parts of the TNC that pointed to the xattrs and we no longer
find all xattr inodes, which will confuse the LPT and cause
space allocation issues.

Reported-by: Stefan Agner <stefan@agner.ch>
Fixes: 1e51764a3c2ac ("UBIFS: add new flash file system")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 60 ++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 11 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 729dc76c83df..4f74d443ca44 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -852,10 +852,11 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 {
 	int err, lnum, offs;
-	struct ubifs_ino_node *ino;
+	struct ubifs_ino_node *ino, *ino_start;
 	struct ubifs_inode *ui = ubifs_inode(inode);
-	int sync = 0, write_len, ilen = UBIFS_INO_NODE_SZ;
+	int sync = 0, write_len = 0, ilen = UBIFS_INO_NODE_SZ;
 	int last_reference = !inode->i_nlink;
+	int kill_xattrs = ui->xattr_cnt && last_reference;
 	u8 hash[UBIFS_HASH_ARR_SZ];
 
 	dbg_jnl("ino %lu, nlink %u", inode->i_ino, inode->i_nlink);
@@ -867,14 +868,16 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 	if (!last_reference) {
 		ilen += ui->data_len;
 		sync = IS_SYNC(inode);
+	} else if (kill_xattrs) {
+		write_len += UBIFS_INO_NODE_SZ * ui->xattr_cnt;
 	}
 
 	if (ubifs_authenticated(c))
-		write_len = ALIGN(ilen, 8) + ubifs_auth_node_sz(c);
+		write_len += ALIGN(ilen, 8) + ubifs_auth_node_sz(c);
 	else
-		write_len = ilen;
+		write_len += ilen;
 
-	ino = kmalloc(write_len, GFP_NOFS);
+	ino_start = ino = kmalloc(write_len, GFP_NOFS);
 	if (!ino)
 		return -ENOMEM;
 
@@ -883,12 +886,47 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 	if (err)
 		goto out_free;
 
+	if (kill_xattrs) {
+		union ubifs_key key;
+		struct fscrypt_name nm = {0};
+		struct inode *xino;
+		struct ubifs_dent_node *xent, *pxent = NULL;
+
+		lowest_xent_key(c, &key, inode->i_ino);
+		while (1) {
+			xent = ubifs_tnc_next_ent(c, &key, &nm);
+			if (IS_ERR(xent)) {
+				err = PTR_ERR(xent);
+				if (err == -ENOENT)
+					break;
+
+				goto out_release;
+			}
+
+			fname_name(&nm) = xent->name;
+			fname_len(&nm) = le16_to_cpu(xent->nlen);
+
+			xino = ubifs_iget(c->vfs_sb, xent->inum);
+			ubifs_assert(c, ubifs_inode(xino)->xattr);
+
+			clear_nlink(xino);
+			pack_inode(c, ino, xino, 0);
+			ino = (void *)ino + UBIFS_INO_NODE_SZ;
+			iput(xino);
+
+			kfree(pxent);
+			pxent = xent;
+			key_read(c, &xent->key, &key);
+		}
+		kfree(pxent);
+	}
+
 	pack_inode(c, ino, inode, 1);
 	err = ubifs_node_calc_hash(c, ino, hash);
 	if (err)
 		goto out_release;
 
-	err = write_head(c, BASEHD, ino, write_len, &lnum, &offs, sync);
+	err = write_head(c, BASEHD, ino_start, write_len, &lnum, &offs, sync);
 	if (err)
 		goto out_release;
 	if (!sync)
@@ -903,7 +941,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 		if (err)
 			goto out_ro;
 		ubifs_delete_orphan(c, inode->i_ino);
-		err = ubifs_add_dirt(c, lnum, ilen);
+		err = ubifs_add_dirt(c, lnum, write_len);
 	} else {
 		union ubifs_key key;
 
@@ -917,7 +955,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 	spin_lock(&ui->ui_lock);
 	ui->synced_i_size = ui->ui_size;
 	spin_unlock(&ui->ui_lock);
-	kfree(ino);
+	kfree(ino_start);
 	return 0;
 
 out_release:
@@ -926,7 +964,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 	ubifs_ro_mode(c, err);
 	finish_reservation(c);
 out_free:
-	kfree(ino);
+	kfree(ino_start);
 	return err;
 }
 
@@ -966,8 +1004,8 @@ int ubifs_jnl_delete_inode(struct ubifs_info *c, const struct inode *inode)
 
 	ubifs_assert(c, inode->i_nlink == 0);
 
-	if (ui->del_cmtno != c->cmt_no)
-		/* A commit happened for sure */
+	if (ui->xattr_cnt || ui->del_cmtno != c->cmt_no)
+		/* A commit happened for sure or inode hosts xattrs */
 		return ubifs_jnl_write_inode(c, inode);
 
 	down_read(&c->commit_sem);
-- 
2.16.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
