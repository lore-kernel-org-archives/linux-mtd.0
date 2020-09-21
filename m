Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DB3C43465
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 11:21:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAAE0207BC
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 11:21:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YLOUjufg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yadro.com header.i=@yadro.com header.b="CdBg3tvd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAAE0207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yadro.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CB65gj5BsfCxOJSJa5mH1CmMWddfjgpkkQvKjVwiBuM=; b=YLOUjufgnIVO9TZlGNoktdhdW
	A2bQ0A3y/RNKmCu20ujt/RQoteAs3dEhpSu+H3PVLFsI6ZOGvRxd3aG6ZPpSUIXBwIjs+8vJfmAku
	PDmJS+/qalg4s5l8FdeDk8BM0UHt5It2tFFI8l9rD1oYrVrakT+V9VCubKjuqohieG6jgt3F3wp1y
	DDJO4Xe+ok6GXQf9AdhfSJh0cNzOS2j3Ve23ehPdlnCjLhPm1bewazVxU3LVqBtzE6M3ibMrrC3FL
	9B7tvcmxwSZG9rtgHPg3izminNdduCcA0yyYmgLylKFyaE/Po8zFu6+gmpFyVfxHSByY2y9IqB5i4
	Y73HmPFaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKJst-0002U9-Mc; Mon, 21 Sep 2020 11:21:27 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKJsq-0002SY-Eq
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 11:21:25 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DE4835750D;
 Mon, 21 Sep 2020 11:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1600687279; x=1602501680; bh=ii5ADmQuzyNneIFBkHAT3wYiVuvXA+hEUPb
 eRSzRgzU=; b=CdBg3tvdO4voY73ye3al1Mhr78debWUR32a8iZyjEB6Gj43LgAT
 lLQz78ZYukgD6obFMIznG15Ovat0SCx7288QpMVGfRpt07rN9njNdIqW4Xj+Xpj6
 TtYRdf8uMD3Ja1bt0etSMBrWDxQPv4Ya2UXltOq+BIH5ZXuMyOuo5rM4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w6O96-ruWZsm; Mon, 21 Sep 2020 14:21:19 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1C5BB535F4;
 Mon, 21 Sep 2020 14:21:18 +0300 (MSK)
Received: from localhost.dev.yadro.com (10.199.3.38) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Mon, 21 Sep 2020 14:21:18 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: [RESEND PATCH 1/2] mtd: spi-nor: do not touch TB bit without
 SPI_NOR_HAS_TB
Date: Mon, 21 Sep 2020 14:24:49 +0300
Message-ID: <20200921112450.4824-2-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200921112450.4824-1-i.mikhaylov@yadro.com>
References: <20200921112450.4824-1-i.mikhaylov@yadro.com>
MIME-Version: 1.0
X-Originating-IP: [10.199.3.38]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_072124_812985_E268F93A 
X-CRM114-Status: GOOD (  13.20  )
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
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some chips like macronix don't have TB(Top/Bottom protection)
bit in the status register. Do not write tb_mask inside status
register, unless SPI_NOR_HAS_TB is present for the chip.

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 drivers/mtd/spi-nor/core.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0369d98b2d12..f9853dd566dc 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1735,13 +1735,18 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask & ~tb_mask) | val;
+	if (nor->flags & SNOR_F_HAS_SR_TB)
+		status_new = (status_old & ~mask & ~tb_mask) | val;
+	else
+		status_new = (status_old & ~mask) | val;
 
 	/* Disallow further writes if WP pin is asserted */
 	status_new |= SR_SRWD;
 
-	if (!use_top)
-		status_new |= tb_mask;
+	if (!use_top) {
+		if (nor->flags & SNOR_F_HAS_SR_TB)
+			status_new |= tb_mask;
+	}
 
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
@@ -1817,14 +1822,19 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask & ~tb_mask) | val;
+	if (nor->flags & SNOR_F_HAS_SR_TB)
+		status_new = (status_old & ~mask & ~tb_mask) | val;
+	else
+		status_new = (status_old & ~mask) | val;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
 		status_new &= ~SR_SRWD;
 
-	if (!use_top)
-		status_new |= tb_mask;
+	if (!use_top) {
+		if (nor->flags & SNOR_F_HAS_SR_TB)
+			status_new |= tb_mask;
+	}
 
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
-- 
2.21.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
