Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16262C41535
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Dec 2023 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTjlXvD/1LLQpUHWoGko0WJV3gYJSqjKGzNzPf6RTUw=; b=PCvfn3TsMK0//J
	ZPJP9WOD1ZdYvZq6MIzaLBOrFtradl7tynI9uS0QdCxNn5MHtgSIy1kAL5qXItPpk8OLZBZ43RG2x
	nANcP2Ifcjzm5sm6k7EQiSsyI0rOr6MwTlevBeiZGGtVvzzqddYmKDj1LlyEF8EGYJi9BalD0YiHw
	CDLtdiBKIJS4RZLT+Qmipf5oRRt490c1dGTTOkfkfy+t01TFms+Gb37j6II+zFPoKUH3zArLK1obl
	yAWPQou3AEKwIvExv+jEEFMCzhAW6hc8X6SkxsvUUOgS/SmZtVJpd3/YKKe6LvNpwEQY89jg4ip8B
	obZZqClzPQUqR4RR1lMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGbFx-005MOt-1F;
	Fri, 22 Dec 2023 08:51:45 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGbFu-005MN6-0a
	for linux-mtd@lists.infradead.org;
	Fri, 22 Dec 2023 08:51:43 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4SxLcd3vTbzMp5H;
	Fri, 22 Dec 2023 16:51:13 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id B29ED18001A;
	Fri, 22 Dec 2023 16:51:29 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Dec
 2023 16:51:29 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <terrelln@fb.com>, <ebiggers@google.com>
CC: <linux-fscrypt@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 2/2] ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path
Date: Fri, 22 Dec 2023 16:54:46 +0800
Message-ID: <20231222085446.781838-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231222085446.781838-1-chengzhihao1@huawei.com>
References: <20231222085446.781838-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_005142_415922_14F16389 
X-CRM114-Status: UNSURE (   7.98  )
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

For error handling path in ubifs_symlink(), inode will be marked as
bad first, then iput() is invoked. If inode->i_link is initialized by
fscrypt_encrypt_symlink() in encryption scenario, inode->i_link won't
be freed by callchain ubifs_free_inode -> fscrypt_free_inode in error
handling path, because make_bad_inode() has changed 'inode->i_mode' as
'S_IFREG'.
Following kmemleak is easy to be reproduced by injecting error in
ubifs_jnl_update() when doing symlink in encryption scenario:
 unreferenced object 0xffff888103da3d98 (size 8):
  comm "ln", pid 1692, jiffies 4294914701 (age 12.045s)
  backtrace:
   kmemdup+0x32/0x70
   __fscrypt_encrypt_symlink+0xed/0x1c0
   ubifs_symlink+0x210/0x300 [ubifs]
   vfs_symlink+0x216/0x360
   do_symlinkat+0x11a/0x190
   do_syscall_64+0x3b/0xe0
There are two ways fixing it:
 1. Remove make_bad_inode() in error handling path. We can do that
    because ubifs_evict_inode() will do same processes for good
    symlink inode and bad symlink inode, for inode->i_nlink checking
    is before is_bad_inode().
 2. Free inode->i_link before marking inode bad.
Method 2 is picked, it has less influence, personally, I think.

Cc: stable@vger.kernel.org
Fixes: 2c58d548f570 ("fscrypt: cache decrypted symlink target in ->i_link")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Suggested-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/ubifs/dir.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 3b13c648d490..e413a9cf8ee3 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1234,6 +1234,8 @@ static int ubifs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	dir_ui->ui_size = dir->i_size;
 	mutex_unlock(&dir_ui->ui_mutex);
 out_inode:
+	/* Free inode->i_link before inode is marked as bad. */
+	fscrypt_free_inode(inode);
 	make_bad_inode(inode);
 	iput(inode);
 out_fname:
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
