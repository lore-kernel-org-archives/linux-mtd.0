Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60545606D83F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rls2+C/1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=M+eeeAKx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/clrBVvTf6ZlhP/lT65ECIrvJl8Alymy+sa854i+Eks=; b=Rls2+C/1IN/+Tps1eDpuHmLlq+
	gqdDE7d0z5xIIDrI8OeAMnKKFwkPSN6fX7lewGkUoGqKoU3F0FKTgId7VKcq4C7G5plCar39hm6nx
	Aa4eGl8MRaCJRdJ56FhrfT1JWRT+5dMMEKD/xwiAoSbsnk9Ul33DxIKRmGUhTs98gu4ccUTcniK8v
	vlFlKXp5LST7oGZUE/rdn/HlxYwcmromj0/7zMV7OfYZdgYYcDaf61IH50NuCKdoAt99xT6poEG8E
	eMEgiO8q58WBGbPjERjtllOOVA2tvVrel2qVi2Dj5NlxMN8e7WVmFYcm9kpYaIE/GD8huZGAxqeuA
	CuB/aBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnA-0000000FIBb-0Tc8;
	Sat, 07 Nov 2026 20:13:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmn5-0000000FI0a-1grp
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HLZfvDioLp/vY/9zYDjLGVC8TxAnz3Z/4xHRKH8AmZg=; b=M+eeeAKxjD3/SwxBv2klawM/5I
	mM8INiHF7SbAGnPNYd0v74ym0ouJsXXaK3NOxRX3GaQIPDX3kS6DU5CeQuH/mE1atRg7BEdwHC6/k
	L5tKtA/xmAxuk5VHT/nT6SJc1qdpxYNuB02t28b0a21rG/ZkfeA8TA2EEHe3xyTOLEROf9qx+HrAF
	6MNFYgGzTq73f5j4kuufTtSrog9P3XVKrJvtBTLyebODxTLCsXMsqGsL+jShiKV2uZQGkkzlDI28i
	g3L/KEF0mFop6kKcLA80GWeiV7kr7r+cAghZIm1EfYAd58jOIAmKamr0J0PWRWL+/h1LTn/J/o/jm
	9sd/6uFw==;
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmn0-00000005QXE-2nwt
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:30 +0000
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53a448f86e0so3679b6e.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 12:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082405; x=1794687205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLZfvDioLp/vY/9zYDjLGVC8TxAnz3Z/4xHRKH8AmZg=;
        b=ObP7Ff7aWpEb3YCLW6Kgr/Du2XhkArm6A8TByLJAjfnU7TLH7pr+XHwZnj3+a8jRwV
         bPCdZ4RT29znWXNJMYqTvQQ+XdvVGSxVyvvBg9j6k5pirJJvScIHQ7qKgqqnVSa3qyGQ
         14I3Kjr13Y1MiQzD3FBtE9eYT0FvHY+H2l/U+22lsTm160V6pX/5fAUJKEJtqPMo0Mm4
         ZwxX5qnI69RpP2PHDvnUJluP3uU+HqLUFQX2V4MAhuVf/9jLAfWRNf4XdsKuAb4J3/Jy
         M3uWiAgb2fLAXjojxmR/oQFMRzoQZx8ue/VPlgQkKIKkjt+sSzSPJvqEz8VLr9cdgqn1
         umEg==
X-Forwarded-Encrypted: i=1; AKwUvBy1WpfCVXZaa9S5IWixCthajDUZGa37hgq90Wsfq4IlCiqDN6aClQ4MBMuCOsSf+qpihPAw5iZ0mMw=@lists.infradead.org
X-Gm-Message-State: APuU4Z8TKpYNsUeqkrlSRSdMJs32D9ENLZt2hqNUaqZdBRqV8c5937Ap
	xe/dCP9ViZlAER2P3pkOl21kOibqySTI93PQpSammjnrOowrnQFcBlfmGosJnP8Hsng=
X-Gm-Gg: AYBFou2KhaBIOUhul0ADo/XJ/N2w9gzJa96+u0Qt+9qb7LJqR7gWBRulRNfdTNVStrb
	Gza+a3UXIlssAqmi9kyFxSllF3pnw41zSMw8dOlJK7ICf/jMfhc5wiiHZE2P3CQ6o+bjlgYPkDr
	oJbF1unCQP76RB9zVxBMKoX0Oc8YI5RuOVSHBpxnZdSEOlKfrKK4C9yBeFEFpoiCEGkt+j3/2fE
	Bu852xr757eBZwfaIj4RNa7FOyqxTMM7gpTTN8kQLirTIeSWvwoO4mpfXzJSmJUYvDOqD+Wb7UP
	4nJbVxHSPI/YSSD8n1tXIMiMBbGhccw0bl05kBYPxliETMtU0fDqWEE0i7nsvmncWbEKYWaWsek
	T+SSlnANSAzlAYQn6uG1H/ufN2bwu43nUffN1mo/3IF4DvSyy1ZxAMOXSI79zjoSPMUN9e8Jlm5
	Cvos7MD92DzkEBjJMItXDpUwPEHMGRA+FX7HosjZiFS19DehSXGtc2eEb6GkYJ40Vgw9D9jia2q
	8B6RfP92EBFcOxD+0EA59kWaxa7TkJPWMpNiiwvSTFzHWoEbsV6fLRB1Rop+QIjrAi0g7nYXaZ0
	mEVfJNFtncaeD3YO/jf1jP9Xl1gjEGwWB6ePRLrhJwA/KD62rgR80B4U8MQH
