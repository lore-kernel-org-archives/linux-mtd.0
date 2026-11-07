Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBE8606A331
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 10:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WOdEB8Me;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qt3eUhKZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6hMGGdC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+45Glad0K/8uADb7oqi4orNKJdS1EjzVqGXRVwKpsHY=; b=WOdEB8MeVls/RN7TJf50uXs4IK
	qXrdsf8sGsTI1agxBoa2ik7f/6sV8mJQramYq9V9voZpqO/BcybiQHN2fxJf/otjaebzP8vf1KStJ
	cjf8pujXii3l/IyrjdsxTgV+O7QvOCFR9kypblrkuMUC/2fjXTfdcZ4k82UvhR3xDyY0GmMjwOHIl
	2rTLwG0TjqOI9IvjUd7E4QJDOWVUDuiNEpWhVceamYORI/2lo9c5bq97kbsAjJ5CojoMfoq1VpqQ0
	oECRiiSNW6O3A8XZFQvHHquZ+G1of6Avvza9HPocXIclgPGjGACusnk7ITjSzg2uSvwsEWzZsz0Ur
	In7v9r3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdVY-0000000EVYT-3Skz;
	Sat, 07 Nov 2026 10:18:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUQ-0000000EUL1-1yK1
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PzgbI8X4Voq5iI6HG1dOPbCOfJ17p492ut7p3i4sm7o=; b=qt3eUhKZydZ6ZzS7Sy8zXuBgOv
	GDT6Qk1J8H4Gv+Mc4X6S1RfSVdGVpsRJKjwIB1aFAup3HgItvDEYbZeKy+fwCi7UBkZWkXQOXF2fl
	Bje8L0WKFL+F3H4UYfD1ytpJWTdK/nUf+tTUos4BoSSNYk3lEPnsjQVGa4qJRoOEE94c8cg06+KB6
	aEfLKrp41hEX8LkUumUw8fqwPJfrHSbAh8/k3PHsWAIWr7yRwp0f+9AKBkyYGWS7drHBfrgXazzBP
	m+DrTRTPSNAAxMuWqB2ycHdRNYTA92ZTp68Z0TKCgwkZRcYfin0Vcbq3+8++CiqnBpitW2il5gvBH
	2htyzWEQ==;
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUN-00000005855-15FH
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:37 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-85d363fb73cso858912a34.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 02:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046653; x=1794651453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzgbI8X4Voq5iI6HG1dOPbCOfJ17p492ut7p3i4sm7o=;
        b=y6hMGGdCWyr6l2K9xeZLGjVrcSrZFfdTYysTwllKj5dty3YtqN5gLNgb2G96gfAq4Z
         /KOJlaOMrtjuK0YmndV4FizEMeo9aacYCcc4A7vV0JbRv5GzTXR2Ezr+uiclPBpQ62xf
         qTV0FrerBYT/tlfnvoUoYsn1oMmX+/jVXQNTCbxBRvI0H6qyjJtL6qmCJnVKrNxdQG3/
         +li8hPmU8rbpRHxH6RsULM+rnVJdT5fFdYJFQrafLua/8d/tMIEUNoywZo/bkoTHN3q2
         TUMmSfNHOgRjQDdDygJH7nAoQBWkIpOWFzzASoC6U/wWJ0nuXx9xPMoRKPWyPxE5CZ+i
         W5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046653; x=1794651453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzgbI8X4Voq5iI6HG1dOPbCOfJ17p492ut7p3i4sm7o=;
        b=SlgtIxEHoO7th71oiru3CYiM8ST/Tw+SB7oB+iFD8fTiOWXkUOds0Lec9n+Tkln6TC
         CERFnacsUczltOpQZnqJj/7wASW0wlwbnIlfnLZYsD39aqXqFs4+lNL4VXX1UTdt8mlI
         O10KX12150/t4Ol/avPjI9xN9ISvxnSXwBgpUoOvrAkM/nN+PdVVjlJgw/f9CG8udZ6b
         UQNE+SSO9Jfz4Jy4GCmPZ/5pzuCIZguKhdfOlogVkKzKeHgOS/y51ypnZKg+Cn61HcVk
         qceMQu6ZF7C1gBBY6Idw8HvHFqAeLRra433N7gG7Hv5JsjTrdP5WL+b/6qQpsxqK0bCi
         vITA==
