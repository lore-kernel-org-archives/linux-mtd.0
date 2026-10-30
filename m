Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26102606A320
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Z38WvvW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BcspYYx5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iOo93ASElTI9bZbXEEuIkSLUknZjL9DF+CyBnro1t3Q=; b=1Z38WvvW9NVfJaST9toZ/O2BfR
	n3WCLsPDWl3loyYrT9a5AsnUh9dWyOb2TI9QpWNyBVvKSL9+KX0iqy8WTxuT+KEIcFvSOlXkMBd+V
	u65LAeUTlSsK/hcDNMYM1k2qbX92iOK6DC2G/Dr+DGo7ORoAFn0wOIuWpMWNueEYE7FrDY2QXoeLj
	RScy+TRY5cbqKOSefWu9844E2e4PhdU6D9tpBVB3x8B8pXD3eLJQmk8W3Rr7CPGS3k5ygXsVZ5C8g
	8gH/1NgdMNCyURkanjERfejx/dHw7VIQ5E3n+8kgiT1z4yZCY/RAgTdSL5COcFXC0HJQvCPEAaBSp
	eRFTisqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoNb-0000000BzFX-2ZbU;
	Fri, 30 Oct 2026 15:18:55 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoNY-0000000BzE0-32vV
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 15:18:54 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so390891a12.0
        for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2026 08:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373531; x=1793978331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MjztBnlV5pomChElSlFxYSq9kFZVSiTPi38g4YWVXI=;
        b=BcspYYx5XPSMqmuExAjeglVv9Z6VC8a+ZKDGbyKe9YpnG1uKSiZ1iSnfsIQmn80tbi
         YJqcaD3US3CkMXHYqkiGHXw77fhhyOiadF9xAmUxY//fkGv/lnwkviSfc3eqYJnjqkW3
         0NExvtD+FQlboUYY/oZTWuQqvWlAPMzha+s/2UcEpy5s9/eKU3CfZNnpV78S8YvTWIPu
         Vuc2aoKTOTF3q7TJGamCsOBBFTqxf3+ReiRPnX8VxVP9r1hQGJfCeg6zawzBFOFouHWG
         7U3/3nqnMQEorikQxgtgHE2Nu2vHAGjpEyW6b3Kan/rVC+2sNBzptHDJ1cCD7O8Fj9eU
         GT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373531; x=1793978331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MjztBnlV5pomChElSlFxYSq9kFZVSiTPi38g4YWVXI=;
        b=OXUv3pMIjteaqwG2uGUGCWvJ4+xunazuSRvKtE1sL9UJxSMLfyMJSgVMvUzjIVV379
         /WbmraVcMIaFL6UF9fFBX58lKLz3tD5Pf1lFP4dEPjLs/VV8VIe7SRTsdPEe1XEmbrsn
         o0QgLNEl/UZoMyknNiVfP6gsWV488tuK3WswoYWEESSwFgAW3+MhaXA9XpIp9Xzvnqc8
         9T1v2JeNtCAQqlaiUO+0/EgwTQxjzeZLiEGG91pkkMKvBiKnnnYe1+SjEBPLrY/XHfhv
         uXjkkRothVUVL5OPTCS4giLDH7j2K81wcQrPrISsZtVT61LE2zmpSo8Qnved2kuuuKb+
         6JhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUjndONqvdkx1WmxrVP/Kyr7QMt5oUfP+RBaxGjeVmSQkBj4/MJg7kbsrqt0xBmrBXzi+/qV9MkDw=@lists.infradead.org
X-Gm-Message-State: AFq9FYLSYiSQY67cwXEgCF3tNcFsrjIH39NxZI2SdnMEWT4fiTV6JAw/
	Ckzo0Hm9l6UO9abYhdUN3AJ7KUFD/i2NlWElJEB2vCjlNiiF/PJvZE2j6QC6dgADxPiluA==
