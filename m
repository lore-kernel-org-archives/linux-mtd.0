Return-Path: <SRS0=7qTJ=LM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948AEC48BDF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 08:02:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B8B061351
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 08:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B8B061351
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=19rEFdjD2Oz/9KT5f6gQJYP6FTfbt6tdxgNHYIEY22Y=; b=oBPbO/PSw0t273
	w1Nv/LhE4EL7u4Jam9UIHS4hNhYJsL1Md8SLBQJ8V4N99VqorNmzLh8oeXBiT/qI+SVZPv5tM5WpU
	47ooc1+dVszU2KCHWD/wuM6iKoyjUZYo2xAp6V76obhAJxdEwnfmZ/eoPJ18VrMFxjmlwK7ou0wW/
	rEqf+kr4KfsS0JClDdykOVNOk7aR70OBdE8LdSxoH4GNGtK++9+Enu633DVMjwODivA1Ec9nq5WoM
	HxHIBj9HFeXgOjOmUioOg3q2yu/18i2sAjvAZc1LkPI460n2E2DjKxDm6s7ARKaLXWJpGZrIEXj9r
	AVU9ubSn0QIkMEplBH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu9SJ-00DDNn-4N; Fri, 18 Jun 2021 08:02:23 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu9SC-00DDIl-At
 for linux-mtd@lists.infradead.org; Fri, 18 Jun 2021 08:02:18 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G5rsq6Sf1zZhF0;
 Fri, 18 Jun 2021 15:59:11 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 16:02:08 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 18
 Jun 2021 16:02:08 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH] ubifs: Set/Clear I_LINKABLE under i_lock for whiteout inode
Date: Fri, 18 Jun 2021 16:11:03 +0800
Message-ID: <20210618081103.3031967-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_010216_639112_23D85F95 
X-CRM114-Status: UNSURE (   6.14  )
X-CRM114-Notice: Please train this message.
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

xfstests-generic/476 reports a warning message as below:

WARNING: CPU: 2 PID: 30347 at fs/inode.c:361 inc_nlink+0x52/0x70
Call Trace:
  do_rename+0x502/0xd40 [ubifs]
  ubifs_rename+0x8b/0x180 [ubifs]
  vfs_rename+0x476/0x1080
  do_renameat2+0x67c/0x7b0
  __x64_sys_renameat2+0x6e/0x90
  do_syscall_64+0x66/0xe0
  entry_SYSCALL_64_after_hwframe+0x44/0xae

Following race case can cause this:
         rename_whiteout(Thread 1)             wb_workfn(Thread 2)
ubifs_rename
  do_rename
                                          __writeback_single_inode
					    spin_lock(&inode->i_lock)
    whiteout->i_state |= I_LINKABLE
                                            inode->i_state &= ~dirty;
---- How race happens on i_state:
    (tmp = whiteout->i_state | I_LINKABLE)
		                           (tmp = inode->i_state & ~dirty)
    (whiteout->i_state = tmp)
		                           (inode->i_state = tmp)
----
					    spin_unlock(&inode->i_lock)
    inc_nlink(whiteout)
    WARN_ON(!(inode->i_state & I_LINKABLE)) !!!

Fix to add i_lock to avoid i_state update race condition.

Fixes: 9e0a1fff8db56ea ("ubifs: Implement RENAME_WHITEOUT")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/dir.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 5bd8482e660a..7c61d0ec0159 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1337,7 +1337,10 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 			goto out_release;
 		}
 
+		spin_lock(&whiteout->i_lock);
 		whiteout->i_state |= I_LINKABLE;
+		spin_unlock(&whiteout->i_lock);
+
 		whiteout_ui = ubifs_inode(whiteout);
 		whiteout_ui->data = dev;
 		whiteout_ui->data_len = ubifs_encode_dev(dev, MKDEV(0, 0));
@@ -1430,7 +1433,11 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 		inc_nlink(whiteout);
 		mark_inode_dirty(whiteout);
+
+		spin_lock(&whiteout->i_lock);
 		whiteout->i_state &= ~I_LINKABLE;
+		spin_unlock(&whiteout->i_lock);
+
 		iput(whiteout);
 	}
 
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
