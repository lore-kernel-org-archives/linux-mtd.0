Return-Path: <SRS0=MywH=JJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EC1C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 06:45:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41BC16101B
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 06:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41BC16101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oDpCxtSN+SdFacfssMeWdH40iGgXS5Etz7YJnEMmmlg=; b=oa3CaQhyhvT0LymN4XiSQ/dXx4
	RpweaKXPHhvJUugHDUPiZJLugxWUyOuB1n+VM6W9O1UAmMk8uxISIot4WcUz6jPuisKF02oOP5ZR7
	EGzFCkFFmcBYtaNyhhq0ytp0QH5F6XwILEhuUbzaU+1pg9iDUUDguZK/dkuk4cPLcC93rJlZpfhaY
	WKcG2ZjlNdxe4RLvdtQpTm91A3rbor5ON/rJ4dyUfHB9zeybBxovC/0zxk0isIvWJKIDcoiaW02jX
	N7o/zvSo/jPeqyPyd0hhTGltnIGrBy242Ht4MByX4Kx2SQFHG8M42YC/QTsfoX5szZJAbucFK61t3
	w/nTM1fw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVqJJ-005qXu-G8; Mon, 12 Apr 2021 06:44:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqJG-005qWj-H9
 for linux-mtd@desiato.infradead.org; Mon, 12 Apr 2021 06:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=620uV2LffOu4HBZTk+eIZzQMMXwLpkNEPzrfVKxd86c=; b=f8yAwWMacnjZ5teuwZWFFTfnCq
 hchU0dDvpsuzRHybQnbOQ02ls74PikFtYdlK6pR6+yn3feGxx/SQHlpHW56U0TJrUYBFvuBWUT+Vj
 mSaU9tpWaQokgKm8VeO/DK3nzxQnYq8MS4dZ7RfshNzQqRK7S/RmLZN1j0e02skF2QA97RkPM4Bce
 bvhUYd4R2ko5nQyhCxaaYwRrorULpDQyvWSvg5T6+xjIO84nTAVEbbO2Cc9pEZkqCNK7Tfn5w/CEj
 /8JPtRN05gyxVypmMD4P/LPvJ0wemdGr4VdhsHccLT8BKMR6+3a6Sj+WwSY+D6EzIb/llIbgkA871
 7kq1SC+w==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqJD-005uOz-0j
 for linux-mtd@lists.infradead.org; Mon, 12 Apr 2021 06:44:33 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FJfKm3d4yz1BGhB;
 Mon, 12 Apr 2021 14:42:04 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Mon, 12 Apr 2021 14:44:09 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH] mtd: core: Convert sysfs sprintf/snprintf family to sysfs_emit
Date: Mon, 12 Apr 2021 14:44:32 +0800
Message-ID: <1618209872-20034-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_234431_427788_49836EC7 
X-CRM114-Status: UNSURE (   8.11  )
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

Fix the following coccicheck warning:
drivers/mtd/mtdcore.c:296:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:306:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:237:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:275:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:286:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:264:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:227:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:162:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:143:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:218:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:208:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:199:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:190:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:152:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:181:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:134:8-16: WARNING: use scnprintf or sprintf
drivers/mtd/mtdcore.c:171:8-16: WARNING: use scnprintf or sprintf

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/mtd/mtdcore.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 0bc6871..5449f79 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -131,7 +131,7 @@ static ssize_t mtd_type_show(struct device *dev,
 		type = "unknown";
 	}
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", type);
+	return sysfs_emit(buf, "%s\n", type);
 }
 static DEVICE_ATTR(type, S_IRUGO, mtd_type_show, NULL);
 
@@ -140,7 +140,7 @@ static ssize_t mtd_flags_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "0x%lx\n", (unsigned long)mtd->flags);
+	return sysfs_emit(buf, "0x%lx\n", (unsigned long)mtd->flags);
 }
 static DEVICE_ATTR(flags, S_IRUGO, mtd_flags_show, NULL);
 
@@ -149,8 +149,7 @@ static ssize_t mtd_size_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%llu\n",
-		(unsigned long long)mtd->size);
+	return sysfs_emit(buf, "%llu\n", (unsigned long long)mtd->size);
 }
 static DEVICE_ATTR(size, S_IRUGO, mtd_size_show, NULL);
 
@@ -159,7 +158,7 @@ static ssize_t mtd_erasesize_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->erasesize);
+	return sysfs_emit(buf, "%lu\n", (unsigned long)mtd->erasesize);
 }
 static DEVICE_ATTR(erasesize, S_IRUGO, mtd_erasesize_show, NULL);
 
