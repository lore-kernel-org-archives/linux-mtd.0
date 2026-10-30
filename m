Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F1606A320
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PRb5l0Dx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0zKzePg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0nLJar65u8YgHdONKN10Ux8811cVfbqnsZbJjO9fYec=; b=PRb5l0DxlCR7oSNUlIa5PE8EXF
	SJkb7ShcPPCLCCMod0Ih1xUnpyAPHvP2WfKNSsfNQgsbEFP4GmT8xkVXcQTDOrGfMSBtTXyAJQ693
	pNa9ANUl06NgF61uW/i+Obygr+hALS2/a6TH2JyH8+iOkL3ISsxm8nw4+1hrcQ/Y3F8tyjq63XYL0
	1acqZ8k8NklgrOQP8w1XEw5fdJpp8D1PtxHe1fn9FmRqDPZWJtVgrVQZtL8yVpF/vKmrw7q3WKWeT
	n9I9eaMO/csUQVBpb/fioGA8zRX8rXw+kQPXP5nJPVRfwEyl8e3vg84yl8WYUEQ/0ZJ2wFNixVpUE
	Cjp7XeiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpMD-0000000C78f-0IK6;
	Fri, 30 Oct 2026 16:21:33 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpM7-0000000C6zY-0yoA
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:21:28 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6e560e00a86so619099eaf.1
        for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2026 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377286; x=1793982086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW+txSD0sfyruz1SXJMLcdacKGqqaqe7nAfUTotQ3Nc=;
        b=f0zKzePgkAnVEksZwT09ubY496D/N1BHLuNlNKhEXIJbPSaMObuW6Y+tjS9TMFlyIr
         bIaVHps3y6SpQIBvUgvoYxfipJ9b56mtkp/KXEd9hWV8V7aaJNdkHST4F8CtRd2EZzeW
         ej8S2RlBydyAccrLT56ujORv/EM6XneU627xHl0jqpPQ9UJ1c9wxgDi7cSJ04d4IyXY1
         62YfnkgdCxrsIi75nSjgFhdHy09nPHopjHcun1PbQNU8HixmkxC1xWer6xgYJBq4/Tl1
         RwPDG8156UKxir07lyRkRRSxtnOhc4jlEhbw5tf48cU9LJJiHYnqLKPtUia41OryVNwK
         k0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377286; x=1793982086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rW+txSD0sfyruz1SXJMLcdacKGqqaqe7nAfUTotQ3Nc=;
        b=xHyuAElxAUC5o2RxyWwgbNx53mNTyZrtYjysQujRVdeqs1e9V90EDefDfeV3odV1nU
         E8Li4t0eFlEikV472oy1/ZJsO0/UA7hUtOJP2mZk9inivvi1lDdjTU9O5TKBgWgblibu
         sjtWGgmXEZVcD2iFwWgUnF/02erRtI9vRNOJ8/nVCWYe4cn9yBK1dk08QdA4h52pms3Z
         AAGqbWB2zqNHf9cyw8kEVC5nRmQtGZtH1sV3IfG3SSwuMzGY3AyUF8lBk+ljKqNXEH3Q
         5dSQMEk+GSQd1A4xUui+E8VH71DSTt+sHafVxCJE0SO1q2cdOpikfCAzFDwvrOAW2s2v
         9MzQ==
X-Forwarded-Encrypted: i=1; AKwUvByP6/qj5MkNi0aeTbXLVso2UGYo6pdBfRLbvf+mSSdp+kZdaIXhCkReI2135evM4KRHa9YEQEcOL14=@lists.infradead.org
X-Gm-Message-State: AFq9FYIZsgcYYgaKpRL3QplahGudc16rBynxSP77pr6lImwDtGqn9HYG
	EHlY4Oxwf9bvXsBX0Cji7pCC5pPc8JG5SbrYM2BLqHT6X1SmXI93s70I
X-Gm-Gg: AYBFou04MWtHTPUGPi/YjL2QAFnPp30X2+wj6yBvdPvwe75GednldBsYyQgCIw0Tylk
	nquCvzObNTSdH6PYRGhCPAG3NrovufeRd85m8mRpRhVbdaEZFhkcC1dgC9MIoDD7arhxRkOb417
	Nc24zKLB6cvhtmngnmymw7ytKqbR+SDXGSRtyupyrffWDRZWyMru0XKryCiP3wSOjnb0qsRe5V6
	A0fmMmCtR6OoohJuegPso60xABWJLBhPF2K/UiGe/EdqI4XRTHWk7auKub9wR1JI81+lMl5snt4
	VJGsKukxd5er+NPORocsIobwgNEoohYqGaJFT5Tbp+2QWfZx8AA11KFbwCR133XYKTm57bJDC5k
	+kWqp0XdPiaCX2xYVB5Rfm4XvG9OeB/Tq7NgS8OaySls2UPVErHcnjjwQvo0ee9yjs5hWEnLKE0
	ZsJdQOYsP2uqmf8jrnA+OYTEFW1Eopq5ZXkn8yPzL77pwy7kmTba1oadlRcaZ9AxX5hb4iYNpJx
	UpfmpyzElljUsBq/H/+2ThYxpIUW2rSyaAi05zN20h6QOD4B6J0k910yi6aEgre0F0BKyd6sszC
	tpjXVA9JpB2uDzs6TSFHNvD3/gYyXHw6lbVBWquSYrfkI+c0Io5VALvh+BxaXlCW9PvFOYl5yo5
	aVtgPeZHI4TzEH1z8515xQL4T22Jsnz8V9xsyk/IiuUI76Mq/I08Z0cY2AmtfkyPSAgxnm1hEv0
	7Ptkb6uc9FEAcxuElE7V8eRk7MlyNjICe3jv7R
X-Received: by 2002:a05:6820:162a:b0:709:fa95:9929 with SMTP id 006d021491bc7-714f2552f3fmr1853395eaf.62.1793377285762;
        Fri, 30 Oct 2026 09:21:25 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:25 -0700 (PDT)
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
Subject: [PATCH v2 6/6] mtd: rawnand: sh_flctl: use dmaengine_terminate_sync() on DMA timeout
Date: Fri, 30 Oct 2026 16:20:41 +0000
Message-Id: <20261030162041.2998170-7-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_092127_299960_999D17FD 
X-CRM114-Status: GOOD (  14.18  )
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

When DMA completion times out in flctl_dma_fifo0_transfer(), the driver
calls dmaengine_terminate_all() before unmapping the buffer. Since this
does not guarantee that the transfer has stopped, the DMA engine may
continue accessing memory after its mapping has been released.

Replace dmaengine_terminate_all() with dmaengine_terminate_sync() to
ensure that DMA has stopped before unmapping the buffer, which is safe
because the function already sleeps while waiting for completion.

Fixes: 83738d87e3a0 ("mtd: sh_flctl: Add DMA capabilty")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/sh_flctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 97f733e48..8bf9ae7ce 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -430,7 +430,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 				msecs_to_jiffies(3000));
 
 	if (time_left == 0) {
-		dmaengine_terminate_all(chan);
+		dmaengine_terminate_sync(chan);
 		dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
 		ret = -ETIMEDOUT;
 	}
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
