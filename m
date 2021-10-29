Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB55C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:27:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC00360FF2
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC00360FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/hKqqYZG7HOwcQ0b2Cl7gUA1zwOpigy4l+sY2y9RtI=; b=PmVhSFkYxU2sI3
	L/SX71Gl2kxiVgZFGV3CGlDe1dQrImQnFJboo6FzpRv8PD5yKzdT3bwpYb4cjpJIZE3wA+K6ykFVj
	oLavnUkH6sQi+DZF5E9sF5TN1TBDh3ihbKH1qTxTXgDz5QTyKESTOqeNEj6Q8zYzNVhQaRefHJqwP
	tOP15UbmasMBGrjf1st5Gfmwx0VjwNR8ulbsLOXfSxwGvqUcro/symeZQdgVcI3/mForwjRnjfQaE
	fuk+m9z8VGT8nGBFeQ8rHpjoNpY3dDL/zG+yjWoKD58kHYcVU9yr2lNYZ/7bQ+TyYcJlp0cC7GIHG
	pOZP4U7spGMMREtr4z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgVeU-00BZ6w-Ob; Fri, 29 Oct 2021 17:26:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVeR-00BZ6T-Bj; Fri, 29 Oct 2021 17:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528408; x=1667064408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vZZwNj01aXlomVd47s/qgwjxPYp1R/JLgZxV9hdgBiw=;
 b=kJrDewrhG2Un+k1nbtPvbOrc+lnuMmBKNi9+5im4zhtbKUTnel3oAawz
 OC+pDxSCf1c2CPVxmYk9/NGgFFZtIZxkzMueh5sru1nDpxWJAiUQNnYYp
 6L8LrIypkROuHgAZNWlNNJQ2uKcVq0iLxNh8YI3viWrCirq7B4UP6uQjf
 pL/QMOSoHP4Ce9u3AostFEuUU1GmoyioArKPhSD6Oo1wg/QB77JwfmMIs
 GVQn5OkynQ8W4wD+4WhnoaWSbnaYMZkqxuoUtBu/aG7GXQB4AfSQq+5+r
 SthKuaUI1hRceTGzjAUpvxivJcuYgku0jz9d1lYYDRPYNCm0RXsT2U2wi w==;
IronPort-SDR: 4ADE684+8E7YmjWIFj3tNwakSEOam31D4DSyN8v6f+zQZKwdRj3P8wjahe4blpm3KWnIE7DvwO
 mdPN0uGRF8yZI6oIY7I9Q8nVDm9VriW+GsS1eOTzzPGtwXUb3xQyABwsNwrAfEx64QPiKrl1tU
 81C2hvxdNJeGzF2BafOSBp68FR7hRG7Hz2/WMh7Ph2kddyK031XpByCEsBO2Ui9r5cdFw9OZrx
 0tBfIw/YW+L7b7aXZxLW2VSUvqbLQssI4ENjia6DZ7ADk4pNpOlt9k2IDSOXFSa/xytXcHy2cm
 A6eY4MvWTVzRgV6n6fuRfsOW
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="141586097"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:26:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:26:45 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:26:40 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 01/25] mtd: spi-nor: core: Fix spi_nor_flash_parameter otp
 description
Date: Fri, 29 Oct 2021 20:26:09 +0300
Message-ID: <20211029172633.886453-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102647_463896_FF36D856 
X-CRM114-Status: UNSURE (   8.62  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Update the description of the otp member of the
struct spi_nor_flash_parameter.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 3348e1dd1445..da3fd3636d3c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -250,7 +250,7 @@ struct spi_nor_otp {
  *                      higher index in the array, the higher priority.
  * @erase_map:		the erase map parsed from the SFDP Sector Map Parameter
  *                      Table.
- * @otp_info:		describes the OTP regions.
+ * @otp:		SPI NOR OTP info.
  * @octal_dtr_enable:	enables SPI NOR octal DTR mode.
  * @quad_enable:	enables SPI NOR quad mode.
  * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
@@ -262,7 +262,6 @@ struct spi_nor_otp {
  *                      e.g. different opcodes, specific address calculation,
  *                      page size, etc.
  * @locking_ops:	SPI NOR locking methods.
- * @otp:		SPI NOR OTP methods.
  */
 struct spi_nor_flash_parameter {
 	u64				size;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
