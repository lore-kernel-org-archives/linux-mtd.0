Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A392C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 13:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EN/g9RnMhcxZ1CcUjj3GZN/q0seELw3hkg0uTx9yHkg=; b=fSfKLI1ANT43MS
	8J0/SszJdRppb+QWNSTOt/ErT4IKUGc6iLG8Cy8q3Up33EBzgoyavb247qmximvpDTFhWlUWFP9Pj
	pUJD3sIfpcLZz+xQSWdSNcuNGOGjECnxns6fKJNe2dPM3PKzMJNsMvXCfdkC7zK926bM1PzBSKb4R
	0Og0hu3vp4bu1SajOmyCt87Djehx8To8lry5V8jEfBimCtQ4ElqBIHlfyfZhjxHAr1LN+Kf2A5ijV
	jyK44gUya2XaCRqk2U+QQMZtt+Ug2yexE5bV8kWZ8g/zluSclX156N5S6bjSYWCj0xZALdRnx38kH
	YsePhgD1mIFMgL/JXFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8IE-005m0J-Q3; Mon, 21 Feb 2022 12:59:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7Ug-005Y4X-2W
 for linux-mtd@bombadil.infradead.org; Mon, 21 Feb 2022 12:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=BUHjRq3B/3JjsHlcHc+UiOV+3YaaqpA1vvTF3QO9238=; b=B59XM1iJgDqS++LSd4dT89UU+B
 XBt7BDuyJjsov5zvaQhEJLXrt5jdf1LpxXDmej3kwiwnIodKtErezCNW+L4wFzzIzGBR3yBLn9zFo
 w5VjMyPyYrlI6jmuAYiHeQ1TVS0yVsu36ZtYHl/RIZsT0yMU46HNbfZ/yGRcKiWNH2BoadFtPrark
 z8m691LxSCWyg78YjnhUFvHfWS866g64zBx9O8TUq837lv0D6dY+FJrgGIUsM3noflJlV8k1PgRaa
 xwgmBmd8Ptmg9Lxq5bv66sn1pXTEVQTiaBST8QVrJb81v4p98lTuZqnsKtQy1IGtLtPPVwEumzOXl
 tzg6lE9g==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7Ua-00BdB0-6k
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 12:08:40 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C7CF42244F;
 Mon, 21 Feb 2022 13:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645445312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUHjRq3B/3JjsHlcHc+UiOV+3YaaqpA1vvTF3QO9238=;
 b=doGpxk+b7xf6u2c6+9lQDIXwDrIq7JeBZE9K+Da7uW7Urd+Nd0Yw3u7OJPneSWE0LCVbgt
 WE81ROjoQcx10W5NYaXhxO9e6YBXXZH2bxSPJ39FFcT5MaHe4W0tQKPJWXrmdSVa14YcLy
 6MzXgWmBkCWZSeRNVbeAZCv+jj0XBc4=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v4 32/32] mtd: spi-nor: renumber flags
Date: Mon, 21 Feb 2022 13:08:09 +0100
Message-Id: <20220221120809.1531502-33-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221120809.1531502-1-michael@walle.cc>
References: <20220221120809.1531502-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_120836_508707_8878C02B 
X-CRM114-Status: UNSURE (   8.73  )
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

As we have deleted some flag, lets renumber them so there are no holes.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 2130a96e2044..b7fd760e3b47 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -12,20 +12,20 @@
 #define SPI_NOR_MAX_ID_LEN	6
 
 enum spi_nor_option_flags {
-	SNOR_F_HAS_SR_TB	= BIT(1),
-	SNOR_F_NO_OP_CHIP_ERASE	= BIT(2),
-	SNOR_F_BROKEN_RESET	= BIT(5),
-	SNOR_F_4B_OPCODES	= BIT(6),
-	SNOR_F_HAS_4BAIT	= BIT(7),
-	SNOR_F_HAS_LOCK		= BIT(8),
-	SNOR_F_HAS_16BIT_SR	= BIT(9),
-	SNOR_F_NO_READ_CR	= BIT(10),
-	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
-	SNOR_F_HAS_4BIT_BP      = BIT(12),
-	SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
-	SNOR_F_IO_MODE_EN_VOLATILE = BIT(14),
-	SNOR_F_SOFT_RESET	= BIT(15),
-	SNOR_F_SWP_IS_VOLATILE	= BIT(16),
+	SNOR_F_HAS_SR_TB	= BIT(0),
+	SNOR_F_NO_OP_CHIP_ERASE	= BIT(1),
+	SNOR_F_BROKEN_RESET	= BIT(2),
+	SNOR_F_4B_OPCODES	= BIT(3),
+	SNOR_F_HAS_4BAIT	= BIT(4),
+	SNOR_F_HAS_LOCK		= BIT(5),
+	SNOR_F_HAS_16BIT_SR	= BIT(6),
+	SNOR_F_NO_READ_CR	= BIT(7),
+	SNOR_F_HAS_SR_TB_BIT6	= BIT(8),
+	SNOR_F_HAS_4BIT_BP      = BIT(9),
+	SNOR_F_HAS_SR_BP3_BIT6  = BIT(10),
+	SNOR_F_IO_MODE_EN_VOLATILE = BIT(11),
+	SNOR_F_SOFT_RESET	= BIT(12),
+	SNOR_F_SWP_IS_VOLATILE	= BIT(13),
 };
 
 struct spi_nor_read_command {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
