Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F954606B521
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yxe4vqNP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x/vr09QL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Nlb58qqAfa+ilSXclShKN5FcY72VsR+X3zUDEOLHxj8=; b=yxe4vqNPkMwW6PvAqIbhAeMLZ/
	08FULMggSm43peo9rJGEZ1NIsz1+LUyG6Na55ms0Napxr9ShyrESaNz4VuHiqeGHLBlIzQmNzqfQt
	zAnbcRzUYJ6b2mXB2zqzRHUKVqPR7xDiDrWSvsskUDaA7Nim0X/IF/x9qjtqPiEeZxpVZgMN4jQmH
	u8LBvPhJnHqvQWxGAndfAulZpIq02NLLQcL/ZUPs/CHc02QB+Ek1UkZd9eNkNixMB12sivWm0YK/9
	nqP4/Oqv0WY8uxkV+Ba7Az8uQMIQY3/3O/lKKvHkiLY9Vf9JNN+J19arV/aGAMQkbu8RHa0WgkR0N
	B6QyBFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXB-00000002wW5-3D6p;
	Tue, 10 Nov 2026 07:44:49 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX0-00000002w9U-4A3x
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:47 +0000
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-82109f51565so699163a34.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296677; x=1794901477; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWLOvNebXGBlVQ7Zi8BeorzFtiggtoriqZHb9Vv2KlY=;
        b=x/vr09QLlsiEcOzGhByxnTw7GYLa5/h9vI/GOSjPCoSmcu8TzADR6IzL6YFEx3ZxUv
         F/DV21nJSntsDLYVjn4Idud1dXcA3TXTvi+pXlhr0EdSruF7xh7QXIVZ/tIFlfFFueeH
         75+oOCY/XxnIEXnQnZMt/uQdSJf+x4GKIN9YS6DjKG9lFHlb9bO4xRbY23KWciEa6TtM
         RkfDzHfxh74STHdJWElahNVmxg7mSppqxuGfL++mpiMwgECv6SBpEqUleWQGq8z+r+/X
         /JZJr2CNL0ogHBdt/1tEGvrls5JJO1+w2+rgKwMZ1No/lYljCAFnw0s2jEeNT0vz0UAV
         XFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296677; x=1794901477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWLOvNebXGBlVQ7Zi8BeorzFtiggtoriqZHb9Vv2KlY=;
        b=PRHA2VL2fbDnobBj0OqdTuOmpgG2tmbpAQe5vs96YsSHbTT6hqiZAOabjQ1a/EwU7U
         Xo3jw09x7dmZn1OZzZO5523+V6F4DeOeUTxt0DwHLWayyFRiKMNGvJ/1dsjk5PxvihHW
         kbinoXTHJlelB1vrvVO9DdOfco9cEsM0YaAuxHjbCbmz5BAiqhBigwaCS7ndZeWmP5YF
         q6xc+SXIfCUwT6h64zBDS6dsaUqrha5YsF7aUUP/7LAI8zMWXd8VSIvzKJ6mljShVeGh
         sFK4wKdJQjxVEV88jaFa+llbLFEe+5DXZEft3KkNdJIA4eB4VxDJ1zhGoB/BYPWMKZQt
         cf6g==
X-Gm-Message-State: APuU4Z96w3qbH326pBbH/GPAUE/t5MDVqBjUAgo4/Y4jUvYLY51wbLe4
	Hbg19WPCzo2OfOajpjddQXIKAzQiCLUELtVRTY5SLCoj9K6yaBeaC7B1
