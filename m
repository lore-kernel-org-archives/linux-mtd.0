Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEECAC433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jan 2022 04:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=68GCZxQXrO1O7DIO6oKu4rWmT7WsI5mwSeSMxTZlY7I=; b=R5iRJO9V/xDDsa
	myJ46WQWOeokViARz0uMKfX2Lopc+yYjd0dduAW2e2pLmOck2djHjActcdmf5EKScU8GSja7Q1Xx/
	q7EOa07QkZaejQ/ATXywXLFcJKqFTBpukiMnbKCfdWMfozyy5dfRD+eQuStxBTQl9+LhiRAZQurjz
	8vzU1C9Dh+gPLJa8acuelqj8VFCgQxE8uf9E8oGSKFe1tklVFKPfn4sV98MdkU9b97RCKPD01RXWW
	xdXDuN/j6gLntAIFuQbgpanASMIlj9ETLs6uxJaZU6mIDUlVdqpfoRr05MokEdGrJJyYRagPJiiIl
	QnRxqabhN/S9Zf8d6w8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6Q4d-007LXD-Rd; Sun, 09 Jan 2022 04:44:55 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6Q4Z-007LWZ-WA
 for linux-mtd@lists.infradead.org; Sun, 09 Jan 2022 04:44:53 +0000
Received: from microsoft.com (unknown [50.47.106.53])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1967D20B7179;
 Sat,  8 Jan 2022 20:44:49 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1967D20B7179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1641703489;
 bh=lM17pZ6iCOU37RIPTzxAvgHmS64CHTJOGzcs8Z4rB34=;
 h=From:To:Cc:Subject:Date:From;
 b=Pt81cE8fadR7R460L1iG8bsxgGyCM/Bsiat2And1RpMyQOdUl5tByVzm35+6jCJTE
 UJ0Y8oWiMG2cPhiVvBlAh5dCxLpYFjBKOPB5KbOGmM9OOu6gpEKeLgZLFNL9F/Y8Wa
 fat3yJpF4IuUWzWQlsNUoannnzAKi2cZALoSiq04=
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Dhananjay Phadke <dphadke@linux.microsoft.com>
Subject: [PATCH] mtd: spi-nor: Add support for w25q512jvm
Date: Sat,  8 Jan 2022 20:44:18 -0800
Message-Id: <20220109044418.4657-1-dphadke@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_204452_089162_731EA04C 
X-CRM114-Status: UNSURE (   8.94  )
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

Add support for Winbond 64MB W25Q512JV-DTR NOR flash.
Use PARSE_SFDP flag to init parameters during SFDP parsing.

Signed-off-by: Dhananjay Phadke <dphadke@linux.microsoft.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 675f32c136b3..ebc826e21f76 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -118,6 +118,8 @@ static const struct flash_info winbond_parts[] = {
 		.fixups = &w25q256_fixups },
 	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512)
 		PARSE_SFDP },
+	{ "w25q512jvm", INFO(0xef7020, 0, 64 * 1024, 1024),
+		PARSE_SFDP },
 	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
