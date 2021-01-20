Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B14AC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 13:14:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A17A22210
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 13:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A17A22210
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8D7aVN4GDZGUXhFnEzCWPvzyLnjYa4/4Wc8sa9LbdEg=; b=taPUi0zSl8P72fuhyrqZEK/oOW
	PcDDzR6JrXL+oSBHaS22vPs/MXLNYF80VuQ5boLgUG9hHSpE0+VxSJkoJyP6MeIDecNuCSz0YhSXK
	On3v/IHb5nx2xmduyBf4WRBBJ7FGy9CQVYNgGE2ywenoYtEKrkZ1IT/zdIjeAW4aQapNJCkMzDSN1
	d/HLG33f5Cz6fR61lV/5JZ1kVm7I4HjPnHTDOMR0E0vFFQKfIpa8Fe3O+H0FbxqeEpwn1E3+DABRP
	byVKITPJaajkJNxaqWvtDc4a8KVfWYaUbCD0BxyVT7bA7PyFAJDmxG5Tvwk545285Nq0PEeH0ZoRc
	/3m48tGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2DIM-0007VS-Tr; Wed, 20 Jan 2021 13:13:10 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2DIK-0007Rh-Q4
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 13:13:09 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2DI8-0000AU-HS; Wed, 20 Jan 2021 14:12:56 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2DI7-0006sg-UJ; Wed, 20 Jan 2021 14:12:55 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: Fix off-by-one error
Date: Wed, 20 Jan 2021 14:12:53 +0100
Message-Id: <20210120131253.26411-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_081308_888991_C3ED8C90 
X-CRM114-Status: GOOD (  15.26  )
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
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

An inode is allowed to have ubifs_xattr_max_cnt() xattrs, so we must
complain only when an inode has more xattrs, having exactly
ubifs_xattr_max_cnt() xattrs is fine.
With this the maximum number of xattrs can be created without hitting
the "has too many xattrs" warning when removing it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/journal.c | 2 +-
 fs/ubifs/xattr.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 091c2ad8f211..7927dea2baba 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -881,7 +881,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 		struct inode *xino;
 		struct ubifs_dent_node *xent, *pxent = NULL;
 
-		if (ui->xattr_cnt >= ubifs_xattr_max_cnt(c)) {
+		if (ui->xattr_cnt > ubifs_xattr_max_cnt(c)) {
 			ubifs_err(c, "Cannot delete inode, it has too much xattrs!");
 			goto out_release;
 		}
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index a0b9b349efe6..842d5f14545d 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -498,7 +498,7 @@ int ubifs_purge_xattrs(struct inode *host)
 	struct fscrypt_name nm = {0};
 	int err;
 
-	if (ubifs_inode(host)->xattr_cnt < ubifs_xattr_max_cnt(c))
+	if (ubifs_inode(host)->xattr_cnt <= ubifs_xattr_max_cnt(c))
 		return 0;
 
 	ubifs_warn(c, "inode %lu has too many xattrs, doing a non-atomic deletion",
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
