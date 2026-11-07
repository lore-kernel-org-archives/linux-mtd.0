Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AE4606A336
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RkpMQniR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EoaNDhaj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C6IRQfRIdNlop1maIeDpvLOwNHyc12Etqu1fO3rBPf8=; b=RkpMQniR3Q+wyIhwGfa+iHqY/j
	yy9ULWjN2Etm7OJya3L61rOC3VgM37evSqu9lOGV5NRkI/SIitGqZIJb7TGXoVk+sPCRLQ6PxZ3Vy
	D2vsU5G53CIXA7tMl6HDfmH+E5BS9UpFWS17niwWravjaRUBu1zRxYcpMBE50tbPl3t1ZiefUDp5x
	xd1YguLqH8G122coVNcrHNnpjSj6LPatBFVheA6HoE2xGwcJ0BesEwOYITj/DsK2kZK3Uv9TU8nVV
	Q3Ag1dblz91kSMbnxvTtDD4fxGZrKfO8OAJ6FWKxNA9dQppaYpIeIvOCHAS9QJgPh2h9uhKbh0GdX
	16MsJtZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnH-0000000FIQY-3cuN;
	Sat, 07 Nov 2026 20:13:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnA-0000000FIBI-23xB
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Y7c6OOYT+qEeDVQYiysesbJy0c+qB96uscD707pwGC0=; b=EoaNDhajMMkM+3EBcdJU65ROdt
	K7Kgw/PYnMX0oO/x6FtPEq7NUE/NY7XS3D6YTRRawojqf83ZNvHClGTm/gujRN9B7Jp8B3Xc4c8QR
	C2uhdh+EwK7o0ZUtF0swEipCutYbvgcyKUmajIfwpVXuBsaA3gdc5F2UBn1ZP9pn7sxYj2KBn/zmf
	sNyBOp5jEnUuoqazC4WQYSBHk0cONtzrINrS+uAS0fkwAPdJl3sb8k0WxPPTIR4xksqHFkBJVu6aL
	cp+bP/ySL7NX4j1A5a8eaEe+KD7hqM1VVg7JfJwnLMk1LA5DWaZMRoHUrc1mdKgxPqFWjocWDTSPE
	+FIxYpJg==;
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmn6-00000005Qbk-2WkL
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:35 +0000
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-53ec9237600so3413b6e.3
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 12:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082411; x=1794687211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7c6OOYT+qEeDVQYiysesbJy0c+qB96uscD707pwGC0=;
        b=KX9sIJQYVHJXT+M3LskO+91xjuC84ByMJH6mh86pj9lNxJyhKgWVYagxdJPqt5LQ8B
         8oOusI/FHEBAPB9Tb7GSo8x0d3iULFKdLx3oUUTxmONI0fPq6574uiEfZu1qqONDMR9a
         aVu0GQrYGbdO9x3/ZWJ4679obnBvu8n2rosYXlDQ41ofdUpLq9OQoQuWt7tSAW9IjodT
         2JtH7rGfrTM/d1XpwUIFErb65TfOhvVLmV38Viu/Hd5SLBefMJxW+/lWmY9tWXxzRcJu
         kl2suQ+BsU4AvzJQspNivrsmt1QoiojdEN/lJzbSzGuYkYGE2uQOoF2V7Lncd1eHA1jO
         R3ow==
X-Forwarded-Encrypted: i=1; AKwUvBwgsA+2aFBimo3xumK5QbGT7XfAIOfifcArb9A3L3eeegcvTkFacQ+pgkKmXwic3NmHgB5n05ET2Gw=@lists.infradead.org
X-Gm-Message-State: APuU4Z/BngyDf85stc6TJn+REzPTNinZ/ih9SZhmXmbPK8ERvDusDo2G
	vZrIUKHK0+LnUaAmpqeCmM66anjdt3kIa3BIaSQ3aZfa9CVMHGVUrXshMV5SK2XjJuM=
