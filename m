Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6B5FA0C3F
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2026 07:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w5M+PHDmBbaB9gTlP8Igif1gQ6sfsoe9SMn8n4wKbVU=; b=o8L6fv1Ssitynd
	DClu0mFlUvt/SJeN5p2L+l5KwKvj6MeOO2y5DpmqEthATUjiM6xnpQkOUf81lzhaEjvSNUpVdzWSN
	l/M+DiTxpFN4liiWnCyyQagkaC1iHU7eWFu+GCldse1JH5qR68sVe4rjv+97d+bmqVwbG5ewZDHJt
	/Al+GPE/EP4LkkUu2MfjHhMZrG9a8gqig4H/yzh/wLa4z6ebalaj/nifkg/nKGHrcJdpCnpVi86d6
	ZKUmqp1Ejne3VOYOF+6ssXhcdodPnYn+w9JDCPRWJmTAf9qfqQ9h7qStCKMWqoUAHk8C7G4tAQ2q9
	wlEEvuqAabXzC3vvf/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuWX-00000000hvS-1oKu;
	Wed, 15 Apr 2026 07:18:57 +0000
Received: from forward101b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuWU-00000000huN-0ldp
	for linux-mtd@lists.infradead.org;
	Wed, 15 Apr 2026 07:18:56 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:489d:0:640:baa6:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTPS id DA727C00C4;
	Wed, 15 Apr 2026 10:18:47 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id kIGRDIAS44Y0-IXihI9u3;
	Wed, 15 Apr 2026 10:18:47 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1776237527; bh=j4e2Tbwc1l9KNiP+JgHrqYkNpcJz6oop1kOl94bYZmY=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=hCbo9wXRCzt9daRID7KscQoWrF5xqdDn8Lum7X8nf5hN3rXxN9xqT+rRyJ+CJgAr6
	 qU8apPmQL/RtAFf9NupX8JeJzkSzcS+xG+0u9bkJ+iGGax6Liha3J2XBrQ4+ZFcIV9
	 JZd09hiW46MhbYdB9lmqw+ku4x+7o0jt944p7kM0=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Zhihao Cheng <chengzhihao1@huawei.com>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v5 1/3] ubifs: prefer kstrtobool_from_user() over custom helper
Date: Wed, 15 Apr 2026 10:18:10 +0300
Message-ID: <20260415071812.1139054-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_001854_737690_0942CDF3 
X-CRM114-Status: GOOD (  13.00  )
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

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v3 and upwards: bump version to match the series
v2: add Reviewed-by: and bump version to match the series
---
 fs/ubifs/debug.c | 44 ++++++++++----------------------------------
 1 file changed, 10 insertions(+), 34 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 5794de5a9069..9e0468dc72d3 100644
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
