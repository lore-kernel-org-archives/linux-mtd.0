Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F332F606A339
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 11:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ik83Ytn3;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XsCyIOrs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QNBcw8TvlV5fB7JNauNB4NDn1hZYdoRsPwWel/MLWdI=; b=Ik83Ytn3AxT+ytIvSsGmHOS0/N
	Wgz7bHsKam9K1TYSey8A0NFWNvlmDxJJKCRv9VqUyaPTyPB6J/BqGyPXJpAF2ofSLKRtGNq7olbUF
	ENoEosIkysOtSkNp3dSQpgQSSeMaTTmgL3SJMiNn59sA92hN6VZnuvNmgxRAmQWkIE3YOG+mlmKkq
	iXamNTWehdLl3YE4+XhNQvQvmychZy7T92xaMT9c7V7QCmpQ3W1mvm/qDpLn5ic5gQt8we0CnNAo4
	Ht8Pg2onL/ZSuYMZJBM+yPsg+gASfG2VdCgxMCi6tHkXum66fFeqcl6d27UvXaarS3PatdSgtwC5u
	d7dOF5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMNz-0000000Egrd-2sTf;
	Fri, 20 Nov 2026 11:02:31 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMNt-0000000Egpa-3ZoN
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 11:02:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKO5s+HxdhpPUZJwkJ14g5GHTMuHN0r3PMso3ksoQZ2cwY2utjqVpXhOPoiMOFpmUVGwIwQpIe56kidQAFQC9e4oSsz7HZsyW2suU7buGBa9uXH8CEUGAXoMjlElbM7PkkRPtumdmMbB44Qcq+HdA0crXS9cU1ue5JkiG1Adp3pdDABpAC56xT9GYkqGcZEklQUKt1mwtJXZkSUaqLXCuQGBPkDN27F8myZDin8IDc/49J6N3pphj6nzHKglS2kfJdLZzewJOPxX3+qTGr2IVtqJcZ9yNE6nB8M901/rBBuLHXXnnsZnICh/50yOEYEac8OnbpvK0uz8owdGwLlPiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP0XC2aajtGff3NEDHDUBa4V6oIMBhyR9mJOrCkPtkg=;
 b=aVMFw49REIcoc5jqqGgzzozTSk5p6SNP5KKmnpP5yKUhldTaFqsRWnEq0oSMdKWckmiOrA41x0qM3lzL3Y5ygzBbtjgkNuuebeiUcgkC7YzpFKOXtHwfQtKFHd2wmHHwo2cZVe+5I/Vou7VTJ89FIaPf252Qe1taL4LSpilC5ZC5L+vko4wRJqcT+1uVVzmCtjbdfPm63KgT4niMHrkrpS0h4zRt9luP3IBtlHzPwzFDeR9T/eRemWxIkghJT1ytSQMQc+mV2NmeDgUeQ/YvsWzRJnpd9Ps9+vqFszUCdN2j+ylkG4d5SDNOAEku6XiM5uNyEBILwmMc37sh9q2Bqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infineon.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BP0XC2aajtGff3NEDHDUBa4V6oIMBhyR9mJOrCkPtkg=;
 b=XsCyIOrsFtr4/5Ae1i5WgaD0/bKiFdKzv566wman6jXWfllH3uBzohaWcYDeJnPos40p3ZY+P69E26TFK/KPhrj3+PMTHeifs9HlC40iAw07uY5lSLf0tY/qYdAxLnlLajuGY4gqti1uWBNsaCaHQny0JqiT5MTqdV+KBlmKddA=
