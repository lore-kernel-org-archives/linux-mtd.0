Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF109D12D7C
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rskVqwQGrucrcJ4ojx3oeMd0Dz1KIdyz66Q9tqnFWfQ=; b=LNbj5LdBZF7Y0l
	ScxdJ/TETfj1h4QGADmwYKWWijpWxbUn4VzjyxY9ldAqYT/cNiDWTq/lrAPk/Y41tTENA2NJqPcOr
	qR0d/rQ3kgE2qoUALy04009zOWt0T2nc44+DqfuG604F94PbiJiUvqSiIhsoywSDKV750NypVqvUX
	QJUbuU3HI9dyC4cr6QBE/KRo/s3L5IRT9aNtX9+5r1KPaMB/YN79VE7aINhgBbHzCgRPvGZMd/FBi
	+m3v5K3dxgqOfKQ7my4znpPzZHUEEW87OowX4rEtOqteO7gGrpT8cdpWDZEh9FTHMWVq6c6hJmLYT
	yxfMrlZPJnqifMmBrEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOW3-0000000GaeT-38EE;
	Mon, 11 Nov 2024 07:07:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOV2-0000000GZr8-3XiK
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Xy58A1FX//zAlQEZ7YduJKJHZAyNweWealWVHS29dgA=; b=Uv3pjVWJ52t930lf9uXPeW6fD/
	5lCRY/wNNvoAcrvCLIqr3GpAKfsi/KEyJwD/qEQPp08DaH8fbTPx6BddI9hTntRpXo1gOAf9Ak3SF
	8AoZl6RXJUIziQXOSWoWPfFw/y3n8UX0JW4KzKywGkSVWhe3HWO9+uX3paEMidsa0vqR4m4YAQrPg
	O3rJEpYU/+BKNQjx+TterWZmrT0VlmLQ97U+xeLrA97dSrvJxScLTZbFtDABHQIpLp1WOg9rKzRfU
	YwPVs7LfywYL6thqlZ9/YSoIxZ3k1P4Ib0lq0I1qQ8iBD8qTN2zbSyi1HqlaawbLPDTLFtBt99BGR
	y3yJjC4w==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUn-0000000CmML-3jiR
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:06:05 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xn0s048Y9z20t4s;
	Mon, 11 Nov 2024 15:04:04 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id BF0D414011F;
	Mon, 11 Nov 2024 15:05:16 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:16 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 031/102] ubifs-utils: Adapt recovery subsystem in libubifs
Date: Mon, 11 Nov 2024 15:02:34 +0800
Message-ID: <20241111070346.1314122-32-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070603_883540_C89463D9 
X-CRM114-Status: GOOD (  30.49  )
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

Adapt recovery subsystem(replay.c, recovery.c) in libubifs, compared with
linux kernel implementations:
 1. Remove authentication related implementations
    (eg. authenticate_sleb_hash), authentication is not supported in fsck
    for now.
 2. Add explicit type conversions(const char *) to avoid compiling
    warnings.
 3. Replace implementations of inode_fix_size() with ubifs_assert(0),
    authentication is not supported in fsck, so this function won't
    be invoked.
 4. Remove unused ubifs_clean_lebs() and ubifs_write_rcvrd_mst_node().
 5. Adapt fix_unclean_leb/recover_head/fix_size_in_place to ignore
    %-EBADMSG, subsequent steps will check nodes in lpt/main area
    carefully.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/libubifs/recovery.c | 236 ++++------------------------------------
 ubifs-utils/libubifs/replay.c   |  90 +++------------
 2 files changed, 35 insertions(+), 291 deletions(-)

diff --git a/ubifs-utils/libubifs/recovery.c b/ubifs-utils/libubifs/recovery.c
index f0d51dd2..910414cb 100644
--- a/ubifs-utils/libubifs/recovery.c
+++ b/ubifs-utils/libubifs/recovery.c
@@ -35,9 +35,17 @@
  * refuses to mount.
  */
 
