Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F38C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=haaRNSN2+LAh8zSdN+v2ZN2G+jk9IMKaFURQrxoldhg=; b=biijXyGUB3VEu5
	hDv+jD50gSNynIy0mgoLXO59vot0fSFz/xWnlT3f2eE/GFmws2FHL9jeldTvPA7nhop8PHqeM8acP
	1gFECHvFBEXxzYQm9otS03Eg2lNJQpvaSgpb0fxqYP8BFMsaeNd7Xjzus3+LtsMuBtl6tUWo1Nuur
	u0y1rWJRc0Zrv6N2S0/mT58xxDGj+eVxKMb9d5jl9pWWqLbSzEyHCdLaav/3B3BFZQSZ1WkdX05tX
	c6CXiN+4/RvVuSebJXKUzU/GD82rvmhzw7Vfd3OiYQ6cSx2pmOjgOxWwqlxw7Cj/3O/zILCGkJ9V1
	zfqO1ocZVOMwCo6HZ0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZty-00000000Wig-1BRF;
	Mon, 26 Feb 2024 12:16:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZtu-00000000WhO-20u7
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 12:16:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7019C6115E;
	Mon, 26 Feb 2024 12:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6338C433C7;
	Mon, 26 Feb 2024 12:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708949765;
	bh=dIUCjHoNQgOf5LX5CDqGdhGVPI2lsfrC1oPUtvZVZCo=;
	h=From:To:Cc:Subject:Date:From;
	b=BjE/PJV0v+5zRxcM8rFDX0y0HdQRjazPEjtTatnxIbu0sm1KaPw35w3HvJoJ0Nb4W
	 taKWESXQeBJFOclrjZE9C+Ek2pqnYjj27AdjVVNmxyWmEYZ9++N92Fltmortj0RoqI
	 PGPPJpF8I3P6jCd2wQWPrOSi7NsxUt9cs+SWVXCtEMahNU+mEkO8hKMiejFzbIkaRk
	 BamAkSamVvchgalafebxbjTNkFCl3eDMhcj2F9Qfivm5MMD8kbEe78a74FeSawq/Lg
	 QV3QbkbBR0HryGgeQGJaQYG8oU7XWB9mXGGytrRx1TobkJb0Pz6wKnLMNXiXfaAPKM
	 nMEC7EVaSPxdQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: fix function comment warning
Date: Mon, 26 Feb 2024 13:15:52 +0100
Message-Id: <20240226121600.1267204-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_041606_678592_F955E09A 
X-CRM114-Status: GOOD (  13.13  )
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

My previous fix introduced a new W=1 warning for the kerneldoc style
comments:

fs/ubifs/find.c:86: warning: Function parameter or struct member 'arg' not described in 'scan_for_dirty_cb'

Adjust the comments to the argument names.

Reported-by: Zhihao Cheng <chengzhihao1@huawei.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402261559.cYtMOkIn-lkp@intel.com/
Fixes: ec724e534dfd ("ubifs: fix function pointer cast warnings")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/ubifs/find.c   | 8 ++++----
 fs/ubifs/lprops.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index 6ebf3c04ac5f..643718906b9f 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -73,7 +73,7 @@ static int valuable(struct ubifs_info *c, const struct ubifs_lprops *lprops)
  * @c: the UBIFS file-system description object
  * @lprops: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @data: information passed to and from the caller of the scan
+ * @arg: information passed to and from the caller of the scan
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
@@ -340,7 +340,7 @@ int ubifs_find_dirty_leb(struct ubifs_info *c, struct ubifs_lprops *ret_lp,
  * @c: the UBIFS file-system description object
  * @lprops: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @data: information passed to and from the caller of the scan
+ * @arg: information passed to and from the caller of the scan
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
@@ -581,7 +581,7 @@ int ubifs_find_free_space(struct ubifs_info *c, int min_space, int *offs,
  * @c: the UBIFS file-system description object
  * @lprops: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @data: information passed to and from the caller of the scan
+ * @arg: information passed to and from the caller of the scan
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
@@ -773,7 +773,7 @@ int ubifs_save_dirty_idx_lnums(struct ubifs_info *c)
  * @c: the UBIFS file-system description object
  * @lprops: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @data: information passed to and from the caller of the scan
+ * @arg: information passed to and from the caller of the scan
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index a11c3dab7e16..8788740ec57f 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -1005,7 +1005,7 @@ void dbg_check_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat,
  * @c: the UBIFS file-system description object
  * @lp: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @lst: lprops statistics to update
+ * @arg: lprops statistics to update
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
