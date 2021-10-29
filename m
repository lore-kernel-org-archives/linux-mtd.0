Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD4AC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:39:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CFD361037
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CFD361037
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIi3DPpU0ZNhMgyD6tsVOq70vUDi3u3SXaSNfmdB17A=; b=BMKCwqlN+ZT9XJ
	9T6dFvdYCQwpP407wq4jM9rkZ0R84lfSGI/+SOQ+vFgweqFU4fZiqkCYg0m81JqXuHtCXiB9gRBJ2
	W0Qo86no6BOBTpXdaPtJIiRRlbK/jhm1IcljNkAtJ88gPMVVDdSgRo0LtPldHsdvocoPqH6gJ2mos
	7F29QLUiS1tEtE7MyZUr7iBs//6JAvmaF3G84WMpgDXdJHG8YFuqgGmPnOIHTyc8w3co6JGT9DVK5
	uHvWmVkNEK5KBwDhGdBQdAaEGtcwohTjfPpQTFX5MjX03NlQrsYiY/8UBnyOCtAB9TGKdt97WLjtb
	reMuUTKQU2VVdztEwkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgWm6-00Bohy-1h; Fri, 29 Oct 2021 18:38:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVgD-00BZdo-Jo; Fri, 29 Oct 2021 17:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528518; x=1667064518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9LsGXQPEaO7c7loYNuypG3KlJ/5RGzeQomH4AOX0xEI=;
 b=2W61KNSWD+x5Ei4k0vWOHfc+NcR9ayanpd9uhnpF03HiGEskghkb3wCe
 p2iEfVdQY62clQ/FiQl/0XGLWREIMVCwlvJjikUsJv5tSTgamw2y/h/D1
 OB1VhLkpmymRWu3VrkaWO00a89cPJUypXLrziOM7NVQla2mO0xUaA2BVB
 VYjgDedmk/2twVwyl730yTW49TeDbERbK7y4xWL2Jsj+kApsEMoU/NoW9
 Sv47YlBq6/RX75zGfNogcdw+NlLPg/6V+aZMlFHy8FpUD6nepZ56MfJtY
 an+Gtz/h4/yrBCHa70gMILMKa8/gznBR6znMIAcvoHfh5JckvGVeun1df Q==;
IronPort-SDR: kd/Tl8QAqVvbX6aGxfbIpbTJMpX1dH14hhXaGMSTiDVB74yigZeH7TdQkTwgjVTlLf2CLqoGYS
 eWR8YapMb435KxoDRafGoD2qaPYsj5Yw4mPy6WFdSdYIkeKYzf40TyZEHx4wqp6WKzEeUU/F4D
 cmGCCYmPJ424qzyvQtVdnm/hjvbtQcpPioWpcm9b29SipZgzWb5OnDQZTNpzuzkPgry4m9eiUf
 W3nUDP/o0M4l6TAJZUBB2zSWI2hJoSacF4JFFHokrrwDsw9E5kTP+f75RwsRKF3qc6+pcfiGMY
 KSk5giw6ly1Zy+3RbBk4fJef
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="141586495"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:28:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:28:35 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:28:30 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 23/25] mtd: spi-nor: gigadevice: gd25q256: Init flash based
 on SFDP
Date: Fri, 29 Oct 2021 20:26:31 +0300
Message-ID: <20211029172633.886453-24-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102837_725708_36EC14BA 
X-CRM114-Status: GOOD (  10.44  )
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

Get rid of the static initialization of the flash parameters and
init them when parsing SFDP.
Generated a 256 Kbyte random data and did an erase, write, read back
and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4_4B 0xec,
for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_1_1_4_4B
0x34.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 59053f419642..90573c59ad8b 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -46,9 +46,9 @@ static const struct flash_info gigadevice_parts[] = {
 			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
-			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
-			   SPI_NOR_TB_SR_BIT6 |
+			   SPI_NOR_PARSE_SFDP |
+			   NON_SFDP_FLAGS(SPI_NOR_HAS_LOCK |
+					  SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6) |
 			   FIXUP_FLAGS(SPI_NOR_4B_OPCODES))
 		.fixups = &gd25q256_fixups },
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
