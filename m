Return-Path: <SRS0=SghU=K5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EC6C47082
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 12:55:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53F16124B
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 12:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53F16124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mk9k6DgYxAQ5RkFUcewHCaFqr4EUs/kYKsknxBbH1IM=; b=Fz4ThYmc/vFosH
	eRIdp/XxHbsghdh9e5eEj6PmpeU6Fkk9n4qNMrfS6iLeAY/ORm+cPw6Jgrh98wnvlI1k6of2RlDGl
	J7bRw0wQhslt6a6WswWUl+cP6Gny4UsnELq3cBpJMDC2eLDmF9eeVpbSZjVRvaZjPv9lSfX+WZ8u5
	/oPqVUhOke5VlejEHTSe1TXar5b/XCclHbqX0djt2dRxR4i3d8+AYgpfgLHXIsa96TgAi7InNFIBO
	9rZreVzKbcK+YO3+zmTCqvVABWX4cLqz3Zru5fud/GySe5bk9AEqrHtQp66+Ozy0v6BGBDd4o5d8+
	GiGwES1DGj4kPngBjHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lomrd-008m2Y-DS; Thu, 03 Jun 2021 12:54:21 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lomqs-008lkN-0T
 for linux-mtd@lists.infradead.org; Thu, 03 Jun 2021 12:53:37 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fwm374J2tzYpn8;
 Thu,  3 Jun 2021 20:50:43 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 20:53:29 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 20:53:28 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd
 <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 2/2] mtd: core: use MTD_DEVICE_ATTR_RO/RW() helper macros
Date: Thu, 3 Jun 2021 20:53:23 +0800
Message-ID: <20210603125323.12142-3-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210603125323.12142-1-thunder.leizhen@huawei.com>
References: <20210603125323.12142-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_055334_717500_BFFEAD8F 
X-CRM114-Status: UNSURE (   8.99  )
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

Use MTD_DEVICE_ATTR_RO/RW() helper macros instead of plain DEVICE_ATTR(),
which makes the code a bit shorter and easier to read.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/mtd/mtdcore.c | 46 ++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 770f64d6701567a..b5ccd3037788a24 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -139,7 +139,7 @@ static ssize_t mtd_type_show(struct device *dev,
 
 	return sysfs_emit(buf, "%s\n", type);
 }
-static DEVICE_ATTR(type, S_IRUGO, mtd_type_show, NULL);
+MTD_DEVICE_ATTR_RO(type);
 
 static ssize_t mtd_flags_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -148,7 +148,7 @@ static ssize_t mtd_flags_show(struct device *dev,
 
 	return sysfs_emit(buf, "0x%lx\n", (unsigned long)mtd->flags);
 }
-static DEVICE_ATTR(flags, S_IRUGO, mtd_flags_show, NULL);
+MTD_DEVICE_ATTR_RO(flags);
 
 static ssize_t mtd_size_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -157,7 +157,7 @@ static ssize_t mtd_size_show(struct device *dev,
 
 	return sysfs_emit(buf, "%llu\n", (unsigned long long)mtd->size);
 }
-static DEVICE_ATTR(size, S_IRUGO, mtd_size_show, NULL);
+MTD_DEVICE_ATTR_RO(size);
 
 static ssize_t mtd_erasesize_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -166,7 +166,7 @@ static ssize_t mtd_erasesize_show(struct device *dev,
 
 	return sysfs_emit(buf, "%lu\n", (unsigned long)mtd->erasesize);
 }
-static DEVICE_ATTR(erasesize, S_IRUGO, mtd_erasesize_show, NULL);
+MTD_DEVICE_ATTR_RO(erasesize);
 
 static ssize_t mtd_writesize_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -175,7 +175,7 @@ static ssize_t mtd_writesize_show(struct device *dev,
 
 	return sysfs_emit(buf, "%lu\n", (unsigned long)mtd->writesize);
 }
-static DEVICE_ATTR(writesize, S_IRUGO, mtd_writesize_show, NULL);
+MTD_DEVICE_ATTR_RO(writesize);
 
 static ssize_t mtd_subpagesize_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -185,7 +185,7 @@ static ssize_t mtd_subpagesize_show(struct device *dev,
 
 	return sysfs_emit(buf, "%u\n", subpagesize);
 }
-static DEVICE_ATTR(subpagesize, S_IRUGO, mtd_subpagesize_show, NULL);
+MTD_DEVICE_ATTR_RO(subpagesize);
 
 static ssize_t mtd_oobsize_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -194,7 +194,7 @@ static ssize_t mtd_oobsize_show(struct device *dev,
 
 	return sysfs_emit(buf, "%lu\n", (unsigned long)mtd->oobsize);
 }
-static DEVICE_ATTR(oobsize, S_IRUGO, mtd_oobsize_show, NULL);
+MTD_DEVICE_ATTR_RO(oobsize);
 
 static ssize_t mtd_oobavail_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
