Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F33C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Dec 2021 03:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WVGzsFY4t3ruUx4yBefeME+fNCyzv3YA71N2Fc8tUsI=; b=MWeHcKe5hXt8Bt
	BVFO1x7dXNM0oviOZ59H++eSQkCNnAUXvkM6eAs0kH1lTL7Fu7Zq/n2I6afm3H0SILHCnfL3dlflf
	I3Nv4+J6WXgcvEs7EqRxZIVIMYCXN6tWskHPmYIY3RfDT4XtkG31ys827Fp4B+aVlew2TkZ6F53Lz
	WJZSL94vAo0PaICPKTKb5ANJwgtHf9KeobtpcEXB6XDS4GWKieHExq0ypEsKtWHB6xSS5Um1QLGMj
	pOxKr/8tkDlQqrF7HcCjxdC0vxjuq+KtJRIW8iqFxNh+TRXKRd+Usx1y/vC3hCbXyvbOQyZ5hCIbT
	FOE4LGF30iJG1oy3wf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1gQo-00G42n-SA; Mon, 27 Dec 2021 03:12:14 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1gQk-00G3ye-Lb
 for linux-mtd@lists.infradead.org; Mon, 27 Dec 2021 03:12:12 +0000
Received: from kwepemi500003.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JMjM46rLdz8w58;
 Mon, 27 Dec 2021 11:09:36 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi500003.china.huawei.com (7.221.188.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 11:12:02 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 27 Dec
 2021 11:12:01 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>,
 <s.hauer@pengutronix.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 01/15] ubifs: rename_whiteout: Fix double free for
 whiteout_ui->data
Date: Mon, 27 Dec 2021 11:22:32 +0800
Message-ID: <20211227032246.2886878-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211227032246.2886878-1-chengzhihao1@huawei.com>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_191210_918644_3AB1FC5A 
X-CRM114-Status: UNSURE (   6.92  )
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

'whiteout_ui->data' will be freed twice if space budget fail for
rename whiteout operation as following process:

rename_whiteout
  dev = kmalloc
  whiteout_ui->data = dev
  kfree(whiteout_ui->data)  // Free first time
  iput(whiteout)
    ubifs_free_inode
      kfree(ui->data)	    // Double free!

KASAN reports:
==================================================================
BUG: KASAN: double-free or invalid-free in ubifs_free_inode+0x4f/0x70
Call Trace:
  kfree+0x117/0x490
  ubifs_free_inode+0x4f/0x70 [ubifs]
  i_callback+0x30/0x60
  rcu_do_batch+0x366/0xac0
  __do_softirq+0x133/0x57f

Allocated by task 1506:
  kmem_cache_alloc_trace+0x3c2/0x7a0
  do_rename+0x9b7/0x1150 [ubifs]
  ubifs_rename+0x106/0x1f0 [ubifs]
  do_syscall_64+0x35/0x80

Freed by task 1506:
  kfree+0x117/0x490
  do_rename.cold+0x53/0x8a [ubifs]
  ubifs_rename+0x106/0x1f0 [ubifs]
  do_syscall_64+0x35/0x80

The buggy address belongs to the object at ffff88810238bed8 which
belongs to the cache kmalloc-8 of size 8
==================================================================

Let ubifs_free_inode() free 'whiteout_ui->data'. BTW, delete unused
assignment 'whiteout_ui->data_len = 0', process 'ubifs_evict_inode()
-> ubifs_jnl_delete_inode() -> ubifs_jnl_write_inode()' doesn't need it
(because 'inc_nlink(whiteout)' won't be excuted by 'goto out_release',
 and the nlink of whiteout inode is 0).

Fixes: 9e0a1fff8db56ea ("ubifs: Implement RENAME_WHITEOUT")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/dir.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 7c61d0ec0159..cfa8881d8cca 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1425,8 +1425,6 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 		err = ubifs_budget_space(c, &wht_req);
 		if (err) {
-			kfree(whiteout_ui->data);
-			whiteout_ui->data_len = 0;
 			iput(whiteout);
 			goto out_release;
 		}
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
