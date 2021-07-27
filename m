Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3231BC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:19:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6496610A0
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6496610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/LitzKXsgDIry9hqY4lCwAbL5j0WQj+cvDGWBnonCo=; b=0JmjubptcmCy+z
	MJ+md+xS84N+soYVvTmGRObZm+lD40vXQ4K6ULETTjiUOxpHXpmvC6o1JbUeNoN+6vMaCsVCX3Fd1
	S+mbeIEfV1YdtgudNuANG3E/y5uFArSVaafdSF+s4PqP1O/xdjkBpewYyXCKB3scUrt1wN1s76AqR
	Xag8shhh6F97Vvk/xdJmNXmgTOSK0HjPmHrQ/btYY99wW21EcXf8BXdbRwa5DhWfVk9vawFavSFfu
	7dyQmhGzZJ9U0T0WQEZOiJ9JVfKG5IuDb3tPqW+4zLFCKv4EBVXyZ0Aw/ij/5+E9KdE1+m+PyGjCs
	HcGl4mx7CjUeRjc6VGGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8GQh-00Daz2-4o; Tue, 27 Jul 2021 06:19:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F6v-00DHth-QK; Tue, 27 Jul 2021 04:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361674; x=1658897674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L804f2SQT/kD0Qvc6v7SllFOYiMRzMP0mOA6jLCywcU=;
 b=NKtLOMewCeMm0xzuxJuKgU97huHiB1A5ASHXT6vOAm8z+hoQRDqxsETk
 g+oztjn+jaCZRL2tD3bssTxIkMZab3kO0RXricvUH6HAnUqM1FM71B5VB
 vrxx6Q25Vflv/jCPvsj103vYUZOczIeGwZLVxKqp7mL71njMY0URM7TUY
 coTrrp9YxME1QgefyWKJWiBr9osIAES8HGCaGrFG4pu7PzkyX4MOQPO6g
 M4SgeV/4SboXVixfRJLtLhf/Q/l9s+rCZEiwszYHocs9eOQiq2alBR5BA
 +179PdU1GKXGFjA3uBZYVwoi6ZEgxyxZ/B+ChQqi0GKtEe0nPNjhJFw94 w==;
IronPort-SDR: BPCUfJkl4AbaN1aBkWL1mZent3s79Ri/lrhqherdkcQEHCWmXrevf6S5RUHZqDxbIKds0EG/ZH
 VnzkINf4hnaPoDMka33S7H8qkjOmUZn9DirvE9SRDgMHjhLfTgZrhRq0Q6wQPLSv697B35bqqm
 aGnnyX2U/9N459IGWIMzwbo5P+IDUdXNlb0dCFLIrxhWaYTr/HsbNd+RkImk/1ER8jZY0KK6YD
 7nMX/9tMJ7vWTBJ5wvbrwCXcuQKcuD0N9CzoLDEBrW44o+f5lSm2Jm0jxQoRTSEHLAnigikAWc
 mm1ZB50W24zAwSR6j44m3nic
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="129935509"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:54:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:54:31 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:54:26 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 24/35] mtd: spi-nor: core: Fix spi_nor_flash_parameter otp
 description
Date: Tue, 27 Jul 2021 07:52:11 +0300
Message-ID: <20210727045222.905056-25-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215433_927014_D2775BC6 
X-CRM114-Status: UNSURE (   9.16  )
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

Update the description of the otp member of the
struct spi_nor_flash_parameter.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 7fb0cfabe85a..501d9212ba9b 100644
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
