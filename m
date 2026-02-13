Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C2FEDF166
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 13:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=loLRwAE+hm/Ahz4fsEa7dCgth/OGPFbKWXv2IT7eAhE=; b=gmRMu8T/vx1Bz9
	worN3pKb6ok8p86YHdP/W9j6Sqhqn8bshKselISnh4OLvq2HiwL6rbRWsDZ8YfF81XIbo0PJ3n1kl
	mMiPuRRYnHUQtAtb2J2r9QqaQQp8Vhyj7G/2OvLfLzny4bvQm6NPv1hDXYgbdu+M/4Ujn7awxypVQ
	P20q/wxqdAfsEkdETJTIat6HSiBy9nqCwk4dDrxkn4e/VgXQPhCo0OH0J8grbMJnO4OdvJblhYmit
	iBE8+Vgjn7U0NmaY8S1jZryHnGC3m2+tKJx4vyOneprrqdov/4UvL3bQwKNmGGOdsooFAtook9tWg
	GMKG1aef1kIKTcIFRvhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqtez-00000003Vgl-3T9y;
	Fri, 13 Feb 2026 13:56:41 +0000
Received: from out-ip0051.fra.mailhop.org ([18.193.30.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqtep-00000003Vg3-0qyy
	for linux-mtd@lists.infradead.org;
	Fri, 13 Feb 2026 13:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=hitachienergy.com; s=duo-1630306886989-947ac67a;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:cfbl-address:cfbl-feedback-id:from;
	bh=LR/jFJ/3LaM15LNfqcD1FWoTk9JOBbPmjWgqReZCQxw=;
	b=TVC2IyjMVXe5d1CiWEeAVtSvFxUBoK1hTZc/qyNcfu2FJLJyyTADMCNrV9N/Bdlpertulh2eEHijv
	 DSvnxGNbzEM154Zqr3owTRJ2naz+IaqO3EZnusDdeD4F/+inqso+LqP2FkRIsbozwei77H6ngq+PcT
	 YX/bBwQ0M2SXs5ps=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=outbound.mailhop.org; s=dkim-high;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:cfbl-address:cfbl-feedback-id:from;
	bh=LR/jFJ/3LaM15LNfqcD1FWoTk9JOBbPmjWgqReZCQxw=;
	b=CeLrjUh2ZZJVHcU8eqWLP2VjhVxZsUVrknuWJXFbPN7YOOoJxUu6WUYYvdvDWx9dN7eE9taMaLxae
	 b6ioTyXU+FvOyZCi92ogSQPZhO46VHyh+xxKhMAsss8En8QD8LnOHeeGfUC9r5Xm4ZBSFZcW9QPA9k
	 ZRNQHtI709Pg3LSoW4Se6mhHDbM+UArcvUsgVV7O+A4UCcyZvb2B96HDBwWASsaIbrBHb1dHVF42om
	 B04PNDZzrVBoeLc4AdPILbAd+Z/iXXMlqHkkZSpx4jTdXeDwvvftQTZpVZJc/6Nueg4EoCsJybgKQk
	 lZXyvg17tM+uGV/SFHvflPHz/DbtZKQ==
X-Originating-IP: 20.62.140.138
X-MHO-RoutePath: aGVkY3NtdHA=
X-MHO-User: c8549042-08e3-11f1-be97-f54febe22707
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
CFBL-Feedback-ID: c8549042-08e3-11f1-be97-f54febe22707:7
CFBL-Address: prvs=0504dcd509=abuse@outbound.mailhop.org; report=arf
Received: from HPG0000000534.corp.hitachi-powergrids.com (unknown [20.62.140.138])
	by outbound3.eu.mailhop.org (Halon) with ESMTPSA
	id c8549042-08e3-11f1-be97-f54febe22707;
	Fri, 13 Feb 2026 13:56:26 +0000 (UTC)
Received: from gitsiv.hitachienergy.com (unknown [10.54.139.14])
	by HPG0000000534.corp.hitachi-powergrids.com (Postfix) with SMTP id 60CBB402508;
	Fri, 13 Feb 2026 13:56:22 +0000 (UTC)
Received: from chbrn3-p-dev026.keymile.net (chbrn3-p-dev026.keymile.net [172.31.41.203])
	by gitsiv.hitachienergy.com (Postfix) with ESMTP id DC57460B7D47;
	Fri, 13 Feb 2026 14:56:21 +0100 (CET)
From: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
To: linux-mtd@lists.infradead.org
Cc: chengzhihao1@huawei.com,
	Yuta Hayama <hayama@lineo.co.jp>,
	Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
Subject: [mtd-utils,v2,2/2] fsck.ubifs: fix platform dependant ino_t and loff_t formatting
Date: Fri, 13 Feb 2026 14:55:22 +0100
Message-ID: <20260213135541.1655355-1-tomas.alvarez-vanoli@hitachienergy.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <285fc676-0f51-41fb-83c9-b95671af4ada@lineo.co.jp>
References: <285fc676-0f51-41fb-83c9-b95671af4ada@lineo.co.jp>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_055631_540920_4BDC3790 
X-CRM114-Status: GOOD (  12.48  )
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

From: Yuta Hayama <hayama@lineo.co.jp>

On architectures such as armv7-a, ino_t and loff_t are unsigned long long rather than
unsigned long. In such cases, the printf format specifier "%lu" is not
appropriate and causes an incorrect address offset.

  mtd-utils/ubifs-utils/fsck.ubifs/problem.c:224
  		log_out(c, "problem: %s, ino %lu, unreachable dentry %s, type %s%s",
  			problem->desc, ifp->file->inum,
  			c->encrypted && !ifp->file->ino.is_xattr ? "<encrypted>" : dent_node->name,
  			ubifs_get_type_name(dent_node->type),
  			key_type(c, &dent_node->key) == UBIFS_XENT_KEY ? "(xattr)" : "");

  fsck.ubifs[484] (/dev/ubi0_0,danger mode): problem: Dentry is unreachable, ino 917, unreachable dentry (null), type checksum_typefile

Furthermore, running fsck.ubifs with the --debug=4 option will almost
certainly cause a SEGV at the following point.

  mtd-utils/ubifs-utils/fsck.ubifs/check_files.c:103
  	dbg_fsck("construct file(%lu) for %s node, TNC location %d:%d, in %s",
  		 inum, ubifs_get_key_name(key_type(c, key)), sn->lnum, sn->offs,
  		 c->dev_name);

To ensure functionality regardless of environment, cast ino_t to unsigned
long, since it will never be more than 4 bytes.

For loff_t, use %lld and cast accordingly.

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
Signed-off-by: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
---
 ubifs-utils/fsck.ubifs/check_files.c         |  7 +-
 ubifs-utils/fsck.ubifs/extract_files.c       | 95 ++++++++++----------
 ubifs-utils/fsck.ubifs/handle_disconnected.c |  6 +-
 ubifs-utils/fsck.ubifs/problem.c             | 20 ++---
 ubifs-utils/fsck.ubifs/rebuild_fs.c          |  4 +-
 ubifs-utils/libubifs/dir.c                   |  4 +-
 6 files changed, 69 insertions(+), 67 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/check_files.c b/ubifs-utils/fsck.ubifs/check_files.c
index 1e1a77b..4e5ff58 100644
--- a/ubifs-utils/fsck.ubifs/check_files.c
+++ b/ubifs-utils/fsck.ubifs/check_files.c
@@ -101,8 +101,8 @@ static int construct_file(struct ubifs_info *c, union ubifs_key *key,
 	}
 
 	dbg_fsck("construct file(%lu) for %s node, TNC location %d:%d, in %s",
-		 inum, ubifs_get_key_name(key_type(c, key)), sn->lnum, sn->offs,
-		 c->dev_name);
+		 (unsigned long)inum, ubifs_get_key_name(key_type(c, key)),
+		 sn->lnum, sn->offs, c->dev_name);
 	return insert_or_update_file(c, tree, sn, key_type(c, key), inum);
 }
 
