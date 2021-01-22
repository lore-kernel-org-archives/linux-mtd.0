Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FF7C433E9
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 21:23:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C30DB23AF8
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 21:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C30DB23AF8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8yNKEXg+cUFL3qTT6I5/ovibxpyir4A2k4Z/1cmElz0=; b=EDs5W+Gq6FloW0MOG5ujrp/sV
	ek9g7fsAuc2ICQh86Xn90VD3IeLGez0Am+R01TRUckn5hv65XOzeTdlH3XortvYyAHmFX/Ytnr4rx
	JqJptux5Ces+fxRoFtNixewobM/37y//oRzWwLYpU1jqq6NAgi2++O3pjGZ+FbnnRDiNU9+3jDDU5
	37IZTHO+mTOyA87IEdyWZmyYEjIuQg8Yf+pwr4cytkhmP/jjB26qjW74A8G/VC7I0OvwxRZ6AJfS8
	YFq8YUoKcQrddrh1Maz0qxonSTEuqHdikV7lxQ0jzDyeJcMyIr/melUvqztftMCeJnA1/TLY5QTmC
	u8d6YGgYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l33tF-0002Di-OH; Fri, 22 Jan 2021 21:22:45 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l33t9-0002Bu-LX
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2021 21:22:41 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id AD32B181CBE05;
 Fri, 22 Jan 2021 22:22:35 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gZrYYPdzlWYm; Fri, 22 Jan 2021 22:22:35 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id U1pPPa_0HFNy; Fri, 22 Jan 2021 22:22:35 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] ubifs: Update directory size when creating whiteouts
Date: Fri, 22 Jan 2021 22:22:28 +0100
Message-Id: <20210122212229.17072-4-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122212229.17072-1-richard@nod.at>
References: <20210122212229.17072-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_162240_106559_3DCD91E8 
X-CRM114-Status: UNSURE (   9.48  )
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
Cc: richard@nod.at, david@sigma-star.at, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Although whiteouts are unlinked files they will get re-linked later,
therefore the size of the parent directory needs to be updated too.

Cc: stable@vger.kernel.org
Fixes: 9e0a1fff8db5 ("ubifs: Implement RENAME_WHITEOUT")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 8a34e0118ee9..b5d523e5854f 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -361,6 +361,7 @@ static int do_tmpfile(struct inode *dir, struct dentry *dentry,
 	struct ubifs_budget_req ino_req = { .dirtied_ino = 1 };
 	struct ubifs_inode *ui, *dir_ui = ubifs_inode(dir);
 	int err, instantiated = 0;
+	int sz_change = 0;
 	struct fscrypt_name nm;
 
 	/*
@@ -411,6 +412,8 @@ static int do_tmpfile(struct inode *dir, struct dentry *dentry,
 		mark_inode_dirty(inode);
 		drop_nlink(inode);
 		*whiteout = inode;
+		sz_change = CALC_DENT_SIZE(fname_len(&nm));
+		dir->i_size += sz_change;
 	} else {
 		d_tmpfile(dentry, inode);
 	}
@@ -430,6 +433,7 @@ static int do_tmpfile(struct inode *dir, struct dentry *dentry,
 	return 0;
 
 out_cancel:
+	dir->i_size -= sz_change;
 	mutex_unlock(&dir_ui->ui_mutex);
 out_inode:
 	make_bad_inode(inode);
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
