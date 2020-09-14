Return-Path: <SRS0=tjU8=CX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AEAC43461
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 06:13:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC9F206F4
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 06:13:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NR6AdKof"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CC9F206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5do+qGaYvvnDL0ejVvrDOa0HnkcEqoziG7atRUn/kOI=; b=NR6AdKofP8FeErzASnkf+vpCBN
	ecF01JFGB3ff9w2WKCBjKg9AKz5z0t/6gLEooyGGeei5jFYVWCdnmcYCoY7s8xa0I46eGD7KedIjf
	zOhTzsM5iG3Hl8MKZ4mHSNqCAVDgEuyqoUzWPLjoOXCnNKOWkgLJAiWisNKUVVLuHsDiaC4YWrVY+
	/Hl1mr81FLVv6/2UHbnhauBrPyWbk1THuyINBQX3lS/jO2Tnedt3jSSiEnKz84UFF3HH+XjDRP6h2
	rabdHVUEzxvcM74DXX55TLrXrdcP9SKlKDTFVli13+UYONteQPYIsFWhfatRXJPN41DZ7oVG8x11h
	kLVnLNFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHhja-0002Uv-7o; Mon, 14 Sep 2020 06:13:02 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHhjW-0002T5-R4
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2020 06:13:00 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D6A3689830B199538E1C;
 Mon, 14 Sep 2020 14:12:45 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Mon, 14 Sep 2020 14:12:36 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH -next] mtd: spear_smi: use for_each_child_of_node() macro
Date: Mon, 14 Sep 2020 14:13:24 +0800
Message-ID: <20200914061324.3230-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_021259_654819_92D23D47 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Qinglang Miao <miaoqinglang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use for_each_child_of_node() macro instead of open coding it.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/mtd/devices/spear_smi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 79dcca164..2e0086238 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -793,7 +793,7 @@ static int spear_smi_probe_config_dt(struct platform_device *pdev,
 				     struct device_node *np)
 {
 	struct spear_smi_plat_data *pdata = dev_get_platdata(&pdev->dev);
-	struct device_node *pp = NULL;
+	struct device_node *pp;
 	const __be32 *addr;
 	u32 val;
 	int len;
@@ -812,7 +812,7 @@ static int spear_smi_probe_config_dt(struct platform_device *pdev,
 		return -ENOMEM;
 
 	/* Fill structs for each subnode (flash device) */
-	while ((pp = of_get_next_child(np, pp))) {
+	for_each_child_of_node(np, pp) {
 		pdata->np[i] = pp;
 
 		/* Read base-addr and size from DT */
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
