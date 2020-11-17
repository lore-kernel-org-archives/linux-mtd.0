Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D3CC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:50:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10AD221734
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:50:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z6sy3nCN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jfOa4AiS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10AD221734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkF2v/dgvVgwxcdljHkdzy+a5LOvXUP/aOz8PPRkrjw=; b=z6sy3nCNY3cbd3KXaQes5h4Av5
	k3eIyxq+95WpQ+VNIL6yP/sd0SXHaLncNEZF4AkcY2nvhajoIGds0fRqEw4BkErY9doDMxUrkNywg
	Qu2E62i0jcyNdbeFGz7qen0JRMeck4y8Iy1ObuDz517TvvmP7BKB0dRBlL3OXr17ab0jv4DGBDnCu
	W9Am3+KO8Rimb1cPTKSYG/E1BWYhsorVaJ9u6wkJos3xmKrHk6nPsXpz6K+6FZsA3R9ZtUXrqrLN0
	WKr+raMYu6YBlPl0sHKqzdLikLw0mRyhPdUngIF/aZSgim7Xncflrye/6lxb5A1e2NW392cGPGR23
	d26lgzKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf56V-0007DO-1T; Tue, 17 Nov 2020 17:49:19 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf56L-00079F-Px
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 17:49:10 +0000
Received: by mail-pf1-x441.google.com with SMTP id g7so17781950pfc.2
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2020 09:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=268k75iGgPwajGOaY5d0Of03PhQtD6bYvRMlc9HmW4g=;
 b=jfOa4AiS/tPxjopccSsFwVuEPAIEFOQvgNIDZfxXpCqZM2rBRAbMSPUGrRZCUxk9RM
 M1lSMnYTKmkr2XwSjmUTy27z01sP+vWfmEPHgxDNEejk9lIudy+tadMlhWcbHgGXGsAR
 m9Hv77MP41Mel1ZJKkB6HvxyP0sB62RPYQoM944E6Eo6+T24PBAzzub48v8+buJCMMRL
 vwM2SOKLaPLTVb64Py+CQN2TERL4pdJLcKZ9w49oof+AXLuSDSzabeXmjYwy5mLyGPi9
 ZyZVBHp4DECrukNla6p+KiGhOD3Jum1NWBvyRl7F4SiAeuW+7CxLg0w5K2zA2Rn7Xhls
 0ySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=268k75iGgPwajGOaY5d0Of03PhQtD6bYvRMlc9HmW4g=;
 b=Vwi/0L5LvKkwY/gx7YBZLzv5C54yIL3PEY3VkLFA/lvknKNkn6EchmLYGz1xxhHXsp
 i3kiezlYTfZLNr4d9LdAwHQy+jY1DjvYhxjyoHSPEjoyg1Hb9dWEckl4MhTzSSKD/075
 3tmzKthSu5ZzE1OKGEW8hwaNKlPPwwCPBsmgXhYu5Wys+8lVr8LxxPYUiZz3YIWHyI2e
 TAUnGUy2U/fyMk4yIoOv3Plz1VZyCLT/lkM3JTDpzhgIiB8ctA0/8lMrhwLwsCLXyKsT
 CiN3aCp+9y4vPRMIn6tO+EOhw5DsChblKwIOub8QsnmSxOWHwrV9Y5X3gmHAsaC8GqLb
 XOsg==
X-Gm-Message-State: AOAM533g9GrZs5Tks145EHB9LXOy9Mqm99ITdB7ncC8zRBoG6K5GRCXn
 P6W6x9VMT6ASsA7DRRQpKfvApIkm2Q8D
X-Google-Smtp-Source: ABdhPJxY8KGN1ZSec/mXAFeuvkUuavubQH+z6KaVaM8f1siege4JnI9ulfj0qykscLac6PxVdm8hQg==
X-Received: by 2002:a62:e40c:0:b029:18b:ad5:18a8 with SMTP id
 r12-20020a62e40c0000b029018b0ad518a8mr707392pfh.16.1605635347218; 
 Tue, 17 Nov 2020 09:49:07 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
 by smtp.googlemail.com with ESMTPSA id
 192sm22222810pfz.200.2020.11.17.09.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:49:06 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v2 3/4] mtd: rawnand: qcom: Add support for Qcom SMEM parser
Date: Tue, 17 Nov 2020 23:18:44 +0530
Message-Id: <20201117174845.28684-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
References: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_124909_890621_CF8C931D 
X-CRM114-Status: GOOD (  14.19  )
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
MIME-Version: 1.0
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
index 777fb0de0680..1b031aeac18b 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2797,6 +2797,8 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	return 0;
 }
 
+static const char * const probes[] = { "qcomsmem", NULL };
+
 static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 					    struct qcom_nand_host *host,
 					    struct device_node *dn)
@@ -2860,7 +2862,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 		}
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (ret)
 		nand_cleanup(chip);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
