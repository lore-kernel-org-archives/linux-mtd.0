Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4860F606D819
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p8Oi5YV9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rvMGS3IaQiqsLV+OuVODEhDaeHn5Kcm9AcBr+ggTieI=; b=p8Oi5YV95wBlrz88133Kw9yqCY
	odS4w99SvtFPUNGkRrWW1YjwBv4/uml0+WelHrXs2ZhC8g+XNxbgLGJ8bN7qBPPrpia6NNffdxuPK
	STN0ATV+AZ4gmzPqgwIMNSH9DZ9ToZry68TjUte0/p/DLMZToaVGiqexHecbvK2bPvqBg3rP7Bi79
	owKoi12n3HDjlRzOmnxasS+/nXGOyWD/1jZQebXHa++1F1LBtOJtRM2PoKySD41n8JGmM1VR0Du4Y
	m+LBzz5QDb7YKm30jhvdkAQYUSWLsBYVq3zthPSMqFKVrsAjTYONbagwP4eJrcNrsjjFQuPDXHqRG
	mHW+If/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmo-0000000FHTJ-2f7w;
	Sat, 07 Nov 2026 20:13:14 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmme-0000000FH9C-3Eny
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:08 +0000
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53ec2cc397aso8783b6e.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 12:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082384; x=1794687184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCEPTuAB8BTrLNvcVsDlta09WPBy7nz8SllM0LSIn30=;
        b=wfQeRMI96eMpc8jx1gEG/9v+q3v9SvvpR97EC8QmfNHuEs1XufKc4nlUeW/12Hc5dp
         5XqA+gtEojTBp9VdY03tPnQC7gM1q4hcn8f36drNhxKPBLOMtx1FeB1XqrgZpxqJQphw
         8nCjplC9NooaIQzuffiMRfGw84D1HwSX/NT++5oBqqYaDlqco7JyZOXgtpuGNqRkmJ3m
         5dcvL9PTVIvadO8MR1Aia884fiZpGbwat68fMUagCdCOQTZekzM3tZHfZbmnQ9RgDGce
         r3GsaA13w5NVHC4Hb8lVSpVnICtqADy23RHMNLwBglBMeaRdk3F8OPdfWRUzQ4ZI9isn
         HGuw==
X-Forwarded-Encrypted: i=1; AKwUvBzPmfRxM9XBv8iey0saT5XAL4aTP9uhQnHvXRwVg6c+H4vUXlarvMpe92+e4KzNIs6YgLko/ZCuxh4=@lists.infradead.org
X-Gm-Message-State: APuU4Z8S+OdOhUV3qtX5bBUjuF9V/bIgKWQ/Yo/QogsMTLyxBWYbtnO1
	HlgRMhBV0pvwfOPDy1STTjzrOKL8YfiigBsjoT9iUxSgbQ1VktyaxVNF04LuQp4+h18=
X-Gm-Gg: AYBFou1LTmqbYoa3s0NJ9KlG2TDsYOnMtzm/qFoBz4GrlVB3rANMZaIDISATaFw0tlG
	H0c/bBVXlE8vxuFqVeYmTHmLyCsgtFNqQFkX3ZT408b7NbRVzhcXMLEtPwxGZs6tA95MOjL8kV+
	VmpFmdCt8tw/2l1+K2uExjo6Sm8EJGYro9Kj9eqohIctzbxUGX9pfsSs5CtKCLkbFc2Wlq5ABtN
	jJhSu6/W8oed39B6S7ti47NSPbIV0l8D8VUYFkx+SKeUf0RJisyluLT4E51Nib2HHy0TMi8WBos
	uoyj6YabvaRPfLofFB5OIpOwj0iXSNTkpTUyKldo0TNgrQLalhTlecWw2OgU/SCWNEGCits9hE9
	+/MoxE7mxKA29fzA2xP9T7+iaQ2XOLjkOYrNbyng0kfQxJdm9dx/90vH1F535MNp3LpOn3UtnNc
	6WfMMovEzcnplkND3BkLyidM+jWSWhd+JWmXpRcqJtPpkt5YUN69yqtxRq+A+ncDYGbcd0hz4MZ
	gkriwg/SH8uwnmBj/YD/T80vdmQI1VcVk+mGnLDEqw59Mau7wpbQMMiifMyXh1T1or5ubAwgFpB
	6ZHtLQIgIJoTdNr9bZwc/MCGa1sJHzf60eHiPCJ8j0slUM9vyAXk3HVkLC1A
X-Received: by 2002:a05:6808:238c:b0:4f1:c824:fd06 with SMTP id 5614622812f47-567e14c28c5mr4851806b6e.14.1794082383637;
        Sat, 07 Nov 2026 12:13:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:28 -0700
Subject: [PATCH 31/58] mtd: rawnand: mxc: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-31-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_121305_021848_88D2C684 
X-CRM114-Status: GOOD (  18.92  )
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

Retain the embedded legacy controller and drain I/O before clock
disable.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 4d8b92e7e672..d9f1e57c1ebf 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1686,6 +1686,11 @@ static const struct nand_controller_ops mxcnd_controller_ops = {
 	.exec_op = mxcnd_exec_op,
 };
 
+static void mxcnd_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mxc_nand_host, nand.legacy.dummy_controller));
+}
+
 static int mxcnd_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
@@ -1694,10 +1699,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	host = devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host),
-			GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	this = &host->nand;
+	this->controller = &this->legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, this->controller, mxcnd_release);
+	if (err)
+		return err;
 
 	/* allocate a temporary buffer for the nand_scan_ident() */
 	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);
@@ -1796,9 +1805,15 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto escan;
+	}
 
 	platform_set_drvdata(pdev, host);
 
@@ -1821,9 +1836,10 @@ static void mxcnd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver mxcnd_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
