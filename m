Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE09606A31F
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xk5yu4Sj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VjNsZqVi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LqAwsBGAzz64dGtoC9TGfIeAoNH8lqT+2E7C0UpYj7U=; b=xk5yu4Sjh3XuWy+mzFfsGGOwUO
	kjQEIsEKPquCrr2TjI6Srkk6pNfD2/REZvMrkIOURaHJrVGo6v8/nPoz6xYtZSt4wGrLdJQ41QkwU
	X04D0LtQ85pgFBFIhUqOxgNq+ZAnvX4CCsnLekxsAVRYsFq1CpN6akpYLty35aB1cY0nBdnxnMHJj
	iv6WXFl50se3Wx5aRuj8fDleOXdRMUJjKEiPMx/YXUcFTe0LC6crCOhjAr04+xw0pCwTyRL/LDBsC
	W/rEJAzT9qSa580gPATHZASELKuzgJ2UYuwdNAcANfGaoSfsx8dmwh1tAtAnMhT3ubbAX4XByTX0H
	NqE9JYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpM6-0000000C6za-10OZ;
	Fri, 30 Oct 2026 16:21:26 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpM2-0000000C6uh-0Ueq
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:21:23 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-46556b9e02cso738334fac.1
        for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2026 09:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377280; x=1793982080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3sMZdQ8vNG+NMmxWGi58o4c8YdyyCQhTB94DmlU1wU=;
        b=VjNsZqViQ8tzc5ANBtDjq1xrXEkHulgCnvbvb0THnpuenDvRkL/rr4Kkx6HWJbLc/r
         f2fP7JgYjdd3W2U4WRDWYPSDm/3um8yVIaXDHSpJfi1m6dnAE7ue6EZQjNtDMzpwViZ1
         Q+V+UnWqZ8ffF+5uVpNHHSWYHXYrwEScGc9c93onFpcx88pwbcftMAPUeB2pn3pp7b3H
         9dg47P5syQgwCr5y24XVTXMS5El03cy5dD7UBbi5ydrJ77rUh3I3VLcRJt8P4IrxoDNA
         AiVk2s7L+AjzZVg8gfgHcxykUpLW8vWI3wekpYlX0kS+cDLALsKPOIFrisF9d2oOhLKv
         dN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377280; x=1793982080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3sMZdQ8vNG+NMmxWGi58o4c8YdyyCQhTB94DmlU1wU=;
        b=Zy/LJb+bCpBX1NkCU6zhMX5g9VJmtVdME+1ZL9Sbu72KuxfxUXqgNXv0KBoYldIzCL
         bnADjJRFzDTEFBf/b0LdsuKu3+o9y2oIqwmJ+Poml/+GR/5hXERA5Hp76kUahZr5c3lw
         88+o7GZTGhwAx35vhmOzJvCiRN7Oyx0Qw62nDbkex1a5PPyGG3ziPafFTrxP6wO2vHAW
         tDoRgRN/OZ2nYl4Zve3DBFSpYcFg1mtG5Oy7nk3JWnzfEtOoZmCaIKVXP95Mf9eSyQms
         t7rQr/lgT+fi2qaxkkWobIhRFCDsrCyt6VMJUvutSHe9medSVBsi3HjqvSqyZxuLQ1t9
         PK0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxJCz1OT0GmWuGvdF6ZzfIX89iB12Th6KnE/Q0KpQ8DfgDwAWGE7cidJfbKabwsfQVhAdjqMrpVX/o=@lists.infradead.org
X-Gm-Message-State: AFq9FYI68m4J68lXhOCRgqJxPY/O8b7Y6Sn/f0x8SgxZgIWTRAosjD9v
	Tu4Q7zflPlB5N1zyMJYWwIJDCRnbzhHMTfpiZw/8lygj0bkujynYYSVM
X-Gm-Gg: AYBFou0SJXR3uTmAv3QM45/ls+/AOByffLCVFCAUpTdZooyfpNPxcJrw6NN/OL9PVzq
	q8R0Vg7hJTqw3n7NIqmMYZxEEfWLgF6UpgQqAA+KTPSQAK4zL7hwBV3a1WMW7EUeTWkmjm3suPz
	sbEn/0Z5mjJro66h4qSThUgBLKdmvKdD52c6gwR1QrZByqwgtZT7oJtDPbvFww3J1O1EeCpZ6dY
	85UOsmXZnaSJp+kdBaXJft3oZmJ6rxM9Ovws5mOZocRwm4nj6WJvO/k0IAVu7t83vCE0tabOJjt
	4PJl+6EJKPbgsIb+6xmjfuGvjBpoTeHPd9nj/He7sW0dgDhh62jAkH4vX9Fyfv1v8CWvdeQX28N
	ea+jkTIoFLLq7w1HbetViG/J0yGrgD/d1qCakR090kFEUb01KMJemfDb2it7uk1QeZDHE5EzEIS
	VBfkSLkeEZP+sQgQMBjqY/phEb45O2dDm7hIo6ZYDV3sDw3prSNI7QcI0cz3DkjX/E4elZGbuiw
	E/TClREMJFhF0nsDSzq6tQ5OHbypp41kBEryjU2FCOLKM6ce778fH4ZCooW0cTA+MunO9auF+of
	4hKxr1ryCzLRDj+r1zXhD4r2EH533jB52TP31VLCz3jHCvREpZMfGNOkQA99jc9tPP0BigLmWsB
	sPovnmtwQezjAj2FwlhL9vaNsRTxob1rE5z0yfYNRjLcJZHwO2sXCFQ+2glTmc4LJdWzooQPNuO
	2X/bdA7jp+tsrH3tfH5t+k3UE30ov26AfUawVT
X-Received: by 2002:a05:6870:c191:b0:4a6:d831:cbb1 with SMTP id 586e51a60fabf-4a90767d2f9mr1286539fac.10.1793377280468;
        Fri, 30 Oct 2026 09:21:20 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:19 -0700 (PDT)
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
Subject: [PATCH v2 5/6] mtd: rawnand: marvell: stop DMA before unmapping on timeout
Date: Fri, 30 Oct 2026 16:20:40 +0000
Message-Id: <20261030162041.2998170-6-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_092122_502698_58413B5F 
X-CRM114-Status: GOOD (  12.34  )
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

When marvell_nfc_wait_cmdd() times out in marvell_nfc_xfer_data_dma(),
the driver unmaps the DMA buffer before calling
dmaengine_terminate_all(), which does not guarantee that the transfer
has stopped. As a result, the DMA engine may continue accessing the
buffer after its mapping has been released.

Use dmaengine_terminate_sync() before unmapping the buffer on the
timeout path, while preserving the existing status logging before
termination so that it reflects the timed-out transfer.

Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/marvell_nand.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 38b7eb5b9..a342a48e2 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -900,14 +900,15 @@ static int marvell_nfc_xfer_data_dma(struct marvell_nfc *nfc,
 
 	dma_async_issue_pending(nfc->dma_chan);
 	ret = marvell_nfc_wait_cmdd(nfc->selected_chip);
-	dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
-	marvell_nfc_disable_dma(nfc);
 	if (ret) {
 		dev_err(nfc->dev, "Timeout waiting for DMA (status: %d)\n",
 			dmaengine_tx_status(nfc->dma_chan, cookie, NULL));
-		dmaengine_terminate_all(nfc->dma_chan);
-		return -ETIMEDOUT;
+		dmaengine_terminate_sync(nfc->dma_chan);
 	}
+	dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
+	marvell_nfc_disable_dma(nfc);
+	if (ret)
+		return -ETIMEDOUT;
 
 	return 0;
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
