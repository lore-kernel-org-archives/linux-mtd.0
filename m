Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E4FCD11C2
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 07:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZTYat5PHRa3k1WBaK2XznJIyu0hr/0mg00Hv/3Vhws=; b=fwKtOZ+GvyLXXI
	tNh+qAV34q2cZ3YtXPG8APexbOZ1ehJTHZEONPHF09FxfJPBqN3j8qtSHa4nRC/2hQfyVlRxlkaUf
	oQXCeh+6mSjRJWKh/m9C4ZRPepE8t2dqfXc8tjXnEE+WcNMIahU6UbdsCtSlih49j9Tgy2jn1suv7
	gAcPp4lOeJ2Xv5+dmXLHl6vEckeM4QSg+hLGOwSRk+wL8/jhsMDJNyhYuwO8JzSfW340RC2lM31GF
	rhtHTCeV74QriOH9Uhp93FqTe//0n0D9NWpqUtgbkIuKcU2ta6kSzyIgOJI7twvDFprrifpNITXxX
	Z9N+mq1REOGrB9uFZjmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSfH-00000005gJw-38gY;
	Wed, 10 Apr 2024 07:46:39 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSf9-00000005gBw-1YMZ
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 07:46:33 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4VDvvj5jXgz29dP9;
	Wed, 10 Apr 2024 15:43:29 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 90AFA18001A;
	Wed, 10 Apr 2024 15:46:21 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 15:46:19 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
Subject: [PATCH 3/9] Revert "ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path"
Date: Wed, 10 Apr 2024 15:37:45 +0800
Message-ID: <20240410073751.2522830-4-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410073751.2522830-1-chengzhihao1@huawei.com>
References: <20240410073751.2522830-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_004631_697595_1508063A 
X-CRM114-Status: UNSURE (   7.02  )
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

This reverts commit 6379b44cdcd67f5f5d986b73953e99700591edfa. Commit
1e022216dcd2 ("ubifs: ubifs_symlink: Fix memleak of inode->i_link in
error path") is applied again in commit 6379b44cdcd6 ("ubifs:
ubifs_symlink: Fix memleak of inode->i_link in error path"), which
changed ubifs_mknod (It won't become a real problem). Just revert it.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/dir.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index eac0fef801f1..551148de66cd 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1133,8 +1133,6 @@ static int ubifs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	dir_ui->ui_size = dir->i_size;
 	mutex_unlock(&dir_ui->ui_mutex);
 out_inode:
-	/* Free inode->i_link before inode is marked as bad. */
-	fscrypt_free_inode(inode);
 	make_bad_inode(inode);
 	iput(inode);
 out_fname:
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
