Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B8BEB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jun 2023 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MoCWcZyWKLJyv4x2YJkOGNC17V6Ou/GDFx4S016DBdc=; b=LSuGuHA5k8CmSl
	761e9sPtPGWu3IvrLGYSr/SqgqpvUZswo6sVB3mV4jyJxBWr61ytckcFGl5SlQ03WriN4E+pPD+wz
	MYyFvtmbbC0+N/OovcJYm19WdhPEkM0hGdnPj2PWR6kr+UxjjhbDsjjUzaF+SIG+UPcD95tAMRfj0
	6+dMeWJpjCdJnxgXYx2l7IcMZwfNgmuWUq+YyD35ddBcwMaaV72WAFJ63gwbUiBxW+EOjQ0UCMhe8
	9fiYOzsZ+PGyqrGiGzWApRon2ap9Yk4WT1ZSyPfcDtGq5AoiVMxQ1O7eDHrjRAIiBnI0c9xypdd9w
	8r3zM/IjjE1u7ukrdGSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCnWC-004VUD-24;
	Fri, 23 Jun 2023 20:36:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCnW8-004VRg-2Y;
	Fri, 23 Jun 2023 20:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687552588; x=1719088588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+NDzjzg+Ni//gNmFZKyOgL7uxanPfC14OsbzNCq8wzw=;
  b=qy2VQyOLK5/tnuJHtiM7M8LxtW6no1q8GaaaMqw27x1qFyGopdMVFUok
   pVTC3LnAbgtdEz11s83L6MDXJVXGUMw55noYk/kx24iNTl5xKM2lAJhFh
   IefUDXuMmntFyKxC5GJvcggr8FXQiVqgYnH2M6Zcor4QEwUFx+y4008yY
   a4Dnxy4MFDPCVpJFcGG3MdvV3pacBAZzaFIgPlTihma02UuD+ViNKkb9m
   WSU3J3wcZ6dgTy84vzfhqLuo96o80EBaLYBqDBrNq976JQuKEmjQIPYbs
   +599Cj1B8WC87w7WBuWog2hXrV64+o+MoAT7pjW1p+eBdDH6gIoDy4ZaD
   g==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="158362094"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 13:36:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:36:21 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:35:53 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <herbert@gondor.apana.org.au>,
	<davem@davemloft.net>, <vkoul@kernel.org>, <tglx@linutronix.de>,
	<maz@kernel.org>, <lee@kernel.org>, <ulf.hansson@linaro.org>,
	<tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <linus.walleij@linaro.org>, <p.zabel@pengutronix.de>,
	<olivia@selenic.com>, <a.zummo@towertech.it>, <radu_nicolae.pirea@upb.ro>,
	<richard.genoud@gmail.com>, <gregkh@linuxfoundation.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>, <arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>,
	<linux@armlinux.org.uk>, <sre@kernel.org>, <jerry.ray@microchip.com>,
	<horatiu.vultur@microchip.com>, <durai.manickamkr@microchip.com>,
	<varshini.rajendran@microchip.com>, <andrew@lunn.ch>,
	<alain.volmat@foss.st.com>, <neil.armstrong@linaro.org>,
	<mihai.sain@microchip.com>, <eugen.hristev@collabora.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-usb@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-pm@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <manikandan.m@microchip.com>,
	<dharma.b@microchip.com>, <nayabbasha.sayed@microchip.com>,
	<balakrishnan.s@microchip.com>
Subject: [PATCH v2 10/45] clk: at91: sama7g5: move mux table macros to header file
Date: Sat, 24 Jun 2023 02:00:21 +0530
Message-ID: <20230623203056.689705-11-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_133628_931605_E6FFA0C2 
X-CRM114-Status: GOOD (  12.34  )
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

