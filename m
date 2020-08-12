Return-Path: <SRS0=lgj1=BW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694B9C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2020 15:30:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3610A20885
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2020 15:30:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XVec0Gr7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yadro.com header.i=@yadro.com header.b="rfqINGjT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3610A20885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yadro.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CB65gj5BsfCxOJSJa5mH1CmMWddfjgpkkQvKjVwiBuM=; b=XVec0Gr75wNNRvPS0uq3/KaW6
	mZ/Ba36iMpdUOswkttTsjUkOWwqC5/Z/XqwaIbSFJoFy6LLDuqZk3g6FeRgcHz63PdYLXAcDSm3UU
	ZlZNOjHIVhXJk841tXUbwi7pyniHyYivcvT5Z/anizwwFOdMR+P3guFc/hTnqMlUvqdhbrUtw4wh2
	rYMfmXj31GRJWuojwflhGN6KaWa27tKV+NUc0r092t4yCuaG8zuhZ4Hj5EfyPwVU3T5O3b0rqF/UH
	gKcRtcR5P1Dr//WEElxkyaJNA2c1g0jXRfYClfFggC276Cg63QCa5aYV+ZSvVBPAyC3iji86gUvww
	tWapahITA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5sh6-0001Mv-4N; Wed, 12 Aug 2020 15:29:36 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5sh0-0001Kg-1j
 for linux-mtd@lists.infradead.org; Wed, 12 Aug 2020 15:29:31 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D351F4C89B;
 Wed, 12 Aug 2020 15:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1597245330; x=1599059731; bh=ii5ADmQuzyNneIFBkHAT3wYiVuvXA+hEUPb
 eRSzRgzU=; b=rfqINGjT9icIxLFgFxT8cX/Thy5VZHXf5nEh4LesToTEK16IV0c
 0iBufZefntN4zeYmVgyQdKflEi6szQYsY+r0b/TQcIMF1qcgjKnQepM9zFaJ7AQB
 pVHKZ6fIvW6S7Wksr/zIqqGGoj7zzem6L4ZdBLl9PyECCUBjwX6MLZW4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TuBAypmAdOG7; Wed, 12 Aug 2020 18:15:30 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4FAC64C8AA;
 Wed, 12 Aug 2020 18:15:30 +0300 (MSK)
Received: from localhost.dev.yadro.com (10.199.2.34) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 12 Aug 2020 18:15:29 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: 
Subject: [PATCH 1/2] mtd: spi-nor: do not touch TB bit without SPI_NOR_HAS_TB
Date: Wed, 12 Aug 2020 18:18:17 +0300
Message-ID: <20200812151818.16699-2-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200812151818.16699-1-i.mikhaylov@yadro.com>
References: <20200812151818.16699-1-i.mikhaylov@yadro.com>
MIME-Version: 1.0
X-Originating-IP: [10.199.2.34]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_112930_424154_C4AC6720 
X-CRM114-Status: GOOD (  12.64  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Ivan Mikhaylov <i.mikhaylov@yadro.com>
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
