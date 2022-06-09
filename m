Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D985CC43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egDLCSu/IVUT0EZxl2IsHbtYUq2LNFtjKRIgyhM/W84=; b=y1c24dSQrklICP
	FycyqCDg+zYV01mFEoBz+y//J/R7Eo33Qa/S9rm5wThUMzaxcMwFUA9I6yfm+n59mE3C8f4ovrrfd
	KTMiJqKNABZCcsNeR5TTMArrL5j9IUJS2rQAc8ckHL5TrdNYrSCIqfEqms2q8kvk7E4qZyVnKdj+T
	wGKem7IX/nOalKjlSqzGQcv81xodm5uXmFLYcZrWNTLBiyogCuG/skbIYIR+nkw9g1GFmd8W3yNdb
	BFmLJw3MF/WQ1dMsDUvCEj61jtX+r+StD1TdrsDTmhVtRgeTe/kXcPuCSv1TRla0Rtn1e3+JIlgjk
	d60qqRHfjKPMBO8kjFUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE64-000WQK-94; Thu, 09 Jun 2022 09:04:56 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE1E-000Tty-8d
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 08:59:57 +0000
Received: by mail-pj1-x102a.google.com with SMTP id gd1so20831863pjb.2
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 01:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gYLHr6+TN1A0tfdfT+dQNKqcwcYrhGapge4rfB6ec5Q=;
        b=M/QPOItz6MUhaoP4OvpiK8XUtghxe6lKt4Vil7rZnrK0nFQ3Hnj/VjsbJIahJ8mG/z
         FydMuebHeoCbBFBJ97aK2cjv3Ve9lIcyN+etq5KIksxQL4vpHadqxmoZ9A18KSzGMZ/x
         za64ENJQObcJEex06kyvTNOYvBNMLIMiq1DRzcU5A3EyLlXRGRme7vuyUFvXyHjJptTE
         cy2YurUOe5uT/T/wdk9Wmol0of/4dk+AuYF95yzRDUCANtdQwS0JwBo+vdaJ8MrO4UNV
         Si+RkrRGTua1USd411DQLYI8evBg2R448nmoxcru4qObejMY6eSKHA9CEynsoi2ux4wK
         I61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gYLHr6+TN1A0tfdfT+dQNKqcwcYrhGapge4rfB6ec5Q=;
        b=01JOkLmCFsZU/cQQYw9GEcjYXzgNOkCt2SFcL/GWwLigauWL51sPn+YS6+vqwkz/Gb
         ELOL0bWz3yPNzhFMSR3J26VbEXcrtIftm9JjjJwNQhoBts1vsP/qOHHTsnD5Kz1bk1Gx
         m8jHtxRHHiMGpvocfYo2kTVhgtUDHMK7r/gHGSwXrM1eUjxebvevoSMJgs8Ovlrfo8mf
         saATxxNtDNefXxZ8dAvqp5wn9V8wD5El726dlsr6qizOs4J31Dm0aaWi++d3d2eVILpU
         UzW7vy6wf1DXiRjXDPOzpSQCIuIb1VezEjJPgzQTvyohqDhGu8CjS+L6BwOuVEEMiBZ4
         6wGA==
X-Gm-Message-State: AOAM531jpFk4/t5Pj9f0IdnxFHrR0GRr4cylDpgRXZmc6hxU/zWoQ6JE
	GhLaDrna7Q12HYQcu/joWWTOWqGLvVA=
X-Google-Smtp-Source: ABdhPJxZcmd3qdnUr31JZzlJEeP4n1rZIVBoTQMpfgc64WcgADZV53rOZnlZAeRcbgyEyRwGhCUEYQ==
X-Received: by 2002:a17:902:e84b:b0:164:8ba3:9cd9 with SMTP id t11-20020a170902e84b00b001648ba39cd9mr38592494plg.49.1654765194927;
        Thu, 09 Jun 2022 01:59:54 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
        by smtp.gmail.com with ESMTPSA id ja13-20020a170902efcd00b00168adae4eb2sm575997plb.262.2022.06.09.01.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 01:59:54 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	p.yadav@ti.com,
	michael@walle.cc,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v16 6/8] mtd: spi-nor: Do not change nor->params->addr_nbytes at 4BAIT parsing time
Date: Thu,  9 Jun 2022 17:57:43 +0900
Message-Id: <1c2ff0818168e374ba00ed74ca8568f27cd6299e.1654741889.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
References: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_015956_379110_9B5651D2 
X-CRM114-Status: GOOD (  12.60  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

At the 4BAIT parsing time, we need to keep nor->params->addr_nbytes value
as it may be used as current address mode in SMPT parse and device specific
hooks.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
Changes in v16:
  - Update commit message and description

 drivers/mtd/spi-nor/core.c | 2 ++
 drivers/mtd/spi-nor/sfdp.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 883df4c47e4e..c6c7d1fd19bc 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2643,6 +2643,8 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
 static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
 {
 	if (nor->params->addr_nbytes) {
+		if (nor->flags & SNOR_F_HAS_4BAIT)
+			nor->params->addr_nbytes = 4;
 		nor->addr_nbytes = nor->params->addr_nbytes;
 	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
 		/*
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 3a48173a2d78..f72947a97981 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1098,7 +1098,6 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 	 * Spansion memory. However this quirk is no longer needed with new
 	 * SFDP compliant memories.
 	 */
-	params->addr_nbytes = 4;
 	nor->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
 
 	/* fall through */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
