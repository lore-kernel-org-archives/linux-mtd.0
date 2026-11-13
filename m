Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4823A606C0F7
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rpctEDPP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Iqvcq1lC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mzdqxqTz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GWKIFZQalxa+IloODKiltiPSFDor85C9oVfRJaOxRuU=; b=rpctEDPPpdhVuK7+rPboLVIaW+
	zTKA3TirgnII7gRb74y3QMB2Zy+RMQ+tfRa4OH1Trsybx3j6JfizgcAGrNC9TupcmUGc8Xu08uyZq
	OMhVyxV2PZqruVTroRJVQxtzznPXPKe6s0CppkYzZFmiPQITgSTjsDzpY7H46SoCpXzvgoDOV0sdf
	nX+Mox3yeuFkumKr/Tfe/XYZ4bAxEsIak98uP1QOQY9JLNDJC8fyQ97jz5M49r/2j9xSCnYhgmu5S
	jwfOUQkRh1wuYpjjiBGW5JkfsqD6mIK+4oEzFl3ORyR1uQfvDBD5pwhdK/Ddh7+DEEqX1vspGTl/A
	b4bPCprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoR-0000000DrAc-1psw;
	Fri, 13 Nov 2026 18:15:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoJ-0000000Dqtl-1Xzj
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=; b=Iqvcq1lCJIFl5BKWV/U4mXXeQn
	0v7K/dJvMuVCXFWMaHvSWdEzxedzyC6tU2swnpW9gjDdgXm2omLX9YWE1vP77jzGKOBnUEDmqC/5g
	tt+oBh3WQgmjfcYvwfO2sGX2NLwQDoadHzjREfs8d2Jo5MYBKlE5LVSvHsKZ3wUk5V4fAiwfV90LV
	Lf1GKfhVq5vKGSzeNbCRiiJIXaDjiYpFJ3nb3i6PeAx0HpCYdleEDeZBIHlfop0wBgz4y5rcJUVhv
	vQ7mTuNp04V4i70ecIJCtvID59jiINPcCcNcrKn968wQiFDr7AswmBVnmQZozdYGF9uKcC5420z0O
	2LyCVLyA==;
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoG-0000000Bdel-16Sa
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:38 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6de2f213b7aso493646eaf.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593734; x=1795198534; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=mzdqxqTzrh/U4XWuy8JvvqSnuSzJ0p1rggNj+iMDGunNlvPkSfwqyub6SKjoOuIvSY
         Jlig2NW2E/hj/ZkmjW+0iQvHzDoVtADFW/ixuGJNtDlsJ91kHfeQEwz0pdYYuOXgXJ5y
         dodo5ytuGiuS3U0Tjlg5sLuuxMXfIY0Gae0lxlwwjxtn7wWXGPlGKusfIK6LV7UH/kVW
         u++7ZvrlhLUc6JcP5fceLWmiDXSAorv2H1BnzsOSOwaP6RwF55tMNJ209wjpZk/T6xaM
         bWm5SDiClyaJgSa184wM6KrkcMkhjx2R7v9A6KotOKzKWrvaxvJV7KGTvQIVSNBSOpGT
         VBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593734; x=1795198534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=XLseE0S3wW0qWzJr81QOWJIXX8FLsLZ90DF5YHTg1WB0AgpvvCEEXASK1W6P+3wHsy
         A6D/8gRs5pmNauSVUIn2eYIXWtJMbNgFEFykfgJFh29Qm/BkkawKXCTIyHzHQdT68qlR
         GBgvdfFRzFy91zcQbjvvHHYGumCpz+4svUTeQ7yU4sZh3pbzfRfGEwsl6+cUDQMm20W3
         a4va89lcskWLP486Pv92FciV+/G++N7Rp/4T+8syFUnMIOgt0bfh6rQU+mtDCGQkERmu
         Dc9XqkDy0hPdqcbGMpmCQkMFIidcK1iPcL7MiEm9Ki/TaR40ZbOpy6xVdBuCXbedcSw5
         0G/g==
X-Gm-Message-State: APuU4Z+Fcl9XzvKRxSV41bJ+EkhZ6Px0d0wrN7luhq5KSLlF6deFhWF6
	Qp13fmSYsnL748Caaslw0sLneH4s/vOC71KBJGq2si8hMS+0YSf9u75W
