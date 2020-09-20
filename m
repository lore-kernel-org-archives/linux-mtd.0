Return-Path: <SRS0=3Hr+=C5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11D1C43466
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 09:58:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C59E20866
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 09:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ht4A7H4U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExV2J0dk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C59E20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j6hQYJ00Hs23RBJeXbKhoOXiahTDNCCngmDTwUd38Aw=; b=Ht4A7H4UbwombDZvJhRLuHFot
	iwbDfpvI/1WF5PDfmaQKV+ihEjHS49jINxfpy+6QSU3WkydLDBqNgBxDfN9uij0AwX8tUs+cBvwGL
	tnnKJCBYOiCp8N0e0uMgsSULGLRBb0/aXirAVP1w8jxkDmZDuf0meyzBQL7A3I5CARTa/81uixDVr
	6O/kbJCWaqi7dwvOfoc/Sj+2Iuk4sBlx2KLweakQz2lP05bGHUFz3Q1f8Kce9WFcVrroLm2gtCqTs
	TRXFiiuR3346/3ky44fWQGyc6PKqJwc6ZFZ1ivum4v1IIYQJlhCTGF6I7RVWzTteIronu1qFz1Rf5
	0MW8yqWJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJw6M-0006o4-9n; Sun, 20 Sep 2020 09:57:46 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJw6K-0006n6-3N
 for linux-mtd@lists.infradead.org; Sun, 20 Sep 2020 09:57:45 +0000
Received: by mail-qv1-xf44.google.com with SMTP id b13so5759220qvl.2
 for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2020 02:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Cp6wGeZB6SS98LJtexBivyXrwvaD2ffDaajHaSACWY=;
 b=ExV2J0dku2JMmlAU9XWVQ6EA1ZpDFcBWqnSgZ52HkNzqXKPznuXV2TscrMYYZshBMA
 KScQZHTuODTN5KaT0FSwOi7O2X3RUWwcXQI+WDJ6bS9rvIyl/ZchqRy5d71W/JPiHwcb
 1Fl1FTnD2W2BHC3sDNv16IeD96xIkM7YPS9RcOhTcWGi1pKFbd27vQX+ec9nyt11mEx+
 drL7pH1LR/HnPBLImJ3r7TQOlyMoDYnfMqyx2Z/YQWlE7iPMRuUIam/1SXMBJm5Me8is
 2tu2UXCrDOBaXBazoAa1+ZuUUmvSFSYNqMjJCI9ctYdCYdvKn5M1l6rIVBJBA9IEHHLM
 Mb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Cp6wGeZB6SS98LJtexBivyXrwvaD2ffDaajHaSACWY=;
 b=M2CoTzcVWmCu1L2P3jQdo1r4uZ585GVGoojOB8oZPYQRYbPISLUIJkRaTnyEJJA4s3
 m8YEjpvSWdUccnTtwUxBJ7QsQEK6njHi9etdDWKIz6i39iVWAZcVBkR/4IZ0xA6lPlEB
 MmvGTfzxUXWUdGBRIUglXCR30P9gSQz1aZ9u+vYhUYuL0kyVqdHsUn91ad8A0lczCn+j
 MFvKl6IUVioArElxCriZRLpbVyQ01cTcoKwSo0RbmUroJINuvIlYfnXEE9Gq8ciwbLfy
 22ekapovMpm+xsFe4v4daRDL5SW0SR36qewnN+9Np8tbz0Afu9uzGA8hVlmJImFPxPov
 KFYg==
X-Gm-Message-State: AOAM532hNaSOVDczXdq9SIVuosXdX5cZiAlOOseR6RX8I+8SX8hnMxF7
 kzHSr++yglqyqNEehAYOEHo=
X-Google-Smtp-Source: ABdhPJwEhDyAwUV5UVHjMYtJZMqZWnXncn13LWvoJ+ZoTbYCWu2zx0tKeSvcu7jECySfUWPeBSJS+g==
X-Received: by 2002:a05:6214:1021:: with SMTP id
 k1mr24205091qvr.62.1600595862353; 
 Sun, 20 Sep 2020 02:57:42 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it.
 [93.39.149.95])
 by smtp.googlemail.com with ESMTPSA id w6sm6968323qti.63.2020.09.20.02.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 02:57:40 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 1/4] mtd: Add nvmem support for mtd nvmem-providers
Date: Sun, 20 Sep 2020 11:57:19 +0200
Message-Id: <20200920095724.8251-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200920095724.8251-1-ansuelsmth@gmail.com>
References: <20200920095724.8251-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_055744_206268_C486B3BC 
X-CRM114-Status: GOOD (  17.76  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Ansuel Smith <ansuelsmth@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Introduce 2 new bindings for the mtd structure.
Mtd partitions can be set as 'nvmem-provider' and any subpartition defined
with the tag 'nvmem-cell' are skipped by the 'fixed-partitions' parser
and registred as a nvmem cell by the nvmem api.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/mtdcore.c        | 3 ++-
 drivers/mtd/parsers/ofpart.c | 8 ++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 7d930569a7df..ba5236db8318 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -551,6 +551,7 @@ static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
 
 static int mtd_nvmem_add(struct mtd_info *mtd)
 {
+	struct device_node *mtd_node = mtd_get_of_node(mtd);
 	struct nvmem_config config = {};
 
 	config.id = -1;
@@ -563,7 +564,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	config.stride = 1;
 	config.read_only = true;
 	config.root_only = true;
-	config.no_of_node = true;
+	config.no_of_node = !of_property_read_bool(mtd_node, "nvmem-provider");
 	config.priv = mtd;
 
 	mtd->nvmem = nvmem_register(&config);
diff --git a/drivers/mtd/parsers/ofpart.c b/drivers/mtd/parsers/ofpart.c
index daf507c123e6..442e039214bc 100644
--- a/drivers/mtd/parsers/ofpart.c
+++ b/drivers/mtd/parsers/ofpart.c
@@ -61,6 +61,10 @@ static int parse_fixed_partitions(struct mtd_info *master,
 		if (!dedicated && node_has_compatible(pp))
 			continue;
 
+		/* skip adding if a nvmem-cell is detected */
+		if (of_property_read_bool(pp, "nvmem-cell"))
+			continue;
+
 		nr_parts++;
 	}
 
@@ -80,6 +84,10 @@ static int parse_fixed_partitions(struct mtd_info *master,
 		if (!dedicated && node_has_compatible(pp))
 			continue;
 
+		/* skip adding if a nvmem-cell is detected */
+		if (of_property_read_bool(pp, "nvmem-cell"))
+			continue;
+
 		reg = of_get_property(pp, "reg", &len);
 		if (!reg) {
 			if (dedicated) {
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
