Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2686AC10F05
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Dec 2023 17:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8VT0enWAaXy4vp8PS7DTx1nOUGI6pasaSFWxf3+oqUg=; b=MTQrL/rurDauis
	tScxHZnuwslpmUrqrDpNavQleaacMP+djpVY8aGAJT+0wuZfDsGtAOmfdVZfpggg4HKtodxm59/5S
	jqaihFEgoVTrKr3BKYhiuO5Srs1BRirZmplBeWvenR3CLi5vV2e+4WR2YkUi29lUq40yg+kAQmgDc
	6JFoRyRhS4+b26iUxU6gwUdUUbanY57SlG2vV1lJHKzo7Hyo0QQM4tdaULoNUSw1H/YJhejgdHDuF
	z4EEcGJ6SrUFYF/QPD2xVEnkY7WWhnMlnnzQxW/ZgU0cFopRBm/ZmgwaFXUqmzkVVat5RWevsgrlf
	CPTkrqY8W+4EW2IUojdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZHU-0082fJ-0R;
	Tue, 05 Dec 2023 17:32:24 +0000
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZHS-0082ez-1z;
	Tue, 05 Dec 2023 17:32:22 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] jffs2: nodemgmt: fix kernel-doc comments
Date: Tue,  5 Dec 2023 09:32:22 -0800
Message-ID: <20231205173222.12575-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Update the end of one sentence where a comment was truncated. (dwmw2)

Fix a bunch of kernel-doc warnings:

nodemgmt.c:72: warning: Function parameter or member 'sumsize' not described in 'jffs2_do_reserve_space'
nodemgmt.c:72: warning: expecting prototype for jffs2_reserve_space(). Prototype was for jffs2_do_reserve_space() instead
nodemgmt.c:76: warning: Function parameter or member 'sumsize' not described in 'jffs2_reserve_space'
nodemgmt.c:76: warning: No description found for return value of 'jffs2_reserve_space'
nodemgmt.c:503: warning: Function parameter or member 'ofs' not described in 'jffs2_add_physical_node_ref'
nodemgmt.c:503: warning: Function parameter or member 'ic' not described in 'jffs2_add_physical_node_ref'
nodemgmt.c:503: warning: Excess function parameter 'new' description in 'jffs2_add_physical_node_ref'
nodemgmt.c:503: warning: No description found for return value of 'jffs2_add_physical_node_ref'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
---
 fs/jffs2/nodemgmt.c |   24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff -- a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -49,28 +49,31 @@ static int jffs2_rp_can_write(struct jff
 	return 0;
 }
 
+static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize,
+				  uint32_t *len, uint32_t sumsize);
+
 /**
  *	jffs2_reserve_space - request physical space to write nodes to flash
  *	@c: superblock info
  *	@minsize: Minimum acceptable size of allocation
  *	@len: Returned value of allocation length
  *	@prio: Allocation type - ALLOC_{NORMAL,DELETION}
+ *	@sumsize: summary size requested or JFFS2_SUMMARY_NOSUM_SIZE for no summary
+ *
+ *	Requests a block of physical space on the flash.
  *
- *	Requests a block of physical space on the flash. Returns zero for success
- *	and puts 'len' into the appropriate place, or returns -ENOSPC or other 
- *	error if appropriate. Doesn't return len since that's 
+ *	Returns: %0 for success	and puts 'len' into the appropriate place,
+ *	or returns -ENOSPC or other error if appropriate.
+ *	Doesn't return len since that's already returned in @len.
  *
- *	If it returns zero, jffs2_reserve_space() also downs the per-filesystem
+ *	If it returns %0, jffs2_reserve_space() also downs the per-filesystem
  *	allocation semaphore, to prevent more than one allocation from being
- *	active at any time. The semaphore is later released by jffs2_commit_allocation()
+ *	active at any time. The semaphore is later released by jffs2_commit_allocation().
  *
  *	jffs2_reserve_space() may trigger garbage collection in order to make room
  *	for the requested allocation.
  */
 
-static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize,
-				  uint32_t *len, uint32_t sumsize);
-
 int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
 			uint32_t *len, int prio, uint32_t sumsize)
 {
@@ -488,13 +491,16 @@ static int jffs2_do_reserve_space(struct
 /**
  *	jffs2_add_physical_node_ref - add a physical node reference to the list
  *	@c: superblock info
- *	@new: new node reference to add
+ *	@ofs: offset in the block
  *	@len: length of this physical node
+ *	@ic: inode cache pointer
  *
  *	Should only be used to report nodes for which space has been allocated
  *	by jffs2_reserve_space.
  *
  *	Must be called with the alloc_sem held.
+ *
+ *	Returns: pointer to new node on success or -errno code on error
  */
 
 struct jffs2_raw_node_ref *jffs2_add_physical_node_ref(struct jffs2_sb_info *c,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
