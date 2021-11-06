Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BA2C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 16:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E322B61165
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 16:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E322B61165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsEBcXkupomFgNLpolWmZl08tpPJeSM9xgQWe5VcZUg=; b=NfiD+AKhSf1Lap
	/t007cALPUSLi85gh2QLpcdeJu/pueod77bYqtUfUDUkxxxpM70/qz0sgJ2Mwd/oj55mx3CHhTh9Z
	n6QR7UhIApPCgfcusxt1QawDlKthrxTyxJAF52YRpdfEJzGQuvG5OFnZB9nYABa7QDv+9VHxe5+1V
	9offs5NTRrXCUY0KejxUd5MILzhqJCEGLDjg4n+/jo6U0kuCk4O0wm+PvW4inMmsOicEc08h0x2pS
	At8GFHBN73c4ER13Xe+SrE+UTxVHl1rMRS9xlRqx5t4vjzehIUCDGZF7Vi+fSD9waPZcZqUarGWQL
	ddnetza8oOWrfIUZADWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjOph-00D8NZ-2w; Sat, 06 Nov 2021 16:46:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKzV-00CzUC-R1
 for linux-mtd@bombadil.infradead.org; Sat, 06 Nov 2021 12:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=t99OqHkN2SKaZYmNwtg713mCLUFR1MijdReqEhQvZ+0=; b=lYMuwjtX/b4BmTeJV22/kF6Wig
 /+jitqfErmfZxPhJdzw2lp8mo33J64O06V94E3Jmtp3YutCO3BXzL3rbzXnAHGe2YnGvAR6erPcQv
 yO/y6quzZ8jaDcF731GQXGc6N3TuyrfJ1C5nNNldZ0YNiXbsJbzXXbErm0zyRkb8teDQPIXNDXfoD
 BzVxpuXUfIHGu6PuwuVn/PQ2p+aFN31w+8QKZKZwGMevZX6akEM2rp844/LEnxTMFcjN5C9/KA4Q/
 g8xsiaVmRlvoBcPwIVnzmTcoaW8ev3d+JmPSjDip51EqNxZCfU5d9/AlNQBxzB/GCPEgNETlzDUyt
 sQSvH1yA==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKZR-00EVVi-23
 for linux-mtd@lists.infradead.org; Sat, 06 Nov 2021 12:13:25 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hmbjq6HR5zbhX1;
 Sat,  6 Nov 2021 20:07:59 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 20:12:46 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Sat, 6 Nov
 2021 20:12:45 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2 08/12] ubifs: setflags: Make dirtied_ino_d 8 bytes aligned
Date: Sat, 6 Nov 2021 20:25:13 +0800
Message-ID: <20211106122517.3304628-9-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211106122517.3304628-1-chengzhihao1@huawei.com>
References: <20211106122517.3304628-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_121323_989521_DF1D4106 
X-CRM114-Status: UNSURE (   9.76  )
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

Make 'ui->data_len' aligned with 8 bytes before it is assigned to
dirtied_ino_d. Since 8871d84c8f8b0c6b("ubifs: convert to fileattr")
applied, 'setflags()' only affects regular files and directories, only
xattr inode, symlink inode and special inode(pipe/char_dev/block_dev)
have none- zero 'ui->data_len' field, so assertion
'!(req->dirtied_ino_d & 7)' cannot fail in ubifs_budget_space().
To avoid assertion fails in future evolution(eg. setflags can operate
special inodes), it's better to make dirtied_ino_d 8 bytes aligned,
after all aligned size is still zero for regular files.

Fixes: 1e51764a3c2ac05a ("UBIFS: add new flash file system")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index c6a863487780..71bcebe45f9c 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -108,7 +108,7 @@ static int setflags(struct inode *inode, int flags)
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 	struct ubifs_budget_req req = { .dirtied_ino = 1,
-					.dirtied_ino_d = ui->data_len };
+			.dirtied_ino_d = ALIGN(ui->data_len, 8) };
 
 	err = ubifs_budget_space(c, &req);
 	if (err)
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