-#include <linux/crc32.h>
-#include <linux/slab.h>
+#include <sys/types.h>
+
+#include "linux_err.h"
+#include "bitops.h"
+#include "kmem.h"
+#include "crc32.h"
 #include "ubifs.h"
+#include "defs.h"
+#include "debug.h"
+#include "key.h"
+#include "misc.h"
 
 /**
  * is_empty - determine whether a buffer is empty (contains all 0xff).
@@ -364,31 +372,6 @@ out_free:
 }
 
 /**
- * ubifs_write_rcvrd_mst_node - write the recovered master node.
- * @c: UBIFS file-system description object
- *
- * This function writes the master node that was recovered during mounting in
- * read-only mode and must now be written because we are remounting rw.
- *
- * This function returns %0 on success and a negative error code on failure.
- */
-int ubifs_write_rcvrd_mst_node(struct ubifs_info *c)
-{
-	int err;
-
-	if (!c->rcvrd_mst_node)
-		return 0;
-	c->rcvrd_mst_node->flags |= cpu_to_le32(UBIFS_MST_DIRTY);
-	c->mst_node->flags |= cpu_to_le32(UBIFS_MST_DIRTY);
-	err = write_rcvrd_mst_node(c, c->rcvrd_mst_node);
-	if (err)
-		return err;
-	kfree(c->rcvrd_mst_node);
-	c->rcvrd_mst_node = NULL;
-	return 0;
-}
-
-/**
  * is_last_write - determine if an offset was in the last write to a LEB.
  * @c: UBIFS file-system description object
  * @buf: buffer to check
@@ -530,7 +513,7 @@ static int fix_unclean_leb(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 			if (start) {
 				err = ubifs_leb_read(c, lnum, sleb->buf, 0,
 						     start, 1);
-				if (err)
+				if (err && err != -EBADMSG)
 					return err;
 			}
 			/* Pad to min_io_size */
@@ -926,7 +909,7 @@ static int recover_head(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 		if (offs == 0)
 			return ubifs_leb_unmap(c, lnum);
 		err = ubifs_leb_read(c, lnum, sbuf, 0, offs, 1);
-		if (err)
+		if (err && err != -EBADMSG)
 			return err;
 		return ubifs_leb_change(c, lnum, sbuf, offs);
 	}
