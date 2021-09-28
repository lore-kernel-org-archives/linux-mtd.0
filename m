Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C62C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 22:16:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F90661131
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 22:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F90661131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZyOfHzhpRlo9SOC8Wt1nst5KpT7ja9ht6SfvFDZdH4=; b=nf1QYC8RWcFj3+
	EIQIGVUkGlevdpC3o+iPp8uqQxRIjvNZoQl/ol3xNhG3UZ9stieBicmBPy6YP6fHOLv88R0lUITXP
	osHYjdr0aacaQQJK1Gf1T/aDazXBgvQU6yDbtrCuYK5hTvddmCqCGQjSJki/nHaIAec7RSbNiTEV6
	EDojHJrb8LhMi7bMgEQoVZm0Cbix5NMHhRRhHOT9pMZr8nFVAGPIMYVs0gslxqweRt+OzOHTzyVKH
	nSZxmpoS1ylesn2WaWXlvGmmHldGBAe3Uk6yYOAJokznEmTcMpsJdd5u514NiH/xU87HWqmgKptIv
	eT3bHQghDiNT+xBKSYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVLOa-0090Iu-QM; Tue, 28 Sep 2021 22:16:16 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVLNb-008zwS-HC; Tue, 28 Sep 2021 22:15:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BD8EE1C0002;
 Tue, 28 Sep 2021 22:15:09 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org
Subject: [PATCH 1/8] mtd: rawnand: fsmc: Fix use of SM ORDER
Date: Wed, 29 Sep 2021 00:15:00 +0200
Message-Id: <20210928221507.199198-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210928221507.199198-1-miquel.raynal@bootlin.com>
References: <20210928221507.199198-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_151515_773290_F03BA218 
X-CRM114-Status: GOOD (  13.95  )
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

The introduction of the generic ECC engine API lead to a number of
changes in various drivers which broke some of them. Here is a typical
example: I expected the SM_ORDER option to be handled by the Hamming ECC
engine internals. Problem: the fsmc driver does not instantiate (yet) a
real ECC engine object so we had to use a 'bare' ECC helper instead of
the shiny rawnand functions. However, when not intializing this engine
properly and using the bare helpers, we do not get the SM ORDER feature
handled automatically. It looks like this was lost in the process so
let's ensure we use the right SM ORDER now.

Fixes: ad9ffdce4539 ("mtd: rawnand: fsmc: Fix external use of SW Hamming ECC helper")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index a3e66155ae40..658f0cbe7ce8 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -438,8 +438,10 @@ static int fsmc_correct_ecc1(struct nand_chip *chip,
 			     unsigned char *read_ecc,
 			     unsigned char *calc_ecc)
 {
+	bool sm_order = chip->ecc.options & NAND_ECC_SOFT_HAMMING_SM_ORDER;
+
 	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc,
-				      chip->ecc.size, false);
+				      chip->ecc.size, sm_order);
 }
 
 /* Count the number of 0's in buff upto a max of max_bits */
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
