Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D5FEE49A3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GHYX2exQMzEAPUCyikN2UaXhJFZDCDsaNwyuj7JXuaU=; b=WXYtrFnQanHbX/
	uQ1JBGZxvgZ7meUnAdWCdBkGjsubQyH8O9OcQlKavwJvgvQP3VQx05DZcrmSNxTaBwjdtCnvDIrHl
	hbKUO5epz3BZivv+G5l+uPA70VqP+JdJDtMwKI9TqC/y0lR/AfS55NJGyATBMzAfK8nDDw22X9IKG
	orIxluwz71AimRo8AanzY018kQ+BSyxTJrJlZXwc4NBsqnl+c69u1XtSkUuujZ+J6FzL+nuBc5CZe
	4I1iErGIZQ1KApjZAxqxUbhhyHYAwY/YL0MPTvNMEbQ5MXJV/lC7pnStvh12kr8YyRSEBHCw07K0V
	Rn0UArzZamCB41ME974g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQSU-00FtiS-12;
	Tue, 22 Aug 2023 12:26:06 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQSQ-00FtfK-0y
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 12:26:05 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BA93810000A;
	Tue, 22 Aug 2023 15:25:54 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BA93810000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692707154;
	bh=3PY1uBZ1cMpfUUIIRFeCrcXBjYSgM+FMgCV6BCjvYBk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Mc6ZdUKzmLjWFLF6vFyW5x/BTmN0L+Ac83cA09tuNggCEx3KADl5NrkAzhrWL9+r1
	 KDeS4bh/5sOBhXsjOVb9/YYbBt2H8xODMyo38QaDr5sxgUBXyCuPCWXDl6Qj0buCfv
	 P2MQstI8JChFJhKCLwpu4c/kkuOLYlLUy7DR9n1j+MhsSJdAnTBF7DH3JVVZ5sY8Vv
	 g370cWB+bi7g85YJvom/c0z4yVJEOZI66gcNh+9ul5I9bTSuXJIEMrnPieIWprXTIS
	 MT5fiRrzkrpuJqVlYK6Ia9Q2gHEv+u1FykdpDfJy7XqUExamWBcV05e48jyGIYJI+p
	 +AGEtDYByVFSg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 22 Aug 2023 15:25:54 +0300 (MSK)
Received: from CAB-WSD-0004828.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 22 Aug 2023 15:25:53 +0300
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@sberdevices.ru>, Martin Kurbanov <mmkurbanov@sberdevices.ru>
Subject: [PATCH v2 2/2] mtd: spinand: micron: fixing the offset for OOB
Date: Tue, 22 Aug 2023 15:25:34 +0300
Message-ID: <20230822122534.872646-3-mmkurbanov@sberdevices.ru>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230822122534.872646-1-mmkurbanov@sberdevices.ru>
References: <20230822122534.872646-1-mmkurbanov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179374 [Aug 22 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 527 527 5bb611be2ca2baa31d984ccbf4ef4415504fc308, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/22 09:22:00 #21674243
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_052602_689314_EF273D6F 
X-CRM114-Status: GOOD (  14.57  )
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

The first 4 bytes are reserved for bad block data.

Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
---
 drivers/mtd/nand/spi/micron.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 12601bc4227a..64b41c7c9cce 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -57,6 +57,20 @@ static SPINAND_OP_VARIANTS(x1_write_cache_variants,
 static SPINAND_OP_VARIANTS(x1_update_cache_variants,
 			   SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
+/*
+ * OOB spare area map (128 and 256 bytes)
+ *
+ *           +-----+-----------------+-------------------+---------------------+
+ *           | BBM |     Non ECC     |   ECC protected   |      ECC Area       |
+ *           |     | protected Area  |       Area        |                     |
+ * ----------+-----+-----------------+-------------------+---------------------+
+ *  oobsize  | 0:3 | 4:31 (28 bytes) | 32:63 (32 bytes)  | 64:127 (64 bytes)   |
+ * 128 bytes |     |                 |                   |                     |
+ * ----------+-----+-----------------+-------------------+---------------------+
+ *  oobsize  | 0:3 | 4:63 (60 bytes) | 64:127 (64 bytes) | 127:255 (128 bytes) |
+ * 256 bytes |     |                 |                   |                     |
+ * ----------+-----+-----------------+-------------------+---------------------+
+ */
 static int micron_8_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -75,9 +89,9 @@ static int micron_8_ooblayout_free(struct mtd_info *mtd, int section,
 	if (section)
 		return -ERANGE;
 
-	/* Reserve 2 bytes for the BBM. */
-	region->offset = 2;
-	region->length = (mtd->oobsize / 2) - 2;
+	/* Reserve 4 bytes for the BBM. */
+	region->offset = 4;
+	region->length = (mtd->oobsize / 2) - 4;
 
 	return 0;
 }
-- 
2.40.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
