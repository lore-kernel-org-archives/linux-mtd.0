Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04018CCFA02
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOJVLeMMALcxSuxX7q4gh+hUfyUcvPsrEsHF1dfHjrI=; b=doBkn00MwI1bKC
	QwWsN/Z/U92NHFy7zWPFe2SKYK6kGk1JpUEBX1m9DefByM1WAdR892GZ53+R/s4RfWSRN7fXipcMK
	K9ZE3elQnRvq8XsXbjpLw+cC5SvRzGQaBdgoWnLx+QzgPFfsos85muWfEkTDinAss5XHoEHgVILTZ
	nIf+QQhPIvM9wbsfqR5laE3SLKeC5XYG3OSefvzssOfwJc32jZPbzY+6PDnYIcPUcHOFNLHafOTcC
	lDh+xJUpOPMUizso+ZZK2z9mK+TpaYJJIfkjl58X+dBc5KsmZYFhQkso+6JEze8nI9Uat9XG3r0my
	KUkjcF0hyXrXhA802L+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvM-00000006UHm-1lbS;
	Fri, 31 Oct 2025 17:28:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvC-00000006U6u-2PhO
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 351D41A17C3;
	Fri, 31 Oct 2025 17:28:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BEC560704;
	Fri, 31 Oct 2025 17:28:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BD8F1181800A;
	Fri, 31 Oct 2025 18:28:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q/W5OsQj0CIrKwA3ktIDzuIUiJU0LxRWvddRPMRjja0=;
	b=ax0z1SusDDh0MrZrcgp7sj0nbRFj0hAdv1pbn8SDe9RQAtVGGyU+wpaPFsihD0kt/edBdI
	RS2MsgDMgLyESKYt2qGjvCt7PHlxWC/4P9CixrJi5LbbLCVFQ/b4uZ3aBSd0Xe2DFU6eg0
	o4p5X3pGqKQnKCfUbfdF/gxTjSwHQuEVjPjjv6v1oA01OnFEDTZKOpPi8JeUBwnZSPvUYt
	/rd+fbNp5KMioDzOz+QGrUh1w3ZarjCHh2mwB81avnBwwZk+VnEtl8N08ogN1UumlEsRPU
	GP3LboSkzgGu5XXpaBk3UGL+i70Ah36WDB2DaSZQq+7qpWCXYzoEeTcCpUsf7Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:26:49 +0100
Subject: [PATCH 05/28] mtd: spinand: Add missing check
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-5-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102818_789254_F3DAD091 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

The update cache variant is mandatory, both read and write versions are
being checked, but not this one. All chip drivers seem to implement this
variant, so there should be no breakage.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
The core has been like that since the begining, I do not think this
patch should be backported, hence no Fixes tag. This barely
qualifies as a fix anyway.
---
 drivers/mtd/nand/spi/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index e748fa47ef7bffb7f443b37261d138b35eb4cc7a..9d4e82554dab07b676632155ae94a706cf1177df 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1431,6 +1431,9 @@ int spinand_match_and_init(struct spinand_device *spinand,
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.update_cache);
+		if (!op)
+			return -ENOTSUPP;
+
 		spinand->op_templates.update_cache = op;
 
 		return 0;

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
