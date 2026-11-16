Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9D7606A32F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SRpmjRHd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sn0gV5oW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aggNcknaJdv5Q+jyXDWEKQxIESjhI26GP7CtW9hlOsQ=; b=SRpmjRHd/HaqRBHhqUfn6gu1/p
	IvvXF3nFs8SE9i+O8UFonYOVJvOqee7631o/mA2K6Z5hyW+Hz1bm+MEhLgjmdqYCIDLwk53oTGrWk
	QNl5uTTREtbPEU+Wsa2mC3a63TZluX2ewqggTP/dnnWfCVF5bZ4R5umqY/qgJiRJ5mEPMlV2bUbee
	v6Yn25W733OCHNziclYYptUsm17CEASii/OXgq43zmsy0RKp9U0f+ZRgJQdDk51GOotQVhac+/WYv
	LBK9668wFUernMaBNC4e+xbiRHVbZ2497Z5rFV/dnYEnbKeEKLj2AOHZXj3Zzj1TiCaQfayA804sI
	SR1PEWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyhM-000000035G4-0sV0;
	Mon, 16 Nov 2026 15:32:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyhK-000000035Di-2OSF
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 15:32:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so11008615e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2026 07:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843164; x=1795447964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pFxqYSIZbtjxl66DM/SuqHMnpQJOwfAGCQV6L8DRO0A=;
        b=sn0gV5oWGNOWv48LjaugJ4nJ++ZsguN1VQMj6bsCwVvR1PW1XbvhyiyXFOrgMzuBqy
         VPdz7/NuXfB8sUri0PSs76yhTwfUjeQ2XdX2sq68m89VKkgnKGPbpdNmmzJO0JXqbjPh
         +gTFZkkO2FaU4MB5z8134ctEEPE7nBzYwT2uyK19bqj68p0NMnRSpcLgE5mDXTBOmvTJ
         qLTCU8lP3574gej1nA3ZOT5lCiB72IbG3IVmzqbIUIQ/RkukxWOxXPRtbn4QnMW9ItzG
         0ZdeqDWeaGT1fl/LBRs0YpL0RksE8kpPs22MVyj4hMc9g4D07k/3HorisHT2owZnW4of
         k71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843164; x=1795447964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pFxqYSIZbtjxl66DM/SuqHMnpQJOwfAGCQV6L8DRO0A=;
        b=MYwproNifec+WRpajd2NavC/lqCc+YUQTAMfPJ/RxGj4OEf1B2kZIxnElF90BvKzwD
         4ElFPuPJIrBOMBtBbTsszwhM0gFg64lugCpKHL/KyfgFCavmgDuouosb09DbcDbbxrLA
         pBkOGBlVc3wzW6OD40pAvThbxYVxsu27ycDyhUcOlOxV3nK0V8n+ty6oAiFWObFNq8wi
         wr735tdMV0bey89BUOnAV8ZsXbkd0lCK+ABTx9BXO3PArKsknodriAF5EVKLG9Ke/bdJ
         kP7h/CJ/6WdcMjLeH5KdyR25/NxtjJvtKysUW9gUitZFQHDJjSeyEpUmiIdgUaQ3u03w
         GX5Q==
X-Forwarded-Encrypted: i=1; AL+hErG3zI/SOfLP4Sr0nT+cbfO8K01ycohiCt2UbujdG1gonjcNB7H5aEDzhbZkPSkKu2X4g0akLhroegY=@lists.infradead.org
X-Gm-Message-State: APuU4Z+faAx8fUVoEmUNUtrB0ZVSyi6nGihS82ovEQi6aZ47LXqp1JJS
	6BLn+pok+a2uv/GDbFjuOBeWmkAKrGJylGLw4TFuHcylzN00IK0YbQfY
