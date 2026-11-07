Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A810F606EE86
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fmqHVXL1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MavObr7LXQJDDlXAYPeV+bT3eSBFwqIIga4CpVAblEM=; b=fmqHVXL1ss+TCTkKxjwW0pFcpe
	GXV5I+Xg0T0dbliKgCsh0O0uGPU90S5uAPS1aPYprByJKpkPV7DPMNMlReDC0N16bxp6ledIGUq0Q
	eIrDhByTAc52Zn0tLcuwGlyZwM1Oxn+ItnfSAsRNuRNI7chKTZGTeYPnxDXesc8kVpHisWIxeOYat
	tTcGSCezSUhTjMcpJwYmRJ9Y42JSnsCZol1MzF4/HCWcd2cDVubiwjinbdmHXDJeQz9Vejn2SoZJJ
	1DCtExa7n8wiO0BLAEotcFBXL7k16N0v5v1N7PAHeefAlBniYmS+wrjBd032OpgrauoRlKSeWa6Sf
	E+QWOtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmms-0000000FHZx-0AYQ;
	Sat, 07 Nov 2026 20:13:18 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmml-0000000FHMU-235l
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:14 +0000
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-716ea2598eeso980385eaf.0
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 12:13:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082390; x=1794687190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VloKSurmIYFY1UFfVkwmy64gkSHDogGYCar5RGOv9NU=;
        b=y5YewoJhhk1C3EMnZIwEHAcgyIPG2fyxUw2Gfli0CpPFMvjlnTd5iiwVUY7g1hyNH5
         ovtArrE47XQtYUVPMj3KrSIPCw6X+KMI5BHnwwEqTs2iXJL1uiUucwOsKL1zM9tQ1g74
         pnWJNT8ItTG74oraqJCvIGM0cMO+/VG34ehTd6ZJxE3d0aCb0hQMpGtOlMKp0iQaoyIv
         ZUx+eAt0gAd7whBpIG/bBXKgTGje0tozgxYKNIwEr2k/KEQPZoPMmqH9msxcQ0e82soI
         leZufJCEcFTJR35vPis7eIy3C3tqmxMoX4Fr9CHZPXhD1OIK3P+0MemGTfDx1v45BIxx
         jOPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx53lPGUHAyVe8ChJJ8RQCFCO2AP+vto4tEH7aavR/BmzytlV+eZK80dfTtyqU4F5ynDzSpkzdgSl4=@lists.infradead.org
X-Gm-Message-State: APuU4Z/5+urLBR8fBXpTWGf3yPGsyrcC33CebLkgqTvTM2R9fkr1s4iR
	C94Ia/otQb5lfx+BmZH3LpPlEMijBzGi5wyW6l9nl1LbRxwiWb9ObUBiqvm0T6i7Dl4=
X-Gm-Gg: AYBFou3Pq1Pyw0/+aawTGPO7rDl2ShNXgtKjN26MD1D+WmxSLYhA2XD6KUfaxDjsbLJ
	xjlCbFBweRNS8Y028+iGypgR5YNiLtfJgc6/h3vtad6Gl6eD3D282OOhElTyJqiwsCPPhb9DLkg
	TDNnckQE/K3z85tjCJ9+I4upLwz5WgGXJPbU2rQCadrU4lWfnprpiJpCEiKuXZqKXj/ok7Ulq7v
	TIpPiJR8fkzc0ED0uyFig5ZtX7NiC1sI6+FoM62we+SjDJvAIYx6A9W5MVdQ7C7aES74rWm/gIm
	3gJlluEn6WJ4hk21R1acKVAX7ax2ZEWZfg5xN5gWeYFLF5BGq0p4hlkwat5iUL8BypBVHkh7b43
	mJixXJ9nloEhwkspPHof3JSmW05JB7221EXOLwSgEHmsw+jZ//YYEPIv7SM5XlzNfCWboi9x1Lq
	pg403TROJs1MdLfhHPFGv2GM+lTLY1AAKPEQr6PjoYaxty0QqOiaZnD49JMnKL+ya7GhhODnZSv
	/oMgYVjn12p8rc5xKsM30RG43fof8DH7RwNyPO4irc2ADENdY2DYYcMRG0j8bqAw9Ig/D2Lfbnq
	SwDJoA8uQ9/QHcPGGz7PPVD8EpUucb7XqkZKn0K9Gqm4ZGSPjSqURejivIuF
X-Received: by 2002:a05:6820:838a:b0:716:c53c:3f4b with SMTP id 006d021491bc7-7170f35914amr8104eaf.88.1794082390463;
        Sat, 07 Nov 2026 12:13:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:30 -0700
Subject: [PATCH 33/58] mtd: rawnand: gpmi: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-33-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_121311_609962_40D0E856 
X-CRM114-Status: GOOD (  16.50  )
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

Keep geometry available after removal while releasing DMA and clocks.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc839..cda3bbdca928 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2744,7 +2744,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	nand_controller_init(&this->base);
 	this->base.ops = &gpmi_nand_controller_ops;
 	chip->controller = &this->base;
 
@@ -2759,9 +2758,15 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_nand_cleanup;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_out;
+	}
 	return 0;
 
 err_nand_cleanup:
@@ -2782,14 +2787,22 @@ static const struct of_device_id gpmi_nand_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
 
+static void gpmi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpmi_nand_data, base));
+}
+
 static int gpmi_nand_probe(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this;
 	int ret;
 
-	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
+	this = kzalloc_obj(*this);
 	if (!this)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &this->base, gpmi_nand_release);
+	if (ret)
+		return ret;
 
 	this->devdata = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, this);
@@ -2838,7 +2851,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -2846,6 +2859,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	gpmi_disable_clk(this);
 #endif
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpmi_pm_suspend(struct device *dev)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
