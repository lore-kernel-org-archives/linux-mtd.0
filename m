Return-Path: <SRS0=ASOq=UF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70827C04AB5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 17:08:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E0A920652
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 17:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aT9qaglK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E0A920652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DcOcygGifTOeiGtOlTzAJiN0HpiCNrd8mdqjJJ0MT8c=; b=aT9qaglKKygMw9
	Nnb0R77Q3s2ZZObUl9TL+bUiKd+TDOShCRojRyRRrawv0bS1LdmnYzhz8WvK+CWHJH2LuGf5/Dnut
	rRjr7Bap8GnrYM4jaNM0JyJxfL0+obT47ZnPn5BVPZ5sYFbOlt7b+45xXDhiYMLlTgKtM4uHLc2yO
	pHNYnVAvl5Wn9MjrifwLHW9YogqEn3ouQDhAC8RkkcU7ujTF9nnEUyNvUz6QpeodQ8yqAvWyg8FdX
	Di14BdhwG9scA/ouyFW6/GflUAJTsKhzJ8RtGvbHNs7Hq+F5H2S8r9QvumpjFcua2i+P/qtmNnDOO
	v/oASohW5Yo0pbRj4zwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYvrw-0002li-PK; Thu, 06 Jun 2019 17:08:04 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYvrs-0002lI-Ku
 for linux-mtd@lists.infradead.org; Thu, 06 Jun 2019 17:08:02 +0000
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 5E45B661177;
 Thu,  6 Jun 2019 19:07:56 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 6 Jun 2019
 19:07:55 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Thu, 6 Jun 2019 19:07:55 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "emil.lenngren@gmail.com" <emil.lenngren@gmail.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: spinand: Fix max_bad_eraseblocks_per_lun info in memorg
Thread-Topic: [PATCH] mtd: spinand: Fix max_bad_eraseblocks_per_lun info in
 memorg
Thread-Index: AQHVHIpiPxYIjYD5lkmpT+H/FkTT7Q==
Date: Thu, 6 Jun 2019 17:07:55 +0000
Message-ID: <20190606170754.6531-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 5E45B661177.AF631
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, emil.lenngren@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_100801_012872_51D7769D 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The 1Gb Macronix chip can have a maximum of 20 bad blocks, while
the 2Gb version has twice as many blocks and therefore the maximum
number of bad blocks is 40.

The 4Gb GigaDevice GD5F4GQ4xA has twice as many blocks as its 2Gb
counterpart and therefore a maximum of 80 bad blocks.

Fixes: 377e517b5fa5 ("mtd: nand: Add max_bad_eraseblocks_per_lun info to memorg")
Reported-by: Emil Lenngren <emil.lenngren@gmail.com>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/spi/gigadevice.c | 2 +-
 drivers/mtd/nand/spi/macronix.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index e5586390026a..e6c646007cda 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -180,7 +180,7 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     SPINAND_ECCINFO(&gd5fxgq4xa_ooblayout,
 				     gd5fxgq4xa_ecc_get_status)),
 	SPINAND_INFO("GD5F4GQ4xA", 0xF4,
-		     NAND_MEMORG(1, 2048, 64, 64, 4096, 40, 1, 1, 1),
+		     NAND_MEMORG(1, 2048, 64, 64, 4096, 80, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 6502727049a8..21def3f8fb36 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -100,7 +100,7 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
 
 static const struct spinand_info macronix_spinand_table[] = {
 	SPINAND_INFO("MX35LF1GE4AB", 0x12,
-		     NAND_MEMORG(1, 2048, 64, 64, 1024, 40, 1, 1, 1),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(4, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
@@ -109,7 +109,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35LF2GE4AB", 0x22,
-		     NAND_MEMORG(1, 2048, 64, 64, 2048, 20, 2, 1, 1),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 2, 1, 1),
 		     NAND_ECCREQ(4, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