@@ -968,129 +951,6 @@ int ubifs_recover_inl_heads(struct ubifs_info *c, void *sbuf)
 }
 
 /**
- * clean_an_unclean_leb - read and write a LEB to remove corruption.
- * @c: UBIFS file-system description object
- * @ucleb: unclean LEB information
- * @sbuf: LEB-sized buffer to use
- *
- * This function reads a LEB up to a point pre-determined by the mount recovery,
- * checks the nodes, and writes the result back to the flash, thereby cleaning
- * off any following corruption, or non-fatal ECC errors.
- *
- * This function returns %0 on success and a negative error code on failure.
- */
-static int clean_an_unclean_leb(struct ubifs_info *c,
-				struct ubifs_unclean_leb *ucleb, void *sbuf)
-{
-	int err, lnum = ucleb->lnum, offs = 0, len = ucleb->endpt, quiet = 1;
-	void *buf = sbuf;
-
-	dbg_rcvry("LEB %d len %d", lnum, len);
-
-	if (len == 0) {
-		/* Nothing to read, just unmap it */
-		return ubifs_leb_unmap(c, lnum);
-	}
-
-	err = ubifs_leb_read(c, lnum, buf, offs, len, 0);
-	if (err && err != -EBADMSG)
-		return err;
-
-	while (len >= 8) {
-		int ret;
-
-		cond_resched();
-
-		/* Scan quietly until there is an error */
-		ret = ubifs_scan_a_node(c, buf, len, lnum, offs, quiet);
-
-		if (ret == SCANNED_A_NODE) {
-			/* A valid node, and not a padding node */
-			struct ubifs_ch *ch = buf;
-			int node_len;
-
-			node_len = ALIGN(le32_to_cpu(ch->len), 8);
-			offs += node_len;
-			buf += node_len;
-			len -= node_len;
-			continue;
-		}
-
-		if (ret > 0) {
-			/* Padding bytes or a valid padding node */
-			offs += ret;
-			buf += ret;
-			len -= ret;
-			continue;
-		}
-
-		if (ret == SCANNED_EMPTY_SPACE) {
-			ubifs_err(c, "unexpected empty space at %d:%d",
-				  lnum, offs);
-			return -EUCLEAN;
-		}
-
-		if (quiet) {
-			/* Redo the last scan but noisily */
-			quiet = 0;
-			continue;
-		}
-
-		ubifs_scanned_corruption(c, lnum, offs, buf);
-		return -EUCLEAN;
-	}
-
-	/* Pad to min_io_size */
-	len = ALIGN(ucleb->endpt, c->min_io_size);
-	if (len > ucleb->endpt) {
-		int pad_len = len - ALIGN(ucleb->endpt, 8);
-
-		if (pad_len > 0) {
-			buf = c->sbuf + len - pad_len;
-			ubifs_pad(c, buf, pad_len);
-		}
-	}
-
-	/* Write back the LEB atomically */
-	err = ubifs_leb_change(c, lnum, sbuf, len);
-	if (err)
-		return err;
-
-	dbg_rcvry("cleaned LEB %d", lnum);
-
-	return 0;
-}
-
-/**
- * ubifs_clean_lebs - clean LEBs recovered during read-only mount.
- * @c: UBIFS file-system description object
- * @sbuf: LEB-sized buffer to use
- *
- * This function cleans a LEB identified during recovery that needs to be
- * written but was not because UBIFS was mounted read-only. This happens when
- * remounting to read-write mode.
- *
- * This function returns %0 on success and a negative error code on failure.
- */
-int ubifs_clean_lebs(struct ubifs_info *c, void *sbuf)
-{
-	dbg_rcvry("recovery");
-	while (!list_empty(&c->unclean_leb_list)) {
-		struct ubifs_unclean_leb *ucleb;
-		int err;
-
-		ucleb = list_entry(c->unclean_leb_list.next,
-				   struct ubifs_unclean_leb, list);
-		err = clean_an_unclean_leb(c, ucleb, sbuf);
-		if (err)
-			return err;
-		list_del(&ucleb->list);
-		kfree(ucleb);
-	}
-	return 0;
-}
-
-/**
  * grab_empty_leb - grab an empty LEB to use as GC LEB and run commit.
  * @c: UBIFS file-system description object
  *
@@ -1224,7 +1084,6 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
  * @i_size: size on inode
  * @d_size: maximum size based on data nodes
  * @exists: indicates whether the inode exists
- * @inode: inode if pinned in memory awaiting rw mode to fix it
  */
 struct size_entry {
 	struct rb_node rb;
@@ -1232,7 +1091,6 @@ struct size_entry {
 	loff_t i_size;
 	loff_t d_size;
 	int exists;
-	struct inode *inode;
 };
 
 /**
@@ -1319,7 +1177,6 @@ void ubifs_destroy_size_tree(struct ubifs_info *c)
 	struct size_entry *e, *n;
 
 	rbtree_postorder_for_each_entry_safe(e, n, &c->size_tree, rb) {
-		iput(e->inode);
 		kfree(e);
 	}
 
@@ -1422,7 +1279,7 @@ static int fix_size_in_place(struct ubifs_info *c, struct size_entry *e)
 		return 0;
 	/* Read the LEB */
 	err = ubifs_leb_read(c, lnum, c->sbuf, 0, c->leb_size, 1);
-	if (err)
+	if (err && err != -EBADMSG)
 		goto out;
 	/* Change the size field and recalculate the CRC */
 	ino = c->sbuf + offs;
@@ -1441,12 +1298,14 @@ static int fix_size_in_place(struct ubifs_info *c, struct size_entry *e)
 	if (err)
 		goto out;
 	dbg_rcvry("inode %lu at %d:%d size %lld -> %lld",
-		  (unsigned long)e->inum, lnum, offs, i_size, e->d_size);
+		  (unsigned long)e->inum, lnum, offs, (long long)i_size,
+		  (long long)e->d_size);
 	return 0;
 
 out:
 	ubifs_warn(c, "inode %lu failed to fix size %lld -> %lld error %d",
-		   (unsigned long)e->inum, e->i_size, e->d_size, err);
+		   (unsigned long)e->inum, (long long)e->i_size,
+		   (long long)e->d_size, err);
 	return err;
 }
 