X-Gm-Gg: AYBFou3b/07Na04UOCQLIhr+ynfUuG9Ctc/dJtueUaWstc8pflpDfxclteX4fNEPgtN
	Epj8mJyDtNzQTAczdb6KDJnehl6DYrwhJon6F09/hquDUu+xwV0KqClH2Wm9iOeTLQUj0r06KCt
	VF2dzuP1C1CZ1+FoeRFDrUW1TlfbBqibiQHfr5DDSTt5Q1tYPwPAa6Kzp+8aa1fSu3HIdgjEIZv
	z/wY/M6njoTyu7l8Sp0AwngC2vINnbRgrDWyXMr7j1lHYB7S63QJ9+PK9mMPr4uRvul8KO8f6kr
	vkO2Ef/GyMq15N5NCzm84x3j0e5Sh4a1u1+bjwy28vvYEVrbMuls1nGiu+RZgO0eOQI7OKwL4s7
	KXSw/JoYa7yYEheR7Uq6rsxuh1R/qkR14xcvMK98kzdsYNDhdPpAvdmGekAEmriA+THYlz7FcmD
	ogq7U4xwB6plqMOy9phNt3TDQeyd9FvE/bSR8xY/JR8VMIToqN3CrM2VNu5QgaN2z0dVZ0R0WqH
	x/oFkgYz6NJN7VheNmibxrIPV0WU/THuuV3OiU0FySYYg8EN9KYsBNc7GDfcQMR8noro18IfD8P
	Ed0JXeVfqBNJbgz9HM4ALWYGTULFhWU5AdYMd1szP/mZ1ma9ZVpHF+lARBZPahXSo11GfxVc4FB
	Fy3xaz7/YYLSb2+Ouzm/pLH/UrmhFxshoLR03EnauJioMxUlSPPCNWW9EuiQusyMlKYCKP4wUT6
	dEpYkpIwOE5xib3mA=
X-Received: by 2002:a17:90a:e7c6:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3ae897c8337mr2072805a91.17.1793373531260;
        Fri, 30 Oct 2026 08:18:51 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845aa27esm4299626a91.11.2026.10.30.08.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:18:50 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH] mtd: rawnand: stm32_fmc2: retire data DMA before unmapping on errors
Date: Fri, 30 Oct 2026 15:18:43 +0000
Message-Id: <20261030151843.2953269-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081852_768099_D2041470 
X-CRM114-Status: GOOD (  15.39  )
X-Spam-Score: -2.1 (--)
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

When ECC descriptor preparation or submission fails in
stm32_fmc2_nfc_xfer(), the driver unmaps the data scatterlist without
terminating the previously issued DMA descriptor. The descriptor may
remain queued and execute when the next page operation starts,
potentially writing into a buffer that has already been unmapped and
returned to the NAND core. The timeout paths have a similar issue, as
they use dmaengine_terminate_all(), which does not guarantee that DMA
has stopped before the buffer is unmapped.

Terminate the outstanding data descriptor on ECC error paths and use
dmaengine_terminate_sync() on timeout paths, ensuring that DMA has
stopped before the associated mapping is released.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware. The patch has
only been compile-tested on arm64 with W=1.

 drivers/mtd/nand/raw/stm32_fmc2_nand.c |   13 ++++++++-----
  1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index c08d6b1..82d6301 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -915,6 +915,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 						   DMA_PREP_INTERRUPT);
 		if (!desc_ecc) {
 			ret = -ENOMEM;
+			dmaengine_terminate_sync(dma_ch);
 			goto err_unmap_data;
 		}
 
@@ -922,8 +923,10 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 		desc_ecc->callback = stm32_fmc2_nfc_dma_callback;
 		desc_ecc->callback_param = &nfc->dma_ecc_complete;
 		ret = dma_submit_error(dmaengine_submit(desc_ecc));
-		if (ret)
+		if (ret) {
+			dmaengine_terminate_sync(dma_ch);
 			goto err_unmap_data;
+		}
 
 		dma_async_issue_pending(nfc->dma_ecc_ch);
 	}
@@ -939,9 +942,9 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 	if (!wait_for_completion_timeout(&nfc->complete, timeout)) {
 		dev_err(nfc->dev, "seq timeout\n");
 		stm32_fmc2_nfc_disable_seq_irq(nfc);
-		dmaengine_terminate_all(dma_ch);
+		dmaengine_terminate_sync(dma_ch);
 		if (!write_data && !raw)
-			dmaengine_terminate_all(nfc->dma_ecc_ch);
+			dmaengine_terminate_sync(nfc->dma_ecc_ch);
 		ret = -ETIMEDOUT;
 		goto err_unmap_data;
 	}
@@ -949,7 +952,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 	/* Wait DMA data transfer completion */
 	if (!wait_for_completion_timeout(&nfc->dma_data_complete, timeout)) {
 		dev_err(nfc->dev, "data DMA timeout\n");
-		dmaengine_terminate_all(dma_ch);
+		dmaengine_terminate_sync(dma_ch);
 		ret = -ETIMEDOUT;
 	}
 
@@ -958,7 +961,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 		if (!wait_for_completion_timeout(&nfc->dma_ecc_complete,
 						 timeout)) {
 			dev_err(nfc->dev, "ECC DMA timeout\n");
-			dmaengine_terminate_all(nfc->dma_ecc_ch);
+			dmaengine_terminate_sync(nfc->dma_ecc_ch);
 			ret = -ETIMEDOUT;
 		}
 	}

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
