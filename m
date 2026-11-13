Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C27D606C0DF
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oh6jWP3n;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qdgH380A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TR0CuypnC61jELJsl0XF5lPLsPWUkWFMZwCPhmVBl8o=; b=oh6jWP3nBRQzCjwmdsk50l6qQr
	JnP5hCOFN1F9TMM7zNGR94xGanOOPVqSyB4lO5YgmMSYrlg2Jm6EU4eSIK+XG3wDBWQctbTK0rCaX
	0ld++UfGqI1JwphDzYsM7lrDWPkHPQ1BHu3dJj6RPWEXB/wOzU/9pDXw83w4R5x9QiaU0esyxIQHt
	fEa8U/1LkvGQV/yBpdTeTnMKkp4gnpPXswSuzqpig8/awiQdplBej5WsGmWvadJvX5Fij6HVI6KUW
	PeQeXIa9jCQqm78kwTlf+MGWTwGoUmxSl1OT1t6b0oRlyYav8hIomALhM3M+FXjgGv489JP4Cuj1F
	+crCA65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoP-0000000Dr7B-3gvC;
	Fri, 13 Nov 2026 18:15:45 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoE-0000000Dqls-097B
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:38 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-716b58a4365so1380820eaf.3
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593733; x=1795198533; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
        b=qdgH380AEDFhH3d+NFQLm0Xv/ir3Iu5mEA7Y0n76fqDmxyZo3WATTI6T7LhFNYz6H4
         fhEyF3QIHlbN8Y3uWpT4zb2RIf11bnNOS/xJxK9h0UWL7FyX8w0QhXe/ahMmjCzSTM6x
         04ihBXSz3sHH99cNAlOfLIo9l6XNgpXkR24+rNrV81+bgpx34f/1s6z3Tx/or0suxeUm
         5oQTBPgVVsGfWx8JajR3asAixk/mDT/4NXtIbx1AWTkPM+rolTVIZ+2FZIqEt0wIYTfX
         ORmPw/SaQuz8RXTRcxsZvxIIf3vwM7rzRSPXqtvQ5SSLbr7QDK389zQ2rlPCMwN/zk7v
         zCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593733; x=1795198533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
        b=adJ2rYBFXrf3VzWczgrYM5OwBvVINSIpNghJ+/BmxAZd7xkN/6xAaUYZhb7LXQ6Ldl
         IPdZ66ZQvmmFvbkQ2aM+zvo2DyZRhoRZLnvI9ywkuzKU7OgcTQn0Y3KMwAwr4mhzgqBw
         C0BdSWEhKpIBG8uwuNOUzrDJSHJzU9+v/DuCJv2ApJQcWRywXe/iFJ6LRSr1qyiCdHqB
         031avhLWg8etUeLXjzP3p683SD4brGIebR2hIfaxCZvR9pqrhiDKlchYNLp2wyVCBbJv
         9CL96uJ7eRFZwaO3QSXFwvID72/0TeN+fsl2fsTibPqpYvDcWQMz7piQhrnX7yUpSL2L
         2itg==
X-Gm-Message-State: APuU4Z+YL0+Hl7BBSQZUIumZF+wcrIi2MUAzoPfaxvMsNIEqiPBfHnSt
	h7Zrjt89svYnrTE95DEXMhHpyu0HVACh6rsXanIxTm+5zmbjk3ICJqBt
X-Gm-Gg: AYBFou0wu/enc3ZS04cIvIPwMPCFPg9zEQWe+aIuOV55lLwfwCjnVKknWPBFkwGMRvL
	aAlSKtJq5PeOwOTVjMug4V7qopAPflIlFbKZL1yWfvVMyHxtKn8fjl35kNJ7Ez9vSIkWejnsr5z
	eJYakBdzkyS7JrQ4pRj/y2hUrFoigGcVHukikT3zJ5VIURaQJ8n8dc2d8JLMCTWtoq3zbsQjM0Y
	EcGAj5SvfReX2ka31w9tL2rbatu55DNqTDJmTOS584wRXutlYnpiBXxMTw4560+myQjcOX4zjuO
	AyhzsS3uU3HSU8w1rd1sfgId/10fK5UgMEEEaTccMmQTuga3T267YZL/MLnUyyELpI9g6M4i+xB
	h0CnXvm5n4s2F6bjWHuk61JodJ4CHqyNlxo7ttBeXOZHSQXCeBfuX4HzNQuGEINR309Xnh2EW5o
	stpY8RTvNJa/8Q5iw9Innu3/rdXjOQ5/YCk7YmXu7VncyUeBB+8DPKMPVCfKVvNyIPGbNvewo0o
	kBXO9/rWEVe0zx8y1Q+WoPS8UKYQoFqpU7bK/QIZLBzYPLhCo5u/R/Ae4Tus4Xgv0W9ZrOLbSW2
	YrSrm9kb7LLhUYMzvGyTstvQa67kTMR1UhMYT9AaMErk4PRByvsKaL05ZnoIqJxx2rGm7x3FfD4
	tUEwH/0PsrNAtDeRQbzrcVAEYnxeFLcBp11/I01e7uduLDmiJSBsAfoZ3rM3i0b39AnwY5b9VDf
	3QU7807pvquRHurTd2GLo/rHnmCXQcQDX3k1DSE5PfrScN6N+G3oA=
X-Received: by 2002:a05:6820:16ac:b0:707:5453:73c5 with SMTP id 006d021491bc7-71ab4cf319amr2073260eaf.2.1794593732830;
        Fri, 13 Nov 2026 10:15:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:30 -0700
Subject: [PATCH v4 14/58] mtd: rawnand: intel: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-14-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101536_334331_423480E6 
X-CRM114-Status: GOOD (  13.83  )
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

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index d8071180cc0d..42a1d85b1cd4 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -585,12 +585,14 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	int ret;
 	u32 cs;
 
-	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	ebu_host = kzalloc_obj(*ebu_host);
 	if (!ebu_host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ebu_host->controller, ebu_host);
+	if (ret)
+		return ret;
 
 	ebu_host->dev = dev;
-	nand_controller_init(&ebu_host->controller);
 
 	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
@@ -692,9 +694,16 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_nand;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(nand, NULL);
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
 
@@ -717,9 +726,10 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
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
