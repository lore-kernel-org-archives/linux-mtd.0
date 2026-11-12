Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4500C60A6F5F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vc7LRW3U;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6HV1kZq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pCZu5P6sTOI/SsdJWWRWRlwdMmeKRqhhqB7a50SN1tA=; b=vc7LRW3U2+o6S6S6HB297dfPbm
	H4+u9n4Lit1pPxdh8ZqrCsduJ1Y5tG/DS9jvZELEwCxcJQIIgBoJ6/1A9R1XMd4kpTbMDR4gnWgPo
	Ovky3Dlud1/rqalcF/VTUv6jf7xyKmFle7q/jAAq/IybYKLa8OFkvVMZhGE1DsIHhewgPsT1gnt+j
	m4zg/xMZrp6l9SrZ7OqIMOEZ7x/O5KzL8/PTLqQDRrtm38+24c4/52/IgygvDmrbcjjbhyFq/jmoa
	dKxxTbnS3Sl6vwbCr7o0E5jM5aM54/TKFl3oziSE6Bg8lK4s6c4dW4ronY0KxyhwWdHQsbqVGdLLd
	SVYsuNKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcP-00000008LVP-2NkM;
	Thu, 12 Nov 2026 01:28:49 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcG-00000008LEk-2IMn
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:43 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-563a0462094so1890286b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446919; x=1795051719; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=C6HV1kZqxxraVxXIgUp00KgXuxKX4ZK8YI7ENadQVcA9NX0xJDYWso2GpfnoPw2xOm
         3jI+cYwFZcXDqY93Gxgb/LCVG49p7b19JrVXAXFsvpsLvY6eWqZ86VDY0iHMbawnxQaB
         by/eAI8B4HH2mIC2uk1AH80mNzJdqSBObloDYJ+8eA6pNgIiBJiriBrgQTfolMHivUSr
         kcH1rbvUAy9OgsAjnlIZFgIjeRp+WTnrCwAs4MZ68ePy04wR+cbmWHEWWe6NKY/DRfBx
         yZ2+pVX9F8qv+gLkn2j6Vgp8q8N7aWjLSjk0jvNdvyXSwfdnWyRT3MKwq5/gwkCoVQAg
         Rk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446919; x=1795051719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=MVBENubVhgw4faJG2SFOEh7JL/yyVGNbd3vU5nv0E0YBf8Je0ajFDT3IYjOmkLMDTE
         4lkhx2d2A8s04aA2Wc7ZHnPY+eADI53ct1tdEmZocwelF4MH/PRhWrqgTteyk99voQ41
         pFvrzhf5F1E9SGuoKU8lfh7X/kkqaw2ufs7ucx2Ok/39kS0quETNt8d1AhPG6s2gpZmg
         UjB+C5Y7Cj50zJ+wgqEKsmakwMIXUY7xrA/3ndE/N5Xtczfn2NdpbiC4kDDwDWk9OCN1
         0puh8+Wguri6QyEKCQCEF5wN0Gb1c8SbqJHgyqWHc8Yk0unmA+7Pl9xZyajLhyknv/bb
         Dl6A==
X-Gm-Message-State: APuU4Z/fBkh3tzJuXpME4snxORugeGRkhER12Ka1qybi8vmd4kFsGG+T
	mRQK4GpdO6eNycDUlxzDoS9YzNb3oI/GYun09JFzpQZjM8bmHUTqj5PJFGl3B1eP
X-Gm-Gg: AYBFou1qDYnr9ZioSXOpVsN0N2rK30Shn5GfoczJmWd8ynwBa2ZlbbE8Rc6Aj9QvYS5
	W7MGvyH3zODVvmqhQS4qz6wvAJXwfiBA+fwUxNr8cKrOaFq09Ye1yqITxfoBlxWjqTNWe754hoN
	AZ5kSIEosnzTec7q+VxbqVfcxmQg4zn4RS7v0DalR5Wcoge7i5WtWlheQpE9lQ8XhkZ3+62GvQA
	4MVT/9DUSSMAwta5pEjDgpGH46UtEn/1jW65IkY61nCS3vs58iR3b9O4KxU3f7GH2BGhbnEmJu9
	v1l/PxP6v+QEmmPjJc7ol41aUgiVfvVX/2u1sS4q1vmLfUP7NQqYIdIiQvJBN6Dq0j7oxfjQpC4
	TrH+Tvnp11oZUQNaD2eqfyZMxrObim6U9YZIDqi2/FzB0iF0cP83L2mZl6qXFsv1pTbij3wXN22
	xMw7JbKySltMbncKTrV4o0kKX5bHTQKJutLzt0EbvdUQkYkP94Bm4TD8ThpsuCbXg9IBfz5WF2a
	vQk05xZdMEckJJv/HhrexZgXg98UsI2nX3gM8SX6KhEU9zQgEgwVBIcSp02WpjwhJfq9NhFGqGb
	MbmiD0sVcMdxXunke0qkycAhsXZqhBpy/fi+JiQPjkO5NZg2I/8XLVUCZ0VdUmjK2a8zo6moq4Z
	HNF1NLbzmNbuuiTDvqOPmZC+RWvQKp92geq63rGJKGoh0JXX0bbYO805BJSM0xPhFeYOcrr/gat
	Ey3hjgssCghjzFabvwzcMCoVcX/fHbakWxWH6feftkoyZqOPSOwwN+
X-Received: by 2002:a05:6808:198f:b0:4ea:18f:64b0 with SMTP id 5614622812f47-56b98c1b3e4mr4154573b6e.67.1794446919315;
        Wed, 11 Nov 2026 17:28:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:49 -0700
Subject: [PATCH v3 10/58] mtd: rawnand: stm32_fmc2: retain open-handle
 state on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-10-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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
X-CRM114-CacheID: sfid-20261111_172840_696231_5C5F5341 
X-CRM114-Status: GOOD (  14.72  )
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
