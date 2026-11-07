Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999496082BD5
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UqJwg+q9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=biICEFDz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOIlu7SY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xNB4POs5V2oszl4b2eM0aeLM4zkPChq+jGEgv0/EOEs=; b=UqJwg+q9p/kE0MRxJCNNydbRwa
	mdjUsz+TsnmCbpVppeLNmPCPQyWETDO9aQN5KWpdlyfmNHNx+y44lLF/Nw3EVxGgc1SLTUgROcrvr
	oMjPR049/OYWfZG01PR3ogQlLZLCWZ+ZcqUkcGgcKyGGezcaolTzRW/CzEgAHvmBkvyHuMWXjklxo
	WAQWAdnxJ/hcoD+ZjoeFVd7C42Rsq7tzBW1tm8rYt9NUrJxEncQwebu3vbsRYI4jxUQzAUEO8TaLm
	BX/DwuFHlM/0zoJWJ66X5jfjYvvB/8N2tDursUrQSmdSpgjdSXd3fJzeG+sUf3RkJ7GXzkCJoJxv0
	/f90PcqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUb-0000000EUYg-0ZLU;
	Sat, 07 Nov 2026 10:17:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTy-0000000EThf-0DqS
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+RzOOyuPwyKab2kn/5pQ3MzZ6HwvzC6fgSV0cFeXekc=; b=biICEFDzD2L9LHE3YWg1RNPCeN
	93y96wANPRN2d+HDEh3YsJu6Etq7q5+rn+7vqWNZtqLdvisYjL6Md9JOjTdLIpTHD5BT2dF4mfaKG
	UhIKqHEURJAFv7D/Wsg/KQTkVK7RaKdyFTOwiKbqWqbsmxDR47PIBqtd2zot1+p3iXg9nKPWDwCln
	RwMi6rNpTMTuOOMG16DfbQfzSKy2yicB8jNllPe0A+oa+74/ZHjB0Tt5a3sp8zdnOw4Xj3W+h9hLa
	4C6CKPLGs2SxKJLp6tgbXsNog1FYHTdDQdb8EA6u5EAcnyKecBnXKXD/SsRTNOMSND2QjNoiNkZJH
	mlhpP9Sg==;
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTr-000000057m4-3pGG
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:08 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-85d363fb73cso858808a34.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 02:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046622; x=1794651422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RzOOyuPwyKab2kn/5pQ3MzZ6HwvzC6fgSV0cFeXekc=;
        b=QOIlu7SYcCLM24VsWGcYnysTAg8cGYuZrVClhlwjQ9DE/ckiMMRpjjUtqvyusr07QE
         5XLYoNd4wLYWZuSymfjR62JWVeN6mwJljdzJBqy0qA0JRD5kYAJL19oPWKfZaUCPziao
         0iM+Psqbxs/ltq2Hnwp96b/nKItY2iTqK1NgJx8hOTiB3IDDDvGLbgUZMl1l1KQ5ajZa
         /9TXgb6FYYjE9kjbR936eunNnjoJLzHRlX1UcyYFHcQ0ZIbW6AJ/RI34lvaIQrXHN+Kh
         pL0lsrQXpKjMC/5Q/MaJKrDGDySqBbWe2Hx+GBt4qJATDqHz3NlxDr3dxwhy04dtkQ3o
         NMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046622; x=1794651422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RzOOyuPwyKab2kn/5pQ3MzZ6HwvzC6fgSV0cFeXekc=;
        b=kilppTGxPoxayGKfBJsb7jR4rEk9FXhkGcqXD5kRwSKJaq3WyxnCGMrcI7HpSoZ5zV
         EwdwtHJJ9abnVwnF9QNfAYjaJhBBKW90Q4hs08JDpD+Bcy4Xu5X8GvAxmTKI1Ea59sue
         ZY8RqfasvAiEnDCJ9WznMwOI193Fajgug4mwxsvlJvtraNUWy0kvWQLkf6IjCy0zmX/3
         0/ZxADKEAXVoz3nRJ32CUxnYFtEib01Ox56bVov4HNJsPRCivsOu3+Sh+BOjxASmfFr+
         P3yori4NlGoCXXBG09HMuxJ7QvbTXJznQ3YjRWZlYZqOfX3BQkqjFmaPkWCdoCNX/V28
         cXHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRAEcT2akGD0k0E6FqZwzEniHdVXDOuExEhvTX2BqV938O0F0EllHE+iurTTp+T6WFuWmH/PZdgPk=@lists.infradead.org
