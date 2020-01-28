Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB281C33CB3
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 10:06:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DFBE2467B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 10:06:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a4MAX6n6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DFBE2467B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=01/RLnpjFWbvDAOEneI+I3ApXzx4JnXjsPrrZzzVqes=; b=a4MAX6n6qBX4TL
	Rk7nYeb7rUIcBs14w9JvOR4jAhrEQCEvlt4689QO3n8MjR02UyyeR/cC8cQDr+QNjY9jcyMngUXYy
	t/xRKivclBu8+aB6v5l/AlfXHjeWqZB1bLWu2f6NQzpvBOy1n28ePF2InMXpY6MDnzDXj3Xvc2Vw6
	aBsanLmXFWfYoC9tvRU7MAB7qR8JCJBdRguxcYFZX7h8gX5O/BSLIbTY3FsEaASbJXxw1D4KsKerN
	YsSb8pd1b8/0IEgLrlKbLn3/DB1v2cp1CQ2ppqGj40wpLnPPr6BF8MYtYA3caSDcMbSxW8v7+PsE4
	Sk7uNODiqG7xoNQJUV6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwNlV-00015R-TO; Tue, 28 Jan 2020 10:06:37 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwNlS-00014l-M9
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 10:06:36 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iwNlP-0008Dq-QQ; Tue, 28 Jan 2020 11:06:31 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1iwNlP-0004fS-1f; Tue, 28 Jan 2020 11:06:31 +0100
Date: Tue, 28 Jan 2020 11:06:31 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20200128100631.zv7cn726twylcmb7@pengutronix.de>
References: <20200124131323.23885-1-s.hauer@pengutronix.de>
 <20200124131323.23885-2-s.hauer@pengutronix.de>
 <20200127104518.GC19414@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127104518.GC19414@quack2.suse.cz>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:03:46 up 204 days, 16:13, 87 users,  load average: 0.27, 0.34,
 0.27
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_020634_723810_B16DD402 
X-CRM114-Status: GOOD (  27.83  )
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
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jan,

On Mon, Jan 27, 2020 at 11:45:18AM +0100, Jan Kara wrote:
> >  	cmds = cmd >> SUBCMDSHIFT;
> >  	type = cmd & SUBCMDMASK;
> >  
> > +
> 
> Unnecessary empty line added...

Fixed

> > +	if (q_path) {
> > +		ret = user_path_at(AT_FDCWD, special,
> > +				   LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT,
> > +				   &sb_path);
> > +		if (ret)
> > +			goto out;
> > +
> > +		sb = sb_path.mnt->mnt_sb;
> 
> So I've realized that just looking up superblock with user_path_at() is not
> enough. Quota code also expects that the superblock will be locked
> (sb->s_umount) and filesystem will not be frozen (in case the quota
> operation is going to modify the filesystem). This is needed to serialize
> e.g. remount and quota operations or quota operations among themselves.
> So you still need something like following to get superblock from the path:

Ok, here's an updated version. I'll send an update for the whole series
when Richard had a look over it.

Sascha

----------------------------8<-----------------------------

From 9c91395f2667c8a48f52a80896e559daf16f4a4c Mon Sep 17 00:00:00 2001
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 30 Oct 2019 08:35:11 +0100
Subject: [PATCH] quota: Allow to pass mount path to quotactl

This patch introduces the Q_PATH flag to the quotactl cmd argument.
When given, the path given in the special argument to quotactl will
be the mount path where the filesystem is mounted, instead of a path
to the block device.
This is necessary for filesystems which do not have a block device as
backing store. Particularly this is done for upcoming UBIFS support.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/quota/quota.c           | 75 ++++++++++++++++++++++++++++++++------
 include/uapi/linux/quota.h |  1 +
 2 files changed, 64 insertions(+), 12 deletions(-)

diff --git a/fs/quota/quota.c b/fs/quota/quota.c
index 5444d3c4d93f..712b71760f9d 100644
--- a/fs/quota/quota.c
+++ b/fs/quota/quota.c
@@ -19,6 +19,7 @@
 #include <linux/types.h>
 #include <linux/writeback.h>
 #include <linux/nospec.h>
+#include <linux/mount.h>
 
 static int check_quotactl_permission(struct super_block *sb, int type, int cmd,
 				     qid_t id)
@@ -810,6 +811,36 @@ static struct super_block *quotactl_block(const char __user *special, int cmd)
 #endif
 }
 
+static struct super_block *quotactl_path(const char __user *special, int cmd,
+					 struct path *path)
+{
+	struct super_block *sb;
+	int ret;
+
+	ret = user_path_at(AT_FDCWD, special, LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT,
+			   path);
+	if (ret)
+		return ERR_PTR(ret);
+
+	sb = path->mnt->mnt_sb;
+restart:
+	if (quotactl_cmd_onoff(cmd))
+		down_write(&sb->s_umount);
+	else
+		down_read(&sb->s_umount);
+
+	if (quotactl_cmd_write(cmd) && sb->s_writers.frozen != SB_UNFROZEN) {
+		if (quotactl_cmd_onoff(cmd))
+			up_write(&sb->s_umount);
+		else
+			up_read(&sb->s_umount);
+		wait_event(sb->s_writers.wait_unfrozen,
+			   sb->s_writers.frozen == SB_UNFROZEN);
+		goto restart;
+	}
+
+	return sb;
+}
 /*
  * This is the system call interface. This communicates with
  * the user-level programs. Currently this only supports diskquota
@@ -821,8 +852,9 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
 {
 	uint cmds, type;
 	struct super_block *sb = NULL;
-	struct path path, *pathp = NULL;
+	struct path file_path, *file_pathp = NULL, sb_path;
 	int ret;
+	bool q_path;
 
 	cmds = cmd >> SUBCMDSHIFT;
 	type = cmd & SUBCMDMASK;
@@ -830,6 +862,9 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
 	if (type >= MAXQUOTAS)
 		return -EINVAL;
 
+	q_path = cmds & Q_PATH;
+	cmds &= ~Q_PATH;
+
 	/*
 	 * As a special case Q_SYNC can be called without a specific device.
 	 * It will iterate all superblocks that have quota enabled and call
@@ -847,28 +882,44 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
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
+	if (q_path)
+		sb = quotactl_path(special, cmds, &sb_path);
+	else
+		sb = quotactl_block(special, cmds);
+
 	if (IS_ERR(sb)) {
 		ret = PTR_ERR(sb);
 		goto out;
 	}
 
-	ret = do_quotactl(sb, type, cmds, id, addr, pathp);
+	ret = do_quotactl(sb, type, cmds, id, addr, file_pathp);
+
+	if (q_path) {
+		if (quotactl_cmd_onoff(cmd))
+			up_write(&sb->s_umount);
+		else
+			up_read(&sb->s_umount);
+
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


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
