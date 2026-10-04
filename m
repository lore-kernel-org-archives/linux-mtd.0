Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEC2CA5FF0
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 21:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVthADAOi/Ks56LhhQ/gkJJxHQJ8x+whHyYvR54XSYo=; b=d0HVJZgU9QLJOF
	WHGYaXtRVGSfBID+Ltb1pk6yATmu8/ujiDHnJ7KLvC5uNrq1/7VKJHuc7MPbm5eArT28YzmxCou7G
	5JDwmzTlmSGbBxkuq0fVWJoJEQhS9xyA2W6GTP+/XZA9q9ws7yZh/8vSCBaGmIcx1XG31flVmB9EE
	wG+oKjHJZvjZ/YGSsfzqfSvOIPtD+F5ItDZzqWQWdFDvqSqm8wbmNFC3OiBD5HY0oAoB+OFDrLGMK
	Nw2Jr+F5+h3i4uowWyfnAQvVoAFXGJZTP6WMSS63/MDmQd2jJWGP58qWB6nuP8pay7mNrzTHy7ZgH
	CnrwpmnXznKWpI0hBViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDToB-0000000FMfz-07IU;
	Sun, 04 Oct 2026 21:31:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTo8-0000000FMcZ-10lP
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 21:31:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A21B04E41169;
	Sun,  4 Oct 2026 21:31:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7680B604FE;
	Sun,  4 Oct 2026 21:31:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6E7710328444;
	Sun,  4 Oct 2026 23:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149501; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lKU3bfFA3TBWByBniXLhckIqiCwee1j7ncswMHgAQeQ=;
	b=fCDgzRr9gStZPWsPjk/3pJYhBwQg5FDIirJYQs4cn+EedsyYpuKTazvcM7TxCeOkr9SjVG
	y9nWfpE5ScCiKugjzjnYH/xpJWENsRpOPKM6pq0PbBzdeWmEBxW+z1jXa4UfkTrlg7m/ng
	4aYHQ0sdt6hrm1DJy4EePolqyE7b1DU9KNTJqiHJ4lD7oNktEuCuTGCOmTmyLldTJhSAYP
	FZeBrPVfTb9LVwfMOwubbY29sBcWVANzUNd1nOlzpVo6MXjE46G2+6kjoRtzkbKrdKgKpZ
	4IYvCldHdwgE6QId7pxYkgGt6WLeLVP3HvTBibbQn76jgqV0bp/R9Mu488fqcQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:19 +0200
Subject: [PATCH v2 05/17] mtd: spi-nor: sfdp: Enhance a comment
MIME-Version: 1.0
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-5-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_143144_421238_EA062A2D 
X-CRM114-Status: GOOD (  10.16  )
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

While working in spi_nor_parse_sccr_mc(), the actual meaning of the
comment was not obvious to me. Not sure my proposal greatly improves it,
but at a first glane it feels clearer to me.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c21a6953db96..9d5c0bbb53ae 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1417,8 +1417,8 @@ static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
 	le32_to_cpu_array(dwords, sccr_mc_header->length);
 
 	/*
-	 * Pair of DOWRDs (volatile and non-volatile register offsets) per
-	 * additional die. Hence, length = 2 * (number of additional dice).
+	 * There is a pair of DWORDs (volatile and non-volatile register offsets)
+	 * per additional die. Hence, length = 2 * (number of additional dice).
 	 */
 	n_dice = 1 + sccr_mc_header->length / 2;
 

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
