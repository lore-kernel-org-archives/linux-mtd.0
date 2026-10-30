Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8A8606A33C
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kXLvKZs+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ueUiB05b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PacVNvurkbq2q1j1JNZ2P12CYcb7SsHP24dTsZjkSO0=; b=kXLvKZs+wSfPveFth/hmqpJ8z+
	Rm+jd3BFnmFEtNCWyyLtT2MYEvwLwAM9MYTazoQhxZ+gfojZyI/+bYG8R9vGwETUu6MEAyfOX/unn
	6LTc62Dh16nT1XofmmzGCiNNHAwyclNzjOoQPYavw/hm/RKLMIpJQGmHbcLF/o71Yru9a9MnEXTdC
	t4KzXzFNQ3EZbukI4zvgNKyg9L77OR02ShpTUqY6Pgn3ZFMSZjNna88GH8uXWEC6MKWXO6s0hLmmp
	soyhwabkgE2wAhmBk5p/pZ2oibYvRmDXsCWAxRGywsYnwFBjA63McPKGs/Amd51p3FQt3anJOZG5W
	Jwlxdodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLz-0000000C6tU-3Gp9;
	Fri, 30 Oct 2026 16:21:19 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLx-0000000C6oU-0RPx
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:21:18 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-486f013db83so315766fac.0
        for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2026 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377275; x=1793982075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiCv4TzAu5z9UeTUiidIChOBFFfvn1mb27PyQpvB9kE=;
        b=ueUiB05btc3rjjrXeMOmDTXCzEBQI0VMYjBhr6JURplPV75bm1CaF0R1WaHHJW3kuN
         R7VMsvn1kiqUZA7BemtTyMRq/XYwdxdmNo7fZWBZtDkejw4L0O0veMJEEUQ5WMZqG5SD
         E76o8xGCbb5LedtukE53ciOopvbphTdIjyt3GPDyeo17XfW3ZwBgfaTvgBS9aPFTsZHm
         tSeamjsqooE/xvedaNgSpfAYYfeewAYKDTHrvH8PLfbHnDyKLPtdoSaYT7eRobJBhhLv
         sP2CVMMiDzYx0TBvwkTzIGfou/CzDKsPzKeSMj895mzlXPo4NzPq4EpDuykJRVbkmK41
         PyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377275; x=1793982075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiCv4TzAu5z9UeTUiidIChOBFFfvn1mb27PyQpvB9kE=;
        b=ineR9WszwbVZ8EEBHDzkH9QM9in3p68ejAPQosNSPdedwTbU5nYbF+KbaHLgR5qq9/
         bQjpNcI3dGH8DYw4addQyoMx71p98ZVUcVfjnlMIbPVvtP6cYy7q+Xf5fgSBWJCFx1aV
         XzUR8fnxRx3epmiHKRCVXvfkc6hl54/sjElVqjximPmtunxzt1tNjF9JdCb8mkKnY+Br
         gF5YwFYRFiV4JoQUA9xq3v/BARoDy56gjAmmFZiJ8P/bmnryRPkCWOG9rTqcTQKculcJ
         c8K7S3xWdoNyebj+iNsO2RFAOEs+Pjv61bYyOWpKLGYGAxb1IfZFID41NWrVJDkoM8U/
         +/bw==
X-Forwarded-Encrypted: i=1; AKwUvBxgJFSd5vntfmcm7HXbUKPg77tT40GDcvdCZpmywEP9VC69qN0/Rg9xkpCEuwOCz1AufyShmINIuP8=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2aXM0VU9OL4j0jIP/LjhaYRfbPi+S5fZaj+u9XjI9z0AT21W9
	NYqgc7e6BhPvcpu/F/NfTbFlHsZwlINHiaCzxtshPvnRfOFwjg1+9X9c
X-Gm-Gg: AYBFou1nqrcvCVhzY2vURX1xc1ez2AVBrXcsLZ/H1lAqwxWnd03s9eiaNbRebTyU3bb
	mQbldxFdGESsiJPNRowXIoUg4DSDyH04HVFYh7yKVBCgp0FocoAQu6JGlf3BBohZ/OYGLIgDQE3
	QkSEX5PetWIe2K57fSeOz82L/it7AGG9cu/VP8NvLW9KfazfUdM0vHFsmktmNfbtdM6LVnrfVdg
	kQ1GUpJbgXZ12aiuV5m/pY0cW4f+cvEXRH3Kx1zorHe7TzWhYt1kCvhOBE7CwqS1kgfqUGwlGQx
	w/3t/XbQpRezW7wx0CsmlpsdrmqWfyFQkFeTtzOT5QviAQlzbi0K06ha02YBRcJ9lCam+kAV4PR
	1VIsqZ/dHwDecjgUoZ/OxYqr1M24CwB1+ZJ2CNcTy/nvWr15G6KtlUqQ67QQGhXLOLFySsB0Tkj
	6aAUSx/0vJrawwgTb/M+0010E4wnmypINGojN7dThytDfho6xdpSWpJggEC9Lx3VQzdtfbFPahX
	EQ/Jh6jp1VHMHU5cxW1wlrrT0uWPFaXNpJnzMUiHgANMpCtf/kRJQGb5csXY1xvxuHAWe4wEQYI
	R6WS0c0C5bC6K1bLMpOKaXhkY6R1ElyFiQAmtQbp8ODVtMU749F6OC6pzzvUk+kcPCOtKJ7pZVC
	IJ56lDb2eCCRYyo6NShTjBalrbtqRrfaXSXNi+VbNPrdqGwbcWw9C7uk8IRxha6wUS5EhCwMITt
	UtTMLZ4E3XoL30Wtg=
X-Received: by 2002:a05:6871:3149:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4a9075f9d96mr1952103fac.20.1793377275138;
        Fri, 30 Oct 2026 09:21:15 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:14 -0700 (PDT)
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
Subject: [PATCH v2 4/6] mtd: rawnand: omap2: terminate DMA when prefetch cannot be enabled
Date: Fri, 30 Oct 2026 16:20:39 +0000
Message-Id: <20261030162041.2998170-5-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_092117_166299_E28DD9C6 
X-CRM114-Status: GOOD (  13.50  )
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

When omap_prefetch_enable() fails because the prefetch engine is busy,
omap_nand_dma_transfer() unmaps the buffer and falls back to a CPU copy
without terminating the previously issued DMA descriptor. The descriptor
may therefore continue accessing the unmapped buffer, while its callback
could also signal info->comp for a subsequent transfer.

Terminate the DMA channel with dmaengine_terminate_sync() before
unmapping the buffer, ensuring that the outstanding transfer has stopped
before the fallback path proceeds.

Fixes: 03d3a1df6da6 ("mtd: nand: omap2: Start dma request before enabling prefetch")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/omap2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 552f36da7..b6bd4386c 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -417,9 +417,11 @@ static inline int omap_nand_dma_transfer(struct nand_chip *chip,
 	/*  configure and start prefetch transfer */
 	ret = omap_prefetch_enable(info->gpmc_cs,
 		PREFETCH_FIFOTHRESHOLD_MAX, 0x1, len, is_write, info);
-	if (ret)
+	if (ret) {
 		/* PFPW engine is busy, use cpu copy method */
+		dmaengine_terminate_sync(info->dma);
 		goto out_copy_unmap;
+	}
 
 	wait_for_completion(&info->comp);
 	tim = 0;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
