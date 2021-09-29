Return-Path: <SRS0=NzJj=OT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0F0C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 11:58:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8699561409
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 11:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8699561409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TvgMybGKs37pETSN+8Wfa2w8ePf5G5bS302K4H0wgzw=; b=G+V+sfxFxLm5jR
	P7Hc8YTBAXF72rmSSpLi9sDxobYhQX0ySopn73aH1G3p1H37KTJQP/pbWXFYmCzsBTiXAOHtjdXkt
	SQ6reT1ucLVr+3v+I+rHQc1hMnCCBF3+OmeEyp4L3A2xnLM0K+1+UXA1O82OcNaZNHdG8WbVIzSrx
	w2pLwCqUYhNbDUHeGVgCSf7wkMA4aNqKvdUkyK9P/7H5agYbqmAe6LcnRULGwWQ6guy+JT7LCscIm
	0PYuxDur5KAMUivgaNq2bu3LsWXrPDdQtYsfeNEO6Kh5/5pP85Jt3/mtrcuFWUV+Dd71ASw/TWGyb
	UsVRqbV86jiuSQ4OTL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVYDq-00AvC1-1X; Wed, 29 Sep 2021 11:58:02 +0000
Received: from thorn.bewilderbeest.net ([2605:2700:0:5::4713:9cab])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVYAP-00Atyc-1I; Wed, 29 Sep 2021 11:54:30 +0000
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 716C3C53;
 Wed, 29 Sep 2021 04:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1632916468;
 bh=R1j5OVnuaawARx/Lb+7fwJs4wNisTGf3IZegQlGAoXI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HH/p5S6hIH7hSeX9tW5puYJY+vGYxS34mcVMsTAgDy7++ub7A3jZ4QaCh0Eprp3qU
 joAq/DCFX+t1h2e2LUCYdtsPSrw36FErbV1vTgKxuFPuOS5/FWOYOPbNqSy+g1SbyW
 K8eZWPDr/29Fh6fJAd5JWm0QFX+Rh9FinrBtpD+Y=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] mtd: spi-nor: aspeed: Allow attaching & detaching chips
 at runtime
