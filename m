Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EDD6070DC1
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NL8J7vGN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pcVC1JgL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GWKIFZQalxa+IloODKiltiPSFDor85C9oVfRJaOxRuU=; b=NL8J7vGN8S25BcwJlOdF5b85mn
	jGJBkeCfpMyi6au0a/IMnDbd9/xkX2iMf9d7OYcpZDDQUQs5jXGp9aUzerpoulg8BfPAurkw+6fDL
	dlBQnZ8yEWObvR+j7f+NWpSwqW3j81lINJH7MCS+5QyuuAot2/QNVBEhlxQ437PGZTU+NmE7K9oyD
	ElU+m3JYWSz2YDgsFkOVKw1rw9E1wN5oNgyebbD4iLGzxaKh00gIdxvcQuazBtqHblXcGg5CCnjui
	/EbLaEcoNWfLTA8OGfte5XhoVi+RfWGbguawm9hiDRk8dMmj86bMnAfL3VAOl8O87o1hl/9Rr2Yhc
	iWgajC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcs-00000008MQZ-1hrt;
	Thu, 12 Nov 2026 01:29:18 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcR-00000008LXl-1RYn
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:00 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-85a5455bd3cso2099058a34.3
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446930; x=1795051730; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=pcVC1JgL5zUpIjQdS2dGQed9Ao9s4uNELMiaIo/SdPGbJvVLt/8Evo1Uj9sLTpE+Uz
         5k85JG2j0vVNosR9cRaqBUcPmEm519gA35eyiQItFu34Op8pdhqpkKLvaBcLgKwpvp4x
         tBdH/nLcxRrMnTiL1G51ChBqgD9XOKqsrn8nXDJeJ7pqHJKXUkIv+TSScmI/akkAXD1J
         gUCstMZYnAcQL6/DnhOZo2wRc8Pooio6I1t/0LtiB2k6AnqgxladGLA1yoq8WkOVYPe9
         DcAo3bWmcbNR/w0FakFXO8MbPCEdQBAU2RiHbnA7tVlZFUF3GqX/ptrp+htKpe7rp60y
         0Fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446930; x=1795051730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=A1cTOHzzp4q61jmcbv+DRfBCD3BKnGRo0EMpL+QwcKygnR60ErAWK23GOm1OYMgAJb
         d4lzqqokYy7EyPKE++fiJo0vvjW7Ln3zIvrr/RK9pPMyACEQRIpARwdL1xIAFn1VNmJt
         GatrBz9Y6TjkgBe4Kw0PJIXAvNCMsx1n5QdoBoiH3R4hL1OTmc3TuX0gJdFHTDsgPhz4
         wZMVyPmW5mlyugxZQe0pwN1JSn82DW2GzcgySN5FFb/8Zde2OfWCadtrky5j+7+bA+PK
         kNfVG28pSPhkVlUlkOPjlBKovMD4jfkoahc9qRdJk27KeQufk4qFuQZBUCYwtLgLKE6C
         2ZiQ==
X-Gm-Message-State: APuU4Z8tDsbD7xe140S6FXRQhRsq7f19ZkOIjs+VrCSPAIz3QcTSq0VL
	y2T0cFFnMDnU66jWG314van94pJFEjF/wjK6AaHJdWgVm8FjHwSadYbt
X-Gm-Gg: AYBFou1gq9NZawdpsP/LUvPEonh+MsiE61RPgi/JU9CDmb6+SAtHzzAhSl7FF+VsPcg
	479zOtcrp/FQRxSjabE2MKQetJQCzb8cUtbKa4gyzuhNDfIlUDROyPsdSp/uBZLJOJaUqD0s0fT
	J/9nqY0t/FKzh08Dwle9Dx3+lT+evYmSQkRc5/1bWpc7qavkQ5YbMUQ5U/ZUr9OjJ3ozyBVzrBd
	EpX+Zguc/iP07aywsP7+nQ+XLopJoD5AguHSc4dbzkWXh8ZY/QGesN+aJicNwu6BmDr11xzqdbz
	wxzgLdII+RYvrKPHJxW6r4pT+RF8WA6lF+iN67ITUwGAlctb2Fv9459S+ccMhXFh/ZTpGH8D/2Q
	ktjBrOpLHo3K0mjQaVvrmL4iA1bixlgAzrRm9WjP62ksxdgiMSkw7Ce0uiBh9RyFOqGZlz6E6Ge
	tJiIEGfI2iEn9zsjyAW1msh6A5/4FDbrDUKsReH5eIR44GjnrcklfiSPHqnb01XEvsD6SZXGqDr
	5bqSaFjwymoZSEbwY3ar+cw/kWAbbKnpN+vybXK3u3L+HVtYRA1m56x5U6Pn0dmCzP67qZFbt7m
	/tvKsogJb48SX999qFbvvEoEsm7JdMWUyuJX+kUVFDifsE9IMvaZJvnF7Ee1kC0ch0V6MRlSDfw
	CgUgATc4rvx5HbOZP94C4J7bRiVCC3xMlGLQe7muSPWkWCMncsyxHUBAPQRMkA8PB6Ji2Iv3bf4
	FCUk5tZdTqrMTHLLWuTJ7Pt2dAlwMI4gqxaH8CYf64/DW5UjFXMzQO
X-Received: by 2002:a05:6808:6d8c:b0:4fb:6402:a8ca with SMTP id 5614622812f47-56b961927aamr4201294b6e.21.1794446925119;
        Wed, 11 Nov 2026 17:28:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:54 -0700
Subject: [PATCH v3 15/58] mtd: rawnand: tegra: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-15-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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
X-CRM114-CacheID: sfid-20261111_172851_533629_1DDD6C0A 
X-CRM114-Status: GOOD (  14.46  )
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
