Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3C8C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 05:57:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 886DE64E49
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 05:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 886DE64E49
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jqkkjCUdg0aPhnI8UtynJUi/EXYFT9nqTiaQSgmar4A=; b=HyKKW2AuNluUmCdhiXBDkLNuta
	PUK9yYRvQGkrMvxG+clmY4EbVQbTu7Arp4sdX96wuSayps7SwSaoxfXuLIULVR6lKWsvoWByUSdlG
	DCFAbGDNOUdysF0BThW0HJ+ilELl8DVkfynqDbVAlw7VNCfBB2OzXYZ5ZyoyrgGd0B53EhhkI+6nq
	yB/tc1dR0muvFwu2TnvvEwtYLtoX2yGo7ZaGBbF0yH3CVF/SKV28q5qyZpCcCpoGTRmJDoeYkSoDx
	e24lhJNwXraGicw2NPmezEU1zElj0nfQCT/otQZPSUMm+MWO2lXGt8d68eKf36qFB9QmFGWG58m6B
	ef4zftKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLgDo-00Eza3-OI; Mon, 15 Mar 2021 05:56:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLgDe-00EzYo-Jo
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 05:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615787806; x=1647323806;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JOv9nf8B9U7wOZ0NotKK+ObE4/2lAZvK35sQX7F14L4=;
 b=yMiazjgfic2mvww+GeF0ik+53ft4FXy7fR8At3n2MpO6zpyRmKqyx1EP
 tKTW0GHJ1wacsbfCCeVV9ClacZyZAiykisxPh6mIzynU91POyGFnu5pRJ
 KW2WG3cUiuBzatemUB72GnU5pv5Dt8081U8QMU+X3QOLvcIaNuT/X7zn7
 JR8/yXLqJExj4wuaHHyOfhB6Xf8AzvdmAEQAmBWEJ2jI7nOKaXuNqnJIS
 DLv/TsX1xNt9ajYnZHywYyI7foW5NpelWhLTpMtdFK1FkF2ZNCPTxgR9o
 o2wDyl2ojIKL/nZMBKVjk1NmcvPAzHTdV+Y6eBS+w+5rY4BPDCdV8kURG A==;
IronPort-SDR: hsLFSB8Xdzl+pfbgx4J0k//AhnnoWOx9KB+5rAPoB+vs3rQyjdm/+CTA+OxksTyviXEt5c6dps
 5ND6EAF2v7OIBo6MDLelBsyEblxjiaOUJkxAGxqaGmccozTzMkJ4lLnrUwP9eoNLSJ9dTkagl2
 kIunYKhnu78Hz3ly3rQw3vle0gAF2bNiwiETi9FRES9eIfBOsxXF2XPwXOxMvbpxsRI2lzxLbc
 F3U5FyNR8vpCmWUpOEmX4xYQNHm5yw05nTnEC5CJ0lZmy15YY3VP1Z4GdqOilyN+/xFhT4mV2K
 p4E=
X-IronPort-AV: E=Sophos;i="5.81,249,1610434800"; d="scan'208";a="112724540"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Mar 2021 22:56:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 14 Mar 2021 22:56:38 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sun, 14 Mar 2021 22:56:36 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: Update comment about the default flash
 parameters
Date: Mon, 15 Mar 2021 07:56:34 +0200
Message-ID: <20210315055634.17332-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_055648_490851_E906A91C 
X-CRM114-Status: GOOD (  10.01  )
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

s/legacy/default. spi_nor_info_init_params initializes some default
flash parameters and settings that can be overwritten when parsing
SFDP, or by fixup hooks. There's nothing legacy about them, they are
just some default settings, if not otherwise discovered or specified.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4a315cb1c4db..26f681cd3a98 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2913,7 +2913,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	struct device_node *np = spi_nor_get_flash_node(nor);
 	u8 i, erase_mask;
 
-	/* Initialize legacy flash parameters and settings. */
+	/* Initialize default flash parameters and settings. */
 	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
 	params->setup = spi_nor_default_setup;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
