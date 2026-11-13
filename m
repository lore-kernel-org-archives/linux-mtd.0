Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18D1606AD8C
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iWdxZFKv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=llYlluPN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JJLB0L4GJ/JogI0lW5CxdnlzJCoolXgSVsiSBZQ6MeI=; b=iWdxZFKv8RB1pP4kV/WknAGn6Z
	DH8LUP4ca9XGVq9H0oi8p/plgBW5oGXxI7fy129PH7cgnQ5b9vOFR54hqONt8l0f+SquX0HPw0M/b
	Dc5amKnW3I0xo/S+0zUgwKTlbP0M/4bmHJDJCMZ8svtzhqj5D8Oov6Yp26Zcs9wPyR85cEH3dDMZ3
	iHwTGiYHwJF/+BWKFLQyDZJBfxXmpUh5G5EkNF+5MEiTh7hy4UQGHEH8IWe5x6BowLaGqyBtrVQ6V
	rP/oXjOdk7+geBjc00fxnm01eA1m0NuftF5gnvZhzuzkFp+nPQaXaTdWDte0L1e+PdGAl21K0ULDh
	Mi4XN4ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyo-0000000Dvvj-14m7;
	Fri, 13 Nov 2026 18:26:30 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyh-0000000Dvpm-1Vzf
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:26:27 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-4adea5b7a2fso1138379fac.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594382; x=1795199182; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
        b=llYlluPNB+TxdfsxdwWgU37zm1ZYQd8VN806yEfBTMBPXb5vZOAf2Nbz29ytwKnFOW
         SAYmcdk5wm1W0KH/RCGZ4MIeC/hLSvbvnbHMxk0m0FwOFvxR+YatsRPjSNPnufUKYclN
         MOyn9kHFqbFrATIvhDXARkTOmfXNMNVXu30tWjsN0ITWj8icFYdqHnSKwxl1VnUfRtXw
         Go7Ry+BZM3BV++RXOKaTW1KLafAtqNGvt0bQdstKUnrqTsu3uCc6GGXKvJGJMzbAZ7xI
         GImdVzIj5GEz9uqlQaieeU3VMswceXPl+oHUN4IOVkO4YXdpL1oQNq7ewlZgpn2Dkx6v
         +R1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594382; x=1795199182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
        b=zoE2prGskUAeswYCRefRUwotthT3c5TxlcLsuXFPveB2RDYlsRzNkD78If3GELTiwx
         X1b+P6jHZiDC42sjfPyaveA1DuaI6ydkVbUxIL0vHV2kbVLbw53nlisRBDktoQf8HoMe
         Lr1Ful61kPsAGtGij8Y+Ei6q4l4E+/F9fR71zepnGk1bF+kqIyUyozo6Ds/ZNm/jDkfD
         veuRp+GvoWKTvnhhG3ATkGpGQ/YYOYIOpKDalpyHhEINF7GtuFC32SD97pH+EcIxkylJ
         VsUWaLqIEIe9hKbLVgL2+Mtwj/eo7an+pzyPrjMbZ9/8w2D6g0dJRAJh9KrWwJOZDwN9
         KCjg==
X-Gm-Message-State: APuU4Z8daL5HMUiVmt3RETgOWAKDSrfKG1qH6mWytVnyPyItvuggPmAZ
	aYtHgTq0LmqDiSQh6qrNRY+M/PWooYsm2dXzBYHRHSf6JcRb4Bm/tZAT
X-Gm-Gg: AYBFou0az3NYH/S9IaZ1r56XdGPctth8k3dcv6q5DvKWP/v0CFPfORI/KFRQEUyjiYa
	MmWa1QEx57J9wCuZS5LNlS71UeKBOqhP54BTsIjh8RSckSfrMVfxQvyLuCFNtwzG9rhOB8oz8zV
	M0/YwG03jn+HFWt/d/RTP11S7NFtGvauE2NKDmGI7u26RZ9Uy52oPA1FTW+Bq2YriArwhl6pucO
	KijUkFj22ePGqybUgxWWySIts6NRlgH+uH1qteOuD5o8qMn6j1Mq7Tfhn4JI9uyUI8a2sgvEXX6
	2W2Zd9tLc041U5JNfXzHn0daGWif/VrhbBaU2L9h6fo1hIp3QdsgKL2ZwnuKiewc7mfGxvyQy7N
	gXfKEAwGNKm/1M4XwcDzeG/odL2QsnRRFkOs99hZM45h015UoI0W745+Lno5wbcIzlhy8z2aek4
	D5EYc8uGhd6kLSdLI6mTgQ7kWR28Q0j0vYAn46TOmMjFfewJU1mcuTMNCPAsF2KBVhG6cgVY5DS
	2w5Ve+yXmDyLV5fN9L+E+QZZPAbaDbYf+Sg+dtUrb6A30hlDR+6h9C/czhYTQZOuwRVpz76Akxf
	VzNR3qjRZe7Lbw5VC6yG3LtgQ/TMnuD6YoFsxqvggLQ9Q+L2DSs3IVHORNOpvk5Q3HZVqoIKTaV
	AMlxWlX3jBeBr+O9p/QrV+Sz5po00fq6XmEQU4feQVIrUTWbXlzPyGIQAAchUoFC0byh9eUApC5
	50t9Rq45NjhIuRi82hwRtwwmB5Qkd9Ehx+vNTOCAeRtkcAOX1SDbyiHp3bR6gO5wmbDJAE+UgIt
	A==
X-Received: by 2002:a05:6871:440b:b0:4a6:9c12:94f0 with SMTP id 586e51a60fabf-4afdf1714a3mr3190315fac.4.1794594382251;
        Fri, 13 Nov 2026 10:26:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:08 -0700
Subject: [PATCH v4 52/58] mtd: rawnand: bcm47xxnflash: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-52-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_102623_418536_543AFE38 
X-CRM114-Status: GOOD (  13.77  )
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

Disconnect the scanned chip on removal before the BCMA-backed hardware
state becomes unavailable. Retain the embedded NAND controller and chip
until the final MTD put, including registration failure cleanup.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/bcm47xxnflash/main.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/main.c b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
index 4cccf00f67f7..fac96ec596bc 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
@@ -26,9 +26,13 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err = 0;
 
-	b47n = devm_kzalloc(&pdev->dev, sizeof(*b47n), GFP_KERNEL);
+	b47n = kzalloc_obj(*b47n);
 	if (!b47n)
 		return -ENOMEM;
+	b47n->nand_chip.controller = &b47n->nand_chip.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, b47n->nand_chip.controller, b47n);
+	if (err)
+		return err;
 
 	nand_set_controller_data(&b47n->nand_chip, b47n);
 	mtd = nand_to_mtd(&b47n->nand_chip);
@@ -48,9 +52,16 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, b47n);
 
+	err = nand_set_lifetime(&b47n->nand_chip, NULL);
+	if (err) {
+		nand_cleanup(&b47n->nand_chip);
+		return err;
+	}
 	err = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (err) {
 		pr_err("Failed to register MTD device: %d\n", err);
+		nand_disconnect(&b47n->nand_chip);
+		mtd_put_master(mtd);
 		return err;
 	}
 
@@ -65,7 +76,8 @@ static void bcm47xxnflash_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver bcm47xxnflash_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
