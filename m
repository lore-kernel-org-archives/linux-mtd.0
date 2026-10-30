Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC436606A31D
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hKM5L18+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gx5RRy3c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=G9oQS/N7vXkuETlpcDsTAzQ2svf2g6xMA0XJ+PgClE4=; b=hKM5L18+h83IEUw/mDRcKIqtWG
	h7TDRnYdOlmC6izrRpHQy/m5zIbOkwxwVPiU5xxZAV1FWaaIEg680yGHKgvGjyfCeM56zVnXJ785V
	c5zQwb2cuBCBoGQpCY4J9KiVQagHyn+2M4wKob5iqWTPbK5/GItLHMZDankIhgoE5iXKmhibWiJGV
	b8IANWJU3Qd4oJ6RFozIWvaIXR7LhX0KEa3laDzc5kYNiu+L4CFUmt8qm+mqOu/YCzBRWxWikJC9W
	cWm6hvBoTDjqFprSeNAOqCoV8OfjKUZPNgkyaYYg7ylwYgHZlLfw2LXf6WN8g5mSgQIfOQKN8anbA
	x5HgTuQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnlr-0000000BsFA-1caS;
	Fri, 30 Oct 2026 14:39:55 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnlp-0000000BsEj-17OL
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 14:39:54 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-15943c9c005so1350179c88.1
        for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2026 07:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371191; x=1793975991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2HclnRmIvT2ikyO/43sxrVPfYW6Mo/iFT1div/Cdnc=;
        b=gx5RRy3cbzw5FVxqOvvmp3XF8wIl1DAjvebOBer3Q3PIeJiI+xjqFNDxOgmY8gZajD
         vAIKjkGaslWDq2vdnWDfg7ftDXsGYrdYdj0lYzSBV+COGqimx7Ubk/89vUTMTnlDrO3e
         vgYRw/a+6n57se3y/BsrqyvsY2IoB1eutlasDT0sNzbPE7FVc4yKJqYA4EuTseexkwS1
         6XLXYpDWXgTiZwdjIXRGxDPQUXpYMiJmcrIqUz4xXl2BGMAzA+51U85lyKEYUIo8umGd
         94l4M12eL3NbuWCOE6J11JCtS4yN/rkKDoCaQC9YCKXwu67LuF2KWbZyaONSsYo7fYem
         wmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371191; x=1793975991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2HclnRmIvT2ikyO/43sxrVPfYW6Mo/iFT1div/Cdnc=;
        b=BIY3DLQCoLnOcghmqNOvtGGWXWx1KCscSC19kG0MdSsV3aHMqVcPe5SUl5dBXFqmfX
         PrgYfgODZCo1ahbpVIOAjyNTkCqRlfofngXSyb+0uGO6B7HI87XrT6NcGfPztv7bUUkN
         kJp5wNNcEbsQvf8M9R9UdH2ySBDgeF6xUDWCv1hneFVF8hjs4CRtM2CWnFyD6NPnmTtx
         kSYvW81AIi4+7/jwrbD213ODR6A/6/Gx2Je+wmB0281aZvWBHdKpHDpnGIPWHhMRj0fA
         XeIEb8enNCt6nWhhu67dI2X3ZxDQ4tzYtxEGsbXxNZAbrDDRn8UQAOl5Hj6gPLN2GOO/
         G76g==
X-Forwarded-Encrypted: i=1; AKwUvBzbcrqZC6oeM3IDuEzi+MZaNd57xV4VNwIgbpsMaXKfdGX0OY0+V1wdf+kWHpvtjxo8u6B2/JhvtcE=@lists.infradead.org
X-Gm-Message-State: AFq9FYJbAjViJXiO7N1o0nFww7sIv9qL/VB0sj+WyCX1+ua0z6kAmDZH
	raqqaYu85m+1jdQKIxV4zy43iLL/nlVUa9578WsusBhgFO/49g/mf3ac
X-Gm-Gg: AYBFou0qWEz+a4nSt1n/3t1HwkV8KyrnfstW7MFR3mhE+k3rOTCJkYYMag5luBqRG3a
	huowrCaupymZHLc3VG5bzNILItysVX+Fk4h4xiGUAL8U7XzkR9Xi4cvp1sWLYnqMfQ4PQpnboij
	ytXeyjIxLfj65kh0zLVie0oaTUbCaYOs8GPrGWx/xWtzakB6icbiRlbEPUeyp2ikFvtl/RmtQyL
	1CNOwdR/s4iPwg7nkET5YyBGKFUBQiAtBZJPsbzBGnxtmQkgSFA9Uuc1TcpPPkLX2FfxjururCv
	Db8+urOjHU2+UgLBNkpOK/gWTV/I2FzqbB5YA5iVSUFqa0BvJ/FviGCvyixIosh3zP8bD0uGB2A
	XAdSzq9/+L+B9qTcMfkPiuvmLLU9SAInjYlizEBg8yUOcxkLJcW9UE6Me9fCHdz7W6rSTnTMMmG
	07fwgNRTWvqlcjA87odfK6Hd1Br2hLKLwkkjfZfBPfdl4E0CkkEG9mR7fgI5EQr47TyPmzvCRPD
	aUXnMHU0agbNQhlGaPhEHQR3qyL3fyHk4edccgiO8ypzcPASjOAPjsjOceyDkbJiB0T5Z/kdPKd
	has3VtpM4XMMdJgck2xRpFCnaRpBpsjF/eG+j2vPouFxX+HNRSMI/Hy7pcsjg7Z/08GscOw3LS7
	boX/EXJfZ1sIf8Tr1oqnQctaZ+SN9JH1PPPwr6GSRiF5WD/EaZSnxqJdw/h6WCiBnsrrutSxiR2
	7Z9yUDlPbm3pZ7xw==
X-Received: by 2002:a05:701b:2411:b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1ac557770edmr3026667c88.2.1793371191299;
        Fri, 30 Oct 2026 07:39:51 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm7399020c88.5.2026.10.30.07.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:39:50 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH] mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
Date: Fri, 30 Oct 2026 14:39:45 +0000
Message-Id: <20261030143945.2923554-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_073953_309741_54C164BE 
X-CRM114-Status: GOOD (  10.92  )
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
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.
Compile-tested only.

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc..a8106de2c 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2659,6 +2659,8 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	if (!to) {
 		dev_err(this->dev, "DMA timeout, last DMA\n");
 		gpmi_dump_info(this);
+		/* Retire the APBH chain before its buffers are unmapped. */
+		dmaengine_terminate_sync(get_dma_chan(this));
 		ret = -ETIMEDOUT;
 		goto unmap;
 	}

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