@@ -203,7 +203,7 @@ static ssize_t mtd_oobavail_show(struct device *dev,
 
 	return sysfs_emit(buf, "%u\n", mtd->oobavail);
 }
-static DEVICE_ATTR(oobavail, S_IRUGO, mtd_oobavail_show, NULL);
+MTD_DEVICE_ATTR_RO(oobavail);
 
 static ssize_t mtd_numeraseregions_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -212,8 +212,7 @@ static ssize_t mtd_numeraseregions_show(struct device *dev,
 
 	return sysfs_emit(buf, "%u\n", mtd->numeraseregions);
 }
-static DEVICE_ATTR(numeraseregions, S_IRUGO, mtd_numeraseregions_show,
-	NULL);
+MTD_DEVICE_ATTR_RO(numeraseregions);
 
 static ssize_t mtd_name_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -222,7 +221,7 @@ static ssize_t mtd_name_show(struct device *dev,
 
 	return sysfs_emit(buf, "%s\n", mtd->name);
 }
-static DEVICE_ATTR(name, S_IRUGO, mtd_name_show, NULL);
+MTD_DEVICE_ATTR_RO(name);
 
 static ssize_t mtd_ecc_strength_show(struct device *dev,
 				     struct device_attribute *attr, char *buf)
@@ -231,7 +230,7 @@ static ssize_t mtd_ecc_strength_show(struct device *dev,
 
 	return sysfs_emit(buf, "%u\n", mtd->ecc_strength);
 }
-static DEVICE_ATTR(ecc_strength, S_IRUGO, mtd_ecc_strength_show, NULL);
+MTD_DEVICE_ATTR_RO(ecc_strength);
 
 static ssize_t mtd_bitflip_threshold_show(struct device *dev,
 					  struct device_attribute *attr,
@@ -257,9 +256,7 @@ static ssize_t mtd_bitflip_threshold_store(struct device *dev,
 	mtd->bitflip_threshold = bitflip_threshold;
 	return count;
 }
-static DEVICE_ATTR(bitflip_threshold, S_IRUGO | S_IWUSR,
-		   mtd_bitflip_threshold_show,
-		   mtd_bitflip_threshold_store);
+MTD_DEVICE_ATTR_RW(bitflip_threshold);
 
 static ssize_t mtd_ecc_step_size_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -269,9 +266,9 @@ static ssize_t mtd_ecc_step_size_show(struct device *dev,
 	return sysfs_emit(buf, "%u\n", mtd->ecc_step_size);
 
 }
-static DEVICE_ATTR(ecc_step_size, S_IRUGO, mtd_ecc_step_size_show, NULL);
+MTD_DEVICE_ATTR_RO(ecc_step_size);
 
-static ssize_t mtd_ecc_stats_corrected_show(struct device *dev,
+static ssize_t mtd_corrected_bits_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
@@ -279,10 +276,9 @@ static ssize_t mtd_ecc_stats_corrected_show(struct device *dev,
 
 	return sysfs_emit(buf, "%u\n", ecc_stats->corrected);
 }
-static DEVICE_ATTR(corrected_bits, S_IRUGO,
-		   mtd_ecc_stats_corrected_show, NULL);
+MTD_DEVICE_ATTR_RO(corrected_bits);	/* ecc stats corrected */
 
-static ssize_t mtd_ecc_stats_errors_show(struct device *dev,
+static ssize_t mtd_ecc_failures_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
@@ -290,9 +286,9 @@ static ssize_t mtd_ecc_stats_errors_show(struct device *dev,
 
 	return sysfs_emit(buf, "%u\n", ecc_stats->failed);
 }
-static DEVICE_ATTR(ecc_failures, S_IRUGO, mtd_ecc_stats_errors_show, NULL);
+MTD_DEVICE_ATTR_RO(ecc_failures);	/* ecc stats errors */
 
-static ssize_t mtd_badblocks_show(struct device *dev,
+static ssize_t mtd_bad_blocks_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
@@ -300,9 +296,9 @@ static ssize_t mtd_badblocks_show(struct device *dev,
 
 	return sysfs_emit(buf, "%u\n", ecc_stats->badblocks);
 }
-static DEVICE_ATTR(bad_blocks, S_IRUGO, mtd_badblocks_show, NULL);
+MTD_DEVICE_ATTR_RO(bad_blocks);
 
-static ssize_t mtd_bbtblocks_show(struct device *dev,
+static ssize_t mtd_bbt_blocks_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
@@ -310,7 +306,7 @@ static ssize_t mtd_bbtblocks_show(struct device *dev,
 
 	return sysfs_emit(buf, "%u\n", ecc_stats->bbtblocks);
 }
-static DEVICE_ATTR(bbt_blocks, S_IRUGO, mtd_bbtblocks_show, NULL);
+MTD_DEVICE_ATTR_RO(bbt_blocks);
 
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
-- 
2.26.0.106.g9fadedd



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
