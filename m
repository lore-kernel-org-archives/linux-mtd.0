Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4462C43460
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 08:22:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53AFA61007
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 08:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53AFA61007
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4vijupynJkcGFwZIp8immdUdsOO3uU94k1pRUAx/Pzg=; b=pfp3ZorjUJ+E5rH5XlCj7hTgh
	nsUpWnMVloFSDBk4GhHS+VxvLeae23AQgHvmF0ZTnNzsYLdIsbl39XvHSJ8Uo0ZwRiEwo3yVSKFzW
	6R1iZN2ZETskku4//+lFVuA5krgCgINmN/hHve80at+i2lhfxbB8w5PIrLVZyDTOOI8YI6tA5ibdc
	yUXmOjLIXNLS7HksNKZN8YsAl92niStJpHuKFtm1t9ZuXbvl3QoOSEcdff3CxKeIE7N7kB1xTpdKn
	Pg6AOfST62S1WdtKZSUo2RmcXNtKjMdH6TWJhOQsqGstBjMpPcpFED+Aw/63oMqVwGd/2MeE4Oj51
	MVkWa+iiw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSF3G-00CHF9-85; Fri, 02 Apr 2021 08:21:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSF2q-00CHCw-Uv
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 08:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617351644; x=1648887644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QncFSB+LWljPbRHwRx8Zt/TjYzwpLPREbu0zOm5DH+Y=;
 b=JGW8c8K5ZVWmLHdEQ1oaZbn2Hk1kYe+jMM4w+t+mMNVbBfR8AIvlmiiM
 CkWUUhxV1EfPNJCg9QbFdhHlg8KvqtXImX2a3SPAUQf+A2u9iII3bj0pE
 xaVjZDyinLjB2VhLmdUZzIwJ9cPjwFFinVONvkiztoQTmTpMYjEMN2zCy
 19Q8oG6Oflc3WxXtlxHeN/8FG0cV4+aOB3XlW2WEnVW++58x7u0qURSvV
 rXEQ7nDbmxivJval4a3LLAyisIZvfRhaSCywHZCRLl74vZQFJj8gfbHFr
 ZhGiMfSnO8Fg+raQYnYCvrxD5S4JzQhBUfTCyoSk+0fHkvWgqZ1rVqH7k w==;
IronPort-SDR: qy2rfzYP0ay2K8J+9h7F5E0SFJp+QvYjR3vVX0b78B7Cj5ZBD0LskxRl+eqCZnR1IGFtgcdViR
 reoJsIKqye/tJxRKuUmreKOdrmP2uGwHBaxOKU0q0KmHtoxrAqtAz9JS9SWJQK+QeGoIxTdyAt
 78hUi6qXiHSU9+KJWPudlglK5Jj+eN8XE1pSVnbpE2V98VTPRnJp2o84mZSSo33raqGH3Ic7xC
 2o2y/0vUUSBn1dRXJCA/aOHuCmjke03L21GpeQYWNw3es+fTqj4zbIY2Y5TWHRTP06rFsfF6Yk
 knQ=
X-IronPort-AV: E=Sophos;i="5.81,299,1610434800"; d="scan'208";a="121543242"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Apr 2021 01:20:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Apr 2021 01:20:43 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 2 Apr 2021 01:20:40 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, <vigneshr@ti.com>,
 <masonccyang@mxic.com.tw>, <zhengxunli@mxic.com.tw>, <ycllin@mxic.com.tw>,
 <juliensu@mxic.com.tw>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH 2/2] mtd: spi-nor: macronix: Fix name for mx66l51235f
Date: Fri, 2 Apr 2021 11:20:31 +0300
Message-ID: <20210402082031.19055-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402082031.19055-1-tudor.ambarus@microchip.com>
References: <20210402082031.19055-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_092045_472445_C98D94B8 
X-CRM114-Status: GOOD (  12.03  )
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

According to macronix website, there is no mx66l51235l part number.
The chip detected as such is actually mx66l51235f. Rename the flash.
Do not update the mx66l51235l name from the spi_nor_dev_ids[], since
there are dt that are using this compatible.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/macronix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 42c2cf31702e..c8167de55e55 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -72,7 +72,7 @@ static const struct flash_info macronix_parts[] = {
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024,
+	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024,
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			      SPI_NOR_4B_OPCODES) },
 	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
