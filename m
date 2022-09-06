Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC3BC38145
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Sep 2022 06:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGRgAxPHZ/LGXpcKGNOXQWDfr/uvulD4s9gjxPzrjaQ=; b=O4VGrjH32HaW8R
	bLpMhoH3iDyHdiNUNgZY/XdpnpMVakYl1aMz54WQxR0M4nUAfit743IsCbDMJj1AY1xkoK9PBNrfR
	k3ArfgRTWXfoOfggO/lxVt1ayVdV/MnFnkhqvVMeRvthnVNZNQCXEN0bbyD3pjxIir04k2Ce1XcuQ
	2+2sSCLMqxIvTPmNueiaHbi38r/u4zQRI49z59omcOqsNX6DU1Q6dn5WtFCLUh5qsOKs5/IMw57Hz
	erwNvL95HfwGWpo9fywQk8pgWWiI9Za0vTEvqCCXJb1Mw4UeIxPleqi/mhG0bzJkB66SiaE8voZrr
	clcrLLiQiIv7P5uZ/fcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVRgB-00ADl2-Mp; Tue, 06 Sep 2022 06:03:23 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVRer-00ACXs-Ii; Tue, 06 Sep 2022 06:02:05 +0000
Received: from droid11-sz.amlogic.com (10.28.8.21) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2507.6; Tue, 6 Sep 2022
 14:01:59 +0800
From: Liang Yang <liang.yang@amlogic.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
CC: Liang Yang <liang.yang@amlogic.com>, kernel test robot <lkp@intel.com>,
	Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
	XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
	<kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH RESEND v8 5/5] mtd: rawnand: meson: not support legacy clock
Date: Tue, 6 Sep 2022 14:00:33 +0800
Message-ID: <20220906060034.2528-6-liang.yang@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906060034.2528-1-liang.yang@amlogic.com>
References: <20220906060034.2528-1-liang.yang@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.21]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_230202_210376_687119AE 
X-CRM114-Status: UNSURE (   8.94  )
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

meson NFC driver use common clock interfaces. so the test robot report
some errors once using the legacy clock with HAVE_LEGACY_CLK on.

Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Liang Yang <liang.yang@amlogic.com>
---
 drivers/mtd/nand/raw/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 67b7cb67c030..c309cfeb74cd 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -395,7 +395,7 @@ config MTD_NAND_STM32_FMC2
 
 config MTD_NAND_MESON
 	tristate "Support for NAND controller on Amlogic's Meson SoCs"
-	depends on ARCH_MESON || COMPILE_TEST
+	depends on COMMON_CLK && (ARCH_MESON || COMPILE_TEST)
 	select MFD_SYSCON
 	help
 	  Enables support for NAND controller on Amlogic's Meson SoCs.
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
