Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40681C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYtG2CJsHOjFikYFgJKoc4hWmtKFooWI0kNYgZyXXKQ=; b=nVUBc7C5tB+haw
	qCTtY/WzaylJ7wwDHcvQUj5fCG53gKkr36ElZCD+j5izdgF4S+1Gg1BaMO69N0AQjf+rSPoAR2li2
	7u0PreNQC8Gf+Y2wr1fsl/x8Pi6Fy7QYqmGbHkCvglylS4RFPd7G2aqjp5ygMfNSNOMX9MxXwvx6f
	mLrQWDgWL3wgRyT59CsjulrNVtlp7bcI7O6PcbHISNegNToHgaRD+GD5roVEEDSCY4xV2KprT8WMC
	aHFlokJhMNs3fDAsKPBGAP1L8bY0e26lZk13YENPDHlA5xc6estKqMyF+3h4aYxQsCKvDjE2LShJk
	MxrkkafrhzZ0yG0v30BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHn9s-000B0n-5Q; Wed, 09 Feb 2022 13:37:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHn9g-000Azp-6n
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 13:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644413829; x=1675949829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=csMWGGqwyJOn5ODRm2zWMJY6PKgfI+luK/C34/+qqRk=;
 b=k/08jTxyGN5PfDZeOQPWWJr6UiIWTiY9BkIBgmNcttLIdCZaSjgMlRPZ
 qYuf6NFqa23bXhDWVayR+5zZFt8HS1QTBe8xNPLDbtSpHDyppZf6VmWli
 naFKcJxjWTMoMSUnJRpqQeDuuOD6jaomcvMj05V6g7AgRXESFWImVxwvN
 nlNPY+ZLq20s0J6+k862ajzDrCWBmTM1kbrpW/g4zg9igJTMUz59zrs2w
 VPwkB/u4AXByo2orhmbaDY5gvpwnmk+8DE7LZSvdABYn7IZbrGnXYa8jn
 ACv+RLByhJGB5gUh4uXDS/069pLccUGhLulcLENwjAoapubOi0GG7gRW8 w==;
IronPort-SDR: XVixCb1Es2Oko7EPztHA/LfuIsuG3pNt/2DbzMr72NScI4+CV+lZKdkX93NY8yTBrXiCNQJj/Q
 sNWTodayr8lfiPm85j8InjL22OrEtMqdAR7miuWSUkt1kZd/0TNFFWpfFQSB8WTOF11zTo/p47
 2GoLPf5ZwHMxxNBo2XzkIfKH69iT1iHjp13EYwRtvdtHO1EwxCSMqgpLo4HyHOywyK/FbIbFcH
 WESGS0nxNgYx7cwqaN2bN0SOdf/JWzmrbBkm/1Bhl8cNVmFjopY4Lin3rjn4PRvkpqciv9PBmc
 Bif1iyllgnMEA8Fy4u9Qo66C
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="152460072"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 06:37:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 06:37:07 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 06:37:02 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v6 1/7] mtd: spi-nor: Rename method,
 s/spi_nor_match_id/spi_nor_match_name
Date: Wed, 9 Feb 2022 15:36:50 +0200
Message-ID: <20220209133656.374903-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209133656.374903-1-tudor.ambarus@microchip.com>
References: <20220209133656.374903-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_053708_278270_2B8D565B 
X-CRM114-Status: UNSURE (   9.58  )
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

The method is matching a flash_info entry by searching by name. Rename
the method for better clarity.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 04ea180118e3..345f9da96fab 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3109,8 +3109,8 @@ void spi_nor_restore(struct spi_nor *nor)
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
-static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
-						 const char *name)
+static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
+						   const char *name)
 {
 	unsigned int i, j;
 
@@ -3132,7 +3132,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 	const struct flash_info *info = NULL;
 
 	if (name)
-		info = spi_nor_match_id(nor, name);
+		info = spi_nor_match_name(nor, name);
 	/* Try to auto-detect if chip name wasn't specified or not found */
 	if (!info)
 		info = spi_nor_read_id(nor);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
