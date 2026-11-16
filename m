Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA27606A890
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HEk55Hys;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9yIlOHv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pCZu5P6sTOI/SsdJWWRWRlwdMmeKRqhhqB7a50SN1tA=; b=HEk55HysEc/9jzxpQJWFGMR2Ku
	09xa260iKGSsuKk4fdOoLzSsBzEgQqEDg88kLSdkuXHtsQnfboYnjrKXW3GjXadMMDvwRAxf6emWA
	xPtaZNVSF/zoUT7O1LUH4/1oUYHec96uPyzawEM9ELKWbUHZnWNWD/lFBwk7f3E5u4CzpTTJvMKD5
	ONNwzDhjuHqnwkM4dvja/prYoWnJJW8i7WEkChYfwlkLRveAQrpdChd4AsWddVy9GbwBx+uy19X0h
	6kBIR6EWlLOVNxsuB2APFwOc0iWZfD0WhirsOtoqFNjUHs0MVJdnWJH+TbmfXVcbicwmMtm+4RwWS
	9ksbOV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqE8-00000001F4A-0UU0;
	Mon, 16 Nov 2026 06:30:04 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqE2-00000001EnR-04d8
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:00 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-702fd86d674so2708622eaf.2
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810597; x=1795415397; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=o9yIlOHv9AqSK6NUrfr2IJy67BC6po2KfvmxNcrz0J+41aI4YhTbSLadNoWAZFSJEk
         nOsm/9V+cT7n8S10cmCCzTjqES2Ebsa0RZI/Rxqk94wbmn58Ls+l1asV0fmD+HGnTim0
         lW3OCw2eccmLMwUk96qVSizVz/eeliulNd9h4HYGa626HwLFqAxlZ2Fjus80O+LAE5XG
         ozj3h6uNLw3/hEHrSz/DM9qFQXadh0km8OjZitO0pVVVEta23d1Vq7G0sVYCZgomeXIf
         OuIpD76aZI20aGDgDHVYoqQcxR3CnWa12c+wQ91r5iOa0+nQsOwbJEXJkwNggObgSbNq
         CpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810597; x=1795415397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=GIxQSxOz/RO4AOBYiKwUAzmhPqNiTF4Mw7hbYgBgHWht6WeSsHMgyUhAcL9284dEK0
         D7uw2GO4pOVmEt6Tb+bYA60W/aADh8XfGLgoRArscSby8fFpWsLVMb7zbV5Q5Rx5pVWC
         2PNylHuVi5t/wK2Vo7b9+M+DpBjW3E7uTQR4Z3yRZ3FcJXzlaQHCfmVCkj+N4+nEyWNu
         IJ++vGr9bEJDcm8WlDR9cZSCS255m7KcPbWDbmJZ+wbcXkd8ZpQ9+eTJInY7PQpUZ3KD
         8VoO+LJNmki5jakSd+gBC7v+vDaGLOcOhU+uckJyZIPe098MdRN+/fvObp8iR5ZIAQ1z
         kdcg==
X-Gm-Message-State: APuU4Z9w9yz8upjP67+sAQdOIMT/KVCvPzgpG8rXLy5PP7bAFyJDqqKl
	lfEQZsEvwkluWgPHZ24+Zek/ieaR08ah+wpGJq7tIDMndngYwF3YmHwE
X-Gm-Gg: AYBFou3NTxPx6w+pK1teB+01NjjbHF9bMCSwa9O8SXxJEZMtHK3f8PiHYLKGZpvOTUz
	9TdnPIex8lOt3QGbOLDeN8TNaa19DtIqRnpIi21NaDLRH/HtxH+SQ0e0hkdJN4cskY+ta9c1pRn
	OUUb4JJ33cAZ9gjCZ9eCaf/n11guV01s1meFPToK8znngpefHSNdHwlILzeqf2MPyVt+DOcXDiP
	YxAY27IWWu2KDBAWgiMPUvzTV+SQzheqE9ERkoFtWj/Dqcj7YHOQhb51S+agZ8GWirQYD/1t/ww
	HVK0aHXLAHpVG4GW9tOyEFbdjU7Ysk6bLgd/ApQRHqO03qAj179ztoimHxdGIz2xcS2Uuw+rtSk
	on7hDlEKeBonA+pZOsudHS3aSD4kVNJOECcSnT8l94G5Z7RWXcEbPJ/xQ14btCBbEMz797xRlNL
	kmtowNGvULPZCJi2tgOocheSi/B0AzKTtO0xerCFcNJMVNHe5Fhqj0BkFkVDgVt/oazKRj3/sR9
	hy9x6BKf78hI+io3zWrEkOiGP7IqkXvVrhanEg8Gf+TzvljRXF1Ip7Mkt7pFsasdrNelDglmRfv
	tTpAfxHtVB6DFMfo1AgSmzysGmpDc1GpjIdyWcL4R5adLc6yvkz6jF9WV7x1aqddBvB/jazg5uU
	XP46OdvQoR5vJFMVQAeFDngv3BKFdvfngEJQIauyLV+bj79g8SiG73caYfPYzQBDXgqrzugGsw/
	hbb9oLKHcGsWy7DDyT76gNkM6cRivKDbeH3mIlmJ709zXdqlyXCoHhMEojAWGQ7J+dkDy1smeA
X-Received: by 2002:a05:6820:a287:20b0:6cd:3ffc:e336 with SMTP id 006d021491bc7-71ab51d7135mr4392333eaf.84.1794810597121;
        Sun, 15 Nov 2026 22:29:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:25 -0700
Subject: [PATCH v5 10/58] mtd: rawnand: stm32_fmc2: retain open-handle
 state on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-10-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
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
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_222958_075685_4AB81358 
X-CRM114-Status: GOOD (  14.25  )
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
