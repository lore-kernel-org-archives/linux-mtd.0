Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7791C282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 06:59:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97A27217F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 06:59:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ffi5Vrwd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97A27217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u1/XSACFOrjXO3FW8rNhDon6XhNNopD3hnK5XAOEjlc=; b=Ffi5VrwdEy3BZb
	Igrz2yTTRCnqZLuJFsL8N+3COeGthhFqQiz4ibku7ziKQXv37jLYKVWE9H9pNf0PLpAcC5SUK4yjC
	J1FcgtdWNkwMAOOU/6lcCduzYCpOXzBPF68jUjAsbEXj5EzDxBI9TWLaMLr2ei70+j87gJpqbbbFX
	372yX0n+kbW3w3t1GuVaKbqBUtHWXpmv5zs11blacy2mhlkvUaeyMWvPjod09tm1aNIR8SPGHdzis
	nAYWkbupHYMBKlzj3B+XMnXUvwL4geWC9CXXXx2B9mO9z/G2zUclHXjrIC/11VxlZfVUUm3l9HHvA
	hF/7Ehf8TI+lwUZWS3Xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmCV8-0000cC-QD; Wed, 23 Jan 2019 06:59:06 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmCV6-0000br-Bg
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 06:59:06 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 734EBFE661120ABB02CE;
 Wed, 23 Jan 2019 14:59:00 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.408.0; Wed, 23 Jan 2019
 14:58:53 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <robert.jarzmik@free.fr>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>,
 <marek.vasut@gmail.com>, <richard@nod.at>
Subject: [PATCH -next] mtd: docg3: Fix passing zero to 'PTR_ERR' warning in
 doc_probe_device
Date: Wed, 23 Jan 2019 14:58:27 +0800
Message-ID: <20190123065827.16748-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_225904_759338_59E88820 
X-CRM114-Status: UNSURE (   8.16  )
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

Fix a static code checker warning:
drivers/mtd/devices/docg3.c:1875
 doc_probe_device() warn: passing zero to 'ERR_PTR'

Fixes: ae9d4934b2d7 ("mtd: docg3: add multiple floor support")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/mtd/devices/docg3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 4c94fc0..60ddc38 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1872,7 +1872,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
 nomem2:
 	kfree(docg3);
 nomem1:
-	return ERR_PTR(ret);
+	return ret ? ERR_PTR(ret) : NULL;
 }
 
 /**
-- 
2.7.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