X-Gm-Gg: AYBFou1wuTDD+stBgvE2Yc3SaoS9i0bV0Sr7NjmfFt6/pWEnH2dAQJYy1lxYU+5nBYC
	doldUxFFduRNtBWX0XJTMTSk5dWdvFZ0PQFPlqqaGshk9u2e6i63eN/Da8lZL0jpJQCnjJKvoNy
	Sow2y7HuUBuUIVgzvQzjKKX8RRteSJjuO4msdcsf8HfmrydPJaUx7ItSUm1QEHA07NSfnnZDuJG
	+KeY4sCulP5QYEAi5BebddQpz1pb8wsgf0eTJgeuMPqGhQ++qjC40Fav1vrMFDS+B6GsLQMS0Xt
	xA11Ey7ryv8QvS67g/oFRpt0VSAO4g7bCth0TSYx02oeQE2DqXRBPO+xmzD78gJVaraI2MFmPpw
	2cwWcy8+AhxrntPhH5t+ElhPZYX2fAhjISizyFzWFw3m7kD0CJoL2etsb3TOlPGshiAq00FmeIQ
	FlVk7sMNdzKiiZu3OLUZhZxb6FAM4ikBApOuwmUL8yH7/RihmnXhzgyqX8lAS7LdmzkHmTF4nz2
	6F68DjqauxObbSh+2OCDt1PtWNxPr1uBQlnp+uWuJyp1nZOTJp9rpfwFVuNFNfI4GzXiC3Vm0xn
	6aei0AiiC+jZhOuH1/KoI/X8N2kCJ77EMkFVojzWqs3dqwLpOd8qa8ytYnJ88BrBybvC2+SneGI
	HM/RdEOu/cBWY/Z0/el0UlX5wdzG8ImJEYR+GkUQbOy3Zny+KcJoPSPyzfVtqo32d4oIEXJ/ZPt
	wI/lHjEHI4nvYmCCspewFZ33IJywtR9CqDds2R5+44Sb/CnGmH2h4=
X-Received: by 2002:a05:6808:4441:b0:4f4:73a9:f838 with SMTP id 5614622812f47-5683c9bbba4mr1481876b6e.22.1794296677454;
        Mon, 09 Nov 2026 23:44:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:18 -0700
Subject: [PATCH v2 15/58] mtd: rawnand: tegra: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-15-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, Lucas Stach <dev@lynxeye.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 linux-tegra@vger.kernel.org, Stefan Agner <stefan@agner.ch>, 
 Thierry Reding <thierry.reding@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234439_137218_989B7541 
X-CRM114-Status: GOOD (  16.68  )
X-Spam-Score: -1.8 (-)
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

Retain the chip and controller allocations until their final MTD
references are released. Disconnect the chip before suspending the
controller so retained handles cannot reach powered-down hardware. Leave
metadata cleanup to the final put, including registration-failure
unwinding.

Release the probe-time child-node reference on every exit. Lifetime
ownership takes its own reference before publication.

Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Lucas Stach <dev@lynxeye.de>
Cc: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thierry Reding <thierry.reding@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 1104d75b6cbe..5130bee46d60 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1064,11 +1064,16 @@ static const struct nand_controller_ops tegra_nand_controller_ops = {
 	.setup_interface = tegra_nand_setup_interface,
 };
 
+static void tegra_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct tegra_nand_chip, chip));
+}
+
 static int tegra_nand_chips_init(struct device *dev,
 				 struct tegra_nand_controller *ctrl)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *np_nand;
+	struct device_node *np_nand __free(device_node) = NULL;
 	int nsels, nchips = of_get_child_count(np);
 	struct tegra_nand_chip *nand;
 	struct mtd_info *mtd;
@@ -1096,7 +1101,7 @@ static int tegra_nand_chips_init(struct device *dev,
 		return ret;
 	}
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1107,7 +1112,7 @@ static int tegra_nand_chips_init(struct device *dev,
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		dev_err(dev, "Failed to request WP GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	chip = &nand->chip;
@@ -1127,20 +1132,35 @@ static int tegra_nand_chips_init(struct device *dev,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	mtd_ooblayout_ecc(mtd, 0, &nand->ecc);
+	ret = nand_set_release(chip, tegra_nand_chip_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	ctrl->chip = chip;
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
+}
+
+static void tegra_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct tegra_nand_controller, controller));
 }
 
 static int tegra_nand_probe(struct platform_device *pdev)
@@ -1149,13 +1169,15 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	struct tegra_nand_controller *ctrl;
 	int err = 0;
 
-	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &ctrl->controller, tegra_nand_release);
+	if (err)
+		return err;
 
 	ctrl->dev = &pdev->dev;
 	platform_set_drvdata(pdev, ctrl);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &tegra_nand_controller_ops;
 
 	ctrl->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1235,13 +1257,14 @@ static void tegra_nand_remove(struct platform_device *pdev)
 
 	WARN_ON(mtd_device_unregister(mtd));
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	writel_relaxed(0, ctrl->regs + IER);
 	devm_free_irq(ctrl->dev, ctrl->irq, ctrl);
 
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
+	mtd_put_master(mtd);
 }
 
 static int __maybe_unused tegra_nand_runtime_resume(struct device *dev)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
