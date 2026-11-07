Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35489606D807
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PhxyECSI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nrVXexCC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFL5IdKc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7HbdhFjPWg+gMRlMTgaxIn4WjBauaKfm0peH3ulQI3k=; b=PhxyECSIOy727WDsaJKPKTIJRN
	LX/Ru4v3luvmFtQ+43TFh0x1U8M0lGwGsaceYBe2ROjxpOWbDkjh4/Q7Yempmh4V0RgaFgNLc6fcB
	PiBxzWkMqAwCzDqKqG0dL0Le8/XMRC3VdbYWW+oCk3U+nuTJ6yAb2akRbQxZD91ltyEIdLUQn33+Y
	HWLqXp+H8QsMtkDX2n4/Z8HMnuP6eJ3dYg1bsOSDPKFsldIZ1BDsjolQ6Pe0x4iEUP1ytspiMRk0F
	b/875AtpoTflSQiFXgNlTMRWGE9qfjLmWtYv+n21tpBLftv/EhsAg2F+iMPKrxnIdBFMfZ5Kxq9dl
	sUJrtHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUb-0000000EUZe-2oo1;
	Sat, 07 Nov 2026 10:17:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdU2-0000000ETkj-2ZeJ
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qfP62W4d274H4KIf4XZuVTstlQD2a+OvnHofuZlNZwo=; b=nrVXexCCM9CRFt+92Za/gwOIiM
	sGCOSyaE9STxrNjGQrvyneEgXBJ77osBDk/vfixSRrquzaOEed/6rhR+1ZRiECze9ZjV+X+RS1p3k
	ga5B5ScLt0/ptYtyFb/n938YAVzP1WwjCcHihnZWPRSpipnnnWk2kLzPzUcV4Vfq6mzZHuxfNum4Z
	Q4EAKLXYphRvOrF5dG+keBbyNqknTNwRr2yCFSnNb90eOTLMGCm4ytc8yvHf/3r/PeSJaehOeto/O
	jru6Yd+nBksUAUS3V0wAkFYJcl5pLrSB3g9DTLUfoeXbOtyU+vJzK0MdmOWyz0np84GbzUIreI92j
	pzFhQMDg==;
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTy-000000057ps-1bwS
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:13 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-847ac7ccd85so904793a34.3
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 02:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046628; x=1794651428; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qfP62W4d274H4KIf4XZuVTstlQD2a+OvnHofuZlNZwo=;
        b=XFL5IdKcVsU3c+QH9ujpkjkNlcDSN954J31txZN2jK+XI03ztYaftEp+QWgvuvl2pF
         8/8aCrGBI1KzisShrS7h8qxPsbfslc6x50uxngnsUWjfyFq0fzDB8Z0cupOhSnfb/fra
         CvKb3hIMSOULeifa6Ur6PW/Z1+EhAIPrbHRbJJx9UbDwOgB8eLrw7rHY5I0+AkXVcbFB
         HfLG1VVakxZw08/ngMqRqsotFYxFuFxdFglTAPE6MUWIZSTZam5P7I3xMlhzXRnjSpSR
         q0a/Ozcd12Etk269/Bxv7UQ0fRF7rzUkl9B/bxRJhwDQxdepOdrDzHagD6U/TliSO5z0
         PWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046628; x=1794651428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfP62W4d274H4KIf4XZuVTstlQD2a+OvnHofuZlNZwo=;
        b=Nq1fnZHbXfxOBxzLIu4mfY44McPUuhbCvCPPWkARlar8V2pGfLCDcw6vn9N2AQ8JNg
         bZ0I4LsrqX4bGbz/OT4KgvLixxBuw8mWl4dfmoB85lYZZWd0gLl+EaLmYXPzUrn41TRG
         VuMBfDpb6+4iIRcLuz1jsj0+Rg1zm4ijMjAR7vb7P5zDcVx49cIku9UCkye+s5Bxyyj9
         3XdJtRuoYDIwDVi+ICTn6U5QM2iNtR/TY2uj447enxNWFTVkzuTk65ULzlVe49SRcMKI
         PlkbWSSmJLgCx3kuDJpeE214Ieo8eahmgLnsl3vdBIH2iH+nBgig4xO6OidUefOMxwNb
         SbmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPnq3sIDkmlfa5VDiVP0SDiU9FZhydr+2wYConokmPZF4FTc2PuWU5xOSzCa8oljO+LQMsj6naZ9U=@lists.infradead.org
X-Gm-Message-State: APuU4Z+dYtWNVzQupgZxRek3uSLXjj2AZheRCdO5Bg5w0x8VYp76w9bl
	TRdMZIHuTS4IgvD0sRvwbzNrJUQjHBabat+bTun29+hN9EAdr4VZXmoN
