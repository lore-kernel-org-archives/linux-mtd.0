Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C03FC47089
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 08:50:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E822261222
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 08:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E822261222
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3OY+BztR1ewANCOEmqawAaeNVwtIvESyPSc2Hw90ktw=; b=MbL3j/kj6e5gPh
	ZmzhcU4nbFv331gyP+kwN4HTVoLIoPKo1zS/XOSu7kp/J9eESlszDx69C4Y97m1RIJshlcqwYMJKx
	bK2UDjKdXdyjiNBv3aN8XJVIosFc27lRc44N7wD5ilmaq1sY6vKhvgaGI+6KWJB1VMV5jIHUt6jX1
	iwR/vhe1CWsEaPwva0sefwM3NpF+aRZbZkbR0M4mWI5Ah9A81tip9/Hzdad1mynGJgs0/4r5/F0Ff
	DNyi6zWRfvsNel4cII4x3c2/U0cbRRoVwig/rQJPLKvSIs/J2wZ6JiZhJwpDaCFpa3KRSxGCcI1YN
	4YchRwTsX1FsmAo7i1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmBhf-0040hR-Lc; Thu, 27 May 2021 08:49:19 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmBhc-0040f3-Ly
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 08:49:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F3300FF804;
 Thu, 27 May 2021 08:49:13 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] mtd: rawnand: onfi: Fix endianness when reading NV-DDR values
Date: Thu, 27 May 2021 10:49:13 +0200
Message-Id: <20210527084913.208635-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_014916_885319_7DCF9409 
X-CRM114-Status: UNSURE (   8.83  )
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

Without the use of le16_to_cpu(), these accesses would have been wrong
on a big-endian machine.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 45606518f961 ("mtd: rawnand: Add onfi_fill_nvddr_interface_config() helper")
Fixes: 9310668fb60a ("mtd: rawnand: Retrieve NV-DDR timing modes from the ONFI parameter page")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_onfi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index 8e4677f2ba76..7586befce7f9 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -315,10 +315,10 @@ int nand_onfi_detect(struct nand_chip *chip)
 	onfi->tBERS = le16_to_cpu(p->t_bers);
 	onfi->tR = le16_to_cpu(p->t_r);
 	onfi->tCCS = le16_to_cpu(p->t_ccs);
-	onfi->fast_tCAD = p->nvddr_nvddr2_features & BIT(0);
+	onfi->fast_tCAD = le16_to_cpu(p->nvddr_nvddr2_features) & BIT(0);
 	onfi->sdr_timing_modes = le16_to_cpu(p->sdr_timing_modes);
-	if (p->features & ONFI_FEATURE_NV_DDR)
-		onfi->nvddr_timing_modes = p->nvddr_timing_modes;
+	if (le16_to_cpu(p->features) & ONFI_FEATURE_NV_DDR)
+		onfi->nvddr_timing_modes = le16_to_cpu(p->nvddr_timing_modes);
 	onfi->vendor_revision = le16_to_cpu(p->vendor_revision);
 	memcpy(onfi->vendor, p->vendor, sizeof(p->vendor));
 	chip->parameters.onfi = onfi;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
