Return-Path: <SRS0=QwSX=64=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BEEC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 09:16:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 568E620675
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 09:16:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ki3fzQcj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=axis.com header.i=@axis.com header.b="NuPR3mT5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 568E620675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=axis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKbqjDnQTEz3uIkBXIGalucVew02NKEWpKHea5fa13w=; b=ki3fzQcjaxXqUR
	et161Q9/yC5qE2l787Ym/FyyiBqOSfr6kF1zrM/oXdQCfe/+THAeZnZTgEEjHDWkkzfdPA8SbFCv3
	hp0xJbsT1w9PTdKMNNHfYPw3Xy0JLgKq2QoGqTD39b40gtkJ58Az/Zt/wWNC9QyrXnNJSUohfFhje
	NY+b9PRuBy2PCcaVkkTi1PVUZ6bMGwtv/O77WAAqHQWZezHNHIDuaVlsJytKtuTbr0XYGJE8ewNTU
	4GN/Gy5kJI5tDO1hmUepIb/zYvMMeLEIjT2bVGjUDBj4idRUsXAZoschW/eDASxZhy+Kvje/21q+K
	JL26wSiM5Wo1YAe9JaYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ9yL-00083J-DG; Thu, 14 May 2020 09:16:09 +0000
Received: from smtp1.axis.com ([195.60.68.17])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ9yH-00082c-NY
 for linux-mtd@lists.infradead.org; Thu, 14 May 2020 09:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=3695; q=dns/txt; s=axis-central1;
 t=1589447765; x=1620983765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=4fp36ZEEf/8Eq3zXr6wgVyaPD+SfvC2VpjFA0tJGc4I=;
 b=NuPR3mT5vOlW/M0wtGpC5Qzx+4HVLgsVJEc3mk506YF3qHT8ry3+sEEF
 57PlA1urbapV/4UQJ6ugN3infgY7GI6fsmQN0FPPWx9eiC2YlOAOhLzNv
 +bPeSwzmHAecq735lsPRQL2k+lPnqxqUmb7r8TVemxwSwMHWJVIX1kGOc
 k9l6SYQhh0+3RW4LqfGXadif8Z+ZFiT2nFo9aTHzqaqIdHbj5MFHybulP
 fEIxm2ckMP5cySGYjwFxJoZljOYkGDzCP11CtHeyUMfakxDwNq5aIPZ+J
 dl4li628aOWE7wBcy9ZmaoqiMA1InFTr9yH0ORebV0GJY6z88ZRzarW68 w==;
IronPort-SDR: dyEJJyKVCSZF2mjISRjpOyuzh8/PBFUjGdqCgPz80WTk/J27KWQ7mKtPSgcpvgkM0jgSKoKiBJ
 PbAkX4AXWtiXIK93ZGV0U/5inxjXKJRHTpUhzJNzI6wV56GM/GocWRbRvYztU/nLcZn26dHCYX
 tOZe7AtB19ptI9rCTsSXH9wEx24yV2AGrMrWOAbnK/GBMxDHBj+EUjO4Dw0jqJdd5NOtfqfIms
 42OxnByaAb/6nrFBT1wO2WfrA159UKyjB8OBRVxEoDakCKNEtyFHeMBzanH29GDZOX7zTm4TYx
 lZQ=
X-IronPort-AV: E=Sophos;i="5.73,390,1583190000"; 
   d="scan'208";a="8716519"
