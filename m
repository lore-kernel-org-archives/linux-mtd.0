Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7686AC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 21:23:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 094B323AF8
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 21:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 094B323AF8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YSXvrWWD8/efNrDpVF07oyhMYM+8WS/AGWmia+1P+U4=; b=OigI/w7D/Ac+J/XsYNiLFmnb6
	FsI0rcAVeddPvNIlUHtbYP/yOneJG52FjXG4b6sBiMhgqo1rnX/+pgowXUu8SMw/7Il4mCXx1gcHa
	m8xPpoQl6qAyQJkWGVSuvkA+kPXhQPvF8hnCECMGu6dQO72KDae/gOwPk3c1vFKekRkX+aps3QOsk
	xzyLugN4t3Cc6v7CX9RukLppri7kxYK38LIWLzbcVLEJwSRJUgjyJVLzdqCxvDyvpQgBHxJozP7Ey
	DZNr4NXO6SLEzkH2Ti4U+b0nG4fXksKnAcM9SWnc5moGyq4YeRHJ/bjoT1B0Ge1WJCKHy0MZRJglS
	pQ+NdRrZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l33tL-0002ET-BS; Fri, 22 Jan 2021 21:22:51 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l33t9-0002Bw-Jv
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2021 21:22:42 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 2197D181CBE08;
 Fri, 22 Jan 2021 22:22:36 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8QZnjaY9GVmZ; Fri, 22 Jan 2021 22:22:35 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5sE-lpCPrN4m; Fri, 22 Jan 2021 22:22:35 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] ubifs: Harden ubifs_jnl_write_inode()
Date: Fri, 22 Jan 2021 22:22:29 +0100
Message-Id: <20210122212229.17072-5-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122212229.17072-1-richard@nod.at>
References: <20210122212229.17072-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_162240_104725_DE499C2E 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, david@sigma-star.at, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Make sure that ubifs_jnl_write_inode() cannot be abused and will
not write less data then expected.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 03410ae0813a..1b28fcc5b9fe 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -844,10 +844,12 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 	struct ubifs_ino_node *ino, *ino_start;
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	int sync = 0, write_len = 0, ilen = UBIFS_INO_NODE_SZ;
-	int last_reference = !inode->i_nlink;
+	int last_reference = !inode->i_nlink, xattr_inos_written = 0;
 	int kill_xattrs = ui->xattr_cnt && last_reference;
 	u8 hash[UBIFS_HASH_ARR_SZ];
 
+	ubifs_assert(c, !ui->xattr);
+
 	dbg_jnl("ino %lu, nlink %u", inode->i_ino, inode->i_nlink);
 
 	/*
@@ -917,12 +919,14 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 			pack_inode(c, ino, xino, 0);
 			ino = (void *)ino + UBIFS_INO_NODE_SZ;
 			iput(xino);
+			xattr_inos_written++;
 
 			kfree(pxent);
 			pxent = xent;
 			key_read(c, &xent->key, &key);
 		}
 		kfree(pxent);
+		ubifs_assert(c, xattr_inos_written == ui->xattr_cnt);
 	}
 
 	pack_inode(c, ino, inode, 1);
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
