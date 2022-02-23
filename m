Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7F8C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 14:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EN/g9RnMhcxZ1CcUjj3GZN/q0seELw3hkg0uTx9yHkg=; b=GYm3SBchMqMLNa
	tjKzsNi1GWN4XIbWZ559OOOdD4pmahNSuMz/YQz7y+8BNE/p1uKGN4BNF8sh15TNnvkpI/42Dv8iH
	MzT4XHC9D671t5IYU2VLnFrI8fPvJrQwXK8aM6Xff7wZjqujAbMUpEikFP+bxBc0kkM7zsbr7c65V
	eAPKPKA47DEMdDWxQqGkbTiyLO8OA+Cq42sI3Ry0GMrHPoykM3nB7TFw08JXVM5mJYo+N+lUVU41Z
	w1CIvMWpRFMPPsPTousLmfbm3fjHAzBWCFfA+QQw50afruFvAOKUuEsz9OXTzaM7+8bWUJ0ZothBk
	BKn+eXA5V5SNK6iu+N9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMsbm-00EjjF-Jh; Wed, 23 Feb 2022 14:27:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwR-00EZbr-0e
 for linux-mtd@bombadil.infradead.org; Wed, 23 Feb 2022 13:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=BUHjRq3B/3JjsHlcHc+UiOV+3YaaqpA1vvTF3QO9238=; b=DERVhLdyQZmFRqxE2kXexOPyCX
 vhCOe9fNJ6rkiYfEsy18JiEsuzoYaiJJfX3RVzDk1dGBdL26pXwVStMa49rQS9zeBMM77tBHIEcTn
 VQL5gDcS/Xq4DI4lDKZMnMrU4o6DKEYqhHxVylKHFx9Wt5etB/M6wpDV4OgbskaWSnIvU9ZP9LtdS
 QdbDphpiAKhIpH8w3h6nn41qcLuTMqEVNg+HNjbKR3LutJJR1W3JIupONKwRbygIYkAn9aCrMbqx8
 5RiEd/iymuURs5+4Xs2ZL4YoKqR3clu1Hec7ApmtfxjLZhHDSUBlVG6tu5GnKwuGFBAcZtMPbvhtQ
 bBWdX6Ww==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwL-00CH7U-79
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 13:44:25 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1E3AB2244F;
 Wed, 23 Feb 2022 14:44:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645623858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUHjRq3B/3JjsHlcHc+UiOV+3YaaqpA1vvTF3QO9238=;
 b=bXuicVX0rflHWdGKwarIkjI7YKGuzPnD7dB6J08XHkeAXhjmkejR/EMsHRv2PfYOpFgVOv
 QKjD7eC+ZgjKthxFJSPJffNH3w2987D47kO9HQBHC3skrTUbh70b9U5rGSaM/AGNIdxz6b
 XhdkQTqJnir0q3XeGYCgB1IgZEf/+uU=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 32/32] mtd: spi-nor: renumber flags
Date: Wed, 23 Feb 2022 14:43:58 +0100
Message-Id: <20220223134358.1914798-33-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223134358.1914798-1-michael@walle.cc>
References: <20220223134358.1914798-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_134421_932550_F6FA6CF7 
X-CRM114-Status: UNSURE (   8.57  )
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
