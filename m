Return-Path: <SRS0=NuVS=VL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05A7C73C66
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Jul 2019 03:58:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2C0320644
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Jul 2019 03:58:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZDK1p6+z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2C0320644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iGogVLHY+Ysd3LUOiIBkvl0vgQs4V6AGExMqSZf/JJg=; b=ZDK1p6+zyuQP24
	ONLRa4JcthNwiVcxEXKleu7vwJpKvetHpb5SXjshv6KnS8v6ndXF5yziQ15QAzBJcnpD2z3lV3nsb
	RbAt/MW9iv0GWRlpKMnaw8BCDK3wCyHzcDmTT6m1FLq6lpPq43Rf1SR/nfzPayhNWDE+cycTeGTS/
	B7+DVsbQdGh+a26zeE3tZgSBeXmXm/I7s49fP8+uK9p8wMMIedYIs3ZOPf/2JLA6aZdb7RKB+PwKS
	4LR95u7Z3UTPwTL7A3zCPwNIFjK6bQiD4rbeaORw7CTlc355zo+WrIMkc7fqXySpiZczJQt9BNl+Y
	2WAHkXuxBjBLENk55fuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hmVe1-0006Zg-DP; Sun, 14 Jul 2019 03:57:49 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hmVdy-0006Yf-11
 for linux-mtd@lists.infradead.org; Sun, 14 Jul 2019 03:57:47 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2A7F83AB7ACB01E0A67B;
 Sun, 14 Jul 2019 11:57:30 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.174) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Sun, 14 Jul 2019 11:57:21 +0800
From: Xiaoming Ni <nixiaoming@huawei.com>
To: <joern@lazybastard.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: [PATCH] mtd: phram: Module parameters add writable permissions
Date: Sun, 14 Jul 2019 11:57:18 +0800
Message-ID: <1563076638-101332-1-git-send-email-nixiaoming@huawei.com>
X-Mailer: git-send-email 1.8.5.6
MIME-Version: 1.0
X-Originating-IP: [10.67.189.174]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190713_205746_335217_CDFBF3C3 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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
Cc: nixiaoming@huawei.com, dylix.dailei@huawei.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 zhoubo.zhao@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The phram code implements managing multiple devices through a linked
list.
However, due to the module parameter permission of 0, the
/sys/module/phram/parameters/phram interface is missing.
The command line arguments in insmod can only create one device.

Therefore, add writable permissions to the module parameters, create
/sys/module/phram/parameters/phram interface, and create multi-device
support.

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
---
 drivers/mtd/devices/phram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index c467286..931e5c2 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -294,7 +294,7 @@ static int phram_param_call(const char *val, const struct kernel_param *kp)
 #endif
 }
 
-module_param_call(phram, phram_param_call, NULL, NULL, 000);
+module_param_call(phram, phram_param_call, NULL, NULL, 0200);
 MODULE_PARM_DESC(phram, "Memory region to map. \"phram=<name>,<start>,<length>\"");
 
 
-- 
1.8.5.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
