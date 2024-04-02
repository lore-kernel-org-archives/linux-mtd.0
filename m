Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10EBCD1284
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2024 21:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OGpv9mCaQzVX5RMFaXswvxezP7O1Wr8f22i7/bwjzas=; b=ocIvNtF/Jy6hl6
	+R3cNbzWp+vkyt074yfm4ZpiyFA/UUuCqBriwskAwNEv0bhaHv6lCCqlZmBCaxFWCZSeqkQEZFXFW
	2TD7xIfmgPS5XrTs+MMVLXBy7APl6Cbm8M29KXIhhcT1Zobe6llKOlDcWZXhUeml8aKZnYlBbP434
	3d5ZSR+g05uhxOgaXyU56A8a7/OSKvs/pu9i0A8NpEtz+io5Rt9DeTBf84Z/QIOOHojkOFc2ppc8X
	74UNlgQhrT5cDl5xk7p//d7uKkJMt5CneeGKo7o91MlTbsF0mX57ArssZLpPJ0bTaI6taZd8Xv1Zu
	s2/vPJITuggMeOxKfPZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrlyk-0000000Cunc-34ep;
	Tue, 02 Apr 2024 21:47:38 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrlyh-0000000Cumk-0Nqx
	for linux-mtd@lists.infradead.org;
	Tue, 02 Apr 2024 21:47:36 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-41569865b2fso16596005e9.3
        for <linux-mtd@lists.infradead.org>; Tue, 02 Apr 2024 14:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712094452; x=1712699252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xDdWgOjBMl1tMJjRaoCRravRU0WRe5hMbvpkOwO9lZs=;
        b=FzrWqrIZPz1m6u3Uv83P6W03c5EebzVGLPpHtp+gsXYTyU+hFN+Mg+/csxzpJoKwHR
         ler5W3ctg/YKbRfprzWp3ome+7wI+702FD/idIeMvd8nIGEwAgmArurVQ4INS/5Vbdg6
         87jaXc4Xu3O9/bfdO/B4aiduFo6fjNgdCXsyBrDH/aowuIuxPaI7RO40kbKw8gPZCABn
         F7QO67S63MEEOoZ+eq+0QuC01WJYh9Es0mqmbdp44MJxmXcRXp26+6UANxCbqSlZaTMi
         X+VcGKVX+Ya7W7yeHo3CYC0xQA41xaR+5ZonsxYqGnmCRI2iGzhe9km0pzdYvczc/3uh
         xieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712094452; x=1712699252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDdWgOjBMl1tMJjRaoCRravRU0WRe5hMbvpkOwO9lZs=;
        b=pfJmWLq8Q3KfqaKtOTWCwimpXSjWodP3+n5mEo2g2/lLborpHVnQW0YnT68i4johuz
         1RSVm4Xg0NQKNGORUIVPdOSlU6ziAwiNv9Zb33M/9e71y94lW6+ezGDQhyldcyEDoTYQ
         QwCSYEHaF6flt8Eo3x5EonsWkvEFHqID5mLu5kIvK+MYVDXWLFolzie0HC0sq8WXwnEE
         8JDWk6Uny5nUeplb+EVVZU9i8MVUb48q2RSFjUYZgsHeJq4HkKX9a9h4W6ha6RvUz0io
         BZL0LhEvkIExlqN/a1e4T0ckSQiFK5oU2FHJy6tsuN5UHpxyiwbS710d3Pg2oAOMXof5
         Imbg==
X-Forwarded-Encrypted: i=1; AJvYcCUQbrEyz0lm4BCPDR3xMnfxv+G4j651JYut4btRm4dUgQQMRO9+Sb6aw+EAzqUGTTQUwU3TcWoWyVX+aHjhfKLrm9Is4Ck8xQVpaXWMdg==
X-Gm-Message-State: AOJu0Yxh2F8FdyH4e5tMnwP5AxKWXy9r+QTVkn2HGmT0k0Ot1Mjt5AkH
	bvlD1Rf4x3m1rmQaeLKlXwpaHS5A8KVI8QueB73GWKB+W+hZ/Psx
X-Google-Smtp-Source: AGHT+IH8HHuydEJoGrgEKUlbvYjlnQraEID5+on1377b8OsiGIjc1yd6tOz6uo4tcmYGXArYVCuLJg==
X-Received: by 2002:a05:600c:1ca2:b0:416:1d2e:62f1 with SMTP id k34-20020a05600c1ca200b004161d2e62f1mr1600676wms.5.1712094451446;
        Tue, 02 Apr 2024 14:47:31 -0700 (PDT)
Received: from localhost.localdomain (host-79-35-252-101.retail.telecomitalia.it. [79.35.252.101])
        by smtp.googlemail.com with ESMTPSA id c2-20020a05600c0a4200b0041563096e15sm8812630wmq.5.2024.04.02.14.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 14:47:31 -0700 (PDT)
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
Subject: [PATCH v3] mtd: rawnand: qcom: Fix broken misc_cmd_type in exec_op
Date: Tue,  2 Apr 2024 23:41:34 +0200
Message-ID: <20240402214136.29237-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_144735_171575_62C5181F 
X-CRM114-Status: GOOD (  13.61  )
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
OP_RESET_DEVICE command.

The rework itself was correct with supporting case where a single misc
command is handled, but became problematic by the addition of exiting
early if we didn't had an OP_BLOCK_ERASE or an OP_PROGRAM_PAGE operation.

Also additional logic was added without clear explaination causing the
OP_RESET_DEVICE command to be broken on testing it on a ipq806x nandc.

Add some additional logic to restore OP_RESET_DEVICE command handling
restoring original functionality.

Fixes: a82990c8a409 ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
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
