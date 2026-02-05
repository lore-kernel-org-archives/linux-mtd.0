Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F228ECD998
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 19:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/+cEzPr0k3OZjEhLdtD2oRdlrVv6JWb+MiREYNGCh4=; b=BElE6lXv13hy2R
	BAlzdpJLP1J+GAItPLGoitfCK052l75by+TP+6Gx20Y5f7Hs4da9Ec3fqV3wGyLYOrAbG3OAWK9PW
	uOD4XxswmEta3OO0ojmYZ8it4K+Sf4H6aQE9viFsSNoybGHHuBC48P/XBVs6Ze5JqIavXp7cIkV6Z
	lt1S3412VZvKp+jY+DevqK8jlyLXMhU9XJUVBy1gfwEkmuSjRquN/FsQxHMspbDDtFXz6YpUWXMSX
	XuJb7XM7O3z9l7nzcaP6zXMQaJBZZDDYay64ubWrFxb+XiXQG3Uxc1CyLWhcDvmAFuYelVCFFl0SY
	mnJwQCZawNPETnBYqN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4hG-0000000APSx-37Cu;
	Thu, 05 Feb 2026 19:07:22 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4hD-0000000APQ3-40wq
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 19:07:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9F210C243B7;
	Thu,  5 Feb 2026 19:07:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64BFF6074D;
	Thu,  5 Feb 2026 19:07:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2208119D178B;
	Thu,  5 Feb 2026 20:07:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770318437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dYYkOMmkvYm09ui+5e6ZadWbVo/SG1FMXVi2GURuVG8=;
	b=ciHAmq+nFySpzxqrOxnRMm491XzCE3ClAKpYW74F8w8q08takX5II9/7Nk/xgQyhIByA3b
	vD4f+Git2Nrq5ypf7ZFmDJF6i+48n8KG89drsVwtyu7bDdA5QBFreqZ1c8feMYvA8I4b8O
	ytC7XhvkgtsEEfK567U6lWksCetzINMiyyKcWt0VWM95EcK8kMQcPuIqFjlNKZUDnM/URq
	k0XyoK/ls801GlMSGAmMMmxdXhg1gyb4RGb68mp/bXkAOJ5FVLF2YcXzgRtmrpIQEgJkOP
	OyaeKqe3+3tF7N19oRwuU1B81REHxTU8un9CFOK3wdj9mIEZ38u/y7EUyowy7A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 05 Feb 2026 20:07:01 +0100
Subject: [PATCH DO NOT MERGE RFC 4/4] spi: cadence-qspi: Retrieve DQS
 capability using the core helper
MIME-Version: 1.0
Message-Id: <20260205-winbond-nand-next-phy-tuning-v1-4-5e7d3976f0f1@bootlin.com>
References: <20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com>
In-Reply-To: <20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_110720_142353_E4B3BB35 
X-CRM114-Status: GOOD (  12.48  )
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

This is just a suggestion for Santhosh on how to get the DQS capability
information without the DT property, to introduce in his Cadence QSPI
PHY tuning series:
https://lore.kernel.org/linux-spi/87v7gbdwdh.fsf@bootlin.com/T/#t

This patch shall not be applied as-is and is just given as an FYI.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 4f799f747346..0809846a6ef0 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -3476,6 +3476,12 @@ static int cqspi_mem_op_execute_tuning(struct spi_mem *mem,
 	if (!cqspi->ddata->execute_tuning)
 		return -EOPNOTSUPP;
 
+	/*
+	 * FIXME: maybe this boolean could be queried when needed by
+	 * saving a pointer to the spi memory somewhere?
+	 */
+	cqspi->f_pdata->has_dqs = spi_mem_has_dqs(mem);
+
 	return cqspi->ddata->execute_tuning(mem, read_op, write_op);
 }
 
@@ -3517,8 +3523,6 @@ static int cqspi_of_get_flash_pdata(struct platform_device *pdev,
 		f_pdata->non_phy_clk_rate =
 			f_pdata->cqspi->ddata->get_non_phy_clk_rate(f_pdata->cqspi);
 
-	f_pdata->has_dqs = of_property_read_bool(np, "spi-has-dqs");
-
 	return 0;
 }
 

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