X-Forwarded-Encrypted: i=1; AKwUvBx2prRAm6NFZHM22wohNkllrHBljNWdG3KnJSCbThPtZB6rucoeGIsh+6I8+kyYcGN8kuHCIQ1nP78=@lists.infradead.org
X-Gm-Message-State: APuU4Z8WFWzpFOUD6Vz5W/p86p7D5dVAd7K3zRTe/5KqrZGaLnqWwOAQ
	pnD2co6vNWpY9Law5PRdswtjmnlzUaRfeU+2mbY4QSTtJuMOMDlFuXI6
X-Gm-Gg: AYBFou3WemHpfVH0U9iTpkUo+G6E467wU8QSvnjXhjaQht/79GPrVd5gKKJ717PkXQW
	8hpo6rPwDVGCkPC9rn1/X2SVbKi4wKcGo+b6ASDCMG4s4CnPoSwaVwRQQ00W9yY/iINmdNmcin4
	h+dU4ChJBEcFDZiDMzS2nItXJnv7bGu1H9K62FTNAB2Ee3wl5SXFaMOiwGv0H95RZ8wbSKGWsFN
	5pMZQOjaHI/OeE39cjfkerreVX3zNHjJk7T04GRIe0v2aRo7bty4Gxl9rFXo7Nt7uSbIAt4xrU1
	e1y0n8hX5gDowmMoqqgg/Nokgo5rRt35JOxUsFzLDhvNPs+XMHAmFcMqmKG1nk5xJmGNWm0y4SU
	8gt6GYUmWLKCkllRbeIzfnL2SeFl0E/cCrnL6bVjH43eEoyJtEAhBEHdet37cdPII9s6uT47f0h
	De8ouTaBU3d7GEUr77ftLJBTo5ZUzcTPFqaykwATtOChKSoX/rUWXeSaIdV977PMrfCpgtu4thb
	mihGm50GAF1cDj060PtxoXEyDwFiJbqz6tGSYWNSky7A56WnunLZvaVSS+g/DrYtr9I9uOAXjIS
	pRTYu9esoOSz8xY2zYwk7o52qLrf33HCOVDF+PAuU+u39wiV/nlfekBwKoD4A0WA+D4+zxPzUxi
	Ocphwkqb8gis2L0aOauIOd9Tdr3xQ1jV4mDepNz2O+sz8kO0zTweyJWMyOI6Wu+FFcFDsGi/pAY
	VaGFpVaqchUoz4SFP7Iwh1MBymu5TZIk/JABb0mG4aXu9SX6WygDvMJL47fztTSe1umw2WhQtaR
	g==
X-Received: by 2002:a05:6830:2306:b0:81c:5aac:798a with SMTP id 46e09a7af769-85f1d000dcamr4738701a34.13.1794046653358;
        Sat, 07 Nov 2026 02:17:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:21 -0700
Subject: [PATCH 24/58] mtd: rawnand: xway: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-24-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101735_163899_2A07DEAD 
X-CRM114-Status: GOOD (  20.48  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded controller and chip across platform-device removal.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/xway_nand.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index af84395dc66e..4686f28797bc 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -8,6 +8,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include <lantiq_soc.h>
 
@@ -162,6 +163,11 @@ static const struct nand_controller_ops xway_nand_ops = {
 /*
  * Probe for the NAND device.
  */
+static void xway_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct xway_nand_data, controller));
+}
+
 static int xway_nand_probe(struct platform_device *pdev)
 {
 	struct xway_nand_data *data;
@@ -171,10 +177,12 @@ static int xway_nand_probe(struct platform_device *pdev)
 	u32 cs_flag = 0;
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct xway_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, xway_nand_release);
+	if (err)
+		return err;
 
 	data->nandaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->nandaddr))
@@ -192,7 +200,6 @@ static int xway_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.read_byte = xway_read_byte;
 	data->chip.legacy.chip_delay = 30;
 
-	nand_controller_init(&data->controller);
 	data->controller.ops = &xway_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -228,9 +235,16 @@ static int xway_nand_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	err = nand_set_release(&data->chip, NULL);
+	if (err) {
 		nand_cleanup(&data->chip);
+		return err;
+	}
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+	}
 
 	return err;
 }
@@ -246,7 +260,8 @@ static void xway_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id xway_nand_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
