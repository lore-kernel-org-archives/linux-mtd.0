Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE22C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 15:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0j8U6XIWk+hIhhw71NyOS3JQhzKf3dyl3kN0mrzymTc=; b=h02s2v6W4GKtIB
	LQ4Jl24QWCK6TVOhzzB7LEMvkjt1MzLXb6uFeWKT80BY+pMfD0OVdBP2PnTWw60oB3PJytYr8vYzD
	zh5Nm9BYCgt/SN8+OclWyi90BDmIJE2cBgDl7znjEN8Pl/sH+u7TD0WNRWwILZsMTCJNpe6YqoTTt
	NylKpb5AfZ+sK3YjUO0soqt278kgEjjY2/rMOE+wumnV8/UrocQ5aYzrwMy/3shOkvmX//wLqcS9T
	e2+R8eOLHZZC2uAhK0KJZ0B+dhRRV2G2/wnZrHsNzd+c4dKysyQGA9ogDgeYRbalpSaPuh/ca4o27
	xWEC2m9rtqpavwxBiaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt9ca-004qMb-Jg; Mon, 23 May 2022 15:05:24 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt9cY-004qLj-3A
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 15:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653318322; x=1684854322;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GqBSoJu3ldq8Yjer/WKHt/G1jAH46RUioQAqT3NrMaM=;
 b=SNc9q5L3Pqf5lkJ4e/IuATdxtr30T/nBkKDDmgWOE0S8GV7ZIEXgM2YC
 cbEnqZu441nTJSxsr42WzZboE30iLMpFMCPrOffQ1dLLB6h9oojD3uqzD
 BNGi3B1qryXvzRSlM+oyiBAfBv4yT30XjJqjJD0nMMkC2N/SRVUkeORv0
 xPyw3F2iCNwCGJGcKAKmkkgnbOiJ4wPMNFaAinOuD/Dc4b7O9IcSHU4Cz
 rbG7rHo1s0w6xtWgnkFyBp8lJHHJu9X+8oS7WK4Zb0JJpD+3Tzt3044CP
 84ZEBz+P5GdDufLmZhEYj/56gNDR9B2QQHS9WqTQB9bHBFjqmuD5vzAdz w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253750765"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="253750765"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 08:05:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="548015532"
Received: from unknown (HELO jiaqingz-server.sh.intel.com) ([10.239.48.171])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 08:05:17 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>
Cc: linux-kernel@vger.kernel.org, Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [PATCH v3] mtd: spi-nor: macronix: Add support for mx66l2g45g
Date: Mon, 23 May 2022 23:03:35 +0800
Message-Id: <20220523150334.1758649-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_080522_209780_F3E39C71 
X-CRM114-Status: UNSURE (   8.61  )
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
index d81a4cb2812b..33d02a01b381 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -95,6 +95,8 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
+	// TODO: Use SNOR_ID3() for "mx66l2g45g"
+	{ "mx66l2g45g",  INFO(0xc2201c, 0, 0, 0) PARSE_SFDP },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
