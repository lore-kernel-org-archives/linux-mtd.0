Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7528AC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 01:21:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B04561053
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 01:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B04561053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NYM1/xynR/PkYt7HH8qMYmR8AAV2rk+JAx8s2NGj0w=; b=tXoszIozY1HHbY
	O21Zu/Ynh63WxtymzknW8uxNJAQGc1KYnm0UPeNaI2dEWrTlKh/5GSTDu6SnhnR8KrJSU6aeL+0TD
	sW5oAt7lK8gNfl3hmHRUzmubUqekPMd9mGCndvRKEHupf9nzICVpRpm6JQWHtOQnqFAxtp+Id1CYl
	c8oHsJsOfN99VqfrYgCNissfrPBey4oZTcWbMXd5fQW7/yV2eyHy4UO7Nbcp0buzB41phP8Lp0I3w
	yhq7464hUEK/yiY0SxFBboQHUgH4a79lHrsvj2XOs2lMQwaF33hFWnJwCgNiWlI+3UP6HhcHL6QkZ
	4SZvg6ZNV76JmFCVd5hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi4wv-003jOM-Q5; Wed, 03 Nov 2021 01:20:21 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi4wr-003jLM-Ck
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 01:20:19 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HkTNF3r9FzbhGy;
 Wed,  3 Nov 2021 09:15:25 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 3 Nov 2021 09:20:09 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 3 Nov
 2021 09:20:09 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patchwork@huawei.com>, <libaokun1@huawei.com>, <yukuai3@huawei.com>,
 <chengzhihao1@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next V2 1/2] ubi: fix race between volume operations and
 uif_init
Date: Wed, 3 Nov 2021 09:32:48 +0800
Message-ID: <20211103013249.498805-2-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103013249.498805-1-libaokun1@huawei.com>
References: <20211103013249.498805-1-libaokun1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_182017_997077_C17CB379 
X-CRM114-Status: GOOD (  10.08  )
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

Hulk Robot reported a KASAN report about use-after-free:
 ==================================================================
 BUG: KASAN: use-after-free in __list_del_entry_valid+0x13d/0x160
 Read of size 8 at addr ffff888035e37d98 by task ubiattach/1385
 [...]
 Call Trace:
  klist_dec_and_del+0xa7/0x4a0
  klist_put+0xc7/0x1a0
  device_del+0x4d4/0xed0
  cdev_device_del+0x1a/0x80
  ubi_attach_mtd_dev+0x2951/0x34b0 [ubi]
  ctrl_cdev_ioctl+0x286/0x2f0 [ubi]

 Allocated by task 1414:
  device_add+0x60a/0x18b0
  cdev_device_add+0x103/0x170
  ubi_create_volume+0x1118/0x1a10 [ubi]
  ubi_cdev_ioctl+0xb7f/0x1ba0 [ubi]

 Freed by task 1385:
  cdev_device_del+0x1a/0x80
  ubi_remove_volume+0x438/0x6c0 [ubi]
  ubi_cdev_ioctl+0xbf4/0x1ba0 [ubi]
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
   ubi_add_volume
   // sysfs exist
   kill_volumes
                                                    ubi_cdev_ioctl
                                                     ubi_remove_volume
                                                      cdev_device_del
                                                       // first free
    ubi_free_volume
     cdev_del
     // double free
   cdev_device_del

The lock held by ctrl_cdev_ioctl is ubi_devices_mutex, but the lock held by
ubi_cdev_ioctl is ubi->device_mutex. Therefore, the two locks can be
concurrent. However, volume addition and deletion operations are performed
in both ctrl_cdev_ioctl and ubi_cdev_ioctl. When these operations are
performed concurrently in both ioctl, a race condition may be triggered.The
UAF stack above is one such case.

To solve this problem, add spin_lock(&ubi->volumes_lock) to ctrl_cdev_ioctl
where volumes are added and deleted.

Fixes: 801c135ce73d ("UBI: Unsorted Block Images")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
 drivers/mtd/ubi/build.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index a7e3eb9befb6..708b1b96de01 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -467,6 +467,7 @@ static int uif_init(struct ubi_device *ubi)
 	if (err)
 		goto out_unreg;
 
+	spin_lock(&ubi->volumes_lock);
 	for (i = 0; i < ubi->vtbl_slots; i++)
 		if (ubi->volumes[i]) {
 			err = ubi_add_volume(ubi, ubi->volumes[i]);
@@ -475,11 +476,13 @@ static int uif_init(struct ubi_device *ubi)
 				goto out_volumes;
 			}
 		}
+	spin_unlock(&ubi->volumes_lock);
 
 	return 0;
 
 out_volumes:
 	kill_volumes(ubi);
+	spin_unlock(&ubi->volumes_lock);
 	cdev_device_del(&ubi->cdev, &ubi->dev);
 out_unreg:
 	unregister_chrdev_region(ubi->cdev.dev, ubi->vtbl_slots + 1);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
