Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC9AC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 10:00:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A38B420897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 10:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1GXtYKDx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="e5a4zKoG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A38B420897
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nKMRHRzdsEScfbdfnriVEQ2fkWJfBDd14wveSHP5gA8=; b=1GXtYKDx8akKWcEoqGd8XgOKo
	fX22GxN+64B3VJ3fuPu34uXCuL8wsHpipHOlLC0feo/nYEbusQgRL8s+DsVhrJpuWHBDw/w4P4BRE
	SHwYwqn+Q5jGVhAHG3g2KX6k866Q1yYf5tC2EX2NMJoMjrowhYZRMAYoO/55cegjcJpRhWTY2xv/U
	xSqyvOrnia1M6tA9m1QGKvRoAfSXstq+doqPOW7sLNvs7OgT4P5ykThl1+yvk7xw4BeThBAxEOpP3
	5G5MWNUhHVct3uiZHeCQ1Lv/5Xff84APdet3zu+kqzyf4KoVbbGGK5G2WTfR0mNBB/x31IEOlfyZf
	c6O/kRL6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNCQY-0003zM-6n; Tue, 29 Sep 2020 10:00:06 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNCQR-0003x7-9T
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 10:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601373599; x=1632909599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zj5Q3mRato2NGNAAfnW3tQlSDG2rqHg7C0p4y7YGyBg=;
 b=e5a4zKoGGBNw8Z8H/MrI/SvQPTHDwp5mx1hHDZV/SRLvHap9H8S73dSN
 ky+6MZQnzdDZOYCYlnwdBgcc/81+vm1WHUm/jYQkHI67UXHZCmtCKrQvX
 LfLjRSb9eIEcs/qB9pFl/uLD9xzSblJWwxzeImFfgF3Hd5EfY4cSuNoWH
 lpctfOczL/iHdrBa/5q8sBiypUDrA1lD4auCLDEoo3QogEBErk17jlJOC
 Aq14xTg+sbti4OJFj0YMPpsKJEdP4DT2Kjxtv1yY/WrE+R7dvuJFlx6k6
 1I2QjhXOUxhNuGs0s2EvTFvnxfxYjuWw7ZPzZTT4DezXxfck8DqB8wRHM w==;
IronPort-SDR: AHRt/oWDvV0oJ9fGM6xCZt8rUT7PclAsmwXI+CUUQJeA+SeVgzM32U2DMz8H/kaX8K7C3yZleT
 TDoaTiEahnkoqEfxxOl7/spXgFlAJrTYBfhzWzTZZWCRe7Lmzirf0ArrI2Ig5AiLxeKHE8+UFk
 l0tVJCGvydbBMe88wsipF0aucjkEQ9NnDavrv4NMYDBQuwjn7FIShjNwtXL8dEM7PH+h+mAxWz
 zzzVejZr3ZPCHObbVRXVeKsFNJMLaBqecBz8FgqMNSfW6eixfXOkExypAa18m7UJk7+fEm8tzm
 Tok=
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="93570882"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Sep 2020 02:59:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 02:59:47 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 29 Sep 2020 02:59:45 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <vigneshr@ti.com>, <boris.brezillon@collabora.com>
Subject: [RFC PATCH 1/3] mtd: spi-nor: Introduce SNOR_F_IO_MODE_EN_VOLATILE
Date: Tue, 29 Sep 2020 12:59:49 +0300
Message-ID: <20200929095951.1575658-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929095951.1575658-1-tudor.ambarus@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200929095951.1575658-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_055959_485678_EA9ABB34 
X-CRM114-Status: GOOD (  13.54  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We don't want to enter a stateful mode, where a X-X-X I/O mode
is entered by setting a non-volatile bit, because in case of a
reset or a crash, once in the non-volatile mode, we may not be able
to recover in bootloaders and we may break the SPI NOR boot.

Forbid by default the I/O modes that are set via a non-volatile bit.

SPI_NOR_IO_MODE_EN_VOLATILE should be set just for the flashes that
don't define the optional SFDP SCCR Map, so that we don't pollute the
flash info flags.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 6 ++++++
 drivers/mtd/spi-nor/core.h | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 34edfcf33172..c149b318e2e8 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3089,6 +3089,9 @@ static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 	      nor->write_proto == SNOR_PROTO_8_8_8_DTR))
 		return 0;
 
+	if (!(nor->flags & SNOR_F_IO_MODE_EN_VOLATILE))
+		return 0;
+
 	ret = nor->params->octal_dtr_enable(nor, enable);
 	if (ret)
 		return ret;
@@ -3474,6 +3477,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & SPI_NOR_4B_OPCODES)
 		nor->flags |= SNOR_F_4B_OPCODES;
 
+	if (info->flags & SPI_NOR_IO_MODE_EN_VOLATILE)
+		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+
 	ret = spi_nor_set_addr_width(nor);
 	if (ret)
 		return ret;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 10dc03506f93..c2755c82f978 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -27,6 +27,7 @@ enum spi_nor_option_flags {
 	SNOR_F_HAS_4BIT_BP      = BIT(12),
 	SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
 	SNOR_F_SOFT_RESET	= BIT(14),
+	SNOR_F_IO_MODE_EN_VOLATILE = BIT(15),
 };
 
 struct spi_nor_read_command {
@@ -323,6 +324,11 @@ struct flash_info {
 					 */
 #define SPI_NOR_OCTAL_DTR_READ	BIT(19) /* Flash supports octal DTR Read. */
 #define SPI_NOR_OCTAL_DTR_PP	BIT(20) /* Flash supports Octal DTR Page Program */
+#define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(21) /*
+						 * Flash enables the best
+						 * available I/O mode via a
+						 * volatile bit.
+						 */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
