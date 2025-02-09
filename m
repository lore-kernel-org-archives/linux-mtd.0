Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6BCC02199
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Feb 2025 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1TeLCXgmhXEdVu1b+KXeIhbYd2S+JiRPLbtX7MJbyFo=; b=MHU9KPbiehwztV
	xWfsAewiT664FVvVHptrqPSwVgKUMYjn9sbwy03qof+aTPEZ+Mg59J9eFRP2Q7l6Ce92nAX+eqvj5
	vwZr//vEqMH6fK4xxAjJ58j9gGPsPsSqviv3MefRxfIfbIJPk698c2lJEMOnKwvoDQY9G+YXY8Jez
	qcwJgcP68ujNDB9J2i9Nr3AuJFCWB9uaRRh4va6CLhCzr9uJIdU62IVqj2vNt11fH/rKZj44NHOWy
	BnQS6Im/KV44emH1ETCaSn+UR76Y1uf2oe4VOZ0ZSTG/RQlqpu9BA+vCgpYh6ZUIDf/CptatsS9tX
	6y3SCoX5fg1H1hEUgaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th80t-0000000Eyuj-1jqK;
	Sun, 09 Feb 2025 14:10:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th80q-0000000EyuI-10cJ
	for linux-mtd@lists.infradead.org;
	Sun, 09 Feb 2025 14:10:21 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-439307d83f0so5802365e9.3
        for <linux-mtd@lists.infradead.org>; Sun, 09 Feb 2025 06:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739110218; x=1739715018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajeuJVOh+9HeCX7nzLDN53ifrTD6lkRc9i/XGHY2kXc=;
        b=R1TGI3qdHlVaXCSpOawcc7zoW8Ch5QSQYf8GvfY+ybd34H3/6ZTNrt+S3/N7pEIfEu
         MdkEWmiCZjrgkuKY2nKuhuGda/zsO5k5LvqJiKZdu3GzWBG1zi3npjII7OCg83Fzac9U
         x6iGn2Uot5rVQePzau2NkfMt9zKiXLmSKjS0vRqOTGTlwZdC0DaYVk8QTH/Q6eONjbwV
         fYYGRkaXTf2GjdThofapoWUxuZQbD8gxBrijD+w5GWIkSBSxJkemrIvckuSK/lYcScih
         FQZ2i8Es6pX7PhT/Vs7Nzu7JZe3rI1mmiNqQt5R0aQL4pOgjEFi0OI+uywk2bPfro6PW
         g/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739110218; x=1739715018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajeuJVOh+9HeCX7nzLDN53ifrTD6lkRc9i/XGHY2kXc=;
        b=OFBlAcxC2Rbne3/jhrzKgig37k/Dv9jiC+S9GyLvwNEXfvOkkmaIXpSxahnvNr6xA+
         L9Eu6fztykF9NPaML6B9PbulChGE3WuVdqi2Yby32cVTsdzHbQ0GihF2prsZyP0NTffS
         z1RFchMWmVKB0VdUtcI8BkyZFwcN3inu+p+nToA9NEr4bH/ovFfXhVxUO3I2rAkBc8rf
         9828cs1OS9uLlH+jmVppxM/UZ40KdUNpimm3S/cku5BsRX0awqYlsv1Tz0rQPgLxJj/R
         7feRc+iNc05YnYzySgD7XM7JBUOxm2eHacKA95o6yYDXoHfyVV8L1CAOzy0xYl5i6jln
         LX+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWavnnTwPR4V9wAwXsaDNFwzn82ivVFCpcxsRCnrSwe1hCVg3iVPdaBfWFBi8LrZ4HFgjKHPZL0/9g=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc6F8GRZZuVue80k5hGrbAVAcDBoap5X5B81jW2XQQoJdlXK7H
	21/hEHBjgXtBIjJ02En4wfSHvRVZd7e4qKmm0D5mgJATupgS+v3B
X-Gm-Gg: ASbGnct5Nyd2QGjC5sDAWfI4+tjL+OKa6dxwQRZ9lLo1ZBc1RZkKWH/MTlyKCNQ3wLc
	TmFh9WO2gk8BbnEtKMfrm0cFBpyldGhsJ+8rO7g0JUMrWUG8Uvuu+SqeEYXsWQhHJn9LLJ42PDV
	zJJpqu4emSJk3voJaIutz0qB1nZd5LJ/CJ96K4qvy0l1cNuudobnzM0i26/iC/N/SaUs60ug4wy
	7eI3w7QYhi/qbLqWQB+du1eZaOU++g5F/eg1yhDkn5jZh+z55bR6fmsYOclfiJp7Awul64M2aCW
	QqPTTpo/M8EbNzHFXWh1c6PBOtS8SdS8Ma8UdgCzZA35khjJMbzIFKWs5wqy
X-Google-Smtp-Source: AGHT+IEpJbYfrq+vlnKMBwnl0T5BCZSlfekmzoaVWvq4nX/g31e4Y9jxfhM6Hdgz/rOhLVMSGYkqKw==
X-Received: by 2002:a5d:598c:0:b0:38a:888c:679c with SMTP id ffacd0b85a97d-38dc9374610mr5634105f8f.42.1739110217751;
        Sun, 09 Feb 2025 06:10:17 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d94d685sm150843985e9.13.2025.02.09.06.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 06:10:16 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2] mtd: rawnand: qcom: fix broken config in qcom_param_page_type_exec
Date: Sun,  9 Feb 2025 15:09:38 +0100
Message-ID: <20250209140941.16627-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_061020_281675_70C68378 
X-CRM114-Status: GOOD (  13.32  )
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

Also restore the wrongly dropped cpu_to_le32 to correctly support BE
systems.

Cc: stable@vger.kernel.org
Fixes: 0c08080fd71c ("mtd: rawnand: qcom: use FIELD_PREP and GENMASK")
Tested-by: Robert Marko <robimarko@gmail.com> # IPQ8074 and IPQ6018
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Fix smatch warning (add missing cpu_to_le32 that was also dropped
  from the FIELD_PREP patch)

 drivers/mtd/nand/raw/qcom_nandc.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d2d2aeee42a7..6720b547892b 100644
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
+	nandc->regs->cfg0 = cpu_to_le32(FIELD_PREP(CW_PER_PAGE_MASK, 0) |
+					FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
+					FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
+					FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0));
+
+	nandc->regs->cfg1 = cpu_to_le32(FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
+					FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
+					FIELD_PREP(CS_ACTIVE_BSY, 0) |
+					FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
+					FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
+					FIELD_PREP(WIDE_FLASH, 0) |
+					FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1));
 
 	if (!nandc->props->qpic_version2)
 		nandc->regs->ecc_buf_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);
-- 
2.47.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
