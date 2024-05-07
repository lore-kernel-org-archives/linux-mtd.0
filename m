Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3040CC19F4F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 23:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7eZzQ3LsSpwBjyFSWecP/M+81eHxqFgQzk4QRG6vjU=; b=P6x0KKmizWPqgy
	4Or8L6xPaDj5Vo60gfbN4RyLzmrYzjuD1z+bM9X2w4zZ6fiUC6fM8mC3g/w6zRLHu4OACyyC6d9+4
	2Dli+leLuriluPx5tBhAzh/tpGbko2LaE2N6VxtoOwPxI7l2Y1KrkY9lyukoGfexBpiF97mcpx5bl
	gfHCN/tbVdbV5ArsU+lpMog6B601XLixAwRGlV+q54I7QmW1q/WJbi3ODflAY0EwbXHie1Amn7g71
	FmajCtZv+w53RnKBojRZSExajhKVR7FyM0+LdnK5l8sdUkUK1OMSjRvrTf9lZ72AvMxgp+hjnVNsT
	63vZKMyWdMA8/o+TNYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4U6Y-0000000DFFf-3nye;
	Tue, 07 May 2024 23:20:14 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4U6R-0000000DF8r-2J3g;
	Tue, 07 May 2024 23:20:10 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id D9DC2100004;
	Wed,  8 May 2024 02:20:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru D9DC2100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715124001;
	bh=8ZYhKfZJ27Bg9mhE4x9FkjiYTdtndNlZ9xkVO7p4G9s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=UpSDvpXUE3LQEvb5Gc91U1GSsex64FTbGel5lkka0jd+qKyrPtvTHQJVrJU1cJCJh
	 gPYiCMCwiMA3Pu+Jp3F0w+7DMJ0jqQaDYONjFqXVIVv2TqjlS5Gc+qIY56llCqnkp+
	 k5ZryamUVCxAXvpYq5QNQqQPBMTYFFYeBwpWZmPaFvlPLkbbGy0slhXDLISybkuJmK
	 sCN0A8n1lkmemrS/maaqgQ1obqKRNP8KCs+i+8SVS/ncL5tGd9Z03T2IivQFlTRIMJ
	 ucH+qHh8TIl2IJKfM/n4BXOXOcE1K8nLbcWdy6XiHmdKnzVk8/1+IHq+M15zP2L84F
	 04ySJcMBMuCmw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  8 May 2024 02:20:01 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 8 May 2024 02:20:01 +0300
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: [PATCH v6 3/3] mtd: rawnand: meson: read/write access for boot ROM pages
Date: Wed, 8 May 2024 02:09:03 +0300
Message-ID: <20240507230903.3399594-4-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20240507230903.3399594-1-avkrasnov@salutedevices.com>
References: <20240507230903.3399594-1-avkrasnov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185123 [May 07 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/07 17:58:00 #25118681
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_162008_496382_D3DF4506 
X-CRM114-Status: GOOD (  17.81  )
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

Boot ROM on Meson needs some pages to be read/written in a special mode:
384 byte ECC mode (so called "short" by Amlogic) and with scrambling
enabled. Such pages are located on the chip in the following way (for
example):

[ p0 ][ p1 ][ p2 ][ p3 ][ p4 ][ p5 ][ p6 ][ p7 ] ... [ pN ]
  ^           ^           ^           ^

pX is page number "X". "^" means "special" page used by boot ROM - e.g.
every 2nd page in the range of [0, 7]. Step (2 here) and last page in
range is read from the device tree.

Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 58 +++++++++++++++++++++++++------
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 39f50cbd4ab9..c1bc04dc503e 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -35,6 +35,7 @@
 #define NFC_CMD_RB		BIT(20)
 #define NFC_CMD_SCRAMBLER_ENABLE	BIT(19)
 #define NFC_CMD_SCRAMBLER_DISABLE	0
+#define NFC_CMD_SHORTMODE_ENABLE	1
 #define NFC_CMD_SHORTMODE_DISABLE	0
 #define NFC_CMD_RB_INT		BIT(14)
 #define NFC_CMD_RB_INT_NO_PIN	((0xb << 10) | BIT(18) | BIT(16))
@@ -78,6 +79,8 @@
 #define DMA_DIR(dir)		((dir) ? NFC_CMD_N2M : NFC_CMD_M2N)
 #define DMA_ADDR_ALIGN		8
 
+#define NFC_SHORT_MODE_ECC_SZ	384
+
 #define ECC_CHECK_RETURN_FF	(-1)
 
 #define NAND_CE0		(0xe << 10)
@@ -125,6 +128,8 @@ struct meson_nfc_nand_chip {
 	u32 twb;
 	u32 tadl;
 	u32 tbers_max;
+	u32 boot_pages;
+	u32 boot_page_step;
 
 	u32 bch_mode;
 	u8 *data_buf;
@@ -298,33 +303,46 @@ static void meson_nfc_cmd_seed(struct meson_nfc *nfc, u32 seed)
 	       nfc->reg_base + NFC_REG_CMD);
 }
 
