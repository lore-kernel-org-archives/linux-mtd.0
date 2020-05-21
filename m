Return-Path: <SRS0=CeWw=7D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F108C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 11:25:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D08762072C
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 11:25:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T97DJOhB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D08762072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6mLEIhD1XJDTiny5X2FzzVQAB/n5bteyAmDhQAsMFo=; b=T97DJOhBtPDh0+
	6kyChh+y58jVTu1LsBd7J4g7R0MYVlMT114DlPdOgig//hlcoEZvrP34cO9f2JLVFG5SW0l/kSw9p
	6alz6KKHHHYIDPj9CbqDIVO1Dvx2i2dSBY+O9awvPcYy2IVNvXs0KxRDDnJZBfzdz8WK8/RHvEkO7
	Vb3NtgOt10z5tLQZxcm2e0h6tpOvpWAawtIMUTcGyhmk+GT22RBTi5yoafWnlL8pQJx1oe7Vpyo2T
	Y0JHDRD2XM84Ln6DnTqNcEQOxiiA8QVSWi65ztDb7n17qr8ACxcH5Hv9cL5wic5gUeSKPa4sx8UDX
	RlRiZ86uKQpid065RLrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbjK0-00051f-LA; Thu, 21 May 2020 11:25:08 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbjJL-0003mz-PL
 for linux-mtd@lists.infradead.org; Thu, 21 May 2020 11:24:29 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0389779028A765082C68;
 Thu, 21 May 2020 19:24:18 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Thu, 21 May 2020 19:24:07 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <broonie@kernel.org>, <tudor.ambarus@microchip.com>,
 <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 2/3] mtd: spi-nor: Add prepare/unprepare support for
 spimem device
Date: Thu, 21 May 2020 19:23:50 +0800
Message-ID: <1590060231-23242-3-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1590060231-23242-1-git-send-email-yangyicong@hisilicon.com>
References: <1590060231-23242-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_042428_023519_D4CB61D8 
X-CRM114-Status: GOOD (  11.57  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, john.garry@huawei.com, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

spi-nor flash's read/write/erase/lock/unlock may be composed of a set
of operations, and some prepare/unprepare works need to be done before/
after these operations in spi_nor_{lock, unlock}_and_{prep, unprep}().
Previously we only call spi-nor controllers' prepare/unprepare method
in the functions, without spimem devices'.

Add spimem devices' prepare/unprepare support. Call spi_mem_{prepare,
unprepare}() function if it's a spimem device.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/mtd/spi-nor/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index cc68ea8..3a7e40a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1103,7 +1103,9 @@ int spi_nor_lock_and_prep(struct spi_nor *nor)
 
 	mutex_lock(&nor->lock);
 
-	if (nor->controller_ops &&  nor->controller_ops->prepare) {
+	if (nor->spimem) {
+		ret = spi_mem_prepare(nor->spimem);
+	} else if (nor->controller_ops &&  nor->controller_ops->prepare) {
 		ret = nor->controller_ops->prepare(nor);
 		if (ret) {
 			mutex_unlock(&nor->lock);
@@ -1115,7 +1117,9 @@ int spi_nor_lock_and_prep(struct spi_nor *nor)
 
 void spi_nor_unlock_and_unprep(struct spi_nor *nor)
 {
-	if (nor->controller_ops && nor->controller_ops->unprepare)
+	if (nor->spimem)
+		spi_mem_unprepare(nor->spimem);
+	else if (nor->controller_ops && nor->controller_ops->unprepare)
 		nor->controller_ops->unprepare(nor);
 	mutex_unlock(&nor->lock);
 }
-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
