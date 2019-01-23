Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EC7C282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:08:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E30A20861
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lRVC5G38"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E30A20861
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qvLRVens+w+zLzfZPQ0DD2xuCQRnftoZrqu1cp0Vg3s=; b=lRVC5G381kqLm9
	9xZIDsazZLZA/Mq+1yw6/sFbp0LEzNUa4SuIbVD2c8jFjCwMTWwR0OJcDOmd/lbOvLv82AAP/OqkP
	sGfjy1eGHLC8RgX2/rpJ1lSc5uj2Et79ZoFviR2827uuA2e89MhnNq8Po4aUFZMhujMinLOJH9bOj
	C32ZemLw4dvhIToz06dmuaGqJRKrPVmtQbfQuZkZC8zkotAwtrssqSDATqXFFa+pKJI45Iq3Wqg1B
	a98FfN1sTki5dOBetp4+w6wex+u34CA6TVoWk92uyIV7y90uqL5gk1lVZztbb011gf5TWxEVKOJrh
	wNR/3E5Zp9DdqqjsVqhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmEVv-0000NC-2W; Wed, 23 Jan 2019 09:08:03 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmEVr-0000MV-Kn
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 09:08:01 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 417A116A68697D7F6298;
 Wed, 23 Jan 2019 17:07:54 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.408.0; Wed, 23 Jan 2019
 17:07:46 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <robert.jarzmik@free.fr>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>,
 <marek.vasut@gmail.com>, <richard@nod.at>
Subject: [PATCH v2 -next] mtd: docg3: Fix a possible memory leak of mtd->name
Date: Wed, 23 Jan 2019 17:07:41 +0800
Message-ID: <20190123090741.14612-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_010759_842444_60585A9C 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In case DOC_CHIPID_G3, mtd->name is not freed in err handling path,
which is alloced by kasprintf(). Fix this by using devm_kasprintf().

Fixes: ae9d4934b2d7 ("mtd: docg3: add multiple floor support")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: use devm_kasprintf
---
 drivers/mtd/devices/docg3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 4c94fc0..af824d3 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1767,8 +1767,8 @@ static int __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 
 	switch (chip_id) {
 	case DOC_CHIPID_G3:
-		mtd->name = kasprintf(GFP_KERNEL, "docg3.%d",
-				      docg3->device_id);
+		mtd->name = devm_kasprintf(GFP_KERNEL, "docg3.%d",
+					   docg3->device_id);
 		if (!mtd->name)
 			return -ENOMEM;
 		docg3->max_block = 2047;
-- 
2.7.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
