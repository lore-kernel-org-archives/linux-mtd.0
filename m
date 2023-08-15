Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDBDC0015E
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 16:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p6knR6v74TEQYrUrhx/L/4/1ugC5uFYMZU0Ilg7kJdg=; b=Z7wqCGbZvQ2wQf
	D/4cMEn08oVcXhQQwm496xKG9KigqFCkIJXaNx1dtBGpVGEIGatP8cXR+SZqsqCCC3Pn19p7Nz/3u
	SaOdhMF4TY1lC28NjLVkWL15aAbnmVPEBJiwf5t1IVg7m4Gi1mCiTquPxDaDwkd+jONlHJHf7ZPE/
	9LeCVjc6XJNZuacs0uJ4qMPD7b9DSSGLRuy/Y+0enVzSwb74cBPOMr9IcgC4hjnKKek4Wfyk9HTjb
	2HCWb9urTiAMklv+0BkHcBRdOTPEG8zdfo6BvfAhTMB8PA5+uwB7HosrBbxMQ30jccyByQk+G398t
	HOk7o1ZCDYE/mwe4wjnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwe9-001xHd-1w;
	Tue, 15 Aug 2023 16:11:53 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwe4-001xES-2G
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 16:11:51 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BB6A6100006;
	Tue, 15 Aug 2023 19:11:31 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BB6A6100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692115891;
	bh=Zh58zgKGmujKY7UolkYnE5HNgDvOOGFPvKhbvkD39RU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=McYrbTyZJZGj5ArzerRzpoWxzCbotm44xmgDlv2xy7HK/0ZilsimsdsBZ8MxCLbt+
	 tgBWG4f3PuYO+TM1Nrb0xSlbs9XJVlaMeleBUaqmAd5fgS5tPDrphCROdBFwz52ypV
	 9tsd40DSAuLH7DVTQtCeKL65j3FeHrlGtJVriBXrM9rTPxF5b1ciR4zklBCG5m+iwm
	 DySW5d+ONSHrciSbwNw+XqulgIsQtGMAuQae1j+M/Uu8fR618JXD81jk+XxHfNCPtU
	 P55/orl9jR/YKEQC8tYoMf4jHIp0Rba+FnL0SewtmKvMnWwJ6PiaNLJ/A1HD/z8xIo
	 4KaMjWNogFEjg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 15 Aug 2023 19:11:31 +0300 (MSK)
Received: from CAB-WSD-0004828.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 15 Aug 2023 19:11:21 +0300
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@sberdevices.ru>, Martin Kurbanov <mmkurbanov@sberdevices.ru>
Subject: [PATCH v1] mtd: spinand: micron: correct parameters
Date: Tue, 15 Aug 2023 19:10:24 +0300
Message-ID: <20230815161024.810729-1-mmkurbanov@sberdevices.ru>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179259 [Aug 15 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: MMKurbanov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 526 526 7a6a9b19f6b9b3921b5701490f189af0e0cd5310, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;sberdevices.ru:5.0.1,7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/15 09:54:00 #21621202
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_091149_955096_67F6F08D 
X-CRM114-Status: GOOD (  16.16  )
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

This patch includes following fixes:
  1. Correct bitmask for ecc status. Valid bitmask is 0x70 in the
      status register.
  2. Fix oob layout:
        - The first 4 bytes are reserved for bad block data.
        - Use only non-protected ECC bytes for free data:
          OOB ECC protected Area is not used due to partial
          programming from some filesystems (like JFFS2 with
          cleanmarkers).

Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
---
 drivers/mtd/nand/spi/micron.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 50b7295bc922..897e70913ed0 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -12,7 +12,7 @@
 
 #define SPINAND_MFR_MICRON		0x2c
 
-#define MICRON_STATUS_ECC_MASK		GENMASK(7, 4)
+#define MICRON_STATUS_ECC_MASK		GENMASK(6, 4)
 #define MICRON_STATUS_ECC_NO_BITFLIPS	(0 << 4)
 #define MICRON_STATUS_ECC_1TO3_BITFLIPS	(1 << 4)
 #define MICRON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
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
@@ -75,9 +89,15 @@ static int micron_8_ooblayout_free(struct mtd_info *mtd, int section,
 	if (section)
 		return -ERANGE;
 
-	/* Reserve 2 bytes for the BBM. */
-	region->offset = 2;
-	region->length = (mtd->oobsize / 2) - 2;
+	/* Reserve 4 bytes for the BBM. */
+	region->offset = 4;
+
+	/* The OOB Free (User) area is divided into two equal parts:
+	 *   the first part is not protected by ECC;
+	 *   the second part is protected by ECC.
+	 * Use only non-protected ECC bytes.
+	 */
+	region->length = (mtd->oobsize / 2) / 2 - 4;
 
 	return 0;
 }
-- 
2.40.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
