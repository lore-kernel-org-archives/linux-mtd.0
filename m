Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C9DC04E53
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 20:31:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 151F82070D
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 20:31:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jk7HV72s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 151F82070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=kVTzEpja3cuGRuB0wmIGCbYAKEvSXR9XX2/Vn4VFa/4=; b=jk7
	HV72sSox4eKfkxxio/w+LUYbPy/A0OryP6OfigROka6FImX0hhzbrWGr4DrEDvdlK66NuAPRnAGHc
	Fh+VeiPxEq3fDnfTIzcQ9QvNoKZSSafwOIOT6IMKReDRrH7z5wVdqvHAdqh0fnd1GNm50m+Fm/yzW
	G32l8zKjEn+icfjczrZ8WgCvYLuZ3m8oppb4KPFoPWys63bOR24AUGLcSiU1b9QhVBw4uVxkGyT97
	4pOnX/Sxn8lLWSgK5Y8pZp5vLuiDeedWp306cylHjPSiBdYZNSMBtthTU6KRTA159ZRmUagB0BMaS
	hKDjfp3FKgbfaSKUf1bS59JX9Ml+nEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR0Yg-0000U8-4g; Wed, 15 May 2019 20:31:26 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR0Yc-0000T9-3N
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 20:31:23 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 5E18B1801442F;
 Wed, 15 May 2019 22:31:20 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: Check link count of inodes when killing orphans.
Date: Wed, 15 May 2019 22:31:13 +0200
Message-Id: <20190515203113.19398-1-richard@nod.at>
X-Mailer: git-send-email 2.16.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_133122_287786_E1B00248 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

O_TMPFILE files can change their link count back to non-zero.
This corner case needs to get addressed in the orphans subsystem
too.

Fixes: 474b93704f32 ("ubifs: Implement O_TMPFILE")
Reported-by: Lars Persson <lists@bofh.nu>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/orphan.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 2f1618f300fb..575c36dfd751 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -642,6 +642,7 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 {
 	struct ubifs_scan_node *snod;
 	struct ubifs_orph_node *orph;
+	struct ubifs_ino_node *ino = NULL;
 	unsigned long long cmt_no;
 	ino_t inum;
 	int i, n, err, first = 1;
@@ -688,23 +689,40 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 		if (first)
 			first = 0;
 
+		ino = kmalloc(UBIFS_MAX_INO_NODE_SZ, GFP_NOFS);
+		if (!ino)
+			return -ENOMEM;
+
 		n = (le32_to_cpu(orph->ch.len) - UBIFS_ORPH_NODE_SZ) >> 3;
 		for (i = 0; i < n; i++) {
 			union ubifs_key key1, key2;
 
 			inum = le64_to_cpu(orph->inos[i]);
-			dbg_rcvry("deleting orphaned inode %lu",
-				  (unsigned long)inum);
 
-			lowest_ino_key(c, &key1, inum);
-			highest_ino_key(c, &key2, inum);
-
-			err = ubifs_tnc_remove_range(c, &key1, &key2);
+			ino_key_init(c, &key1, inum);
+			err = ubifs_tnc_lookup(c, &key1, ino);
 			if (err)
-				return err;
+				goto out_free;
+
+			/*
+			 * Check whether an inode can really get deleted.
+			 * linkat() with O_TMPFILE allows rebirth of an inode.
+			 */
+			if (ino->nlink == 0) {
+				dbg_rcvry("deleting orphaned inode %lu",
+					  (unsigned long)inum);
+
+				lowest_ino_key(c, &key1, inum);
+				highest_ino_key(c, &key2, inum);
+
+				err = ubifs_tnc_remove_range(c, &key1, &key2);
+				if (err)
+					goto out_err;
+			}
+
 			err = insert_dead_orphan(c, inum);
 			if (err)
-				return err;
+				goto out_err;
 		}
 
 		*last_cmt_no = cmt_no;
@@ -716,7 +734,10 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 			*last_flagged = 0;
 	}
 
-	return 0;
+	err = 0;
+out_free:
+	kfree(ino);
+	return err;
 }
 
 /**
-- 
2.16.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
