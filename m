Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF328C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ast08ZsbQUQc8RqGLTMDZiaLpL6tWa/+63KcLtSVA0Q=; b=poMgaVDQ9Ce+QV
	/tXHEbYWCMTyNUCCw77o+e2KdT2LwzeAPqEhacLPvH74pfNdwuR6Z83UL0IsG41LPUVALRtmBMgTo
	vpqSsyFvTcQ6DZd/UX6CxhetHIndbesEDT8n+E7P4oM9HuHTOmQVIz/8bMP/ZyG3O050n6DObhlbf
	6EJlA4or2VNXEnWh764G8OnoCGq5pBjsGWouqLaZmxaUIdvNRtQX4QN+7IMNCNcOrkEOgeiyki2PI
	mpP3UROum0yDvpHsJzWWIjVL5McUBY9PP9Qyqxk6iA669UbmNriHLc5uc2+hiiDAzcpBqCF+2S0bd
	q3/ZiPFJ2kAGEAR79ZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt960-004jC4-Kk; Mon, 23 May 2022 14:31:44 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt95x-004jAW-6U
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 14:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653316301; x=1684852301;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YBrLOC6FryVEjG7ppN/ojmlQfMwF99DKj61Ta0XGn4g=;
 b=Z3QDwmkxUAq+KTeiapx3oVDvM44XQpqfOItrTKiVzwa8Dysoko3IwWm+
 2jGrQ5rt8P/6/crhnJwv2XrLDi/2psDoVhyudtPSeL72NgVmN5zrw3IrO
 VDvNbleSafbxiHZbJ1wxnI6LgZEdvGLVMshYUxXVX2cTLfhgWq/SPRIx2
 r2SSCG0xeSBPElBAANCMPZxXb3vrQbG8D69rsIxbt3qQpsvJsOd9bU78Q
 UWUr5/KciJsw93KizzM5QnCR+xxemdPPg90gZa4zeggAM7pkCfjkzI0xb
 wg1tFi19AJaN60GcFDoWFxj93cah5Y8ic3Q/HckExJX71J9W82RgS+n9k w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="273357308"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="273357308"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 07:31:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="600678415"
Received: from unknown (HELO jiaqingz-server.sh.intel.com) ([10.239.48.171])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 07:31:37 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>
Cc: linux-kernel@vger.kernel.org, Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [PATCH v2] mtd: spi-nor: macronix: Add support for mx66l2g45g
Date: Mon, 23 May 2022 22:30:02 +0800
Message-Id: <20220523143002.1754922-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_073141_319214_E86E1A25 
X-CRM114-Status: UNSURE (   9.20  )
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

Tested read/write/erase with Aspeed AST2600 BMC SoC operating in x2
mode at 50MHz, using Aspeed spi-mem driver.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 drivers/mtd/spi-nor/macronix.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index d81a4cb2812b..fd24ce9f02e2 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -95,6 +95,8 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
+	{ "mx66l2g45g",  INFO(0xc2201c, 0, 64 * 1024, 4096)
+		PARSE_SFDP },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
