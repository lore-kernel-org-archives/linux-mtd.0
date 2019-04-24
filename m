Return-Path: <SRS0=0gGT=S2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E30C10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 14:50:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2648021905
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 14:50:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RA3pB5dm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fb4EAdPt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2648021905
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iEatty/rMe/PPBFnz3+IGF9hOE2BNcuhdxlX4PyuoCY=; b=RA3pB5dm4MGxXM
	VbSm5znr+0lk80iP5iLrzpJ9x0jO/Rn7igzI7ItdASkxYYE/mFKz3Rjd4Qlx3+XrNagFINSzTu5kx
	EwFjJCGFvXcXBPzRg4HqjOrOw+3fdeVmCNltfvk2qrvGQm3myyB9hvzpq8VHX3sZyM55ZyZCsjwer
	C7Tr1ck8zdE6bAd3NR22wJ4VGpyz+dyYH/HUNoPrFUgR20xuGXPAtX/ED5FYv/oEKpJrYsxE+qn8H
	r0LhNXx54G6Ku74JwxLXBN1jZ2kzR7vcJHVaRnsnCldbxCdY472GzseroQxD6EAHS0DwoYbXXfxjr
	PrCDioHw3mf2gsaZNBZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJJEX-0000iC-Pn; Wed, 24 Apr 2019 14:50:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJJEU-0000hH-Id
 for linux-mtd@lists.infradead.org; Wed, 24 Apr 2019 14:50:47 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7789218FE;
 Wed, 24 Apr 2019 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556117446;
 bh=YIQAdVhr0apGzBMl/aEiIDksJZKPdoyWLEB/z7exXT4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fb4EAdPtLKta6QKtKAU3AXjaq7RNYvxHXqgTZk+YiUX4d/bbNMdVl7Dx07LgJ1cIi
 ADNPFvfFOASVfKFJbbR9fAtax6wa96PGE2itGo5Z5qNbR2gNZEoRre3S51C7jE4siZ
 WE3k5zm1RmgZt7RHgXPTQsMIb2h9VZTsGF+cktEw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 14/28] jffs2: fix use-after-free on symlink
 traversal
Date: Wed, 24 Apr 2019 10:49:58 -0400
Message-Id: <20190424145012.30886-14-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190424145012.30886-1-sashal@kernel.org>
References: <20190424145012.30886-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_075046_629064_6AB99788 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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
Cc: Sasha Levin <sashal@kernel.org>, linux-mtd@lists.infradead.org,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Al Viro <viro@zeniv.linux.org.uk>

[ Upstream commit 4fdcfab5b5537c21891e22e65996d4d0dd8ab4ca ]

free the symlink body after the same RCU delay we have for freeing the
struct inode itself, so that traversal during RCU pathwalk wouldn't step
into freed memory.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/jffs2/readinode.c | 5 -----
 fs/jffs2/super.c     | 5 ++++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 06a71dbd4833..2f236cca6095 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1414,11 +1414,6 @@ void jffs2_do_clear_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f)
 
 	jffs2_kill_fragtree(&f->fragtree, deleted?c:NULL);
 
-	if (f->target) {
-		kfree(f->target);
-		f->target = NULL;
-	}
-
 	fds = f->dents;
 	while(fds) {
 		fd = fds;
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 226640563df3..76aedbc97773 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -47,7 +47,10 @@ static struct inode *jffs2_alloc_inode(struct super_block *sb)
 static void jffs2_i_callback(struct rcu_head *head)
 {
 	struct inode *inode = container_of(head, struct inode, i_rcu);
-	kmem_cache_free(jffs2_inode_cachep, JFFS2_INODE_INFO(inode));
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+
+	kfree(f->target);
+	kmem_cache_free(jffs2_inode_cachep, f);
 }
 
 static void jffs2_destroy_inode(struct inode *inode)
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
