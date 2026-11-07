Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B90860A2618
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N+CfIkxe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ix5i5jfs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/4oWLKnaiTEH6+PSJejQ1hwdm8f/fGlmFJdpUo3v54A=; b=N+CfIkxefWWyVdTC59TfUK4rwP
	0mAuuTQCfsD6JCnmncDJVXi/ZLwOEWillnE35s15IB4+1pnEKp6k/2KQBAatRG7cMCP5Z/yScO0LC
	5ZC9Ny8BkrgNsEmi8ucLztip9jOhxyFLrK/Klh5mT6dkjGj2MNDlVSZPMknB/Ub6V33WTcoKv5zsM
	XnFJan8YZGihiwjGTpX+GfSF3tsAJknyoTT351ULCXxuRhWsE8pMSQHI31q5Tq40ETo2ZRWgtjlmn
	7SdytCHNWc2LpTd3vYl9fyTikSRS41mewp22mWPRQXiin5qi0B5AvahDu3xlW27PTulcGH0XA1Kjd
	CfE9JfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTo-0000000ETTz-3IVb;
	Sat, 07 Nov 2026 10:17:00 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTa-0000000ESwq-19B0
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 10:16:51 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-823b938464fso1112543a34.2
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 02:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046605; x=1794651405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlZnG/7Sna+U2qbkmqtYLFmIOLPlVRBG830dYMD5F3Y=;
        b=ix5i5jfsgFK4ousIeqxeXL5c9erjjepJ78EtGa/bhFaqM+2+25V1hegtueVoD1Q5mO
         wkSoiySdn4KsCPM2UoVB/fAdtO8vHd7j2FsR0LZ+9xK35IDZhOpWMJHgjx9L+MqHP7c/
         XoOWOY0S1vgB3E5auFPGTek0yZBkJjS3SniVWJfZqww2d3nMQxpqZbOso8zW3vPGFD1S
         6Dwy3f+6ZkBhlKicJwzyCVfpLF2/JWaIJH9x4dZuipAb8sUN/XXcMefqwW9szoo81AUk
         5OqvvshnuAlsYlaKG01VO3ENtKwfkkiJnouNGmPcdAKx1yLtnWdcK3WgoOaEI17t1hb8
         g2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046605; x=1794651405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlZnG/7Sna+U2qbkmqtYLFmIOLPlVRBG830dYMD5F3Y=;
        b=orvJs7n/fysX6fTmaAWABYdqo7AhIAr/ljctNf7z3oPrka/dlyA1PFYI3oQ4nBxGmz
         l4qbDnMecccVwH2jam0qIYUbs1E2N+aPCzEiCcczAppSx/4azwFeNtTUkD/MwMJ/q9Jn
         I38gn7BiuLyIaTGDpaBxWO1Dph627mSYKiwx2cq7Sby6OKi4w4cxdxfp7FU89PGjIVzK
         fkpDCzdi5ASGECKrE66Un+h8ZMYgfqh02tbRtTu9DNt60YgXlBaftwtLV0hF3W8BjQtA
         ocZHMLOsLBsvjXvzLJwqCpODcxbsztCf+WVSr1sVJpUlMbqFo5qFEaggIArmCUz7A2+J
         4fmw==
X-Forwarded-Encrypted: i=1; AKwUvBy7VCDdinOV3i4nxCLKaNJcbft39qsZwnH3efVNcFxIp3XJ9C7HVgqpBkZ1m7OTiSqeugiochwqHjo=@lists.infradead.org
X-Gm-Message-State: APuU4Z/Xu1IY3t3UACBvYXBVzfeW9J1t9iYbONa3JVGvw9zqMxtTbBcX
	phZIH8wPJTJ+lKl98JpgwRI8aUI936LoGkCv+kUw3Ep7Jvhczp49I2JM
X-Gm-Gg: AYBFou0tIk0am+qnSYe7UahNPVqa9ZeWO5ozGacqhs/u6NPSB7RkUeU/SOeHGW3bTV/
	07nUIP/mUWX6rNISSLPLweWzUQZBKC92zfh2DTjR+Zp723DB9kA2xv1FJ92CQSHDvUcYkIeLWhf
	Bx2azvRTyaDyIpwesEZNHx4ez2DeNcN7yOSiIV3f1mfMQc6oCs89Ljt/g45kCIExunDfWkS4Y6j
	AICuPU74tST6+8CqWXMcAwuZHVLVtXWbI6Q8VKMf8lgdW8lLwfkkntxb1znWxBFnoSaTHejl4MH
	4tiIVTvzuDii6hWG+lvMy5lquA6hB66vEsfN+HfRGuCBS3cRYT+umMOBLwZUwmZiqukHs2Lypvo
	+4Uw8ywxv5ceXrhQKnZ6iUki5Q45XK5Ye64qsF00qzZZYHc/07dvEHhfxhVXTvSmTTNPvfRWCGd
	Ke5gzEs7yi+2EuhrtSK4KClv4e+gtf0BdJILUDoVjGUQoDuZfPPw+nCmkgSrTS2RhIOT9bv3bgl
	Pqc5qYIkOTvtPKnvBGSgGhSr8QeP+50w4YaemXaEgr58zMhvSCiPBiSwg+EGklQP8n3P0CTTFKu
	D5asZNevWLvS6XpKvl8VegeEP1MZYvmC9Ka0KR1nmKEyx3wNzVgjR9fgO/vkuLP1Ny0zPsY4Jjq
	sAaRv7uFNmuNx+l5IijJ3tT5EHo5oJ5mYi/JBKo+aSm3kR4RjqTOtxxLxlGtt4Oht/FYTcZBCZG
	6gf6F88ZjdcUOuOf19eGB5opj7XWoj1J0s+NyEkdCOnXWQCGcAx7TP
