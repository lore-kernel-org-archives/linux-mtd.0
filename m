Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F40606A31A
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bNXOHawj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzCmu1Od
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dGdlwYQp8lf8cWyjQXEvl/Sw+W2yVfkwqEj+h+SvpF0=; b=bNXOHawj3vyZS37YA8YNrffEyN
	q5YSjHlsnk02W9eP52pKE/fQGoLjd7AhBklSNfoYkWXGL/DHdoDJKCCFYQjTSD/C0pB7LAf1fT39y
	eHXIBGjjbBeaDmZkbdwRdHA9Yn2Viq6TH8WDosEX5WY3a/cCJL6w1N9C7UoWKkfgSqxKicanorMB0
	a7sunN7fCPKxQ9XnbZ6Yqi1isj2ko4CL690+KLDVBgs74jWK29YYn0sAv8Ra0otVoA/7PoCQHN6vD
	iAaOx2NryN9bMpxpcTg776M9Z0FzafkRu2DhkVJZfRWGE7UCU9CGg9I7sbY34/ITx/vZ04lw/RGfF
	pB2sftNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLp-0000000C6jh-14BL;
	Fri, 30 Oct 2026 16:21:09 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLm-0000000C6gu-0W2l
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:21:07 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-84e513874f8so683954a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2026 09:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377264; x=1793982064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LJfsKdpKDX4HmeIK5NT3BudGEfehV1hBOYrKs1Or3g=;
        b=PzCmu1OdWaLiXRdB+8pdtijghFfra+U4pUVE5MTS/4YYnGqbXg42TwY5Zy5BM2JGFE
         PI0df8Gf4bsSuibFXrurIjw+m/4K7bRCIyvdTJJDmdNUZXM3POf9aSlZ4AcJIuyCe7Jm
         ciu+nctPFiFezDFsCAL9PL9b5/Kn1ji4z2LYiaFmIBOZWHsqxkgA5Ta6xz6V4twLg5lJ
         Yr1ICqsPrxyLLGgfIKHP2n6gHMUvUY5dBIGiWSFAzFylgTbbPkVyVR1TdfSGOKOyMB7F
         bbF9DSStqQ021egqZgGPEO2DfOKD/zGHLeBlSrTPEbsNzfuOj6eW5lr27M4GgJ32kkc/
         hPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377264; x=1793982064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LJfsKdpKDX4HmeIK5NT3BudGEfehV1hBOYrKs1Or3g=;
        b=skVKrS8sI9MhhvpyxpEUAK6vCEB3VJu6VE+9CSIi0YEIfX5QB0gLNgb66gyPajdrMQ
         73OCWYYvm4vUzkrbtqtDKstF+hrU4fBcQGGezZWB7zSYpPZIK7ZOkhT3G2tQXws8yBqF
         XW2dMQy+Sq6Sb06Mkc5nMahpw6tm7U2z+Yn9vfUNeBHzVY9Ol9LkvTdRVJfR8bUVbLVc
         oDtnQTmXeKWvY54mebwzWqTpcLlSAXt1b2UviyNyBwLVd/yUbWPgdvhqTI2SeghQvEE+
         fRcQzUP1BuD8N2Jc9oyBI9lmCQYOlw8WceSPsrKfYeS+pBnx1hlwqCZS9rv2GK+bVVJw
         KdWA==
X-Forwarded-Encrypted: i=1; AKwUvBwoxmUjWnY6uQrTFIDuSQdjvkN5NL7v4XHkhU1T8K6ZgE5gGyfylohQGy8wYqTBjBoES9I6kr4ZTrU=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4b/wC3jZmgteAwu3rs4tDKMzgN2HRkZO/AL+i4ldvihMNL2Uq
	ED8IYfuPqYyv+o9M9nG4UKW3ZfyeqfHP8fN2YN7OWtxF3T/dJYhn3gvP
