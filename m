Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD31606D832
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X3FZdM7+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Pzio0fa0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=goH7Ytq1ByIFzbZ0CdclutUYX/fi6y0vWxScNXyHIrw=; b=X3FZdM7+z+r8A/QfdRvEpdSM0l
	QFUmG4rLd7FAdBA70fiVulqwA5m41pACbwnOF4cjSzlOiK6N36lRq/6yjvUWGAH+neQ6D1yJunSpO
	v1kYc5KZbkXxFH0r9R+Pk67WpLvOu1koa1mz0O5JBKxGdE3rnBfTgQ1X6KWQJATguXrCj3qw9iP/X
	/Ct/rf7nKUv8EUM1pPbJesbwY+ES0ETSB2tbfs8QjRcJc5B18Lts7kR9PwXslRE6lt42r5LP6Z9w0
	1oWmBBOi7Fcx5lcHjLiq1eOrQNAAb+ARDrVFQVU/xTNy/THBnr++vpK5utpesoIptcOQJBD74bUYl
	2dAZrgrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnL-0000000FIYK-49aP;
	Sat, 07 Nov 2026 20:13:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnC-0000000FIEu-2kTC
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LtCTMO6NoGllay7SWUsBqb6+joFcIMTVNySCP1lhl94=; b=Pzio0fa0SARHNE8sDIRvKlXnWl
	w7RT07Q0eIse5vOzf9BT42FIAq0qCzc+qM4F+m3yL/Bh6YG3TxBYP3QIllPHBLiUCbdS006LV31ib
	ImWMEx3KvfSwjujH4BW44A+QG4ytFNlhvn2TvK8VrvH1QqikBmBqOdX/POC1X6sGr381jFBoIZQwO
	YmuXh2mkL4SyAjH5AKzjjX94H9Kr6kyxocUsfYdGB5t0sH9DIBcAqvjHWshSb5w58SlRCmbw6DDop
	OTb4G63B8xQcENmsxrTh665DbLEQmi9HMLuIR0Kf0gH0WRk0MinmZfulpYZMn+BM1JXjos1Y9Ymfk
	pr0EWATw==;
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmn9-00000005Qdy-1jYD
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:37 +0000
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4f14642adb4so3996b6e.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 12:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082414; x=1794687214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtCTMO6NoGllay7SWUsBqb6+joFcIMTVNySCP1lhl94=;
        b=crgOUK9ozniygH4dWBlLCq4ADDo2LIR3WNANLuN7Y/o0YldA4GqvJzULNhjVkzEpL6
         zgPAoM4vhy3OwKZ0Pbwzo8SSgr6KTENTioTmd9bgDk4FE+ouLbxtKnjZQzpmXuSstNnh
         khn+ALxoMVpc8mrFkPGnhiLDV2fvIYZFJacLDETYLjBoE/mcdwmgselnBzShg1I1AmjJ
         l/T8i4ofZc3r8R+0R0c6BdAwPyPPGpuI8ZgLnaKpmlTb5ukqRYNSZcnLOElZg3qfp/OF
         Vuu1OnOWB8blvFb2Kv+6bCew2A3kaw7vorBDgK7Jm3YPPdYGXw4DVcbg4u/MzOpWXHB3
         JXow==
X-Forwarded-Encrypted: i=1; AKwUvBzs507+TxJPJyocpDiRZmL23rAe9IFlUy/PJVRt3stRoeyKDOYyMGMJPbOFMLE7cFsm+rwmBHkbfYQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z/F347po8F3Id7lH0Vqiv0x1rTpZRTGxzdikb07xftFG7jzoi2O
	3O6KW8ERwHP1aO7vVBB1K6qWiSgrmqNaokYN6STkfnLTfBSm2FLa39J2dUpEDD05x3I=
X-Gm-Gg: AYBFou1bL51Xm2yz/BMIEkZqXgh0PirecsCNN8FNlB6eX7KLVekzBrBhrAWeI/eBgOM
	u1MZPw1ed/rDpN3TSmTS4R3ycqgZ17UcGvrqL5jFvK/r0IXA0z76okb1wTZSjUJZfgAo7NEhF8l
	sHBfqGeIhOCWNIPd+lZjVKv5r0o9BVY0HgGFhHBy3gMHHqGBs1rww4KiTXpRUa3TttrjUC8ZRem
	KZftnYMyVzO5Hrc6oW+Ik450IvFoZ1EDPNWZ8aAxiunppTJJWjhOJPxhnu2Y5aClbbbeIKjNr6i
	tb9by+7moZQJ0rOTNKVHOOqgEkhXh/XuI3IBXqBXs2kKcmPFdt3q1POnOP01kEObmfVWA+c34nj
	O2etQmqNwLLcil3ajV0prv33tQ7Ku1SkWxWqXBon9CI/XiuPpK11dRE9N3fn3cWn5VoWMLokkO7
	FLmym636SpYRkguAsWLb94XkhkyIbEneo5SHb6XvK+aPSb3ofUbzygBciE5bBgk/jeoz8Z9wM1k
	NjANQRuzm+3peHjl4zfPkk8AGjY0MpyM0Mq4eI7b+uIox+6R3Q7dtNsfuiS1XSl0l3OUyyOpklm
	moP35BSsY6F0E7kovd/clDem5aQS0jIIy/bawL8fJwkYDU2t9p9Aiou8TFU3
