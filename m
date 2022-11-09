Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EB1C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Nov 2022 20:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xCS7uIyXFCpsYkDz+lYOaGiDLv4SWsBkoaUUUVw9UUw=; b=hyXBzO+jChpnqw
	HYedUyrG+lfZFvdg6JqxJZwkIoJP+KjEVXoXcMaP2R2E+b/iKdNx0e9ILEr4dgIKlxgX5SbsLLiBV
	2CiN6vTvzenIKmFndI84i8OcqHmkQKJJZDBhUcm4JeBAIKTKlvLKTzggToW1tXoi6eB65p/g43jy/
	iBDabf+jzsHaH0/TBn6DM3NvkTWZbTVG1JYG93QN+YrpP68bvHWTQU+jEVaPD8c3Fgt1EduOiIdaO
	GicCsGOmxB8XGERV6SYpwotcaRfSJJf3peKmca9GD3DBdS27pVdoH7Ex9uI0HW1rzFstq4JgjrxpI
	7Pb0Gqy/yvLx9xP6wLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osrcC-00GzgF-Le; Wed, 09 Nov 2022 20:24:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osrcA-00GzfY-0r
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2022 20:24:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B7EFF61CBA;
	Wed,  9 Nov 2022 20:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343CEC433D7;
	Wed,  9 Nov 2022 20:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668025440;
	bh=7+5jyTKDsBSnzUCypgmhEzafnQWwO3MDHgaXspdMOVI=;
	h=From:To:Cc:Subject:Date:From;
	b=T8ooVs2pwLN7kWzDt7NoDC1RaNGkZQxrFFi205GVftjQlo2Nioki0YrA+fcUEIahG
	 VzQ1hUkw9QguGB37xPLlBVA0ntWVhfZhPLFLL7mkx7pT918QKQl53AtoVFFCGN1Yi6
	 BnjWCN9s6g6CXcagFjozEsiHV8k1ZF4SazO3di3RuN8xmzuH199BiO78xtXzrmtJwt
	 Z3nCmj1o9gxdDrMEK2PHSGjSn1IdA5ahBDr/sE1QWZCSqePni6scTKXAA6LOnS9aPp
	 l9dxUsv19Fe/soI9y7iaeIx0b23ng9hP0lDEPdiyPH3Mi8Y6+V8zUWPM0soFBxp4t4
	 dYcaSgmKNQrYA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-mtd@lists.infradead.org
Cc: dinguyen@kernel.org,
	tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	linux-kernel@vger.kernel.org,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Subject: [PATCH] mtd: spi-nor: macronix: Add support for mx66u1g45g
Date: Wed,  9 Nov 2022 14:23:47 -0600
Message-Id: <20221109202348.93666-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_122402_140478_9A14ACCF 
X-CRM114-Status: GOOD (  11.61  )
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

The MX66U1G45G is the smaller sibling (128MB) of the MX66U2G45G (256MB)
that is already supported.

Tested on Intel N5X socdk board,
  - random data write, erase, read   - verified erase operations
  - random data write, read and compare  - verified write/read operations

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/mtd/spi-nor/macronix.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index d81a4cb2812b..46ba898f3dd0 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -97,6 +97,10 @@ static const struct flash_info macronix_nor_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
+	{ "mx66u1g45g",  INFO(0xc2253b, 0, 64 * 1024, 2048)
+		PARSE_SFDP,
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
