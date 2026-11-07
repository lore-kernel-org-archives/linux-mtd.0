Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAA8606EEAC
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QJuxIdwn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=YkBkEzyz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kJ8AFY33
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0PNupvl4wIbZnkdZ8kVqBnBL40ihEadn9L47Rlke8UE=; b=QJuxIdwnJX6/KfYS1mwafX7bq0
	sD8xQRM5uN3DKjrVgJd1YujIiRXzZrwv9Ip6oCsRzO9Tb1GooGFrfgh1LNSopAnPnWPnp4SGbOvto
	CHhOeMN2Q0heYr8KLkbBurMnTYmOukYnfCPcuHAj5RbvAbyxhjPMCZcZ+ouOvrV5fQj+XWlIaHX1N
	Ob+p8BCXBzLyTd1VI4vEx9h1B9j85ah1KiMIj63NGbDcgdSjCsl0/B+rb5IoHesD8yArv+v+xCiME
	RakKSKLbTB/LHyHGkH5VXvDje88X/ZBD2jz3nBcAKn9e3FQIVav8nUWFv7G6pXVPwL6qvdVa8bEKD
	4vCBUilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdU6-0000000ETto-12eY;
	Sat, 07 Nov 2026 10:17:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTm-0000000ETMc-2aoN
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=; b=YkBkEzyzoKqQnVs1EHpUhcDq0m
	LAi7d7rVtsd/AvVp+Ub3q719s8RCPt6WNjpTKgNC2c+eHxoA+kYArTxKUO3cFsgpyjRNJgzdtAJza
	KVRPKqNwMN6ZXZCPq+v346gIq4qipuXyHa+p02Vm4sBsgzndmmyjV2/5gdNq/0S1tFN6LC5lh8XFx
	4JvMsBP1OO3l04BmEb+Tqw87SbfOCtecMRaZXuIP7ShDqLSqptz8ezQIYEqnKHKh/jhQIoevGhliu
	+AZ14WFMBBSu4j4yNN0UjXyYESih1ycVUfhJ+5dCtNNczqP8vOSdXBmxUfbgLJXnmYooYZPIw7ImD
	WewjquiA==;
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTj-000000057hU-3JoI
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 10:16:57 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-85a5455bd3cso839926a34.3
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 02:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046614; x=1794651414; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=;
        b=kJ8AFY33UVHoicj13nLXPjyq39boUNe09gJlQDqQgkiy8jS14fcatIknk8/a8fsecD
         fyd+2UwBjomBgddAzwGB+3I67WcwsUjpeZb7YPEmElaIPsRmxUryQ/NI6UB3zlSUyejh
         ktmqfVbQ3PsXCoHkk5hnziH3pVUEofosOGLUocml2uvjsiLhojy3YSfTlrjlvEQrAp1I
         cRkXS+70mH6w53RYtXvQ4Hi8ZonpRjc1OUn60kvglOcQSSJEgCCVkSrXj9AiI8+xjoh+
         ynwqobrL3RedxAfl2h+XS7isBJ71+ChpBj0cGnPWuUtoe3CVMjE2ZCZMqR9Nt3Uor7cv
         jhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046614; x=1794651414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=;
        b=h8FmWXQna78sFprU+lNhWvnTrQdAuWmalDrGTuhUAuKZTj5Of9Tbbbq9MyzpAP3Bls
         PM0S9kSzp2fUJ+g/RtejjahMJPXAPCmMXs7cbxzD9MaG7jkUQuUQlryI2CRG/5nQbKSm
         9/kcAB45OnACfN677rTfHfVCKgM4lkiSKfZVNtWyrUG/3QAEZ7RhFOq6AqIq68c5yR02
         49BwN3A1xhoI+E7+tshcWsrOllmWDVljQ8VjaOBjRNEHJAcG6lZGLlBi83nOoRykUKT1
         XCKN/P7L7D38hi/OYzM8cUDtMqEjfikt6S0hM1N9ZDUxtnVLl8MQQ9P/MAcxVPNfP83q
         zgSg==