@@ -344,7 +344,8 @@ void update_files_size(struct ubifs_info *c)
 			if (file && file->ino.header.exist &&
 			    file->ino.size < e->d_size) {
 				dbg_fsck("update file(%lu) size %llu->%llu, in %s",
-					 e->inum, file->ino.size,
+					 (unsigned long)e->inum,
+					 file->ino.size,
 					 (unsigned long long)e->d_size,
 					 c->dev_name);
 				file->ino.size = e->d_size;
diff --git a/ubifs-utils/fsck.ubifs/extract_files.c b/ubifs-utils/fsck.ubifs/extract_files.c
index 000ef5d..2e47b42 100644
--- a/ubifs-utils/fsck.ubifs/extract_files.c
+++ b/ubifs-utils/fsck.ubifs/extract_files.c
@@ -78,21 +78,21 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	if (!inum || inum > INUM_WATERMARK) {
 		if (FSCK(c)->mode == REBUILD_MODE)
 			dbg_fsck("bad inode node(bad inum %lu) at %d:%d, in %s",
-				 inum, lnum, offs, c->dev_name);
+				 (unsigned long)inum, lnum, offs, c->dev_name);
 		else
 			log_out(c, "bad inode node(bad inum %lu) at %d:%d",
-				inum, lnum, offs);
+				(unsigned long)inum, lnum, offs);
 		goto out;
 	}
 
 	if (ch->node_type != key_type(c, key)) {
 		if (FSCK(c)->mode == REBUILD_MODE)
 			dbg_fsck("bad inode node %lu(inconsistent node type %d vs key_type %d) at %d:%d, in %s",
-				 inum, ch->node_type, key_type(c, key),
+				 (unsigned long)inum, ch->node_type, key_type(c, key),
 				 lnum, offs, c->dev_name);
 		else
 			log_out(c, "bad inode node %lu(inconsistent node type %d vs key_type %d) at %d:%d",
-				inum, ch->node_type, key_type(c, key),
+				(unsigned long)inum, ch->node_type, key_type(c, key),
 				lnum, offs);
 		goto out;
 	}
