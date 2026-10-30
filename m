Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162E4606A31C
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZwvFNBQs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OorM1Gl+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gLEFDgbaNpKMHdsS3eVNjOCQp3XsModrOk2AFhncEMA=; b=ZwvFNBQscSgDwoLZBjKhR9BIir
	moSev90f8EA/G7ejzpT1pSVOfA9APhHC8nzDVhZ21TVqA6XlZfkoyIRivGKQopYSixK/0cAXMhsQ4
	sjM86sHhXFikWzZCDTsj2AVQi8LBtV4z6aY79+n5P3tVfXIizbLxZaugwFUnOP0ZhXwI17PjokiDM
	F5SCXpDvyVL4+sIuYs790vR1k+6RdIb8YGTiYCjakhcH18sfEP9obzprBDVxA1Aq9MmdEqfITpuaa
	04Vr73oC86akgWzoQpOTZdEi/GYmhxol73uJC+wtcSU5GOBNu1bh3uppjtwHDBCkOBz08WN/9/VVm
	RV/BLUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoEe-0000000BwlX-1DaP;
	Fri, 30 Oct 2026 15:09:40 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoEb-0000000BwlC-2Dwn
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 15:09:38 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1a2761c69fbso2000273c88.0
        for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2026 08:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793372976; x=1793977776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/UiY3oEhmm09gQt6+h2fxxhgxNmhqW0iOqLXwE+OSHg=;
        b=OorM1Gl+Wd59bIf2FkrpNzOW2WZvqz4LekY3tsO50MVXo9TFlnMTCXo29gnStKb8YI
         W7pFFxlc7VccET41FApwnpG5VkNBuAEA55M5HUDXGd1XCsx1XlpQIYinWuznAPhPugzH
         t5Qa8VNiowcPNtSbFzpp7kQlak7b1g8PoCtcYdQZyCCa7Vuj6P9gRX1310SNCR9kWO5x
         6Zlem3MKKI2NXrtewXXS9Lla3GYJL47PPND2++3xOiA0SyqQ+ZtHujYPp9ExeUizaL5a
         5jIiVxLdITpmsRj3vFcySIE2rLGCmOcUHdmHLLhPoXZ4mC9jfZEEtCr3Es5KUmWUYZCn
         bQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372976; x=1793977776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/UiY3oEhmm09gQt6+h2fxxhgxNmhqW0iOqLXwE+OSHg=;
        b=UzpR6WOF+jeibQtQryY9eLzs2GgX4NMc8zbNenCuedORF2WeuX8/hcrjjRDh/jBJLf
         IuysEEcybcg32pR3Ip7m4YZ9xTo8vyp66SNqt3WCh5XE+5ZwKniPCqDBtj/VhzHWZOjn
         Y8xIr8h61pMfk9mq99ipa0RWK1DKrfbsu2FoifAkTujtoFZVVYOTFPcF3Ry3GpydRzsg
         DIW6wnKwVJ+hF6xgJMQ6sSQKf2mmgEOKyM2HnyBy7LQ9TpfYnIUjUASziH63ts0qwBhk
         xZMnj2p/eCoTEZ4xHgIqAw8lOa36p6jy/OYGmYvajprcAacjb9lMXZ5votF4nUsbNYGP
         uiGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvLvqa1QpEOYzmQP/+PtwW4Emy2hnLaU/tfgMvF0zDrTy7HnBurvC+doStUwO7UZ9ZcLrhPqzD8mE=@lists.infradead.org
X-Gm-Message-State: AFq9FYLXT8gKqbB03rpHM4tIexBuKaIz5hJ+ca/7Gx1xRN9t+sUstmz+
	sncg/2jiH8jPRfOMM/eVBXb3rerncMzZbKd8BmawBtUcovyGeDEu7rQm
X-Gm-Gg: AYBFou3z8aT8sznxu0ffjRHII8uP7IEboTaW81bqZGaa56QlSQPgqksZBJLA/xTUWUh
	JJRggvnvIXOWkFKHoxxaWMtp3tu0swuic33AxizlMnUullKB4uCX1DonmqEt2ygxAfaSPErJXLX
	ePV1puT8/RMJZWnOeC6oZ5GBcCWqMVX8ulzHsAbb1gvKaZ7WxktW9nUN6oJWyiWASEuV0ijIdLF
	0rxXH3W8vSI6ONCvdt5/M9Zht/hyQekbU6AllMokS3kaky7OMx8UFvE9uGnds1qRt/9e/77gQQy
	oJdpDnGNmee2aU22EiaR4AAp172v/j+h1mP7l0mBxJbw5R3CbtagPNrR865qNqJqy+rKnMIhmtB
	HSlaV7we2EPsND/H7urNjXs5RlMycdqUPFGVrLGRA/1fPbZ8Ayf3GtkQjoPTOuHaxvvVsEv4Pip
	ANgjmceBDCZfeYycvjtC5fAM8qNtyLOLpn7WkRQ0Hhp7iztoN2spdAx3ZiHFfR6kq2/0namVs7f
	RJ5SH2y8IoBehwXcT6M7+yoNa0CHvVKJ0tYvbcqt39EXpBfT9YbS6o3tJV5K+J6HRe3W47BrrfA
	rO3IZmt3Vv+Yd00gR9forO3vidl72Vu6qG7gFuM6jTxuLv0IY35metGZ2xIwi0CVpfTu6WVJn+A
	sQe6zB5iYEfFZlGBM5+FptjdmfBFj8RwGd/tJNEnbRekt/WK3CDh+Lg1TtPC5dVazUXI5ohzqAK
	GS1/Wi85AaDSvJg4A=
X-Received: by 2002:a05:701b:42c2:10b0:185:1640:5536 with SMTP id a92af1059eb24-1ac5ab52fa9mr3803741c88.19.1793372976047;
        Fri, 30 Oct 2026 08:09:36 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm9193386eec.29.2026.10.30.08.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:09:34 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2] mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
Date: Fri, 30 Oct 2026 15:09:29 +0000
Message-Id: <20261030150929.2944717-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_080937_590161_15A92DB5 
X-CRM114-Status: GOOD (  11.27  )
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

When DMA completion times out in gpmi_nfc_exec_op(), the driver unmaps
the operation's buffers and returns -ETIMEDOUT without stopping the APBH
DMA channel. Since mxs-dma leaves the channel in DMA_IN_PROGRESS, the
pending descriptor chain may resume after the timeout, while a
subsequent operation can append new descriptors to the stale chain and
cause the old DATA_IN transfer to execute again against an unmapped
buffer.

This can result in DMA writes to memory that has already been released,
including buffers freed after ONFI parameter page detection in
nand_onfi_detect().

Terminate the channel with dmaengine_terminate_sync() before unmapping
so that outstanding transfers are stopped and subsequent operations
begin with a fresh descriptor chain.

Fixes: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
Changes in v2:
- Drop the code comment

v1: https://lore.kernel.org/all/20261030143945.2923554-1-samarth.colleges@gmail.com/

This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.
Compile-tested only.

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc..a8106de2c 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2659,6 +2659,7 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	if (!to) {
 		dev_err(this->dev, "DMA timeout, last DMA\n");
 		gpmi_dump_info(this);
+		dmaengine_terminate_sync(get_dma_chan(this));
 		ret = -ETIMEDOUT;
 		goto unmap;
 	}

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
