Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28499E7718F
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Dec 2024 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltFez7oxlIBIRdvJ1WhRdgBfGwdNoGQf8l1JeEB2CAE=; b=doTWiqv4FxosAe
	gGw03/8lNUNOwl/8CZBYUJqPB70vOiuD8WQbezty9stcf8NZ2AHuKEXF1TC+3tLfd3EaSx+K9UchS
	ewiRcXCZzGd0A/ilkYWGB+iAEREEesrfB/Jzx3MZotM2Vh/DbmMYNyrdi78T2Yu6BNktnO2NvsALn
	MB/Kobz69/GitKLpYGa6a2818FyKa3QjJ6wGUOSednPbPvSV3G70PCUMlxuYEGnSU2u/eXZhxedEH
	B1Dqg/SJ5IF4tulwZB5AQogFUb660cBD2B1MnKf0ervEw54ZCq+vth0qFTsGgb8VAaptKF5DfHdA4
	GWVU/sOs9lumjfoQLrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQoN0-0000000Frad-1boQ;
	Thu, 26 Dec 2024 13:57:46 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQoM2-0000000FrNH-3ZVk
	for linux-mtd@lists.infradead.org;
	Thu, 26 Dec 2024 13:56:49 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 27ADF100009;
	Thu, 26 Dec 2024 16:56:37 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 27ADF100009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1735221397;
	bh=Nu38CUOAfNVgdmBMZ6cigO1QOgYOx2qWaYB6HSqY2G4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=s2cW43T4LSCWcZkCG/SFSI7pmTvayT2mtWSTmc1fWD9o8SoKdg8D5p1Wt0gUteawX
	 Pu4gdZGZUP8Z20yBAW8zqduBDMCRoma8Lne8jXYz38siR/cLM0j+RCLI5iXp9zPu0S
	 F2MFF4R39QU03P9Ze2wB0xLlujag1GN9vvJ1bK+297Q1tWFbIZ1Nl+Tl4qHeJXjuPc
	 a4U5469lS1KNREv9lQqa66mWE3CkP4RNY2lHAw0KW/d1qFp8/grp6dN6khwt/16jOB
	 LNWJDDYm+L7mHkTzY4bZN04b/IfW2FjoWLell4tIlTr7P0qAdejMkbH+/aR5IMHtyL
	 Iw17bYAkYal7Q==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 26 Dec 2024 16:56:36 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Alexey Romanov
	<avromanov@salutedevices.com>, Frieder Schrempf <frieder.schrempf@kontron.de>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v3 4/7] mtd: spinand: add start_page to otp layout
Date: Thu, 26 Dec 2024 16:55:49 +0300
Message-ID: <20241226135623.43098-5-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241226135623.43098-1-mmkurbanov@salutedevices.com>
References: <20241226135623.43098-1-mmkurbanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [172.28.224.140]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190075 [Dec 26 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/12/26 12:50:00 #26919000
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_055647_661513_46DF62C0 
X-CRM114-Status: GOOD (  14.27  )
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

The OTP area is divided into two parts: the factory and the user.
In SPI-NAND, it is usually this one OTP region: the first few pages are
allocated to the factory area. Therefore, enter the start_page field,
which indicates from which page the custom OTP region starts.

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
---
 include/linux/mtd/spinand.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 19d76057c0444..d6dbb85094283 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -325,9 +325,11 @@ struct spinand_ondie_ecc_conf {
 /**
  * struct spinand_otp_layout - structure to describe the SPI NAND OTP area
  * @npages: number of pages in the OTP
+ * @start_page: start page of the user OTP area.
  */
 struct spinand_otp_layout {
 	unsigned int npages;
+	unsigned int start_page;
 };
 
 /**
@@ -417,10 +419,11 @@ struct spinand_info {
 #define SPINAND_SELECT_TARGET(__func)					\
 	.select_target = __func,
 
-#define SPINAND_OTP_INFO(__npages, __ops)				\
+#define SPINAND_OTP_INFO(__npages, __start_page, __ops)			\
 	.otp = {							\
 		.layout = {						\
 			.npages = __npages,				\
+			.start_page = __start_page,			\
 		},							\
 		.ops = __ops,						\
 	}
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
