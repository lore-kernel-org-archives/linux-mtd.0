Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D6BCA9EC5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 15:28:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2DCF2087E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 15:28:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="igVfKMe6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2DCF2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8S0y8Ua6g3Q6AHXgMyZ6lIrefR2jMFDjGt56Kr5nzK8=; b=igVfKMe6gvl7bI
	uWoP1t1zmEtS8FGO+mJv/i485TQQB3TLuKaRCFJa60RPJfPimVkndgS1LuNXdWzIA4yRccIkTJc48
	e1mIvSzAj7RcXsNkI1NAtgP5tQpxoRVfRT9t2VcXlYx0AMurVaeMNaWLjymktZ5E6MDJCqW9C5Wq0
	F63aQJei9GPyataWgSxh0YaJF09EmMvG0t/lTpPiRBpirdtITWi5LpOMMXQGgEjnY8lplzl3yONYu
	cvLG/drfskLSD37h4AAK+KG+mKBCzkIMhdFBsTW0+ozwSh4UglSFXWl+7ZZ1Vbw8ig5Mp6FC7oaiH
	Nm5hCpQ31gUa2leNUbNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPpu7-0007FT-7C; Wed, 30 Oct 2019 15:28:59 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPpso-0005y9-QE
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 15:27:40 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iPpsG-0003Xz-Or; Wed, 30 Oct 2019 16:27:04 +0100
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iPpsF-0005n4-R5; Wed, 30 Oct 2019 16:27:03 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 01/10] quota: Make inode optional
Date: Wed, 30 Oct 2019 16:26:53 +0100
Message-Id: <20191030152702.14269-2-s.hauer@pengutronix.de>
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
X-CRM114-CacheID: sfid-20191030_082738_849348_C29D1271 
X-CRM114-Status: GOOD (  13.99  )
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

To add support for filesystems which do not store quota informations in
an inode make the inode optional.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/quota/dquot.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
index 6e826b454082..59f31735fe79 100644
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c
@@ -2313,11 +2313,11 @@ static int vfs_load_quota_inode(struct inode *inode, int type, int format_id,
 
 	if (!fmt)
 		return -ESRCH;
-	if (!S_ISREG(inode->i_mode)) {
+	if (inode && !S_ISREG(inode->i_mode)) {
 		error = -EACCES;
 		goto out_fmt;
 	}
-	if (IS_RDONLY(inode)) {
+	if (inode && IS_RDONLY(inode)) {
 		error = -EROFS;
 		goto out_fmt;
 	}
@@ -2352,7 +2352,7 @@ static int vfs_load_quota_inode(struct inode *inode, int type, int format_id,
 		invalidate_bdev(sb->s_bdev);
 	}
 
-	if (!(dqopt->flags & DQUOT_QUOTA_SYS_FILE)) {
+	if (inode && !(dqopt->flags & DQUOT_QUOTA_SYS_FILE)) {
 		/* We don't want quota and atime on quota files (deadlocks
 		 * possible) Also nobody should write to the file - we use
 		 * special IO operations which ignore the immutable bit. */
@@ -2367,9 +2367,13 @@ static int vfs_load_quota_inode(struct inode *inode, int type, int format_id,
 	}
 
 	error = -EIO;
-	dqopt->files[type] = igrab(inode);
-	if (!dqopt->files[type])
-		goto out_file_flags;
+
+	if (inode) {
+		dqopt->files[type] = igrab(inode);
+		if (!dqopt->files[type])
+			goto out_file_flags;
+	}
+
 	error = -EINVAL;
 	if (!fmt->qf_ops->check_quota_file(sb, type))
 		goto out_file_init;
@@ -2397,11 +2401,14 @@ static int vfs_load_quota_inode(struct inode *inode, int type, int format_id,
 	return error;
 out_file_init:
 	dqopt->files[type] = NULL;
-	iput(inode);
+	if (inode)
+		iput(inode);
 out_file_flags:
-	inode_lock(inode);
-	inode->i_flags &= ~S_NOQUOTA;
-	inode_unlock(inode);
+	if (inode) {
+		inode_lock(inode);
+		inode->i_flags &= ~S_NOQUOTA;
+		inode_unlock(inode);
+	}
 out_fmt:
 	put_quota_format(fmt);
 
@@ -2800,8 +2807,10 @@ int dquot_get_state(struct super_block *sb, struct qc_state *state)
 			tstate->flags |= QCI_LIMITS_ENFORCED;
 		tstate->spc_timelimit = mi->dqi_bgrace;
 		tstate->ino_timelimit = mi->dqi_igrace;
-		tstate->ino = dqopt->files[type]->i_ino;
-		tstate->blocks = dqopt->files[type]->i_blocks;
+		if (dqopt->files[type]) {
+			tstate->ino = dqopt->files[type]->i_ino;
+			tstate->blocks = dqopt->files[type]->i_blocks;
+		}
 		tstate->nextents = 1;	/* We don't know... */
 		spin_unlock(&dq_data_lock);
 	}
-- 
2.24.0.rc1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
