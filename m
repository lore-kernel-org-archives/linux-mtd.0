Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C63C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 05:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7eROW9f8oPw/us6PtGIWIYmd46crZL5WKsTJq+eAi0o=; b=NQZr3LG7SZWFOh
	kBM5oN4JQBinkIFzXpQ8JS7zQTMbTOoSQij+dft0IAB6LNWUWoqT7E8/WjZYDp6waMh4LlsS5yrC5
	Uua9XrXH/1ZIlLfxxvBZnk7oQbRNwFhR2jEZYn5akelQBUo7ApqSrydaMoiHqAfXImNo9minQWOZ0
	vQu6C51pyeiMs/PfhTGHTgalXpHxp7TSdQkygGG9rmbxIbZNqFvgtb9zWL3qqIoKI4avsswG2nXzm
	OwjtEKmTiq/nUZZTgN4TxLWdfHi0FYTndnGhAIlnLr1rVLP34lTU078b41jDUesZHMYz7LhuKbD4z
	KTRRhIBMrQZf6UImg33g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0xu2-005LjR-0C;
	Thu, 09 Nov 2023 05:48:30 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0xtx-005Lh5-37;
	Thu, 09 Nov 2023 05:48:27 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id ED72A120003;
	Thu,  9 Nov 2023 08:48:20 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru ED72A120003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1699508900;
	bh=5rYapgUuoUjueaXWYdCg80Ulw/PU7Z+q891poKDNqF4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=MEKYwafdGzQ7CrnCJkKmd6uLNx5WehxZyW1BZ7QDSC/alTuJuIo0cvBZwif6lBnK/
	 N4StOHxNgkG130WLpxd/8F2ZhVXpmJOtoT8m2mO8YWIguY5goGNqN57GxJ04Iw0Y0t
	 XO2F9eNZ91xuxPj0BKAWYNZNkww3lishswGtShZoPMW/sgK5UKoJDd+kqicfaM1buh
	 wV+GkRuda9m4TRdOfXOiy/FwCJpNBiklvr9aRRX3v/WioTGDduLM4FyiRgOzYi2i6e
	 lYetlSzsul7RhJizkqEsTIlWOAajRTjwy58cAg+rtnDK6Pmd5tjpzmoYEsKTsOhFVn
	 wMebJmOcgXb8g==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  9 Nov 2023 08:48:20 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Thu, 9 Nov 2023 08:48:20 +0300
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<avkrasnov@salutedevices.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1] mtd: rawnand: meson: initialize clock register
Date: Thu, 9 Nov 2023 08:40:37 +0300
Message-ID: <20231109054037.3864802-1-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181223 [Nov 09 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/09 02:48:00 #22434346
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_214826_349943_792837D5 
X-CRM114-Status: GOOD (  13.26  )
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

Clock register must be also initialized during controller probing. If
this is not performed (for example by bootloader before) - controller
will not work.

Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 0d4d358152d7..4e7fa943928c 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -91,6 +91,8 @@
 
 /* eMMC clock register, misc control */
 #define CLK_SELECT_NAND		BIT(31)
+#define CLK_ALWAYS_ON_NAND      BIT(24)
+#define CLK_ENABLE_VALUE        0x245
 
 #define NFC_CLK_CYCLE		6
 
@@ -1152,7 +1154,7 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
 		return PTR_ERR(nfc->nand_clk);
 
 	/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
-	writel(CLK_SELECT_NAND | readl(nfc->reg_clk),
+	writel(CLK_ALWAYS_ON_NAND | CLK_SELECT_NAND | CLK_ENABLE_VALUE,
 	       nfc->reg_clk);
 
 	ret = clk_prepare_enable(nfc->core_clk);
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
