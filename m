Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50EAE98FB0
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Apr 2026 04:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQKlqm+URrbeDRp7q5wm3QE+Ve8CC5TBmEz22fT1b/g=; b=LZSKYwHW72+12b
	86X4SHbbJiTiwM02n76Umo0MVtI1Gi35fRKm6+RgT9QayOAGeIxBAv5j3cIOOWpCZjiluoUwdXhOa
	KzxUNSAP/9fQHTCigI/s1ccMhl0ZzGQRsPZumgUV8/or8ybTpL4u1bVvcWaXauXhFStTiLwBmmgtU
	Y4UF9yEv31JSe7zE4ZmZDz/HvQgAKSevC2M20AbM00550ofq/fPrRrgVorbW1zrEluP2sb7NeUAcN
	bhmv7J65cEGijzHETmNfUCTs8pReq4rmzVWtCWiAmqwW1S7cXXkft6HOdHpL8Kx0GP3PVDjLXVt4U
	AO4fA1UI911fZ8tbS7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAhRe-00000009hTI-40vC;
	Thu, 09 Apr 2026 04:56:46 +0000
Received: from forward102d.mail.yandex.net ([178.154.239.213])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAhRa-00000009hSY-3eQ8
	for linux-mtd@lists.infradead.org;
	Thu, 09 Apr 2026 04:56:45 +0000
Received: from mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:d880:0:640:3563:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id 69D2EC0111;
	Thu, 09 Apr 2026 07:56:36 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id Yu76IE8SJuQ0-v3buwENo;
	Thu, 09 Apr 2026 07:56:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1775710596; bh=8jYrWOQ1rEq47acNXqtzgaDC3GwdJWMLeILnxWMyA0o=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=mclK5qVmzfS1/40RJ/H2RSIkFIMTIXv6rrBEtT1RECXV9E+RonxSyS8SvYH792h41
	 DE3E7aLL5F+WpfZ+gUYyJEdWJlbEH26E0RDSpJn18KVr3yHPxpRBCLeOw+5ektOnUK
	 fyrwRA4WXrGwefPfD2LvWTcbH4XbxPXSgzhG1U5g=
Authentication-Results: mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v4 1/2] ubifs: prefer kstrtobool_from_user() over custom helper
Date: Thu,  9 Apr 2026 07:56:28 +0300
Message-ID: <20260409045629.527019-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <5deffdfa-6a99-8205-1f71-ff1f07ce28d1@huawei.com>
References: <5deffdfa-6a99-8205-1f71-ff1f07ce28d1@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_215643_426182_9453AD53 
X-CRM114-Status: GOOD (  14.04  )
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