X-Gm-Gg: AYBFou1VszyeeqOw6RccbCvvs23Jje6Z6IJF7DeO7Cj1dKBxY7aq6IhKslRwsOnUNxM
	Q7gI1gMIhLrMe0rRwAAehZieJk4vJY0oorjstMmIAb4tkKGXO4iPvm55ImNYGz+bgvZCSfGIMkf
	vD0Lv/9kgrt4gI/OmqDhu6/v0SeZTUYV6lrJKyHKnrwVwMA2/pVhYBeyPbvRC5gb3ycZIUOAX+Q
	LC2rlmaveT5nyR3ofNs1sq7XPxkZgKtd8/T/RcCt+QskqHZxMShl6ZzA7IfZL7Fa/wz0U1xk11B
	d2lbqoR7I/4k1wRYJXXbhfnLhjToBsaRaKMkS7UB4h+Ee9a+5a62q6ADH/K42972A/r3gpWKxzB
	3hBRop0StM1cK2iRAi6biC5zsfPYRjlTl1wjeXTznED581m+Ypx9LtCUhsXgUkKIBshNWgFUQ3O
	C37PRCu4HtTDo86hawimQInwOrlRmdCwG4m5HN/PxcrArOR1bU10qYtx8kH1BeZFT8EpxUyjKDM
	eHyVYjlfxIF5/A5v9rktUEv76XPcrPWAAzL1hClCiCnQ2sUlvi9dQ8D74YIMInsbpDRDm1JRLZ/
	Vae9nACoglvtrN/vvOia4wdrsQbngHq2j1yFVxfSvJKQ28laWKRxgabnCzfyqPW+ZzF0IfxkE3W
	HdLQPNDbLMFG/2HAyYxqC5+RkAIsDA/BJ0lyajPjQXCOIlApw1sedDgjgqQBtwShP2bXYLK87ax
	Tljdvs3WLy3CnkyDI=
X-Received: by 2002:a05:6808:4fd4:b0:4cb:f21b:6f8d with SMTP id 5614622812f47-5640dd9e77cmr2333862b6e.32.1793377264401;
        Fri, 30 Oct 2026 09:21:04 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:20:59 -0700 (PDT)
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
Subject: [PATCH v2 2/6] mtd: nand: qpic_common: terminate DMA channels on transfer timeout
Date: Fri, 30 Oct 2026 16:20:37 +0000
Message-Id: <20261030162041.2998170-3-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_092106_171695_3DE833A3 
X-CRM114-Status: GOOD (  13.47  )
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

When DMA completion times out in qcom_submit_descs(), the driver unmaps
the descriptors' scatterlists without stopping the BAM DMA channels.
Since the issued descriptors may still be active, the RX and TX channels
can continue accessing the caller's buffer after it has been unmapped
and returned to the NAND core. The ADM path has a similar issue when
dma_sync_wait() times out.

Terminate the affected channels with dmaengine_terminate_sync() before
unmapping, ensuring that outstanding DMA transfers are stopped before
their mappings are released. On BAM, termination resets the pipe and
discards pending descriptors.

Fixes: 381dd24539a8 ("mtd: nand: qcom: add BAM DMA descriptor handling")
Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/mtd/nand/qpic_common.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
index 4f3e4dd76..250154a08 100644
--- a/drivers/mtd/nand/qpic_common.c
+++ b/drivers/mtd/nand/qpic_common.c
@@ -592,11 +592,18 @@ int qcom_submit_descs(struct qcom_nand_controller *nandc)
 		dma_async_issue_pending(nandc->cmd_chan);
 
 		if (!wait_for_completion_timeout(&bam_txn->txn_done,
-						 QPIC_NAND_COMPLETION_TIMEOUT))
+						 QPIC_NAND_COMPLETION_TIMEOUT)) {
+			/* Retire every issued pipe before unmapping its buffers. */
+			dmaengine_terminate_sync(nandc->tx_chan);
+			dmaengine_terminate_sync(nandc->rx_chan);
+			dmaengine_terminate_sync(nandc->cmd_chan);
 			ret = -ETIMEDOUT;
+		}
 	} else {
-		if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE)
+		if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE) {
+			dmaengine_terminate_sync(nandc->chan);
 			ret = -ETIMEDOUT;
+		}
 	}
 
 err_unmap_free_desc:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
