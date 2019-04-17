Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD77C282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 12:16:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 079822173C
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 12:16:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b3d3+Xlr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 079822173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/lwsyUNkoG3bWc4pZqhTg19rGhF94Fkru2y1OA3kwE=; b=b3d3+Xlrv0Ahyq
	B8yKO9JqkVDbkxZEMsInbZ4LPqByh/hljE4fQAc6O+6TbZlTAv6a2Uu9deWXghGHnptV1BG4kKOCY
	dqj1WNj1srndck4KMOS1iTB0JDET6VoFX8g/Jd7eu8e26BbWQ2QnMaS6lwQSgoXUQXUB89ufkDrsv
	phdn49/1mUHjOfaz5OyRln3qGPcb9v2iMcyS9lgfyM/7gbUW3f2wMp3BN+wAMb7eNQP3xOg2SnryQ
	FlxNSglt8iVncq+jkw3txHCWBixcjXVacSipUiprj4DiGsMmGDtwsSAmYNw/7Rpw3B555w9/kMijT
	oCR4zgvAipaMP/5FzNEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGjUE-0005Zn-Uu; Wed, 17 Apr 2019 12:16:22 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGjTK-0004Hh-7w
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 12:15:28 +0000
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 9596F67A876;
 Wed, 17 Apr 2019 14:15:22 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 17 Apr
 2019 14:15:22 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Wed, 17 Apr 2019 14:15:22 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 6/7] mtd: rawnand: ESMT: Also use the last page for bad
 block markers
Thread-Topic: [PATCH v5 6/7] mtd: rawnand: ESMT: Also use the last page for
 bad block markers
Thread-Index: AQHU9Rc6mI0Ov5N+n0m6z29YVGfB0Q==
Date: Wed, 17 Apr 2019 12:15:22 +0000
Message-ID: <20190417121420.21752-7-frieder.schrempf@kontron.de>
References: <20190417121420.21752-1-frieder.schrempf@kontron.de>
In-Reply-To: <20190417121420.21752-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 9596F67A876.AB806
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_051526_599983_152EBE30 
X-CRM114-Status: GOOD (  10.03  )
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
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Schrempf
 Frieder <frieder.schrempf@kontron.de>, Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Frieder Schrempf <frieder.schrempf@kontron.de>

It is known that some ESMT SLC NANDs have been shipped
with the factory bad block markers in the first or last page
of the block, instead of the first or second page. To be on
the safe side, let's check all three locations.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_esmt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_esmt.c b/drivers/mtd/nand/raw/nand_esmt.c
index 58646ed663ac..3338c68aaaf1 100644
--- a/drivers/mtd/nand/raw/nand_esmt.c
+++ b/drivers/mtd/nand/raw/nand_esmt.c
@@ -36,7 +36,14 @@ static void esmt_nand_decode_id(struct nand_chip *chip)
 static int esmt_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
-		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
+		/*
+		 * It is known that some ESMT SLC NANDs have been shipped
+		 * with the factory bad block markers in the first or last page
+		 * of the block, instead of the first or second page. To be on
+		 * the safe side, let's check all three locations.
+		 */
+		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE |
+				 NAND_BBM_LASTPAGE;
 
 	return 0;
 }
-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
