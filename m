Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B024EC4320E
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:56:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8117160FE3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8117160FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVErBaoI8J4do/6ODGdtCWkb8uXJ9ug0B8yEbsRmKgo=; b=pPVbVLyhiLNjtQ
	1X24u5DpNcolQ6xEugyBo8guI62Gq8lJaM2Wv/1bOY6VKrwAY9FsdpY8zSL0FkicNtBXgi/6NsRR3
	ui2nMwk5gLiTuvyWNysM3QxMCqxjgnVlnjIdt9RHXBqyfg20+Ku9ZVzlhXm4dMHHHQmTyRx+1b7p1
	MineF7RrQ65TckcHT9N9cU8rKh8uYnN3TIrdPqX7DiKFjvEwVOqTfZxtqDjsyO4Cv9JV4Hmrp6ofH
	2IVPG7JO4bIBwsbLyRrE2cNe8KsXIfUN+2KWHi5K7l4iaKt+gTCchQFigzjbvP0Jt6eN/3Yy7nv7O
	/KQvtC7hmdsNjiwt9U0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8G3m-00DUmh-8o; Tue, 27 Jul 2021 05:55:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F6V-00DHkY-EX; Tue, 27 Jul 2021 04:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361647; x=1658897647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jS6nbw3I4zv0fIPeQBXIY5jxxOe47HQkmbUGrc480eQ=;
 b=KPMKjhyBiBvrmERKULRvRyW1eoek++VCu4Hj/VetNv5EtOReGCnEaA0T
 fR67t4A6jDCQtfU8HVIe+ervXR8zBGt4ijEIE7YID3sY2J9EBzeHzX3oB
 q1VKuVcQHtnKPt6HG4hc02Y+y3JscGG1FI5RRRkXRg+m6JJ/D8Gy6+YFn
 eBHHk6Fwj64a2YJLixuUWbKdBilhu+jo3aGnQPiDITpNkdhVZO9E2GcGZ
 gklS8X/m5yuvKYqcOqGvwgiX97S0FRQC1UrPe+v0ip7UfP9nd40s9NYbL
 pLzKZ2soXf17NM3XxK01v6dnwpZtiATTldAcHdhFEdG5Xj9xrxeauJQsl w==;
IronPort-SDR: EbLnsmlB66hSQJ1YjCE/c1GNhGfiipcd1EfNwGPHWZ29bgrj8OhYM5oju0bjJOOJ0B6nvBHv3J
 Fcv1QFZntOYX5gSoRN8ZO4pY9MR259PGm23Rihe+Ev5D54sgMYnnrZXDB5PmxhXSBTQq3oDeUC
 cnD4Wka3j+JY4AWuZhaeh7ZCxvcvdtxxT1ceuuWrjO6alEx3DKk0GGC6JObvR3WN+bOmprz2Uh
 lxxyt6M1FelqQ3IZLexaEMAv2XkdMi4OSuLJzl0Y3oWlYan7oGzLa2Mx2xy2nQkyer0mGEzWip
 i/5+8oZIy2a/5hZ3I2aThKyK
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="123560027"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:54:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:54:06 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:54:01 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 19/35] mtd: spi-nor: Get rid of SPI_NOR_IO_MODE_EN_VOLATILE
 flag
Date: Tue, 27 Jul 2021 07:52:06 +0300
Message-ID: <20210727045222.905056-20-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215407_630116_36807BC4 
X-CRM114-Status: GOOD (  13.58  )
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

Get rid of flash_info flags that indicate settings which can be
discovered when parsing SFDP. It will be clearer who sets what,
and we'll restrict the flash settings that a developer can choose to
only settings that are not SFDP discoverable.

SNOR_F_IO_MODE_EN_VOLATILE is discoverable when parsing the optional
SCCR Map SFDP table. Flashes that do not define this table should set
the flag in the late_init() call. Flashes that define the SFDP optional
table but get the value wrong, should fix it in a post_sfdp fixup hook.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c      |  3 ---
 drivers/mtd/spi-nor/core.h      |  9 ++-------
 drivers/mtd/spi-nor/micron-st.c | 11 ++++++++---
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 240d5c31af88..9885d434ea83 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3204,9 +3204,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	if (info->flags & SPI_NOR_IO_MODE_EN_VOLATILE)
-		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
-
 	ret = spi_nor_set_addr_width(nor);
 	if (ret)
 		return ret;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index dfdc51a26cad..987797a789c8 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -367,17 +367,12 @@ struct flash_info {
 					 */
 #define SPI_NOR_OCTAL_DTR_READ	BIT(18) /* Flash supports octal DTR Read. */
 #define SPI_NOR_OCTAL_DTR_PP	BIT(19) /* Flash supports Octal DTR Page Program */
-#define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(20) /*
-						 * Flash enables the best
-						 * available I/O mode via a
-						 * volatile bit.
-						 */
-#define SPI_NOR_SWP_IS_VOLATILE	BIT(21)	/*
+#define SPI_NOR_SWP_IS_VOLATILE	BIT(20)	/*
 					 * Flash has volatile software write
 					 * protection bits. Usually these will
 					 * power-up in a write-protected state.
 					 */
-#define SPI_NOR_PARSE_SFDP	BIT(22) /*
+#define SPI_NOR_PARSE_SFDP	BIT(21) /*
 					 * Flash initialized based on the SFDP
 					 * tables.
 					 */
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 72cc4673bf88..31ebd4c9b431 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -118,13 +118,18 @@ static struct spi_nor_fixups mt35xu512aba_fixups = {
 	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
 };
 
+static void mt35xu512aba_late_init(struct spi_nor *nor)
+{
+	nor->flags |= SNOR_F_4B_OPCODES;
+	nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+}
+
 static const struct flash_info micron_parts[] = {
 	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
 			       SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
-			       SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
-			       SPI_NOR_IO_MODE_EN_VOLATILE)
+			       SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
 	  .fixups = &mt35xu512aba_fixups,
-	  .late_init = snor_f_4b_opcodes, },
+	  .late_init = mt35xu512aba_late_init, },
 	{ "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
 			    SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ)
 	  .late_init = snor_f_4b_opcodes, },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
