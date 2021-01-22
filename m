Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06140C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 15:17:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8884235DD
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 15:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8884235DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6nyLfNYmdRrsD5i8BAPEz7pT9rjzDX6mnMyj4iUJCOM=; b=kiYjb786hTGem9fYZsclWwOlH
	dWtNtBrdrq9Sc9bxFbF4LentzvZoVT/4CeHnMr5uYmq1sOaYTssoIYRf6G2rv/n/M6mCwYCZAcdxK
	P6hHq/l/dJ/ZLh2PMOGwUZ0NY9b2H12aVCaJC6HWes3MrNpuJTOo5csr8RJymL8ml039EXB4GtOCL
	Ly8YLV8m5TUsVfO9NYkD9SkRfmdlL+8Wm++d/k/IgRfC0AWMLZhLZUcFURyUSNsWaBIFdCPlse2k4
	1x1TvYIK3XZ7WlbvFRFx/dMhJX5IoH+Zr6ZM0tk8uZfYOXCY6vzdKWwJUQ80Iel6q/BWew6tZT0su
	vuEqPwM4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2yAc-0006xE-R3; Fri, 22 Jan 2021 15:16:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2yAZ-0006vl-6I
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2021 15:16:16 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2yA1-0004Bz-HF; Fri, 22 Jan 2021 16:15:41 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2yA1-0003r2-0T; Fri, 22 Jan 2021 16:15:41 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 7/8] ubifs: export get_znode
Date: Fri, 22 Jan 2021 16:15:35 +0100
Message-Id: <20210122151536.7982-8-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122151536.7982-1-s.hauer@pengutronix.de>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_101615_326101_BB0286FB 
X-CRM114-Status: GOOD (  17.40  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

get_znode will be needed by upcoming UBIFS quota support. Rename it to
ubifs_get_znode and export it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/tnc.c   | 32 ++++++++++++++++----------------
 fs/ubifs/ubifs.h |  2 ++
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 488f3da7a6c6..b30cd47a7e4c 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -570,15 +570,15 @@ static int matches_name(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 }
 
 /**
- * get_znode - get a TNC znode that may not be loaded yet.
+ * ubifs_get_znode - get a TNC znode that may not be loaded yet.
  * @c: UBIFS file-system description object
  * @znode: parent znode
  * @n: znode branch slot number
  *
  * This function returns the znode or a negative error code.
  */
-static struct ubifs_znode *get_znode(struct ubifs_info *c,
-				     struct ubifs_znode *znode, int n)
+struct ubifs_znode *ubifs_get_znode(struct ubifs_info *c,
+				    struct ubifs_znode *znode, int n)
 {
 	struct ubifs_zbranch *zbr;
 
@@ -618,11 +618,11 @@ static int tnc_next(struct ubifs_info *c, struct ubifs_znode **zn, int *n)
 		nn = znode->iip + 1;
 		znode = zp;
 		if (nn < znode->child_cnt) {
-			znode = get_znode(c, znode, nn);
+			znode = ubifs_get_znode(c, znode, nn);
 			if (IS_ERR(znode))
 				return PTR_ERR(znode);
 			while (znode->level != 0) {
-				znode = get_znode(c, znode, 0);
+				znode = ubifs_get_znode(c, znode, 0);
 				if (IS_ERR(znode))
 					return PTR_ERR(znode);
 			}
@@ -662,12 +662,12 @@ static int tnc_prev(struct ubifs_info *c, struct ubifs_znode **zn, int *n)
 		nn = znode->iip - 1;
 		znode = zp;
 		if (nn >= 0) {
-			znode = get_znode(c, znode, nn);
+			znode = ubifs_get_znode(c, znode, nn);
 			if (IS_ERR(znode))
 				return PTR_ERR(znode);
 			while (znode->level != 0) {
 				nn = znode->child_cnt - 1;
-				znode = get_znode(c, znode, nn);
+				znode = ubifs_get_znode(c, znode, nn);
 				if (IS_ERR(znode))
 					return PTR_ERR(znode);
 			}
@@ -2571,7 +2571,7 @@ static int tnc_delete(struct ubifs_info *c, struct ubifs_znode *znode, int n)
 		while (znode->child_cnt == 1 && znode->level != 0) {
 			zp = znode;
 			zbr = &znode->zbranch[0];
-			znode = get_znode(c, znode, 0);
+			znode = ubifs_get_znode(c, znode, 0);
 			if (IS_ERR(znode))
 				return PTR_ERR(znode);
 			znode = dirty_cow_znode(c, zbr);
@@ -3098,12 +3098,12 @@ static struct ubifs_znode *left_znode(struct ubifs_info *c,
 			return NULL;
 		if (n >= 0) {
 			/* Now go down the rightmost branch to 'level' */
-			znode = get_znode(c, znode, n);
+			znode = ubifs_get_znode(c, znode, n);
 			if (IS_ERR(znode))
 				return znode;
 			while (znode->level != level) {
 				n = znode->child_cnt - 1;
-				znode = get_znode(c, znode, n);
+				znode = ubifs_get_znode(c, znode, n);
 				if (IS_ERR(znode))
 					return znode;
 			}
@@ -3135,11 +3135,11 @@ static struct ubifs_znode *right_znode(struct ubifs_info *c,
 			return NULL;
 		if (n < znode->child_cnt) {
 			/* Now go down the leftmost branch to 'level' */
-			znode = get_znode(c, znode, n);
+			znode = ubifs_get_znode(c, znode, n);
 			if (IS_ERR(znode))
 				return znode;
 			while (znode->level != level) {
-				znode = get_znode(c, znode, 0);
+				znode = ubifs_get_znode(c, znode, 0);
 				if (IS_ERR(znode))
 					return znode;
 			}
@@ -3224,13 +3224,13 @@ static struct ubifs_znode *lookup_znode(struct ubifs_info *c,
 		}
 		if (znode->level == level + 1)
 			break;
-		znode = get_znode(c, znode, n);
+		znode = ubifs_get_znode(c, znode, n);
 		if (IS_ERR(znode))
 			return znode;
 	}
 	/* Check if the child is the one we are looking for */
 	if (znode->zbranch[n].lnum == lnum && znode->zbranch[n].offs == offs)
-		return get_znode(c, znode, n);
+		return ubifs_get_znode(c, znode, n);
 	/* If the key is unique, there is nowhere else to look */
 	if (!is_hash_key(c, key))
 		return NULL;
@@ -3256,7 +3256,7 @@ static struct ubifs_znode *lookup_znode(struct ubifs_info *c,
 		/* Check it */
 		if (znode->zbranch[n].lnum == lnum &&
 		    znode->zbranch[n].offs == offs)
-			return get_znode(c, znode, n);
+			return ubifs_get_znode(c, znode, n);
 		/* Stop if the key is less than the one we are looking for */
 		if (keys_cmp(c, &znode->zbranch[n].key, key) < 0)
 			break;
@@ -3278,7 +3278,7 @@ static struct ubifs_znode *lookup_znode(struct ubifs_info *c,
 		/* Check it */
 		if (znode->zbranch[n].lnum == lnum &&
 		    znode->zbranch[n].offs == offs)
-			return get_znode(c, znode, n);
+			return ubifs_get_znode(c, znode, n);
 		/* Stop if the key is greater than the one we are looking for */
 		if (keys_cmp(c, &znode->zbranch[n].key, key) > 0)
 			break;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index fc7e05718fea..a29e5c3dd1fb 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1820,6 +1820,8 @@ int ubifs_find_dirty_idx_leb(struct ubifs_info *c);
 int ubifs_save_dirty_idx_lnums(struct ubifs_info *c);
 
 /* tnc.c */
+struct ubifs_znode *ubifs_get_znode(struct ubifs_info *c,
+				    struct ubifs_znode *znode, int n);
 int ubifs_lookup_level0(struct ubifs_info *c, const union ubifs_key *key,
 			struct ubifs_znode **zn, int *n);
 int ubifs_tnc_lookup_nm(struct ubifs_info *c, const union ubifs_key *key,
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