@@ -114,43 +114,43 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	if (inum == UBIFS_ROOT_INO && !S_ISDIR(ino_node->mode)) {
 		if (FSCK(c)->mode == REBUILD_MODE)
 			dbg_fsck("bad inode node %lu(root inode is not dir, tyoe %u) at %d:%d, in %s",
-				 inum, ino_node->mode & S_IFMT, lnum, offs,
+				 (unsigned long)inum, ino_node->mode & S_IFMT, lnum, offs,
 				 c->dev_name);
 		else
 			log_out(c, "bad inode node %lu(root inode is not dir, tyoe %u) at %d:%d",
-				inum, ino_node->mode & S_IFMT, lnum, offs);
+				(unsigned long)inum, ino_node->mode & S_IFMT, lnum, offs);
 		goto out;
 	}
 
 	if (ino_node->size > c->max_inode_sz) {
 		if (FSCK(c)->mode == REBUILD_MODE)
 			dbg_fsck("bad inode node %lu(size %llu is too large) at %d:%d, in %s",
-				 inum, ino_node->size, lnum, offs, c->dev_name);
+				 (unsigned long)inum, ino_node->size, lnum, offs, c->dev_name);
 		else
 			log_out(c, "bad inode node %lu(size %llu is too large) at %d:%d",
-				inum, ino_node->size, lnum, offs);
+				(unsigned long)inum, ino_node->size, lnum, offs);
 		goto out;
 	}
 
 	if (le16_to_cpu(ino->compr_type) >= UBIFS_COMPR_TYPES_CNT) {
 		if (FSCK(c)->mode == REBUILD_MODE)
 			dbg_fsck("bad inode node %lu(unknown compression type %d) at %d:%d, in %s",
-				 inum, le16_to_cpu(ino->compr_type), lnum, offs,
+				 (unsigned long)inum, le16_to_cpu(ino->compr_type), lnum, offs,
 				 c->dev_name);
 		else
 			log_out(c, "bad inode node %lu(unknown compression type %d) at %d:%d",
-				inum, le16_to_cpu(ino->compr_type), lnum, offs);
+				(unsigned long)inum, le16_to_cpu(ino->compr_type), lnum, offs);
 		goto out;
 	}
 
 	if (ino_node->xnms + ino_node->xcnt > XATTR_LIST_MAX) {
 		if (FSCK(c)->mode == REBUILD_MODE)
 			dbg_fsck("bad inode node %lu(too big xnames %u xcount %u) at %d:%d, in %s",
-				 inum, ino_node->xnms, ino_node->xcnt,
+				 (unsigned long)inum, ino_node->xnms, ino_node->xcnt,
 				 lnum, offs, c->dev_name);
 		else
 			log_out(c, "bad inode node %lu(too big xnames %u xcount %u) at %d:%d",
-				inum, ino_node->xnms, ino_node->xcnt,
+				(unsigned long)inum, ino_node->xnms, ino_node->xcnt,
 				lnum, offs);
 		goto out;
 	}
