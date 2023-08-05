Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DEDC00528
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Aug 2023 17:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSG2eLi9KX6qRXdbvpqFBtaM+ZTJLl0NP1jGGO1X3vw=; b=EZMAVWL1wx561j
	mISEoRQmFKOau7CgLBXAzvjEmku9G3nHmvQDBQz91IRIB6HfHcluIxexpu5EyIE0FjLmwJsUplw63
	Ykmn6gGAj89Hp2UA1g/v6gfx5hTW8pd6tdvWl+KbrKifOExUpxWmBVb9xp/fiI90S9TSIkpeTkEp8
	BreEY9ukGHeIOPGsKBdFE2Y9KOfi+PDKn0hRB4Qm+Xu0tkkuj8fUqmpMtHIaggM70xv+Ca1Reiyfk
	c7kqBJi/D3hAcS0AufyyGuhvvUQlcfWvoSaHcJ1ZCM6NSwYIrGvMMNw6FKMVPN4uNec4YCMmWylNZ
	8qHWGqBOuwY7rzrVAKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLIH-00EOxd-10;
	Sat, 05 Aug 2023 17:42:25 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLIE-00EOw6-32
	for linux-mtd@lists.infradead.org;
	Sat, 05 Aug 2023 17:42:24 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68783004143so2214796b3a.2
        for <linux-mtd@lists.infradead.org>; Sat, 05 Aug 2023 10:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257340; x=1691862140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DdQ17i05e7SXOOOl5eag5513m9DyQQ031lLX7RYOeM=;
        b=z4YGgwR2elh/iFIEMIUuNAj75llc2sReLBB/7yRb9iY10hRhPLGSIKMAOsbKqiruEJ
         e85zr/jUwZeceCfIFHWnSjwCUynVarvL9gIntTCBoIFNHDNG3jBkfvS5kuXKOkkRLlYc
         lQX4Zignzpz7MQw2vQs/TjRvy4buMPaSBMCEDzA/iNe60kq3H4nwf36F00sUo4Ia0Moy
         hNl0DKN8mImdD6VcaBgs8v6ftvL2fz6IkM7C2zySYqRW/cjpzZRqndVbN+QNqgBMKIWu
         CwKRaJCs6xZEaauXEJoVLEKvQN9IFredPVAFJgHzLGaaZAhLfvyyxaizTUbNx6B0qbCw
         6Gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257340; x=1691862140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DdQ17i05e7SXOOOl5eag5513m9DyQQ031lLX7RYOeM=;
        b=fBgTMhwYRGSPI5b34Wr5L/tdUzKwF5nL7yn98pIZdQBc9bWoJuO0pYOkGtLJfayO/1
         ai2ia7M7SY61spCgBKWaXeLn6RcieScDH0qHVoU63pnXnkQMZ8SfEk2D4sbJGl0eCCmQ
         T5PMSMETZk2AUelme5xhvE/mLfuEL2bBk8LQRnPRRP0yjU7les7l6oDdxeSaf9CS6vfs
         cDTg1908dhlBeO1S6nCqIVsVo6XGsi2sVLmkmJKCydY6ivNZOSqSse/77JvsqvUycwc3
         jSZjhQnUmhXDV+bS4nL55HiEfEWLsdW6h3wHJ3B6RfzHdJEuXbG9PW/pjgKalRPww+lD
         OLMA==
X-Gm-Message-State: AOJu0Yxl1eQr/ltQ3HWX7l1b9XUe/Fl4s6C/18aG3TBo/zy/++3CaQma
	l0X16C95JUSmUPbLvd1VHfPc
X-Google-Smtp-Source: AGHT+IFKwnABP3vDMVazc2QTk+cvtQZ8yH68NQhgjQamItU7KcCa/d/HqrT5m1bOe/BPp6jzK4AlmQ==
X-Received: by 2002:a05:6a00:2d91:b0:687:29ce:2fa6 with SMTP id fb17-20020a056a002d9100b0068729ce2fa6mr4911550pfb.7.1691257340058;
        Sat, 05 Aug 2023 10:42:20 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:19 -0700 (PDT)
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
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 05/10] mtd: rawnand: qcom: Use EOPNOTSUPP instead of ENOTSUPP
Date: Sat,  5 Aug 2023 23:11:41 +0530
Message-Id: <20230805174146.57006-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
References: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_104222_974873_B416BFA5 
X-CRM114-Status: GOOD (  10.70  )
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

Checkpatch complains over the usage of ENOTSUPP for new patches as below:

WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

So let's fix the error code which is already present in qcom_check_op().

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 29fcdac932f1..a7a9421ef003 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3040,7 +3040,7 @@ static int qcom_check_op(struct nand_chip *chip,
 			    instr->ctx.cmd.opcode != NAND_CMD_ERASE2 &&
 			    instr->ctx.cmd.opcode != NAND_CMD_STATUS &&
 			    instr->ctx.cmd.opcode != NAND_CMD_PAGEPROG)
-				return -ENOTSUPP;
+				return -EOPNOTSUPP;
 			break;
 		default:
 			break;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
