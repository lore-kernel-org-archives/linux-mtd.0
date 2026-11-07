Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1AE606A32D
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 19:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JaF4sOeJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i364JM43
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iPvSo2+rOgDuDS3DXGTHak0vuML4Ew1bvdZYQlWIImk=; b=JaF4sOeJ6S9Z75ZghjGTLts+Yo
	WJqXxonWCI3FebHL8AHTFA/QwSTbEUA7FWLvkxGjDwjfr+4BlpjfmgQ8KNw8Q9YxGZ8tDwlCi+W7R
	heRsBSMjYZ1IkDmpaLzPZ8tQ87O/BEDdgzHd2V0fneoNZ/jd7qHUT2Vf5F7DdsSdx4HF/BUNPdd7d
	TZfPMUIErUOtqJ+sVvDyVRmEZ/xfxkNys2wzeoLqs0j9ZhoTRALGHM2cU+XFk8u3G5BOZIlnf/LzV
	XBFopnmGryzqUVkQMfQB95QsPaERCQkkVkVRWboTF+RhcTZYRggRilyE3+CnGiVdRJLybAfp5ElWj
	xgLSyWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPlzw-0000000FDfV-2BvR;
	Sat, 07 Nov 2026 19:22:44 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPlzn-0000000FDb7-2CJj
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 19:22:40 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso2787fac.0
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 11:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079354; x=1794684154; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=i364JM43meKJ/HWMIu7WcIhOvTv3ej+FnhgLhmlhoEPTRYyWry4L+s97UfJgFnszyl
         bkIU/4YPrJZvOwF7E2/I+0bndUIXTk2/N5+O2Jilqxhfa2HwS+nQpwQsyn8qJc1RbVXC
         zUeluHFndAheGUYhugAU0TMeSFpO8xg0BkF4ZW97G26XGPUlFAOQSjvyfQC4wuFT2hHe
         YvmBBF9wKfh7vX1IDIF30Vi0AL09h2b6JZDFmsi8R+5eidtkuYTqjeKtt9B8zEeiqADo
         48ZDOf+Cm9nU2TxlRgbkKPTWBABh9BSej9UqwRGGq88UvRyMc6ocdKAViSBX01puneNY
         G3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079354; x=1794684154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=qbAe7CdyNB8vrZQrim58oqFL9tkKNSBZiRhedZL6g9CVknggi0pAqjUH3CTRbu20CK
         ccK5yET2x1xRKJD0HbAbZOCo6zXmKOXzO+RmQQtD6iUGHndvamiQKFCuhjfVinAnw6cK
         1717Z77SPcmDj/KmEG4l4DpjujY7XCB1HVzHoT8NPtZYjpOkonokpox+gEEh1306Bs4M
         rv4P/vkrYGiQUGAmb24zkyuG2Yzxodmzh/AnjHV46f+zAoYpmRlwrd/uZepDvYQ2y8OA
         C8BEl/fgU6UWCHEz7CiBCU/K4wQg4Gsf3sdWso8n+/odO/KyP/b+l+dOxAWG6d5VSyiH
         C4yg==
X-Forwarded-Encrypted: i=1; AL+hErHJhknlmWhyFJddskjbxpo/w9lYxdvp16L4XqeIJaz8V9VFOEqwm4bT+Z3QtacR2OA62K7zWXSIFd8=@lists.infradead.org
X-Gm-Message-State: APuU4Z/cl1lyIO3NiOQ2NmR8mNUNqNaM0A3rL2gVjdzWgfmXGPa+ScgX
	ke5CnEucCemtTY9CzZ/2LFiuXNIhxW6qlfwkXSeW6XbPQr9F/EV00DVV
X-Gm-Gg: AYBFou3+sq0h2Bz003as1Bpf91EjdI7wujsQ2nwlq+A9iZxWjUpEW0tJ25zpukD/Pf5
	/lAh4+Fx8YahsglCZlrpcP2NFiQv2VI+emfihl8wiKk9yUWzcVRlUeAm+OduHzqVYyE8Q4cU/Hz
	8LJpK4FUuUJ7XLzTQS0GceIZSJCuhK3JXiOEXkxpppcuQb8UGswZXKXb/bGA7jx7ztdmUxQBQpE
	+nJBz5IT1fdfdiVRlwlG5a9uJSdwsDFuOOv9NyYbzLaDZNlRzRIktNwvYNWZ5XrQvNX6hRTNcdY
	EvowdokpWMNYvqHs26y8c1dINaBoTJGefJh6yTVdQDApy/eD66/fnPGBIR+U8FOZjlDBq1BHdVM
	I4rB8Nd7p+nrnREgBEFVfRKX8Xgmdn6Seh5inexsvKLlcjVrWzG7rhKMGU0h1s+Jvg+gb9hh4w2
	QXngFc2Yq6PYop2TbFJtf93oevtm8Q2d9mnCqZeYxnzthtiZ5mSzUARBZWy7MS/cCCbPofIkxxT
	RlG0crcUbAwtIRtWOiyCz+a+r+S6Lg/p54v9yUZFJ3B0EVfI6/3oxWulLxisfPZmIRytXAz8G5x
	Ma5qrJRUHb7GWCbGQScB/FWqm7yF/rKQCC0stku7Uqgs2tAHVTHQ75aSns+t8SqQ1NLMkd0f4o7
	OWEKWluEQ7KlETOELj9CawjdlwQAn1dC20qEMWqfxOSHM/2lnHsnhXze6lv9Oh4bi9oV6ifpfip
	LJqJt460ngtNGWGABh4+Pv7lhs0uxNapX158xwqQtHlWPDGFFCqyD6
X-Received: by 2002:a05:6870:b909:b0:49d:c800:c431 with SMTP id 586e51a60fabf-4adc0db6cc1mr1204864fac.28.1794079354066;
        Sat, 07 Nov 2026 11:22:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade647f559sm167644fac.2.2026.11.07.11.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:22:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:22 -0700
Subject: [PATCH 25/58] mtd: rawnand: hisi504: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-25-0181ef0cc4c8@gmail.com>
References: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v1?=
 =?utf-8?q?-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
In-Reply-To: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v?=
 =?utf-8?q?1-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
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
X-CRM114-CacheID: sfid-20261107_112237_705136_20E7EFD8 
X-CRM114-Status: GOOD (  15.91  )
X-Spam-Score: -0.3 (/)
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

Retain the host through its embedded legacy controller.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/hisi504_nand.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index d97270ec1185..36427a242c2b 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -731,6 +731,11 @@ static const struct nand_controller_ops hisi_nfc_controller_ops = {
 	.attach_chip = hisi_nfc_attach_chip,
 };
 
+static void hisi_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct hinfc_host, chip.legacy.dummy_controller));
+}
+
 static int hisi_nfc_probe(struct platform_device *pdev)
 {
 	int ret = 0, irq, max_chips = HINFC504_MAX_CHIP;
@@ -740,9 +745,14 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	struct mtd_info   *mtd;
 	struct device_node *np = dev->of_node;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	ret = devm_nand_controller_init(dev, chip->controller, hisi_nfc_release);
+	if (ret)
+		return ret;
 	host->dev = dev;
 
 	platform_set_drvdata(pdev, host);
@@ -788,10 +798,16 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -806,7 +822,8 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
