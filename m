Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B85C606D83B
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DQuvZDGo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=k9x7h5kJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YnRecl18v/TMPv69c0hs67JaBZhHtlAkZlVmd8Fh02E=; b=DQuvZDGovOsiW+9u9dSWDrJhbH
	vQqsURdU1l7l53KIRBW5KX3CeKo3Z88q7lMtnCLTYzuKUyspanQ7Jp00Mry5veyqFORU/aVN3vaoM
	4B8GQ9HRzjMXJ2+3+LfxNRDcIYtVrFa+3edMRYBvYAWmri+XM/7baSKq66ctiTBT/EAL+5adW6MJm
	K8ma2lCB42YrVQhpNwC4cuWCCqb3TkeqlPpuEpxJzQcjY8h51L+/jvL++yUA9CJFEQhaxDtzseBQd
	m2p0OEaYj+bMmux9hPQFaIU8/HG6d4zH/IS6mlRS5yp1ECyfmg5Fd4XXNLP/hG6LbUC5UwXHjoHVT
	DnhQbx0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmq-0000000FHXN-2CRy;
	Sat, 07 Nov 2026 20:13:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmm-0000000FHNX-0gnf
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Y022+nlY6fsxp9yeExqcFOZHpsByokSnlDdM4w3Us8I=; b=k9x7h5kJx+1KmsxQaC1BG3T1KA
	ioauMMATBg9i52x5Q+UMjkMjKzNXGum8eL9H1JAUgnq2sJU+iPp4Fk6r0CTevWk9g3mUcSI9GNIoA
	i8AQ7PVYWAZHQGLMvRFexyQr4G9n/2S5AXeZgEFtMrQJfK/RVLBNhgKZYp0Cg8NO37aa0SU2iHhSB
	eMsANu4zg9nUKaP1RFtZuAp1hcv7uulLTr46YbJWhiVSUkj7QZ53Nop7DTBDeMZ68z6ck3u/U2WXH
	YWywZWPjvnRcJO3bQoWAFjJRhLBSNu8u/yGu/J0V8u/psL1rvAfGLbI1ZnFWZl2q7oq/SvqT8oN3C
	zTTnAqgw==;
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmj-00000005QMn-1glo
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:10 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-46556b9e02cso12561fac.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 12:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082387; x=1794687187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y022+nlY6fsxp9yeExqcFOZHpsByokSnlDdM4w3Us8I=;
        b=zRKsttDG/yNXPqSy68rCZ8d6UOU1Z+ANXNDmo6eoK5LEEzpouXi8pFN8v5rlrEPmwY
         4kFTQ+wM5oka3iUiug6FkrBgnah0xUmdUYdyx5UzhSZ91CwGWlaBHF8aS8pwiAtZo68o
         Byg7QJcvKLwS0mP4GJHBPtDZAVhuhAog6BWV/VAhm4ohIc7eVptjwNwPAI3hrHaccy5D
         vHYqHe49HA5NXa1Vvid6DL0yW4vEE1G3O5kc2CYZLZmMgGkNCjyZvBkETuKB5ZTnUKFy
         yOBJhpL4B0ICMst7pwt6ZxNEkbISPNFt/Hs02gdqvZcJWZu0Rl3S1Gzj90jtAPOVXL9R
         A0cw==
X-Forwarded-Encrypted: i=1; AL+hErHGh53lBTK94ojeOtmuhXQITmi21d9XRB6sgSk+Tz/pIKuhhNL2O41Dc2KNvc0JV3q52hw2Gotu9YY=@lists.infradead.org
X-Gm-Message-State: APuU4Z9StM+6nKanjhSj4ogt5MiZXYF8AfhsDx0Hm0tFKNT5c92340HP
	jyW8J2qU6MYvWporYku0Pfe4Xfy9FQ3Tf/Ozp3qOyzUPdATihfWLhWYTv1gDNtG3uWs=
X-Gm-Gg: AYBFou3P7hdEXe3K9HF+W03rbQVbdM63vwDBNKlefxrKQKJO9HcMUmuKNiFAon36+bs
	G3Z7LZSEDuMtI4FsrpFJzZXUgLtAlF2jFlQcFD3kJ1S0n10XL/rasdvj0rkmKyrsfkhDIKYJS/Y
	/wPNXZMHhutvpKn+KDTniz17xEQCi+HuV3JZxItMqHfxrDg52pOTUJVib09S+H6+T63+90TER7V
	v7y4X4WhMqEinD/ohCU3CBu7IT5wvD9ZLk32GQI/sglIpjN1zsOzXCnRn/dN1Y1y/rZp4DKR0Yc
	LjjjIQcT/QyxMMg7UcYW4IanLReJTYTWwdqK4QMrpWs9srRGmtItbdSy72V9MPCvr/HKlTSNkI0
	ClWXUmG2fGzbtdCUkwu2eyYr3pTLXbBiHT3fMCKCg+PtLL2usjmqCkTjxyIk57CTl7nJvyC/Fxg
	ST0Larfa0QDwyDtPNJHLaTJG3gkhgbQqUyztBHgkqaRT6c5N22cCll38A4smZLHu3GC16EANtmF
	VALwYC+TFdQe7UXfsevEI47i4RynXv2eSxnbHynP0ZarLcFMl6DwnmAH7u9e2nWhpyc3i6VepYB
	DfedN0knzBt8b5EZC47A2dYPg3MAlLns/CVzv1a+wuA4KjOvpXmjds6P+Vg4
X-Received: by 2002:a05:6870:5b99:b0:470:e96b:43e5 with SMTP id 586e51a60fabf-4adc0c230famr1253184fac.17.1794082387495;
        Sat, 07 Nov 2026 12:13:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:29 -0700
Subject: [PATCH 32/58] mtd: rawnand: fsmc: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-32-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_201309_406301_0F778EE6 
X-CRM114-Status: GOOD (  17.75  )
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

Disconnect before controller disable and DMA channel release.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 0b1817cdfc5a..ef0738c4cca1 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1024,6 +1024,11 @@ static void fsmc_nand_disable(struct fsmc_nand_data *host)
  * fsmc_nand_probe - Probe function
  * @pdev:       platform device structure
  */
+static void fsmc_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct fsmc_nand_data, base));
+}
+
 static int __init fsmc_nand_probe(struct platform_device *pdev)
 {
 	struct fsmc_nand_data *host;
@@ -1037,9 +1042,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	int i;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &host->base, fsmc_nand_release);
+	if (ret)
+		return ret;
 
 	nand = &host->nand;
 
@@ -1128,7 +1136,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		nand->options |= NAND_KEEP_TIMINGS;
 	}
 
-	nand_controller_init(&host->base);
 	host->base.ops = &fsmc_nand_controller_ops;
 	nand->controller = &host->base;
 
@@ -1140,9 +1147,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		goto release_dma_write_chan;
 
 	mtd->name = "nand";
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto release_dma_write_chan;
+	}
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
@@ -1176,13 +1189,14 @@ static void fsmc_nand_remove(struct platform_device *pdev)
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		fsmc_nand_disable(host);
 
 		if (host->mode == USE_DMA_ACCESS) {
 			dma_release_channel(host->write_dma_chan);
 			dma_release_channel(host->read_dma_chan);
 		}
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
