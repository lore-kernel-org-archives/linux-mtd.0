Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24747C54E71
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 00:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1IMtqaMYWu0ORgYqhnHHSEPO3Sho0qx3E16KNBQ5VpU=; b=RRLFsOKh76jmok
	ldzRTJl5xJYJkLhIpbaF2ccP7mqi1jHc6FqtxiaZ0p1tK5ZqfeBcwYUSX9cnT7upVIy3dKpZEut7R
	GCgh8r+OqyGJwcp1If+Sna+SKXDWBComHEHoeVoOYWFBOet2FCTfxJXJz/FGPQXMsFOSiX7xVszAC
	4Q9T/eZP+l8+bPR9Kc7yyS+/yrnviztkyNWEDQ9MA36D7vgcu2jAGS032Uhubr1yCme4kNU/6kvuP
	gFP7T3/H5Cly/qfCzWwXXMGM50hQRUYjoLtou2hn2k5U3+S10PcDiGCCC6Y3wI4XR8Lp7WIfGsFBv
	tO+qCApgn+MtqzlAUuxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmjYo-0000000EiTI-0ocV;
	Wed, 20 Mar 2024 00:12:02 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmjYl-0000000EiSb-21FZ
	for linux-mtd@lists.infradead.org;
	Wed, 20 Mar 2024 00:12:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-413f4cb646dso41068105e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2024 17:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710893515; x=1711498315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s5UeCuP+rHqrtuTgJs0v1PQXUHTqmsrEuVFHCUle14o=;
        b=M2tIhS9Qcvf+WM7UbHGlUF0NTzU6hLq8nQ7e1p+tCo2SQ1LjfVg4DRH3xKOkkGJCC/
         9wWPU71ATcRHCdp867Xn5nlEdHFa1FgZqwk8unGCZg8GiVxWgmLUHtwGNnXOaAh4LazS
         rtBjReBWb/r4618nPOA1YCs1qSKJJcLlsC6mO/ueec8nuLurhz6mpBooMtDC4UuKzjyV
         iJ2VKE7wZuf6R7L4AptBHrRlA1wfXsPblv+g2kzgNI9VAqApY/soxqgFCOz2POdubkfy
         eSsC23j/+GNxyjvHEpleFFOKUYUS4d1Iqu6sRhTF0v62NEW0GF85epVjOamMStQghKZg
         yf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710893515; x=1711498315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5UeCuP+rHqrtuTgJs0v1PQXUHTqmsrEuVFHCUle14o=;
        b=EcoeQ282NGdtytZ7lym7WRSpgwhlaCftJHzwu0wRhjK1SrbT5mdzuBf3GmNLWvjw4s
         5YYOWaC28JAzxrUuHwl+nKK5V8Dm8AIoFjLjGJXmIYmf8bSC+J25Quib+U29D4pKML5G
         uazXBoOkbIbNIH3/rkYWonriBVDZ3RmBf3bXd93yv6e3wJYiLXxwvA6geSoAmMq5EckB
         c08Ge99aGp14QrR1W0dbJ/FePgMnN6YAJ/SfoFM1JDl+pxppgtcsd+NitdNSzN0ehPLl
         /SaNtTsXBZaRSI0leg5fVVKqOjnirKUv1BO9ln2Bd3nGGZoL7wgIFieG5ZQpObke19hV
         dDnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWynupWaRxsaLe1hMb0se/V7heNimQjdEZm8mQ6rpN7Lh3DcuFSMA59B/cKWSovLeliH+bEXBq1xXcloXROna5sMnznGDM7LFpEitU5qw==
X-Gm-Message-State: AOJu0Yz+KX7HBYKJLElaHyi10I5LHvqYdp7S7p9BfQBFUP/GNQvENHT+
	cmV2QkN8IlEr/dmJq8isnT706fKd4uCbFDaPB+IljMEx/+iY/cOS
X-Google-Smtp-Source: AGHT+IH3ETbAdh9odNtGmgi5+pc37TVausHqIdd+KaNxNGb33DnpvHbi2eNlp3wRouIqKjFQ5anQpA==
X-Received: by 2002:a05:600c:3b0a:b0:414:cc0:e4d6 with SMTP id m10-20020a05600c3b0a00b004140cc0e4d6mr5937225wms.26.1710893515176;
        Tue, 19 Mar 2024 17:11:55 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id f20-20020a05600c155400b00413eedd36a4sm371478wmg.39.2024.03.19.17.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 17:11:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: qcom: Fix broken misc_cmd_type in exec_op
Date: Wed, 20 Mar 2024 01:11:39 +0100
Message-ID: <20240320001141.16560-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_171159_547670_68987F21 
X-CRM114-Status: GOOD (  13.57  )
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

misc_cmd_type in exec_op have multiple problems. With commit a82990c8a409
("mtd: rawnand: qcom: Add read/read_start ops in exec_op path") it was
reworked and generalized but actually dropped the handling of the
RESET_DEVICE command.

The rework itself was correct with supporting case where a single misc
command is handled, but became problematic by the addition of exiting
early if we didn't had an ERASE or an OP_PROGRAM_PAGE operation.

Also additional logic was added without clear explaination causing the
erase command to be broken on testing it on a ipq806x nandc.

Add some additional logic to restore RESET_DEVICE command handling and
fix erase command.

Fixes: a82990c8a409 ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index b079605c84d3..b8cff9240b28 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2815,7 +2815,7 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
 			      host->cfg0_raw & ~(7 << CW_PER_PAGE));
 		nandc_set_reg(chip, NAND_DEV0_CFG1, host->cfg1_raw);
 		instrs = 3;
-	} else {
+	} else if (q_op.cmd_reg != OP_RESET_DEVICE) {
 		return 0;
 	}
 
@@ -2830,9 +2830,8 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
 	nandc_set_reg(chip, NAND_EXEC_CMD, 1);
 
 	write_reg_dma(nandc, NAND_FLASH_CMD, instrs, NAND_BAM_NEXT_SGL);
-	(q_op.cmd_reg == OP_BLOCK_ERASE) ? write_reg_dma(nandc, NAND_DEV0_CFG0,
-	2, NAND_BAM_NEXT_SGL) : read_reg_dma(nandc,
-	NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
+	if (q_op.cmd_reg == OP_BLOCK_ERASE)
+		write_reg_dma(nandc, NAND_DEV0_CFG0, 2, NAND_BAM_NEXT_SGL);
 
 	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
