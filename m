Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86068606D804
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gX4ffYwR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9WFPNrGmW/szPtTMb36C3NvpImNqc/boz2S4wioyI9E=; b=gX4ffYwRaHPW/tFL3USPFre/I5
	+HuM9Wtv6K0bcKFRw46Ih7IGEskIO4kvS2K/GOLxvS8HmvieMIsCrSuhC7tSlMLmK5bnQwP/qDd7e
	lK6cQl7RxoplEDa7z+UjOi1pWGWOkCOPxAgFq9VciZb18M9fm5+gCyzpicb2/TZwOHEvNk3MtafQX
	pZEedE4x7cz9nkizJ53qzzbePxZ1EJ8bUYqb/SNRbzebcVdcfQk5sxcc5/N1sN/2+iBthtQfTT1pw
	hu/fW66N4YH1DAc24UD/33BO4j3fEkWjwhqRRndZPzQ43JStnkncB0ECZU0z9i74FyecIZUAE9hwt
	yiDa0hWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmh-0000000FHEU-0jM8;
	Sat, 07 Nov 2026 20:13:07 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmc-0000000FH2s-0ORY
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:04 +0000
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-5641f26ce05so3077b6e.2
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 12:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082381; x=1794687181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q10HEz8kiYMrWgvOwqfdg5IG6VH+ZxR/JVM/7JXlHp0=;
        b=AV97xmIRI/dgUdAUYt4rZ4JNTD3FIb8gL3abdlij8EUMfb6QgNzIXdbXgDPaWp5vwM
         gnfIW+cZPxwfoHXrkYWTdBD6gky0wcZjbxMBsi4kC3iwiBAD1N3qkcRufn0AGODTmcPU
         1F+BGX0gnNNOJ+VarnClzvLDLL6oXE0jUAiBzvrV0gHOgLudGp1RFQ0kZbttpky3cKxT
         lVuHyCoRHSJ5MOj6CvZ19fgt/9/dvH1TkxiV69OMs5HgBNKnnPIZdEmvaVG7ZTEky7wY
         CjH6cW85xdr2GjPt+BEOjssAClR1GpAVlHKknii5kQs4NqmScduKI4rPx8U1GBKK+QUd
         xJqA==
X-Forwarded-Encrypted: i=1; AKwUvBxnmj2o8o76w2uV1fzpNUOvk1dKM7UxBGaJWodbPrfJOXYf3HGv/wU5YZVqb1VtOBs1c1DEXbrTjPc=@lists.infradead.org
X-Gm-Message-State: APuU4Z8WdtZ4SJxb2yAHaegeFo79E3RzWVJeMroLIaEicOMEKuC91rcN
	uc3QQU8fj6XABUmxwihQv8aAzZjOtUxShbTsyVEa2d1s98ktfJw22e/Aht/ngrdfcjc=
X-Gm-Gg: AYBFou2WKD6v0HNNZjcrhQARbcjuS8epmRZDwivD5PLi2IGXa2R2jCLzh0d6fchPsbn
	cvx4R5l9aYp2rUn+UqMoMK9YR6jE3YzPASNzCQNe1zJbQTZv7+crmy9gvlLtlvQR2uzp4dsE0Td
	0Idx78L1WXOPYK3WawlB06ygY8nPpBuQnStHrVy4CAWSXGUhRI+aOWKAqMa+Z/s1gp+qA/gWt8W
	1FRIrQUccCcaPHp6qBVqWY/aeAYp6zolKUhiNKrYUkpqYXuuggHM83iFCAnS1qvqiF0dWEsRAwn
	VNsaFA4wqJSnVfrT+DYSy1Wryjh6izWOtwa4Vr6dCjwLJwQVsFrAS/nYXH30dbujtcEHfDi9vlR
	IBiYfAEe+vtJMrOvtsUtFqUhSXCFMpyo2zA7x1hJPmF9KhK3SYL8uojgC/YYljQMTIpTGe3hRXH
	xz3VzL8IM/a3HagY7wmw67kfsbGE7vzdUtY8hmimD39pexNfBmYhJlAMB9wJdcC/YrplXkzvD50
	nYEc9ktpHFyWu7S1O3o3jr6CId5Xqi6imIQYwVesDaYp/2bIXd/lwwGYYwOFYLocddv51Yc5qjA
	Nwpamfz3m3C+6nwJ1oegRpBCAXvBDuhIuPeh4NH26X9onmU9kAFvwnDg0/sc
