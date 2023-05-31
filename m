Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38908C7EE23
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 02:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLPZtGwPr+VCqY4+2K7QxYx7sXQB+uCwrdLNKJdCqSs=; b=3j7j6n96Ix6duP
	1m9T4gmg1EYUpd9JHop2Z4wmKcyyN8X9QI6l2uImOFAqzt25SaV7ietclLG6ff7CHfETI3jgspz7x
	yCei622n1ZuA9wmrbu/Off1ebqa8h0KV8UjO5DXNre3s9BvQ4jMQ8WHHZlq6ZUDJFN3Q30zcqd84q
	a9fnOtoSmWTFJ+SaH1II6rr+vvXKJLzKPYe+cSiX17gkq/aq+OyQDKIGslViWyas26wCa4cFdcnk3
	75fKSPT4icSvk3PEkS8W0x8kCMWMoTiOcgXeI9Ni1ePyG/HsSyv+vpR7x9O3BH5He+mpwinjKmlU6
	azbRMhmh873J9DqRUgig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4C3N-00Fr4X-1J;
	Wed, 31 May 2023 02:59:13 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4C3H-00Fr1G-0J
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 02:59:10 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B1FC82C05CC;
	Wed, 31 May 2023 14:58:59 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685501939;
	bh=pX0AGkZ7cP1J451OpS7d6oUS57yjJPdDVs8gC+pj+vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=w/o8VpgQmgLlAeeHPzDEcU75bwt2oXjZAm6TS5jyeM8P6eqvJiXvUkJLzp7y9ct7j
	 sui37RibmhyC9aohzYj91POf+ncxgDO7JurHxzALErI24NvjjRKrM/sTmJRKLnaWSV
	 kuGAdzjjUVR7pzoSgHcmY3XLyRZ5ubOU0qQU6YtduqwlBf/44uU/W17kwe1aILZJBO
	 duCoUTWJtPLZbGingEQfitax4SbcbkbfyYHfJK6v8R3IbMeO7EIYv1bcT8Rt3w+b6+
	 GQ61kQq+VZOlN3+fGLJ3Y90KEV6oGkC6/P+rY3gsuqf0MTwWwHZcXTjRl4fLXL8tqy
	 ykBB7PXD2sZdA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6476b7f30002>; Wed, 31 May 2023 14:58:59 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 6CE7113EE4D;
	Wed, 31 May 2023 14:58:59 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 68543281742; Wed, 31 May 2023 14:58:59 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	daniel.lezcano@linaro.org,
	neil.armstrong@linaro.org,
	f.fainelli@gmail.com,
	christophe.kerello@foss.st.com,
	liang.yang@amlogic.com,
	jdelvare@suse.de
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/2] mtd: rawnand: marvell: add support for AC5 SoC
Date: Wed, 31 May 2023 14:58:47 +1200
Message-Id: <20230531025847.1284862-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531025847.1284862-1-chris.packham@alliedtelesis.co.nz>
References: <20230531025847.1284862-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=P0xRbXHiH_UA:10 a=FN2KoAgMzK-72ix3NDkA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_195907_581252_A8DDA1CE 
X-CRM114-Status: GOOD (  15.44  )
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
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
