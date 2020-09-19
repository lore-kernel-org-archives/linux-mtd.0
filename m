Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E111C43463
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 21:51:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4264422211
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 21:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kewb96vM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlCSprJF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4264422211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qhQn2p80SPGfziJtZ150ax+oCFKFbFbBDp0SOXqaSDE=; b=kewb96vM0sM3L7ne9yl1BzR5G
	DxjWI7Lpz3CzTJ8Lsph9ixZ/oWN/Lx/2WKzCrxzOxl8Ide0MoTq7ZQvWO7ybq59BHeeh+b0pxl6Ik
	S3YH7mleCCZAo9dlsjiw/KJ8kBVa9gxzUs7KSVv5vMuMHx9/HPoOwyyUDzSVJnksAExnRriJDXlMR
	5FMoLDS1FtCSBM8Xb3dce7Y90iiWzKgCV9OaGwO6Y9sqzOCPwcDfjnzu7DdayH5S0ZPRKQsh/OB6p
	zzZss+pKURGvVIuNPaq9lVsUw97rCjc10ZLd8JpPnL5nBySTAaYjrGRsNR8R7DtHynEHpP3jJlXjS
	qvHOH4gwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJkkH-000175-38; Sat, 19 Sep 2020 21:50:13 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJkkE-000167-BM
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 21:50:11 +0000
Received: by mail-qv1-xf41.google.com with SMTP id p15so5160983qvk.5
 for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2020 14:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hyRAlrt8J6BGlNyQOPrEJ5kGgAcwiPINvnfltt15A0M=;
 b=KlCSprJFAYfexEQg5FWirXfcWfQ7Dssd4Z5GWMsER+Erc+tZ4xAmd3Z++pS6A7Ogjo
 zG7k8aef9k1RxhUgu+PWGFEHevbbzGItxaJXRnasSqPxiE2LI7Ox3iRbxChBk3i7K0nK
 wyC111ojbfSdw3lIshtIpzFzU4lq2cqijwLtT/HuE8wVJJaWxYIu0rZFGVNtbyS4mlK2
 VRX5yidQC9OS/PuV7njjiX3TvO+n4bD3SN274PCIQS9Q4Us1yksgKqm9+tkmGg9hxfFQ
 tBBPMqpGRzUR4jK8Wpc+rpnOEpxhddr2Y0j+vUVTG6PjSbWFCVGSNJbV1CJ/2jfAAwIU
 W+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hyRAlrt8J6BGlNyQOPrEJ5kGgAcwiPINvnfltt15A0M=;
 b=DAIgvQcZeizvNGzbu5/MZG039DoDw4dGEfUKPyqF0os/Ql7M1QbkfVzL3AY8x+DF7z
 FYrOKAgbLkQeA67blOtAHAdJ3v65mbMCAj7z8UaTJiMjrN9HXSVoOu1Ri/s3KQwFUv8b
 gHBI4oXkKd6q9MXP0k/V5Z4n9pZG8XSAeVSSK9CUP91TNjBfnsv4+AZ6jNstmdURbEoP
 N2sujpD6THjY1eWblLh5Zi43qaMKpMCaQXGwJSn2khSKnasvMh5XHipbgxCjqs7z0ttG
 wGZgt0HSAhzVeUVTVh5kIuot1GfZaA+QaFcbjISTFixPdGNgNszgElosiuLtVxzhDylW
 oh2w==
X-Gm-Message-State: AOAM532MfDVLY4olm1Qz6jMa+1hk6Ax0iZtuIJdN/np+CamKfqahPr8z
 +CeDViIhHIaHb+yyw0FH/AM=
X-Google-Smtp-Source: ABdhPJzzXrVOQ6yFroXqTSfpgunJbma6nmp/ttKWAwgCKfrT4Ttp/rSZO7OEp7oKZvpP+UQUEcXFFQ==
X-Received: by 2002:a05:6214:7a1:: with SMTP id
 v1mr40316823qvz.19.1600552208970; 
 Sat, 19 Sep 2020 14:50:08 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it.
 [93.39.149.95])
 by smtp.googlemail.com with ESMTPSA id y30sm5617173qth.7.2020.09.19.14.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 14:50:08 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/4] mtd: Add nvmem support for mtd nvmem-providers
Date: Sat, 19 Sep 2020 23:49:35 +0200
Message-Id: <20200919214941.8038-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200919214941.8038-1-ansuelsmth@gmail.com>
References: <20200919214941.8038-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_175010_414247_A61B2805 
X-CRM114-Status: GOOD (  17.23  )
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
 drivers/mtd/mtdcore.c        | 2 +-
 drivers/mtd/parsers/ofpart.c | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 7d930569a7df..72502c990007 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -563,7 +563,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
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
