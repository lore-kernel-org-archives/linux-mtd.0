Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECA1C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 07:38:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A83776101E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 07:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A83776101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=46daX4mMAjD6LBtP+frG9B7hY65ZPlgGIoI8YX2uJtM=; b=Bo+OLMuj9hRXDPOkobVyo0xvIz
	6uPuoYuFquuXn053MLbAbFrfUEZKMF+jdPpZe9syHwTdx3Hv81GFrjRTvMi6gHZQAC19+RKFOWdmZ
	79u7ooJ3KBTVZhJrAV+k0WGMfBMaVa4PpIqRMZsjd+XzfEc6GvSa2i0svPlS3Fs8WroF0rIXWJTxm
	pGP+78PoWNQ0ZT85KfDWfNoGAQxNX1LpCXQdZ/7z+oapl2Ul4wmh2PGeyYhNZ/UDH0739sBuhKS7N
	py6o/wSf2PnkoGaeW1sGqyGRf/ZHAOIYh/syqVb9h3+9ykzZhAmdGEIrRGTg5h/1KR6m+Mf9kvpPb
	yemr8OkQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRrtc-008nqh-S5; Thu, 01 Apr 2021 07:37:40 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRrtX-008noZ-Re
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 07:37:38 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F9w2K1XHKz9tKD;
 Thu,  1 Apr 2021 15:35:21 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Thu, 1 Apr 2021 15:37:16 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <tudor.ambarus@microchip.com>, <p.yadav@ti.com>, <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linuxarm@huawei.com>, <prime.zeng@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH RESEND] mtd:spi-nor: Fix an issue of releasing resources
 during read/write
Date: Thu, 1 Apr 2021 15:34:46 +0800
Message-ID: <1617262486-4223-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_083736_233914_7B1731FF 
X-CRM114-Status: GOOD (  12.84  )
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

From: Xiang Chen <chenxiang66@hisilicon.com>

If rmmod the driver during read or write, the driver will release the
resources which are used during read or write, so it is possible to
refer to NULL pointer.

Use the testcase "mtd_debug read /dev/mtd0 0xc00000 0x400000 dest_file &
sleep 0.5;rmmod spi_hisi_sfc_v3xx.ko", the issue can be reproduced in
hisi_sfc_v3xx driver.

To avoid the issue, fill the interface _get_device and _put_device of
mtd_info to grab the reference to the spi controller driver module, so
the request of rmmod the driver is rejected before read/write is finished.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/mtd/spi-nor/core.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0522304..72bc134 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3301,6 +3301,37 @@ static void spi_nor_resume(struct mtd_info *mtd)
 		dev_err(dev, "resume() failed\n");
 }
 
+static int spi_nor_get_device(struct mtd_info *mtd)
+{
+	struct mtd_info *master = mtd_get_master(mtd);
+	struct spi_nor *nor = mtd_to_spi_nor(master);
+	struct device *dev;
+
+	if (nor->spimem)
+		dev = nor->spimem->spi->controller->dev.parent;
+	else
+		dev = nor->dev;
+
+	if (!try_module_get(dev->driver->owner))
+		return -ENODEV;
+
+	return 0;
+}
+
+static void spi_nor_put_device(struct mtd_info *mtd)
+{
+	struct mtd_info *master = mtd_get_master(mtd);
+	struct spi_nor *nor = mtd_to_spi_nor(master);
+	struct device *dev;
+
+	if (nor->spimem)
+		dev = nor->spimem->spi->controller->dev.parent;
+	else
+		dev = nor->dev;
+
+	module_put(dev->driver->owner);
+}
+
 void spi_nor_restore(struct spi_nor *nor)
 {
 	/* restore the addressing mode */
@@ -3495,6 +3526,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	mtd->_read = spi_nor_read;
 	mtd->_suspend = spi_nor_suspend;
 	mtd->_resume = spi_nor_resume;
+	mtd->_get_device = spi_nor_get_device;
+	mtd->_put_device = spi_nor_put_device;
 
 	if (nor->params->locking_ops) {
 		mtd->_lock = spi_nor_lock;
-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
