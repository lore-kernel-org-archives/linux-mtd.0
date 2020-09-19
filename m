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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6EAC43464
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 22:31:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42EC72085B
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 22:31:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w7MK/KUV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cb+cKG1I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42EC72085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j6hQYJ00Hs23RBJeXbKhoOXiahTDNCCngmDTwUd38Aw=; b=w7MK/KUVqMEGy/1jR2YY94Bhh
	uOj5GfupIgoowiUYa9zswLa9LAB6r4zfCKgvEHEg7DxB/E3Kok4bZP2LjpcfvaQN2rjkB/JwGkQEI
	YzmhLUCWkBNCCUJT/oLWDGLH4sgmqCyCN/5AwyIH8kkqDAYDC6jm/mAxlkU7wfPVRKzhWwciHQFpF
	UOK+tauTpfmP2O9SZOUUGdThQgYo+V0Elnav6sNnREBw7Gfc9BMG9UAx1oyALcNdxoXmmJWpjFpZF
	GjeeHoTT6LLLMYQhvdeBGHZ7oPWxKIaOoi8+1nmoFeokGTtG/1Rdjb9UF0A78GPuFF8Bzst5VmX4p
	x6YGvpD/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJlNd-0004Uu-Pw; Sat, 19 Sep 2020 22:30:53 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJlNb-0004Tn-DZ
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 22:30:52 +0000
Received: by mail-qv1-xf44.google.com with SMTP id f11so5219198qvw.3
 for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2020 15:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Cp6wGeZB6SS98LJtexBivyXrwvaD2ffDaajHaSACWY=;
 b=cb+cKG1I8bwsm48NEpp4t1JXK45eRJlANrsLdFS6bpoo0AsOub4t4AuMMf+XVSNwxZ
 tyZCcj0lUMNSqqQRpWy4jII5t40ALeYPmirmrzPed4rpGGRLkNMMaJeaGLAIWoXV8oFX
 6nHR3drHjrv5V5XfEhnp5FkZjeRAEFG518Vn611y4+qznw3D879rCK0/XUQoiwT59OmU
 +RNWB/g+Uf3c2SY6SX0jACnJo8UP0Mn0b5ZLa0Rfz0En7iz4xRPXKy9clD+5U+J0e4lL
 H7CjOXXAyq1djZHDcf1z883o4iLm23jg+4ISG6+6T7B+nO++gmGIZEKo77vxmwoH+RPH
 q3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Cp6wGeZB6SS98LJtexBivyXrwvaD2ffDaajHaSACWY=;
 b=XpzTbKGx2o+SSG1d3JKln1tkQQWK5tN/5+PzHLVGAgbZOu3C3T6k//EEfAjdqwYK72
 cMGacBBes+ieKiNq3ui8xfInEm5uv2iLjtiwDrhJCU4aDXTwIQpJQh56/1CBV4wMmtbL
 gkImv+cB7B6U/E4hNEp90GHwnmgSc/4YueJoc/5cvpCW1DAL+rV5XGjf7TMvsU+xoaSH
 E/5nMd5+6+3jiGJlJwW5Vld2Ng7YiCS5yRAtmZ3fdfhJWp3kFNxf8aedUOsbRLY3rNXe
 mmWR9ZnW/ho3oeaguKYu/UiGsZhmKSPdvH//yJ2//KUlHdB7/X4F1xgMvJIecje4KDSy
 4RJQ==
X-Gm-Message-State: AOAM531A1gztwM3XHNKBJh3qfJpSl/ct1K/34GeNlD3WP+IOxEIjD3+k
 hixxmjbd8TEUxz9nZtLn4NI=
X-Google-Smtp-Source: ABdhPJycBYegZeDbUTMjcO7/HmBDoNX4rCni/FQqn9RIFmTJbrpMXtH1bw4JeAWdpgXYt0a5FTLRGQ==
X-Received: by 2002:a05:6214:929:: with SMTP id
 dk9mr23719833qvb.60.1600554649519; 
 Sat, 19 Sep 2020 15:30:49 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it.
 [93.39.149.95])
 by smtp.googlemail.com with ESMTPSA id f24sm2581139qkk.136.2020.09.19.15.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 15:30:48 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 1/4] mtd: Add nvmem support for mtd nvmem-providers
Date: Sun, 20 Sep 2020 00:30:20 +0200
Message-Id: <20200919223026.20803-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200919223026.20803-1-ansuelsmth@gmail.com>
References: <20200919223026.20803-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_183051_478472_B08F8482 
X-CRM114-Status: GOOD (  18.22  )
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
