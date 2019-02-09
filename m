Return-Path: <SRS0=3nsT=QQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDCDC282C4
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Feb 2019 08:50:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB3032084D
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Feb 2019 08:50:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M6q8z/sK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB3032084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JOJa0h+E2PGfIOtctsl5/ZMM+Crx2BBpM9XpawRBdY8=; b=M6q8z/sKdW+bZG
	IU+lUDhiQlMmI8tyX8+BnQvcpK7hAS+hrPRjUcNhTTHFsGjykWTNjU/Xfi3QmaSrSD0YgtR+BMz1R
	5tKtV6/RL/asvLl24ynk5q9yErvsrhnGp/9Z78f4mvGEETcCuF+Q5G7npm5sBspalOUO0B9ixsOxT
	2oRY/FRVRbEMQtKWHmwtfV/eSdkRvBTahpUOLxisF6/C1fVo7Qfgbbp46E9wR9s1AT+V8xDwdAXpy
	J9eM88hx9VBZXo9I9abxQQzWQ0Khy27Sk+G8LbbOgS15MvKdGn/m0QB6/RwLlB9FlnDmSOlFkpOUO
	D8s8pXp+LI+Z7mbM5gcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsOLA-000354-Kg; Sat, 09 Feb 2019 08:50:24 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsOL4-00034i-Hz
 for linux-mtd@lists.infradead.org; Sat, 09 Feb 2019 08:50:20 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E1E54C299691C4AF362A;
 Sat,  9 Feb 2019 16:50:11 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.408.0; Sat, 9 Feb 2019
 16:50:04 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] ubifs: reject unsupported ioctl flags explicitly
Date: Sat, 9 Feb 2019 16:54:20 +0800
Message-ID: <20190209085420.2375-1-houtao1@huawei.com>
X-Mailer: git-send-email 2.16.2.dirty
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190209_005018_768028_0F565836 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, houtao1@huawei.com, adrian.hunter@intel.com,
 dedekind1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Reject unsupported ioctl flags explicitly, so the following command
on a regular ubifs file will fail:
	chattr +d ubifs_file

And xfstests generic/424 will pass.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 fs/ubifs/ioctl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 0164bcc827f8..daf9f93e15de 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -28,6 +28,11 @@
 #include <linux/mount.h>
 #include "ubifs.h"
 
+/* Need to be kept consistent with checked flags in ioctl2ubifs() */
+#define UBIFS_SUPPORTED_IOCTL_FLAGS \
+	(FS_COMPR_FL | FS_SYNC_FL | FS_APPEND_FL | \
+	 FS_IMMUTABLE_FL | FS_DIRSYNC_FL)
+
 /**
  * ubifs_set_inode_flags - set VFS inode flags.
  * @inode: VFS inode to set flags for
@@ -169,6 +174,9 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (get_user(flags, (int __user *) arg))
 			return -EFAULT;
 
+		if (flags & ~UBIFS_SUPPORTED_IOCTL_FLAGS)
+			return -EOPNOTSUPP;
+
 		if (!S_ISDIR(inode->i_mode))
 			flags &= ~FS_DIRSYNC_FL;
 
-- 
2.16.2.dirty


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
