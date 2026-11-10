Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB0D606B52D
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qJlCckM3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VY1Wymif
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Br3ZS4D/+moufio+Ot6Y1sAX1mgTQ1umhxF8MtFYr88=; b=qJlCckM3SF1v8TYI8ANh0HrWeh
	lxFT5qYjC4Jq2xacZcF/i2hayOSg6WBks0BQ5X8PAyEfiKO3sHBhALBngbepDNQJEirNFbpW8JgHJ
	EgB/1Fl4Qo0NA92NEXJb1/uWyKc41qfPtN8BXB5qLWooqSNgpDWsK9UC5mp9oO6OZbQvST8CKFyie
	Dq+fy3kX///FYoDx/jRzwBb/V2y5eWcaKeVqmedEY9yRM0fUCRipr/B3eBY7eZMSYD+NIuNd8C21Y
	QAGm4LrvqP2fiSWfIgvKQPMF1HcztlPswqkxtXFBd97jyFZg6+8DLZb704+iXMb8XlQPLO7mBrD++
	qd8u/mhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXB-00000002wWJ-3wIO;
	Tue, 10 Nov 2026 07:44:49 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWz-00000002w5D-2RcH
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:47 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-85c1135c286so1122497a34.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296676; x=1794901476; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xYF0DhRIR3VwPKze9/QOypbcYJrT40MxOfLP8gHW2m8=;
        b=VY1WymifbiTRiZolnhitNR/I3OpzNr6eePDUewBngy1xpN9PazX2d+wbG4rSMJFU+s
         SQOAR5S7Jc3rcreYen/WU3h+TJDfqMsXvPbvG4R05dAOXMiRNnYH3xQOicmar/LH73oD
         JVs70aSsUru7m2BvwCKeBvyeVA+d99+JEYSWjJLdF2eUBjIyNYubK8k8NtT6aysaKbhT
         W7HHcUpPu6uMtqEXHDT9EEXJBCYJbtAua/EJO7SapCjurS41vugKbGjDsbKNlDBbcGc5
         Cmdcdus/09wgsCz5OBVSZh/TqcQX86jLiegqh/J6IhlU2K/68WES+XTqjYXEIwmdqmyn
         tRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296676; x=1794901476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xYF0DhRIR3VwPKze9/QOypbcYJrT40MxOfLP8gHW2m8=;
        b=HnP72rpDSXcjqiaxfMvAr2gGOieebuxGWLh6mFAqwZbSLp+BVb9KYWPgA5aahaJ1xV
         uZDvGwaW3RMHsRO1BGa72PVQPk8nxVnH1/m+h5fSj/zSUwGQgkb39y+uvjbUwMoBpV3k
         BZZAjCx+kwsvmLscKNYB9KADzouHly8Ps7ZkHx6ByjL2YxUIThmnpGwPgKARagtzcPtv
         fFb4rmNjzbirrVFGWpwDwB+D9jJsb6oCgf5juEEPJvAwYaY6MO30mcOmSqJ48WEzxAQh
         e1LyoPgSmRI+Z0wtv4Jsh6bCpSt1oMCLgIb1VNmghesYcdRhTyCBYMNMPAytNh7Ya3Rh
         qTEQ==
X-Gm-Message-State: APuU4Z/y18CV+8BSwq9Q6TryNPjSG9TgDsg8XcI59QCk3TxvH0DgnJar
	RCV4oKHg3/u4ihyhN64iRebJzfdtfiJrpxj3ReSYBKeAPn0lHr/41NWvwEpx5YOk
X-Gm-Gg: AYBFou0mLDPhqsqd4/wYk/U4ndBr8k/dkJZaK3JbsKxuuoXkiyuwKXjA4cCP6F50DEm
	mrA4cjozKFIj6rO1aDpfqrgKvtCTBID29GQ7PJ3NWxLv+7QyFVD0bo61NTWqVG9nJFCZUp8dVxs
	14YLIPqDIWL6FxB0uIfG5R/7vNx3ZS2M8hLeBppYfOpBHAJBZYb39wYj7tR5VBTeXYKu9Jl6PJH
	TMyZxDYkhCIAM6TYJZWkrGKBvzRHf9o8VTYylR6BTTPIaU2w1swWYXKSrRocTmflY2rWkoMtoY4
	HH7slwDr9RhYLNH5KQpGyw0xtr+dDs2D6iyTZnhiR50He1viGk/iqtAKeNEC9ODdhB9n7MrspzH
	E+lAwCwXXbXh6jvsGPEMSWcU9frfSYVNItU0wxAWESfccgbNcKJK7oHsqAV0N7uHEBvzKK6d92R
	KJNjgu+dAN+QeaCNwuLkIMGqF78bqILtJ81ycBR4gnWnhl9QrSBTNh389kMcoOOKsKM3Va0YLdE
	Lj5k5ilzu6UYOSLVjaKI2H8DS2vWvkfhgDU3BUVKxAqvat42Mcm7TQZODGTYZmn+5FNCF5eMWoS
	WB0gXsfiUq/iLuRrhQNJOKJLwcPsGjBtO1jtJlFMrCecjgq3rWZ7W75Wa/3IxxeCRO6/zuXAK6m
	qx15EOCLMSrkuDeg+enrfBr8hZArbYa1Tgc/NYOF1P4D29nDzOm+hRyZGzydsMQYOM3HV7AGzVx
	WrLus7UPd/VoXXJzcwVzEbwLdFLcttX+tf5NlofqRVVhiXEHuIh4w=
X-Received: by 2002:a05:6808:150e:b0:4f8:4a95:9b3a with SMTP id 5614622812f47-5683ccd4f5cmr1370262b6e.11.1794296676070;
        Mon, 09 Nov 2026 23:44:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:17 -0700
Subject: [PATCH v2 14/58] mtd: rawnand: intel: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-14-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234437_704969_62EC2726 
X-CRM114-Status: GOOD (  15.19  )
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

Disconnect NAND operations after unregistering MTD and before disabling
the controller or releasing DMA channels. Retain the embedded chip,
controller lock and NAND metadata until the last MTD reference is
released, including references obtained during a partially successful
probe.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 97c82e9c1af2..19c54d3fc260 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -573,6 +573,11 @@ static void ebu_dma_cleanup(struct ebu_nand_controller *ebu_host)
 		dma_release_channel(ebu_host->dma_tx);
 }
 
+static void ebu_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ebu_nand_controller, controller));
+}
+
 static int ebu_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -585,12 +590,14 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	int ret;
 	u32 cs;
 
-	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	ebu_host = kzalloc_obj(*ebu_host);
 	if (!ebu_host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ebu_host->controller, ebu_nand_release);
+	if (ret)
+		return ret;
 
 	ebu_host->dev = dev;
-	nand_controller_init(&ebu_host->controller);
 
 	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
@@ -692,9 +699,16 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_nand;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto err_clean_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		ebu_nand_disable(nand);
+		mtd_put_master(mtd);
+		goto err_cleanup_dma;
+	}
 
 	return 0;
 
@@ -717,9 +731,10 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
 	WARN_ON(ret);
-	nand_cleanup(&ebu_host->chip);
+	nand_disconnect(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
+	mtd_put_master(nand_to_mtd(&ebu_host->chip));
 }
 
 static const struct of_device_id ebu_nand_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
