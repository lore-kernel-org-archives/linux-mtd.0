Return-Path: <SRS0=wpEZ=37=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECD1C352A3
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 16:36:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E2E320708
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 16:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qEoraWrB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E2E320708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+nfYeFVlqtPWAlmNtr5+urondSOLatAKa0K+cc+3ZW4=; b=qEoraWrBam7LuR
	rudxC3wZmtcvWgL5TD9SHs3V1IMNQq97sHcBjsTDSdVNaSYi4AImVg7BCQiiodPTZOp2iN4lhxslI
	N39K1PyUnSlnO2sd6LEG7zFEcJa+BiBocTKt2QiOg09r6yzuTAukaCr2gZasEJqhIKKtlmMDVPFHF
	XLanS370fRcFGh/4ZL0OQ8Q0rbDXCMjZGb5Tg6s3XngSrYv9YvxCr13EEGsbFpXvW7YiBk1j2Qkxv
	yp89pKhHdY95SalrYwXYHdkdz290+xJiVunVfJ6sGkSpSo+vmXEzAZMxabZW0v4pJNbI/fz+DegdW
	IV2clCDGX7+mLdzVkZ+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1YWL-0007Uk-6r; Tue, 11 Feb 2020 16:36:21 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1YVw-00077M-DR
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2020 16:35:58 +0000
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 384DA67A894;
 Tue, 11 Feb 2020 17:35:54 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 11 Feb
 2020 17:35:53 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Tue, 11 Feb 2020 17:35:53 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Boris Brezillon <bbrezillon@kernel.org>, Schrempf Frieder
 <frieder.schrempf@kontron.de>, Jeff Kletsky <git-commits@allycomm.com>,
 liaoweixiong <liaoweixiong@allwinnertech.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Peter Pan <peterpandong@micron.com>
Subject: [PATCH 3/3] mtd: spinand: Wait for the erase op to finish before
 writing a bad block marker
Thread-Topic: [PATCH 3/3] mtd: spinand: Wait for the erase op to finish before
 writing a bad block marker
Thread-Index: AQHV4PlTblnHiLQcV0asTsn4OWAZ0A==
Date: Tue, 11 Feb 2020 16:35:53 +0000
Message-ID: <20200211163452.25442-4-frieder.schrempf@kontron.de>
References: <20200211163452.25442-1-frieder.schrempf@kontron.de>
In-Reply-To: <20200211163452.25442-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 384DA67A894.AE793
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, git-commits@allycomm.com,
 liaoweixiong@allwinnertech.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 peterpandong@micron.com, richard@nod.at, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_083556_793561_8CBBE2FA 
X-CRM114-Status: GOOD (  14.04  )
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
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Currently when marking a block, we use spinand_erase_op() to erase
the block before writing the marker to the OOB area without waiting
for the operation to succeed. This can lead to the marking failing
silently and no bad block marker being written to the flash.

To fix this we reuse the spinand_erase() function, that already does
everything we need to do before actually writing the marker.

Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
Cc: stable@vger.kernel.org
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/spi/core.c | 56 ++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 925db6269861..8a69d13639e2 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -600,6 +600,32 @@ static int spinand_mtd_block_isbad(struct mtd_info *mtd, loff_t offs)
 	return ret;
 }
 
+static int __spinand_erase(struct nand_device *nand, const struct nand_pos *pos,
+			   bool hard_fail)
+{
+	struct spinand_device *spinand = nand_to_spinand(nand);
+	u8 status;
+	int ret;
+
+	ret = spinand_select_target(spinand, pos->target);
+	if (ret)
+		return ret;
+
+	ret = spinand_write_enable_op(spinand);
+	if (ret)
+		return ret;
+
+	ret = spinand_erase_op(spinand, pos);
+	if (ret && hard_fail)
+		return ret;
+
+	ret = spinand_wait(spinand, &status);
+	if (!ret && (status & STATUS_ERASE_FAILED))
+		ret = -EIO;
+
+	return ret;
+}
+
 static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
 {
 	struct spinand_device *spinand = nand_to_spinand(nand);
@@ -614,16 +640,10 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
 	int ret;
 
 	/* Erase block before marking it bad. */
-	ret = spinand_select_target(spinand, pos->target);
-	if (ret)
-		return ret;
-
-	ret = spinand_write_enable_op(spinand);
+	ret = __spinand_erase(nand, pos, false);
 	if (ret)
 		return ret;
 
-	spinand_erase_op(spinand, pos);
-
 	return spinand_write_page(spinand, &req);
 }
 
@@ -644,27 +664,7 @@ static int spinand_mtd_block_markbad(struct mtd_info *mtd, loff_t offs)
 
 static int spinand_erase(struct nand_device *nand, const struct nand_pos *pos)
 {
-	struct spinand_device *spinand = nand_to_spinand(nand);
-	u8 status;
-	int ret;
-
-	ret = spinand_select_target(spinand, pos->target);
-	if (ret)
-		return ret;
-
-	ret = spinand_write_enable_op(spinand);
-	if (ret)
-		return ret;
-
-	ret = spinand_erase_op(spinand, pos);
-	if (ret)
-		return ret;
-
-	ret = spinand_wait(spinand, &status);
-	if (!ret && (status & STATUS_ERASE_FAILED))
-		ret = -EIO;
-
-	return ret;
+	return __spinand_erase(nand, pos, true);
 }
 
 static int spinand_mtd_erase(struct mtd_info *mtd,
-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
