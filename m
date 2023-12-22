Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442BBC4706C
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Dec 2023 02:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8FFjKyjPeN7e52wZI/qSi7kIiyK5YlmPsR6DG1uhskQ=; b=s2LO+mI5VfN8eQ
	kpJfS1NFyyiJ9IsTI2jKzxCo/bfYrR0oHXIe/yFaEMPV+VxC+Cmz9xKBHWzuHHv3p+p2iKxuPIsWI
	/zOx6DqyYr5EdfWZiNOI5dNpiT8Xy5MF/73bSSLR6B3Sza8Q4NWryTMkiVgBLQ8mmH9xfJtg28UQf
	17hz3nUxgKMYxe8eZJFAnerutrilM0I5hToDrkxkL5xzLejPODKZZIoRPpF5hTr7CaY7DYhN2XbAr
	Ji7Sux+VXRPDfyQc5rYxyK/W0sbVMlZJwjUBCB/r1jYcLA3MFAKmmL2nC1+9EYJU6lexP/r37BZx4
	G/pCirBMIFkuNCq6CUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGVeV-004hVN-2b;
	Fri, 22 Dec 2023 02:52:43 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGVeS-004hT5-00
	for linux-mtd@lists.infradead.org;
	Fri, 22 Dec 2023 02:52:41 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4SxBZP52S0z1FFBZ;
	Fri, 22 Dec 2023 10:48:45 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C08D1400FD;
	Fri, 22 Dec 2023 10:52:31 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Dec
 2023 10:52:30 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <terrelln@fb.com>, <ebiggers@google.com>,
	<ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path
Date: Fri, 22 Dec 2023 10:50:25 +0800
Message-ID: <20231222025025.2940450-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231222025025.2940450-1-chengzhihao1@huawei.com>
References: <20231222025025.2940450-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_185240_221376_201F98D9 
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

Fixes: 2c58d548f570 ("fscrypt: cache decrypted symlink target in ->i_link")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/dir.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 3b13c648d490..9baf029416d4 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1234,6 +1234,9 @@ static int ubifs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	dir_ui->ui_size = dir->i_size;
 	mutex_unlock(&dir_ui->ui_mutex);
 out_inode:
+	/* Free inode->i_link before inode is marked as bad. */
+	if (IS_ENCRYPTED(inode))
+		fscrypt_free_inode(inode);
 	make_bad_inode(inode);
 	iput(inode);
 out_fname:
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
