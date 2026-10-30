Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EBE606A31D
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hSYh2Mip;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKdSB1M9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cYf0fTUSZdgnwsziOQvQBbDceexwK8NNqMdJjzIkGrw=; b=hSYh2Mip+KIjhLesWFemySTWLI
	PgcvWwjjdl3mwGwdyjPzSPnqWA7F0vnzZmfr3Vz8oOrltAmtbFXo6atRPnSSEYbzJgUTCS5XLXKRZ
	bBFpaO4qGYBWnfenXZMwRie9VZMHykndSA/C/dI7hb4QM8agO3v1EzOHoIyPlgO9dHpRnPyJnlBZ/
	pPFPMMztopYbfi5wJNFDJEmE5jhz3Sjqo+1bDEuQCrYb+UJoE1JqtT1OydRtO1qanGXAOxcGNWbbX
	ucNQUnjWS19/fNDc+LRDZ7WQwJthQouHuUysl9bTckFAIrDhMo75IWmtvZESLzXlV3MQuJS7KqCTk
	EJozZ95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLx-0000000C6qK-2nee;
	Fri, 30 Oct 2026 16:21:17 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLr-0000000C6l4-2oVo
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:21:13 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-4a76f63b243so1797883fac.0
        for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2026 09:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377270; x=1793982070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLRD/nhwFUuDTpwXog0Q7Wc+ALgde2fM6C+mADcBMYM=;
        b=yKdSB1M9GJ/By+Jv0eCsyH4Hy+s+0Z7URcZZ8FMbIUHcnfPM2hMi449KU4ESzYiDhY
         0VvUPTHlpxlarpM+AdNk4dCujbr6VXPL/ldjEc101Uc5ZRbxxAmOORT5jOxBjnv01Fxk
         9P3BTdLoJ3dnR4Gv2MWVo/qR0p7GPDemg7tbGhFvwUh0Y6Bq1t6hyUSTCIz14cBs/1zh
         DM1riJr1XJVdPeCa/wkdJpnHI387YFyIsZP4FezZnjEHSz/w3E/VTjABa9KctHRo3TZG
         rrMuAcLeOiO7CiL6BEMYUC0yJSufVPfAdzdmn/VD4izNsBppNMLmzbCOH/zVBOWBd94n
         EktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377270; x=1793982070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLRD/nhwFUuDTpwXog0Q7Wc+ALgde2fM6C+mADcBMYM=;
        b=EyrN77q93RjXVf4M3XMCGivrswgErA4KqVcQI4/7GYCP8qiuSCt6V9RpEoM1/LP9Js
         s34vrzmwgdmU+vjXjYnk1Bbf4J4YzfTo7boSKljmWJhRd/wYn4QvYVrlg9jvkwLElMMj
         q2iUzWdI0O2kv1uHoL1Zq85fzL/+LiCC2sZRzlHvVCRcW9ofmT7FkZdFo64vpj4cCYHt
         jpu/PNF5kP3WWSP9ug2InqRvOYs6vMAfTKKha5K3FMgiPVhTFTgPDgUHEuScogQcBltO
         QjP0PVu6CrsqgXYdrRA/2oA12PFKh7hy/GDCxLZ6uByjaoxhnf10LY6PifsSunxvp3K3
         1vrA==
X-Forwarded-Encrypted: i=1; AKwUvBzCQcr3/+1ZY5jjrhyN21Hsf//+E4tmMwJtrbaBU0OhQ92H38oal2EFZ7JvZAZ9y8ywGLVjuHY6HEw=@lists.infradead.org
X-Gm-Message-State: AFq9FYLYa4khUvSw92c+JokYm8/GSSG0lxMqNZsJk2Dd+oerDkmPHXGo
	ZVxw9TYc0EB1/V7gvsqfp8xJjxubCKN7PO75O+rY41wDSY82XviQYFid
X-Gm-Gg: AYBFou2+rHVG/irPeWlK9mrdYflhC+/on3kNX4E7IdQXTJKiHTLjTjK57dj0XKWJSwo
	4mAcWyda4EFZraU+5Fo6U/cz7FpxHM0470tBsH/53/z42FZJh8d8QvOk89kYgN97hUFwDUrLvZJ
	xy8cYoiSghZp0i/3OmP86jt5jlf1gFl82mQlm9plPRnXXxKHoLAcwWcFhTEavL0fuMRg0IcM2yV
	G+DnmooRh25z5BJkkW1f91ojQWzQx5F11MPCsakLMtaSDjdnZ2U33o2xfxI89FBnhf6eAmoQK4o
	oJIxsy995mja2NcFhn7mfnasTKPB6e+QYoaEe1sAfOgGVNjsezUo/AmoWbG/c0LLNw+emnxA2ZW
	BPmSqSPH9wmliobXSw++6xT7FAohbJUzULhnAW5gJzd3J7P35jKpfjNIf/vkU7alQhXt8GE/Mip
	2aauQhORLZp+RlJIRkdhXcIKt8/MaPkcXo9rkT4mocqOs0aW/KoIi57ZSO3y6zdCKokTg1S0aWw
	7XN0DHVt4zZIVmDFOgqr/XF2CREqaCYqIVRY2AaIyMZYzwOWtzg0cAjrDhONLO8gbt8wlk3cDYE
	hE3m22q71sqsXL7su/+WEV0PpgSxpQYxMzaCR+BAG5lIMtT5RX30fu+XZhXE18ruCnMKJLAcSUM
	I1pZZiZptC37MB7yXGtsS1DVbKV3JLZwKU5CUFC9y46DdWvgTBa84Vi0yFxj+SXeVTLsc7c5yJF
	bFxAvHOIlpw6McF++G
X-Received: by 2002:a05:6871:5224:b0:470:e96b:43e6 with SMTP id 586e51a60fabf-4a90775db3amr1316890fac.18.1793377269740;
        Fri, 30 Oct 2026 09:21:09 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:09 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 3/6] mtd: rawnand: stm32_fmc2: retire data DMA before unmapping on errors
Date: Fri, 30 Oct 2026 16:20:38 +0000
Message-Id: <20261030162041.2998170-4-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_092111_726173_34F892C8 
X-CRM114-Status: GOOD (  14.79  )
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
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index c08d6b176..82d630106 100644
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
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
