Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2300C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Dec 2021 10:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsEBcXkupomFgNLpolWmZl08tpPJeSM9xgQWe5VcZUg=; b=NNuyqGnljetYDq
	AyTgRGCW9TbvWLYU2G1kdf9VHQ2gXYB5xpnCXmePvhewh3kb82CWLns38s2bdSgTmW8Tfg+Ag/5Y/
	q6RwFaoe61pYsnfsFRogyPZlDmGvs83xVa3356Uh2VliACItXivdo/UPHsQJVjjcOlhQvUT7cCicd
	0xTv1O4CqNLu/xe3UxgMQYxvYgRwBFrBtB32WBkamYHue+QZ2QDMHSwkX6Xnq+hpXc7mnYJlXGng2
	OaqYXZTWvFOibbQpQBVECyzkGyxnTIQcYGvIY84GAAC3hpxBG3zcdaWwXeA1B7TnNYUN2PgM/lXqj
	J2m0FrlCTli9vmTgO1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myWwq-00DWot-Bn; Sat, 18 Dec 2021 10:28:16 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myWsU-00DVQ2-93
 for linux-mtd@lists.infradead.org; Sat, 18 Dec 2021 10:23:48 +0000
Received: from kwepemi100010.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JGMLX4dTLz1DK4c;
 Sat, 18 Dec 2021 18:20:36 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100010.china.huawei.com (7.221.188.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 18 Dec 2021 18:23:40 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sat, 18 Dec
 2021 18:23:39 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>,
 <Artem.Bityutskiy@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>
Subject: [PATCH v4 08/13] ubifs: setflags: Make dirtied_ino_d 8 bytes aligned
Date: Sat, 18 Dec 2021 18:35:07 +0800
Message-ID: <20211218103512.370420-9-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211218103512.370420-1-chengzhihao1@huawei.com>
References: <20211218103512.370420-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_022346_769710_E33B43E8 
X-CRM114-Status: UNSURE (   9.29  )
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