@@ -1455,64 +1314,12 @@ out:
  * @c: UBIFS file-system description object
  * @e: inode size information for recovery
  */
-static int inode_fix_size(struct ubifs_info *c, struct size_entry *e)
+static int inode_fix_size(struct ubifs_info *c, __unused struct size_entry *e)
 {
-	struct inode *inode;
-	struct ubifs_inode *ui;
-	int err;
-
-	if (c->ro_mount)
-		ubifs_assert(c, !e->inode);
-
-	if (e->inode) {
-		/* Remounting rw, pick up inode we stored earlier */
-		inode = e->inode;
-	} else {
-		inode = ubifs_iget(c->vfs_sb, e->inum);
-		if (IS_ERR(inode))
-			return PTR_ERR(inode);
-
-		if (inode->i_size >= e->d_size) {
-			/*
-			 * The original inode in the index already has a size
-			 * big enough, nothing to do
-			 */
-			iput(inode);
-			return 0;
-		}
-
-		dbg_rcvry("ino %lu size %lld -> %lld",
-			  (unsigned long)e->inum,
-			  inode->i_size, e->d_size);
-
-		ui = ubifs_inode(inode);
-
-		inode->i_size = e->d_size;
-		ui->ui_size = e->d_size;
-		ui->synced_i_size = e->d_size;
+	ubifs_assert(c, 0);
 
-		e->inode = inode;
-	}
-
-	/*
-	 * In readonly mode just keep the inode pinned in memory until we go
-	 * readwrite. In readwrite mode write the inode to the journal with the
-	 * fixed size.
-	 */
-	if (c->ro_mount)
-		return 0;
-
-	err = ubifs_jnl_write_inode(c, inode);
-
-	iput(inode);
-
-	if (err)
-		return err;
-
-	rb_erase(&e->rb, &c->size_tree);
-	kfree(e);
-
-	return 0;
+	// To be implemented
+	return -EINVAL;
 }
 
 /**
@@ -1571,7 +1378,6 @@ int ubifs_recover_size(struct ubifs_info *c, bool in_place)
 				err = fix_size_in_place(c, e);
 				if (err)
 					return err;
-				iput(e->inode);
 			} else {
 				err = inode_fix_size(c, e);
 				if (err)
diff --git a/ubifs-utils/libubifs/replay.c b/ubifs-utils/libubifs/replay.c
index c59d47fe..b1d01648 100644
--- a/ubifs-utils/libubifs/replay.c
+++ b/ubifs-utils/libubifs/replay.c
@@ -20,9 +20,14 @@
  * larger is the journal, the more memory its index may consume.
  */
 
+#include "linux_err.h"
+#include "bitops.h"
+#include "kmem.h"
 #include "ubifs.h"
