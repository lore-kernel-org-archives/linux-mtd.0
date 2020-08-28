Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1C3C433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 03:35:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECD5B2080C
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 03:34:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="me01ahwS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECD5B2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kjbTTx4FyJX+Gy4Jy2VhytUq7S7D5rxfFsBbhFgalds=; b=me01ahwSN5FN2RT5FaP7yJglAI
	h5kp2S7QJnKbFuo5xfGq0R5UWS8pIetNVKtgKOkG+PjlIfhLLNFJUdi88nbsU8tPyxY0hXftfJ6sI
	z8H0mSM/Q4jidySTc/46G1jgpd1F6Ew91/hYKRuPrNpkXN57SHJnN4vNzCbpw2QTL9l+n/CgWmm7G
	JS1mg24pKdFsqHHbzDBjIVSVZShUSLGe5X5IxzzznrIau9JbfRNsov23b72C/gh4OgF95nytD1Qbm
	uT1qZ1+Vgka3xznecRzlzDllTZh3LreeyvjBeCqPrVeP3Eylz4FzEtxAmbzJTAd3/mIXxPzvKfMHV
	Asuly/nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBV98-0006YP-P4; Fri, 28 Aug 2020 03:33:46 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBV96-0006Xb-Nq
 for linux-mtd@lists.infradead.org; Fri, 28 Aug 2020 03:33:45 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3048085FE2F224C0F4FC;
 Fri, 28 Aug 2020 11:33:34 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 28 Aug 2020
 11:33:13 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard.weinberger@gmail.com>, <yi.zhang@huawei.com>
Subject: [PATCH] ubifs: setflags: Don't show error message when
 vfs_ioc_setflags_prepare() fails
Date: Fri, 28 Aug 2020 11:32:50 +0800
Message-ID: <20200828033250.910168-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_233345_019257_E378AB79 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Following process will trigger ubifs_err:
  1. useradd -m freg                                        (Under root)
  2. cd /home/freg && mkdir mp                              (Under freg)
  3. mount -t ubifs /dev/ubi0_0 /home/freg/mp               (Under root)
  4. cd /home/freg && echo 123 > mp/a			    (Under root)
  5. cd mp && chown freg a && chgrp freg a && chmod 777 a   (Under root)
  6. chattr +i a                                            (Under freg)

UBIFS error (ubi0:0 pid 1723): ubifs_ioctl [ubifs]: can't modify inode
65 attributes
chattr: Operation not permitted while setting flags on a

This is not an UBIFS problem, it was caused by task priviliage checking
on file operations. Remove error message printing from kernel just like
other filesystems (eg. ext4), since we already have enough information
from userspace tools.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/ioctl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 3df9be2c684c..4363d85a3fd4 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -134,7 +134,6 @@ static int setflags(struct inode *inode, int flags)
 	return err;
 
 out_unlock:
-	ubifs_err(c, "can't modify inode %lu attributes", inode->i_ino);
 	mutex_unlock(&ui->ui_mutex);
 	ubifs_release_budget(c, &req);
 	return err;
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
