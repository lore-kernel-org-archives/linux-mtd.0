Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC60606EEA3
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YEDRiJZU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JR0dKtSH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y3LWFWBGO9Xuu20kkLgZURSBU6PyxU0jX4t+8jvha7I=; b=YEDRiJZUbe4Tg5l1035B60ZL/b
	QoRxDXFpGzAZ9SZP9gkInQSoOf3jpv1Uw4KJ1METSngugu68KJ2aT2ck5OO5tFhRLtOvCzalhBV87
	GsbPuWQd/CqI7TsPIJtdHKgt/EgFK7ZlLJyEoo46b9lwyKJE+N6TOD+Xo2JQAwHrToZlhqXH6lKmH
	uOOnFFMvMZq64/lDnXsY0msW/i3GF/SGeeyiqdyJvdn2RquCsmq6zQquYyt07JOMHQc9W74BIWNb6
	nDRkgPjMmP9lg9mNLic7x5TuB/WbLw3wUXqIlzv5fKnrwmIWbZaqjEjr7AxOCvY1mK7RCiOmrd2O5
	TqKBUzOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmn3-0000000FHyV-2jLj;
	Sat, 07 Nov 2026 20:13:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmn0-0000000FHrt-2S8h
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aq6FcH8o0pFOh9qagX/8knXnGd4aYEu4wccWnJqnW+s=; b=JR0dKtSHISjw8I1AUMvmgpVQTr
	Qeop76mvcQpVLWIKqCXW3d0vMce5bPgbK/97/PNpAFJGrTAJztITN8OIeJg+s5NLGGgNE1FK8nUiO
	OkMkVv5yexLAfzD0rttQ8ISxZgJXBAoo5vxvwL8VI+EInwAqKR0lUr9Ry4qSkS56GbpeoFW8DjpL9
	nJ39ZYyopU3OwuihUryrOX2MbAzlwhLiW3Ra/ENkBuoPBDZNcHaXeCmKrsTC4XQfT+vB/+YSn8OlK
	XTIYk3UwrxjHnGn4TEado0z4NCGFJAZ7rTm92WmXD8JPPmU29jIP/xhRbVlRo2fQlhwTyaCfntT7A
	b95T5e+w==;
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmu-00000005QSc-3FYF
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:24 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4ad89c49e0dso867fac.2
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 12:13:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082399; x=1794687199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aq6FcH8o0pFOh9qagX/8knXnGd4aYEu4wccWnJqnW+s=;
        b=EOlWMQjitDzw12qo+OXdE9snnplZ02tbJCdH4T0/6Pqz5IfWJCdweatq+7tQ95SrcM
         cpfUnG3AxjcpW/djYB5aPpV/eeBLZ7UuLGhZ8Dd+ewPO0lnEN6UAiW3hhPE0Je/6bVbv
         SLVfwcpQpjlWp/3jGlAfbY7jRpvZRaV8/r8hzmZX23fov2YY4xmvrd7jVDyeivE2xFcY
         lv+PAXdWZuEkDn9YexxEVbmGxbTs9YyWyb5TQRcoP+GH6RQoLjpl+AGyNmTxqHmllGwm
         s9KTgdbi64LpzQRCBU39V5lG69hW+UBvEOCnVn7N9IkqU9JHfm5Lx3+8W5uO2++w6h6+
         FSdA==
X-Forwarded-Encrypted: i=1; AL+hErHG9uvt9yQ1C6UM6FReJN/qspjyWFdJIZ1WmSyNXbd/OkWUwgwL0amsHh5JWRho01yfDdDVdtZadXw=@lists.infradead.org
X-Gm-Message-State: APuU4Z+oOrBxioURAHhaL0m1JpJvD8KO0peMBXsx4M/yme+EXYkcUX0U
	qFgWJZDVf4WgJp3srJSbNegXf7lpPgKk6mLjzoP3oqCglOHz9SNpsvVDlLaxkIGQRso=