-#include <linux/list_sort.h>
-#include <crypto/hash.h>
+#include "defs.h"
+#include "debug.h"
+#include "key.h"
+#include "misc.h"
 
 /**
  * struct replay_entry - replay list entry.
@@ -485,7 +490,8 @@ int ubifs_validate_entry(struct ubifs_info *c,
 	if (le32_to_cpu(dent->ch.len) != nlen + UBIFS_DENT_NODE_SZ + 1 ||
 	    dent->type >= UBIFS_ITYPES_CNT ||
 	    nlen > UBIFS_MAX_NLEN || dent->name[nlen] != 0 ||
-	    (key_type == UBIFS_XENT_KEY && strnlen(dent->name, nlen) != nlen) ||
+	    (key_type == UBIFS_XENT_KEY &&
+	     strnlen((const char *)dent->name, nlen) != nlen) ||
 	    le64_to_cpu(dent->inum) > MAX_INUM) {
 		ubifs_err(c, "bad %s node", key_type == UBIFS_DENT_KEY ?
 			  "directory entry" : "extended attribute entry");
@@ -558,19 +564,6 @@ static int is_last_bud(struct ubifs_info *c, struct ubifs_bud *bud)
 	return data == 0xFFFFFFFF;
 }
 
-/* authenticate_sleb_hash is split out for stack usage */
-static int noinline_for_stack
-authenticate_sleb_hash(struct ubifs_info *c,
-		       struct shash_desc *log_hash, u8 *hash)
-{
-	SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
-
-	hash_desc->tfm = c->hash_tfm;
-
-	ubifs_shash_copy_state(c, log_hash, hash_desc);
-	return crypto_shash_final(hash_desc, hash);
-}
-
 /**
  * authenticate_sleb - authenticate one scan LEB
  * @c: UBIFS file-system description object
@@ -588,69 +581,14 @@ authenticate_sleb_hash(struct ubifs_info *c,
  * that could be authenticated or a negative error code.
  */
 static int authenticate_sleb(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
-			     struct shash_desc *log_hash, int is_last)
+			     __unused struct shash_desc *log_hash,
+			     __unused int is_last)
 {
-	int n_not_auth = 0;
-	struct ubifs_scan_node *snod;
-	int n_nodes = 0;
-	int err;
-	u8 hash[UBIFS_HASH_ARR_SZ];
-	u8 hmac[UBIFS_HMAC_ARR_SZ];
-
 	if (!ubifs_authenticated(c))
 		return sleb->nodes_cnt;
 
-	list_for_each_entry(snod, &sleb->nodes, list) {
-
-		n_nodes++;
-
-		if (snod->type == UBIFS_AUTH_NODE) {
-			struct ubifs_auth_node *auth = snod->node;
-
-			err = authenticate_sleb_hash(c, log_hash, hash);
-			if (err)
-				goto out;
-
-			err = crypto_shash_tfm_digest(c->hmac_tfm, hash,
-						      c->hash_len, hmac);
-			if (err)
-				goto out;
-
-			err = ubifs_check_hmac(c, auth->hmac, hmac);
-			if (err) {
-				err = -EPERM;
-				goto out;
-			}
-			n_not_auth = 0;
-		} else {
-			err = crypto_shash_update(log_hash, snod->node,
-						  snod->len);
-			if (err)
-				goto out;
-			n_not_auth++;
-		}
-	}
-
-	/*
-	 * A powercut can happen when some nodes were written, but not yet
-	 * the corresponding authentication node. This may only happen on
-	 * the last bud though.
-	 */
-	if (n_not_auth) {
-		if (is_last) {
-			dbg_mnt("%d unauthenticated nodes found on LEB %d, Ignoring them",
-				n_not_auth, sleb->lnum);
-			err = 0;
-		} else {
-			dbg_mnt("%d unauthenticated nodes found on non-last LEB %d",
-				n_not_auth, sleb->lnum);
-			err = -EPERM;
-		}
-	} else {
-		err = 0;
-	}
-out:
-	return err ? err : n_nodes - n_not_auth;
+	// To be implemented
+	return -EINVAL;
 }
 
 /**
@@ -768,7 +706,7 @@ static int replay_bud(struct ubifs_info *c, struct bud_entry *b)
 				goto out_dump;
 
 			err = insert_dent(c, lnum, snod->offs, snod->len, hash,
-					  &snod->key, dent->name,
+					  &snod->key, (const char *)dent->name,
 					  le16_to_cpu(dent->nlen), snod->sqnum,
 					  !le64_to_cpu(dent->inum), &used);
 			break;
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
