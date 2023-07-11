Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1604C0015E
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jul 2023 12:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bw9v8nGx3D16xLrt2cZ9a4pRmd6TQhmKgGzoXBy18qE=; b=TPBdu6RqC+AjoD
	wAVj26g+PGDd8NGnfmyokaqf57z65eWJMjEb99W6IlPfpSACDZ56Ds0nrZmP4/rJVpKgnaz9VjS7G
	MkAEyMFpV1xe1bRfudSCEas2f7a2EOKI2sg+VSFo1Pwk1YbtFLhGDTFZNUiQ6xKwv8UAIyyDq+ivS
	0IiJSTyFrFCzTduwSNZp1uT5hmMFFpllDrHKOBjD8KVUGqJ7vvE2klDn/A5jCOZ0b+HYrlLNcKnWs
	2vUE04U8BShAXL2WDFXXk0G9X8n6VtBiWz4gWXobac6fI+PFZ+p2kUFDz34BChCfKmevEDfPpaAXi
	LGz6TuTpwB8Fib/TZ0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJCSj-00Erjn-2g;
	Tue, 11 Jul 2023 12:27:25 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJCSY-00Erek-1W;
	Tue, 11 Jul 2023 12:27:17 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 3D4C9100008;
	Tue, 11 Jul 2023 15:27:11 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 3D4C9100008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689078431;
	bh=Em0Nwj2RjzE3YgcQQ2O+XnCh35XtEE94lU9MJvN+QNE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=GAYjgXpvNQyrBZw2emWEI2gvhlNMWWmJwCNT3hzy0OZTC8qV4cijs+vj0q3YaLF7O
	 iVaK9lwKqVn6buRIoarxmnyyFzxzXvr6rEfQGzjxqo3LnWbYjY66jj2mTZQSmbxmKi
	 epuBVjxqWF34wiJ9yFMAf6v36KYf/aQB3gBAmkxs39I4MXWg4Q0XPnnmVlh9KD/tXQ
	 j4i2fu4Ic9UYAOB6qkgsIYAyg0LUMvX4hY+nhSLGnEUuDX2y029UAt58o4GtjEsYf5
	 UUze35yp4kyp0eUcr2AwMfw+J6nH8aRcUX3q0RCriKWS5qO7qUkgGu7NUoGbeA/t7/
	 /P1tkXpkaFnkQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 11 Jul 2023 15:27:11 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 11 Jul 2023 15:27:02 +0300
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v3 3/3] mtd: rawnand: meson: support for 512B ECC step size
Date: Tue, 11 Jul 2023 15:21:29 +0300
Message-ID: <20230711122129.2635558-4-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230711122129.2635558-1-AVKrasnov@sberdevices.ru>
References: <20230711122129.2635558-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178541 [Jul 11 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 521 521 0c3391dd6036774f2e1052158c81e48587b96e95, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/11 10:54:00 #21597245
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_052714_892504_B835A73E 
X-CRM114-Status: GOOD (  15.84  )
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

Meson NAND supports both 512B and 1024B ECC step size.

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 45 +++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 345212e8c691..369e81356240 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -135,6 +135,7 @@ struct meson_nfc_nand_chip {
 struct meson_nand_ecc {
 	u32 bch;
 	u32 strength;
+	u32 size;
 };
 
 struct meson_nfc_data {
@@ -190,7 +191,8 @@ struct meson_nfc {
 };
 
 enum {
-	NFC_ECC_BCH8_1K		= 2,
+	NFC_ECC_BCH8_512	= 1,
+	NFC_ECC_BCH8_1K,
 	NFC_ECC_BCH24_1K,
 	NFC_ECC_BCH30_1K,
 	NFC_ECC_BCH40_1K,
@@ -198,15 +200,16 @@ enum {
 	NFC_ECC_BCH60_1K,
 };
 
-#define MESON_ECC_DATA(b, s)	{ .bch = (b),	.strength = (s)}
+#define MESON_ECC_DATA(b, s, sz)	{ .bch = (b), .strength = (s), .size = (sz) }
 
 static struct meson_nand_ecc meson_ecc[] = {
-	MESON_ECC_DATA(NFC_ECC_BCH8_1K, 8),
-	MESON_ECC_DATA(NFC_ECC_BCH24_1K, 24),
-	MESON_ECC_DATA(NFC_ECC_BCH30_1K, 30),
-	MESON_ECC_DATA(NFC_ECC_BCH40_1K, 40),
-	MESON_ECC_DATA(NFC_ECC_BCH50_1K, 50),
-	MESON_ECC_DATA(NFC_ECC_BCH60_1K, 60),
+	MESON_ECC_DATA(NFC_ECC_BCH8_512, 8,  512),
+	MESON_ECC_DATA(NFC_ECC_BCH8_1K,  8,  1024),
+	MESON_ECC_DATA(NFC_ECC_BCH24_1K, 24, 1024),
+	MESON_ECC_DATA(NFC_ECC_BCH30_1K, 30, 1024),
+	MESON_ECC_DATA(NFC_ECC_BCH40_1K, 40, 1024),
+	MESON_ECC_DATA(NFC_ECC_BCH50_1K, 50, 1024),
+	MESON_ECC_DATA(NFC_ECC_BCH60_1K, 60, 1024),
 };
 
 static int meson_nand_calc_ecc_bytes(int step_size, int strength)
@@ -224,8 +227,27 @@ static int meson_nand_calc_ecc_bytes(int step_size, int strength)
 
 NAND_ECC_CAPS_SINGLE(meson_gxl_ecc_caps,
 		     meson_nand_calc_ecc_bytes, 1024, 8, 24, 30, 40, 50, 60);
-NAND_ECC_CAPS_SINGLE(meson_axg_ecc_caps,
-		     meson_nand_calc_ecc_bytes, 1024, 8);
+
+static const int axg_stepinfo_strengths[] = { 8 };
+static const struct nand_ecc_step_info axg_stepinfo_1024 = {
+	.stepsize = 1024,
+	.strengths = axg_stepinfo_strengths,
+	.nstrengths = ARRAY_SIZE(axg_stepinfo_strengths)
+};
+
+static const struct nand_ecc_step_info axg_stepinfo_512 = {
+	.stepsize = 512,
+	.strengths = axg_stepinfo_strengths,
+	.nstrengths = ARRAY_SIZE(axg_stepinfo_strengths)
+};
+
+static const struct nand_ecc_step_info axg_stepinfo[] = { axg_stepinfo_1024, axg_stepinfo_512 };
+
+static const struct nand_ecc_caps meson_axg_ecc_caps = {
+	.stepinfos = axg_stepinfo,
+	.nstepinfos = ARRAY_SIZE(axg_stepinfo),
+	.calc_ecc_bytes = meson_nand_calc_ecc_bytes,
+};
 
 static struct meson_nfc_nand_chip *to_meson_nand(struct nand_chip *nand)
 {
@@ -1259,7 +1281,8 @@ static int meson_nand_bch_mode(struct nand_chip *nand)
 		return -EINVAL;
 
 	for (i = 0; i < ARRAY_SIZE(meson_ecc); i++) {
-		if (meson_ecc[i].strength == nand->ecc.strength) {
+		if (meson_ecc[i].strength == nand->ecc.strength &&
+		    meson_ecc[i].size == nand->ecc.size) {
 			meson_chip->bch_mode = meson_ecc[i].bch;
 			return 0;
 		}
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
