Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C319BC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:23:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D038610A1
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D038610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IwkUwh829KZTgcbRE7uJq5ZngtN+36DY9hr1LRC+w0=; b=W45yHUZ9UWBkE+
	ZfbAdskJ6FTp/ehQ3thIsi/CwReo9HXu80TYIlg57oStzypJJ0jKEojD4weuarb2OSY+HXhohCzF5
	wrFHu0ipQX/wJKkRoqHQ++IuWD+FnThQtn3oE+Pr/mgiPJM6CfHxFHNLoli/g+Po1QC/PPK5tlQv0
	gwgLyo+jyvkf/uiqIM+BgUskpcUUzz9hZdawpqzXv9hYvcV5PkRjV8ASnGUe92qqjhlOJdGJjqlQ/
	Fnp8Txa7/CrmyEFTVYsohNlTlTIFzTg5ThNiO/v2JW8d3B7L3x5uT0Wv4903sZwhWBT+ktLYrFaHC
	VcyZMn5ifszcMCkw4iRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8FYR-00DPWD-Va; Tue, 27 Jul 2021 05:23:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F5x-00DHcL-2z; Tue, 27 Jul 2021 04:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361613; x=1658897613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YlTavZcPTLHLDyRR/4iV9l7Py9LfBh5YVJy1QKVoG7o=;
 b=jxiyHxrdIblb4iy2V4ab5C5U70bAgYQ+KlUUUM90hrQ17v8A4bNQvgW8
 9iPGkeu6tak3oBrxdkTY58HTg/BFDhtQw0KmsQlHcJz3dSSEf5W80v9Lw
 7BpMaYRae54Arl0fP+vitCjiciKbUaxk+KHYSKrHivdYciFLnX3TaCKfH
 oVGa2xNMc1YT9tr2JHPUHBMkToePZ7mVScCgRkzCw2XbNX6bhMnGoPGKn
 imhqaui9WzeyFgkUWXLfLrPgw/XzY0b6dLc19JXX5znbUyM6z4gbDxKUe
 QncG9pUX8WRmZ5lRSDNbXOah5DEeh+A5eCFxTfx49VMK9VlFoIdLlCh0z A==;
IronPort-SDR: /VYiasdu+SLELpP72wQJyygMl2TZSycTJsXIse9gyAoOc6TdRogbFOh+4QX2WzQLcp9l2wt+/u
 CFIGum3pg+djY0WrqxLaSU85qw8Gd54eccFooNnGjWiqmikc5k3LFVjmSGUKEvXCoLWlQfsUT/
 v91/biL+FCDmCDQ6rsk9ZLTYefsSgCOx0er1yqQVDQMLe0P9/VAdOOuaLJ0TiUOTW1rqIrL27O
 DOqerhPtVuF0J0gBWkNIH3wvDR951teDuyJZbudQt8BONeoTlrgD4Tzu6VRGonuHOeoECIwx/K
 9N6T1iHqKGwBntvIzgN1fhIg
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="126055047"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:53:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:53:30 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:53:26 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 12/35] mtd: spi-nor: xilinx: Use manufacturer late_init()
 to set setup method
Date: Tue, 27 Jul 2021 07:51:59 +0300
Message-ID: <20210727045222.905056-13-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215333_253738_0BBBD7AF 
X-CRM114-Status: GOOD (  10.17  )
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

post_sfdp was misleading in this case, as SFDP is not supported by
xilinx. Plus, there's no fixup here, just setting the correct
setup method, as required by xilinx parts.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/xilinx.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 1138bdbf4199..a573c3cde414 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -77,18 +77,14 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 	return 0;
 }
 
-static void xilinx_post_sfdp_fixups(struct spi_nor *nor)
+static void xilinx_late_init(struct spi_nor *nor)
 {
 	nor->params->setup = xilinx_nor_setup;
 }
 
-static const struct spi_nor_fixups xilinx_fixups = {
-	.post_sfdp = xilinx_post_sfdp_fixups,
-};
-
 const struct spi_nor_manufacturer spi_nor_xilinx = {
 	.name = "xilinx",
 	.parts = xilinx_parts,
 	.nparts = ARRAY_SIZE(xilinx_parts),
-	.fixups = &xilinx_fixups,
+	.late_init = xilinx_late_init,
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