@@ -158,20 +158,20 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	if (data_len < 0 || data_len > UBIFS_MAX_INO_DATA) {
 		if (FSCK(c)->mode == REBUILD_MODE)
 			dbg_fsck("bad inode node %lu(invalid data len %d) at %d:%d, in %s",
-				 inum, data_len, lnum, offs, c->dev_name);
+				 (unsigned long)inum, data_len, lnum, offs, c->dev_name);
 		else
 			log_out(c, "bad inode node %lu(invalid data len %d) at %d:%d",
-				inum, data_len, lnum, offs);
+				(unsigned long)inum, data_len, lnum, offs);
 		goto out;
 	}
 
 	if (UBIFS_INO_NODE_SZ + data_len != node_len) {
 		if (FSCK(c)->mode == REBUILD_MODE)
 			dbg_fsck("bad inode node %lu(inconsistent data len %d vs node len %d) at %d:%d, in %s",
-				 inum, data_len, node_len, lnum, offs, c->dev_name);
+				 (unsigned long)inum, data_len, node_len, lnum, offs, c->dev_name);
 		else
 			log_out(c, "bad inode node %lu(inconsistent data len %d vs node len %d) at %d:%d",
-				inum, data_len, node_len, lnum, offs);
+				(unsigned long)inum, data_len, node_len, lnum, offs);
 		goto out;
 	}
 
@@ -179,33 +179,33 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 		if (!S_ISREG(ino_node->mode)) {
 			if (FSCK(c)->mode == REBUILD_MODE)
 				dbg_fsck("bad inode node %lu(bad type %u for xattr) at %d:%d, in %s",
-					 inum, ino_node->mode & S_IFMT,
+					 (unsigned long)inum, ino_node->mode & S_IFMT,
 					 lnum, offs, c->dev_name);
 			else
 				log_out(c, "bad inode node %lu(bad type %u for xattr) at %d:%d",
-					inum, ino_node->mode & S_IFMT,
+					(unsigned long)inum, ino_node->mode & S_IFMT,
 					lnum, offs);
 			goto out;
 		}
 		if (data_len != ino_node->size) {
 			if (FSCK(c)->mode == REBUILD_MODE)
 				dbg_fsck("bad inode node %lu(inconsistent data_len %d vs size %llu for xattr) at %d:%d, in %s",
-					 inum, data_len, ino_node->size,
+					 (unsigned long)inum, data_len, ino_node->size,
 					 lnum, offs, c->dev_name);
 			else
 				log_out(c, "bad inode node %lu(inconsistent data_len %d vs size %llu for xattr) at %d:%d",
-					inum, data_len, ino_node->size,
+					(unsigned long)inum, data_len, ino_node->size,
 					lnum, offs);
 			goto out;
 		}
 		if (ino_node->xcnt || ino_node->xsz || ino_node->xnms) {
 			if (FSCK(c)->mode == REBUILD_MODE)
 				dbg_fsck("bad inode node %lu(non zero xattr count %u xattr size %u xattr names %u for xattr) at %d:%d, in %s",
-					 inum, ino_node->xcnt, ino_node->xsz,
+					 (unsigned long)inum, ino_node->xcnt, ino_node->xsz,
 					 ino_node->xnms, lnum, offs, c->dev_name);
 			else
 				log_out(c, "bad inode node %lu(non zero xattr count %u xattr size %u xattr names %u for xattr) at %d:%d",
-					inum, ino_node->xcnt, ino_node->xsz,
+					(unsigned long)inum, ino_node->xcnt, ino_node->xsz,
 					ino_node->xnms, lnum, offs);
 			goto out;
 		}
@@ -216,10 +216,10 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 		if (!ino_node->is_xattr && data_len != 0) {
 			if (FSCK(c)->mode == REBUILD_MODE)
 				dbg_fsck("bad inode node %lu(bad data len %d for reg file) at %d:%d, in %s",
-					 inum, data_len, lnum, offs, c->dev_name);
+					 (unsigned long)inum, data_len, lnum, offs, c->dev_name);
 			else
 				log_out(c, "bad inode node %lu(bad data len %d for reg file) at %d:%d",
-					inum, data_len, lnum, offs);
+					(unsigned long)inum, data_len, lnum, offs);
 			goto out;
 		}
 		break;
@@ -227,10 +227,10 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 		if (data_len != 0) {
 			if (FSCK(c)->mode == REBUILD_MODE)
 				dbg_fsck("bad inode node %lu(bad data len %d for dir file) at %d:%d, in %s",
-					 inum, data_len, lnum, offs, c->dev_name);
+					 (unsigned long)inum, data_len, lnum, offs, c->dev_name);
 			else
 				log_out(c, "bad inode node %lu(bad data len %d for dir file) at %d:%d",
-					inum, data_len, lnum, offs);
+					(unsigned long)inum, data_len, lnum, offs);
 			goto out;
 		}
 		break;
@@ -249,10 +249,10 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 			 */
 			if (FSCK(c)->mode == REBUILD_MODE)
 				dbg_fsck("bad symlink inode node %lu(bad data len %d) at %d:%d, in %s",
-					 inum, data_len, lnum, offs, c->dev_name);
+					 (unsigned long)inum, data_len, lnum, offs, c->dev_name);
 			else
 				log_out(c, "bad symlink inode node %lu(bad data len %d) at %d:%d",
-					inum, data_len, lnum, offs);
+					(unsigned long)inum, data_len, lnum, offs);
 			goto out;
 		}
 		break;
