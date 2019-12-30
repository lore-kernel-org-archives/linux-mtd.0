Return-Path: <SRS0=iF+I=2U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B21DC2D0C0
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 03:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DB83207FD
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 03:31:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eLhP/zxH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DB83207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FBy80QpMp9Ne2G0HyuhTN/6GLIbVhBfqPPg14MMbLiI=; b=eLhP/zxHryVapX
	VR902qOIKnVXok/qCFKv7vReegX4c9WTp4wzcA5neVUb/6RKgcqRUVE69VJteRJTVJdrmZyjrBx7g
	x2wx7YJbplNwXUxS8agyqjXufJ0qTU3wOK/H2LQBTV/7bpdyR2s8w8LW81iyzy6PHaQxF/EyfEuA0
	GS7VYqfyuft4lNylnVhvpxhOkn+3R9KrKcEwxw60G6VclIYDUfyI0tAai4tWFQfz2rUA69NxwwEN+
	ZnkRbmJVW8+nO6Wz4iWcCqt0RaJu9QdBgUk5gcycdDghOq9aciRgeAf0WgXa/3Vf9nwV8LvQKa+4v
	1Uag+bNMZHx1VOGA5NJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1illm7-00004y-BI; Mon, 30 Dec 2019 03:31:23 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1illm4-0008W7-2i
 for linux-mtd@lists.infradead.org; Mon, 30 Dec 2019 03:31:21 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D81DEA0DB7585CF34E70;
 Mon, 30 Dec 2019 11:31:17 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Mon, 30 Dec 2019
 11:31:09 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <andrea.adami@gmail.com>, <bbrezillon@kernel.org>, <yuehaibing@huawei.com>
Subject: [PATCH -next] mtd: sharpslpart: Fix unsigned comparison to zero
Date: Mon, 30 Dec 2019 11:29:45 +0800
Message-ID: <20191230032945.18708-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_193120_281330_5D37B412 
X-CRM114-Status: UNSURE (   8.44  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The unsigned variable log_num is being assigned a return value
from the call to sharpsl_nand_get_logical_num that can return
-EINVAL.

Detected using Coccinelle:
./drivers/mtd/parsers/sharpslpart.c:207:6-13: WARNING: Unsigned expression compared with zero: log_num > 0

Fixes: 8a4580e4d298 ("mtd: sharpslpart: Add sharpslpart partition parser")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/mtd/parsers/sharpslpart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/parsers/sharpslpart.c b/drivers/mtd/parsers/sharpslpart.c
index e5ea612..671a618 100644
--- a/drivers/mtd/parsers/sharpslpart.c
+++ b/drivers/mtd/parsers/sharpslpart.c
@@ -165,10 +165,10 @@ static int sharpsl_nand_get_logical_num(u8 *oob)
 
 static int sharpsl_nand_init_ftl(struct mtd_info *mtd, struct sharpsl_ftl *ftl)
 {
-	unsigned int block_num, log_num, phymax;
+	unsigned int block_num, phymax;
+	int i, ret, log_num;
 	loff_t block_adr;
 	u8 *oob;
-	int i, ret;
 
 	oob = kzalloc(mtd->oobsize, GFP_KERNEL);
 	if (!oob)
-- 
2.7.4



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