@@ -168,7 +167,7 @@ static ssize_t mtd_writesize_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->writesize);
+	return sysfs_emit(buf, "%lu\n", (unsigned long)mtd->writesize);
 }
 static DEVICE_ATTR(writesize, S_IRUGO, mtd_writesize_show, NULL);
 
@@ -178,7 +177,7 @@ static ssize_t mtd_subpagesize_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	unsigned int subpagesize = mtd->writesize >> mtd->subpage_sft;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", subpagesize);
+	return sysfs_emit(buf, "%u\n", subpagesize);
 }
 static DEVICE_ATTR(subpagesize, S_IRUGO, mtd_subpagesize_show, NULL);
 
@@ -187,7 +186,7 @@ static ssize_t mtd_oobsize_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->oobsize);
+	return sysfs_emit(buf, "%lu\n", (unsigned long)mtd->oobsize);
 }
 static DEVICE_ATTR(oobsize, S_IRUGO, mtd_oobsize_show, NULL);
 
@@ -196,7 +195,7 @@ static ssize_t mtd_oobavail_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->oobavail);
+	return sysfs_emit(buf, "%u\n", mtd->oobavail);
 }
 static DEVICE_ATTR(oobavail, S_IRUGO, mtd_oobavail_show, NULL);
 
@@ -205,7 +204,7 @@ static ssize_t mtd_numeraseregions_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->numeraseregions);
+	return sysfs_emit(buf, "%u\n", mtd->numeraseregions);
 }
 static DEVICE_ATTR(numeraseregions, S_IRUGO, mtd_numeraseregions_show,
 	NULL);
@@ -215,7 +214,7 @@ static ssize_t mtd_name_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->name);
+	return sysfs_emit(buf, "%s\n", mtd->name);
 }
 static DEVICE_ATTR(name, S_IRUGO, mtd_name_show, NULL);
 
@@ -224,7 +223,7 @@ static ssize_t mtd_ecc_strength_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->ecc_strength);
+	return sysfs_emit(buf, "%u\n", mtd->ecc_strength);
 }
 static DEVICE_ATTR(ecc_strength, S_IRUGO, mtd_ecc_strength_show, NULL);
 
@@ -234,7 +233,7 @@ static ssize_t mtd_bitflip_threshold_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->bitflip_threshold);
+	return sysfs_emit(buf, "%u\n", mtd->bitflip_threshold);
 }
 
 static ssize_t mtd_bitflip_threshold_store(struct device *dev,
@@ -261,7 +260,7 @@ static ssize_t mtd_ecc_step_size_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->ecc_step_size);
+	return sysfs_emit(buf, "%u\n", mtd->ecc_step_size);
 
 }
 static DEVICE_ATTR(ecc_step_size, S_IRUGO, mtd_ecc_step_size_show, NULL);
@@ -272,7 +271,7 @@ static ssize_t mtd_ecc_stats_corrected_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	struct mtd_ecc_stats *ecc_stats = &mtd->ecc_stats;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", ecc_stats->corrected);
+	return sysfs_emit(buf, "%u\n", ecc_stats->corrected);
 }
 static DEVICE_ATTR(corrected_bits, S_IRUGO,
 		   mtd_ecc_stats_corrected_show, NULL);
@@ -283,7 +282,7 @@ static ssize_t mtd_ecc_stats_errors_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	struct mtd_ecc_stats *ecc_stats = &mtd->ecc_stats;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", ecc_stats->failed);
+	return sysfs_emit(buf, "%u\n", ecc_stats->failed);
 }
 static DEVICE_ATTR(ecc_failures, S_IRUGO, mtd_ecc_stats_errors_show, NULL);
 
@@ -293,7 +292,7 @@ static ssize_t mtd_badblocks_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	struct mtd_ecc_stats *ecc_stats = &mtd->ecc_stats;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", ecc_stats->badblocks);
+	return sysfs_emit(buf, "%u\n", ecc_stats->badblocks);
 }
 static DEVICE_ATTR(bad_blocks, S_IRUGO, mtd_badblocks_show, NULL);
 
@@ -303,7 +302,7 @@ static ssize_t mtd_bbtblocks_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	struct mtd_ecc_stats *ecc_stats = &mtd->ecc_stats;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", ecc_stats->bbtblocks);
+	return sysfs_emit(buf, "%u\n", ecc_stats->bbtblocks);
 }
 static DEVICE_ATTR(bbt_blocks, S_IRUGO, mtd_bbtblocks_show, NULL);
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
