Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E925607E847
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r5xcj7Bx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKRJmqkv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pCZu5P6sTOI/SsdJWWRWRlwdMmeKRqhhqB7a50SN1tA=; b=r5xcj7BxpnEKrmc75a/IosjVQv
	kt306u5n8l29pMWw0aC/jjXGgocNU/kboaUnmpHy9H7ZElWNzm8OsRo3l7eTAG1MlrIz0evFoUe/p
	ZJQMpJ90fYgkSiQCyX3IGiSJDEyyviBkQ+pSRn6N+msZotKVmEeg4zoKvp6up3F9uWMRY2m6nI5ye
	rWAlVdHSuQAFVtaCIf1mT3mvoymZhMuCIY1QQ98cAzpZ8UpQxbVps2PxhcRsIZNDGumGpMRi3bcxa
	5vouuzawe5PWkGpNu7MmgX2ysexXoM6ISgJZj1OTlEr1tu0TdJPdbQUct9PeNHU2t3XTn4indINow
	ZDI4cYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoI-0000000DqtQ-1xhn;
	Fri, 13 Nov 2026 18:15:38 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvo8-0000000DqeN-0y1o
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:30 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-8479f46ecd8so448806a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593727; x=1795198527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=SKRJmqkvON4oqF7iISIyY82W4L+7y2C9OBtcSHWKfa9ee8AYuBc64oNlE1sEwxSYGp
         sYXhopcTr6ebPXYV2C9PPBbN4RiyTgB2FgtoyZtQVDPFjafANBw0N5wQzEy7rD77Qre3
         pt1TbdI+GvlgSmjcOeXRE07rUIO83eLKufjTCCwIGhFdB5u4b+YymbpcjRGNnQy7wDyi
         6Oc0exWOgWEbdTBdJDzNNKLjS4PR7K4eSIAFW8YegoiNm0omOcixsM5d7+si5hJQhh4P
         TlaoLg6fwONfkur6X/O2zYPC2YvEtn7/c90Pf5y8UC1BqxLAsVVnlzWDQKCk5dajTVKB
         IPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593727; x=1795198527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=P25Lp8NS9SJgUZbyJo04E7T1ZWz6TFqOF7lERjUQx/ZRd0uKRADYkVeVBzmIMJdYrj
         tFUyYdouaYx4H0+NR8716j/LC1Xpku0OHUZ6ukKIu0443w/Qu0ensPb7QHtutVskdpHq
         T0JwB7Y/yJpfgaA6GzRkHlqgr0fHRpxe8J1DKHYF15h7+tRT5Hhb5u+cwvcJWBd5V9Mx
         4he33S5PdRLkZN2DLMaILs83dzfLGXyf6uGYb03GhYGHXv0u4ajVYWU/oNgEJcXSTVD/
         3/lEHJ3fb8YvwxQQ8SW1h/ES7lOO/PZP8n/777K8BTSjzMhmBleEwK9EDj7xJSdH/+fi
         LkCg==
X-Gm-Message-State: APuU4Z9ZrLr6HT/ZQ01+yVUFsmRimYvjI0ejZVnng6ViYiCswarfGiGD
	zLVjMhPq3telzv6aRwQwtTmF7uWC6qaJ8QWen6eulC8ZmNBxVst/qPUr
X-Gm-Gg: AYBFou2Z5SRd45eyVq/0kA9sBEUzffvS/xroJxLCAp8iwTxqk7Nfif3YubAehKcFyQJ
	OjZFo5VM8M8xSeMBvMtrds4xcnF5Gtv7G0FrNgKyYJWqUgiYQ9IfNEBNWubrhrw3ej5aHjXFe3U
	TwLTA0H4mph+Khawz3llKFPtwtaJNg4NBnnh1kgKpdRbYUGMLjPPAq3c0lTLmvHOlO4KKUc4Ep9
	p+ta3cTi3QXdApm8wmAemjj5XEUGBVTUcswmMPYZ+/jSPdYNSCoi2hLTNBkjHg53P4ofskY1Pv2
	cjUl51FjXZCx5thzW/yyTkHTnm1CPDy+q7pI5Gw2w+6FH1ebEe29mXRI4lsKbvLjlfmRqbT1OcR
	eI6eCodU8l8YdsWI+NfIyJgz31gA+4IRQJaPe2Z+9fsISVrBKMn1rLvLl8ORwHMP7poR4PGEszw
	97gMQlfKnlNkiLCF5Hj0VN50gqCFpRF5oz6sjtNmjUprx75knQOlodbhypT8tOmwhaLzGTpTcEl
	EL3v+MKoZytrAeyS7+99zqweCmcPjDYl04S+2OgZ6RONS9jRtvfUdrZdNm7IDYLqZHQUhTcNioH
	2yQsOZBKXktJgSv1CogdnGaMie5ZbRGdbIgKRGz2hupUsLVUJOL85YbUaM47XV/qDjUq1STgwsz
	bAU94wkkkJbGCLNyl43KLsFeaFEjS3PQr73Cgz8sAdF9+3tXCab1wweupqLCx3tEpGTdu+gGPLo
	mXvyxhQ3IEePlkKNLTi00VgESfee6wLMW5ZkNxv74w9jggQrS3ZT8=
X-Received: by 2002:a05:6830:924:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-862895381c3mr3936909a34.0.1794593727221;
        Fri, 13 Nov 2026 10:15:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:26 -0700
Subject: [PATCH v4 10/58] mtd: rawnand: stm32_fmc2: retain open-handle
 state on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-10-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101528_736214_D33061FF 
X-CRM114-Status: GOOD (  14.18  )
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

Keep the embedded NAND chip and controller serialization state alive for
MTD references that survive unbind. Disconnect operations before
releasing DMA channels and scatterlists and asserting write protection;
run NAND cleanup during disconnection and retain the core-owned layout
and controller storage until the final reference.

Preserve immediate cleanup before publication and use the retained
lifetime after MTD registration has been attempted.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Christophe Kerello <christophe.kerello@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 78af58d87960..2b8c0b467f7b 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1915,12 +1915,14 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->base, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
 
 	nfc->data = of_device_get_match_data(dev);
@@ -2024,9 +2026,15 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp_enable;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_wp_enable;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2061,7 +2069,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	if (nfc->dma_ecc_ch)
 		dma_release_channel(nfc->dma_ecc_ch);
@@ -2074,6 +2082,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
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
