Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBC3C001E0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 09:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lLZEoabBFxwNHW+xAez5h18tsJvm4tvny91XIOT6tRc=; b=DQGUE4rZvgBw9h
	w/daaNMtyTY2qnFC7EPRaEIzwLAtPELLZKr05rDebvbeIHWqIei9UzLHD8qUiGCuPA+mgQVinebaW
	b3l4Rv8a7mV81iseD9VGt70SDCUAuiERrQ4H+bE6AdI2elJmOed00e4turkKbwow8QSGdQAO+tjz+
	BBAsO4hT7/VAl4Fg9pKJI+oa6gSY4I8ioBSPlg+5wLAYiccZMcVAwynmVI2g2ZOpGt4TjACQ6UK+O
	Rtjw8KmW3jY9tJbsi8RfMSAf8VL+OOS3QTY4mZzRL2F4tsePJEVLMxotmg8WTqpzSh2412lV9v+Db
	w7G2XtXtuXrlv5gNNFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPK18-002fM7-0X;
	Fri, 28 Jul 2023 09:44:14 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPK13-002fJa-0S;
	Fri, 28 Jul 2023 09:44:11 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4F07710000A;
	Fri, 28 Jul 2023 12:43:59 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4F07710000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1690537439;
	bh=mmWbMSYEkF9c1GueptbbjSnMca6xFSgsbHmgMNQrKo0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=QUEv9IF58Zlk1wiA+EuPLQL6++PwN2EtVvBEVPNKvQtwi0s+x8grWRio9R5q6CiAp
	 FFciygYvsKJ6wJTNhkPSSapiFfwDZRwI4VpBFgictyBZgJbFMKghxUQhs4+DFT7K/8
	 SbdecHgZKDp+n75uq1R2cIMUXLSxN5+JuwJ/v1JY0I/ESegspbabqVc3u1TKLqwPje
	 jLbIRKPgL0fgPV4gUzd260rUnqmc3V3vnyIRJ4zjmZLUHvX/zWci29bmpnDs2MIXgc
	 PSJrhdtNng7udT+JdoXL3NNnCUn83C4HG/I0J+D4IPFyx9d/JVdticUDvlNEG0mRdQ
	 E8egdGyJbEAxQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 28 Jul 2023 12:43:59 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 28 Jul 2023 12:43:35 +0300
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, kernel test robot <lkp@intel.com>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] mtd: rawnand: meson: fix build error
Date: Fri, 28 Jul 2023 12:38:10 +0300
Message-ID: <20230728093810.2985324-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178796 [Jul 22 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 525 525 723604743bfbdb7e16728748c3fa45e9eba05f7d, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/23 10:45:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/23 10:46:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/23 08:49:00 #21663637
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_024409_894278_855F8D53 
X-CRM114-Status: GOOD (  13.33  )
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

Fixes the following build error:

drivers/mtd/nand/raw/meson_nand.c:244:59: error: initializer element is not a compile-time constant
static const struct nand_ecc_step_info axg_stepinfo[] = { axg_stepinfo_1024, axg_stepinfo_512 };
                                                          ^~~~~~~~~~~~~~~~~

Fixes: 0e1db39336d8 ("mtd: rawnand: meson: support for 512B ECC step size")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307281007.MMuVjmJ9-lkp@intel.com/
Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index ff673a9d52af..561d46d860b7 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -229,20 +229,20 @@ NAND_ECC_CAPS_SINGLE(meson_gxl_ecc_caps,
 		     meson_nand_calc_ecc_bytes, 1024, 8, 24, 30, 40, 50, 60);
 
 static const int axg_stepinfo_strengths[] = { 8 };
-static const struct nand_ecc_step_info axg_stepinfo_1024 = {
-	.stepsize = 1024,
-	.strengths = axg_stepinfo_strengths,
-	.nstrengths = ARRAY_SIZE(axg_stepinfo_strengths)
-};
 
-static const struct nand_ecc_step_info axg_stepinfo_512 = {
-	.stepsize = 512,
-	.strengths = axg_stepinfo_strengths,
-	.nstrengths = ARRAY_SIZE(axg_stepinfo_strengths)
+static const struct nand_ecc_step_info axg_stepinfo[] = {
+	{
+		.stepsize = 1024,
+		.strengths = axg_stepinfo_strengths,
+		.nstrengths = ARRAY_SIZE(axg_stepinfo_strengths)
+	},
+	{
+		.stepsize = 512,
+		.strengths = axg_stepinfo_strengths,
+		.nstrengths = ARRAY_SIZE(axg_stepinfo_strengths)
+	},
 };
 
-static const struct nand_ecc_step_info axg_stepinfo[] = { axg_stepinfo_1024, axg_stepinfo_512 };
-
 static const struct nand_ecc_caps meson_axg_ecc_caps = {
 	.stepinfos = axg_stepinfo,
 	.nstepinfos = ARRAY_SIZE(axg_stepinfo),
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