From: Rickard Andersson <rickaran@axis.com>
To: <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: rawnand: Add timings for Kioxia TH58NVG2S3HBAI4
Date: Thu, 14 May 2020 11:13:42 +0200
Message-ID: <20200514091342.16924-2-rickaran@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200514091342.16924-1-rickaran@axis.com>
References: <richard@nod.at;>
 <20200514091342.16924-1-rickaran@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX02.axis.com (10.0.5.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_021606_098890_A8C9D63A 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: rickaran@axis.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Rickard x Andersson <rickaran@axis.com>

The Kioxia/Toshiba TH58NVG2S3HBAI4 NAND memory is not a
ONFI compliant memory. The timings of the memory is quite
close to ONFI mode 4 but is breaking that spec.

Erase block read speed is increased from 6910 KiB/s to
13490 KiB/s. Erase block write speed is increased from
3350 KiB/s to 4410 KiB/s.

Tested on IMX6SX which has a NAND controller supporting
EDO mode.

Signed-off-by: Rickard x Andersson <rickaran@axis.com>
---
 drivers/mtd/nand/raw/nand_ids.c     |  3 ++
 drivers/mtd/nand/raw/nand_toshiba.c | 61 +++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index e0dbc2e316c7..8b676e8b481b 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -52,6 +52,9 @@ struct nand_flash_dev nand_flash_ids[] = {
 		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
 		  SZ_8K, SZ_8K, SZ_2M, NAND_NEED_SCRAMBLING, 6, 640,
 		  NAND_ECC_INFO(40, SZ_1K), 4 },
+	{"TH58NVG2S3HBAI4 4G 3.3V 8-bit",
+		{ .id = {0x98, 0xdc, 0x91, 0x15, 0x76} },
+		  SZ_2K, SZ_512, SZ_128K, 0, 5, 128, NAND_ECC_INFO(8, SZ_512) },
 
 	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
 	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index b6efaf5195bb..380499cfa491 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -26,6 +26,52 @@
 /* Max ECC Steps for BENAND */
 #define TOSHIBA_NAND_MAX_ECC_STEPS		8
 
+static const struct nand_data_interface th58nvg2s3hbai4_timings = {
+	.type = NAND_SDR_IFACE,
+	.timings.mode = 0,
+	.timings.sdr = {
+		.tPROG_max = 700000000,
+		.tBERS_max = 5000000000,
+		.tCCS_min = 500000,
+		.tR_max = 200000000,
+		.tADL_min = 400000,
+		.tALH_min = 5000,
+		.tALS_min = 12000,
+		.tAR_min = 10000,
+		.tCEA_max = 25000,
+		.tCEH_min = 20000,
+		.tCH_min = 5000,
+		.tCHZ_max = 20000,
+		.tCLH_min = 5000,
+		.tCLR_min = 10000,
+		.tCLS_min = 12000,
+		.tCOH_min = 0,
+		.tCS_min = 20000,
+		.tDH_min = 5000,
+		.tDS_min = 12000,
+		.tFEAT_max = 1000000,
+		.tIR_min = 0,
+		.tITC_max = 1000000,
+		.tRC_min = 25000,
+		.tREA_max = 20000,
+		.tREH_min = 10000,
+		.tRHOH_min = 25000,
+		.tRHW_min = 30000,
+		.tRHZ_max = 60000,
+		.tRLOH_min = 5000,
+		.tRP_min = 12000,
+		.tRR_min = 20000,
+		.tRST_max = 500000000,
+		.tWB_max = 100000,
+		.tWC_min = 25000,
+		.tWH_min = 10000,
+		.tWHR_min = 60000,
+		.tWP_min = 12000,
+		.tWW_min = 100000,
+	}
+};
+
+
 static int toshiba_nand_benand_read_eccstatus_op(struct nand_chip *chip,
 						 u8 *buf)
 {
@@ -194,6 +240,13 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
 	}
 }
 
+static int th58nvg2s3hbai4_init_data_interface(struct nand_chip *chip)
+{
+	chip->data_interface = th58nvg2s3hbai4_timings;
+
+	return 0;
+}
+
 static int tc58teg5dclta00_init(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -205,6 +258,12 @@ static int tc58teg5dclta00_init(struct nand_chip *chip)
 	return 0;
 }
 
+static int th58nvg2s3hbai4_init(struct nand_chip *chip)
+{
+	chip->ops.init_data_interface = th58nvg2s3hbai4_init_data_interface;
+	return 0;
+}
+
 static int toshiba_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
@@ -217,6 +276,8 @@ static int toshiba_nand_init(struct nand_chip *chip)
 
 	if (!strcmp("TC58TEG5DCLTA00", chip->parameters.model))
 		tc58teg5dclta00_init(chip);
+	if (!strncmp("TH58NVG2S3HBAI4", chip->parameters.model, 15))
+		th58nvg2s3hbai4_init(chip);
 
 	return 0;
 }
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
