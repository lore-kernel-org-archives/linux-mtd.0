Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C968C48260
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 09:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s44+FagVSPtFUF3zbxldWb8P9ypT3g4nNl3Lk8+0gaE=; b=pBY+gC8IuRuVk/
	P1lOzTBsYdwH44lEp0TCLtcU8JuSMuTdMxJ4RSELbbo9J0fOxFMuHMZQptRev2yTwLcrCZhe1TxLA
	isQK7z+2We0uZKoTETy2xKNRH3Z2MQt6W0XN2EzSZJopZ7xVEYEgdqQ+QPqEDqplyBfx5Qh50UuNs
	glESz+YzCFSyY/d4YlMrDLQ+udcmqefJzONjzu/jtuR0EEQFaGY2XCY73JNLTkRSl7e3jwGJCFJn0
	cwyATuwCOaYI3+2ntS1WXI1fw5xAl0MYU4vnnhRnyISMoLtx81Ng7X3EYcq+gNMJIDo0RSmd5I3Ns
	3PVul6wAB0MsPeAmlA9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpUo-00000008hmT-3eOX;
	Tue, 13 Feb 2024 09:54:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpUl-00000008hlH-2OWb
	for linux-mtd@lists.infradead.org;
	Tue, 13 Feb 2024 09:54:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA9ED61333;
	Tue, 13 Feb 2024 09:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8A4C433F1;
	Tue, 13 Feb 2024 09:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707818067;
	bh=a/+zm9TK2gFwduZGHY8tOoqlh5IFNkxyekCp8Kj3vNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d0jX4YQqsFpBUFVUwJ0jlProFRRBqVM13YzAweJwe7L/sp+YDfbSrSlcEOQ3oPtiG
	 3p6aLorkXyU6m6E+SfWhpxrrwWHE0aaYGYEpc2j3sEmh/HBGjjU3JzvbIq5ydTzj4m
	 bR7xFazpb9XLFFtKwr+LHzYzVghqOKaLzmpTiS6Ce7XW5/WsOdFKRe7jkeHgXtRx+i
	 P3Q3FvH8eHlgyizzUF0UbpftuMi4WpyS3WDn3IxX+7leza+YlcPTbBSQc94C6OeyHg
	 G383gV534kiPIcmo/r83es031BqrUR84VS6SpDq3hkrf83vtSYxMSs34HDirGPjXr7
	 AbCdFw6V0OUTg==
From: Arnd Bergmann <arnd@kernel.org>
To: Richard Weinberger <richard@nod.at>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 2/2] ubifs: fix function pointer cast warnings
Date: Tue, 13 Feb 2024 10:54:08 +0100
Message-Id: <20240213095412.453787-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240213095412.453787-1-arnd@kernel.org>
References: <20240213095412.453787-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_015431_726154_0447E136 
X-CRM114-Status: GOOD (  12.63  )
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

From: Arnd Bergmann <arnd@arndb.de>

ubifs has a number of callback functions for ubifs_lpt_scan_nolock() using
two different prototypes, either passing a struct scan_data or
a struct ubifs_lp_stats, but the caller expects a void pointer instead.

clang-16 now warns about this:

