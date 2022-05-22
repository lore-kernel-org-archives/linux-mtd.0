Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C13C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 22 May 2022 05:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YznPgrwWiEWwNEqk1NukxZ+6Hxk3jWK/1yZl5eHB9tI=; b=IiBR/YgYkonPa+
	CO4nRMX+6TE8eEc9xooJPIbbX6XgDRciaPNpUshEsyCCb+0NIylqpTyuWBYQep5tdap0lhpeI4v0f
	qfvWuzXlVVicau+EOKzBBPHD4jistvG2ZTx86xRJQbZq2229HQoL3Ui+39duM/M+3holVGyL572qo
	8772nCpRxPrsZu0Co7Vwrs5X8t5pYVgqqXIQdosM5t/QDqJMgxNOWmLGmJClCOn6Jo2wa7Ke5kdhg
	n7XHtX87Qgkxxt8H9rmZwk3A8wo3niTYNg5u934WSRGdUiGiA+MHKs0PxBXzzEM8k2CiK60GQBQbe
	xFZIbze0O4iMhx8kDI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nseTg-000dbZ-LR; Sun, 22 May 2022 05:50:08 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nseTe-000daR-C0
 for linux-mtd@lists.infradead.org; Sun, 22 May 2022 05:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653198606; x=1684734606;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hqW5dtCkp+lQBUQ3TJWA0FI1FzCBjujuUuvhAgieM3Q=;
 b=GzZct7DA2H+FoBgC1PFB06umd3J3nIGCCAwRE8crNyI3TTPpsLnugLzL
 P5+RtFz2a+PjzjcAM9OfkKNSVJphIHlELkLc2e9m9vt8SgEILZBEDYOfY
 npNI9HbNcSd0y3Df46X5J0yf0pFCy0qUnUturkCLernQD3zYkJU44C62x
 uwzkHp/2z709MIqDC+fm1BpDeDMxJ24DTW9gLxVr0u0Ei+6pKZfWj3eyr
 gSd+6o52basDy7ldHPiLGiIlSW7n7W/ok1z30eyrV4flchP5DJfH4wXZh
 kN7gxuaO0ouUteZX6Vf/LuqETTGpGoKQutAayduqEkKFEQUQo9am8+P6h Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10354"; a="270528598"
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; d="scan'208";a="270528598"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2022 22:50:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; d="scan'208";a="600047765"
Received: from unknown (HELO jiaqingz-server.sh.intel.com) ([10.239.48.171])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2022 22:49:58 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>
Cc: linux-kernel@vger.kernel.org, Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [PATCH 1/2] mtd: spi-nor: macronix: Add support for mx66l2g45g
Date: Sun, 22 May 2022 13:48:01 +0800
Message-Id: <20220522054802.1719443-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_225006_566500_0EEF99E9 
X-CRM114-Status: UNSURE (   9.33  )
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

Macronix mx66l2g45g is a 3V, 2Gbit (256MB) NOR flash that supports
x1, x2, and x4 operation modes.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 drivers/mtd/spi-nor/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index d81a4cb2812b..1c45829be5ef 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -95,6 +95,9 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
+	{ "mx66l2g45g",  INFO(0xc2201c, 0, 64 * 1024, 4096)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
