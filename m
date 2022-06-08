Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B1DC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 00:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Qu1OxgKHm8/oEtncUtBWyQYdzPeLcL60cexfbjvONQ=; b=GmlqFdF2i1tQHp
	zHt9ZxL/G9OfmQ36Eo4WIcAzuIWdxttkOlCULJHaeTIVnJ0U87FPNnk1gZlrD2mKze+HWdDnMkmDc
	7L7RiHJJkeae9uvudAlZVLMJw4aTuUMQrkh40hIRenQLtW67FkLJ47RwYL0qgi36C+3/LPaoi744l
	6wW4XNVX6AvYf3avAQesyudBq9FMzTwMyTYAYFnBytZfMDnSCL1r6MoZBaUkuOpiTllj5FTsi8YAF
	LTcpK2qvpGUCZRJMaT+S1/eQqc9yd4VUWEmNwuK3TKBDTcgXCF9rIzI6uDOcKRcdu/Yju+i94ecoU
	EEPsH5RrqtIse4xgNMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyjIW-00A4WZ-SS; Wed, 08 Jun 2022 00:11:44 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyjIR-00A4TX-Vz
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2022 00:11:41 +0000
Received: by mail-ej1-x634.google.com with SMTP id fu3so36791042ejc.7
        for <linux-mtd@lists.infradead.org>; Tue, 07 Jun 2022 17:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=peEtDnuQnzaJUUeMjl4LqwaDIeftlXgdWfg5usfizDM=;
        b=arIWg9P/rpW9RjH2/kZdbxLIEKz/qsOVFMIqQpAOBi1CmHQHyeKnT3tHNY8v9dM5x5
         UXW7jWkClwvY9b4vrujSkFYIhe9xrWuOCSW12rU6R44Zh0knenIBmnnZ3LdpEKufbG+U
         CVJ73XAj52QFqzGPtaWPDlDkd+0byXkcESSP6Q1e0Gm6QtngzyYcayvCjXTUYp8CgpwI
         Hl0NE62SXCgcvGCGiMZbQd82St+lH2TTvcnsLPuinDOoL7TbTrc8b1/ndsSN/WcocjB8
         KXjmSKD2y9P75k1+dDXYm/wxo5z6U1PF2TQEM7BImXBlFibG658W5fQayCDsA8ThHlBE
         5Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=peEtDnuQnzaJUUeMjl4LqwaDIeftlXgdWfg5usfizDM=;
        b=3092H4kWTK/DfUs7+ety+YCDjLKbs4YPKXuz+kF79/cFvJRwhhNbsnKCJeiYCz8g7H
         dvBHl+jdXmoHeUKLoSMtuAw5sPTF1enIzM8FnjDp1w2qO1Tur8bd+XsjohVdrf/DLwc9
         EfORSHcpJdQ+VtM3H3J5czNaI2B0b6aI+iu3b8dB7rx4tTQgx6W8tmnw2o4z9sppwc2T
         c5OSlPjc/zRyW73eR0lyZnyRGCwe47AvUpZwrK2RAodWuJCMaGUA5Oz/G5ESxEpNckbM
         oTHU9beNYOze9/mw9lvGP9T01yLRjW3Q2qokw1AzxA6JmnQijBJ7rKwcGC79vkrz6y82
         PydQ==
X-Gm-Message-State: AOAM531vhw8cSYffPXVqilxCGt9fwxy6255CK9gZWkgTVQOAhoPnHkSf
	3MbTuEMuZNywLvzko32Sbyg=
X-Google-Smtp-Source: ABdhPJwVcxROaQW6z1CnZo/uOEvNYmnun8vP30SLXWhuaCTc7t9UfttE1pcsJ8QJRiOq/sMxdxLHng==
X-Received: by 2002:a17:906:685:b0:6fa:8e17:e9b5 with SMTP id u5-20020a170906068500b006fa8e17e9b5mr30668613ejb.522.1654647095641;
        Tue, 07 Jun 2022 17:11:35 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id o19-20020a1709061b1300b006fed85c1a8fsm8434947ejg.202.2022.06.07.17.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 17:11:35 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v5 3/3] mtd: nand: raw: qcom_nandc: reorder qcom_nand_host struct
Date: Wed,  8 Jun 2022 02:10:30 +0200
Message-Id: <20220608001030.18813-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220608001030.18813-1-ansuelsmth@gmail.com>
References: <20220608001030.18813-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_171140_059034_E0D64A63 
X-CRM114-Status: GOOD (  11.56  )
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

Reorder qcom_nand_host to save holes in the struct.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 06ee9a836a3b..110f839c9e51 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -475,11 +475,13 @@ struct qcom_nand_host {
 	int cs;
 	int cw_size;
 	int cw_data;
-	bool use_ecc;
-	bool bch_enabled;
 	int ecc_bytes_hw;
 	int spare_bytes;
 	int bbm_size;
+
+	bool codeword_fixup;
+	bool use_ecc;
+	bool bch_enabled;
 	u8 status;
 	int last_command;
 
@@ -490,7 +492,6 @@ struct qcom_nand_host {
 	u32 clrflashstatus;
 	u32 clrreadstatus;
 
-	bool codeword_fixup;
 	int nr_boot_partitions;
 	struct qcom_nand_boot_partition *boot_partitions;
 };
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
