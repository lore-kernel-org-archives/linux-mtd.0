Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDBFC282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 12:36:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61CDF21852
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 12:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bHDgRk3A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61CDF21852
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hv9GUJC20HK6BNIA7WbO4lncM4VwxYDPRhI/n7Muo2I=; b=bHDgRk3A1ZoCX9
	6nr8LUtYnkMk3xiKXAMsLdX6WxUg85zxP02C5ZJZ6vFtUFYaB96IdykSef3gXuvNTG7nu7SAxiIes
	pJmp5OcfEgcJ8sVt+/FMbSJlfTBHXDdxtaluTgvVQ8bTHZ8Ij1IPRQu8TWlRcpSPxdxqH6Iivc7mQ
	zxxrwpEUoXtyYcyDK6XSDfcJn46/32TSCp6lJWHhYTjj1VE+iS6Lgjwh3XhRIFmbtzigutBdSSHLV
	T6LWeK0wARfwZjjpI0MAJ2oW2gjLO7Zx/HoH1obFBcHZuJJaOgzg8xWqmvVVYRRpFddYgbA0fgFl5
	+ti07Kp5NdBkr96aeqEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGjnu-0004iu-9Z; Wed, 17 Apr 2019 12:36:42 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGjnq-0004gS-In
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 12:36:40 +0000
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 10C2D67A6EC;
 Wed, 17 Apr 2019 14:36:36 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 17 Apr
 2019 14:36:35 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Wed, 17 Apr 2019 14:36:35 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v6 3/7] mtd: nand: Cleanup flags and fields for bad block
 marker position
Thread-Topic: [PATCH v6 3/7] mtd: nand: Cleanup flags and fields for bad block
 marker position
Thread-Index: AQHU9Roxb2A3ESCHo0O+hkiuuVmXDw==
Date: Wed, 17 Apr 2019 12:36:35 +0000
Message-ID: <20190417123631.22545-4-frieder.schrempf@kontron.de>
References: <20190417123631.22545-1-frieder.schrempf@kontron.de>
In-Reply-To: <20190417123631.22545-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 10C2D67A6EC.A3062
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_053638_950288_560CABDF 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Schrempf
 Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Now that we have moved the information to the chip level, let's
remove all the unused flags and fields.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/bbm.h | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 3102bd754d18..010bc5544c54 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -93,10 +93,7 @@ struct nand_bbt_descr {
 #define NAND_BBT_WRITE		0x00002000
 /* Read and write back block contents when writing bbt */
 #define NAND_BBT_SAVECONTENT	0x00004000
-/* Search good / bad pattern on the first and the second page */
-#define NAND_BBT_SCAN2NDPAGE	0x00008000
-/* Search good / bad pattern on the last page of the eraseblock */
-#define NAND_BBT_SCANLASTPAGE	0x00010000
+
 /*
  * Use a flash based bad block table. By default, OOB identifier is saved in
  * OOB area. This option is passed to the default bad block table function.
@@ -123,13 +120,6 @@ struct nand_bbt_descr {
 /* The maximum number of blocks to scan for a bbt */
 #define NAND_BBT_SCAN_MAXBLOCKS	4
 
-/*
- * Constants for oob configuration
- */
-#define NAND_SMALL_BADBLOCK_POS		5
-#define NAND_LARGE_BADBLOCK_POS		0
-#define ONENAND_BADBLOCK_POS		0
-
 /*
  * Bad block scanning errors
  */
@@ -140,7 +130,6 @@ struct nand_bbt_descr {
 /**
  * struct bbm_info - [GENERIC] Bad Block Table data structure
  * @bbt_erase_shift:	[INTERN] number of address bits in a bbt entry
- * @badblockpos:	[INTERN] position of the bad block marker in the oob area
  * @options:		options for this descriptor
  * @bbt:		[INTERN] bad block table pointer
  * @isbad_bbt:		function to determine if a block is bad
@@ -150,7 +139,6 @@ struct nand_bbt_descr {
  */
 struct bbm_info {
 	int bbt_erase_shift;
-	int badblockpos;
 	int options;
 
 	uint8_t *bbt;
-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