X-Received: by 2002:a05:6830:310b:b0:85f:31f:7643 with SMTP id 46e09a7af769-85f1cf3e2c4mr5316383a34.7.1794046605233;
        Sat, 07 Nov 2026 02:16:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:04 -0700
Subject: [PATCH 07/58] mtd: rawnand: sunxi: retain chip state until the
 final MTD put
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-7-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_021646_432768_10F34624 
X-CRM114-Status: GOOD (  20.58  )
X-Spam-Score: -1.9 (-)
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

sunxi_nand_chips_cleanup() unregisters each MTD device and immediately
calls nand_cleanup(). Devres subsequently frees the chip and controller.
An open MTD handle can outlive this sequence: another operation or even
closing a writable handle reaches freed metadata and lock storage.

Unregister each MTD device while removal notifiers can still finish I/O,
then disconnect the chip and release the driver's initial MTD lifetime
reference. Defer nand_cleanup() and chip destruction until the final MTD
or device reference is released. Retain the chip name, flash node and
per-sector user-data lengths along with the NAND metadata.

Give the controller a reference for each retained chip and one owned by
devres. Register that devres action first so the IRQ and hardware
resources are released before the initial controller reference. The
shared lock and parent device remain valid until the last chip is
destroyed, while the disconnect gate prevents access to released
hardware resources.

Unwind heap allocations on probe failures, including attach failures for
which nand_scan() does not invoke the detach callback.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 59 +++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..57894ce45065 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -27,6 +27,7 @@
 #include <linux/dmaengine.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/mutex.h>
 #include <linux/reset.h>
 
 #define NFC_REG_CTL		0x0000
@@ -405,6 +406,13 @@ static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *ctrl)
 	return container_of(ctrl, struct sunxi_nfc, controller);
 }
 
+static void sunxi_nfc_release(struct nand_controller *controller)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(controller);
+
+	kfree(nfc);
+}
+
 static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 {
 	struct sunxi_nfc *nfc = dev_id;
@@ -2027,9 +2035,8 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
 static void sunxi_nand_detach_chip(struct nand_chip *nand)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
-	devm_kfree(nfc->dev, sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand->user_data_bytes);
 	sunxi_nand->user_data_bytes = NULL;
 }
 
@@ -2045,8 +2052,7 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (nsectors <= 0)
 		return -EINVAL;
 
-	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsectors,
-						   GFP_KERNEL);
+	sunxi_nand->user_data_bytes = kzalloc(nsectors, GFP_KERNEL);
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
@@ -2427,6 +2433,13 @@ static const struct nand_controller_ops sunxi_nand_controller_ops = {
 	.exec_op = sunxi_nfc_exec_op,
 };
 
+static void sunxi_nand_release(struct nand_chip *chip)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(chip);
+
+	kfree(sunxi_nand);
+}
+
 static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 {
 	struct sunxi_nand_chip *sunxi_nand;
@@ -2440,8 +2453,9 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 		chip = &sunxi_nand->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&sunxi_nand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2465,8 +2479,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		return -EINVAL;
 	}
 
-	sunxi_nand = devm_kzalloc(dev, struct_size(sunxi_nand, sels, nsels),
-				  GFP_KERNEL);
+	sunxi_nand = kzalloc(struct_size(sunxi_nand, sels, nsels), GFP_KERNEL);
 	if (!sunxi_nand)
 		return -ENOMEM;
 
@@ -2477,19 +2490,21 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		if (ret) {
 			dev_err(dev, "could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto err_free_chip;
 		}
 
 		if (tmp > NFC_MAX_CS) {
 			dev_err(dev,
 				"invalid reg value: %u (max CS = 7)\n",
 				tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_chip;
 		}
 
 		sunxi_nand->sels[i].cs = tmp;
@@ -2518,18 +2533,32 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto err_free_chip;
+
+	ret = nand_set_release(nand, sunxi_nand_release);
+	if (ret)
+		goto err_cleanup_nand;
+	mtd->owner = THIS_MODULE;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
+
+err_cleanup_nand:
+	nand_cleanup(nand);
+err_free_chip:
+	/* nand_scan() does not detach a chip whose attach callback failed. */
+	kfree(sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand);
+	return ret;
 }
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
@@ -2610,12 +2639,14 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, sunxi_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
