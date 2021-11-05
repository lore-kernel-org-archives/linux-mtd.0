Return-Path: <SRS0=f+i+=PY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E9CC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Nov 2021 09:18:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABA8161220
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Nov 2021 09:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABA8161220
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S/kFbT3wH6CYOtQdkae+yYbnclTNKHaRhr6w0Gc15jE=; b=QDfTXDlMeiwpEH
	HfQxoH86uN25Y/tFctEixJ9xM3Cglqb61uCD/uetSn8yjckZOb76Q5ip4ib5DMdcdW1QT5WgDfUF/
	KUAj9jv9vPPGI+7qJupswoyqbeQOUS2A9VveJpqcUeO/kjyqYba9FFJQ8Ro57EwO01hBRZMfVYUfG
	gOvn6MG76QKqT1ZV2C5IHGRH0Pyx+jXuEW3Pw7NhVIsg2grmMx+5jlNTkRW4fUPkA7EI1rodpFISG
	ELYkgYWjGSMj94YgJbTanlHPDSSW2Oxy7GjLq9Ewq7vkoWCYkIBIMfzsWT4P6QQCEg3mbGett8DAC
	YD6K2nZqA3R/bnpnUMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mivMC-00Aw8G-Nq; Fri, 05 Nov 2021 09:17:56 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mivM8-00Aw5P-Rx
 for linux-mtd@lists.infradead.org; Fri, 05 Nov 2021 09:17:55 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hlvzb2fTPz90QY;
 Fri,  5 Nov 2021 17:17:31 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 5 Nov 2021 17:17:42 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 17:17:41 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <libaokun1@huawei.com>, <yukuai3@huawei.com>, Hulk Robot
 <hulkci@huawei.com>
Subject: [PATCH -next V3] ubi: fix race condition between ctrl_cdev_ioctl and
 ubi_cdev_ioctl
Date: Fri, 5 Nov 2021 17:30:22 +0800
Message-ID: <20211105093022.1360601-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_021753_568016_7CB26CF2 
X-CRM114-Status: GOOD (  11.64  )
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

The lock held by ctrl_cdev_ioctl is ubi_devices_mutex, but the lock held
by ubi_cdev_ioctl is ubi->device_mutex. Therefore, the two locks can be
concurrent.

ctrl_cdev_ioctl contains two operations: ubi_attach and ubi_detach.
ubi_detach is bug-free because it uses reference counting to prevent
concurrency. However, uif_init and uif_close in ubi_attach may race with
ubi_cdev_ioctl.

uif_init will race with ubi_cdev_ioctl as in the following stack.
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

And uif_close will race with ubi_cdev_ioctl as in the following stack.
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

The cause of this problem is that commit 714fb87e8bc0 make device
"available" before it becomes accessible via sysfs. Therefore, we
roll back the modification. We will fix the race condition between
ubi device creation and udev by removing ubi_get_device in
vol_attribute_show and dev_attribute_show.This avoids accessing
uninitialized ubi_devices[ubi_num].

ubi_get_device is used to prevent devices from being deleted during
sysfs execution. However, now kernfs ensures that devices will not
be deleted before all reference counting are released.
The key process is shown in the following stack.

device_del
  device_remove_attrs
    device_remove_groups
      sysfs_remove_groups
        sysfs_remove_group
          remove_files
            kernfs_remove_by_name
              kernfs_remove_by_name_ns
                __kernfs_remove
                  kernfs_drain

Fixes: 714fb87e8bc0 ("ubi: Fix race condition between ubi device creation and udev")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
V1->V2:
	Add race in uif_close
V2->V3:
	Solution modified becase ubi_add_volume might sleepping in spin_lock.

 drivers/mtd/ubi/build.c | 9 +--------
 drivers/mtd/ubi/vmt.c   | 8 +-------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index a7e3eb9befb6..a32050fecabf 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -351,9 +351,6 @@ static ssize_t dev_attribute_show(struct device *dev,
 	 * we still can use 'ubi->ubi_num'.
 	 */
 	ubi = container_of(dev, struct ubi_device, dev);
-	ubi = ubi_get_device(ubi->ubi_num);
-	if (!ubi)
-		return -ENODEV;
 
 	if (attr == &dev_eraseblock_size)
 		ret = sprintf(buf, "%d\n", ubi->leb_size);
@@ -382,7 +379,6 @@ static ssize_t dev_attribute_show(struct device *dev,
 	else
 		ret = -EINVAL;
 
-	ubi_put_device(ubi);
 	return ret;
 }
 
@@ -979,9 +975,6 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 			goto out_detach;
 	}
 
-	/* Make device "available" before it becomes accessible via sysfs */
-	ubi_devices[ubi_num] = ubi;
-
 	err = uif_init(ubi);
 	if (err)
 		goto out_detach;
@@ -1026,6 +1019,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	wake_up_process(ubi->bgt_thread);
 	spin_unlock(&ubi->wl_lock);
 
+	ubi_devices[ubi_num] = ubi;
 	ubi_notify_all(ubi, UBI_VOLUME_ADDED, NULL);
 	return ubi_num;
 
@@ -1034,7 +1028,6 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 out_uif:
 	uif_close(ubi);
 out_detach:
-	ubi_devices[ubi_num] = NULL;
 	ubi_wl_close(ubi);
 	ubi_free_all_volumes(ubi);
 	vfree(ubi->vtbl);
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 139ee132bfbc..1bc7b3a05604 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -56,16 +56,11 @@ static ssize_t vol_attribute_show(struct device *dev,
 {
 	int ret;
 	struct ubi_volume *vol = container_of(dev, struct ubi_volume, dev);
-	struct ubi_device *ubi;
-
-	ubi = ubi_get_device(vol->ubi->ubi_num);
-	if (!ubi)
-		return -ENODEV;
+	struct ubi_device *ubi = vol->ubi;
 
 	spin_lock(&ubi->volumes_lock);
 	if (!ubi->volumes[vol->vol_id]) {
 		spin_unlock(&ubi->volumes_lock);
-		ubi_put_device(ubi);
 		return -ENODEV;
 	}
 	/* Take a reference to prevent volume removal */
@@ -103,7 +98,6 @@ static ssize_t vol_attribute_show(struct device *dev,
 	vol->ref_count -= 1;
 	ubi_assert(vol->ref_count >= 0);
 	spin_unlock(&ubi->volumes_lock);
-	ubi_put_device(ubi);
 	return ret;
 }
 
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
