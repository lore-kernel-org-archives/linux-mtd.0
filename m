Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED343C2BB3F
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Nov 2023 06:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WijaSRhWCSBpcndLEWx+PX8dkvN6V/IsaePmXhoxQfE=; b=WVGElbhrd6bvD2
	QHJFGQiCZe2l8g+pgEjGx9ZoCFcJy25JsoA9VLBV1nD7csNj1EDRJqGTc1MaEVgoGQP+fpE3lawZE
	gx4wRZDpeqMxg0s5Bo4iZscerXZxYQMSFek50PqeJ4N3OKdDc/kFoK2NvNnrCj8CvwRqQNSwBDAoU
	QVxu1JyDM5U70oO7FUJA8FtlBWWFO+HzcHgXsn2Ydj+ajGzUmOcs+nzQZUa4+XHd3ZpFHGtorrYKn
	S5g4VjetJKiYx8faDJ7d2GUf/ZBBA6wco6a3+iIDfn8rxZBtqVFEi8mS+cRHB/XFAfCiYCldh53lX
	3tGVq/vPrbNhuRsjElPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4y7w-00BHvU-1I;
	Mon, 20 Nov 2023 06:51:24 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4y7r-00BHrR-0n;
	Mon, 20 Nov 2023 06:51:21 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 950EB120008;
	Mon, 20 Nov 2023 09:51:09 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 950EB120008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1700463069;
	bh=B6ucUtqGiv7WOMEwFOuXqqa304GRlC4LfQOAAP6ieWE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Zb1IchOTiGs+zlJC6NxVU2HZXTJ4LPCklO3kKPj7NU6jlElQsUWpfKcwCNaEcBm6t
	 1H5QgqHcYZCfVccRmy1qokSfLhSTq3NZfNfoeeREZ9jXujj2CHUV402nNKfm1FiPhk
	 rIdNA40qfRE15Vpz23jfUQuK6pWh+SibJINxVKaCc9zEZxjxgRiPBnx09BXbj/wI6f
	 mQd7ulO3r1WzemWDHjIDiuJptiwNwanTDR+pVQbuK9A6DrujqcsfJmp9wrg5XkfNB3
	 MozWFCHwmlJ7t5wXoSFv5vDqk9WstdMcaJ9RKLvnr3lc8fhQtcNU+BNVyqMMBYD55p
	 eGxDQerTEkf7A==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 20 Nov 2023 09:51:09 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 20 Nov 2023 09:51:09 +0300
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<avkrasnov@salutedevices.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] mtd: rawnand: meson: initialize clock register
Date: Mon, 20 Nov 2023 09:42:39 +0300
Message-ID: <20231120064239.3304108-1-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181466 [Nov 20 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/20 04:33:00 #22484770
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_225119_647515_CB37AE95 
X-CRM114-Status: GOOD (  12.44  )
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
 Changelog:
 v1 -> v2:
  * Change 'CLK_ENABLE_VALUE' -> 'CLK_SELECT_FIX_PLL2': '0x245' -> 'BIT(6)'
    according doc.

 drivers/mtd/nand/raw/meson_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 0d4d358152d7..f8bb40e486e4 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -91,6 +91,8 @@
 
 /* eMMC clock register, misc control */
 #define CLK_SELECT_NAND		BIT(31)
+#define CLK_ALWAYS_ON_NAND	BIT(24)
+#define CLK_SELECT_FIX_PLL2	BIT(6)
 
 #define NFC_CLK_CYCLE		6
 
@@ -1152,7 +1154,7 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
 		return PTR_ERR(nfc->nand_clk);
 
 	/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
-	writel(CLK_SELECT_NAND | readl(nfc->reg_clk),
+	writel(CLK_ALWAYS_ON_NAND | CLK_SELECT_NAND | CLK_SELECT_FIX_PLL2,
 	       nfc->reg_clk);
 
 	ret = clk_prepare_enable(nfc->core_clk);
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