X-Gm-Gg: AYBFou1AsVCr4+2tij6C/MqcakhqzMqR133ZDnSOtgh2IrvA4yIzpsBQI1RzeKkluKN
	IpmtW83WaUlwVRXhJ3ro9dlM+ty5zFkwtMQakK/jjGy61IWAM6keKHHpR6rGuEKsKJQV9HI7PA7
	6AhLTh0WHM3hSqaxhXYmbcOO29Ceb0Bn3v9goDW4QOjM9De8t8U8WftJe4eDz0FE9UOfbo6StWa
	8FkeyxPAl75H2bvSgzb62z7dwdXakW322aLd4rfKkWAftw9e5jN5O+6ZIESNKH+mgQ3lOUITBOh
	hcUxOa/aeAMtDnDGrxTuXP2lvpGognhwRkjAFa+bN7R4ZEY8hMDLwrs7S1JbBuheBfnK84YA0Fz
	l6q6aDBQAN+jq/cwLlifQLa+BLUmfUwV0Ed5uk0tBvqYYfKjRrB4KmLhv3w+2mQYF+9KvCn3WUu
	UOOtfCZMXbaRwkWZH2f4hw/FczkhgQrjL6uqfIIL7TOZpdZqn3u5AqQDMUkO/mbis+f0/ThmsK9
	y+zUP4ErgN2crK/JhtK49mwREKoeEouU4EgqLaAzZdzODeYy5rmeyUC+wcqXJlZFmaZEbR/JBxK
	0RkkoQoeUD49PfTTxtMiAMVJDLKEYTjzuhbIudhGrXnwb6MJeFUvih91na9A9P13Ub9c4I7tZDA
	oGPjalnwT+0yUY9zcbMMcEu0AuVsQgrC6x5oBM/TGTHsVSVvrVYoTW9q7TKpKDmov5sburbGvco
	GdYSbqtcgAklM8jLWV5g9pvVWQjkfBopWxmVa+l1UT0xRfIc5yhe6Z
X-Received: by 2002:a05:6830:410e:b0:844:ec25:c7f2 with SMTP id 46e09a7af769-85f1cfdc445mr4024752a34.13.1794046627839;
        Sat, 07 Nov 2026 02:17:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:12 -0700
Subject: [PATCH 15/58] mtd: rawnand: tegra: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-15-0181ef0cc4c8@gmail.com>
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
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
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
X-CRM114-CacheID: sfid-20261107_101710_287447_176A757F 
X-CRM114-Status: GOOD (  17.44  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Retain the chip and controller allocations until their final MTD
references are released. Disconnect the chip before suspending the
controller so retained handles cannot reach powered-down hardware. Leave
metadata cleanup to the final put, including registration-failure
unwinding.

Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 7f9eb5f042a7..da7791741b9d 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1064,6 +1064,11 @@ static const struct nand_controller_ops tegra_nand_controller_ops = {
 	.setup_interface = tegra_nand_setup_interface,
 };
 
+static void tegra_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct tegra_nand_chip, chip));
+}
+
 static int tegra_nand_chips_init(struct device *dev,
 				 struct tegra_nand_controller *ctrl)
 {
@@ -1096,7 +1101,7 @@ static int tegra_nand_chips_init(struct device *dev,
 		return ret;
 	}
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1107,7 +1112,7 @@ static int tegra_nand_chips_init(struct device *dev,
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		dev_err(dev, "Failed to request WP GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	chip = &nand->chip;
@@ -1127,20 +1132,35 @@ static int tegra_nand_chips_init(struct device *dev,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	mtd_ooblayout_ecc(mtd, 0, &nand->ecc);
+	ret = nand_set_release(chip, tegra_nand_chip_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	ctrl->chip = chip;
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
+}
+
+static void tegra_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct tegra_nand_controller, controller));
 }
 
 static int tegra_nand_probe(struct platform_device *pdev)
@@ -1149,13 +1169,15 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	struct tegra_nand_controller *ctrl;
 	int err = 0;
 
-	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &ctrl->controller, tegra_nand_release);
+	if (err)
+		return err;
 
 	ctrl->dev = &pdev->dev;
 	platform_set_drvdata(pdev, ctrl);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &tegra_nand_controller_ops;
 
 	ctrl->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1232,10 +1254,11 @@ static void tegra_nand_remove(struct platform_device *pdev)
 
 	WARN_ON(mtd_device_unregister(mtd));
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
+	mtd_put_master(mtd);
 }
 
 static int __maybe_unused tegra_nand_runtime_resume(struct device *dev)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
