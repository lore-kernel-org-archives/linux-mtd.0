Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96606CA0EE5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LK5tWbrvowtOQvb/S88OZi3i0loMdByzGk3lLK6/qgQ=; b=aqZ7kbMdlDggil
	bQb4gLSZJenDDeu/x2DIao4NLLPPBc1KDZkzyHerYFVFV2tbSjdX9R8SIJeGDvaONfgScmlmVSYha
	+JjkB603cGLJTPI0wplA0dvnZ7UQd1/UPZ6tvZdbaf2Kt+fLC0FDuPsGpB6hsEiwCPS1asrqIV4jF
	F8fDiJn5LuZDWICoIAY2rRjBqlqKjwEFauBv5KJEKP3U6lc4oX1G3kTDj/meRHkZXTbCniF+yl+dg
	xMwU7gw6zuQmJ+eoly5Z8q75iQjP4ozNEM99IuJx7J65npEXF7UFizklHMOQ9Mj8LbSGxopNJYXOy
	7JUd5crt67dFzw0r0emw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulad4-00000009DMU-2RgA;
	Mon, 11 Aug 2025 22:04:30 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYGv-00000008w0e-2fIc
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 19:33:30 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57BJXOr41609411;
	Mon, 11 Aug 2025 14:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754940804;
	bh=5gk44N9m+4BFJqlP2jfYY0PfWMGLlRjYM9wX9ai9Aag=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cIHNiIc1qKSBLG53AFIj+g3eoBXDCHmk36So4EgJLdyix0/W4iAWxSeHMns9xYzIx
	 Vw83pgdmq2CJajYGpU+jitAMHrfsrnPK+7MiM0kK6ONACoDGiEki0LL8iucYd/bc13
	 LF6NUbwvVw2hGobHRgpue8epZaQgzJtFcbRUDgzQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57BJXO3s2910915
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 14:33:24 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 14:33:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 14:33:23 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57BJWq1t3690681;
	Mon, 11 Aug 2025 14:33:19 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <broonie@kernel.org>, <tudor.ambarus@linaro.org>,
        <pratyush@kernel.org>, <mwalle@kernel.org>, <p-mantena@ti.com>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <s-k6@ti.com>, <a-dutta@ti.com>,
        <u-kumar1@ti.com>, <praneeth@ti.com>
Subject: [RFC PATCH 06/10] spi: cadence-quadspi: Use BIT() macro for CQSPI_REG_READCAPTURE_BYPASS
Date: Tue, 12 Aug 2025 01:02:15 +0530
Message-ID: <20250811193219.731851-7-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811193219.731851-1-s-k6@ti.com>
References: <20250811193219.731851-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_123329_767051_9DB9BF9B 
X-CRM114-Status: GOOD (  10.27  )
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

Simplify CQSPI_REG_READCAPTURE_BYPASS macro and add comment on Bypass
bit.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index da5823bcc1ea..1d86a7bc405e 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -180,7 +180,7 @@ struct cqspi_driver_platdata {
 #define CQSPI_REG_DELAY_TSHSL_MASK		0xFF
 
 #define CQSPI_REG_READCAPTURE			0x10
-#define CQSPI_REG_READCAPTURE_BYPASS_LSB	0
+#define CQSPI_REG_READCAPTURE_BYPASS		BIT(0)
 #define CQSPI_REG_READCAPTURE_DELAY_LSB		1
 #define CQSPI_REG_READCAPTURE_DELAY_MASK	0xF
 
@@ -453,10 +453,15 @@ static void cqspi_readdata_capture(struct cqspi_st *cqspi,
 
 	reg = readl(reg_base + CQSPI_REG_READCAPTURE);
 
+	/*
+	 * Bypass bit - to enable/disable the signal from adapted loopback
+	 * clock circuit which is driven into Rx DLL and is used for data
+	 * capturing rather than internally generated ref_clk.
+	 */
 	if (bypass)
-		reg |= (1 << CQSPI_REG_READCAPTURE_BYPASS_LSB);
+		reg |= CQSPI_REG_READCAPTURE_BYPASS;
 	else
-		reg &= ~(1 << CQSPI_REG_READCAPTURE_BYPASS_LSB);
+		reg &= ~CQSPI_REG_READCAPTURE_BYPASS;
 
 	reg &= ~(CQSPI_REG_READCAPTURE_DELAY_MASK
 		 << CQSPI_REG_READCAPTURE_DELAY_LSB);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