X-Gm-Message-State: APuU4Z8Fyi29aHTp/no1NtxLMDwQIhpsohfeYfEPZLzgieAZ1FFbJ177
	+LaWeknsN1YR4WO4dTbNiWb1tlAOkycUa/HeYuU/ZbHVCfc4kjqV4Y0b
X-Gm-Gg: AYBFou1sKXg7wZrvaPzOjkEsYoe6xWJh5vRyv+4cCJsk4D5TVlRAMWCnUxP6bxupeV2
	2baXExBqHc0h5LSdyfXHOSacwPNTEq8DjGp94MlXx1SzDEkxjL/0uLUO68ESHsyeQRp5W1C1ekm
	C9dX7yUjxMJXWabaa2Z8I/2YkF1mMJWjXB7P+qisay6X3q3i/sauh2gmPQ6QIlBlaTBt/YDHhWo
	TUwEgjZQNEPX9GAYQTPrA0F2eE61AKqfl+euCwsQkdz4LFcsM8to7rAGuYCqzjwl36KbIMX586W
	aJ4zVE1icHJZvjP2Dr/7jSOygbWygIPaxjxBDIZLMboJqueYgEr6umo1kPDB7BVd4U5dxy3kR4+
	rT9vycyU/cjpDkt+vhMB7ZvDWfzt46kwiBhhNcAJLqe5l+/ApcfEz1g7Y+chsuVKxWGu/SLD+ik
	72ikXCY6b+awX11i1WZHUNJin4zfCRVVW85VC5CE+zcyCl7xEI0DRU1GnQ/wxDJ8SThqsEy9Dr7
	6l5z/G5kilAeHHtl7/b+d8UhgC3sQ8wc21z9bn2342Gp91GneMULuXxsopJ7TawQSa/aTsalH7H
	n8GcQcAuzyKfH60fGLOPNBQv7I8QnfaA8iTimkhTaVDDDxTleYZQ8fDWjU6Hf9OVzPRwhjIdVX7
	gb/X0GUwzAoA9eT4MwSXrebqTdRRpM+JBWs1NrCdBwvhO6viye476aJE1RYshvFQqq0mzffrLyf
	d58e1MccucQ/AUGv93NL6G/X/04FXWAr1zKr/d5ebnOPiTfmCO7tzS
X-Received: by 2002:a05:6830:2641:b0:826:b77:adef with SMTP id 46e09a7af769-85f1d00201dmr4359887a34.14.1794046621892;
        Sat, 07 Nov 2026 02:17:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:10 -0700
Subject: [PATCH 13/58] mtd: rawnand: mxic: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-13-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101703_988895_AAC1C603 
X-CRM114-Status: GOOD (  18.09  )
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

A retained MTD handle must not access controller storage freed by
unbind. Disconnect NAND operations before disabling clocks and defer
NAND metadata and controller storage cleanup until the final MTD
reference.

Release scanned NAND metadata on registration failure as well, using
retained ownership once publication has been attempted.

Fixes: 738b0ca55f4f ("mtd: rawnand: Add Macronix raw NAND controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxic_nand.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index 92de26697359..0d20e6ba76a2 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -15,6 +15,7 @@
 #include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "internals.h"
 
@@ -483,6 +484,11 @@ static const struct nand_controller_ops mxic_nand_controller_ops = {
 	.setup_interface = mxic_nfc_setup_interface,
 };
 
+static void mxic_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mxic_nand_ctlr, controller));
+}
+
 static int mxic_nfc_probe(struct platform_device *pdev)
 {
 	struct device_node *nand_np, *np = pdev->dev.of_node;
@@ -492,10 +498,12 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct mxic_nand_ctlr),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->controller, mxic_nfc_release);
+	if (err)
+		return err;
 
 	nfc->ps_clk = devm_clk_get(&pdev->dev, "ps");
 	if (IS_ERR(nfc->ps_clk))
@@ -523,7 +531,6 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	nand_chip->priv = nfc;
 	nfc->dev = &pdev->dev;
 	nfc->controller.ops = &mxic_nand_controller_ops;
-	nand_controller_init(&nfc->controller);
 	nand_chip->controller = &nfc->controller;
 
 	irq = platform_get_irq(pdev, 0);
@@ -541,9 +548,17 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	if (err)
 		goto fail;
 
+	err = nand_set_release(nand_chip, NULL);
+	if (err) {
+		nand_cleanup(nand_chip);
+		goto fail;
+	}
 	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
 		goto fail;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 	return 0;
@@ -561,9 +576,10 @@ static void mxic_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	mxic_nfc_clk_disable(nfc);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id mxic_nfc_of_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