Move the mux table init and fill macro function definitions from the
sama7g5 pmc driver to the pmc.h header file since they will be used
by other SoC's pmc drivers as well like sam9x7.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/clk/at91/pmc.h     | 16 ++++++++++++++++
 drivers/clk/at91/sama7g5.c | 35 ++++++++++-------------------------
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 1dd01f30bdee..f3c23ff0da02 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -121,6 +121,22 @@ struct at91_clk_pms {
 
 #define ndck(a, s) (a[s - 1].id + 1)
 #define nck(a) (a[ARRAY_SIZE(a) - 1].id + 1)
+
+#define PMC_INIT_TABLE(_table, _count)		\
+	do {						\
+		u8 _i;					\
+		for (_i = 0; _i < (_count); _i++)	\
+			(_table)[_i] = _i;		\
+	} while (0)
+
+#define PMC_FILL_TABLE(_to, _from, _count)		\
+	do {						\
+		u8 _i;					\
+		for (_i = 0; _i < (_count); _i++) {	\
+			(_to)[_i] = (_from)[_i];	\
+		}					\
+	} while (0)
+
 struct pmc_data *pmc_data_allocate(unsigned int ncore, unsigned int nsystem,
 				   unsigned int nperiph, unsigned int ngck,
 				   unsigned int npck);
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 468a3c5449b5..75011df708cc 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -16,21 +16,6 @@
 
 #include "pmc.h"
 
-#define SAMA7G5_INIT_TABLE(_table, _count)		\
-	do {						\
-		u8 _i;					\
-		for (_i = 0; _i < (_count); _i++)	\
-			(_table)[_i] = _i;		\
-	} while (0)
-
-#define SAMA7G5_FILL_TABLE(_to, _from, _count)		\
-	do {						\
-		u8 _i;					\
-		for (_i = 0; _i < (_count); _i++) {	\
-			(_to)[_i] = (_from)[_i];	\
-		}					\
-	} while (0)
-
 static DEFINE_SPINLOCK(pmc_pll_lock);
 static DEFINE_SPINLOCK(pmc_mck0_lock);
 static DEFINE_SPINLOCK(pmc_mckX_lock);
@@ -1022,11 +1007,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 		if (!mux_table)
 			goto err_free;
 
-		SAMA7G5_INIT_TABLE(mux_table, 3);
-		SAMA7G5_FILL_TABLE(&mux_table[3], sama7g5_mckx[i].ep_mux_table,
-				   sama7g5_mckx[i].ep_count);
-		SAMA7G5_FILL_TABLE(&parent_names[3], sama7g5_mckx[i].ep,
-				   sama7g5_mckx[i].ep_count);
+		PMC_INIT_TABLE(mux_table, 3);
+		PMC_FILL_TABLE(&mux_table[3], sama7g5_mckx[i].ep_mux_table,
+			       sama7g5_mckx[i].ep_count);
+		PMC_FILL_TABLE(&parent_names[3], sama7g5_mckx[i].ep,
+			       sama7g5_mckx[i].ep_count);
 
 		hw = at91_clk_sama7g5_register_master(regmap, sama7g5_mckx[i].n,
 				   num_parents, parent_names, mux_table,
@@ -1109,11 +1094,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 		if (!mux_table)
 			goto err_free;
 
-		SAMA7G5_INIT_TABLE(mux_table, 3);
-		SAMA7G5_FILL_TABLE(&mux_table[3], sama7g5_gck[i].pp_mux_table,
-				   sama7g5_gck[i].pp_count);
-		SAMA7G5_FILL_TABLE(&parent_names[3], sama7g5_gck[i].pp,
-				   sama7g5_gck[i].pp_count);
+		PMC_INIT_TABLE(mux_table, 3);
+		PMC_FILL_TABLE(&mux_table[3], sama7g5_gck[i].pp_mux_table,
+			       sama7g5_gck[i].pp_count);
+		PMC_FILL_TABLE(&parent_names[3], sama7g5_gck[i].pp,
+			       sama7g5_gck[i].pp_count);
 
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
 						 &sama7g5_pcr_layout,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