X-Gm-Gg: AYBFou0QQvuwn6Y2SnVc6jddIV6QYz2FxqpcfzlRn/NvYwKGkHF0GiY69wUQdVsrL0y
	3ytTdgcOfjGRHCAiEBbrptJa1MdYkUzVZOhTZ4RRaFOcIGNX0WB4hm8wAKiEN+FlqnA7NaIxPe1
	n7aeIoRNUxPEkbJwnUJbIXQyaKYt6RQjUbSGxclicMbil6joPvCDoxZH7NGkCsWU3xeyuHTVckI
	EdkVXaO8CzhEddYDfu5LX91s2jd9UlhZSe07T/VdHjn7PA2Wdqp+4YQiEa9G8mn6xMc4r3tFcj7
	Hh8ToFu4cSHPzlZ3dug1zptl3NLIn7IPsq+RLvdr/HllDLXQ+AGUETyp0gjhsg5rJUnSAenrRy0
	jS5ZiV54l8tRpwPPDiT+BbmA+/cksPme1M12HhBQ7Z9urRP0D45so0KnE9K4WMpPcmhfZwF71h/
	puH9kZRRGW+wdKg2KdYZCUP7jlLndZlObLbPRlPKHOccwlDdwurdmE/E3W6qgq3sJb07+YJNssj
	uh4VA4HkLt19FBw693CYlDbR96CLbHX8CHGnZ2FDB+UEVYUjf3BZQ2n6AirBep/vakZaJF5IhXM
	Yqo/EpLTKE18lM4bQKMRV8ccKTCBrbakReO1BK8ki0P7PaIvbEJiFYz+kWiYsymMUVcHEx3z0bX
	ohXmsRg==
X-Received: by 2002:a05:6870:ed93:b0:49c:8cd1:d293 with SMTP id 586e51a60fabf-4ad9859e590mr4444729fac.1.1794082398830;
        Sat, 07 Nov 2026 12:13:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:33 -0700
Subject: [PATCH 36/58] mtd: rawnand: renesas: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-36-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_201321_557178_046AA0DA 
X-CRM114-Status: GOOD (  18.23  )
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

Disconnect all chips before dropping runtime PM and transfer buffers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 45 +++++++++++++++++++-------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 201dd62b9990..a8d9e701d7d7 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1201,6 +1201,11 @@ static int rnandc_alloc_dma_buf(struct rnandc *rnandc,
 	return 0;
 }
 
+static void rnandc_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct rnand_chip, chip));
+}
+
 static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 {
 	struct rnand_chip *rnand;
@@ -1217,8 +1222,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	}
 
 	/* Alloc the driver's NAND chip structure */
-	rnand = devm_kzalloc(rnandc->dev, struct_size(rnand, sels, nsels),
-			     GFP_KERNEL);
+	rnand = kzalloc(struct_size(rnand, sels, nsels), GFP_KERNEL);
 	if (!rnand)
 		return -ENOMEM;
 
@@ -1229,17 +1233,19 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(rnandc->dev, "Incomplete reg property (%d)\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= RNANDC_CS_NUM) {
 			dev_err(rnandc->dev, "Invalid reg property (%d)\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &rnandc->assigned_cs)) {
 			dev_err(rnandc->dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -1257,23 +1263,29 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	mtd->dev.parent = rnandc->dev;
 	if (!mtd->name) {
 		dev_err(rnandc->dev, "Missing MTD label\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, rnand->nsels);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to scan the NAND chip (%d)\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	ret = rnandc_alloc_dma_buf(rnandc, mtd);
 	if (ret)
 		goto cleanup_nand;
 
+	ret = nand_set_release(chip, rnandc_chip_release);
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to register MTD device (%d)\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&rnand->node, &rnandc->chips);
@@ -1282,7 +1294,8 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(rnand);
 	return ret;
 }
 
@@ -1296,8 +1309,9 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1316,18 +1330,25 @@ static int rnandc_chips_init(struct rnandc *rnandc)
 	return 0;
 }
 
+static void rnandc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct rnandc, controller));
+}
+
 static int rnandc_probe(struct platform_device *pdev)
 {
 	struct rnandc *rnandc;
 	struct clk *eclk;
 	int irq, ret;
 
-	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
+	rnandc = kzalloc_obj(*rnandc);
 	if (!rnandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &rnandc->controller, rnandc_release);
+	if (ret)
+		return ret;
 
 	rnandc->dev = &pdev->dev;
-	nand_controller_init(&rnandc->controller);
 	rnandc->controller.ops = &rnandc_ops;
 	INIT_LIST_HEAD(&rnandc->chips);
 	init_completion(&rnandc->complete);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
