Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56687C43217
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 06:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pau+KxIa6dvI+PAKPbyd4oQfS+XV4CHvOM2KK7FPh3U=; b=vawUDkURul+5SL
	VHdbmI7J5K/FXSvaP0VIj9lxAZL63iHECnd5m9tkmema9AYi9bTJWixLEGE01kKDhigvhQBZKVnof
	WsbTbUuhF9QZddBNe/gqwGaoKI8Lz9LGPLnPDFbWlOvVyrxn3/LRwFcbMAXp+sXjSgX/Vgxp6TMEp
	luiYzsITq6JoofwM5gqYXsToT/ruyOWsrezyj6sNHHIO45wraXQtYPB5HeB7OOcPl+o64AooUlW0m
	xdWPtUi3c96zL6TSlOb/tEk9bmK6RyHwLNSQnfVS2QlesuP6kLNxJng5nuFBpgtjSaEixayDIGNkE
	VJ/ao39GZM0vM8uOhASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ollvE-005omq-BS; Fri, 21 Oct 2022 06:54:24 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ollvA-005ogw-9c
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 06:54:22 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MtwDV50ZbzHty9;
	Fri, 21 Oct 2022 14:54:02 +0800 (CST)
Received: from huawei.com (10.175.101.6) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 14:54:10 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<axboe@kernel.dk>, <chaitanya.kulkarni@wdc.com>
CC: <lizetao1@huawei.com>, <hch@lst.de>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ubi: block: KASAN null-ptr-deref in ubiblock_create()
Date: Fri, 21 Oct 2022 15:57:28 +0800
Message-ID: <20221021075728.1209184-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_235420_554165_83E3BE34 
X-CRM114-Status: UNSURE (   8.32  )
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

There is a null-ptr-deref when testing the ubiblock tools:

  KASAN: null-ptr-deref in range [0x0000000000000040-0x0000000000000047]
  CPU: 1 PID: 2299 Comm: ubiblock Not tainted
  6.1.0-rc1-00002-gebb24af8c872-dirty #12
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
  BIOS 1.14.0-1.fc33 04/01/2014
  RIP: 0010:ubiblock_create.cold+0x175/0x1b5 [ubi]
  ...
  Call Trace:
   vol_cdev_ioctl+0x6ce/0x870 [ubi]
   __x64_sys_ioctl+0x11d/0x170
   do_syscall_64+0x35/0x80
   entry_SYSCALL_64_after_hwframe+0x46/0xb0
  RIP: 0033:0x7fd9141230ab

when blk_mq_alloc_tag_set() returns an error, the dev->gd is
uninitialized, that causing null-ptr-deref fault.

Fix it by replacing the disk_to_dev(dev->gd) with NULL, that
will printk "(NULL device *): ..." message if blk_mq_alloc_tag_set()
returns an error.

Fixes: 77567b25ab9f ("ubi: use blk_mq_alloc_disk and blk_cleanup_disk")
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/mtd/ubi/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 75eaecc8639f..9625dc2f45e2 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -408,7 +408,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 
 	ret = blk_mq_alloc_tag_set(&dev->tag_set);
 	if (ret) {
-		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
+		dev_err(NULL, "blk_mq_alloc_tag_set failed");
 		goto out_free_dev;
 	}
 
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
