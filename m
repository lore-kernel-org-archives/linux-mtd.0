Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C53C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 01:21:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D8B261073
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 01:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D8B261073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xyr3cEUV5UlOY3x9cdI5kaqquQWgxwmfNM8O81vepGU=; b=fr+PJNLOJwABvp
	C2vF7g5ggCOGalDVMqjx4uU/PdHuLob/Z75K/5UD1KVl3ZIQ4+ezOSZ0LAj4ZylzgoO4g3SJrIQm0
	EGJngLDC3T9dKucV4ByGmDjC/TyOKOyurCsrmNxdZ7nCBLJUkEjcCFNfjkLVqutHjWMu1zPfGCxx1
	O5N9rGyqFpEXkmz8cWu3tovyllWvyK2rk4SEphLH5rArkFahYhYmj7vInHwZXRoujwJQo65vhWuCr
	C8M4Q7bMksAUrJqNvIG6NuEifK9ZoM23tIOUrsWXsZ1I31JfXWWEIqxnv2oo1k94X6utmRN+21CkM
	meMRKscVUBN1gu2DwKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi4xJ-003jQb-U8; Wed, 03 Nov 2021 01:20:45 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi4ww-003jOD-ID
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 01:20:24 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HkTRW3tXcz1DJ6t;
 Wed,  3 Nov 2021 09:18:15 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 3 Nov 2021 09:20:17 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 3 Nov
 2021 09:20:16 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patchwork@huawei.com>, <libaokun1@huawei.com>, <yukuai3@huawei.com>,
 <chengzhihao1@huawei.com>
Subject: [PATCH -next V2 2/2] ubi: fix race between volume operations and
 uif_close
Date: Wed, 3 Nov 2021 09:32:49 +0800
Message-ID: <20211103013249.498805-3-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103013249.498805-1-libaokun1@huawei.com>
References: <20211103013249.498805-1-libaokun1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_182022_896529_3B3ABE85 
X-CRM114-Status: UNSURE (   7.54  )
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

KASAN reported a UAF about ubi:
 ==================================================================
 BUG: KASAN: use-after-free in kobject_get+0x44/0xd0
 Write of size 4 at addr ffff8881216e5038 by task ubirmvol/18988
 [...]
 Call Trace:
  kobject_get+0x44/0xd0
  get_device+0x25/0x40
  ubi_open_volume+0x22c/0x490 [ubi]
  ubi_cdev_ioctl+0x300/0x11a0 [ubi]

 Allocated by task 18850:
  ubi_read_volume_table+0x676/0x1330 [ubi]
  ubi_attach+0xd13/0x2460 [ubi]
  ubi_attach_mtd_dev+0xafa/0x17b0 [ubi]
  ctrl_cdev_ioctl+0x248/0x2b0 [ubi]

 Freed by task 18850:
  kfree+0xa2/0x490
  device_release+0x65/0x130
  kobject_put+0x17b/0x330
  device_unregister+0x39/0x90
  uif_close+0x61/0xc0 [ubi]
  ubi_attach_mtd_dev+0xdd2/0x17b0 [ubi]
  ctrl_cdev_ioctl+0x248/0x2b0 [ubi]
 [...]
 ==================================================================

The following race could cause the use-after-free problem:
           cpu1                   cpu2                  cpu3
_______________________|________________________|______________________
ctrl_cdev_ioctl
 ubi_attach_mtd_dev
  uif_init
                           ubi_cdev_ioctl
                            ubi_create_volume
                             cdev_device_add
  ubi_debugfs_init_dev
  //error goto out_uif;
  uif_close
   kill_volumes
                                                    ubi_cdev_ioctl
                                                     ubi_remove_volume
                                                      cdev_device_del
                                                       // first free
    ubi_free_volume
    // double free

To solve this problem, add spin_lock(&ubi->volumes_lock) in uif_close.

Fixes: 801c135ce73d ("UBI: Unsorted Block Images")
Reported-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
 drivers/mtd/ubi/build.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 708b1b96de01..5a11cdc6e076 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -501,7 +501,9 @@ static int uif_init(struct ubi_device *ubi)
  */
 static void uif_close(struct ubi_device *ubi)
 {
+	spin_lock(&ubi->volumes_lock);
 	kill_volumes(ubi);
+	spin_unlock(&ubi->volumes_lock);
 	cdev_device_del(&ubi->cdev, &ubi->dev);
 	unregister_chrdev_region(ubi->cdev.dev, ubi->vtbl_slots + 1);
 }
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
