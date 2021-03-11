Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA062C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 17:04:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 337A264FCE
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 17:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 337A264FCE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VR4LpCg7LR4Bt0d+Jc8kOFoMmf4d07glJya4Aqkc1N8=; b=K/WU7e11isMplL5+nQvSWxI79+
	KUjBUCXqZyJBchBHZY78t2OCUSZNnVaYM12zIDFaTd+yxWSac2CBboK1/Xb4SPgL8gyEyvvlB2HLr
	10wi38z0BGdkw83yMU9Qm9Sqfv2HWevf/yq3GQS22G0+XlHcwloM9gRbsn3w5e8LmI115NcTQLWQB
	yQThAY+hcXLpWJXAd/GdVY4pZ3t3klDf5sxRTQvYQL6MXhuWV9XcdOVr/kdiWHlpxT1FfCG9uUXUU
	w0XpmDT4AmF60ibwyhMtu/onauo4lCf1gwPh5E9SGzf9hKzgJXf3Q28yyRPm69xBgLNwbJBjkPPSB
	GnsLEq/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKOiw-009e1r-M9; Thu, 11 Mar 2021 17:03:46 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKOir-009e19-Qc
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 17:03:43 +0000
Received: by mail-ed1-x532.google.com with SMTP id j3so3868928edp.11
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 09:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AIJvF8THgvNIIJY7o0rd8q2CMHcgDSy7Mtu5dW42sFA=;
 b=oHvYAKs8vlQsGGeTCxnbGmFJRdubhK9l9eDvFETPrXX9cQ7MlU5fEAM0qMn1C7xchN
 YohhK3VVAFGYyqcR46GscrLSOwBqOC8DGU5uTlA+Vpc61R9ZoDyWxwVXvAqzNq2+eoNb
 VMsGujlugvf1G0oOs6vCypmtB9xIQqYp6W3J+kjg2Sayn6B9fqAMdNasJiN5TuCCSjM/
 JB3nztXsccELBZkyeuy3Z3uH8hBl/ALzgqBPPilDUFOd5dmSxnP17KKDRcMG9jw5cMBF
 jb8CogOCyTD0cSSO1m+s/g4DzFYtm3m4su1yk3a6ZqdMIKH5pzI3Hfxle3x9ihR0Tajz
 enfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AIJvF8THgvNIIJY7o0rd8q2CMHcgDSy7Mtu5dW42sFA=;
 b=a38evE9Syfpy365GjVzgdnnWYPn/tOsHQqX9XfjGt9t8ooXJoZ0dHj977lszhDVg8Q
 cjptxRZGfa5vE+PyqViXnnwNyjXe2Qxs9DBzbcTOglpBHRj24RYclJ5NNLmI7szEST4t
 UF86EqRt4CovJF/bt9wab14dcY783Cafi3Xk5THCZzRaVEKBrnILQhtlvy4+WX2HtC4/
 fzCBMBNghdU7kwY5roojXaKlE32XiqCpa0mOrjfh/nW/LCQaNcnB6AjSgMzb+Y4Spjui
 PdqCGUsKZd4MWBlZtFHqqmQA6FaR0WY6o1E/iDj/EH8GGkHPac7idf+EZN4Y5AOH4Iwy
 hTgw==
X-Gm-Message-State: AOAM531J8Jbe1rK4kAoNDRY9sPi6OUsEBfqjsSVFG0iVxgL1Yjjz2b3j
 Lzt0/VSiBMcV+0Z/trvAd88=
X-Google-Smtp-Source: ABdhPJwETXnVswKC4ZC4+FSyf5TAqqX9vnXmWFxa0O9LzcMWBXQwYxWCRSqufx1WJgXXxc52XIj3Aw==
X-Received: by 2002:a05:6402:1004:: with SMTP id
 c4mr9610447edu.364.1615482220575; 
 Thu, 11 Mar 2021 09:03:40 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id b4sm1627205edh.40.2021.03.11.09.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:03:40 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] mtd: core: add nvmem-cells compatible to parse mtd as
 nvmem cells
Date: Thu, 11 Mar 2021 10:56:58 +0100
Message-Id: <20210311095715.17048-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_170342_305363_DB9324BE 
X-CRM114-Status: GOOD (  12.42  )
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

Partitions that contains the nvmem-cells compatible will register
their direct subonodes as nvmem cells and the node will be treated as a
nvmem provider.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/mtdcore.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2d6423d89a17..ac1b4f176a17 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -531,6 +531,7 @@ static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
 
 static int mtd_nvmem_add(struct mtd_info *mtd)
 {
+	struct device_node *node = mtd_get_of_node(mtd);
 	struct nvmem_config config = {};
 
 	config.id = -1;
@@ -543,7 +544,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	config.stride = 1;
 	config.read_only = true;
 	config.root_only = true;
-	config.no_of_node = true;
+	config.no_of_node = !of_device_is_compatible(node, "nvmem-cells");
 	config.priv = mtd;
 
 	mtd->nvmem = nvmem_register(&config);
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
