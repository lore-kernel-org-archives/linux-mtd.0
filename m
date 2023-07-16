Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73E4EB64DD
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jul 2023 14:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7i8jQGRtDil+x+TzQBran5v8KL7WZkvrmjivj0QYpcs=; b=nGl724WwpARFrN
	d+uSEqYLkAXdUoIgr2yuEPQ4GWZy63bLAqPuImCa8Bw6i/6mDFeOkeXiasyuQnqMyTv/bd14OINmO
	dJZ5/8jjsRWNBzHXabki5z165D54QuDjZ/CrHJoy9pmqnT9j0227sSOFIhJ5wUXqbm0knvGjpAi9C
	CohT1d3suKFAc7YBRIaTZemxbHoUyfx2GYbc6fga1LmuBdey5Qa0l02/Ewcy0ifisfzWdy60EL/Gw
	Q4tDWoU6wyPC8JaanHYq1m6kd0Di9QrfH46Xfglkl3OSfcmokZkVH+E0s3LaQirqjKznlE6rkJxLw
	64N/pP6b90c6GdGPyeRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL329-00BzUD-0z;
	Sun, 16 Jul 2023 14:47:38 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL30w-00BylI-1X;
	Sun, 16 Jul 2023 14:46:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C0FCC0009;
	Sun, 16 Jul 2023 14:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689518780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b/hbiZ3fIhxiVk35ywQ58uOAbaJDmsE20NBkG3LMzws=;
	b=U+qvfIEBTQFnWGwDC3R824psBVmA0A3eAu0k3TGEiYr78DQNK8hmWsRNQq/4oBLFefBuJm
	rHspvzW8myAP1SZ3CyKl2xA1tyypGEU4PlaajH2ziR5jGbHNgse1rAWtCbhlF5A218Op2H
	dmjgRakochLFh3eo+hrVNU3dzq6uud+eWxTV5Tu9IQrs4w7zWIJ07R7FPUCHpchi94zVtH
	0vfxvhesL6DY3lFt9mQkgy30Jld/KVMPaQjYOvLN61lbreNqoGIlZX1AfY3iQbkYI/3oCz
	QBgc+meM7/EGC3g6I3W7QTWatMOsr+8mlYFJw6u2NZUlL5zLLEAEF10BHXM32w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 6/8] mtd: rawnand: qcom: Fix a typo
Date: Sun, 16 Jul 2023 16:46:10 +0200
Message-Id: <20230716144612.32132-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-1-miquel.raynal@bootlin.com>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_074622_670058_B5CC07D6 
X-CRM114-Status: GOOD (  10.41  )
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

Fix the following checkpatch warning:
	CHECK: 'tranasction' may be misspelled - perhaps 'transaction'?

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 3adc40ef5cf6..cb6ccaa19224 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3144,7 +3144,7 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 		/*
 		 * Initially allocate BAM transaction to read ONFI param page.
 		 * After detecting all the devices, this BAM transaction will
-		 * be freed and the next BAM tranasction will be allocated with
+		 * be freed and the next BAM transaction will be allocated with
 		 * maximum codeword size
 		 */
 		nandc->max_cwperpage = 1;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
