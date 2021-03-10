Return-Path: <SRS0=h6Lp=II=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7197C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 21:09:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27BF864FC8
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 21:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27BF864FC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VR4LpCg7LR4Bt0d+Jc8kOFoMmf4d07glJya4Aqkc1N8=; b=PKynlrtGlayxKY4BnUIjypMY1B
	jfZmoTgG6ymWtIhikaiEjEieNHaseflLQgN85F071iUgf/0jve03mdxuK+qWxoLkf/r+Yg7Eg8Ax8
	uucAri2moP0PKoYDQKcjGIu00uZ1OEfVP3mxNZh6HY0PONTSR9WEE3kACc7KalRBGis3JKGozQvnF
	wKGEUxZ55vTlDpFKFWvWQ0vSHEbDM1JRGVIMQOkD39a+czpWvg3EgSL2RdewBOwiInpPS6/lvtLJ6
	hHBVrBJPv0OzYZ5yTlx9VlU6M44ideQ7W3wrIzAqI1OLBsN+LOoxVEKEo1IbpWTnHAmbrNPqDPV1U
	EeiYMENA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK647-007j1V-7G; Wed, 10 Mar 2021 21:08:23 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK642-007j0F-B9
 for linux-mtd@lists.infradead.org; Wed, 10 Mar 2021 21:08:21 +0000
Received: by mail-ed1-x535.google.com with SMTP id p1so30276183edy.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Mar 2021 13:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AIJvF8THgvNIIJY7o0rd8q2CMHcgDSy7Mtu5dW42sFA=;
 b=umQzLk1D4vOPawFEM+6Bx3PxwJApV0E7LygvKxasJpi52Qw3p2EYwicmAlbI0g+Vg3
 y58xizwMSWcaZPHR7g7knAAxcj/hIbCwrJsvi82O+QNAkQMvqftagYxKkVrPrkjmM3PI
 IY+GlG1Dqwhf5kK82lnIIy3iXbbi53PDB+y3jKGmbvlqcYyQcXMgUztJe4gJ1noJymx9
 NuA+6G8211wycYqP8xbhIAZqy4hdzzKPkKmkCoTfmxQy2UxBLPz274sSnfCbqcoPnkdR
 LOD03K8nILIjKsOiLplbth0D7h98pUMLeOM+DbJSzh7CfN2BWVkI/lZ6RJ8Zl+25e3c7
 zR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AIJvF8THgvNIIJY7o0rd8q2CMHcgDSy7Mtu5dW42sFA=;
 b=An0Xsozlo4zBwmLNI3SG1q4n83XhYeaWyTz09gFYYwM6d8xt/XOdBKekiN2kzLFTds
 WKbVk6v4YbkKGWDYUywaV48BN1sTDRmwSndn6HnmEU/DVh3qAl5D7dgzGGQjdPal0vDM
 NbmvtUcVPLyENMa+Q+9RZY1m/Bh8CCb2S3vXuBueKUlaKxiC+NIW9Yw8w3fMm7O8eyby
 fZIgONMiFNP252G4mPc49LztyhZQY4L72thY5LhFuEx9WnyBAN0oSK2pIAq5tuPCfl/T
 9eIYHjPJ7Q9TgQuuKlMDedRBtpk+uiKZtjavbLH02CMege6GxbDDdnlaDATpsf8ebhsT
 BJaA==
X-Gm-Message-State: AOAM531zkOTGV5S5gT7zrVLA6ocxd59k62cJdghoTKd6H5oK3YoZ/fUA
 azQVSMezPUZ+DGz65d97qoI=
X-Google-Smtp-Source: ABdhPJzU2FKDHG79f7UQcw8tVg/BBne3N8m2R28TmD5twNF6xyfuOyV9hbeGnPjwNgUSx0tUPGrJzQ==
X-Received: by 2002:a05:6402:46:: with SMTP id
 f6mr5398960edu.252.1615410496484; 
 Wed, 10 Mar 2021 13:08:16 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id f19sm252947edu.12.2021.03.10.13.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 13:08:16 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] mtd: core: add nvmem-cells compatible to parse mtd as
 nvmem cells
Date: Wed, 10 Mar 2021 22:08:01 +0100
Message-Id: <20210310210812.8880-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_210818_645838_079FA540 
X-CRM114-Status: GOOD (  12.64  )
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
