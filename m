Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAE8C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jan 2022 07:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kAC5liTDAfMH9ee0OUbjDUE/PukW0vTx+yMy/C8HRpQ=; b=yYE3G3FG8r/UBX
	iaZHY+kpYRubl9iNHMygLjg/JJbeJkFH6vA0vFZgzfWnA2iGPqd/Mk87u3cUGzVLRTR8azEQiFsA1
	RDbtB7q+/bNJOlha8c90Dedu2UP5Auafzx7O8U0pY1Wta4VyKbNKzg0cEWH5sfSGfPynnNJ66mzgA
	bXhynfvGJvWp4QQG+hJWj0pxf5dzi12+CBo4a4w1BMwpB2uF1rvCBff5m3r3HwTrsrW6f3XwQ8ODy
	TsQ6FTh8sPvW7koEqyR1ttg073KoPVRludDGfRp4y+WKzXTt6Bj/FE/mXAgZcoGPtM9X3Kp65Y++2
	peFtxjD39o72TQ4/cf+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBtPP-002Sey-23; Mon, 24 Jan 2022 07:04:59 +0000
Received: from [58.34.33.2] (helo=MAIL-SVR)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBtPL-002SeX-Sk
 for linux-mtd@lists.infradead.org; Mon, 24 Jan 2022 07:04:57 +0000
Received: from ubuntu.localdomain (Unknown [192.168.110.22])
 by MAIL-SVR with ESMTPA ; Mon, 24 Jan 2022 14:02:03 +0800
From: Ley Foon Tan <leyfoon.tan@linux.starfivetech.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>
Cc: Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ley Foon Tan <lftan.linux@gmail.com>
Subject: [PATCH] mtd: spi-nor: macronix: Add support for mx66u1g45g
Date: Mon, 24 Jan 2022 14:02:25 +0800
Message-Id: <20220124060225.149007-1-leyfoon.tan@linux.starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_230456_282029_1FD5DCF9 
X-CRM114-Status: UNSURE (   8.21  )
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

The Macronix mx66u1g45g [1] is a 1.8V, 1Gbit (128MB) flash device that
supports x1, x2, or x4 operation.

The mx66u1g45g is the smaller sibling of the mx66u2g45g that is
already supported.

Tested on StarFive Dubhe hardware on FPGA.
Validated by erase and read back, write and read back.

[1] https://www.macronix.com/Lists/Datasheet/Attachments/7877/MX66U1G45G,%201.8V,%201Gb,%20v1.4.pdf

Signed-off-by: Ley Foon Tan <leyfoon.tan@linux.starfivetech.com>
---
 drivers/mtd/spi-nor/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 97dba1ae7fb1..79ee808c5442 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -97,6 +97,9 @@ static const struct flash_info macronix_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
+	{ "mx66u1g45g",  INFO(0xc2253b, 0, 64 * 1024, 2048)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
-- 
2.25.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
