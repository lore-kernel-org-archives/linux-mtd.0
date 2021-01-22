Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2F4C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 21:23:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E0C23AF8
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 21:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91E0C23AF8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IyGgkYnSN6yOV49FhHy8KdFme52IloXVhNJSXp+vvK4=; b=0lXMkiA1QAqkFzV2p6uvCfe56
	RiVlso7BDNxeIB1uUH1OTl9Hdq+YtXpyaLHZA5g1zMafcr/Lpif+UsPEwDytqJ3X2/rE4P2o/KvfK
	WFk1cF5vq8rQKaWHgOy+QZg4NlySMuZ4fnFB4dERJfGhyImt7+veQ/W3JZvHydjem12e5gWCL7Xlx
	OFrTyB2TDHz8AcsaKxRXTffg3VjpUD07xGnPFp9SzHyyb8FtC/nsMcQUd/me3x7KQQAfzrJWjO9bl
	Yot/Hl5Ldt4tov6wPdbAx0YEKvS5vuix96M5rjP2VqEPh+Xoz0wVxgrLEdCGW8k3ysRGVuI5Oclvj
	ctbPFJK4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l33tI-0002E3-8Q; Fri, 22 Jan 2021 21:22:48 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l33t9-0002Br-J3
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2021 21:22:42 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 2D753181CBE03;
 Fri, 22 Jan 2021 22:22:35 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id sQ4Lpq5mXoJP; Fri, 22 Jan 2021 22:22:34 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vxMwvqs7u1ha; Fri, 22 Jan 2021 22:22:34 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] ubifs: Correctly set inode size in ubifs_link()
Date: Fri, 22 Jan 2021 22:22:26 +0100
Message-Id: <20210122212229.17072-2-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122212229.17072-1-richard@nod.at>
References: <20210122212229.17072-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_162240_103070_31C41F3C 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: richard@nod.at, david@sigma-star.at, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We need to use fscrypt filename handling wrappers
when calculating the size of a directory entry, otherwise
UBIFS will report the wrong value (size of plain instead of cihper text)
for st_size of a directory if fscrypt is enabled.

Cc: stable@vger.kernel.org
Fixes: f4f61d2cc6d8 ("ubifs: Implement encrypted filenames")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 9a6b8660425a..04912dedca48 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -693,7 +693,7 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	struct inode *inode = d_inode(old_dentry);
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	struct ubifs_inode *dir_ui = ubifs_inode(dir);
-	int err, sz_change = CALC_DENT_SIZE(dentry->d_name.len);
+	int err, sz_change;
 	struct ubifs_budget_req req = { .new_dent = 1, .dirtied_ino = 2,
 				.dirtied_ino_d = ALIGN(ui->data_len, 8) };
 	struct fscrypt_name nm;
@@ -731,6 +731,8 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	if (inode->i_nlink == 0)
 		ubifs_delete_orphan(c, inode->i_ino);
 
+	sz_change = CALC_DENT_SIZE(fname_len(&nm));
+
 	inc_nlink(inode);
 	ihold(inode);
 	inode->i_ctime = current_time(inode);
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