X-Received: by 2002:a05:6808:1202:b0:4c1:5614:acab with SMTP id 5614622812f47-567e10c6cd6mr4431450b6e.37.1794082404730;
        Sat, 07 Nov 2026 12:13:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:35 -0700
Subject: [PATCH 38/58] mtd: rawnand: cadence: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-38-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_201326_688088_E391863F 
X-CRM114-Status: GOOD (  19.87  )
X-Spam-Score: 3.5 (+++)
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

Allocate the final shared buffer before publishing any chip.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 60 +++++++++++++++++++-------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index d53b35a8b3cb..65c4eab600af 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -562,6 +562,7 @@ struct cdns_nand_chip {
 	struct cadence_nand_timings timings;
 	struct nand_chip chip;
 	u8 nsels;
+	bool registered;
 	struct list_head node;
 
 	/*
@@ -2991,6 +2992,11 @@ static const struct nand_controller_ops cadence_nand_controller_ops = {
 	.setup_interface = cadence_nand_setup_interface,
 };
 
+static void cadence_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(to_cdns_nand_chip(chip));
+}
+
 static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 				  struct device_node *np)
 {
@@ -3007,9 +3013,7 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	}
 
 	/* Allocate the nand chip structure. */
-	cdns_chip = devm_kzalloc(cdns_ctrl->dev, sizeof(*cdns_chip) +
-				 (nsels * sizeof(u8)),
-				 GFP_KERNEL);
+	cdns_chip = kzalloc(struct_size(cdns_chip, cs, nsels), GFP_KERNEL);
 	if (!cdns_chip) {
 		dev_err(cdns_ctrl->dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -3024,20 +3028,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 			dev_err(cdns_ctrl->dev,
 				"could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= cdns_ctrl->caps2.max_banks) {
 			dev_err(cdns_ctrl->dev,
 				"invalid reg value: %u (max CS = %d)\n",
 				cs, cdns_ctrl->caps2.max_banks);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &cdns_ctrl->assigned_cs)) {
 			dev_err(cdns_ctrl->dev,
 				"CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		cdns_chip->cs[i] = cs;
@@ -3059,20 +3065,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	ret = nand_scan(chip, cdns_chip->nsels);
 	if (ret) {
 		dev_err(cdns_ctrl->dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, cadence_nand_chip_release);
 	if (ret) {
-		dev_err(cdns_ctrl->dev,
-			"failed to register mtd device: %d\n", ret);
 		nand_cleanup(chip);
-		return ret;
+		goto free_chip;
 	}
 
 	list_add_tail(&cdns_chip->node, &cdns_ctrl->chips);
 
 	return 0;
+
+free_chip:
+	kfree(cdns_chip);
+	return ret;
 }
 
 static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
@@ -3083,10 +3091,13 @@ static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
 
 	list_for_each_entry_safe(entry, temp, &cdns_ctrl->chips, node) {
 		chip = &entry->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
+		if (entry->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -3127,6 +3138,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	dma_cap_mask_t mask;
 	struct dma_device *dma_dev;
+	struct cdns_nand_chip *entry;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -3181,7 +3193,6 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto dma_release_chnl;
 	}
 
-	nand_controller_init(&cdns_ctrl->controller);
 	INIT_LIST_HEAD(&cdns_ctrl->chips);
 
 	cdns_ctrl->controller.ops = &cadence_nand_controller_ops;
@@ -3201,9 +3212,17 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto unmap_dma_resource;
 	}
 
+	list_for_each_entry(entry, &cdns_ctrl->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&entry->chip), NULL, 0);
+		if (ret)
+			goto unmap_dma_resource;
+		entry->registered = true;
+	}
+
 	return 0;
 
 unmap_dma_resource:
+	cadence_nand_chips_cleanup(cdns_ctrl);
 	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
 			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
 
@@ -3260,6 +3279,11 @@ static const struct of_device_id cadence_nand_dt_ids[] = {
 
 MODULE_DEVICE_TABLE(of, cadence_nand_dt_ids);
 
+static void cadence_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct cadence_nand_dt, cdns_ctrl.controller));
+}
+
 static int cadence_nand_dt_probe(struct platform_device *ofdev)
 {
 	struct resource *res;
@@ -3275,11 +3299,15 @@ static int cadence_nand_dt_probe(struct platform_device *ofdev)
 		return -ENOMEM;
 	}
 
-	dt = devm_kzalloc(&ofdev->dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 
 	cdns_ctrl = &dt->cdns_ctrl;
+	ret = devm_nand_controller_init(&ofdev->dev, &cdns_ctrl->controller,
+					cadence_nand_release);
+	if (ret)
+		return ret;
 	cdns_ctrl->caps1 = devdata;
 
 	cdns_ctrl->dev = &ofdev->dev;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
