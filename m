Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6867606A32D
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 10:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=20iW2Wfv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=iAQUBlVm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RRa9PRG2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iaxBpNUYMKSDo8dqWwj7SpxBWz0d2tJ1QAxKkdDgc8w=; b=20iW2WfvZfHD3gsm6ytFo5RDsH
	GgjFGsaW5IQC0muG7bcElmsZ0dtmMSrBoUNNVq2dJ+tXfuo2xhsvGXoWF9DlV4xbnGRJHohZ+t7wu
	m3wzkIJ54OOI/XvHuWAfgMacGP4BNn672LKOvkrAJtp0vl2mX2lOwVjDaMsUS4vZYNz4lDWo83R47
	K/Ad5YnDlKIh+v9GNWoYXBTp/HAp3uIqRXcK7qHac72GOpcttAmupNF7SY+J0TcISX17nhMtqRxen
	XpQcQi1oXF5lPgqR1IRTV4yXtck41QIca4G1Vy1vl/8XgRBHO3Q05KiGJ+DZ14Zg5Fm0VmPLVHe3S
	c2aO6Pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdV7-0000000EV1r-0O9h;
	Sat, 07 Nov 2026 10:18:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUF-0000000EU3P-189A
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=; b=iAQUBlVm7GjBE6wukHNjowH8LV
	POf0SMLy8ydMI6hRdWZu8u786iCfxJDz3uI0Yh3+l7rGh3M4FrdolUw6eGEvh1cQh7e11+p25sOhW
	so0DSjDZmTMi5Tao3yGje4XaBV4DX1sMQuG5rsZw77VV+/fJ3Kg9BGZ9n2Qx1YvBTsRKB2VFqQNit
	pnyo7KJVI/ViEdNDcEeLbyE5D/fukpivPfDY5fOes+FnX4gPK3+ini+XSjxajsNcmTf4zLKZ//mZc
	qwXjGcQQ2o00pIKQsyyoj/2iQjC5OwP2QX0rPpnbdcOEUDQcfH5JYJw1jpB2OyPZeA4fbTGuCNH1M
	ec3vlbMg==;
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUB-000000057xa-2jYe
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:25 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-833e671ee9fso1573744a34.0
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 02:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046642; x=1794651442; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
        b=RRa9PRG27WU59oh7LfcNJATeay2+r5TuQXVOqLAlh9oGgecQ6DqFJGQ8myeF042hh7
         ssWhKPXRnp04hocqlAKGaOdkKWBXVBSMqHzV8tT0Tdu7hkDNipmY4ocRdn7PvDYs16cm
         uZyfmu0bMTe4BTyWM9ncqhZkeT9yXMkAMGTcvmAuOVFhnVWojG9J9XIHGlW0Gqw/pgXx
         ur8mXK1s3vjbGN/xB9CGDZqqpvXjVDRBXdQyC/4PS3Dh1K9yyojBnMq8KqX0gVsKo0BQ
         aWU7zsQFYqZiZGWOLzn8louu+B9RpDfu47aRcFYtzA4a17wAbp2y5I1CwYuxMO4nVYy5
         uZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046642; x=1794651442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
        b=HtCfV4l6zQEqp3lAZjlwlHPacnCA8OI7FUsIgqqrh+fQxL+GFWe8tBjuBZ6KnyedsL
         cagR2ozpJ4QD3Q7PrLTtG4HEgFpiWjPWc8qLnar0UOzZLr7+QGOTILD0D1T5vYhiOrMA
         UibD/RMGv13vIabDNEo6wRih367R9PLjWns7mHm1bAmNTt/epLiMUmmDAfhDGxshlQi9
         A7vFO9wTNhawEKB+Dnlrngv8FSLLwgiXj7F723vDmQQRsfZEc2fJKtlfpsYddO1Afxr9
         kvIS24tpR/SO82PCNdxm2C/TfE4wmH+k7eIz0FjxDPk+09e1/d4loo9ciwE8D9AtV+aQ
         80ow==
