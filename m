Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2ABFC43465
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 08:03:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57122214F1
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 08:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oRItPcB/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57122214F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5s1CPGd7rOBZKuUOGMbJK9iuYzVy5lm43e48BkWIUx8=; b=oRItPcB/u7vXm9CjAQo02mlPrT
	sXg2kCTrEb4tez6CP2IVgbWgBxsZFdtD9RYGclip398uKVGTeZMaSnTsvdstUzdaQT8uXKQuZXgUO
	74nDajFdKdxIt6G+93cKNwwmVQf/5nAGw0NPKgO1Vb9nojr1Hg1QtfTQdZXTJAsbFM9JDH2SztPdd
	ftBi6pPLUOVffr50rXB5MOjhWk2sLVv3Pe0iQ1tGnQjz32T/3FGAshigTHyFaVgF/jrG3pMNF6xLB
	bXw98TR3fAs77gqXtU4tIGiELbNTRwKv9S4TSFKhHgnmpok8nzoLpLrG8xKV+C8K5Ai+0EbHU5QKS
	uSeLtgfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKGmW-0002wF-61; Mon, 21 Sep 2020 08:02:40 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKGmQ-0002qH-18
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 08:02:35 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7BA9BF056ABF7664D857;
 Mon, 21 Sep 2020 16:02:28 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Mon, 21 Sep 2020
 16:02:17 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Kyungmin Park <kyungmin.park@samsung.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Subject: [PATCH -next] mtd: onenand_base: simplify the return expression of
 onenand_transfer_auto_oob
Date: Mon, 21 Sep 2020 16:24:41 +0800
Message-ID: <20200921082441.2591669-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_040234_383920_974F0C73 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: Liu Shixin <liushixin2@huawei.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/mtd/nand/onenand/onenand_base.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
index ec18ade33262..188b8061e1f7 100644
--- a/drivers/mtd/nand/onenand/onenand_base.c
+++ b/drivers/mtd/nand/onenand/onenand_base.c
@@ -1052,16 +1052,11 @@ static int onenand_transfer_auto_oob(struct mtd_info *mtd, uint8_t *buf, int col
 				int thislen)
 {
 	struct onenand_chip *this = mtd->priv;
-	int ret;
 
 	this->read_bufferram(mtd, ONENAND_SPARERAM, this->oob_buf, 0,
 			     mtd->oobsize);
-	ret = mtd_ooblayout_get_databytes(mtd, buf, this->oob_buf,
-					  column, thislen);
-	if (ret)
-		return ret;
-
-	return 0;
+	return mtd_ooblayout_get_databytes(mtd, buf, this->oob_buf,
+					   column, thislen);
 }
 
 /**
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
