Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347FCC55184
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 10:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jes6x7Is0bLGrOFjLclVB6IAPInrBY1bxQUIuD5Ngqw=; b=NpsONefU0lxEUA
	074vCbkG4WveUO2tjju0Za1AiIeSBA6lugspB9wavRfaCk9rGFh07/6KyLmoEJeXqIYL1WXFMxegm
	vKqyE5JZgQJGYepHh028wlrNJbEmdGBDiUxQxKHbITcXujGJ8wDt0BYwrxsEyStc+cKpbvr46zFif
	9qHSjd+PTaeTVq8g3vksR4KXlE9Y+ZYiDX7ZxHanKepm69PNkboZmiHx6qMbO/f53k5O5LoGGkiGp
	3P68KIB4tSvgMD0Z6MadaTqns+orznizPEVWRPF7lsc9gS0II/kCUW/freL+NGqbDtjwR8SzJP51z
	s3bOz6vs6a5y/HR82AGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCry-00000001bih-0EjB;
	Tue, 04 Aug 2026 10:59:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCrv-00000001bhO-1NWa
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 10:59:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 155FC1A13FD;
	Tue,  4 Aug 2026 10:59:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DFE4C6029E;
	Tue,  4 Aug 2026 10:59:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EFC711C32B2A;
	Tue,  4 Aug 2026 12:59:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785841168; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qSuEWKuajDgA6O+nOdFKo1B3NcssIXiZoT+1E3D55ww=;
	b=yVWHZwt0oNtVmE88RTuJyhfB8rPhubNTP7Q1xbVLYrEa5++JPsrn1BT7lqHMf0Nvpp1R+F
	9jyFo8XjABaaFb/nRo61ts8VM9rv7hEk9pSqT0SpxHXxyOotBisxTtsi7qU/LoUD7ywqIL
	BaLU+bohd86nGWFiR08rcsl0zartyeCpWa+oLWBbMeN8VeDB3Kv0WV2IO6H+ZWo1WkUC2A
	xH2ruDvcQCzmXLwuxbQwRyvlZf1xT5FhhMEhS8FV90j+KizmY2Do2bMHQP7ES/sHebwDqi
	2BIAADiFhK0/63LgGI15Z3taUcn65VsTkyDqNjpyCH/CCM4dbSijQc0qJeFBQg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 12:59:00 +0200
Subject: [PATCH v3 02/27] mtd: spi-nor: sfdp: Garbage collection during
 sfdp parsing
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-2-542ce107bc92@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_035935_513622_B3C3CFEA 
X-CRM114-Status: GOOD (  16.03  )
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

SFDP works as follows:
1- The header is read then parsed
2- If correct, the sfdp structure and the sfdp content table are
   allocated then filled
3- The mandatory BFPT table is parsed
4- The optional tables are then parsed as well

Any failure in steps 1-3 leads to an error and an early return. The
failure is not always fatal though, since the deprecated will fallback
to the non SFDP definition (in the ID table, for legacy chips). In this
case, the devm_ memory allocations for the SFDP table structure and
table will remain in memory for the lifetime of the device but will
never ever be accessed anymore (since they are incorrect). In this case,
we shall free the memory manually since the device is not going out of
scope anytime soon.

The assignation of nor->sfdp is also moved just after BFPT table
parsing, to avoid any dangling pointer upon partial failure. This is
particularly important since the presence of valid SFDP support is
checked using the following condition: `if (!nor->sfdp)`.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

This change is particularly useful for the next patches, I don't think
it is relevant to backport it.
---
 drivers/mtd/spi-nor/sfdp.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 6a571d8d822c..fd9f93da014d 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1490,7 +1490,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 					psize, param_headers);
 		if (err < 0) {
 			dev_dbg(dev, "failed to read SFDP parameter headers\n");
-			goto exit;
+			goto free_param_headers;
 		}
 	}
 
@@ -1518,7 +1518,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	sfdp = devm_kzalloc(dev, sizeof(*sfdp), GFP_KERNEL);
 	if (!sfdp) {
 		err = -ENOMEM;
-		goto exit;
+		goto free_param_headers;
 	}
 
 	/*
@@ -1532,20 +1532,15 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 				    sizeof(*sfdp->dwords), GFP_KERNEL);
 	if (!sfdp->dwords) {
 		err = -ENOMEM;
-		devm_kfree(dev, sfdp);
-		goto exit;
+		goto free_sfdp;
 	}
 
 	err = spi_nor_read_sfdp(nor, 0, sfdp_size, sfdp->dwords);
 	if (err < 0) {
 		dev_dbg(dev, "failed to read SFDP data\n");
-		devm_kfree(dev, sfdp->dwords);
-		devm_kfree(dev, sfdp);
-		goto exit;
+		goto free_dwords;
 	}
 
-	nor->sfdp = sfdp;
-
 	/*
 	 * Check other parameter headers to get the latest revision of
 	 * the basic flash parameter table.
@@ -1563,7 +1558,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 
 	err = spi_nor_parse_bfpt(nor, bfpt_header);
 	if (err)
-		goto exit;
+		goto free_dwords;
+
+	nor->sfdp = sfdp;
 
 	/* Parse optional parameter tables. */
 	for (i = 0; i < header.nph; i++) {
@@ -1608,7 +1605,16 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	}
 
 	err = spi_nor_post_sfdp_fixups(nor);
-exit:
+
+	kfree(param_headers);
+
+	return 0;
+
+free_dwords:
+	devm_kfree(dev, sfdp->dwords);
+free_sfdp:
+	devm_kfree(dev, sfdp);
+free_param_headers:
 	kfree(param_headers);
 	return err;
 }

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