@@ -266,11 +266,11 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 		if (data_len != sz_new && data_len != sz_huge) {
 			if (FSCK(c)->mode == REBUILD_MODE)
 				dbg_fsck("bad inode node %lu(bad data len %d for char/block file, expect %d or %d) at %d:%d, in %s",
-					 inum, data_len, sz_new, sz_huge, lnum,
+					 (unsigned long)inum, data_len, sz_new, sz_huge, lnum,
 					 offs, c->dev_name);
 			else
 				log_out(c, "bad inode node %lu(bad data len %d for char/block file, expect %d or %d) at %d:%d",
-					inum, data_len, sz_new, sz_huge, lnum,
+					(unsigned long)inum, data_len, sz_new, sz_huge, lnum,
 					offs);
 			goto out;
 		}
@@ -282,10 +282,10 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 		if (data_len != 0) {
 			if (FSCK(c)->mode == REBUILD_MODE)
 				dbg_fsck("bad inode node %lu(bad data len %d for fifo/sock file) at %d:%d, in %s",
-					 inum, data_len, lnum, offs, c->dev_name);
+					 (unsigned long)inum, data_len, lnum, offs, c->dev_name);
 			else
 				log_out(c, "bad inode node %lu(bad data len %d for fifo/sock file) at %d:%d",
-					inum, data_len, lnum, offs);
+					(unsigned long)inum, data_len, lnum, offs);
 			goto out;
 		}
 		break;
@@ -293,21 +293,21 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 		/* invalid file type. */
 		if (FSCK(c)->mode == REBUILD_MODE)
 			dbg_fsck("bad inode node %lu(unknown type %u) at %d:%d, in %s",
-				 inum, ino_node->mode & S_IFMT, lnum, offs, c->dev_name);
+				 (unsigned long)inum, ino_node->mode & S_IFMT, lnum, offs, c->dev_name);
 		else
 			log_out(c, "bad inode node %lu(unknown type %u) at %d:%d",
-				inum, ino_node->mode & S_IFMT, lnum, offs);
+				(unsigned long)inum, ino_node->mode & S_IFMT, lnum, offs);
 		goto out;
 	}
 
 	if (ino_node->is_encrypted && !inode_can_be_encrypted(c, ino_node)) {
 		if (FSCK(c)->mode == REBUILD_MODE)
 			dbg_fsck("bad inode node %lu(encrypted but cannot be encrypted, type %u, is_xattr %d, fs_encrypted %d) at %d:%d, in %s",
-				 inum, ino_node->mode & S_IFMT, ino_node->is_xattr,
+				 (unsigned long)inum, ino_node->mode & S_IFMT, ino_node->is_xattr,
 				 c->encrypted, lnum, offs, c->dev_name);
 		else
 			log_out(c, "bad inode node %lu(encrypted but cannot be encrypted, type %u, is_xattr %d, fs_encrypted %d) at %d:%d",
-				inum, ino_node->mode & S_IFMT, ino_node->is_xattr,
+				(unsigned long)inum, ino_node->mode & S_IFMT, ino_node->is_xattr,
 				c->encrypted, lnum, offs);
 		goto out;
 	}
@@ -357,12 +357,12 @@ bool parse_dent_node(struct ubifs_info *c, int lnum, int offs, void *node,
 		if (FSCK(c)->mode == REBUILD_MODE)
 			dbg_fsck("bad %s node(len %d nlen %d type %d inum %lu key_type %d node_type %d) at %d:%d, in %s",
 				 ch->node_type == UBIFS_XENT_NODE ? "xattr entry" : "directory entry",
-				 node_len, nlen, dent->type, inum, key_type,
+				 node_len, nlen, dent->type, (unsigned long)inum, key_type,
 				 ch->node_type, lnum, offs, c->dev_name);
 		else
 			log_out(c, "bad %s node(len %d nlen %d type %d inum %lu key_type %d node_type %d) at %d:%d",
 				ch->node_type == UBIFS_XENT_NODE ? "xattr entry" : "directory entry",
-				node_len, nlen, dent->type, inum, key_type,
+				node_len, nlen, dent->type, (unsigned long)inum, key_type,
 				ch->node_type, lnum, offs);
 		goto out;
 	}
