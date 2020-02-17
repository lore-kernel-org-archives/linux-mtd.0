Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89216C34022
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 15:54:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D6D206F4
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 15:54:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="exEcAdtW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59D6D206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aauJAVShKL0Ph0oclOTP8ZUCBjNck8g+ZS6wDxP5wJ0=; b=exEcAdtW6hqsLF
	wPMNofAcz1wWLYWAgmsHgm6j90TchxUOpNuMI+Grs2+5p8C8ysauoXwwyb+FRKw79Ufc9QPh8iQZM
	6V5mqcQt4qnOhqqZ7nV7yZSHb+0saU7813Q0o3zdxiRLtTVgMGOeGW1zr5mUpBIWNzaRv6Advjp7v
	uneEgoqpvfuDSDOkRbV5dh6Ei0dbqDVpZdrdkQGpqzzEv+fV/GHHhEnLUYCO/hkPL3QnSlShMGqlD
	oUXivceQKW/1XieKL0C1agVryB1bxB6hvAEFyuqfJQzeNERmR7eYH3EZwj1ctMT4VLt5X6qybPDo6
	zdTL74FpCYyE8aFT6NYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3ij5-0007VS-60; Mon, 17 Feb 2020 15:54:27 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3iis-0007GO-RO
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 15:54:16 +0000
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id EABA767AB40;
 Mon, 17 Feb 2020 16:54:12 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 17 Feb
 2020 16:54:12 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Mon, 17 Feb 2020 16:54:12 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Boris Brezillon <bbrezillon@kernel.org>, Schrempf Frieder
 <frieder.schrempf@kontron.de>, Jeff Kletsky <git-commits@allycomm.com>,
 liaoweixiong <liaoweixiong@allwinnertech.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: [PATCH v2 3/3] mtd: spinand: Don not erase the block before writing a
 bad block marker
Thread-Topic: [PATCH v2 3/3] mtd: spinand: Don not erase the block before
 writing a bad block marker
Thread-Index: AQHV5ap/saRAn1//VEmaJshNaD42IA==
Date: Mon, 17 Feb 2020 15:54:12 +0000
Message-ID: <20200217155213.5594-4-frieder.schrempf@kontron.de>
References: <20200217155213.5594-1-frieder.schrempf@kontron.de>
In-Reply-To: <20200217155213.5594-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: EABA767AB40.A1FAB
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, git-commits@allycomm.com,
 liaoweixiong@allwinnertech.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 richard@nod.at, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_075415_238036_174AFDE6 
X-CRM114-Status: GOOD (  12.83  )
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
the block before writing the marker to the OOB area. Doing so without
waiting for the operation to finish can lead to the marking failing
silently and no bad block marker being written to the flash.

In fact we don't need to do an erase at all before writing the BBM.
The ECC is disabled for the raw access to the OOB data and we don't
need to work around any issues with chips reporting ECC errors as it
is known to be the case for raw NAND.

Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
Cc: stable@vger.kernel.org
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes in v2:
 * Instead of waiting for the erase operation to finish, just don't
   do an erase at all, as it is not needed.
 * Update the commit message
---
 drivers/mtd/nand/spi/core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index a94287884453..8dda51bbdd11 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -613,7 +613,6 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
 	};
 	int ret;
 
-	/* Erase block before marking it bad. */
 	ret = spinand_select_target(spinand, pos->target);
 	if (ret)
 		return ret;
@@ -622,8 +621,6 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
 	if (ret)
 		return ret;
 
-	spinand_erase_op(spinand, pos);
-
 	return spinand_write_page(spinand, &req);
 }
 
-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
