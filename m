Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02243CC6B26
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Apr 2026 08:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UXzZz35P29oLpSQ9CTSAuWkn4YTBoglr0/8VPeIst2M=; b=IhynMwvB5qu8JG
	nghKEhFDi/eHmaPMm0oopEO7J8PLKGjwdAOlDhZsOvtJbdNPLqJwMQy6K7SviNAPR1Z+qGfwAF3aA
	DT9oRBqXkTqwH9qZy+cAbeWcqZL0wUV0lNMGM+CYxNh9RNk/NGGR4rVbHv79zk5wohzODpGgk9iSC
	JuXsBM8P4uoCrr2R+dT0BLYTSsQkT7j/Hm+8bj1qJlhySptHt8fcjMZCBz816h+m1uXKJmcLp4Dms
	stMv1GwiqXzx0q44DDiijje6cCk0tNlQaY/ATf99RadORhdQlcUFiAW1aBMLX+RfpNJFF8y3yd7bT
	tRYM6WqurGXtroUQZjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DBS-0000000HA1h-1Pev;
	Thu, 02 Apr 2026 08:13:46 +0000
Received: from forward102b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DBP-0000000H9y9-0uix
	for linux-mtd@lists.infradead.org;
	Thu, 02 Apr 2026 08:13:45 +0000
Received: from mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:143b:0:640:90e9:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id 04C44C00A9;
	Thu, 02 Apr 2026 11:13:35 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id XDXIfs9Sr4Y0-rNuuaNTl;
	Thu, 02 Apr 2026 11:13:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1775117614; bh=TOssEmYdfyEZmx1m/i8FVjKPTmZhw/elUukSraze2CY=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=q4VIRIroxcriYK++Jg3+72OeXFShaSP72wYis1mx1g6sfVMCyH5ih48t/C/aCvCc8
	 JDbRhnIPiYVAmHrHLXpmZOFSlgEPoaYQRpnhbGh9Uh6uiDiaCKr5btP028gvh2N0Yu
	 xTpG6mpUnRMZNY/K5fXgTCA8uCgMEWv0zsPRFufw=
Authentication-Results: mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] ubifs: prefer kstrtobool_from_user() over custom helper
Date: Thu,  2 Apr 2026 11:13:32 +0300
Message-ID: <20260402081332.523352-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_011343_791983_DF24BA44 
X-CRM114-Status: GOOD (  12.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Adjust 'dfs_file_write()' and 'dfs_global_file_write()' to prefer generic
'kstrtobool_from_user()' over an ad-hoc 'interpret_user_input()' helper,
thus making the latter not needed anymore.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 fs/ubifs/debug.c | 44 ++++++++++----------------------------------
 1 file changed, 10 insertions(+), 34 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 160c16aa7b6e..252cf82012cf 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2732,39 +2732,14 @@ static ssize_t dfs_file_read(struct file *file, char __user *u, size_t count,
 	return provide_user_output(val, u, count, ppos);
 }
 
-/**
- * interpret_user_input - interpret user debugfs file input.
- * @u: user-provided buffer with the input
- * @count: buffer size
- *
- * This is a helper function which interpret user input to a boolean UBIFS
- * debugfs file. Returns %0 or %1 in case of success and a negative error code
- * in case of failure.
- */
-static int interpret_user_input(const char __user *u, size_t count)
-{
-	size_t buf_size;
-	char buf[8];
-
-	buf_size = min_t(size_t, count, (sizeof(buf) - 1));
-	if (copy_from_user(buf, u, buf_size))
-		return -EFAULT;
-
-	if (buf[0] == '1')
-		return 1;
-	else if (buf[0] == '0')
-		return 0;
-
-	return -EINVAL;
-}
-
 static ssize_t dfs_file_write(struct file *file, const char __user *u,
 			      size_t count, loff_t *ppos)
 {
 	struct ubifs_info *c = file->private_data;
 	struct ubifs_debug_info *d = c->dbg;
 	struct dentry *dent = file->f_path.dentry;
-	int val;
+	bool val;
+	int ret;
 
 	if (file->f_path.dentry == d->dfs_dump_lprops) {
 		ubifs_dump_lprops(c);
@@ -2781,9 +2756,9 @@ static ssize_t dfs_file_write(struct file *file, const char __user *u,
 		return count;
 	}
 
-	val = interpret_user_input(u, count);
-	if (val < 0)
-		return val;
+	ret = kstrtobool_from_user(u, count, &val);
+	if (unlikely(ret))
+		return ret;
 
 	if (dent == d->dfs_chk_gen)
 		d->chk_gen = val;
@@ -2926,11 +2901,12 @@ static ssize_t dfs_global_file_write(struct file *file, const char __user *u,
 				     size_t count, loff_t *ppos)
 {
 	struct dentry *dent = file->f_path.dentry;
-	int val;
+	bool val;
+	int ret;
 
-	val = interpret_user_input(u, count);
-	if (val < 0)
-		return val;
+	ret = kstrtobool_from_user(u, count, &val);
+	if (unlikely(ret))
+		return ret;
 
 	if (dent == dfs_chk_gen)
 		ubifs_dbg.chk_gen = val;
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