@@ -419,10 +419,10 @@ bool parse_data_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	if (!inum || inum > INUM_WATERMARK) {
 		if (FSCK(c)->mode == REBUILD_MODE)
 			dbg_fsck("bad data node(bad inum %lu) at %d:%d, in %s",
-				 inum, lnum, offs, c->dev_name);
+				 (unsigned long)inum, lnum, offs, c->dev_name);
 		else
 			log_out(c, "bad data node(bad inum %lu) at %d:%d",
-				inum, lnum, offs);
+				(unsigned long)inum, lnum, offs);
 		goto out;
 	}
 
@@ -485,7 +485,7 @@ bool parse_trun_node(struct ubifs_info *c, int lnum, int offs, void *node,
 
 	if (!inum || inum > INUM_WATERMARK) {
 		dbg_fsck("bad truncation node(bad inum %lu) at %d:%d, in %s",
-			 inum, lnum, offs, c->dev_name);
+			 (unsigned long)inum, lnum, offs, c->dev_name);
 		goto out;
 	}
 
@@ -496,8 +496,9 @@ bool parse_trun_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	if (old_size < 0 || old_size > c->max_inode_sz ||
 	    new_size < 0 || new_size > c->max_inode_sz ||
 	    old_size <= new_size) {
-		dbg_fsck("bad truncation node(new size %ld old size %ld inum %lu) at %d:%d, in %s",
-			 new_size, old_size, inum, lnum, offs, c->dev_name);
+		dbg_fsck("bad truncation node(new size %lld old size %lld inum %lu) at %d:%d, in %s",
+			 (long long)new_size, (long long)old_size,
+			 (unsigned long)inum, lnum, offs, c->dev_name);
 		goto out;
 	}
 
@@ -1007,7 +1008,7 @@ int file_is_valid(struct ubifs_info *c, struct scanned_file *file,
 	struct scanned_data_node *data_node;
 	LIST_HEAD(drop_list);
 
-	dbg_fsck("check validation of file %lu, in %s", file->inum, c->dev_name);
+	dbg_fsck("check validation of file %lu, in %s", (unsigned long)file->inum, c->dev_name);
 
 	if (!file->ino.header.exist) {
 		handle_invalid_file(c, FILE_HAS_NO_INODE, file, NULL);
@@ -1275,12 +1276,12 @@ retry:
 			handle_invalid_file(c, FILE_IS_DISCONNECTED, file, NULL);
 		else
 			handle_invalid_file(c, FILE_HAS_NO_DENT, file, NULL);
-		dbg_fsck("file %lu is unreachable, in %s", file->inum, c->dev_name);
+		dbg_fsck("file %lu is unreachable, in %s", (unsigned long)file->inum, c->dev_name);
 		return false;
 	}
 
 reachable:
-	dbg_fsck("file %lu is reachable, in %s", file->inum, c->dev_name);
+	dbg_fsck("file %lu is reachable, in %s", (unsigned long)file->inum, c->dev_name);
 	return true;
 }
 
@@ -1498,7 +1499,7 @@ static int correct_file_info(struct ubifs_info *c, struct scanned_file *file)
 	handle_invalid_file(c, FILE_IS_INCONSISTENT, file, NULL);
 	lnum = file->ino.header.lnum;
 	dbg_fsck("correct file(inum:%lu type:%s), nlink %u->%u, xattr cnt %u->%u, xattr size %u->%u, xattr names %u->%u, size %llu->%llu, at %d:%d, in %s",
-		 file->inum, file->ino.is_xattr ? "xattr" :
+		 (unsigned long)file->inum, file->ino.is_xattr ? "xattr" :
 		 ubifs_get_type_name(ubifs_get_dent_type(file->ino.mode)),
 		 file->ino.nlink, file->calc_nlink,
 		 file->ino.xcnt, file->calc_xcnt,
diff --git a/ubifs-utils/fsck.ubifs/handle_disconnected.c b/ubifs-utils/fsck.ubifs/handle_disconnected.c
index be62522..9e5d925 100644
--- a/ubifs-utils/fsck.ubifs/handle_disconnected.c
+++ b/ubifs-utils/fsck.ubifs/handle_disconnected.c
@@ -117,7 +117,7 @@ static int handle_disonnected_file(struct ubifs_info *c,
 			struct ubifs_inode *target_ui;
 
 			err = snprintf(file_name, sizeof(file_name),
-				       "INO_%lu_%u", file->inum, index);
+				       "INO_%lu_%u", (unsigned long)file->inum, index);
 			if (err < 0)
 				goto free_ui;
 			fname_name(&nm) = file_name;
@@ -138,7 +138,7 @@ static int handle_disonnected_file(struct ubifs_info *c,
 			kfree(ui);
 			kfree(lost_found_ui);
 			log_out(c, "Too many duplicated names(%u) in lost+found for inum %lu",
-				index, file->inum);
+				index, (unsigned long)file->inum);
 			goto delete_file;
 		}
 