Received: from BN9PR03CA0868.namprd03.prod.outlook.com (2603:10b6:408:13d::33)
 by MN0PR12MB6055.namprd12.prod.outlook.com (2603:10b6:208:3cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 20 Nov
 2026 11:02:17 +0000
Received: from BN3PEPF00022BD4.namprd03.prod.outlook.com
 (2603:10b6:408:13d:cafe::9a) by BN9PR03CA0868.outlook.office365.com
 (2603:10b6:408:13d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Fri,
 20 Nov 2026 11:02:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD4.mail.protection.outlook.com (10.167.248.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 11:02:17 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 05:01:45 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 05:01:30 -0600
Received: from xhdlc220225.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 20 Nov 2026 05:01:27 -0600
From: Srikanth Boyapally <srikanth.boyapally@amd.com>
Date: Fri, 20 Nov 2026 16:31:14 +0530
Subject: [PATCH 1/2] mtd: spi-nor: Store GPIO info for resetting device
 during resume
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261120-nor_11_20-v1-1-70332a54037f@amd.com>
References: <20261120-nor_11_20-v1-0-70332a54037f@amd.com>
In-Reply-To: <20261120-nor_11_20-v1-0-70332a54037f@amd.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<michal.simek@amd.com>, <git@amd.com>, Srikanth Boyapally
	<srikanth.boyapally@amd.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172476; l=2242;
 i=srikanth.boyapally@amd.com; s=20261106; h=from:subject:message-id;
 bh=cOJJeNpB8RoJUzTG7to/wJlk7aBf7zq9lEsviU6B7X4=;
 b=lOGkY7Fn/mxd0DEWjajwMAuqLJd4fKzayOTJIgKH8mDC4X5BX5uSXz+rRMZn+AjUfM849xVwa
 WfkbzD/+SS7AMNCYTb1gzHB6QW/2gIdpw2D5Y7kX1tuAQZ63AnNRpyv
X-Developer-Key: i=srikanth.boyapally@amd.com; a=ed25519;
 pk=VZiIwz5+m6FvZJ+3hzpXDQl0u531OPVeBcB2OVGeZVk=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD4:EE_|MN0PR12MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: cb76ef50-e08a-4484-a7c2-08df46f5bdad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|261028144727099003|56012099006|261026140227099003|11063799006|261021121427099003|261021123027099003|261022105027099003|261102123227099003|22082099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: QvXtQlRoGAswUOh8v9V7leot5vAvI7JGL290S3b3UcjSiuFErsj9aGfBsuQXIhJgI2E77rbjNCxNg7R1jnP+bfxGEOB5BjOA2dhOG7Ugo5dqOwOCSIyF5l9q7XeqTZOWBBd4VScDFCA1Dwb0ckmsJ9ff/FslsplVJdvb0XgbHOSwTmn2wzchK2AOXxTbokPT51Bfl5JGVarDvSDvE5gzwKd0/eUwmp4zlyAqd0SwBug08NRGEkEbXz5it84TzCpV4XIZAH6wBWbJqPF6hoE7D0BFgnz7H3VpkaaYX+TAw/O6VUgutLntHvZHpDEXpHsdC86XY1/p17lsN3Kgc6mX+3qFF9B6FaiHteIA6rXc12ZOLAbV1JT4BvKOcRd1eGCU0Va5Ds6UY5JD8bzcbHnrCFZGkvcMa/pp3z2EKVyKWdNWtdKnKid+/IeLl22WEx5fEGuPMboheiqTfySco94DkKiroDTc7HIAUbiqnWxWf4OacVfGlyk63jgbVED/CmvXnJGI4D40hv9zHrG84CF1mIin+uaE260oTM534CBoXsrItTlYe05ydBqxXew0ndDwObQjuPh0it9L8Y9h5WIjenSgUGNH2Bsut0UivbrFuja4ihEaWLgJAxQAXvzZi+Mc8VLJoX9QuY/31TkSmBfPLhl7/Ya/raGNXys24gwQIlO43DSQv4YsYjUWojWtaOAt00n9l2kXxR5nEGIx7eNluw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(261028144727099003)(56012099006)(261026140227099003)(11063799006)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(22082099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sOrxWonGE8QXNMDNG+BTGEwfUK7liEnpLuiLLTrTnbGCFfHtT4PYVT3aLtZcm0OzH9Yhgfen/C8ox59iLM0Vf0SKL5IpJlCl8Aeak2mOQjedtUXS20wkfMntwSXy7vkn312y98Rm1h6BVzh+ehRpjBnq945oEjcb9TxQRKPIAt4d1YC8L6I6SJ+zMEek3YOWpV9caqTQI1jtGUvO43QOGdO4qAYkoVtlBMKhAXIpP0DI1BGUNZOewIi4wRBtgSMllQ1+7mH7jfpNf/AOTulUv4olmLMCah8OmlF5SBw4rrZT67SLSmGrebJZ18OG021n4SNYk/2pC9lZCGUJkbuBY9j2KyWkcZcduzSXekTA30OGAu9YqyLLC/wSfA6dFJwI+92CfwHZNiaPWztIvGlEkN/2d2X1OOFAGQVpIghsGuqbVhWOCTLEqNsMMRD0Kj5X
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:02:17.2722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb76ef50-e08a-4484-a7c2-08df46f5bdad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030226_034908_6E22D8B3 
X-CRM114-Status: GOOD (  16.09  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

Upon resume, SPI-NOR triggers the hardware reset API to reset the flash
device by toggling the GPIO. This step is necessary because after resume,
the flash needs to be put in SDR mode. To facilitate this, SPI-NOR needs
GPIO information to reset the flash device. Therefore, a gpio_desc member
is added to the spi_nor structure to retain the GPIO information and
utilize it for resetting the device.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Signed-off-by: Srikanth Boyapally <srikanth.boyapally@amd.com>
---
 drivers/mtd/spi-nor/core.c  | 11 +++++++----
 include/linux/mtd/spi-nor.h |  2 ++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 90524c58602e..11227f8fa8ea 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3389,11 +3389,14 @@ static int spi_nor_set_mtd_info(struct spi_nor *nor)
 
 static int spi_nor_hw_reset(struct spi_nor *nor)
 {
-	struct gpio_desc *reset;
+	struct gpio_desc *reset = nor->reset;
 
-	reset = devm_gpiod_get_optional(nor->dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR_OR_NULL(reset))
-		return PTR_ERR_OR_ZERO(reset);
+	if (!reset) {
+		reset = devm_gpiod_get_optional(nor->dev, "reset", GPIOD_OUT_LOW);
+		if (IS_ERR_OR_NULL(reset))
+			return PTR_ERR_OR_ZERO(reset);
+		nor->reset = reset;
+	}
 
 	/*
 	 * Experimental delay values by looking at different flash device
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3e3c6b10186..46b1f92a490a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -374,6 +374,7 @@ struct spi_nor_flash_parameter;
  *                      settings that can be overwritten by the spi_nor_fixups
  *                      hooks, or dynamically when parsing the SFDP tables.
  * @dirmap:		pointers to struct spi_mem_dirmap_desc for reads/writes.
+ * @reset:		GPIO descriptor for device reset.
  * @priv:		pointer to the private data
  */
 struct spi_nor {
@@ -415,6 +416,7 @@ struct spi_nor {
 		struct spi_mem_dirmap_desc *rdesc;
 		struct spi_mem_dirmap_desc *wdesc;
 	} dirmap;
+	struct gpio_desc	*reset;
 
 	void *priv;
 };

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
