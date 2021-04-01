Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15ADFC433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 15:17:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A008061367
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 15:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A008061367
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5Ib6tvKLVT5OFYvHdMzx5cdtwfAJTJzvfy+jH0blGuA=; b=E+ibjptTLD7R5xVpKl1010EpZ
	A5g++A8wmVswSxC2cgIOE0x4DG9UyVysYJYFiUci9/fAZMnqZBQSorjghFOmVq/PQHhrBNS54fvbi
	pnJquuqiPnb+voWigp2Qshdzoe9G47ECG+NO+vfvEKbWVxIHHa6LGn76ekmSC+93K5q2PyLxsQ4RK
	sobXV1nUZcmb8A2Ex8vEiEgK5dWvLUNJXPfkVfGVKORano2agWSY/ICbtDGfbEFFx97nr61BVCTin
	3bwslKmR+7JQXm5DrOocHVQK4tYjVuoz78ua2DgR9tg6AUDeanN6Ro24KRuVXtM/sj/cl3X0J0Xav
	7m2guAvtQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRz3g-009yo9-B1; Thu, 01 Apr 2021 15:16:32 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRz2s-009yb1-C1
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 15:15:44 +0000
Received: by mail-pf1-x42a.google.com with SMTP id l123so179107pfl.8
 for <linux-mtd@lists.infradead.org>; Thu, 01 Apr 2021 08:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ww076wtEw/l52B1eQC1HZmnMQQ8Ebtr9JfK+3ViX3so=;
 b=tF+Bf0zSHiNRZEzbvax45HKx5XasDVc4mTeR8Z3f5KOhpxLF17YeyipN6Mnk2MEho2
 dIy2iXo7LwjVg0CYNSwMxpVJMpz0INw6mgFNFWDKvTcXRhEiv6IaE/tgrRyuLuuHakLr
 9mxUK0wM+O4SVQOusVcdbIoRK689kFxwmzBSTqZmkR6XL0O/dqF0j9iga4Xh67Vj2s86
 /xsy6fLZg+0LuawDYPkxWkh0BiCSHlUhcKuW82dbBmgjOMHhjPChWXn9q7xh49G6l+ch
 aDHeoIzlmBCObxHRlsK5dxeeV4nlRtEdxcC60DDZc+FRNUAy4Bh1U67sZnjTAGYQ7YQ3
 z4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ww076wtEw/l52B1eQC1HZmnMQQ8Ebtr9JfK+3ViX3so=;
 b=YACRVKSpGp6a2eWTjlE2GHLAv4mcWaP4W+rvBaHUDvJA5vz6ctZ3YJM/Y8MEf4vuCZ
 YFMBYwkri9vGf/11bXGwdijJ+Bar1NEnOawzpZuPajTyZfPLmv+NGw+vJp5VRWhhwIqd
 NY5pFM75LVOJHBLquaObR0b+5Fbl+qQgNdzXAJdljt7Trh7ejavFx+qrxLFOPEYMvdXJ
 TI4o1FISPv35qZf38a31oWNBPctPQsi1k0lUfT8XxK08RA+EooCUm9SDPTGKNUGh9e39
 8XrzdEuuodB1OIWcw4Xhvlf6jjpBPOG3V5uAMyXiMpKRaxH/KcPSGkcjUAv+Y7uVBXGa
 bfTg==
X-Gm-Message-State: AOAM532NkMNnhGnITDdI5EL7Z6tcXPHvc243Gy0IQSXPIWPG2ruERUzm
 uhLmCPU+PMRx3f4HV6SMjuiY
X-Google-Smtp-Source: ABdhPJy3tSsSELJHLBsot1ilaqec0UUD358hycDfpgPt8GVfk7MyEPHq1NQy/QE8vIhIyquNpGL4vw==
X-Received: by 2002:a62:27c7:0:b029:204:7b11:3222 with SMTP id
 n190-20020a6227c70000b02902047b113222mr7788418pfn.34.1617290140491; 
 Thu, 01 Apr 2021 08:15:40 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.138])
 by smtp.gmail.com with ESMTPSA id 35sm5652769pgr.14.2021.04.01.08.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:15:40 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v9 4/4] mtd: rawnand: qcom: Add missing nand_cleanup() in
 error path
Date: Thu,  1 Apr 2021 20:45:08 +0530
Message-Id: <20210401151508.143075-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401151508.143075-1-manivannan.sadhasivam@linaro.org>
References: <20210401151508.143075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_161542_464750_B57947B3 
X-CRM114-Status: UNSURE (   9.51  )
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

Add missing nand_cleanup() in the alloc_bam_transaction() error path
to cleanup the resources properly.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 87c23bb320bf..fe74cf3aece5 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2882,6 +2882,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 		if (!nandc->bam_txn) {
 			dev_err(nandc->dev,
 				"failed to allocate bam transaction\n");
+			nand_cleanup(chip);
 			return -ENOMEM;
 		}
 	}
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
