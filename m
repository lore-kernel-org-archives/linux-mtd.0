Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D83C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 10:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmA79UUUVhzo2L3lk5hbSkaFoU0GGbXW4HDWYJGExFc=; b=CjeEsEyRNNiYlv
	W0I+xap76TJCwA2946SLsqPWYek7dtEJ7Q4tfeBmzeUxXhWzcOHQ8jjrXNBtjFjbtXri5l5i0fspV
	6p0jr0VfGeRgb3AstjQXjCl83UMLHvAHWY+VoljwOJVurcHrm+kFfP60u9B6sF2V9pEO/8eSpsCDM
	nxUIizpUf8rufqvDMs7TLiZdyfbOhNNbE8R00MB8WEguNy849fCCqdnM7SAH6K7LIVDbw+LDvPKgH
	Q6/3LzZhqOLVtQxry8LhKYS1nkksXWIjwXy1buWGwoJiuDk9NTxW2ygCkZxPuOPDz5RAlflAdFhd2
	f3WgQ7V220nmQew60xJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh7ga-008ctP-2S; Wed, 20 Apr 2022 10:35:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh7fl-008cJI-Cg
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 10:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650450897; x=1681986897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oOUsuEagMAIOdEe32HIvrQ1cK7qKNdX8r00UvC25H44=;
 b=hvlvmc+D7doqy9QgXs/kdp7ZSCqWyAHXvNgDTWtn6yVBLompXcKfa35h
 fD0ofPuhuyEyLzGP10jlWV/BKfLY18MacqdDuTJSv1kBscgaqkhRPlkyV
 Mchlg/txopCxIvTPXliFCp/ZuMMXKeKPLA21NgcVmkvD1QS0jkpA3B/wo
 dT6pfr8vpz8sIBbekHCvI99ZPqbbi37sdTx9sOniES+RSfVJ/2H9kDzlB
 AQ3aDx8ZillYifZ3lgoGEnsHMlhxkNVb1DNZlZ4bsurjyasP5KqEfTqOC
 Fbla4cS2k3ENaFE21HVBd3e9pikTKAH/aPd9+J9hG2w5jE2h18GNUcJKI Q==;
X-IronPort-AV: E=Sophos;i="5.90,275,1643698800"; d="scan'208";a="170245870"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2022 03:34:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Apr 2022 03:34:56 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 20 Apr 2022 03:34:54 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Takahiro.Kuwano@infineon.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 10/11] mtd: spi-nor: spansion: Remove status polling on
 volatile registers write
Date: Wed, 20 Apr 2022 13:34:26 +0300
Message-ID: <20220420103427.47867-11-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420103427.47867-1-tudor.ambarus@microchip.com>
References: <20220420103427.47867-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_033457_502115_05D10D02 
X-CRM114-Status: UNSURE (   8.50  )
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

Writing volatile registers are instant according to Cypress and do not
need any status polling. Remove status polling on volatile registers write.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spansion.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 7404ca067ca9..43cd6cd92537 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -57,10 +57,6 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	ret = spi_nor_wait_till_ready(nor);
-	if (ret)
-		return ret;
-
 	nor->read_dummy = 24;
 
 	/* Set the octal and DTR enable bits. */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
