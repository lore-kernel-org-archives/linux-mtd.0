Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA51C54E58
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 10:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UWPJEskuYcxfiOqLNsM1FzntO5E5Dt2W7T3FiTaLeAE=; b=f8/bbvK6EYW1cT
	APF/Vn5bhWjl7xaoFakXHClsfW30gGcSpys03ULRW/8BycZcphOtk/PadxkFQBJFQDJr9l/BHyoZ5
	G+Noer6vIWQtuEAXJCYXDv1wcX9/UfdtLxeycg3BbFxO0cBlB+i+wRVEsyyOjRdEcDUD2ESZ8aQsr
	ZVWlc5y4Y6gBooElndd4uEhxDNvGvbQp6Bta7YoJ7jJ/InZ0ePrcbz/3/NfesxqOsUDybzmlago6a
	lepP+WLJWHCZyMByeupVpkqEiDujJfGdiRybhXRn2BpzMK7ZB5LhoW0X8mPdOIG3T/Ha0sZZhlgJ7
	AZGpaMgERU79vfYeosog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohc0-0000000GlLz-1V7j;
	Mon, 25 Mar 2024 10:31:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohbm-0000000GlGm-24oC
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 10:31:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41489d4ffccso3385975e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 25 Mar 2024 03:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711362671; x=1711967471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R6+pvzCVufm3Mx2KSZCT9a/GYJoxBfWf9J7OYkciu00=;
        b=b5dB7362JwYV4IQZ9vtrm6BaZ41y6GSyC3qS38mbp4gJBXyV1TryAR42N0t+y5+jzU
         YbP820ujkN8wSp3iZr0RVxVlLWSfmWsPiiRYD5CzMZU9C8S/i1JmI/q/SKJTBwZOTJcg
         ficpruY99Tl+aWMyjmPyhp7+qYc3x75NXWdmBnI3RUqGgFNV67f2sAisvS0YEHaH0rty
         CD/rdHFQIKCkxyih000H+gade2+FGq5+AclRzQHyPw7JNDYwlYw8NbB0Oe+xOf8TxhiL
         2TgksD16L4ZGty/tAGdCRf26oStgTDvKJY3WUVNsg87v0sPCqRN1yIGdZi4fOWyV9XOa
         78Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711362671; x=1711967471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6+pvzCVufm3Mx2KSZCT9a/GYJoxBfWf9J7OYkciu00=;
        b=bY/Qp0NBMa863gK3Q8qiTlQvOc+wnyYlvVm5zHxsjEQuGuXdtmFppxqQDpNfFHr3Iw
         L0gKN5unIX6E+y0UUjig1A5WZIiRPcpeAo3vQ8Fp/QkaC2oexjjT/dYHFrAiKSQjtr1w
         1Wqq+2wZ7xQj2sIrJXcCjVteYaPQVFwhzSIzilG3fovpRN0gJqvozFk4awu6cTcQCVob
         IQ3QQjj0tSAXX00RD2qZPFa6UReyCa4iFlEYLCmhwxNHsWhekm33ikOY3jh/qGc23F//
         Kh24U0dr/aQhRYoQWzl4cvs6PAb2dGkjPvBI3zDCG+7Pn5eqDRHyJsvVg67gQfFLWWWN
         HNAg==
X-Forwarded-Encrypted: i=1; AJvYcCXr7KG+4fi28QCSaeLU0w1AW4/CFzLt+g14pWHAC1znj5D5v0BvPAm7v3KvjvCfTR/MV31Mlon5d8plVGd1ok7gVmupaOjlUeVq/xob7w==
X-Gm-Message-State: AOJu0YxpOFPsPW3o3MnezgWm+OchpybsnP6N7WW12oif7dhecYJK2sr5
	oVrt3yCc3bOFWZZFnRS8H1Yu0zxA/s9lAdskmOxSnLj1HG0DfAYY
X-Google-Smtp-Source: AGHT+IHy1HIusGGKPe5ZeiznWlk+PCo+gWmMgpHFaNOPq2HgywsUWU0pqUTA/+5Cc977DgMX3TN+Xw==
X-Received: by 2002:a05:600c:4713:b0:414:8865:bebb with SMTP id v19-20020a05600c471300b004148865bebbmr2474707wmo.7.1711362670527;
        Mon, 25 Mar 2024 03:31:10 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id be3-20020a05600c1e8300b004140e701884sm8063878wmb.22.2024.03.25.03.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:31:10 -0700 (PDT)
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
Subject: [PATCH v2 1/2] mtd: rawnand: qcom: Fix broken erase in misc_cmd_type in exec_op
Date: Mon, 25 Mar 2024 11:30:47 +0100
Message-ID: <20240325103053.24408-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_033114_552847_A1EA3E09 
X-CRM114-Status: GOOD (  12.63  )
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
reworked and generalized but actually broke the handling of the
ERASE_BLOCK command.

Additional logic was added to the erase command cycle without clear
explaination causing the erase command to be broken on testing it on
a ipq806x nandc.

Fix the erase command by reverting the additional logic and only adding
the NAND_DEV0_CFG0 additional call (required for erase command).

Fixes: a82990c8a409 ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Split this and rework commit description and title

 drivers/mtd/nand/raw/qcom_nandc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index b079605c84d3..19d76e345a49 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
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
