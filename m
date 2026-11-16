Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D46D606AEE3
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=byqyROjy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rm+1SX+y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hfz3vuLs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GWKIFZQalxa+IloODKiltiPSFDor85C9oVfRJaOxRuU=; b=byqyROjyCQnbox9Za1VI0g1K8z
	Dwp0nnfWy7i+FRKWN3OOcGWDZjdDiqr0Q88oQ3nntVLj6osyAvWxwal/KGKmQKfXHuBigD8Pp0Rd2
	+LMUUbaaY9Blmwcii80mpSwdEs9EZ0SfqI8MhUcDvlX1ZoIEUQdwurgv4a7hc2jLQhqu1Ue7SCz99
	+C2QSE4WepeQUN2/hUoakgEMFj5wuwhQuyU+Ch3TKAeX5uwl4HeHL3vpcCriQf8pmWESzGAYPW5WL
	AdqrCrnPbmqyJSj/Qg3fcxnM2E/9t7LpYAg3c/hibRA95IYQCpYLoROu9oLYHhMs9ZXBgPHv0W6iF
	NUiUdwmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEr-00000001GKp-3guR;
	Mon, 16 Nov 2026 06:30:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEd-00000001Fv6-36LF
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=; b=rm+1SX+yG+m+SzVmb7ZK8xxY5c
	7lu/Mrd5fZm4GAV7msCM7SxBBbGWNgLdklh6ahqcX7EQwSFP6OXlPN8leWE7YJ39NCv/QbRHkOcYN
	nednwuwepn8sxUltreXkL5brSX+Bqzvu5Ej03M3x7sZbPWlCFgxSw2h+GkB9c2rivrHw05qU3aRog
	XGifxWBvJSnthGXIWii5C2gfs2uT2ZzzREypKamb8JRoiQnBEBIrBS8jKIkVFzZIbJqO3KudF7IbN
	X878thrE4ifD+f6/oWoSkwDVb4F4K2RGuLLdAZk/1roRm6MVrvmKwUrb6+xuZIIprOVoeiq4mxYRF
	jFPHX++A==;
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEB-0000000CeIN-12ZZ
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:34 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-705cb6ceebaso3464960eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810604; x=1795415404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=Hfz3vuLskyH5W/Bby7u/SAK1Avb3pZ0AtzXHTyNoq9RpvLLOIJpx4maY+lLOHn25FZ
         F/y5gOnQe+aYQIb7uSrBi+2b10Fdt0wttemrIhvuHDa3y6a0PK0iqyeDy5eyVFyn8Vdj
         TYQrl3VQ+dkhpJJzBJAH91oqaa9b2gtpf+gPhlFltNdjtMvmqvXj38Gw2lBK1BaOxHUz
         ZTApZEUcYBL3+wpeXIR/2DcxOuGEznJwx0t2k/aZdSOdBVNXYiqpTc8wPysxd8TWK/5C
         kwnxSqNnsJagEYD+9wkWSGn2IQd1hM57El7NR9iA6Uy7+iqtcj+j794DW1Na+FRY6aj+
         8Z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810604; x=1795415404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=Dzk3sa4RuuaXaDqw2YlyDB6lxHx1oYoo0WQErtu7BoAp/R4Wj198A4xt6k2CmlvWLc
         NxxR/K7bqDN+excVFm+2om9dr6JDQxueZG5f8G5Xc7Z64vF17nhqvZfyfmtOvC91Pf+U
         RvaOsxJptupqmPbOwC6mC1JCpDBpIQex/FXx3dSJPvv3e+zLYwp3LovxyO4Tt5uLLMtG
         LkMjMaiZw3dFC2EGcuwtHYTgOBwme+VcX6OKXwuqjZGAOtsM+xB4RZT5K52mFfeisa7D
         roKj8Dh8NxppCOi++/R5J6Q6WUt0CTSUKRAV5a6GS0BmuM8ZxN4fJi3oGo2PIq+azqtu
         2KjA==
X-Gm-Message-State: APuU4Z8MkonMMwZ6n7vS0kOjIwjeqAgnxEH+aDvl9gywTxK4cKof9Lhg
	/kYIecpSFvxZ+4bleKhzikQJ+Fefx1I3hyAX6hP6fTRIk0YLisGH2FJu
X-Gm-Gg: AYBFou0jiWHu+4nDe6y01eyVzF2fuedbI1OBbbHMSYmCo/1IW6Al0p/gzk78gLEkJ0n
	QqQPK2QCkBZjPk1IVHsu0GibdUhkInc8Uc/DM4e2TeRNQ6B1EL5MAuA0bb51gygppVueG79Tksy
	q1Agkg3GWsduEr+t3SnrDO476b0xCSvuP3N7Vnc0zeFiINR7PxtcfU7oiNQetfXIMh3xZNGgHG1
	9ZSdDUClCDTiwqvC6WYWqex60DdBbMRvEq/BXSf+gNydl+mRirgFyeRfGrh9Q0kBX+QPF59Y86z
	6HVR7Jrr6zObqSf29zZllezWmFJ0HdQAzAJqGvV7jjOv7I02IzvwxBG5x0j2ZKTYrj3XlcLs818
	x6w23ibn9S6Z0EfoI6fgd/DTgSC46c4c3POx8ii1NxAESUsT0CsmxQ7zZjxsWCWl1AtomwdwAXm
	Y3vvsBZGyoMAXypwZkNQK4IsaAd/ulsmU4uaHh469We79Lq1mQAQwnglW+5AtWQCoqrN6Nt0TOY
	tGlPopq8YBQ5DdUQoDjtYA+fnc6tWt3bOtuWdwL7vrppMYmoufmoxq2ekNtr4V2rACzdjBpNlzF
	g7mBT1/R7MTkSIFbH2mfQvI8H3sW37qn6MGJ/ZbF4EGp+Kih4LHxMxX3kTx+MyX3B3cWevWDbHL
	54YKnDQCB5k7Tz4cRQi1M6wGzeXh7MjOoRneMe+pc4/Da5qiTSW1XxZAZAGwzPC6mTkSLGVjDCY
	o3YLIKiK+8JNWnLi6x3XX4cSgU8FT6Dvj+jHWmz1jhWlyY0445pQg=
X-Received: by 2002:a05:6820:2224:b0:71a:f0fd:a804 with SMTP id 006d021491bc7-71af0fdb3ddmr1565613eaf.25.1794810603753;
        Sun, 15 Nov 2026 22:30:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:30 -0700
Subject: [PATCH v5 15/58] mtd: rawnand: tegra: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-15-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, Lucas Stach <dev@lynxeye.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 linux-tegra@vger.kernel.org, Stefan Agner <stefan@agner.ch>, 
 Thierry Reding <thierry.reding@kernel.org>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063007_549525_B87EA441 
X-CRM114-Status: GOOD (  14.53  )
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
