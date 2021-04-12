Return-Path: <SRS0=MywH=JJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B17C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 06:50:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20A9B61025
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 06:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20A9B61025
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rrDI8AOqxwNnBRycqhmxzeYH9go9UDvk8sozl7zxqKU=; b=MmE7U4rG+RLcyTc1027gnJUPMd
	+lggNrIk19HUq6NLQ99BWjZ/aoi+v9U592tfZ8klv7tT5/cIOmhV+kunKyvwMBvaO+wVqPiVJCZIG
	bcftZyObH7l7wOrKn9vuFvGq7lA+Q5Tf93BhsS9hDUxl/qwhsebG62mfBVQbKM1Mvc6O79sEjscZy
	BYQ8Cdad+4dEu0NL/iMURoTb3bMN6vJ55eCduqWZs+cX7XwTBSIgtypegNb+h/LdF98B7OrG86FLl
	Jdw9H51sVypWDvm5ssFpMCxXohm4hG0qT0/l2oxFSDVQWWhxtk39EZoCG9JrpdXHSgI12apH84DMO
	a4SZ8bEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVqOc-005rOn-I4; Mon, 12 Apr 2021 06:50:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqOW-005rNg-0A
 for linux-mtd@desiato.infradead.org; Mon, 12 Apr 2021 06:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=WxnfqyD8q7nqoTZLQI0n8Lz4Br3zxI2JAlx3fl05V1U=; b=08rMO5hV++xYqDPdgurqjMIYAb
 X9MuNFy9biC5eJVIUnEittMFkuYxLHHk9YNyGI3pzHHfttMvM775BvAAGMH4VkYgzxiw5lj4dzdqN
 2Z0/HihpCSFPutwLstlLJP3zjtdx7mRF7WRJR79E/h6lUKOD8YlDwk/iOHX3Car1DYGv8RPcS7A9p
 ayl/HdTF+Lwui7TRTtsAMowA+bFZwEfss8AM5adzlEoIMBMtXHIh+m+a3Q4Sm0qsGchKWbRzxLT2A
 lAd7mS1iJELnuXiaHDbj3DYijmL9zzYEDeDUKI7Ndn05AJcKY24Ky+ycsy9/PDligVknKth0gd8cS
 A/8XpeVg==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqOT-005uVN-G5
 for linux-mtd@lists.infradead.org; Mon, 12 Apr 2021 06:49:58 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FJfRV4Jl0zpXZN;
 Mon, 12 Apr 2021 14:47:02 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 12 Apr 2021 14:49:45 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH] mtd: mtdpart: Convert sysfs sprintf/snprintf family to
 sysfs_emit
Date: Mon, 12 Apr 2021 14:50:07 +0800
Message-ID: <1618210207-23619-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_234957_728547_5A974042 
X-CRM114-Status: UNSURE (   9.20  )
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
drivers/mtd/mtdpart.c:220:8-16: WARNING: use scnprintf or sprintf

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/mtd/mtdpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 665fd90..66a67c6 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -217,7 +217,7 @@ static ssize_t mtd_partition_offset_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%lld\n", mtd->part.offset);
+	return sysfs_emit(buf, "%lld\n", mtd->part.offset);
 }
 
 static DEVICE_ATTR(offset, S_IRUGO, mtd_partition_offset_show, NULL);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