X-Gm-Gg: AYBFou1PFdpEzpKQYMOHpcJFN+uozoVMw2o3W0o06eqv7MiBbEq3/GMaIiv0Uw9vdCh
	ZCp1RrO6STqmmRvwDLcrikqbwsIC++nHVRtlz5ptPinIIqKoQtmNbRdTZpksP0NDQ5rG/Oq4nFC
	MH+oW2v9/ArBPLCKz/w26R9d2nPwhql86rU9VfsiQ8CoqnBM58D+iHnQpnq2u6OcR06cONGYT5r
	N50TIZoq4vQLQvtq3Gm4dWVVLSLh77DcCj5IkWptIfLNJ97G0toOT5UtrwBTtWw0hAymtOKqvMX
	IgS1mmLSXua11wAEGneXZrGhicngV47kmU+CHCZxmmABCqxbORQkq9wqctdzVscJmwzxnjWAz0W
	8X1oPPSvjMw62Ajg96tuLbFXFmHGQ1GPcSmKTs7KFEkYMriMCKl0TewPgYl/0WxtNvYWglTDv9B
	sXSlA7IqCpa4m6Uy5yrA6GqdFG9nec3s/e49WsFBIw9t1ux5xDwjmYnAtqOB48pCsRbMFp4Gkl8
	UUHBq+3qE4Y9A3UCVBA4bd4fAz8k7Wc6VYV1z8NVyZvX3tYzWR5/AbJeUBL0JsLNSQWTq8DOwAR
	2024xKoHZdPLhlZnUL8YyW7ixu8J+5NEEet2/tCpeMgPq5cSDF6AW+hz7ReRRMSBd6S+EEJZ5rs
	=
X-Received: by 2002:a05:600c:1c17:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb6752853emr169384055e9.17.1794843164207;
        Mon, 16 Nov 2026 07:32:44 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d0d430sm86798195e9.3.2026.11.16.07.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:32:43 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>
Subject: [PATCH 2/2] mtd: spinand: xtx: add support for XT26G04C
Date: Mon, 16 Nov 2026 16:28:47 +0100
Message-ID: <20261116152847.3658486-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116152847.3658486-1-angelo.compagnucci@gmail.com>
References: <20261116152847.3658486-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_073246_623654_E98729C0 
X-CRM114-Status: GOOD (  12.42  )
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

Add the XTX XT26G04C. It is a 4Gbit 3.3V SPI NAND with 4096 byte pages,
256 byte OOB and 8-bit on-die ECC.

The status register reports the number of corrected bits in bits 7:4.
Values 0 to 8 are valid and 0xf means an uncorrectable error. The other
XTX parts use a different format, so add a new ECC status function.

The values come from the XTX XT26G04C datasheet, Rev 1.9.

Tested on an STM32MP133 board with UBI and UBIFS.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 drivers/mtd/nand/spi/xtx.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/mtd/nand/spi/xtx.c b/drivers/mtd/nand/spi/xtx.c
index 5915b37b4..70f853678 100644
--- a/drivers/mtd/nand/spi/xtx.c
+++ b/drivers/mtd/nand/spi/xtx.c
@@ -22,6 +22,9 @@
 #define XT26XXXD_STATUS_ECC_8_CORRECTED     (3)
 #define XT26XXXD_STATUS_ECC_UNCOR_ERROR     (2)
 
+#define XT26G0XC_STATUS_ECC_MASK	GENMASK(7, 4)
+#define XT26G0XC_STATUS_ECC_UNCOR_ERROR	(0xf)
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 1, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
@@ -138,6 +141,21 @@ static int xt26xxxd_ecc_get_status(struct spinand_device *spinand,
 
 	return -EINVAL;
 }
+
+static int xt26g0xc_ecc_get_status(struct spinand_device *spinand,
+				   u8 status)
+{
+	u8 eccsr = FIELD_GET(XT26G0XC_STATUS_ECC_MASK, status);
+
+	if (eccsr <= 8)
+		return eccsr;
+
+	if (eccsr == XT26G0XC_STATUS_ECC_UNCOR_ERROR)
+		return -EBADMSG;
+
+	return -EINVAL;
+}
+
 static const struct spinand_info xtx_spinand_table[] = {
 	SPINAND_INFO("XT26G01A",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0xE1),
@@ -249,6 +267,16 @@ static const struct spinand_info xtx_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&xt26xxxd_ooblayout,
 				     xt26xxxd_ecc_get_status)),
+	SPINAND_INFO("XT26G04C",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x13),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&xt26xxxd_ooblayout,
+				     xt26g0xc_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops xtx_spinand_manuf_ops = {
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
