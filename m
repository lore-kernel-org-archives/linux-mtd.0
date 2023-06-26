Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1CCC0015E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 03:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFfjRztjfweHQmnZtUz+oNROi/BQnnF83+h/xVk91LE=; b=B4D9OzV61pE76P
	VfvjuvWXmxsSkE3uxDB8yu7vfbHCbiFRwpewPdhIGhcTx9bEczY+LxAP5sg13V/PPHDholLouggeK
	+zan919Vy3Xc/FDPNWtiO+FLkIUdqwCQ20akLGO+RGp35Jlw/7JF6hFDL9o6WF0vVxgOFIEQqSRgE
	zwt65xYhR80RkBUakwKCAhtcnZejHMk9pyJl9JmmNCH5UWRuXjcsz7HsUyWv96dWwpBnec6AD+7Fp
	yryYXFmgotS8C2f0Bv4lRVz/fZPMQ+CQX1vjrE91rIQXTn4kubkLWvQT460Obwwt3TzOtCV73JfkV
	EOcFsDNH24jFw4RwdyBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDceW-009DFd-30;
	Mon, 26 Jun 2023 03:12:32 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDceS-009DC4-0E
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jun 2023 03:12:30 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 077602C0591;
	Mon, 26 Jun 2023 15:12:21 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1687749141;
	bh=T/cMMndfNf0ocqhn0QoQw6bUJBMlWygzKPKZTmLFFsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CTVr0opj8KePIWa9Q2JSSU2d7A6S+qQDuxZb2ekXGAgLNaskLMeJOioDIzHpCEiCM
	 liIVfFrr5ANCddL1Fpfxb9w6Ht3Vrm5IhcKmG6h93HeG9os+bOQIHl6BqkuCt/p34x
	 jdnIWqi1jlAFQgs81qUQIxrBx/hRZW3ptWeUPVrRjO4zE3l7HO3Gz1jpbM3xDsCtUd
	 TEtMMoOFYNMCtycXtYUczNBwkEneqTEJlf8nvFK//qtWa6b4r+e3NqrAjtuq2A06IS
	 0QxG/owF7Xp4pWDNO6ci8qmyfbrW/GL8ZcMU0LilHVxht2o6WecRHChya06A9Liatw
	 UgTEDkJHJgyfg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B649902140003>; Mon, 26 Jun 2023 15:12:20 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id A497313EE7B;
	Mon, 26 Jun 2023 15:12:20 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id A590D283B1A; Mon, 26 Jun 2023 15:12:20 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	gregory.clement@bootlin.com,
	pierre.gondois@arm.com,
	arnd@arndb.de,
	f.fainelli@gmail.com
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 3/3] mtd: rawnand: marvell: add support for AC5 SoC
Date: Mon, 26 Jun 2023 15:12:17 +1200
Message-ID: <20230626031217.870938-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626031217.870938-1-chris.packham@alliedtelesis.co.nz>
References: <20230626031217.870938-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NPqrBHyg c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=of4jigFt-DYA:10 a=FN2KoAgMzK-72ix3NDkA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_201228_263249_79A15D2E 
X-CRM114-Status: GOOD (  15.30  )
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

Add support for the AC5/AC5X SoC from Marvell. The NFC on this SoC only
supports SDR modes up to 3.

Marvell's SDK includes some predefined values for the ndtr registers.
These haven't been incorporated as the existing code seems to get good
values based on measurements taken with an oscilloscope.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - None

 drivers/mtd/nand/raw/Kconfig        |  2 +-
 drivers/mtd/nand/raw/marvell_nand.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index b523354dfb00..0f4cbb497010 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -160,7 +160,7 @@ config MTD_NAND_MARVELL
 	  including:
 	  - PXA3xx processors (NFCv1)
 	  - 32-bit Armada platforms (XP, 37x, 38x, 39x) (NFCv2)
-	  - 64-bit Aramda platforms (7k, 8k) (NFCv2)
+	  - 64-bit Aramda platforms (7k, 8k, ac5) (NFCv2)
 
 config MTD_NAND_SLC_LPC32XX
 	tristate "NXP LPC32xx SLC NAND controller"
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 30c15e4e1cc0..b9a8dd324211 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -375,6 +375,7 @@ static inline struct marvell_nand_chip_sel *to_nand_sel(struct marvell_nand_chip
  *			BCH error detection and correction algorithm,
  *			NDCB3 register has been added
  * @use_dma:		Use dma for data transfers
+ * @max_mode_number:	Maximum timing mode supported by the controller
  */
 struct marvell_nfc_caps {
 	unsigned int max_cs_nb;
@@ -383,6 +384,7 @@ struct marvell_nfc_caps {
 	bool legacy_of_bindings;
 	bool is_nfcv2;
 	bool use_dma;
+	unsigned int max_mode_number;
 };
 
 /**
@@ -2376,6 +2378,9 @@ static int marvell_nfc_setup_interface(struct nand_chip *chip, int chipnr,
 	if (IS_ERR(sdr))
 		return PTR_ERR(sdr);
 
+	if (nfc->caps->max_mode_number && nfc->caps->max_mode_number < conf->timings.mode)
+		return -EOPNOTSUPP;
+
 	/*
 	 * SDR timings are given in pico-seconds while NFC timings must be
 	 * expressed in NAND controller clock cycles, which is half of the
@@ -3073,6 +3078,13 @@ static const struct marvell_nfc_caps marvell_armada_8k_nfc_caps = {
 	.is_nfcv2 = true,
 };
 
+static const struct marvell_nfc_caps marvell_ac5_caps = {
+	.max_cs_nb = 2,
+	.max_rb_nb = 1,
+	.is_nfcv2 = true,
+	.max_mode_number = 3,
+};
+
 static const struct marvell_nfc_caps marvell_armada370_nfc_caps = {
 	.max_cs_nb = 4,
 	.max_rb_nb = 2,
@@ -3121,6 +3133,10 @@ static const struct of_device_id marvell_nfc_of_ids[] = {
 		.compatible = "marvell,armada-8k-nand-controller",
 		.data = &marvell_armada_8k_nfc_caps,
 	},
+	{
+		.compatible = "marvell,ac5-nand-controller",
+		.data = &marvell_ac5_caps,
+	},
 	{
 		.compatible = "marvell,armada370-nand-controller",
 		.data = &marvell_armada370_nfc_caps,
-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
