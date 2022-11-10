Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CE1C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 15:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckxGxi63o9Lgg+q0eq7evEG38GUBvglTTNsErC8tnf4=; b=tIPgCWrWuC0Qcw
	z3mGy5t78II548CYuu/l2eL0GCKOoRAVd32pei1JMc7MDO+f7o2MFrO/4+BKKp5gjOIHDIMwTNdqQ
	ypk5NjJdO/ZqzUuFKmHwtd1JzuVs/BKC4NtLChqqzu2OZIpN5U39hguTSQ1iMN1DdQD7xY5tbr4WH
	tE4CrEjLY2Wws9SetDc/XwV0v9aCrpAsqkKU76OpfO4FSSFuZJw785rI7q5P6tbGgdlxIH94U7YNo
	jQ8Bw7GZfqEZ2bdThbqSUBBhZS8xNblH54Wr/B/6UbnQoe2WNRCwIcp1zLRZO1yHWaMWuwotmThxV
	b8C2ca+CMB1jejFXtf5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9v1-006xp2-1Q; Thu, 10 Nov 2022 15:56:43 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9tp-006wuj-Ds
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 15:55:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CC10C20005;
	Thu, 10 Nov 2022 15:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668095728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KpcnZIM/nvnkoOD5kEWESQw1w621rkkiGNkytdrjgTY=;
	b=KoKA7de2SJgAYl4q7suDzXFHqm13bw07P3pjEi0oVmboh5RmwAK56tyc8wdC1dMD2WLU+N
	WPnZdsE8gCjLFOHsjP02cugJeYyiuXmtzy8f2ZERsW4oqgokrjR3NgNzwaxCQk5/ioQYWi
	hfCZ3JnGfFcU7YKH2gLfZ4cBzQclurZlcpO4fkE+ZD2t7s7+ZIKBOK4TdaPJ0rqFndpsjK
	OvUeIoXKKkzLJfI/O2Mx20hrKUozxFwAs88f4nYBFheXQv5IWPML+gh4Bhd2MN4hRPQcmP
	Ubk7MkhsYJuZuecLezvgjMDdxb62ec6tnOjcJNzSeIbnjA0tyGqWv/2r8TniTg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 9/9] mtd: spi-nor: macronix: Add support for mx25uw51245g with RWW
Date: Thu, 10 Nov 2022 16:55:13 +0100
Message-Id: <20221110155513.819798-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110155513.819798-1-miquel.raynal@bootlin.com>
References: <20221110155513.819798-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_075529_651214_1063A150 
X-CRM114-Status: GOOD (  10.23  )
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

Describe this new part and provide the RWW flag for it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index d81a4cb2812b..e9b82afcd6c4 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -82,6 +82,9 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx25uw51245g", INFOB(0xc2813a, 0, 16 * 1024, 1024, 4)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_RWW)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
