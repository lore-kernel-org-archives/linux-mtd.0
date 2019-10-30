Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EEDCA9EC5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 15:28:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21E7E2087E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 15:28:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VtdTcgEi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21E7E2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJNM/St4iLoXOIts7Ct26lImXYYydKeHg1qUUk6cClI=; b=VtdTcgEiBP/HXm
	J/zbeA7RE4AR1hix/Sv9d/+dFZTNH3Kp7XK4+Ml2p6jrBZP/0JmIGBsge/KVaMB0ddq1py7FZP0eP
	fvR9O6CjIKjFdWY+4ISBZIw8/9MdPGrWAA78dgHk1SxdJEdl76eDtQjvJ/FvyW91ol8SRDH/dMrkk
	TKWwAMluUQzq+vNknE6vs+VOXzZ3CwjUizwYKcAkj5OPauoPF5sjz9EWDxpOsO7Gd+jwcUm3GO0Vc
	755Go6Epw8Or6L9V8wO4Qvxkfocf9zpqC2ZTsrX4mQDtS9FvzIv0WWpFTl7X2VcdL9sWel8mrHMcE
	MZi1u0EsuQD40379o5kQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPptq-0006x7-E7; Wed, 30 Oct 2019 15:28:42 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPpsg-0005qj-EN
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 15:27:33 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iPpsG-0003Y1-Ol; Wed, 30 Oct 2019 16:27:04 +0100
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iPpsF-0005nA-Sp; Wed, 30 Oct 2019 16:27:03 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 03/10] quota: Introduce dquot_enable_sb()
Date: Wed, 30 Oct 2019 16:26:55 +0100
Message-Id: <20191030152702.14269-4-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191030152702.14269-1-s.hauer@pengutronix.de>
References: <20191030152702.14269-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_082730_540907_6674F8AF 
X-CRM114-Status: GOOD (  12.06  )
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

To support filesystems that do not store the quota informations in an
inode create dquot_enable_sb(). This is a variant of dquot_enable()
which takes a superblock instead of an inode This is a variant of
dquot_enable() which takes a superblock instead of an inode.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/quota/dquot.c         | 21 +++++++++++++++++----
 include/linux/quotaops.h |  2 ++
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
index bbe3be21ff43..93bcdb83b69a 100644
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c
@@ -2473,11 +2473,9 @@ EXPORT_SYMBOL(dquot_quota_on);
  * More powerful function for turning on quotas allowing setting
  * of individual quota flags
  */
-int dquot_enable(struct inode *inode, int type, int format_id,
-		 unsigned int flags)
+static int __dquot_enable(struct super_block *sb, struct inode *inode,
+			  int type, int format_id, unsigned int flags)
 {
-	struct super_block *sb = inode->i_sb;
-
 	/* Just unsuspend quotas? */
 	BUG_ON(flags & DQUOT_SUSPENDED);
 	/* s_umount should be held in exclusive mode */
@@ -2502,8 +2500,23 @@ int dquot_enable(struct inode *inode, int type, int format_id,
 
 	return vfs_load_quota_inode(sb, inode, type, format_id, flags);
 }
+
+int dquot_enable(struct inode *inode, int type, int format_id,
+		 unsigned int flags)
+{
+	struct super_block *sb = inode->i_sb;
+
+	return __dquot_enable(sb, inode, type, format_id, flags);
+}
 EXPORT_SYMBOL(dquot_enable);
 
+int dquot_enable_sb(struct super_block *sb, int type,
+		    int format_id, unsigned int flags)
+{
+	return __dquot_enable(sb, NULL, type, format_id, flags);
+}
+EXPORT_SYMBOL(dquot_enable_sb);
+
 /*
  * This function is used when filesystem needs to initialize quotas
  * during mount time.
diff --git a/include/linux/quotaops.h b/include/linux/quotaops.h
index 185d94829701..9c0f76e5e0b1 100644
--- a/include/linux/quotaops.h
+++ b/include/linux/quotaops.h
@@ -89,6 +89,8 @@ int dquot_file_open(struct inode *inode, struct file *file);
 
 int dquot_enable(struct inode *inode, int type, int format_id,
 	unsigned int flags);
+int dquot_enable_sb(struct super_block *sb, int type, int format_id,
+		    unsigned int flags);
 int dquot_quota_on(struct super_block *sb, int type, int format_id,
 	const struct path *path);
 int dquot_quota_on_mount(struct super_block *sb, char *qf_name,
-- 
2.24.0.rc1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
