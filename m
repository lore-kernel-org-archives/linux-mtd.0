Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800B9606A31E
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 15:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PTc0F/y/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7+kwt5Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NiIgJdCQ4SVfqovF+wNXFByWPmv7EgXSFMTWlw+pOaA=; b=PTc0F/y/FK3dRGNjuEbPYJg36V
	kJs5JtFhTM5CBOp34R9c+mI1ngpg7IauHwZJAii5Ubs2WKbKnoL0ENcjhCXUprxB8XaDLy3NbaTQL
	9eOja8AIvpwl9vTI7hTk6G2Ygr/RJrRPB5AY8FxI1zsJwXD6dXzesuqBY+ZADPA97FdLWJA55mNG+
	o76RXeeNzP2wfwfY/c6KUOlNmHo04oBAkFROuyqqvY3kSBRsCoFCqeqZktf1IAYhgdTuWbIfFaq+m
	aueP+rAMLpaS7da2BUd0d8Jl1jGStiCJJTA9kRyErKeBN57MLph54TJd5Ki2lUVbOH6kBIfU0rCsB
	iQnL2eqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoCA-0000000BwZw-2mTF;
	Fri, 30 Oct 2026 15:07:06 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoC8-0000000BwZ4-0MQ8
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 15:07:05 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1a2761c69fbso1992374c88.0
        for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2026 08:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793372823; x=1793977623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=czilngxYr4DCa8qp6+h+f369XEDq6BL7zSm3xrFlL/g=;
        b=D7+kwt5QeCXz5kaHw2acle6tNTGAtD+ZmGdQoWeVWE3XzLfJXgXk53CZ5rTBqlesYY
         vBGINNTnxJ8yUlSCihpCLbEbTinXcBx4+i5DmnBr+BYPmRNsaadN68fq/nHYoHGVsx9O
         CpZEdhrcw/UhOLNAQD5jv90Z4RdP45szVmmZnYtSLvT568aVaznqxuamqWwDsmjMexBe
         I/R2DBfvSdfkvzjeztzbphoVjiQmFIKdGfHdhzLZOGyaU3EG6xnRaTQawn3uTuX4gmtC
         XUDJRpQ9yG917+tlzICVkyKGW4qwx8WLMvJ90BzbdLE3YXjXezl278yDfS8WaqxmV5P6
         bhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372823; x=1793977623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czilngxYr4DCa8qp6+h+f369XEDq6BL7zSm3xrFlL/g=;
        b=usrm2ecOexYzjRpYjOpVReIXuDNeMjMwggCfzrTwmRsV5VR2HhkfKWn3wrvA5UaX1D
         Y+ZcIXRahdKnqx7Xqul7THJnBfKCbMb6Y0k0qyd3apevFryM9bYTMh+oktwwNj4JYfeb
         egHBdWU0VyDnKW/bPuUtxa7TWGqv5gv1zWKlwMDU79buxD/OfdE3J+J87+T6I8l1NVxx
         KD0GKsI23tz5SMos5jDFdO1BGKQQT01gzGN/4zacfThTHZrmjJ+cHR+B5OQH+Gvr5DPp
         ZJWfe8xq6ennxFI6L5T/wbdwJmOkl6VypzMPHIhLcZ70N5pWZmjnRiZlya9aXcYJuyNw
         rBZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxw6ZUHQU/JtHWnRhny63O02UbxSLnYMSp5PrVey9O6pU0a1Zz8HXEGT4lCUg9AywwrEzKRxAZyhZA=@lists.infradead.org
X-Gm-Message-State: AFq9FYJg32Br/376aJ9kZUvy57LIDprVtzzE8YyRcB+g1oBENpcJYDu7
	sFU6/0DWDvDPQ9DM34Q25VwccvdzUrAFVbvBrlC/5G3kKVTKrj+LHkKp
X-Gm-Gg: AYBFou0WdwDUeb4M5tpF4H8udq0RpEdLPmSB3kfSHRMfvOBSInlOZUOTeJrvoW5gs9t
	u2xIp/7kSuDRtQfppsj9FxAjjXVC8rc8y7aPdw4KzfJCxRv4GCqOp9emJXw/Afn1MRakzgR1Owj
	kSRoUTQMe/pR9SAW6fN0PHVtY/KmR3Q8szY2Qc45iJilu1GXjkB5xA0WORrnL5yHifbbUkkVnQw
	c+5cErnTyZjk7KwFygjz8QKxaYO/z6qUJWZ6aKSjz7Uh72sdaUHiiH4C8/00Lr/WqH2EvLW1c0Z
	xrwIRkiWGz3BnCU6xbg0hBrO0gcLLzy/orC8p3QauBf+stnyWg+Dw1TIa7hS942PQSNo3/pAkp7
	PVLk3olGbKzby0nn+bed9Pi6g9nGWH0x5Ldz11jRwsOm9i9VXlYR9yd55L+jujDyBYT5RVRLMAT
	QHdp4G0/BlUei0NZmwfqHl9blFYbJvHf9eAf82Tav+4Dc7C2WMP2Cjpg1DLwAxNuee0uMEWLc+j
	u6mYezbT/YieYOpzBgU+Cmmtj8bvQ5GaenEZbM6dTD1SWFOUKYwmwBb/SVf8IcwgjC2KumEdvrr
	FkGvcXwL9IgcpPUuJg0Gj2gvwexoIP/4sx4cFJSvPYDidz9ItnJwRzJdnHMOK3VQmXdc4WhZ43v
	X96JmyzXKWQ+HFUjxSQ7pEKenNYnWWaPCeO1cknJuRsC3RgKcoa79JsiF9aN02Xt+KONw3YG3HL
	V8EswzZ/lO6/Jj97YJ05hL300q4k4WVGSsgus=
X-Received: by 2002:a05:7022:1113:b0:1ac:9da7:e86e with SMTP id a92af1059eb24-1ac9dc67128mr2995647c88.30.1793372822378;
        Fri, 30 Oct 2026 08:07:02 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm7475171c88.23.2026.10.30.08.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:06:52 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [RFC PATCH] mtd: nand: qpic_common: terminate DMA channels on transfer timeout
Date: Fri, 30 Oct 2026 15:06:46 +0000
Message-Id: <20261030150646.2942368-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_080704_166914_BC5AC097 
X-CRM114-Status: GOOD (  15.38  )
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
Questions for the maintainers: BAM pipe resets may raise a fatal error
if the attached engine remains active, so it is unclear whether the NAND
controller must first be stopped or reset. The success path also assumes
that completion of the final command descriptor implies completion of
the RX data descriptor, which may require confirmation of the hardware
ordering guarantees.

This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware. The patch has
only been compile-tested on arm64 with W=1.

 drivers/mtd/nand/qpic_common.c |   11 +++++++++--
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

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
