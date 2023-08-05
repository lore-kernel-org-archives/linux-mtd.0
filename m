Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F44C04E69
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Aug 2023 17:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haXd8/wt4E8LBtQJkFo9TM9nCdy7iZQBmKuP1HmvjCk=; b=PNoBeZoLcp2wE9
	iG6VIfXiau4MGPu0za1IBGA3jECIwyxz6OY4W09WSMoNBtpkymr5DA+qLb/xY5GgobQMERx9I/pH+
	QNHiujEJNybZX49FKDoFCX8E0s4H5JOHFEyijJ0fGvUaMx7oTkrrwo/ugUzUtVyDfNMus6Bp9rck7
	klUuXU+p+NRWfWY02HDL/yTgtFJ/7JhLHmybHJQ8Ztb5YDDbNzHnAowXqjj8cyCcPqV1CQImn+fGc
	rGR/kR6ec6ngQpKUYe+jVu3zIwznIvmve/wSO7apnFgGLXZHErL1POmxJltpJfuDAA0Xq9HjIA2yc
	5x+ZNuWCuXLISWOOjjvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLIR-00EP45-10;
	Sat, 05 Aug 2023 17:42:35 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLIO-00EP0O-12
	for linux-mtd@lists.infradead.org;
	Sat, 05 Aug 2023 17:42:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-68783004143so2214840b3a.2
        for <linux-mtd@lists.infradead.org>; Sat, 05 Aug 2023 10:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257349; x=1691862149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzjUVbmqujkXx5jszw63KmEj0mqPrkYgNLPBEumwUM4=;
        b=UjtG8HGD0HXhbYE6KOMjYvoRrgHtcqD2ZE8722LK6PTedcUT6bAAuZT3T5lZa/0BFq
         dpRdRzNQV2xMdM2b+6b+GcCfiDZ6u5eMcDb9c1Zuc/Ng3RH3SLGtds/VgBpuZ4HfHyxt
         KHokfIMsu0H0rfXzPOoDDFVbVxs+V+ke7GyWVrUygP8tu3B+HsJyM6cVo2gxbMgP3Wli
         ypdb3XWpikZowDgZgaAy5c/UImiho4fNo3gUdTiqDDJwF1a67JSsrBJ+dM6M40sxaZv0
         otPqs4LjwZvCsIHBKI59i3308tE/Q2IfLhO0XhkJSFtZ1npPdl466eg2XEpsx0lh9jJl
         gP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257349; x=1691862149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzjUVbmqujkXx5jszw63KmEj0mqPrkYgNLPBEumwUM4=;
        b=YCJZbj0Mg4G92a8VxuPKuOmyZX4xpX3s23IgFDur1kfsYF0om6r0geYJIgEQOaRS2q
         TvOg+5hp8lH8yuBqOlWKQHvLOaFpm1A2yJfuaRHzh8QjewU/T2aAXkqdkG714hL3dlI9
         r4KnGtPkuo1X1abJJMlo4+2P2ZBN8CAnlj4fBIpMEhp7Y0G29/vdoepiHCRdN/r7kcvP
         oS4+BJ5e1T55V/Kgv5OfNmFM0xCMIfOAWjYkuEDHI+MDPv8g9Pn7rVRg3AcAw+YPuhZf
         IsiFQycpFy2Ml5M3DJreSEABbNKVaNrT1nTK2ml3VZkKxHHKQleROvV169umSH3UNUNd
         EAhw==
X-Gm-Message-State: AOJu0YyiSW5uuZ32F9SE+MHpR8HQrmkl1e6bc7WPYGEJCGn3A0PtiQ18
	dyQTbdPS9XHABur2l6P5pgzI
X-Google-Smtp-Source: AGHT+IHeVbzFK1nWPZK6UOOQ+nXvClEVy5meGh11RDFEADwwp55gDn+bwJzz5DYrUJzfXoFc5uD6IA==
X-Received: by 2002:a05:6a00:114d:b0:687:3bc2:58de with SMTP id b13-20020a056a00114d00b006873bc258demr4086067pfm.6.1691257349344;
        Sat, 05 Aug 2023 10:42:29 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:29 -0700 (PDT)
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
Subject: [PATCH 08/10] mtd: rawnand: qcom: Simplify the call to nand_prog_page_end_op()
Date: Sat,  5 Aug 2023 23:11:44 +0530
Message-Id: <20230805174146.57006-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
References: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_104232_354582_C8837BC2 
X-CRM114-Status: GOOD (  10.18  )
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

Now that the dma desc cleanup is moved inside submit_descs(), let's
simplify the call to nand_prog_page_end_op() inside qcom_nandc_write_page()
and qcom_nandc_write_page_raw() to match other functions.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 1dbe17dcdb84..6b81781aa3ad 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2016,13 +2016,12 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const u8 *buf,
 	}
 
 	ret = submit_descs(nandc);
-	if (ret)
+	if (ret) {
 		dev_err(nandc->dev, "failure to write page\n");
+		return ret;
+	}
 
-	if (!ret)
-		ret = nand_prog_page_end_op(chip);
-
-	return ret;
+	return nand_prog_page_end_op(chip);
 }
 
 /* implements ecc->write_page_raw() */
@@ -2090,13 +2089,12 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 	}
 
 	ret = submit_descs(nandc);
-	if (ret)
+	if (ret) {
 		dev_err(nandc->dev, "failure to write raw page\n");
+		return ret;
+	}
 
-	if (!ret)
-		ret = nand_prog_page_end_op(chip);
-
-	return ret;
+	return nand_prog_page_end_op(chip);
 }
 
 /*
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