X-Forwarded-Encrypted: i=1; AKwUvByAV2G00Kx019jjmBdMbz4sGRzkftLC6y6XYeBOnPlR6eC1BoXD5nML0Win0n/7D7UfurPumZDNCjw=@lists.infradead.org
X-Gm-Message-State: APuU4Z/iL+dS3etRzFP42B8poBWmuXtgg2GTsfSAIN5OJD3dpwHRQ9Oy
	YnfUWoqVFHOMapnc4y5mMG+qCagYHL1d6vXrR2tji64MdWFCOWE054JM
X-Gm-Gg: AYBFou27ZlBR98pRpMcriWwZEkGWPBN262dq42/QC8OXI84sPBXBIHXk3JubhiGADSz
	nNpIQU9q9xnAbtnasxQIOzinHGyjmxrfn5e+uCp45i63v9cYqL9FQy7yd+secfegEtnigxFhUuH
	/0Xk0ETlNP5Sl0Ip1wrWuKdsDt1Uo3C+aTa3LplZw/0jhPs5lcDqnTVwQ1U15zPkhjbIrHl/Eg9
	8SIJfcdwE8qJXdph6PLFWUb8xh3E5yjqAgsJb450f4GD+d9/aDygPxiwl6RJBRQUdQJUEoNZ5nE
	2zdm1pzc1yO4b7Fkn4x2809071NmfWDaxc2qvVqKZSvd4ToTKP06eDlx1Sd6bPVMBGa7lRryqvW
	uShm09YMqnEZZS3Zg8B+k9oEAwH57j1w0/3SzDOrqBQ/3+GbhLCKEMx4YyXJFe6n1hZZMqU0nV/
	2RbplLrjIRYntw95XxjHN9Wuxn84iXliW/CkhugeuHeAUMPUNxulHvLOtYa3prkJd+CmqwFk7G8
	VyPpeJa9U0uNJgg+78TG9eY507W+SThwlg8wvDHMvbfxLJxj1e71+XnM24FUk+hWv3jpUtsl6hl
	dMjAqWobforSSnExt31fnyIF/puepfe0FNhZoGAnuoaNDnwdC+2ITWgivl2vF4XqbIn1mR7wUUK
	bwPxB7WHBLj3Ba5SyNnf+mVrBHQq4THEymwOJBnsh52gTWBFJrMMU1BNaxt4UuKR8pTObb/HTiZ
	LCBQVhmoty5htabXuW+n/f5HYLCv5dU+9zUQFa0Xj72W2nHo8qCpps
X-Received: by 2002:a05:6830:640e:b0:814:8259:780c with SMTP id 46e09a7af769-85f1d012c2dmr5221596a34.19.1794046613684;
        Sat, 07 Nov 2026 02:16:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:07 -0700
Subject: [PATCH 10/58] mtd: rawnand: stm32_fmc2: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-10-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101655_702479_9B4E0816 
X-CRM114-Status: GOOD (  17.92  )
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

Keep the embedded NAND chip and controller serialization state alive for
MTD references that survive unbind. Disconnect operations before
releasing DMA channels and scatterlists and asserting write protection;
defer NAND metadata cleanup and controller storage release until the
final reference.

Preserve immediate cleanup before publication and use the retained
lifetime after MTD registration has been attempted.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 9f42f8ab3212..4b89094c89e6 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1902,6 +1902,11 @@ static int stm32_fmc2_nfc_set_cdev(struct stm32_fmc2_nfc *nfc)
 	return 0;
 }
 
+static void stm32_fmc2_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct stm32_fmc2_nfc, base));
+}
+
 static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1915,12 +1920,14 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->base, stm32_fmc2_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
 
 	nfc->data = of_device_get_match_data(dev);
@@ -2024,9 +2031,15 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp_enable;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_wp_enable;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2061,7 +2074,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	if (nfc->dma_ecc_ch)
 		dma_release_channel(nfc->dma_ecc_ch);
@@ -2074,6 +2087,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	sg_free_table(&nfc->dma_ecc_sg);
 
 	stm32_fmc2_nfc_wp_enable(nand);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int stm32_fmc2_nfc_suspend(struct device *dev)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