@@ -150,7 +150,7 @@ static int handle_disonnected_file(struct ubifs_info *c,
 			goto delete_file;
 		}
 		dbg_fsck("recover disconnected file %lu, in %s",
-			 file->inum, c->dev_name);
+			 (unsigned long)file->inum, c->dev_name);
 
 free_ui:
 		kfree(ui);
diff --git a/ubifs-utils/fsck.ubifs/problem.c b/ubifs-utils/fsck.ubifs/problem.c
index 916c976..edb5f57 100644
--- a/ubifs-utils/fsck.ubifs/problem.c
+++ b/ubifs-utils/fsck.ubifs/problem.c
@@ -147,7 +147,7 @@ static void print_problem(const struct ubifs_info *c,
 	{
 		const struct invalid_file_problem *ifp = (const struct invalid_file_problem *)priv;
 
-		log_out(c, "problem: %s, ino %lu", problem->desc, ifp->file->inum);
+		log_out(c, "problem: %s, ino %lu", problem->desc, (unsigned long)ifp->file->inum);
 		break;
 	}
 	case FILE_HAS_INCONSIST_TYPE:
@@ -156,7 +156,7 @@ static void print_problem(const struct ubifs_info *c,
 		const struct scanned_dent_node *dent_node = (const struct scanned_dent_node *)ifp->priv;
 
 		log_out(c, "problem: %s, ino %lu, inode type %s%s, dentry %s has type %s%s",
-			problem->desc, ifp->file->inum,
+			problem->desc, (unsigned long)ifp->file->inum,
 			ubifs_get_type_name(ubifs_get_dent_type(ifp->file->ino.mode)),
 			ifp->file->ino.is_xattr ? "(xattr)" : "",
 			c->encrypted && !ifp->file->ino.is_xattr ? "<encrypted>" : dent_node->name,
@@ -171,7 +171,7 @@ static void print_problem(const struct ubifs_info *c,
 		const struct scanned_dent_node *dent_node = (const struct scanned_dent_node *)ifp->priv;
 
 		log_out(c, "problem: %s, ino %lu, type %s%s, dentry %s",
-			problem->desc, ifp->file->inum,
+			problem->desc, (unsigned long)ifp->file->inum,
 			ubifs_get_type_name(ubifs_get_dent_type(ifp->file->ino.mode)),
 			ifp->file->ino.is_xattr ? "(xattr)" : "",
 			c->encrypted && !ifp->file->ino.is_xattr ? "<encrypted>" : dent_node->name);
@@ -183,7 +183,7 @@ static void print_problem(const struct ubifs_info *c,
 		const struct scanned_data_node *data_node = (const struct scanned_data_node *)ifp->priv;
 
 		log_out(c, "problem: %s, ino %lu, type %s%s, data block %u",
-			problem->desc, ifp->file->inum,
+			problem->desc, (unsigned long)ifp->file->inum,
 			ubifs_get_type_name(ubifs_get_dent_type(ifp->file->ino.mode)),
 			ifp->file->ino.is_xattr ? "(xattr)" : "",
 			key_block(c, &data_node->key));
@@ -198,7 +198,7 @@ static void print_problem(const struct ubifs_info *c,
 		const struct invalid_file_problem *ifp = (const struct invalid_file_problem *)priv;
 
 		log_out(c, "problem: %s, ino %lu type %s%s", problem->desc,
-			ifp->file->inum,
+			(unsigned long)ifp->file->inum,
 			ubifs_get_type_name(ubifs_get_dent_type(ifp->file->ino.mode)),
 			ifp->file->ino.is_xattr ? "(xattr)" : "");
 		break;
@@ -209,9 +209,9 @@ static void print_problem(const struct ubifs_info *c,
 		const struct scanned_file *host = (const struct scanned_file *)ifp->priv;
 
 		log_out(c, "problem: %s, ino %lu type %s%s, host ino %lu type %s%s",
-			problem->desc, ifp->file->inum,
+			problem->desc, (unsigned long)ifp->file->inum,
 			ubifs_get_type_name(ubifs_get_dent_type(ifp->file->ino.mode)),
-			ifp->file->ino.is_xattr ? "(xattr)" : "", host->inum,
+			ifp->file->ino.is_xattr ? "(xattr)" : "", (unsigned long)host->inum,
 			ubifs_get_type_name(ubifs_get_dent_type(host->ino.mode)),
 			host->ino.is_xattr ? "(xattr)" : "");
 		break;
@@ -222,7 +222,7 @@ static void print_problem(const struct ubifs_info *c,
 		const struct scanned_dent_node *dent_node = (const struct scanned_dent_node *)ifp->priv;
 
 		log_out(c, "problem: %s, ino %lu, unreachable dentry %s, type %s%s",
-			problem->desc, ifp->file->inum,
+			problem->desc, (unsigned long)ifp->file->inum,
 			c->encrypted && !ifp->file->ino.is_xattr ? "<encrypted>" : dent_node->name,
 			ubifs_get_type_name(dent_node->type),
 			key_type(c, &dent_node->key) == UBIFS_XENT_KEY ? "(xattr)" : "");
@@ -235,7 +235,7 @@ static void print_problem(const struct ubifs_info *c,
 
 		log_out(c, "problem: %s, ino %lu type %s, nlink %u xcnt %u xsz %u xnms %u size %llu, "
 			"should be nlink %u xcnt %u xsz %u xnms %u size %llu",
-			problem->desc, file->inum,
+			problem->desc, (unsigned long)file->inum,
 			file->ino.is_xattr ? "xattr" : ubifs_get_type_name(ubifs_get_dent_type(file->ino.mode)),
 			file->ino.nlink, file->ino.xcnt, file->ino.xsz,
 			file->ino.xnms, file->ino.size,
@@ -299,7 +299,7 @@ static void print_problem(const struct ubifs_info *c,
 		const struct scanned_file *file = (const struct scanned_file *)priv;
 
 		log_out(c, "problem: %s, ino %lu, size %llu", problem->desc,
-			file->inum, file->ino.size);
+			(unsigned long)file->inum, file->ino.size);
 		break;
 	}
 	default:
diff --git a/ubifs-utils/fsck.ubifs/rebuild_fs.c b/ubifs-utils/fsck.ubifs/rebuild_fs.c
index b82d728..b399b3e 100644
--- a/ubifs-utils/fsck.ubifs/rebuild_fs.c
+++ b/ubifs-utils/fsck.ubifs/rebuild_fs.c
@@ -697,7 +697,7 @@ static void extract_dentry_tree(struct ubifs_info *c)
 		file = list_entry(unreachable.next, struct scanned_file, list);
 
 		dbg_fsck("remove unreachable file %lu, in %s",
-			 file->inum, c->dev_name);
+			 (unsigned long)file->inum, c->dev_name);
 		list_del(&file->list);
 		destroy_file_content(c, file);
 		rb_erase(&file->rb, tree);
@@ -1097,7 +1097,7 @@ static int record_file_used_lebs(struct ubifs_info *c,
 	struct scanned_data_node *data_node;
 
 	dbg_fsck("recovered file(inum:%lu name:%s type:%s), in %s",
-		 file->inum, get_file_name(c, file),
+		 (unsigned long)file->inum, get_file_name(c, file),
 		 file->ino.is_xattr ? "xattr" :
 		 ubifs_get_type_name(ubifs_get_dent_type(file->ino.mode)),
 		 c->dev_name);
diff --git a/ubifs-utils/libubifs/dir.c b/ubifs-utils/libubifs/dir.c
index 89f77eb..2eb4e75 100644
--- a/ubifs-utils/libubifs/dir.c
+++ b/ubifs-utils/libubifs/dir.c
@@ -249,7 +249,7 @@ int ubifs_mkdir(struct ubifs_info *c, struct ubifs_inode *dir_ui,
 	 * directory inode.
 	 */
 	dbg_gen("dent '%s', mode %#hx in dir ino %lu",
-		fname_name(nm), mode, dir->inum);
+		fname_name(nm), mode, (unsigned long)dir->inum);
 
 	/* New dir is not allowed to be created under an encrypted directory. */
 	ubifs_assert(c, !(dir_ui->flags & UBIFS_CRYPT_FL));
@@ -315,7 +315,7 @@ int ubifs_link_recovery(struct ubifs_info *c, struct ubifs_inode *dir_ui,
 	 * changing the parent inode.
 	 */
 	dbg_gen("dent '%s' to ino %lu (nlink %d) in dir ino %lu",
-		fname_name(nm), inode->inum, inode->nlink, dir->inum);
+		fname_name(nm), (unsigned long)inode->inum, inode->nlink, (unsigned long)dir->inum);
 
 	/* New dir is not allowed to be created under an encrypted directory. */
 	ubifs_assert(c, !(dir_ui->flags & UBIFS_CRYPT_FL));
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
