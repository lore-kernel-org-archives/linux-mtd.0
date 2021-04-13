Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED49C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:20:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A37E061004
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A37E061004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vGUctmBz+JViSsBpLkHEzk8B7Z2uMBlcAB1gi4BT16s=; b=WqoSx7SZlB5nDGdYwjyJEp9dT
	Q4VU7i51p7RP8EgIZwYQ+9V8QxLC93VaJAes2RutLJsKyBa3FEmesrpqfWTaEkxNAPsa9QUtswIhL
	QG3nAfwInrlnosxuv9jMWIZFU8G2RXVg9p6Mydwz2LoeaxrX9RuC/ia+u+HFZsNhJZq6XN4yePFz7
	8edTeKD8Ek2Iq31dyJV2+XYVPaV4UOHNu9UZWqPe/5AOtohdL+RUakHyGIQSrM+24G1xqLwPSij2A
	hVWrnVC0xkxdv+VJC4x4RmXaeLFhBKfZ0L7FIV3gcRFu738U+2Fb5NEBzXXDCDyKc2ZLI6nQ6OSp0
	YvxKu6mBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWLl8-009lpf-KL; Tue, 13 Apr 2021 16:19:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLkY-009lm8-8u
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 16:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=/+HazncXsSurpsErLHTOAQDMYraJJojNPhzP7xA64sM=; b=Ux6O+e2FSo5ass1YaxQOiYmZIj
 DwNUqB/GaRXGHFzRWvDFHS+ztUNNT0TgGeI9R2tUwb+o0I3KRAMYbhPUfn77JymJNh81A4OQFRuTb
 dlS9FlqsJcfvjw87TLEbj+pIbsY/NE+ZHY0NBi/YkMEpI0i3nidhiJiXhef97vfOrwEs6ol2wXQ9D
 vb7I+QqMZpuM8INqoAmzgl6N0OCIX/clgynS4LDtKo2MfUkQV+9qXjXMBOKZEaKP1XLAgU7Z2mdga
 OVjkR3GKFwWCkvMlw7WDw9BMxzfFJXpK+21aocTP39FEQ8dCve064Yofn1YdkeXrfLwcAN2fMN8Op
 Rkv/r1gA==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLkV-007AlC-DJ
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 16:18:49 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 43A4DFF803;
 Tue, 13 Apr 2021 16:18:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/7] mtd: rawnand: fsmc: Fix external use of SW Hamming ECC
 helper
Date: Tue, 13 Apr 2021 18:18:35 +0200
Message-Id: <20210413161840.345208-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210413161840.345208-1-miquel.raynal@bootlin.com>
References: <20210413161840.345208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_091847_604408_D28050B1 
X-CRM114-Status: GOOD (  12.24  )
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
 drivers/mtd/nand/raw/fsmc_nand.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index a24e2f57fa68..99a4dde9825a 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -25,6 +25,7 @@
 #include <linux/sched.h>
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
@@ -432,6 +433,15 @@ static int fsmc_read_hwecc_ecc1(struct nand_chip *chip, const u8 *data,
 	return 0;
 }
 
+static int fsmc_correct_ecc1(struct nand_chip *chip,
+			     unsigned char *buf,
+			     unsigned char *read_ecc,
+			     unsigned char *calc_ecc)
+{
+	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc,
+				      chip->ecc.size, false);
+}
+
 /* Count the number of 0's in buff upto a max of max_bits */
 static int count_written_bits(u8 *buff, int size, int max_bits)
 {
@@ -917,7 +927,7 @@ static int fsmc_nand_attach_chip(struct nand_chip *nand)
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
 		dev_info(host->dev, "Using 1-bit HW ECC scheme\n");
 		nand->ecc.calculate = fsmc_read_hwecc_ecc1;
-		nand->ecc.correct = rawnand_sw_hamming_correct;
+		nand->ecc.correct = fsmc_correct_ecc1;
 		nand->ecc.hwctl = fsmc_enable_hwecc;
 		nand->ecc.bytes = 3;
 		nand->ecc.strength = 1;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