X-Forwarded-Encrypted: i=1; AKwUvBweWnTALdTW0Y3K4JVp+365GZRnOt+qwn3ROu0qvAnOO+Y/KJRd0jCacdR8hi9ujLXi3CzMejhqJ2Q=@lists.infradead.org
X-Gm-Message-State: APuU4Z9bpxnN7Z2Wz6MMjNahAYvOhBJ8sQb7EJACnvfM4AGSPD3rETDl
	4AydoOe1//rJcOuWxqLgaV1LCxRtKtreZb7RsJjUjZ2nFHyP6GNkJSrn
X-Gm-Gg: AYBFou06K8xq4/m4a9WRQuvVcJVmCVG21Gp9TgL7gkYsOyyEvplhvieSK2oLL5YztQb
	Qu8aREDy396S/fjEaBGFiTJFWaoKDB1d66aERqDBqtSs1MXlQfy8GljsgnjL+tk60v33uURt0ol
	+GY0I9ek9YQ2ysuQgTVGswSjY0oy4IiK7KN8NgZbBO42cEKP+iwcsY9Z7eydPTlLITTQlDwHdP4
	VDM9Hao+bUxczMDbxijGPVg49w+1FA5u0gHL+6vAba28LLJzxByKe97LP4aHP3RTBoYMHgST4E/
	Sn+rp+CTJ4QoHSa0xHA9ggIMiOwoz8Ezsz/iEeyLMZcKdV1/lWakpguy4r4ZiQD9NFQlYuA5sFj
	jznW5pTbes4JQ5m5BKtJrJAgt9lItO+4EJpZIu7Kkxua9PR3U/mQWepMW8vVnwqUEhEyOCMbJFF
	kBy2t3xyL4a4V9Z386/YJBeBCz1GGx2jG92d4fJhEq+WKc8h6xnBB8+Y9NWl6hVA/ZJ3Zp8Nlo3
	OAs6pMujYwiGLaVQBuyaXkVs8sIoDAT8oFnBu6akeC9EL/gCX3akYfXSyzFinmn0UKltGQ8n1RA
	23y4SJ6NZE/ktqHVtfltrGIS8FrAm5cddWztz9K8Nxivx3TpNHED1VqqnkhTEb0hnV25uaNpd8N
	4MXJOIF+FSpQfoJLNCGYhJAc7Qlu5n7V3jW+JUgAjX6vsYF4lAFcTd2R+9KSNLRLqdRh79H4DvA
	2g+jf6EhFhLA1gZFSpgckHtxb+v059fVLu2WK9sahSqyGhkqUuH/83bP97stzGiSknPIWMyxnf0
	A==
X-Received: by 2002:a05:6830:258f:b0:85f:33c2:c863 with SMTP id 46e09a7af769-85f33c2f865mr1221076a34.14.1794046641843;
        Sat, 07 Nov 2026 02:17:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:17 -0700
Subject: [PATCH 20/58] mtd: rawnand: socrates: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-20-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101723_633237_6D926F49 
X-CRM114-Status: GOOD (  18.89  )
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

Drain operations before unmapping the FPGA registers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/socrates_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 668584683ce5..508e3afac4f2 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -134,6 +134,11 @@ static const struct nand_controller_ops socrates_ops = {
 /*
  * Probe for the NAND device.
  */
+static void socrates_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct socrates_nand_host, controller));
+}
+
 static int socrates_nand_probe(struct platform_device *ofdev)
 {
 	struct socrates_nand_host *host;
@@ -142,9 +147,12 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&ofdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	res = devm_nand_controller_init(&ofdev->dev, &host->controller, socrates_nand_release);
+	if (res)
+		return res;
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
@@ -156,7 +164,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd = nand_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
-	nand_controller_init(&host->controller);
 	host->controller.ops = &socrates_ops;
 	nand_chip->controller = &host->controller;
 
@@ -188,11 +195,17 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	if (res)
 		goto out;
 
+	res = nand_set_release(nand_chip, NULL);
+	if (res) {
+		nand_cleanup(nand_chip);
+		goto out;
+	}
 	res = mtd_device_register(mtd, NULL, 0);
 	if (!res)
 		return res;
 
-	nand_cleanup(nand_chip);
+	nand_disconnect(nand_chip);
+	mtd_put_master(mtd);
 
 out:
 	iounmap(host->io_base);
@@ -210,9 +223,10 @@ static void socrates_nand_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(host->io_base);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id socrates_nand_match[] =

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
