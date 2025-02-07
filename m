Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74D2C0219C
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1PVvrOUM9dH0Jw1H1bU9CuRa2Xu+IkRtUAT9CTvGQXY=; b=fNgpbLybjQ7xo7
	LqBl54TKgaVyIwwMkxCcLNaCtzom8BxHXrwRCZwqnjbftJx9+pztFUzOZwbX/Zip1H6AkYTKR4YFg
	r/bz3u2MVc2RuvqwVv99Ni+sdPM7BELbx2kaIBXAEt/nUB0yO1RI+tOnIX15wgD4cvJJ/p3VQpUUW
	Ij4xbK4h13Ja29wA8cRD49L8+0PRCVr/zhODGc2q/nSqUbVBDzVTfQZUewDYG89fOSslxX4Q5nj7s
	aj6M51K5e72L8feAKkzsyD8HWp5cYrkfPkAXWX0exUOdMkT8qHuNGbZzCWDyoaYYFLhw3g2n5Finc
	a1vMvFajjFRWSqXwPllQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUz7-0000000B4Uv-2Xqv;
	Fri, 07 Feb 2025 20:29:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgURm-0000000Aze2-3Xof
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 19:55:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-436202dd730so17041485e9.2
        for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2025 11:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958129; x=1739562929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5rGwJnk6onGTN6F+Q+8uNYESaMmK0c3tfH4f76Zn9gg=;
        b=TYDmv3bXmHszGd6v4uO2UXMaf/ePOutF0ZLnsrMYDK3xAOa+28gmWNDsKGbdpotaKU
         3ZTFASpeBb8TPKH+M3X5dyNm7SM7vbQaefTqY0NNfpQYq1CKEiSJ5Qs/smyDZ1c6Wcc2
         9IyO3w840c8fphqlTi91Av9FgLgXa7/bCTPcXiLNtERccyZ0zgEUMRBLWE55DwMMLQKO
         XyArDOgi3y1f4npaXhD3Weu/+Qvqs99A3Y45yCe5MFiyV25te8PoWVLuf0It5aj60j16
         gliiKCNxFuVpZJNvKqqPsUocvglsMO053rZpRai38dPL3GRrC/iwZLiUIXCeeCDCkC2p
         hdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958129; x=1739562929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rGwJnk6onGTN6F+Q+8uNYESaMmK0c3tfH4f76Zn9gg=;
        b=mEU2tCuGhoPcRL2DFopFWlEskihCVWwmxzywLMYqAES8Fr2v4UXNn2/C/3jEmm27Hq
         ygrQpmy02GU6WlLxAlTVVy97IJBnGWdjHu711pDxBLoWz7uuNG/Q4TMb8KKkh3RQG3vG
         IeyP8WomIOeMXsJb7H2FFah8HNHSW5otx8LGhRRVS3XbRib8NtUuQ6jJgcs9g1OOo1VC
         MTDEeIZhutc4PBelHJv1+XzyEMKEXSaXU//8363PSxI7KSwdnCDCfyRiOnvjJhlJpOym
         DtD7tXRwyVCXuxpY0Lyhgy9a+ZaLJVcoAllpedl78W3lc18E2BgSuimjfZCjynjOjbcY
         LY+g==
X-Forwarded-Encrypted: i=1; AJvYcCUtwGkUwGPAwX7T/HHNxpfi0u9vpMc6P7KPrx7HBHi79NzIlC8fzTITUQehco4MH81oP0s2WSYgt9s=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCuTcqRyhR+Fdya/kuQJ0ujtl3TtHJa9l09K+AcVUAXq8reYsg
	bqzQg2CMtbulCGwn81IzHhbAyRqF1V3QWeEpuZoJDH4U6Q5ZtzrZ
X-Gm-Gg: ASbGncvV9joEniLOs0ZtOyG5nHq9/9r9MhAmzOFzuF2T3BQxXqumnh3uU7twvnLWGpJ
	qgE9fO6BE8sZb46/+bJm115D4zC1+Ip2QsmK2QPtK9XRrxRIewTDppRhaf5UonvRpMe8YcsDOwo
	CMaII003cdXK/dxRQ0DXpfDaFjy3wJPzO2NDdtoFPCv6QN/CsUuoqsxUNJ8y/dxeagWFeApUZOw
	HWl1xRRc3hVPIjabf75Cf9atNJMkFI1AJ36JNs3rs/xUIhSg8emk5nJSOqNZ642W1CCVEPoeicr
	fDBv09ftox9VSeLZRyb60ZepBC3ghePoYZ1/pD6ZVI1re2gp0oJszvkZC7+B
X-Google-Smtp-Source: AGHT+IFkCndvhHRme8MUTVSNUm2JXoXYopJcvTKMek4MPe31gk8TP668VFJiyH5pPNKNipL4QhYt0w==
X-Received: by 2002:a05:600c:1c9f:b0:436:1c0c:bfb6 with SMTP id 5b1f17b1804b1-439249c0324mr35381965e9.27.1738958128528;
        Fri, 07 Feb 2025 11:55:28 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d933523sm102280335e9.1.2025.02.07.11.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 11:55:27 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: qcom: fix broken config in qcom_param_page_type_exec
Date: Fri,  7 Feb 2025 20:54:33 +0100
Message-ID: <20250207195442.19157-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_115530_882798_6C5AF7E8 
X-CRM114-Status: GOOD (  12.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix broken config in qcom_param_page_type_exec caused by copy-paste error
from commit 0c08080fd71c ("mtd: rawnand: qcom: use FIELD_PREP and GENMASK")

In qcom_param_page_type_exec the value needs to be set to
nandc->regs->cfg0 instead of host->cfg0. This wrong configuration caused
the Qcom NANDC driver to malfunction on any device that makes use of it
(IPQ806x, IPQ40xx, IPQ807x, IPQ60xx) with the following error:

[    0.885369] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xaa
[    0.885909] nand: Micron NAND 256MiB 1,8V 8-bit
[    0.892499] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    0.896823] nand: ECC (step, strength) = (512, 8) does not fit in OOB
[    0.896836] qcom-nandc 79b0000.nand-controller: No valid ECC settings possible
[    0.910996] bam-dma-engine 7984000.dma-controller: Cannot free busy channel
[    0.918070] qcom-nandc: probe of 79b0000.nand-controller failed with error -28

Restore original configuration fix the problem and makes the driver work
again.

Cc: stable@vger.kernel.org
Fixes: 0c08080fd71c ("mtd: rawnand: qcom: use FIELD_PREP and GENMASK")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d2d2aeee42a7..4e3a3e049d9d 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1881,18 +1881,18 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	nandc->regs->addr0 = 0;
 	nandc->regs->addr1 = 0;
 
-	host->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, 0) |
-		     FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
-		     FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
-		     FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0);
-
-	host->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
-		     FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
-		     FIELD_PREP(CS_ACTIVE_BSY, 0) |
-		     FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
-		     FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
-		     FIELD_PREP(WIDE_FLASH, 0) |
-		     FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1);
+	nandc->regs->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, 0) |
+			    FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
+			    FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
+			    FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0);
+
+	nandc->regs->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
+			    FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
+			    FIELD_PREP(CS_ACTIVE_BSY, 0) |
+			    FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
+			    FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
+			    FIELD_PREP(WIDE_FLASH, 0) |
+			    FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1);
 
 	if (!nandc->props->qpic_version2)
 		nandc->regs->ecc_buf_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);
-- 
2.47.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
