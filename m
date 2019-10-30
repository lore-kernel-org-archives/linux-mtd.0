Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0D6CA9EC9
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 15:27:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 691CE208C0
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 15:27:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="md726ET9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 691CE208C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zR7MO8RGTo7eyuglc3kszTekoiNEKKR09QrDXtRThcs=; b=md726ET9gOkzCP
	Tlm1MZ+LBr+g09FlWxzQ2/2ncPqoaiOZGJqtq9aDCoFcDs4BQovxCYry8y1dveIiMGrw4pVnIkoEb
	p+TF2DRC6JmEOgbJzlDdzDr1PGPo52Nbdi18AC2lmVHXuej5TGvgDaV+YeUgVDGVoTquDSMIXZxPc
	K4QkN+7AYLRif2k4sAdJIjVXg2y66auPDcy26+hqzMTJJ1JlC/dcF+tItRw7R20HtOQ+dMSOZMk/G
	//H3oPKTYYjEgsdPHHssO4t9m8+pak3+4iyyUAP8c3umvuj3p6t1VLQF9Pe74fZ76if0mEyH3guGc
	Xzf6JacPRWptUmfrcZ6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPpsL-0005WS-0V; Wed, 30 Oct 2019 15:27:09 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPpsI-0005Vn-6e
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 15:27:07 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iPpsG-0003Y0-Ol; Wed, 30 Oct 2019 16:27:04 +0100
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iPpsF-0005n6-Rl; Wed, 30 Oct 2019 16:27:03 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 02/10] quota: Pass sb to vfs_load_quota_inode()
Date: Wed, 30 Oct 2019 16:26:54 +0100
Message-Id: <20191030152702.14269-3-s.hauer@pengutronix.de>
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
X-CRM114-CacheID: sfid-20191030_082706_245881_7CAD2431 
X-CRM114-Status: GOOD (  12.66  )
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

As a preparation to support filesystems that do not store quota files in
an inode pass the superblock to vfs_load_quota_inode(). With this we no
longer have to get the superblock from the inode and thus the inode
could be NULL.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/quota/dquot.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
index 59f31735fe79..bbe3be21ff43 100644
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c
@@ -2303,11 +2303,11 @@ EXPORT_SYMBOL(dquot_quota_off);
  * Helper function to turn quotas on when we already have the inode of
  * quota file and no quota information is loaded.
  */
-static int vfs_load_quota_inode(struct inode *inode, int type, int format_id,
+static int vfs_load_quota_inode(struct super_block *sb, struct inode *inode,
+				int type, int format_id,
 	unsigned int flags)
 {
 	struct quota_format_type *fmt = find_quota_format(format_id);
-	struct super_block *sb = inode->i_sb;
 	struct quota_info *dqopt = sb_dqopt(sb);
 	int error;
 
@@ -2443,7 +2443,7 @@ int dquot_resume(struct super_block *sb, int type)
 		spin_unlock(&dq_state_lock);
 
 		flags = dquot_generic_flag(flags, cnt);
-		ret = vfs_load_quota_inode(inode, cnt,
+		ret = vfs_load_quota_inode(sb, inode, cnt,
 				dqopt->info[cnt].dqi_fmt_id, flags);
 		iput(inode);
 	}
@@ -2462,7 +2462,7 @@ int dquot_quota_on(struct super_block *sb, int type, int format_id,
 	if (path->dentry->d_sb != sb)
 		error = -EXDEV;
 	else
-		error = vfs_load_quota_inode(d_inode(path->dentry), type,
+		error = vfs_load_quota_inode(sb, d_inode(path->dentry), type,
 					     format_id, DQUOT_USAGE_ENABLED |
 					     DQUOT_LIMITS_ENABLED);
 	return error;
@@ -2500,7 +2500,7 @@ int dquot_enable(struct inode *inode, int type, int format_id,
 		return 0;
 	}
 
-	return vfs_load_quota_inode(inode, type, format_id, flags);
+	return vfs_load_quota_inode(sb, inode, type, format_id, flags);
 }
 EXPORT_SYMBOL(dquot_enable);
 
@@ -2525,7 +2525,7 @@ int dquot_quota_on_mount(struct super_block *sb, char *qf_name,
 
 	error = security_quota_on(dentry);
 	if (!error)
-		error = vfs_load_quota_inode(d_inode(dentry), type, format_id,
+		error = vfs_load_quota_inode(sb, d_inode(dentry), type, format_id,
 				DQUOT_USAGE_ENABLED | DQUOT_LIMITS_ENABLED);
 
 out:
-- 
2.24.0.rc1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