fs/ubifs/find.c:170:9: error: cast from 'int (*)(struct ubifs_info *, const struct ubifs_lprops *, int, struct scan_data *)' to 'ubifs_lpt_scan_callback' (aka 'int (*)(struct ubifs_info *, const struct ubifs_lprops *, int, void *)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  170 |                                     (ubifs_lpt_scan_callback)scan_for_dirty_cb,
      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fs/ubifs/find.c:449:9: error: cast from 'int (*)(struct ubifs_info *, const struct ubifs_lprops *, int, struct scan_data *)' to 'ubifs_lpt_scan_callback' (aka 'int (*)(struct ubifs_info *, const struct ubifs_lprops *, int, void *)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  449 |                                     (ubifs_lpt_scan_callback)scan_for_free_cb,
      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Change all of these callback functions to actually take the void * argument
that is passed by their caller.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/ubifs/find.c   | 23 ++++++++++++-----------
 fs/ubifs/lprops.c |  6 +++---
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index 1cb79b167a4f..6ebf3c04ac5f 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -82,8 +82,9 @@ static int valuable(struct ubifs_info *c, const struct ubifs_lprops *lprops)
  */
 static int scan_for_dirty_cb(struct ubifs_info *c,
 			     const struct ubifs_lprops *lprops, int in_tree,
-			     struct scan_data *data)
+			     void *arg)
 {
+	struct scan_data *data = arg;
 	int ret = LPT_SCAN_CONTINUE;
 
 	/* Exclude LEBs that are currently in use */
@@ -166,8 +167,7 @@ static const struct ubifs_lprops *scan_for_dirty(struct ubifs_info *c,
 	data.pick_free = pick_free;
 	data.lnum = -1;
 	data.exclude_index = exclude_index;
-	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum,
-				    (ubifs_lpt_scan_callback)scan_for_dirty_cb,
+	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum, scan_for_dirty_cb,
 				    &data);
 	if (err)
 		return ERR_PTR(err);
@@ -349,8 +349,9 @@ int ubifs_find_dirty_leb(struct ubifs_info *c, struct ubifs_lprops *ret_lp,
  */
 static int scan_for_free_cb(struct ubifs_info *c,
 			    const struct ubifs_lprops *lprops, int in_tree,
-			    struct scan_data *data)
+			    void *arg)
 {
+	struct scan_data *data = arg;
 	int ret = LPT_SCAN_CONTINUE;
 
 	/* Exclude LEBs that are currently in use */
@@ -446,7 +447,7 @@ const struct ubifs_lprops *do_find_free_space(struct ubifs_info *c,
 	data.pick_free = pick_free;
 	data.lnum = -1;
 	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum,
-				    (ubifs_lpt_scan_callback)scan_for_free_cb,
+				    scan_for_free_cb,
 				    &data);
 	if (err)
 		return ERR_PTR(err);
@@ -589,8 +590,9 @@ int ubifs_find_free_space(struct ubifs_info *c, int min_space, int *offs,
  */
 static int scan_for_idx_cb(struct ubifs_info *c,
 			   const struct ubifs_lprops *lprops, int in_tree,
-			   struct scan_data *data)
+			   void *arg)
 {
+	struct scan_data *data = arg;
 	int ret = LPT_SCAN_CONTINUE;
 
 	/* Exclude LEBs that are currently in use */
@@ -625,8 +627,7 @@ static const struct ubifs_lprops *scan_for_leb_for_idx(struct ubifs_info *c)
 	int err;
 
 	data.lnum = -1;
-	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum,
-				    (ubifs_lpt_scan_callback)scan_for_idx_cb,
+	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum, scan_for_idx_cb,
 				    &data);
 	if (err)
 		return ERR_PTR(err);
@@ -781,8 +782,9 @@ int ubifs_save_dirty_idx_lnums(struct ubifs_info *c)
  */
 static int scan_dirty_idx_cb(struct ubifs_info *c,
 			   const struct ubifs_lprops *lprops, int in_tree,
-			   struct scan_data *data)
+			   void *arg)
 {
+	struct scan_data *data = arg;
 	int ret = LPT_SCAN_CONTINUE;
 
 	/* Exclude LEBs that are currently in use */
@@ -841,8 +843,7 @@ static int find_dirty_idx_leb(struct ubifs_info *c)
 	if (c->pnodes_have >= c->pnode_cnt)
 		/* All pnodes are in memory, so skip scan */
 		return -ENOSPC;
-	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum,
-				    (ubifs_lpt_scan_callback)scan_dirty_idx_cb,
+	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum, scan_dirty_idx_cb,
 				    &data);
 	if (err)
 		return err;
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 6d6cd85c2b4c..a11c3dab7e16 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -1014,8 +1014,9 @@ void dbg_check_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat,
  */
 static int scan_check_cb(struct ubifs_info *c,
 			 const struct ubifs_lprops *lp, int in_tree,
-			 struct ubifs_lp_stats *lst)
+			 void *arg)
 {
+	struct ubifs_lp_stats *lst = arg;
 	struct ubifs_scan_leb *sleb;
 	struct ubifs_scan_node *snod;
 	int cat, lnum = lp->lnum, is_idx = 0, used = 0, free, dirty, ret;
@@ -1269,8 +1270,7 @@ int dbg_check_lprops(struct ubifs_info *c)
 
 	memset(&lst, 0, sizeof(struct ubifs_lp_stats));
 	err = ubifs_lpt_scan_nolock(c, c->main_first, c->leb_cnt - 1,
-				    (ubifs_lpt_scan_callback)scan_check_cb,
-				    &lst);
+				    scan_check_cb, &lst);
 	if (err && err != -ENOSPC)
 		goto out;
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
