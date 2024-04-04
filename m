Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9299CCD1292
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2024 08:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZVqW9tC8n/lpleS6ypPSQtT3yhy20KuzS++hY7nXUuk=; b=w4tZPgEpbPTT7J
	I/aQxmHHYoVkMRwpBuIJ9Dx5H8s5hAlkXz6sLDAQWMdL3So7v+exIK1H1+WeRPwo0Z5pPT9ht23Uq
	VwfOAsRz6rf4Kocxf0cC2jcjELxeGyNeICA4bIJ9uJK02kWB81V0/aUEqVSXuj3sFkC/aEF1V9Lfo
	S2nbmEGUyAIbm/jFiZpKJaIrDnpFOMAc2KvgcF+OWWcxEK21Y9ZyY3OBapeqTRd1XeiAHuHmt7zix
	9SemnUV+M/NNeOZWArLVtKuRUHopm5zVm83esEWO+QJwHG2wmlrYNMrAxaMAXMjCouruscIePCc+4
	AxCkZvSE+sPin841XtgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsIW6-00000001qsE-0ptX;
	Thu, 04 Apr 2024 08:32:14 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsIW2-00000001qro-43df
	for linux-mtd@lists.infradead.org;
	Thu, 04 Apr 2024 08:32:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-34356f794a5so635874f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2024 01:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712219527; x=1712824327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ooJENRerkoGv8RC2dqQyR7rICIVbxFIMSkiHPTOG8iI=;
        b=FEz3fk0thCtppnj46MNTMalqujD5krfB9Re5dxt0pm7Sfasgm3K2xCumbnhDfb/ZS4
         /Wri0sDiL1B4HSnKLEcwhhtz/ekxo8FUaGIlCLsBFT2XUG2hS1QuwUmqBJLhQjS9Qntw
         Ji7cI6OMK69UL0iqK527EZN5wGhSEjR1F7Hz+KKk11is9p0qocmtQsRBTymnPeXgDYXE
         8x2XLpvK0vqVX6JH+lbtaazzrR8Ori/8t1Haww2Ue4cdoCp02r6WDnHUi8UVZ1IRWlUN
         nR9Md390JeuXargRYRoJrQnUk+yneGEsuW6Jqy9pXu0EiMv3CQFBIL4idHHMCmWS+GB1
         43uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712219527; x=1712824327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooJENRerkoGv8RC2dqQyR7rICIVbxFIMSkiHPTOG8iI=;
        b=w1SOP4bIQTkBiol9GJQoBURLJtqiYeNQLhv1gqYd/8rio1xsSqtyiyeQFqO13/CPnV
         JKSzXF9JOLjz0K7BPzuCD1qv5fTXuvkHW5xDGQaOGlKlSXk9VxWJR7EEe8bjZcEOQWmn
         S0kWBMDfP6hYOi8dqDw61XEL8y4LoV+vywIa0GsNJQ3kVfkpXfUre1d4CbhhXw7tRzWO
         RlKcAWXoWBnbOMskyP5V/he2K13uiMaL79v8SsQDy2HavUBaVN0OpLtsX/iLBxVOiVv1
         3e3fLhdol2irBugGXTKQ9t7/K0t4kewpoP8Ecz/RIu8P6AmwevbqLblptpa5pDbePlrm
         gZSA==
X-Forwarded-Encrypted: i=1; AJvYcCU6qUYrKZ1WJEaBV64flswTJFw5l94YR6BbtA96obEmSgESsWGq1zi6uoZG8R7exsIYxy+DOBtZY2GVjcxSJJYMrctNG/QSSxUXxgcbEg==
X-Gm-Message-State: AOJu0YxOb5+c0mkl5tx4vnJoXkpiZx8M9dAxVBtJ4jbRwl2VFnMxlutQ
	YZ6VmxdKpVw1d75pweBCRZT1CmlGsoVwIgJxNvYQ8bsMGs3V0cb0
X-Google-Smtp-Source: AGHT+IHMYG3JmAlvLO/BWsvlKYgpaEbWbKyheePdqiabhMh4InIyJ6wQlfooDCFT3M3D6bhH2Wi1RA==
X-Received: by 2002:a5d:568a:0:b0:33e:cf4d:c583 with SMTP id f10-20020a5d568a000000b0033ecf4dc583mr1575171wrv.16.1712219527113;
        Thu, 04 Apr 2024 01:32:07 -0700 (PDT)
Received: from localhost.localdomain (host-79-35-252-101.retail.telecomitalia.it. [79.35.252.101])
        by smtp.googlemail.com with ESMTPSA id dj13-20020a0560000b0d00b0033e9fca1e49sm19279707wrb.60.2024.04.04.01.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 01:32:06 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] mtd: rawnand: qcom: Fix broken OP_RESET_DEVICE command in qcom_misc_cmd_type_exec()
Date: Thu,  4 Apr 2024 10:31:55 +0200
Message-ID: <20240404083157.940-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_013211_032558_61495109 
X-CRM114-Status: GOOD (  12.60  )
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

While migrating to exec_ops in commit a82990c8a409 ("mtd: rawnand: qcom:
Add read/read_start ops in exec_op path"), OP_RESET_DEVICE command handling
got broken unintentionally. Right now for the OP_RESET_DEVICE command,
qcom_misc_cmd_type_exec() will simply return 0 without handling it. Even,
if that gets fixed, an unnecessary FLASH_STATUS read descriptor command is
being added in the middle and that seems to be causing the command to fail
on IPQ806x devices.

So let's fix the above two issues to make OP_RESET_DEVICE command working
again.

Fixes: a82990c8a409 ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path")
Cc: stable@vger.kernel.org
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v4:
- Rework commit title and description as suggested.
- Add Reviewed-by tag
Changes v3:
- Merge patches
- Rework commit description
Changes v2:
- Split patches

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