+static int meson_nfc_is_boot_page(struct nand_chip *nand, int page)
+{
+	const struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
+
+	return (nand->options & NAND_IS_BOOT_MEDIUM) &&
+	       !(page % meson_chip->boot_page_step) &&
+	       (page < meson_chip->boot_pages);
+}
+
 static void meson_nfc_cmd_access(struct nand_chip *nand, int raw, bool dir, int page)
 {
+	const struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct meson_nfc *nfc = nand_get_controller_data(mtd_to_nand(mtd));
-	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
-	u32 bch = meson_chip->bch_mode, cmd;
 	int len = mtd->writesize, pagesize, pages;
 	int scrambler;
+	u32 cmd;
 
 	if (nand->options & NAND_NEED_SCRAMBLING)
 		scrambler = NFC_CMD_SCRAMBLER_ENABLE;
 	else
 		scrambler = NFC_CMD_SCRAMBLER_DISABLE;
 
-	pagesize = nand->ecc.size;
-
 	if (raw) {
 		len = mtd->writesize + mtd->oobsize;
 		cmd = len | scrambler | DMA_DIR(dir);
-		writel(cmd, nfc->reg_base + NFC_REG_CMD);
-		return;
-	}
+	} else if (meson_nfc_is_boot_page(nand, page)) {
+		pagesize = NFC_SHORT_MODE_ECC_SZ >> 3;
+		pages = mtd->writesize / 512;
 
-	pages = len / nand->ecc.size;
+		scrambler = NFC_CMD_SCRAMBLER_ENABLE;
+		cmd = CMDRWGEN(DMA_DIR(dir), scrambler, NFC_ECC_BCH8_1K,
+			       NFC_CMD_SHORTMODE_ENABLE, pagesize, pages);
+	} else {
+		pagesize = nand->ecc.size >> 3;
+		pages = len / nand->ecc.size;
 
-	cmd = CMDRWGEN(DMA_DIR(dir), scrambler, bch,
-		       NFC_CMD_SHORTMODE_DISABLE, pagesize, pages);
+		cmd = CMDRWGEN(DMA_DIR(dir), scrambler, meson_chip->bch_mode,
+			       NFC_CMD_SHORTMODE_DISABLE, pagesize, pages);
+	}
 
 	if (scrambler == NFC_CMD_SCRAMBLER_ENABLE)
 		meson_nfc_cmd_seed(nfc, page);
@@ -1430,6 +1448,26 @@ meson_nfc_nand_chip_init(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (nand->options & NAND_IS_BOOT_MEDIUM) {
+		ret = of_property_read_u32(np, "amlogic,boot-pages",
+					   &meson_chip->boot_pages);
+		if (ret) {
+			dev_err(dev, "could not retrieve 'amlogic,boot-pages' property: %d",
+				ret);
+			nand_cleanup(nand);
+			return ret;
+		}
+
+		ret = of_property_read_u32(np, "amlogic,boot-page-step",
+					   &meson_chip->boot_page_step);
+		if (ret) {
+			dev_err(dev, "could not retrieve 'amlogic,boot-page-step' property: %d",
+				ret);
+			nand_cleanup(nand);
+			return ret;
+		}
+	}
+
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register MTD device: %d\n", ret);
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