X-Gm-Gg: AYBFou3tyQy8gzn/tQtpd2k8A47brXVQoXSa4tzPBpWOLn/sSiGLcy739KgQNsciQXx
	tedLWzuUIZPXD5+1AAk5QKTtXu8XA4WaSUHBmblJBIUWZdkyBL23AaUx7kv8dqnN+8EDapWJtUr
	KXO//G/AzvjRTq/JArmIKtsBiOCY4O6TTTCVSH7+n9xcUmAgdZhpCRF7YcriD+mJZh/cNjx1NEc
	TRnKpB6IoXG3LK2X58nwZ/zkJrpeu9FpJmWKTEFaVDcB9mRCAixiRIChFZ+gFWOfnXvbtwsbl7y
	rbgcQNDVxCezPz4pOIaMm7DaRm8/iwrx/wB84rOwBz9r7N5afzyD1V9qIq2ROANjCLK2SFQuKO5
	hLu5HbbWlsSTAWBgxtOU9jBFahfTpNafbrxYo8d7goFIVQUtPCNtoj49XYlCUiVu8oGAfYDnh5b
	hERspDJuA+E47ffskn6IkUPzzyBYZ9TQcVurNIQRhbmCaaKTdQMetUUPj1wTncIfGPcPypZ7roI
	hmXOlxw/qga2zqoXMXnVCzRIGFzVKVzsG/ouFOLLgQwUK+kMQJ2xlVLkRPSQv16XpyQRYAOCqQz
	BCWYxuNpGGBY44xCWOXkB8rYzrR7C1pjtgD2CZbIXyMaV0GzvQ+2D7AAXWix
X-Received: by 2002:a05:6808:6412:b0:4cb:818f:d56f with SMTP id 5614622812f47-567e0f98da3mr4920477b6e.23.1794082410773;
        Sat, 07 Nov 2026 12:13:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:37 -0700
Subject: [PATCH 40/58] mtd: rawnand: cafe: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-40-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_201332_945367_D286BE90 
X-CRM114-Status: GOOD (  16.70  )
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

Free DMA memory at teardown and clear its pointer before deferred
detach.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index f3117b031cd2..bcf7482410e7 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -651,7 +651,10 @@ static void cafe_nand_detach_chip(struct nand_chip *chip)
 {
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
-	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
+	if (cafe->dmabuf) {
+		dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
+		cafe->dmabuf = NULL;
+	}
 }
 
 static const struct nand_controller_ops cafe_nand_controller_ops = {
@@ -659,6 +662,11 @@ static const struct nand_controller_ops cafe_nand_controller_ops = {
 	.detach_chip = cafe_nand_detach_chip,
 };
 
+static void cafe_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct cafe_priv, nand.legacy.dummy_controller));
+}
+
 static int cafe_nand_probe(struct pci_dev *pdev,
 				     const struct pci_device_id *ent)
 {
@@ -683,6 +691,10 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		err = -ENOMEM;
 		goto out_disable_device;
 	}
+	cafe->nand.controller = &cafe->nand.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, cafe->nand.controller, cafe_nand_release);
+	if (err)
+		goto out_disable_device;
 
 	mtd = nand_to_mtd(&cafe->nand);
 	mtd->dev.parent = &pdev->dev;
@@ -693,7 +705,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	if (!cafe->mmio) {
 		dev_warn(&pdev->dev, "failed to iomap\n");
 		err = -ENOMEM;
-		goto out_free_mtd;
+		goto out_disable_device;
 	}
 
 	cafe->rs = init_rs_non_canonical(12, &cafe_mul, 0, 1, 8);
@@ -785,9 +797,16 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, mtd);
 
 	mtd->name = "cafe_nand";
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_release(&cafe->nand, NULL);
 	if (err)
 		goto out_cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&cafe->nand);
+		cafe_nand_detach_chip(&cafe->nand);
+		mtd_put_master(mtd);
+		goto out_irq;
+	}
 
 	goto out;
 
@@ -801,8 +820,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	free_rs(cafe->rs);
  out_ior:
 	pci_iounmap(pdev, cafe->mmio);
- out_free_mtd:
-	kfree(cafe);
  out_disable_device:
 	pci_disable_device(pdev);
  out:
@@ -816,17 +833,17 @@ static void cafe_nand_remove(struct pci_dev *pdev)
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 	int ret;
 
+	ret = mtd_device_unregister(mtd);
+	WARN_ON(ret);
+	nand_disconnect(chip);
 	/* Disable NAND IRQ in global IRQ mask register */
 	cafe_writel(cafe, ~1 & cafe_readl(cafe, GLOBAL_IRQ_MASK), GLOBAL_IRQ_MASK);
 	free_irq(pdev->irq, mtd);
-	ret = mtd_device_unregister(mtd);
-	WARN_ON(ret);
-	nand_cleanup(chip);
+	cafe_nand_detach_chip(chip);
 	free_rs(cafe->rs);
 	pci_iounmap(pdev, cafe->mmio);
-	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
-	kfree(cafe);
 	pci_disable_device(pdev);
+	mtd_put_master(mtd);
 }
 
 static const struct pci_device_id cafe_nand_tbl[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
