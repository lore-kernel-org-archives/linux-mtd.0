Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F47C11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:42:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0CD613FE
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A0CD613FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUrWvaQ6tLsb3aOO5Lep4aOc4f65XplHdC1WyA4oM+c=; b=ORNSBmEXzHRtpf
	Pu5R5H5mo0gQBh9G1x1V/YtXfTkxQFLvxROk/2mp82stE6+pTRMGSbotwJzTY269Oms/5xJJRQDsq
	jYAo2jF7wIq5A9wsPf/OYEN5EfaIPVhvqYTQZ5u2bUFke817a175Dc3SSh7VgDjkppkBrlw1GCG7F
	07jCo3bY5nrlMDlTeQSyGKbvcvwepPD79hjlgfn+oK84qD8FnGDwSS2iuIQa+/llRbn0wlZMwJwx7
	47SEj+hy+eUEB9UGi4ocvU33jKiFnsfhGUvuvvuWcb7vCvHPW4mVQ+Id58c9CE6BIvpGcLE3Mv/Uj
	6JMRpleSTOQbUVhNoCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzKMr-003HhC-M1; Fri, 02 Jul 2021 14:42:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzKMI-003HYx-4F
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 14:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625236893; x=1656772893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CSXeHhHRroysqBWxbW4/LrUR1oh+ZN80pio3MzNvJmQ=;
 b=nyZCCAQkXR9GFmiuK59QjxAhU7VF5/kJpL6bE/k4FzCjIjA/xpIeJLcR
 RbB9DwKR373VJ+4ykxRyCg2xV9AY5PomjwJgJx5OhdkEybbmiPfAXE/49
 OUcXiLKJiUn8XxPQ2Fsjho91ExiKi/SYB4z6C4NaliyQPAkTBh02ylJgb
 IkmnfuduLcd6dxnDB6tytQcjQI8lt+p35IyogM2ir0nl8WXYRopHqnFi1
 DMQvke80544zn1V15D4ZvkpicDvPtUFlWGwQt1xonr8JbiXCgdt2ewFIT
 D5xCMuRE/Zolgh68spnEuUipDy33ky1TS01lzxEy3+EudoBLchcYJMxBf g==;
IronPort-SDR: F+KEs8aXVUcK4VJSB5/8fpYGhdDzZ20um8uWtAhhFrS353BfCfaRDyOcQOGEbBrvf6LmmY5hcG
 PfyDIwY1HMhGp3siKt9VdekBwsidK23S7bNkXqa877QL35u9NotaL+Aa9oQowvI4mZ2hzL+UhO
 VHMIuwf4PSp0epENJCGA37dCd1XMbsgMoCYHPvsiW6L3Q0oaPFyuf1EF/L6s7UrHLufXUNjSwn
 bN4ZRGhhFmYhPHl58lk53u1UWnWfPivoxvQg/frDZ+ZtFHxV8KE+OzwQRbX+OZr85yNd6bUkYD
 4y0=
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="60983587"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Jul 2021 07:41:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 07:41:30 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 2 Jul 2021 07:41:26 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>,
 <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>
CC: <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH 3/7] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
Date: Fri, 2 Jul 2021 17:41:06 +0300
Message-ID: <20210702144110.250481-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702144110.250481-1-tudor.ambarus@microchip.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_074134_290775_2246DECA 
X-CRM114-Status: GOOD (  13.53  )
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

Macronix has a bad habbit of reusing flash IDs. While MX25L3233F supports
RDSFDP opcode, MX25L3205D does not support it and does not recommend
issuing opcodes that are not supported ("It is not recommended to adopt
any other code not in the command definition table, which will potentially
enter the hidden mode.").

We tested the RDSFDP on the MX25L3205D and the conclusion is that the
flash didn't reply anything. Given that it is unlikely that RDSFDP will
cause any problems for the old MX25L3205D, differentiate between the two
flashes by parsing SFDP.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/macronix.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 27498ed0cc0d..83a097708949 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,26 @@
 
 #include "core.h"
 
+static const char *mx25l3233f = "mx25l3233f";
+
+static int mx25l3233f_post_bfpt_fixups(struct spi_nor *nor,
+				const struct sfdp_parameter_header *bfpt_header,
+				const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * Macronix has a bad habit of reusing flash IDs: MX25L3233F collides
+	 * with MX25L3205D. MX25L3233F defines SFDP tables, while the older
+	 * variant does not.
+	 */
+	nor->name = mx25l3233f;
+
+	return 0;
+}
+
+static struct spi_nor_fixups mx25l3233f_fixups = {
+	.post_bfpt = mx25l3233f_post_bfpt_fixups,
+};
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -39,7 +59,9 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
 	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
-	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SPI_NOR_PARSE_SFDP |
+			      SECT_4K)
+		.fixups = &mx25l3233f_fixups },
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
