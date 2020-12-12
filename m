Return-Path: <SRS0=A1A2=FQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC354C433FE
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Dec 2020 11:59:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3142622D3E
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Dec 2020 11:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3142622D3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ByKqtQdzo8Svbe4eqgDwHfPOIRv/O9QTPkGcVe02Kls=; b=wWL+uK6mvMl6zuw+Gfvlf5Mbeg
	2dNeViirLgSUTOrk0TwzZACCBmRpbsSo8ScVKdiN9aIXlk+2etjPw/yo0MWWnOAe641hvbSmyrrKB
	jGrOBCXC/uWj4CuQNJ4j5eWxdr1r+THizGKd3WbvINFqVTGkyXlfPWE59ci5bVCJRBXZt3FFc0ud7
	DC20oBSAYTcpZ0EgluLruaLjt3c4uac6ixCH6PijdEqXnLMZ7vuayEThFb+hHb5Y7e4HLuFeY4WtF
	/B1CmEPILFL2CpA8iPzfhOxoos3j4xF2GihRrWaWjG9jQxTIqfC/TGVP7L2nONoIwzczCAHeRKvws
	fpKcnD9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ko3Xm-0008Ox-Jw; Sat, 12 Dec 2020 11:58:34 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ko3Xj-0008OJ-KG
 for linux-mtd@lists.infradead.org; Sat, 12 Dec 2020 11:58:32 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BCBwMc2085016;
 Sat, 12 Dec 2020 05:58:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607774302;
 bh=1lqBr9ti3JSIRWEfFL56QuVCCYcjLjke99NVtpSRKqk=;
 h=From:To:CC:Subject:Date;
 b=AJ5owDiEmWgM53IT6JtJsssQV07TQ/yS/4nybnJFBFLHKiR5YURJWDirBrLjc0OdG
 4uFGmWJzoHuvcZREDWoo7zUjEM28BibDAhlp/qhNxh7SpGUAnstEJfnUFRlwPclHhN
 2kLzFUl3F3q2Huv6T8Ms2RGsuPWibNpXaHMCIA8Y=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BCBwMf2059097
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 12 Dec 2020 05:58:22 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 12
 Dec 2020 05:58:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 12 Dec 2020 05:58:22 -0600
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BCBwINL013399;
 Sat, 12 Dec 2020 05:58:19 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: spi-nor: sfdp: Fix SMPT parsing when 4BAIT table is
 before SMPT
Date: Sat, 12 Dec 2020 17:28:17 +0530
Message-ID: <20201212115817.5122-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201212_065831_799346_F7D40620 
X-CRM114-Status: GOOD (  13.35  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <p.yadav@ti.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If 4BAIT table appears before SMPT then, nor->addr_width is set to 4 before
SMPT table is parsed. This causes SMPT parser code to use addr_width of 4
for reading current sector map configuration in spi_nor_get_map_in_use()
if SMPT_CMD_ADDRESS_LEN reads SMPT_CMD_ADDRESS_LEN_USE_CURRENT (see
spi_nor_smpt_addr_width()). Instead code should be using the value
presented by BFPT_DWORD1_ADDRESS_BYTES field. On S28HS family of devices
this bug leads to selection of invalid sector mapping thus causing erase
and write failures.

Fix this by parsing 4BAIT address table at the very end after all other
parameter tables are parsed.

Fixes: b038e8e3be72 ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/sfdp.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 22cb519efe3f..6d4dc1549cc7 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1260,6 +1260,7 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 int spi_nor_parse_sfdp(struct spi_nor *nor,
 		       struct spi_nor_flash_parameter *params)
 {
+	const struct sfdp_parameter_header *sfdp_4bait_param_header = NULL;
 	const struct sfdp_parameter_header *param_header, *bfpt_header;
 	struct sfdp_parameter_header *param_headers = NULL;
 	struct sfdp_header header;
@@ -1341,7 +1342,13 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
 			break;
 
 		case SFDP_4BAIT_ID:
-			err = spi_nor_parse_4bait(nor, param_header, params);
+			/*
+			 * Parse 4BAIT table at the end as this will end up
+			 * changing nor->addr_width obtained from BFPT.
+			 * But other parsers, such as SMPT parser, need to
+			 * know default/current addr_width of the flash.
+			 */
+			sfdp_4bait_param_header = param_header;
 			break;
 
 		case SFDP_PROFILE1_ID:
@@ -1369,6 +1376,12 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
 		}
 	}
 
+	if (sfdp_4bait_param_header &&
+	    spi_nor_parse_4bait(nor, sfdp_4bait_param_header, params)) {
+		dev_warn(dev, "Failed to parse optional parameter table: %04x\n",
+			 SFDP_PARAM_HEADER_ID(param_header));
+	}
+
 exit:
 	kfree(param_headers);
 	return err;
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
