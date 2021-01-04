Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44ED1C433E6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 04:13:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05AE720C56
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 04:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05AE720C56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dXJKdk6Kxmp3uNTKJL8XYXuNyRXj37NgfFKM0Kudywk=; b=HN0WLMlBh3NYPh06i33W9VomX
	2AXlTS48576YYXf0hIOC0op9oHFc8DJdAQJ8oLtbnfumrJlGWEtPPRSLbFCabwCfzj2ACp46k7Fhv
	i5ccHi9ePwFIMs1Q6mS7rRRldA9oduOATUvJO1vcj7iJDoHnmTSKtWtiU7teMwc+wzl6jq+ZNay2I
	HcOVjPYxf+LHT5+Md3PNVTlLgjkSUwLDbYFyglNHR81/iQKdbn4veshzlmVqiiAos48gl5Az80sO5
	RSgM/jShAGTLhVmbvKJelJh1KIb+RzDodR8o9oUfEIAp7SRUo4QbrEirmHm/vyLit+Yz7xdzT8e2g
	2b+PGkpiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwHDv-0002PW-3p; Mon, 04 Jan 2021 04:12:03 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwHDs-0002OZ-VI
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 04:12:01 +0000
Received: by mail-pj1-x102d.google.com with SMTP id lb18so9219068pjb.5
 for <linux-mtd@lists.infradead.org>; Sun, 03 Jan 2021 20:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=icXjVyLr8ROGK9HCrfmW24KYFfrqOe76+5Eys2pUaYc=;
 b=MUCjeC0n9Jzu3Ybx2+wYVVQZHu+be4Ab/JPXX+mx10mppyE8coiYJHLOQtIFIiWFDu
 tBlRN12//WUM+lgkJ6PgC9GzcdK4GHlrAIP6kx+aY7vfmCUtpostUbWZCfZpQ12UkCNd
 YILCpHW+eidapdhkVCU2wnGb7ghd0CWy99a5KDahC2HjtHvatBy24V9XvqkEw13tpddq
 pYhhyexGjqX5E197g6JPx9sSYsm66uBLzbGojSD10uk6mLqL8umyT4wb09EKzPZPCZiq
 UxNrEFHQLeF5GjsYB/5icUIISqQFUxKDglWMdt8qNdZ5GPbR3ipp8tlvgXKgx4Jpab5X
 NTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=icXjVyLr8ROGK9HCrfmW24KYFfrqOe76+5Eys2pUaYc=;
 b=gKDgL6c5quXAZebR+GSR9yTkQtTUQS0wAoPrLNU294Yq5eLZtzpgS2TVbEpYcXWPAd
 faAcetjiHdxyKWGh9m8u4VoBGKE70doygCyte1ivC2ppIEeFSBmTHZTyNXdd45MJCr9F
 Cx3wtab50TxGnV+5iepzwhGoUlKvZHYIiWxjxw61jI1waLaElVfcdawZ2Zr0mMaewwaK
 uS8UmF6cvhlKUEjkWgl1bGogdyZUH2TdmGaXdJgx9EFC3ZKRdLPoNhxvqdXxw40Akmsr
 O6jOs+Qp/xSe24MgdJBq+LAhhE1vSlthGcKxo+OeGBy9ntxdo5j4BqP17yf93Sd6d/Tr
 kc4Q==
X-Gm-Message-State: AOAM530Z86XOHGQhurkoUFpAH/lZnmcphj9yKTaTKV+sjbwSw5VHNcZm
 p1R7n22pIFTOkpYUyT1sCqEe
X-Google-Smtp-Source: ABdhPJwWuQlC9C42p7YriHVAU0fLFuzmlbs1I6A7poFZx8dMn5NBsQ8KChaZkRch5Lf4CybfrDMhpQ==
X-Received: by 2002:a17:902:6bca:b029:dc:34e1:26b1 with SMTP id
 m10-20020a1709026bcab02900dc34e126b1mr52162525plt.52.1609733518888; 
 Sun, 03 Jan 2021 20:11:58 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
 by smtp.gmail.com with ESMTPSA id x22sm54899930pfc.19.2021.01.03.20.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 20:11:58 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v4 3/4] mtd: rawnand: qcom: Add support for Qcom SMEM parser
Date: Mon,  4 Jan 2021 09:41:36 +0530
Message-Id: <20210104041137.113075-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
References: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_231201_046973_50C32FA4 
X-CRM114-Status: GOOD (  11.97  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for using Qualcomm SMEM based flash partition parser in
Qualcomm NAND controller.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 667e4bfe369f..fd4c318b520f 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2821,6 +2821,8 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	return 0;
 }
 
+static const char * const probes[] = { "qcomsmem", NULL };
+
 static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 					    struct qcom_nand_host *host,
 					    struct device_node *dn)
@@ -2884,7 +2886,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 		}
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (ret)
 		nand_cleanup(chip);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
