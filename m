Return-Path: <SRS0=SghU=K5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A325C47096
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 12:32:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC7D161242
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 12:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC7D161242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RUNO6CFSsQHS8QKn5rQ3C6epuxptfg/Ko/hVWh3YO1Y=; b=gxp4Y9LF9PcqcG
	cvpoA9F3nemyWIrl4OxcVJkeoKpm2+DdFUeZGfuZ1aCmN/zrW06h90sVatQ7yY/K1ELAfE8nXo35o
	1CH/H6G6QnGv8p2WPpkV1SEKRAEqkXF882UcVWAKvq0BnD1dMhmxAf+p1EAWdaUjm5UHBTeEwtdIy
	b4YTZfJSnGJjKEL2JdJ7U/g5ObHHhYPdyxZQFHzOBiib+0b5/gBciNku236Wum0Nm9jJFNSJSmRU9
	a5DOfkIHse3imd6Km9jjm5cZBumSFcoVRfAcz0nIqRQ9kcZI3xo++sK9du4P3sEiLdwn/vSw0Ces2
	39KNdIZ2iftla52/asUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lomV5-008dLI-CC; Thu, 03 Jun 2021 12:31:03 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lomUt-008dEy-7z
 for linux-mtd@lists.infradead.org; Thu, 03 Jun 2021 12:30:53 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FwlVf21Q6zWrKB;
 Thu,  3 Jun 2021 20:26:02 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 20:30:46 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 20:30:46 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd
 <linux-mtd@lists.infradead.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] mtd: mtdpart: use DEVICE_ATTR_RO() helper macro
Date: Thu, 3 Jun 2021 20:30:41 +0800
Message-ID: <20210603123041.12036-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_053051_591335_8693DFC9 
X-CRM114-Status: UNSURE (   9.31  )
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

Use DEVICE_ATTR_RO() helper macro instead of plain DEVICE_ATTR(), which
makes the code a bit shorter and easier to read.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/mtd/mtdpart.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 66a67c6e3cbc049..04af12b66110c60 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -212,15 +212,14 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 	return child;
 }
 
-static ssize_t mtd_partition_offset_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t offset_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	return sysfs_emit(buf, "%lld\n", mtd->part.offset);
 }
-
-static DEVICE_ATTR(offset, S_IRUGO, mtd_partition_offset_show, NULL);
+static DEVICE_ATTR_RO(offset);	/* mtd partition offset */
 
 static const struct attribute *mtd_partition_attrs[] = {
 	&dev_attr_offset.attr,
-- 
2.26.0.106.g9fadedd



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
