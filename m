Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DE5C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:41:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99005610E9
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99005610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYK0WIwAuwoveOyTsLjYjZYzbOPK2gwoQumZEAC+Nv8=; b=hv45wUVD/XpVTU
	DJN7v1nczk2m8dEzRy44PVA/WkpxP4YYXfc4hay4Qlnldyzqji1Zaz5tj33A6iCqSq2lUTlVwXnWz
	Hye66pnjW2R5Cq86aZYDakdWxTtp95dISDHlFe/SBwWI5fGxT1htaQlOrvAYe+tdWVAjaa0YovgkH
	1xdRqfRsjthSe696JpT5FXOYJ6GeI48VeMmZ9P/T4cpF7cd7uX7/PhttEMX4ePinoQJjr5EJedlh3
	w0BYPhJF/b0DGkg3kdpHiQyiNmZf8efJhMNrGewXOH1UntmjPgwWxfPtPBoX0eayxaM0EVhC/OjSY
	OT4ANa8RcjEH1KpOfxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Fpt-00DSUq-Oc; Tue, 27 Jul 2021 05:41:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F6G-00DHg2-74; Tue, 27 Jul 2021 04:53:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361632; x=1658897632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7sygOHV1tKihRyLHBcbxw32cAQ3a9MX29yYfuJ8nECM=;
 b=I2WBwJeAJYBUVjXclOK2msyk58eIjKEH5jZuPLz9xFrlA5lW0JVrHFvU
 fst+oyWUGjyUpu+k15zIdxlVreQXrF1jEEQbxqaLKJrjJtFoqJmYZaX21
 DcUM98pY/bsHRxY3zVvh7sOtu9yz2G6SPM31imbiBKza7l5LVN9/uE+8e
 sOam0+3KOmKvs4H1yGTnrM2VwwgIw9oG5Arer1lllZKNRyd2EVj5m0o0w
 +scqfbW+hSYC0zPHrZ60B7JKWK7IDTkm3VoRwMrKVVDsQ101Fnl/nF7CE
 qx+Cxva5CGXlpdpGCjONs6nXk4kyd55Wfsn76WXMWIgtvBuQwIHkn6FlI w==;
IronPort-SDR: Csg0uB6gYqXwrFNR6VWLSHFCHgqftdB9gRINnxVtO+DB+dCAdqobHhLKvOZUblmsc1RNY/ZAm/
 EjR/dmWTgbc/g1g6Vtpuz71u0VkCV4ErDueP7LjjxIeNFpMcf6XgbfpyhTw9USH11/+qna+PLB
 CpDTnd+gFBr/6xSwGyJKJiEDmjUxPZJeSaT3Vc8Z9QcekrJifRJOBoA0ranpJjF7fG8mJXZ9Hd
 ThSwGtHIYrCyrpuo0R5gcXYHxBi8xsrPaXPW8gyW0jyvqVLVf2ryDIO63t+RlKnl5PKn80B3j1
 VfkCgkdmhRkW3bzKhAk281I8
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="130482159"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:53:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:53:50 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:53:46 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 16/35] mtd: spi-nor: core: Mark default_init() as deprecated
Date: Tue, 27 Jul 2021 07:52:03 +0300
Message-ID: <20210727045222.905056-17-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215352_872252_666F667F 
X-CRM114-Status: GOOD (  10.81  )
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

The goal is to remove the spagetti init of params. The flash should
be initialized by the SFDP data, and when SFDP tables are not defined,
by the flash_info flags. SFDP data can be corrected by the
post_{bfpt, sfdp} when wrong, and in case of flash_info flags init,
we'll use the late_init() hook, where checking for the
SPI_NOR_SKIP_SFDP flag.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 13d5c5edfd27..625f4eed75f1 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -289,9 +289,8 @@ struct spi_nor_flash_parameter {
 
 /**
  * struct spi_nor_fixups - SPI NOR fixup hooks
- * @default_init: called after default flash parameters init. Used to tweak
- *                flash parameters when information provided by the flash_info
- *                table is incomplete or wrong.
+ * @default_init: Deprecated. Use the post_{bfpt, sfdp}, or the late_init()
+ *                hooks instead.
  * @post_bfpt: called after the BFPT table has been parsed
  * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
  *             that do not support RDSFDP). Typically used to tweak various
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
