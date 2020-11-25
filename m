Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC05C2D0E4
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 00:25:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77635206F7
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 00:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SWjHF9DC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJl8OkUG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77635206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IdG/l+1flh9kOeD7R0bRlaWCIBuXTEyCD6xz4bNpS5M=; b=SWjHF9DClqgoCyD9waSgZEnFF
	PkBENKOpsQGV4RPK+Z6sWclsO+IpAyXu4Q0SzMYm+uOI6mgsM8PFvkep4kXNEZoH+Y2xgpTshiZ/J
	6GCpnxDKx1gH1bfaN+Cq1CGoZeIvAth/YMTuHadjjJqkOQPn6z2EZ+vVdmRGboZtSi4goFk6A+J+7
	m5NH1U0z5VwkpSpNcltk025dgjwAZHUWCYrM6qdOfDH1kUqH2HVt7Ssj7wF0vVfQxWSmYA4Kgpgjp
	zJRzjgNIQhHHaoHjf3ZmWXxylf4+GULZ+uj7rEvt58vn4ZTWekquFf7nKLFXecc6UHn+ek4DqL1Fz
	7Thci0OiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khicB-0001XS-T5; Wed, 25 Nov 2020 00:24:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khic2-0001SF-RB
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 00:24:47 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F2DB02151B;
 Wed, 25 Nov 2020 00:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606263886;
 bh=rnYdUr37PtuJdOHsrO7sMu2HuLBhc/5UVpsjNmKp6y8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AJl8OkUGDWFwxrxlZqEpgv4PwMCU1rjl5L7p1rg/lZNBS90ofHleDkHoORna07IZH
 L4PwZP6J+7e4F/HrUuXir6oThE5TGXcT0nQplwrbj/sZESB+7UVh4fPV9Lswxl7DZb
 3Gx3DfYhqSUtcl/Z9Qd87ORSV1pWNXLhGd1ryKoM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH 1/9] ext4: remove ext4_dir_open()
Date: Tue, 24 Nov 2020 16:23:28 -0800
Message-Id: <20201125002336.274045-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125002336.274045-1-ebiggers@kernel.org>
References: <20201125002336.274045-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_192446_981242_88486B5D 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Since encrypted directories can be opened without their encryption key
being available, and each readdir tries to set up the key, trying to set
up the key in ->open() too isn't really useful.

Just remove it so that directories don't need an ->open() method
anymore, and so that we eliminate a use of fscrypt_get_encryption_info()
(which I'd like to stop exporting to filesystems).

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/dir.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index ca50c90adc4c..16bfbdd5007c 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -616,13 +616,6 @@ static int ext4_dx_readdir(struct file *file, struct dir_context *ctx)
 	return 0;
 }
 
-static int ext4_dir_open(struct inode * inode, struct file * filp)
-{
-	if (IS_ENCRYPTED(inode))
-		return fscrypt_get_encryption_info(inode) ? -EACCES : 0;
-	return 0;
-}
-
 static int ext4_release_dir(struct inode *inode, struct file *filp)
 {
 	if (filp->private_data)
@@ -664,7 +657,6 @@ const struct file_operations ext4_dir_operations = {
 	.compat_ioctl	= ext4_compat_ioctl,
 #endif
 	.fsync		= ext4_sync_file,
-	.open		= ext4_dir_open,
 	.release	= ext4_release_dir,
 };
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
