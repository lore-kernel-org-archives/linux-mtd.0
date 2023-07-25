Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945A1C001DE
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YLQf3wbMyEv5J+OzhZeR6FOoDAg7y9jxjmGBMCaR3HE=; b=NNtDrhV46geB7U
	nCrd8g9dZjGkt3zX0rwtkb0/5LJrfoDlNlaRbn1yKaeqdn66eeqUGXAWkkdOT8tYKHjRb1iaGhcPA
	1/YLLjSQ8/09DCgTanixQ+tLZtQe+gu5YFwNa959XDucA//RgN3dQI9opGvmtkklrUd3kU950ohtj
	eUTq92upEhB5dzZefPaQsTKdOZKMYxA3FNELFJ4fZ3R9AvaNZ1iXyFp0b2FUOVFbpRigeT13Jlrhg
	CiFsAFN7Zj0jWcO8f2nVKHdwnUU/7di1f9Sovmvmz7kO8QXhrBWeZTXZ3SsESkbwhXjlwoiB6Wyxn
	XfvhwZDH7M2xYe9fPuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOIXc-007iVe-2x;
	Tue, 25 Jul 2023 13:57:32 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOIXa-007iSN-0L
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 13:57:32 +0000
Received: from dggpeml100024.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R9JV01fHdz1GDL2;
	Tue, 25 Jul 2023 21:56:24 +0800 (CST)
Received: from china (10.175.101.107) by dggpeml100024.china.huawei.com
 (7.185.36.115) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 25 Jul
 2023 21:57:15 +0800
From: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To: <linux-mtd@lists.infradead.org>, <tomas.winkler@intel.com>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: [PATCH -next] mtd: Fix the refcount error of the mtd info
Date: Tue, 25 Jul 2023 21:55:39 +0000
Message-ID: <20230725215539.3135304-1-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.107]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml100024.china.huawei.com (7.185.36.115)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_065730_367997_2673F408 
X-CRM114-Status: GOOD (  10.45  )
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

There is a UAF when test the mchp23k256 driver with bpf mock device:

  BUG: KASAN: slab-use-after-free in device_pm_remove+0x7d/0xe0
  Write of size 8 at addr ffff888118bf0400 by task python3/261

  CPU: 0 PID: 261 Comm: python3 Tainted: G        W        N 6.5.0-rc2+
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
  Call Trace:
   <TASK>
   dump_stack_lvl+0x65/0xb0
   print_report+0xcc/0x620
   kasan_report+0xba/0xf0
   device_pm_remove+0x7d/0xe0
   device_del+0x273/0x780
   spi_unregister_device+0xa3/0x140
   delete_device_store+0x172/0x290
   dev_attr_store+0x3e/0x70
   sysfs_kf_write+0x8c/0xb0
   kernfs_fop_write_iter+0x246/0x330
   vfs_write+0x646/0x840
   ksys_write+0xd6/0x1b0
   do_syscall_64+0x38/0x90
   entry_SYSCALL_64_after_hwframe+0x6e/0xd8

  Allocated by task 261:
   kasan_save_stack+0x1e/0x40
   kasan_set_track+0x21/0x30
   __kasan_kmalloc+0x7b/0x90
   __kmalloc_node_track_caller+0x57/0x150
   devm_kmalloc+0x6a/0x1c0
   mchp23k256_probe+0x28/0x270 [mchp23k256]
   spi_probe+0xe1/0x140
   really_probe+0x283/0x530
   __driver_probe_device+0xe5/0x1e0
   device_driver_attach+0x75/0x120
   bind_store+0xa4/0x120
   drv_attr_store+0x49/0x70
   sysfs_kf_write+0x8c/0xb0
   kernfs_fop_write_iter+0x246/0x330
   vfs_write+0x646/0x840
   ksys_write+0xd6/0x1b0
   do_syscall_64+0x38/0x90
   entry_SYSCALL_64_after_hwframe+0x6e/0xd8

  Freed by task 261:
   kasan_save_stack+0x1e/0x40
   kasan_set_track+0x21/0x30
   kasan_save_free_info+0x27/0x40
   __kasan_slab_free+0x106/0x190
   __kmem_cache_free+0xdd/0x330
   devres_release_all+0x143/0x1b0
   device_unbind_cleanup+0x19/0xd0
   device_release_driver_internal+0x31f/0x380
   unbind_store+0xce/0xd0
   drv_attr_store+0x49/0x70
   sysfs_kf_write+0x8c/0xb0
   kernfs_fop_write_iter+0x246/0x330
   vfs_write+0x646/0x840
   ksys_write+0xd6/0x1b0
   do_syscall_64+0x38/0x90
   entry_SYSCALL_64_after_hwframe+0x6e/0xd8

The refcount of the parent was increased when get the mtd device with
MTD_PARTITIONED_MASTER enabled, but always decrease when put the mtd
device, it will lead refcount error.

Fixes: 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
---
 drivers/mtd/mtdcore.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2466ea466466..7c2040a7af0a 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1335,12 +1335,12 @@ void __put_mtd_device(struct mtd_info *mtd)
 	while (mtd != master) {
 		struct mtd_info *parent = mtd->parent;
 
-		kref_put(&mtd->refcnt, mtd_device_release);
+		if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+			kref_put(&mtd->refcnt, mtd_device_release);
 		mtd = parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
-		kref_put(&master->refcnt, mtd_device_release);
+	kref_put(&master->refcnt, mtd_device_release);
 
 	module_put(master->owner);
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
