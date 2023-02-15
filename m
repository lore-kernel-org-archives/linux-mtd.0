Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F91FC636D4
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Feb 2023 11:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CwyEDf4HtqpPmMzrsb545MCSqADqfacwlpoc5Wj29m0=; b=LkHvdnzjMlRhhL
	Oo/C5x60/FLIXX/w/UZ+Q2s31U/HOYvAgaredT2sboVZcWdPkAmdmem1/DSce52BNDNENfzOfAOmq
	HPVX5EnAI9DQG2WM0invmkqPslYNr8L1N9K/kFRgAncV3V7niEAS+4FStk8nxEuPULudN3BmLetJr
	UVO8P930ZjdwT3TqngjecaLt9iu7DfUO8RxrzcZSrpVtMD5+fiNw0g37EBOb91IpLiSs2zrqFVdu6
	qPEk8GYjnEtAOkWTg8vMAPoIt+6pg4ER/2ONedFFBlmrUKXd3XhRRRZECeOqyeYrU99E2AHxzBuQC
	fKOe11NtFpWorY1fh+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSFem-005YCZ-O8; Wed, 15 Feb 2023 11:09:00 +0000
Received: from smtp-20.smtpout.orange.fr ([80.12.242.20] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSFek-005YBM-4D
	for linux-mtd@lists.infradead.org; Wed, 15 Feb 2023 11:08:59 +0000
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id SFebpT64kwevESFebpYEea; Wed, 15 Feb 2023 12:08:54 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 15 Feb 2023 12:08:54 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: mxic-ecc: Fix mxic_ecc_data_xfer_wait_for_completion() when irq is used
Date: Wed, 15 Feb 2023 12:08:45 +0100
Message-Id: <beddbc374557e44ceec897e68c4a5d12764ddbb9.1676459308.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_030858_321208_E1DA9099 
X-CRM114-Status: UNSURE (   9.62  )
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

wait_for_completion_timeout() and readl_poll_timeout() don't handle their
return value the same way.

wait_for_completion_timeout() returns 0 on time out (and >0 in all other
cases)
readl_poll_timeout() returns 0 on success and -ETIMEDOUT upon a timeout.

In order for the error handling path to work in both cases, the logic
against wait_for_completion_timeout() needs to be inverted.

Fixes: 48e6633a9fa2 ("mtd: nand: mxic-ecc: Add Macronix external ECC engine support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This is really spurious.
If I'm right, this means that it never worked!

Can any one with the hardware test?
---
 drivers/mtd/nand/ecc-mxic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/ecc-mxic.c b/drivers/mtd/nand/ecc-mxic.c
index 8afdca731b87..6b487ffe2f2d 100644
--- a/drivers/mtd/nand/ecc-mxic.c
+++ b/drivers/mtd/nand/ecc-mxic.c
@@ -429,6 +429,7 @@ static int mxic_ecc_data_xfer_wait_for_completion(struct mxic_ecc_engine *mxic)
 		mxic_ecc_enable_int(mxic);
 		ret = wait_for_completion_timeout(&mxic->complete,
 						  msecs_to_jiffies(1000));
+		ret = ret ? 0 : -ETIMEDOUT;
 		mxic_ecc_disable_int(mxic);
 	} else {
 		ret = readl_poll_timeout(mxic->regs + INTRPT_STS, val,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