X-Received: by 2002:a05:6808:3097:b0:4f5:4780:582 with SMTP id 5614622812f47-567e1367a27mr5024513b6e.50.1794082413678;
        Sat, 07 Nov 2026 12:13:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:38 -0700
Subject: [PATCH 41/58] mtd: rawnand: brcmnand: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-41-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_201335_521242_102C8490 
X-CRM114-Status: GOOD (  18.96  )
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

Unwind previously registered chip-selects on probe failure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 72 +++++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 4a1f5e736a1c..eaf0279518ca 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3077,6 +3077,11 @@ static const struct nand_controller_ops brcmnand_controller_ops = {
 	.exec_op = brcmnand_exec_op,
 };
 
+static void brcmnand_host_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct brcmnand_host, chip));
+}
+
 static int brcmnand_init_cs(struct brcmnand_host *host,
 			    const char * const *part_probe_types)
 {
@@ -3093,8 +3098,10 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 	nand_set_controller_data(chip, host);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "brcmnand.%d",
 				   host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = dev;
@@ -3123,12 +3130,23 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_host;
 
-	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
+	ret = nand_set_release(chip, brcmnand_host_release);
+	if (ret) {
 		nand_cleanup(chip);
+		goto free_host;
+	}
+	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
+
+	return ret;
 
+free_host:
+	kfree(host);
 	return ret;
 }
 
@@ -3294,6 +3312,26 @@ static int brcmnand_edu_setup(struct platform_device *pdev)
 	return 0;
 }
 
+static void brcmnand_chips_cleanup(struct brcmnand_controller *ctrl)
+{
+	struct brcmnand_host *host, *tmp;
+
+	list_for_each_entry_safe(host, tmp, &ctrl->host_list, node) {
+		struct nand_chip *chip = &host->chip;
+		struct mtd_info *mtd = nand_to_mtd(chip);
+
+		WARN_ON(mtd_device_unregister(mtd));
+		nand_disconnect(chip);
+		list_del(&host->node);
+		mtd_put_master(mtd);
+	}
+}
+
+static void brcmnand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct brcmnand_controller, controller));
+}
+
 int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 {
 	struct brcmnand_platform_data *pd = dev_get_platdata(&pdev->dev);
@@ -3307,9 +3345,12 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	if (dn && !of_match_node(brcmnand_of_match, dn))
 		return -ENODEV;
 
-	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ctrl->controller, brcmnand_release);
+	if (ret)
+		return ret;
 
 	dev_set_drvdata(dev, ctrl);
 	ctrl->dev = dev;
@@ -3324,7 +3365,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	init_completion(&ctrl->done);
 	init_completion(&ctrl->dma_done);
 	init_completion(&ctrl->edu_done);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &brcmnand_controller_ops;
 	INIT_LIST_HEAD(&ctrl->host_list);
 
@@ -3489,7 +3529,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	for_each_available_child_of_node_scoped(dn, child) {
 		if (of_device_is_compatible(child, "brcm,nandcs")) {
 
-			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+			host = kzalloc_obj(*host);
 			if (!host) {
 				ret = -ENOMEM;
 				goto err;
@@ -3500,7 +3540,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			ret = of_property_read_u32(child, "reg", &host->cs);
 			if (ret) {
 				dev_err(dev, "can't get chip-select\n");
-				devm_kfree(dev, host);
+				kfree(host);
 				continue;
 			}
 
@@ -3511,7 +3551,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 				if (ret == -EPROBE_DEFER)
 					goto err;
 
-				devm_kfree(dev, host);
 				continue; /* Try all chip-selects */
 			}
 
@@ -3528,7 +3567,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	}
 
 	/* If we got there we must have been probing via platform data */
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host) {
 		ret = -ENOMEM;
 		goto err;
@@ -3554,6 +3593,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	return 0;
 
 err:
+	brcmnand_chips_cleanup(ctrl);
 	clk_disable_unprepare(ctrl->clk);
 	return ret;
 
@@ -3563,16 +3603,8 @@ EXPORT_SYMBOL_GPL(brcmnand_probe);
 void brcmnand_remove(struct platform_device *pdev)
 {
 	struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
-	struct brcmnand_host *host;
-	struct nand_chip *chip;
-	int ret;
 
-	list_for_each_entry(host, &ctrl->host_list, node) {
-		chip = &host->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
-	}
+	brcmnand_chips_cleanup(ctrl);
 
 	clk_disable_unprepare(ctrl->clk);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
