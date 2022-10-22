Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556CAC04A95
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Oct 2022 11:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NEZOHCxvTNf+fkh993695aYAe22g2uS7q+Q9dbCiMMs=; b=lMTBICB3nEZW/4
	OMlPlSFckMbOnOcb6O8Th7cNRWlScCFshNocC0SQR5+361bA0J2Vbc8y41h5d8fXxBeMem8w4V4Im
	PWEmyu64k6cnqwcwTf4uQ0QLRnS8/bIzk8P8ZTSGwmR5kJ0cBD4JMs+s+HapCi01iFlh/yCgw8nMM
	ozRtr1/F/Yv3fsi3W4uiJ12zM0ZqVW5PXPxw8/f3iIPXcWpxUhHDPi6PEdHeMgIi3oDfYfSy4UDhB
	0Y+4eEa3ozDZ7Fa9nL8BYWILX5okIPW5WFBkkrErT5mUs4f3stTfJyipE6emOg62xuc/wMRJqEOss
	636rDAG8nbhwDVMBp19g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omCOw-00CLJ0-1m; Sat, 22 Oct 2022 11:10:50 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omCOt-00CLHZ-6q
	for linux-mtd@lists.infradead.org; Sat, 22 Oct 2022 11:10:49 +0000
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mvdp92qkYzpVjv;
	Sat, 22 Oct 2022 19:07:13 +0800 (CST)
Received: from localhost.localdomain (10.175.101.6) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 22 Oct 2022 19:10:34 +0800
From: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To: <zhangxiaoxu5@huawei.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<dbrownell@users.sourceforge.net>
Subject: [PATCH] mtd: Fix device name leak when register device failed in add_mtd_device()
Date: Sat, 22 Oct 2022 20:13:52 +0800
Message-ID: <20221022121352.2534682-1-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_041047_467220_D47FD61B 
X-CRM114-Status: UNSURE (   8.66  )
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

There is a kmemleak when register device failed:
  unreferenced object 0xffff888101aab550 (size 8):
    comm "insmod", pid 3922, jiffies 4295277753 (age 925.408s)
    hex dump (first 8 bytes):
      6d 74 64 30 00 88 ff ff                          mtd0....
    backtrace:
      [<00000000bde26724>] __kmalloc_node_track_caller+0x4e/0x150
      [<000000003c32b416>] kvasprintf+0xb0/0x130
      [<000000001f7a8f15>] kobject_set_name_vargs+0x2f/0xb0
      [<000000006e781163>] dev_set_name+0xab/0xe0
      [<00000000e30d0c78>] add_mtd_device+0x4bb/0x700
      [<00000000f3d34de7>] mtd_device_parse_register+0x2ac/0x3f0
      [<00000000c0d88488>] 0xffffffffa0238457
      [<00000000b40d0922>] 0xffffffffa02a008f
      [<0000000023d17b9d>] do_one_initcall+0x87/0x2a0
      [<00000000770f6ca6>] do_init_module+0xdf/0x320
      [<000000007b6768fe>] load_module+0x2f98/0x3330
      [<00000000346bed5a>] __do_sys_finit_module+0x113/0x1b0
      [<00000000674c2290>] do_syscall_64+0x35/0x80
      [<000000004c6a8d97>] entry_SYSCALL_64_after_hwframe+0x46/0xb0

If register device failed, should call put_device() to give up the
reference.

Fixes: 1f24b5a8ecbb ("[MTD] driver model updates")
Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
---
 drivers/mtd/mtdcore.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 18aa54460d36..f4858310331c 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -723,8 +723,10 @@ int add_mtd_device(struct mtd_info *mtd)
 	mtd_check_of_node(mtd);
 	of_node_get(mtd_get_of_node(mtd));
 	error = device_register(&mtd->dev);
-	if (error)
+	if (error) {
+		put_device(&mtd->dev);
 		goto fail_added;
+	}
 
 	/* Add the nvmem provider */
 	error = mtd_nvmem_add(mtd);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