Date: Wed, 29 Sep 2021 04:54:06 -0700
Message-Id: <20210929115409.21254-5-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929115409.21254-1-zev@bewilderbeest.net>
References: <20210929115409.21254-1-zev@bewilderbeest.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_045429_133699_5466D275 
X-CRM114-Status: GOOD (  22.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There are now two new sysfs attributes, attach_chip and detach_chip,
into which a chip select number can be written to attach or detach the
corresponding chip.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 .../ABI/stable/sysfs-driver-aspeed-smc        |  17 +++
 drivers/mtd/spi-nor/controllers/aspeed-smc.c  | 101 +++++++++++++++++-
 2 files changed, 115 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-aspeed-smc

diff --git a/Documentation/ABI/stable/sysfs-driver-aspeed-smc b/Documentation/ABI/stable/sysfs-driver-aspeed-smc
new file mode 100644
index 000000000000..871b4d65ccb2
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-driver-aspeed-smc
@@ -0,0 +1,17 @@
+What:		/sys/bus/platform/drivers/aspeed-smc/*/attach_chip
+Date:		September 2021
+Contact:	Zev Weiss <zev@bewilderbeest.net>
+Description:	A chip select number may be written into this file to
+		request that the corresponding chip be attached by the
+		driver.
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
+
+What:		/sys/bus/platform/drivers/aspeed-smc/*/detach_chip
+Date:		September 2021
+Contact:	Zev Weiss <zev@bewilderbeest.net>
+Description:	A chip select number may be written into this file to
+		request that the corresponding chip be detached by the
+		driver.
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
index 3c153104a905..da49192a8220 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -91,6 +91,7 @@ struct aspeed_smc_controller;
 
 struct aspeed_smc_chip {
 	int cs;
+	bool attached;
 	struct aspeed_smc_controller *controller;
 	void __iomem *ctl;			/* control register */
 	void __iomem *ahb_base;			/* base of chip window */
@@ -402,7 +403,15 @@ static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to,
 
 static int aspeed_smc_unregister_chip(struct aspeed_smc_chip *chip)
 {
-	return mtd_device_unregister(&chip->nor.mtd);
+	int ret = -ENOENT;
+	mutex_lock(&chip->controller->mutex);
+	if (chip->attached) {
+		ret = mtd_device_unregister(&chip->nor.mtd);
+		if (!ret)
+			chip->attached = false;
+	}
+	mutex_unlock(&chip->controller->mutex);
+	return ret;
 }
 
 static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
@@ -412,7 +421,7 @@ static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
 
 	for (n = 0; n < controller->info->nce; n++) {
 		chip = controller->chips[n];
-		if (chip) {
+		if (chip && chip->attached) {
 			ret = aspeed_smc_unregister_chip(chip);
 			if (ret)
 				dev_warn(controller->dev, "failed to unregister CS%d: %d\n",
@@ -775,6 +784,13 @@ static int aspeed_smc_register_chip(struct aspeed_smc_chip *chip)
 	};
 	int ret;
 
+	mutex_lock(&chip->controller->mutex);
+
+	if (chip->attached) {
+		ret = -EEXIST;
+		goto out;
+	}
+
 	ret = aspeed_smc_chip_setup_init(chip, chip->controller->ahb_res);
 	if (ret)
 		goto out;
@@ -792,7 +808,12 @@ static int aspeed_smc_register_chip(struct aspeed_smc_chip *chip)
 		goto out;
 
 	ret = mtd_device_register(&chip->nor.mtd, NULL, 0);
+	if (ret)
+		goto out;
+
+	chip->attached = true;
 out:
+	mutex_unlock(&chip->controller->mutex);
 	return ret;
 }
 
@@ -865,6 +886,72 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 	return ret;
 }
 
+static inline struct aspeed_smc_controller *to_aspeed_smc_controller(struct device *dev)
+{
+	struct platform_device *pdev = container_of(dev, struct platform_device, dev);
+	return platform_get_drvdata(pdev);
+}
+
+static ssize_t attach_chip_store(struct device *dev, struct device_attribute *attr,
+                                 const char *buf, size_t count)
+{
+	unsigned long cs;
+	struct aspeed_smc_controller *controller;
+	struct aspeed_smc_chip *chip;
+	ssize_t ret = kstrtoul(buf, 0, &cs);
+	if (ret)
+		return ret;
+
+	controller = to_aspeed_smc_controller(dev);
+	if (cs >= controller->info->nce)
+		return -EINVAL;
+
+	chip = controller->chips[cs];
+
+	if (!chip)
+		return -ENODEV;
+
+	ret = aspeed_smc_register_chip(chip);
+
+	return ret ? ret : count;
+}
+static DEVICE_ATTR_WO(attach_chip);
+
+static ssize_t detach_chip_store(struct device *dev, struct device_attribute *attr,
+                                 const char *buf, size_t count)
+{
+	unsigned long cs;
+	struct aspeed_smc_controller *controller;
+	struct aspeed_smc_chip *chip;
+	ssize_t ret = kstrtoul(buf, 0, &cs);
+	if (ret)
+		return ret;
+
+	controller = to_aspeed_smc_controller(dev);
+	if (cs >= controller->info->nce)
+		return -EINVAL;
+
+	chip = controller->chips[cs];
+
+	if (!chip)
+		return -ENODEV;
+
+	ret = aspeed_smc_unregister_chip(chip);
+
+	return ret ? ret : count;
+}
+static DEVICE_ATTR_WO(detach_chip);
+
+static struct attribute *aspeed_smc_sysfs_attrs[] = {
+	&dev_attr_attach_chip.attr,
+	&dev_attr_detach_chip.attr,
+	NULL,
+};
+
+static const struct attribute_group aspeed_smc_sysfs_attr_group = {
+	.attrs = aspeed_smc_sysfs_attrs,
+};
+
 static int aspeed_smc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -905,8 +992,16 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 	controller->ahb_window_size = resource_size(res);
 
 	ret = aspeed_smc_setup_flash(controller, np, res);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "Aspeed SMC probe failed %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_device_add_group(dev, &aspeed_smc_sysfs_attr_group);
+	if (ret) {
+		dev_err(dev, "Failed to create sysfs files\n");
+		aspeed_smc_unregister(controller);
+	}
 
 	return ret;
 }
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
