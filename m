Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B1FC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:23:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EACDA6124B
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EACDA6124B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tb10LK+PvfT/TiPFuKG9e6MbqRdgQPUFMqPY8EAjUY0=; b=UTqmIh5Rf/gsPKw1f/NMX+VzD
	JUuxDTet+t/xxYkIRDhJ2kB8CwTPqennA24bi2Xl9dOeJh0ADH3yDPhYF8x1Rxy46AsMFlZ5isZFZ
	GIKeNpLtKXqUfBSeWiiRUSj6mWtiKaGsfJwbo4dHVrgT9+jXgE+Pg4obpM2saHNwGKt4cTob51K8C
	j4gCdRkf7dodykGHPd2a2vNVyP8ylsyvkYHAML/Dzxo1UsnebO/ofyx3CaWtXh/Iluztlgb+GMUD/
	KNjY4Ub9jyl60Xy0STgryhps6kFte8Wx7X+ZWXk6kZLBNIOwqhkQRm5oNT74BY2iwoLNWZZ4wsWvs
	6VFAF4sJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWLo3-009mNt-Gi; Tue, 13 Apr 2021 16:22:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLka-009lmI-QV
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 16:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=EnQX9S4gmJIUH/uBWE3zuNPEDP0y7rj9Pe+Q4vYxdrQ=; b=FJK6UPIwjsY4SzgNuyQgw8uexX
 xoI6KiAwfFyaLKWrYfxgjI1VSCUcfQaPvmZcvsiMxcyWOeMejeSohMjFHwBNXR7nbXLdBT3aH1Jg+
 wUUvhiaAv+Vwp1VJUC9EdKPV5xY+Ruq/mUh0ywXD0ry0G/mSg3F3pKHlh49DR3FcVa4G6P3Oh64Ig
 NTTsJsMHmHzTmyrprWNcirh0mHK1N+bmeEmCPd5z6BDJwjxFue1Hp3+0dHsNXv3Xi+d0/zcb8gO2l
 CEPg+JS3x60yM0S4vj0dRs6MyWK6VIS/KqAZjaBMhWBxkX/M4NCkEdrMNo/PK8zMTkWSE0C88YuVB
 5xCLDEig==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLkW-007AlI-W9
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 16:18:51 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3CF33FF80A;
 Tue, 13 Apr 2021 16:18:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 4/7] mtd: rawnand: ndfc: Fix external use of SW Hamming ECC
 helper
Date: Tue, 13 Apr 2021 18:18:37 +0200
Message-Id: <20210413161840.345208-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210413161840.345208-1-miquel.raynal@bootlin.com>
References: <20210413161840.345208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_091849_204093_E2AD41D6 
X-CRM114-Status: GOOD (  11.65  )
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

Since the Hamming software ECC engine has been updated to become a
proper and independent ECC engine, it is now mandatory to either
initialize the engine before using any one of his functions or use one
of the bare helpers which only perform the calculations. As there is no
actual need for a proper ECC initialization, let's just use the bare
helper instead of the rawnand one.

Fixes: 90ccf0a0192f ("mtd: nand: ecc-hamming: Rename the exported functions")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/ndfc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index 338d6b1a189e..98d5a94c3a24 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -22,6 +22,7 @@
 #include <linux/mtd/ndfc.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <asm/io.h>
@@ -100,6 +101,15 @@ static int ndfc_calculate_ecc(struct nand_chip *chip,
 	return 0;
 }
 
+static int ndfc_correct_ecc(struct nand_chip *chip,
+			    unsigned char *buf,
+			    unsigned char *read_ecc,
+			    unsigned char *calc_ecc)
+{
+	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc,
+				      chip->ecc.size, false);
+}
+
 /*
  * Speedups for buffer read/write/verify
  *
@@ -145,7 +155,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	chip->controller = &ndfc->ndfc_control;
 	chip->legacy.read_buf = ndfc_read_buf;
 	chip->legacy.write_buf = ndfc_write_buf;
-	chip->ecc.correct = rawnand_sw_hamming_correct;
+	chip->ecc.correct = ndfc_correct_ecc;
 	chip->ecc.hwctl = ndfc_enable_hwecc;
 	chip->ecc.calculate = ndfc_calculate_ecc;
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