X-Gm-Gg: AYBFou0jV3K4xMXL9fqAizwRzjlovepgDiJsnIQTHZfTF6ewhYS5i49vXSW6+yL9/9s
	6DJqhpXY1madqvLdDnFJ2BTGOkWwkal6dgOgXYW34YJa+XWEzgOK5sPIeijB03t2kOMNa9l+6Rl
	ira2CV0USfPvUmJfVrJdOAAHtDlxHJCF+j10bVHf+FMdLDpmJ0Odg3OwKyxHEkTKxKyfT4zv08X
	HI1NxsofJXexGy7nL96UINrRIAaYc0jea7/7pLJF7u7h23ImFSELNratAvvV1S9WcC1/JJjVsgZ
	qpouu4W82UD0Y3gI7cneL+PZBfKytejVnedJFc2G36DEJmhi5pDjjPMs0qGqp0b0an8XReRBprX
	hhZK22GpQHCUIxKs9POXmM2mHFLFHkdUOLnPcLwj2N8yYeLBV28fhr+E7o530ytt/iaR9+I+s0L
	s4mpNQdRrLNmnQn4Ydbh6Ydd0SnnOA2uluY0hYT/zLSH2U5aKtDG1q5R7RXo8qgeafoacCcqvT0
	tjss7XPXcSsNo1yubZIrGsHmZHaG7sbxBxRMjN13aKFrUKld6WHVrizisBrVNhCBhmSo/iF6Z1n
	1fyaFywZstQKPL7tuafr8pEFciPg0XKMdQi9gXN2491Ogrd+KkD9fMQZLko+sutzDBzOq1nSCkf
	qlPj5s9KI186GxmGT2VQPUZ+yHZ0GltP0Lu33EpDGJ/LZfZDn591H7vbL8RKafu4T7HJEuaXC4N
	SrzZlphE0yVvx9mRCS3QZE5KLi68qCzWSmK8/clNATdE9/m0Q+e4I=
X-Received: by 2002:a05:6820:f012:b0:71a:cee1:caa6 with SMTP id 006d021491bc7-71acee1ce75mr26036eaf.59.1794593734058;
        Fri, 13 Nov 2026 10:15:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:31 -0700
Subject: [PATCH v4 15/58] mtd: rawnand: tegra: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-15-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, Lucas Stach <dev@lynxeye.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 linux-tegra@vger.kernel.org, Stefan Agner <stefan@agner.ch>, 
 Thierry Reding <thierry.reding@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181536_313771_BFDC42BD 
X-CRM114-Status: GOOD (  14.84  )
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

Retain the chip and controller allocations until their final MTD
references are released. Disconnect the chip before suspending the
controller so retained handles cannot reach powered-down hardware. Leave
allocation release to the final core-owned put, including
registration-failure unwinding.

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
 drivers/mtd/nand/raw/tegra_nand.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index ef765fa21e72..4b9416ecbe43 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1068,9 +1068,7 @@ static int tegra_nand_chips_init(struct device *dev,
 				 struct tegra_nand_controller *ctrl)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *np_nand;
 	int nsels, nchips = of_get_child_count(np);
-	struct tegra_nand_chip *nand;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
 	int ret;
@@ -1081,7 +1079,7 @@ static int tegra_nand_chips_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	np_nand = of_get_next_child(np, NULL);
+	struct device_node *np_nand __free(device_node) = of_get_next_child(np, NULL);
 
 	nsels = of_property_count_elems_of_size(np_nand, "reg", sizeof(u32));
 	if (nsels != 1) {
@@ -1096,7 +1094,7 @@ static int tegra_nand_chips_init(struct device *dev,
 		return ret;
 	}
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	struct tegra_nand_chip *nand __free(kfree) = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1116,7 +1114,6 @@ static int tegra_nand_chips_init(struct device *dev,
 	mtd = nand_to_mtd(chip);
 
 	mtd->parent_dev = dev;
-	mtd->owner = THIS_MODULE;
 
 	nand_set_flash_node(chip, np_nand);
 
@@ -1130,11 +1127,18 @@ static int tegra_nand_chips_init(struct device *dev,
 		return ret;
 
 	mtd_ooblayout_ecc(mtd, 0, &nand->ecc);
+	ret = nand_set_lifetime(chip, container_of(chip, struct tegra_nand_chip, chip));
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
+	retain_and_null_ptr(nand);
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -1149,13 +1153,15 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	struct tegra_nand_controller *ctrl;
 	int err = 0;
 
-	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &ctrl->controller, ctrl);
+	if (err)
+		return err;
 
 	ctrl->dev = &pdev->dev;
 	platform_set_drvdata(pdev, ctrl);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &tegra_nand_controller_ops;
 
 	ctrl->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1235,13 +1241,14 @@ static void tegra_nand_remove(struct platform_device *pdev)
 
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
