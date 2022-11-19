Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BC2C433FE
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Nov 2022 06:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SK0OYyZrmbBzLHeFnoUMdToMWYhMBVkoJYFPMpXsQNM=; b=NRhL8T6O7/mgw/
	c/ZyguJKS9QNTVGLq17lItOjuPvm5skIXkHBSZvgPZzkJYGFO88mL5+N4XGHqW8mXh91UgPIRcJ6t
	ayudaW/YsTMtyULtHlCyfjxz+zCfCbr80D4qtVIeDuc4FPhKiuKYCgtSuJxCihlLgrNlpL8cmP3U9
	Z3XX1+MMaA4XxFS54uG8E1cGXeTh4Y1yw5U9xmLfmlOdsfiryUfCc+TXW7OxB1X1CdvacOJHxpsw0
	iC1FhxwfzS3z8v1oqYksH+uX0/yN7PMA0Urvs10z/pmaAZZpzhpvCa+xOYiUWFC1ZEhgdmOyLqCkF
	yhMV+JOd2Jx1jmwxPQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owHXE-00BmWm-Aq; Sat, 19 Nov 2022 06:41:04 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owHXA-00BmRo-6n
	for linux-mtd@lists.infradead.org; Sat, 19 Nov 2022 06:41:02 +0000
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NDkYS6t9XzRp9x;
	Sat, 19 Nov 2022 14:40:28 +0800 (CST)
Received: from huawei.com (10.175.100.227) by kwepemi500016.china.huawei.com
 (7.221.188.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 19 Nov
 2022 14:40:52 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<zev@bewilderbeest.net>, <linux-mtd@lists.infradead.org>
CC: <shangxiaojing@huawei.com>
Subject: [PATCH] mtd: core: Fix ERROR of refcount due to del_mtd_device()
Date: Sat, 19 Nov 2022 14:39:15 +0800
Message-ID: <20221119063915.11108-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_224100_461309_289CE094 
X-CRM114-Status: GOOD (  10.19  )
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

del_mtd_device() will call of_node_put() to mtd_get_of_node(mtd), which
is mtd->dev.of_node. However, memset(&mtd->dev, 0) is called before
of_node_put(). As the result, of_node_put() won't do anything in
del_mtd_device(), and causes the refcount leak.

del_mtd_device()
    memset(&mtd->dev, 0, sizeof(mtd->dev) # clear mtd->dev
    of_node_put()
        mtd_get_of_node(mtd) # mtd->dev is cleared, can't locate of_node
                             # of_node_put(NULL) won't do anything

Fix the ERROR by caching the pointer of the device_node.

OF: ERROR: memory leak, expected refcount 1 instead of 2,
of_node_get()/of_node_put() unbalanced - destroy cset entry: attach
overlay node /spi/spi-sram@0
CPU: 3 PID: 275 Comm: python3 Tainted: G N 6.1.0-rc3+ #54
    0d8a1edddf51f172ff5226989a7565c6313b08e2
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
rel-1.15.0-0-g2dd4b9b3f840-prebuilt.qemu.org 04/01/2014
Call Trace:
<TASK>
    dump_stack_lvl+0x67/0x83
    kobject_get+0x155/0x160
    of_node_get+0x1f/0x30
    of_fwnode_get+0x43/0x70
    fwnode_handle_get+0x54/0x80
    fwnode_get_nth_parent+0xc9/0xe0
    fwnode_full_name_string+0x3f/0xa0
    device_node_string+0x30f/0x750
    pointer+0x598/0x7a0
    vsnprintf+0x62d/0x9b0
    ...
    cfs_overlay_release+0x30/0x90
    config_item_release+0xbe/0x1a0
    config_item_put+0x5e/0x80
    configfs_rmdir+0x3bd/0x540
    vfs_rmdir+0x18c/0x320
    do_rmdir+0x198/0x330
    __x64_sys_rmdir+0x2c/0x40
    do_syscall_64+0x37/0x90
    entry_SYSCALL_64_after_hwframe+0x63/0xcd

Fixes: 00596576a051 ("mtd: core: clear out unregistered devices a bit more")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/mtd/mtdcore.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 18aa54460d36..74b1a1c61b39 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -774,6 +774,7 @@ int del_mtd_device(struct mtd_info *mtd)
 {
 	int ret;
 	struct mtd_notifier *not;
+	struct device_node *mtd_of_node;
 
 	mutex_lock(&mtd_table_mutex);
 
@@ -792,6 +793,7 @@ int del_mtd_device(struct mtd_info *mtd)
 		       mtd->index, mtd->name, mtd->usecount);
 		ret = -EBUSY;
 	} else {
+		mtd_of_node = mtd_get_of_node(mtd);
 		debugfs_remove_recursive(mtd->dbg.dfs_dir);
 
 		/* Try to remove the NVMEM provider */
@@ -803,7 +805,7 @@ int del_mtd_device(struct mtd_info *mtd)
 		memset(&mtd->dev, 0, sizeof(mtd->dev));
 
 		idr_remove(&mtd_idr, mtd->index);
-		of_node_put(mtd_get_of_node(mtd));
+		of_node_put(mtd_of_node);
 
 		module_put(THIS_MODULE);
 		ret = 0;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
