Return-Path: <SRS0=S0OG=Z7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FD8C04E30
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 22:24:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A20E2071E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 22:24:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c6NUiDN9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYWBRWpv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A20E2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGtL23JmlOTHSQgwO+6Yt7nmlw0T8h0sFH6qaCz4TY4=; b=c6NUiDN9dckQfl
	uUOIXYQ844tLTWulOXmCpUoVKCGc0UblY7IXSRHJ0/EieQHkmLD9zNKpRXHSrNfreelIfsJG1lV0S
	1+yVNMWNuZ4MqWAzR3USkdqRa76dHzlzAoYo6sdheQTah0ajZsEk6NV1pFlIs0BaApB+kLK8qs3eV
	7FUW63ywUXhC6ZYi9rIjKAXVj7mh7kNjev2kRd+aZjqbBxpOYID+94GeMqYfNDzB4hS3uzUanbScD
	14dwouNSFK/ekCFr8K1Ngcf81hCxoXKcogmClVwxViu7dBiUpzLXOMKZ8po0c8dg+/64otZ/6dzsu
	hrjaQ2jlQLTMed7PYTSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieRSL-0002U8-KY; Mon, 09 Dec 2019 22:24:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieRS0-000255-I4
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2019 22:24:22 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 232362073D;
 Mon,  9 Dec 2019 22:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575930260;
 bh=Txysl0+3YMuRnATdL1j/J6K16t6mLbaFJChqfy90MwU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tYWBRWpv36hPtz6Evnmhu1djMMLvR26BcTJAwTXhIiyYmTwvY7PA9gSwJ6hHA3Yuk
 AnWbw5RR2NCZSMNAvpCFfu546W9qlnKss1wScPWsDu0uJrTpWDF/2diIOVGbs04YRp
 v9DjBbCglO5H6B1ugc/9D3QyPBKN/PXTQIeXLE/k=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/2] ubifs: add support for FS_ENCRYPT_FL
Date: Mon,  9 Dec 2019 14:23:25 -0800
Message-Id: <20191209222325.95656-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
In-Reply-To: <20191209222325.95656-1-ebiggers@kernel.org>
References: <20191209222325.95656-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_142420_615249_D6F173D0 
X-CRM114-Status: GOOD (  12.87  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Make the FS_IOC_GETFLAGS ioctl on ubifs return the FS_ENCRYPT_FL flag on
encrypted files, like ext4 and f2fs do.

Also make this flag be ignored by FS_IOC_SETFLAGS, like ext4 and f2fs
do, since it's a recognized flag but is not directly settable.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/ioctl.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index eeb1be2598881..d49fc04f2d7d4 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -17,10 +17,14 @@
 #include "ubifs.h"
 
 /* Need to be kept consistent with checked flags in ioctl2ubifs() */
-#define UBIFS_SUPPORTED_IOCTL_FLAGS \
+#define UBIFS_SETTABLE_IOCTL_FLAGS \
 	(FS_COMPR_FL | FS_SYNC_FL | FS_APPEND_FL | \
 	 FS_IMMUTABLE_FL | FS_DIRSYNC_FL)
 
+/* Need to be kept consistent with checked flags in ubifs2ioctl() */
+#define UBIFS_GETTABLE_IOCTL_FLAGS \
+	(UBIFS_SETTABLE_IOCTL_FLAGS | FS_ENCRYPT_FL)
+
 /**
  * ubifs_set_inode_flags - set VFS inode flags.
  * @inode: VFS inode to set flags for
@@ -91,6 +95,8 @@ static int ubifs2ioctl(int ubifs_flags)
 		ioctl_flags |= FS_IMMUTABLE_FL;
 	if (ubifs_flags & UBIFS_DIRSYNC_FL)
 		ioctl_flags |= FS_DIRSYNC_FL;
+	if (ubifs_flags & UBIFS_CRYPT_FL)
+		ioctl_flags |= FS_ENCRYPT_FL;
 
 	return ioctl_flags;
 }
@@ -113,7 +119,7 @@ static int setflags(struct inode *inode, int flags)
 	if (err)
 		goto out_unlock;
 
-	ui->flags &= ~ioctl2ubifs(UBIFS_SUPPORTED_IOCTL_FLAGS);
+	ui->flags &= ~ioctl2ubifs(UBIFS_SETTABLE_IOCTL_FLAGS);
 	ui->flags |= ioctl2ubifs(flags);
 	ubifs_set_inode_flags(inode);
 	inode->i_ctime = current_time(inode);
@@ -156,8 +162,9 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (get_user(flags, (int __user *) arg))
 			return -EFAULT;
 
-		if (flags & ~UBIFS_SUPPORTED_IOCTL_FLAGS)
+		if (flags & ~UBIFS_GETTABLE_IOCTL_FLAGS)
 			return -EOPNOTSUPP;
+		flags &= UBIFS_SETTABLE_IOCTL_FLAGS;
 
 		if (!S_ISDIR(inode->i_mode))
 			flags &= ~FS_DIRSYNC_FL;
-- 
2.24.0.393.g34dc348eaf-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