X-Received: by 2002:a05:6808:4f67:b0:4f5:cb60:33c5 with SMTP id 5614622812f47-567e098c179mr5133579b6e.6.1794082380862;
        Sat, 07 Nov 2026 12:13:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:27 -0700
Subject: [PATCH 30/58] mtd: rawnand: pl35x: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-30-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
  Brian Norris <computersforpeace@gmail.com>,
  Boris Brezillon <bbrezillon@kernel.org>,
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>,
  Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
  Russell King <rmk+kernel@arm.linux.org.uk>,
  David Woodhouse <David.Woodhouse@intel.com>,
  Mike Rapoport <rppt@kernel.org>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Christophe Kerello <christophe.kerello@st.com>,
  Jason Roberts <jason.e.roberts@intel.com>,
  Michal Simek <michal.simek@amd.com>,
  Boris Brezillon <boris.brezillon@collabora.com>,
  Mason Yang <masonccyang@mxic.com.tw>,
  Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
  Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
  Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
  Liang Yang <liang.yang@amlogic.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  Paul Cercueil <paul@crapouillou.net>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,
  Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>,
  Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_121302_239948_CDBFE20C 
X-CRM114-Status: GOOD (  16.90  )
X-Spam-Score: 1.7 (+)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unwind chip ownership on registration failures as well as removal.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 46 ++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 26b61d856143..952fe5dcc84d 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1049,6 +1049,11 @@ static int pl35x_nand_reset_state(struct pl35x_nandc *nfc)
 	return 0;
 }
 
+static void pl35x_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct pl35x_nand, chip));
+}
+
 static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 				struct device_node *np)
 {
@@ -1057,22 +1062,24 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 	struct mtd_info *mtd;
 	int cs, ret;
 
-	plnand = devm_kzalloc(nfc->dev, sizeof(*plnand), GFP_KERNEL);
+	plnand = kzalloc_obj(*plnand);
 	if (!plnand)
 		return -ENOMEM;
 
 	ret = of_property_read_u32(np, "reg", &cs);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (cs >= PL35X_NAND_MAX_CS) {
 		dev_err(nfc->dev, "Wrong CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 		dev_err(nfc->dev, "Already assigned CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	plnand->cs = cs;
@@ -1089,23 +1096,34 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 					   "%s", PL35X_NANDC_DRIVER_NAME);
 		if (!mtd->name) {
 			dev_err(nfc->dev, "Failed to allocate mtd->name\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto free_chip;
 		}
 	}
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, pl35x_nand_chip_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&plnand->node, &nfc->chips);
 
 	return ret;
+
+free_chip:
+	kfree(plnand);
+	return ret;
 }
 
 static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
@@ -1118,8 +1136,9 @@ static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
 		chip = &plnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&plnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1146,6 +1165,11 @@ static int pl35x_nand_chips_init(struct pl35x_nandc *nfc)
 	return ret;
 }
 
+static void pl35x_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct pl35x_nandc, controller));
+}
+
 static int pl35x_nand_probe(struct platform_device *pdev)
 {
 	struct device *smc_dev = pdev->dev.parent;
@@ -1153,12 +1177,14 @@ static int pl35x_nand_probe(struct platform_device *pdev)
 	struct pl35x_nandc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, pl35x_nand_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &pl35x_nandc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
