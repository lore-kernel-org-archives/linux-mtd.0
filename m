Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9553FCA1012
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Sep 2025 10:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Xkk5/1o3IGR71eYNyUp7W1RxU3lKIhr3i81umoy2qQ=; b=vFBV+P2wm9bHdu
	r5x2QWStmEVM1jmqFC9ZI219G0yVlqqH9kpGm3E5DX/wcqCtBOSPy0OStQjPCcooV7n/M0TKvIBQ5
	qnFwKvkbUxVr8nIJG1im6db3YujzKlDDvtV8UX5L9KeGGHJgYmVasM7ZXrOjbPbQ/9Ck7RE6uW7iq
	6Wxppc0T2O0Jcu5RJhb3HAI9ZYGB/RjoPaCwVEl4QZoq8b4fvzPZviUFtJ0KBAtDvkiPJX+9mTRiS
	mJJ9V1kS/X9THTL4JNRW8XxZ4BP7RTf0hGRVxG9bIW2B98N8fM2xiXbkqIXvp7rMAYRvnb399z9vQ
	YFntBkDsXUs+1H7MJRVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7A2-0000000Asiz-1WEH;
	Thu, 04 Sep 2025 10:25:46 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu63R-0000000AUfr-0HPU;
	Thu, 04 Sep 2025 09:14:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33BDB14805E7;
	Thu,  4 Sep 2025 11:14:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1756977290; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=B6QZEQAGrZ6/3rkKC265OmTZsvazFci2LpzaEltMG8Y=;
	b=lN4LhAr46QA2PDMQsbmJLuOwfONCabS9l0jHr5Jt7hNcIJ/ySJurLYYB+fRyOH40yRAWzp
	JyTt+STxlouZpYfPWOsjd02Fn+BGAXsSEI+rUayHPiArwkcT+30lA4eXbgqFrSfpG6OZbD
	sVF1RaRWjjyNYcC9ZAMU158SaXpDN3mxomDSDzLpQA9DiA24bIph3hMIbEWfQ8Zln9PriB
	ZdSWLgLO8CSPY7mV0BAgr8HiLbwqH+n6VEVsoe2zLRIBfNuxRM6vmD6WztEO9y/0ryHvLv
	QswgSpdoW88nFRKhNAxwvoqLoalqFIskmtZsv7vm4C5jyUzcielj0sq3NOWMFQ==
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Cc: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
	Li Bin <bin.li@microchip.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: nand: raw: atmel: Fix pulse read timing for certain flash chips
Date: Thu,  4 Sep 2025 11:14:41 +0200
Message-Id: <20250904091441.351805-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_021453_274433_25DC1C83 
X-CRM114-Status: GOOD (  11.93  )
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

Prevent PMECC errors when reading from AMD/Spansion S34ML02G1 flash on
SAM9X60 SoC, after switching to ONFI timing mode 3.

From reading the S34ML02G1 and the SAM9X60 datasheets again, it seems
like we have to wait tREA after rising RE# before sampling the data.
Thus pulse must be at least tREA.

The previous approach to set this timing worked on sam9g20 and sama5d2
with the same flash (S34ML02G1), probably because those have a slower
mck clock rate and thus the resolution of the timings setup is not as
tight as with sam9x60.

The approach to fix the issue was carried over from u-boot, which itself
got it from at91bootstrap.  It has been successfully tested in
at91bootstrap, U-Boot and Linux on sam9x60 and sama5d2, for several
months here.

Link: https://github.com/linux4sam/at91bootstrap/issues/174
Link: https://github.com/linux4sam/at91bootstrap/commit/e2dfd8141d00613a37acee66ef5724f70f34a538
Link: https://lore.kernel.org/u-boot/20240415075755.780653-1-ada@thorsis.com/
Link: https://source.denx.de/u-boot/u-boot/-/commit/344e2f2cd4a407f847b301804f37d036e8a0a10c
Cc: Li Bin <bin.li@microchip.com>
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    based on v6.17-rc4

 drivers/mtd/nand/raw/atmel/nand-controller.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 84ab4a83cbd6..87481b60f315 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1240,7 +1240,7 @@ static int atmel_smc_nand_prepare_smcconf(struct atmel_nand *nand,
 					const struct nand_interface_config *conf,
 					struct atmel_smc_cs_conf *smcconf)
 {
-	u32 ncycles, totalcycles, timeps, mckperiodps;
+	u32 ncycles, totalcycles, timeps, mckperiodps, pulse;
 	struct atmel_nand_controller *nc;
 	int ret;
 
@@ -1366,11 +1366,16 @@ static int atmel_smc_nand_prepare_smcconf(struct atmel_nand *nand,
 			 ATMEL_SMC_MODE_TDFMODE_OPTIMIZED;
 
 	/*
-	 * Read pulse timing directly matches tRP:
+	 * Read pulse timing would directly match tRP,
+	 * but some NAND flash chips (S34ML01G2 and W29N02KVxxAF)
+	 * do not work properly in timing mode 3.
+	 * The workaround is to extend the SMC NRD pulse to meet tREA
+	 * timing.
 	 *
-	 * NRD_PULSE = tRP
+	 * NRD_PULSE = max(tRP, tREA)
 	 */
-	ncycles = DIV_ROUND_UP(conf->timings.sdr.tRP_min, mckperiodps);
+	pulse = max(conf->timings.sdr.tRP_min, conf->timings.sdr.tREA_max);
+	ncycles = DIV_ROUND_UP(pulse, mckperiodps);
 	totalcycles += ncycles;
 	ret = atmel_smc_cs_conf_set_pulse(smcconf, ATMEL_SMC_NRD_SHIFT,
 					  ncycles);

base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
