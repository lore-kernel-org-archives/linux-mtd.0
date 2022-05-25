Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B43DC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 25 May 2022 16:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSwY/UHl9auhVEpEcW7V2gAJpr8LNuSvTfzacpWRIKk=; b=tfiuxSgeP8sVLU
	ZrCjzoOlpoFwHeVy5nlAybxv/ptjq90iziuXm9OI771XfdA1cDMTyFKyS7TE2HTysDpiRhxEBIq6q
	AeKOKQQPv3/U4C/8ag1aqDCll8F8JkNm1uMBxV+Al3/S1lsBXDR6v5hNlCAmsowBMdGBEHHFr5IJ8
	dob+QoExIbMjiA6L1EeU3kJ/8BxSpjwL4J7NeUInZmZ2fSgia0yJsM+fabA2mui9RCGGT6fGsjINq
	DzHZbZwrFp+YAhuFVQCmBYH15EiQNRvKOegd/o0HEOGVpkt2mF0lZXQ2IJyIMgJLLh/K6u0HKrb3H
	GNVrYOEjICNhR4/Se25A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttuu-00Bpid-U7; Wed, 25 May 2022 16:31:24 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttup-00BpeP-1J
	for linux-mtd@lists.infradead.org; Wed, 25 May 2022 16:31:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AF4CBE000C;
	Wed, 25 May 2022 16:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653496275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3745K4xMEFN1pp29/pSkhqcfiPo/OnmvRSg6Nh+FHo=;
	b=WFupb/5VppPs7VvsgpO8o3/Eva3xQrGvmIb1XcqpCDEq9YSQYnIDL+mpbKbJPZNFr3A3x+
	oY0z0hHv9jCNFv9NCAkbAjhJYQmF7LIWcjdS1Q02VUlv7OzawIbqOhlqHDMilVt2xl0fUh
	fdjsJ/EyVcmCw5VT/esV5iuPHeVU6AZhw7BXUiNHJQy66h5YYaJyLSref1a/VWOgBMpDis
	tzTbBzHX5NY0RKc3uQhJhtsztFPvSyhvgP58nGqkMPrPfC0h6FJviQAd1Io3fG1vRerDT+
	skZyYRkerJUekLhqAgy97G80xPeXahZD2kkQmT1bALImOuWwIXlvmMXdHTSQxw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 4/8] mtd: spi-nor: Reorder the preparation vs locking steps
Date: Wed, 25 May 2022 18:31:04 +0200
Message-Id: <20220525163108.266705-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220525163108.266705-1-miquel.raynal@bootlin.com>
References: <20220525163108.266705-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_093119_321754_6D199AFB 
X-CRM114-Status: GOOD (  11.72  )
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

The ->prepare()/->unprepare() hooks are now legacy, and there are only
two controllers left supporting them. In both cases, the implementation
acquires a mutex, which is somehow redundant with the spi-nor main lock
that we acquire as well in the spi_nor_[un]lock_and_[un]prep() helpers.

While the mutex taken in the core is necessary, the helper can be
reorganized to first do the preparation, then acquire the core
lock. This is necessary in order to be able to improve the locking
mechanism in the core and should have no side effect.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a9698d6b9813..cea023f2d169 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1069,23 +1069,20 @@ int spi_nor_lock_and_prep(struct spi_nor *nor)
 {
 	int ret = 0;
 
-	mutex_lock(&nor->lock);
-
-	if (nor->controller_ops &&  nor->controller_ops->prepare) {
+	if (nor->controller_ops && nor->controller_ops->prepare)
 		ret = nor->controller_ops->prepare(nor);
-		if (ret) {
-			mutex_unlock(&nor->lock);
-			return ret;
-		}
-	}
+
+	mutex_lock(&nor->lock);
+
 	return ret;
 }
 
 void spi_nor_unlock_and_unprep(struct spi_nor *nor)
 {
+	mutex_unlock(&nor->lock);
+
 	if (nor->controller_ops && nor->controller_ops->unprepare)
 		nor->controller_ops->unprepare(nor);
-	mutex_unlock(&nor->lock);
 }
 
 static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
