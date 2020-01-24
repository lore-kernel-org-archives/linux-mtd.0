Return-Path: <SRS0=Gzls=3N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2349BC2D0DB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 13:15:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1782206D5
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 13:15:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nN9EW4Td"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1782206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJHnNv+EHfej3RzgU3XWAsuwW/drnqNlxZxHR6KZxSQ=; b=nN9EW4TdvFmrk6
	d5/FgvYgZVGU7Llp2/d8E+IYYL57fOckdfS4EcqAXSOyNJ8UDql/zXtCtUaRLBjmt2dYNaD8ivfNX
	KbdIthXd0lXUVzqmJ9iucTCCOLJ73sHs8Gpo1XuiyIgtEgoGzPA9dwh31zxjqoapSeSeaEC01Sw84
	uODbZue8V92x6bEjPJTcUiQFsWE6Jv5Q36mRtfPdDSnFnbTz0ecEq5LLP4jKSxau1QbKBz/Sw2wvC
	VjVQDskx/VHd6YGeyN03Qif+I4i5V6/Hk7ySUKTOZPqBYuSl5rWef6+tBA69RpT1qCzEpQ7AsoNnp
	gyKv0fnZz7BI5fPJD8Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuynQ-00078q-CS; Fri, 24 Jan 2020 13:14:48 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuymF-00063y-PB
 for linux-mtd@lists.infradead.org; Fri, 24 Jan 2020 13:13:38 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iuym5-0003aE-RR; Fri, 24 Jan 2020 14:13:25 +0100
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iuym5-0006Z8-0V; Fri, 24 Jan 2020 14:13:25 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Date: Fri, 24 Jan 2020 14:13:16 +0100
Message-Id: <20200124131323.23885-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124131323.23885-1-s.hauer@pengutronix.de>
References: <20200124131323.23885-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_051335_843628_192C96D6 
X-CRM114-Status: GOOD (  18.48  )
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

This patch introduces the Q_PATH flag to the quotactl cmd argument.
When given, the path given in the special argument to quotactl will
be the mount path where the filesystem is mounted, instead of a path
to the block device.
This is necessary for filesystems which do not have a block device as
backing store. Particularly this is done for upcoming UBIFS support.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/quota/quota.c           | 53 +++++++++++++++++++++++++++-----------
 include/uapi/linux/quota.h |  1 +
 2 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/fs/quota/quota.c b/fs/quota/quota.c
index 5444d3c4d93f..9ef51d02d5a5 100644
--- a/fs/quota/quota.c
+++ b/fs/quota/quota.c
@@ -19,6 +19,7 @@
 #include <linux/types.h>
 #include <linux/writeback.h>
 #include <linux/nospec.h>
+#include <linux/mount.h>
 
 static int check_quotactl_permission(struct super_block *sb, int type, int cmd,
 				     qid_t id)
@@ -821,15 +822,20 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
 {
 	uint cmds, type;
 	struct super_block *sb = NULL;
-	struct path path, *pathp = NULL;
+	struct path file_path, *file_pathp = NULL, sb_path;
 	int ret;
+	bool q_path;
 
 	cmds = cmd >> SUBCMDSHIFT;
 	type = cmd & SUBCMDMASK;
 
+
 	if (type >= MAXQUOTAS)
 		return -EINVAL;
 
+	q_path = cmds & Q_PATH;
+	cmds &= ~Q_PATH;
+
 	/*
 	 * As a special case Q_SYNC can be called without a specific device.
 	 * It will iterate all superblocks that have quota enabled and call
@@ -847,28 +853,45 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
 	 * resolution (think about autofs) and thus deadlocks could arise.
 	 */
 	if (cmds == Q_QUOTAON) {
-		ret = user_path_at(AT_FDCWD, addr, LOOKUP_FOLLOW|LOOKUP_AUTOMOUNT, &path);
+		ret = user_path_at(AT_FDCWD, addr,
+				   LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT,
+				   &file_path);
 		if (ret)
-			pathp = ERR_PTR(ret);
+			file_pathp = ERR_PTR(ret);
 		else
-			pathp = &path;
+			file_pathp = &file_path;
 	}
 
-	sb = quotactl_block(special, cmds);
-	if (IS_ERR(sb)) {
-		ret = PTR_ERR(sb);
-		goto out;
+	if (q_path) {
+		ret = user_path_at(AT_FDCWD, special,
+				   LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT,
+				   &sb_path);
+		if (ret)
+			goto out;
+
+		sb = sb_path.mnt->mnt_sb;
+	} else {
+		sb = quotactl_block(special, cmds);
+		if (IS_ERR(sb)) {
+			ret = PTR_ERR(sb);
+			goto out;
+		}
 	}
 
-	ret = do_quotactl(sb, type, cmds, id, addr, pathp);
+	ret = do_quotactl(sb, type, cmds, id, addr, file_pathp);
+
+	if (q_path) {
+		path_put(&sb_path);
+	} else {
+		if (!quotactl_cmd_onoff(cmds))
+			drop_super(sb);
+		else
+			drop_super_exclusive(sb);
+	}
 
-	if (!quotactl_cmd_onoff(cmds))
-		drop_super(sb);
-	else
-		drop_super_exclusive(sb);
 out:
-	if (pathp && !IS_ERR(pathp))
-		path_put(pathp);
+	if (file_pathp && !IS_ERR(file_pathp))
+		path_put(file_pathp);
 	return ret;
 }
 
diff --git a/include/uapi/linux/quota.h b/include/uapi/linux/quota.h
index f17c9636a859..e1787c0df601 100644
--- a/include/uapi/linux/quota.h
+++ b/include/uapi/linux/quota.h
@@ -71,6 +71,7 @@
 #define Q_GETQUOTA 0x800007	/* get user quota structure */
 #define Q_SETQUOTA 0x800008	/* set user quota structure */
 #define Q_GETNEXTQUOTA 0x800009	/* get disk limits and usage >= ID */
+#define Q_PATH     0x400000	/* quotactl special arg contains mount path */
 
 /* Quota format type IDs */
 #define	QFMT_VFS_OLD 1
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
