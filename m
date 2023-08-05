Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8A1C001DE
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Aug 2023 17:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mzbVecYlRl/pY/o8wiokt7nBwhoBkqf4tr3gSGmnz4=; b=KTcgeblO83uLzK
	eHrauJe8hlpoHjHAcS7GYYh7xURoN3rF/ut8Hk0RgpBX8trNldunJSBhS/SsypeqlsUH4jUOc7RkB
	VSOW9mnmwQsSlX9u/Z18ISo8jkYnPkCkzfyOmNe5ch73Ztr0VcAk1R6rTVR63s1qsXPQJz3INYdBp
	6MLXlic5HRmKXQQWLurD8GDDaqQc2nfDFGPvvra+HC6zjK6srjg4+zwe5TB7YmsZ5K2L2TU7zMCjG
	lkOgszxczOctIEplscmAIrizFmUVv/AFYXjyvHH8tP52jir/IDIrqTBF3nn+47CYZImBrZQYKw7hr
	ucVoHfjHAnXSfbSN/hqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLIF-00EOwr-29;
	Sat, 05 Aug 2023 17:42:23 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLIC-00EOvB-2H
	for linux-mtd@lists.infradead.org;
	Sat, 05 Aug 2023 17:42:22 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-68783004143so2214782b3a.2
        for <linux-mtd@lists.infradead.org>; Sat, 05 Aug 2023 10:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257337; x=1691862137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw1sNygr+6EOLB0Bp4iKWYmwaK5BTcQtXrfXFuq/ooI=;
        b=RvaRNKwqniSRcehrR0lce9LhJjPEMUynlSdYrqa0l0Stp5DYnvJBYyg5XWgF5xF+09
         NCRQTj+LLwGgcnNuaeSKibgV1TC6oesV1KVl0/ZMKD9g1UaDJX8pvnIi5IAkjf05Vm4p
         RukbhjCgP8zj6IZYmiZYQ5TLsQ2W1Gm4VN5hVWKOOPU9FdzgBQziLCrPmRhQU5gZNtOu
         6qpshnoZBT+0w5A/Cw7JgP0RJ15MUojMgQqYgP4r3nCpBscB7FNj/6xz8iH5z8LCgqrF
         AbRHBjHs7FVep9gQsJUCVe/6LdP6LXna8hY+lV/UN7jeQ12TtZyzczJls80inwqLaRI3
         fNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257337; x=1691862137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fw1sNygr+6EOLB0Bp4iKWYmwaK5BTcQtXrfXFuq/ooI=;
        b=BsxwxzySpparitH5EtnSRBPol10v3Fi1BgxXRlbZy8A2wLO2+jAXt0d3LiSG6l2KN7
         HeThhwXJbInT0I/i6yA2yIwp8+FrkcwYjeIh3pBn4m7+9HT3BWKjPinr6l73vS/B8/48
         VLQIGnBH0Jk2IYJcUeUcc9A4XphdPabm6b2rlXUW3zZjBm+WewgJAFw5oFljeW1mbLmy
         DAK3IiGC5DLH8tpN6c97v4Hj1ahE54Jv8E3en5fQxt8xPCxbRFfMxyH/6J0J5Od3rGjG
         x+aJ/8Zoe00I//5sxdRZ4a+6MGjf6rusBP3XcpEMUp0Nx2oBBuQycuEl4sIboWsL89GK
         Z6cg==
X-Gm-Message-State: AOJu0YyKVnDmKLOV3uLDIPT0xwzi/T0NmUi54Fj0Joujp7NSUlbFBHat
	tBBjUCNj0LrEccNYjtop0+W932pcUls06Cfq1g==
X-Google-Smtp-Source: AGHT+IF5OInHqRHyGBbYddAN6cm7dEHOkjfzNQKZvIYJ4gy5VyCVJXSOv047XOI0sN9UpTafW2p9+A==
X-Received: by 2002:a05:6a00:2d13:b0:67b:f249:35e3 with SMTP id fa19-20020a056a002d1300b0067bf24935e3mr4741963pfb.26.1691257336916;
        Sat, 05 Aug 2023 10:42:16 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:16 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_mdalam@quicinc.com,
	quic_srichara@quicinc.com,
	dan.carpenter@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 04/10] mtd: rawnand: qcom: Fix the opcode check in qcom_check_op()
Date: Sat,  5 Aug 2023 23:11:40 +0530
Message-Id: <20230805174146.57006-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
References: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_104220_742897_76C764BB 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

qcom_check_op() function checks for the invalid opcode for the instruction
types. Currently, it just returns -ENOTSUPP for all opcodes of
NAND_OP_CMD_INSTR type due to the use of "||" operator instead of "&&".
Fix it!

This also fixes the following smatch warning:

drivers/mtd/nand/raw/qcom_nandc.c:3036 qcom_check_op() warn: was && intended here instead of ||?

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202308032022.SnXkKyFs-lkp@intel.com/
Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4957e9253878..29fcdac932f1 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3033,12 +3033,12 @@ static int qcom_check_op(struct nand_chip *chip,
 
 		switch (instr->type) {
 		case NAND_OP_CMD_INSTR:
-			if (instr->ctx.cmd.opcode != NAND_CMD_RESET ||
-			    instr->ctx.cmd.opcode != NAND_CMD_READID ||
-			    instr->ctx.cmd.opcode != NAND_CMD_PARAM ||
-			    instr->ctx.cmd.opcode != NAND_CMD_ERASE1 ||
-			    instr->ctx.cmd.opcode != NAND_CMD_ERASE2 ||
-			    instr->ctx.cmd.opcode != NAND_CMD_STATUS ||
+			if (instr->ctx.cmd.opcode != NAND_CMD_RESET  &&
+			    instr->ctx.cmd.opcode != NAND_CMD_READID &&
+			    instr->ctx.cmd.opcode != NAND_CMD_PARAM  &&
+			    instr->ctx.cmd.opcode != NAND_CMD_ERASE1 &&
+			    instr->ctx.cmd.opcode != NAND_CMD_ERASE2 &&
+			    instr->ctx.cmd.opcode != NAND_CMD_STATUS &&
 			    instr->ctx.cmd.opcode != NAND_CMD_PAGEPROG)
 				return -ENOTSUPP;
 			break;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
