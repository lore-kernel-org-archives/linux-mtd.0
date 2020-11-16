Return-Path: <SRS0=PjdO=EW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3CAC5519F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2020 15:48:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E83207BC
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2020 15:48:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UdN8P0r6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="M+ylT914";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=windriversystems.onmicrosoft.com header.i=@windriversystems.onmicrosoft.com header.b="CgC8ER+6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38E83207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uSOkpLi1N14NIfRZVsmNAsWtWErNxIGgVnHf72r9LQ0=; b=UdN8P0r6hcrNpP0RbA/np8DDEH
	129Z8/s/7vexJ3OYGYzYGcRV7fIv5ADnAlr8YxwZ4UVEyfSG9VfVTrOnb/b+1Zi1VqhD0WnG/GZPW
	+kdSHRHepC7qG7PSL9tcPHgcIFezY9uh5EfG2la6ABkbVBBK6XFRNkGAjGG2OhFgoNfCopW0WSWfi
	CeX0H2XawByNw/azfhCj6iPkm1bC0NFniEtNyvwPfBiz8V+7PwC4RqwTOgNkGYuzAwq3YiHeKEgkg
	c4cOpIAPPWJG/yLIM3fMVglIolWEJ2psPIpNyNTDuRoBrAZBfAzZf2gP5thifH+Tb24YYADED2oLP
	/mD0Ey4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kegiV-0000YG-C7; Mon, 16 Nov 2020 15:46:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kegiT-0000XD-Kj
 for linux-mtd@merlin.infradead.org; Mon, 16 Nov 2020 15:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=sbGqAoIxQIEg2WIoKjrB97qtIBE6NrXi2ENEwXTkczw=; b=M+ylT9142BBGWRloK3SAp0r1+N
 AuauMJHOhlRoLvmBbqN/VL08i3UNM2RDl9+AR0WPt6OPjOgkV29M7EgtlVIUxYRLUMF+zsi0QndSL
 rZz3+v5Xbg4i6txf4ajEelDPOpbDTqSuyEZO2Pdvjsq++l4SF9W4OTankXDCKdUQdxPybSkke2/y3
 XzN6CVdbMMIxqS6qOEJVUfiMSPi6TBydcp7mXYtkyc+zAVRoeSZv+6lNlqOU5Y6KqtgUmapHBePt7
 xmM97NA4v81eLdgH0y9T265zgGAPwR7cDiAj/m9XQZ4o6njfX271yVDSW5ll8bLNj6Fp2fVWkdFYM
 z6SdqR0w==;
Received: from mail-bn8nam12on2051.outbound.protection.outlook.com
 ([40.107.237.51] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kegcL-00010L-1x
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2020 15:40:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mO+xefRR45q0FbenFcuh3rkTK8vPCX34DgCMMymLhVomz8TYHnz0zrkcvUHJhq6J6DKXTBuqnAVgA3SkG4ryyhb+1UvDb0tw6L9NLEmGUkQBZdGkD0ZZS+mS3OMRNCO7TIZ+z2oqKHnbYa9z45hZJaktWEY/vrD1MgsKbPTR46aKdtngHNNl4CQ/lNkSZaGU1ZcjfBFtfr3XgMzQX5UyVt+hhn8eFwYoWp1jBniJv4HiCWGhu6DLpERs8Mh8i88tSlEfD30orUBfRNWIKmh77ziQ7q6qCAB8Y/Euo3Yi8kxWF9rw5uST6gUBz1zz28gyzZNYlsaLVorOqfUKmEl3YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbGqAoIxQIEg2WIoKjrB97qtIBE6NrXi2ENEwXTkczw=;
 b=K/N8rCAFPOasuMS6HqoUkjc4sn8RnYxjw/Kwa/s2AyrKPfrG5RWO1PSHk6tuEyS/xzq3GSRqLxLaKlk5JGiMFeYNcbYMwW/cuUZD5diA+CZmGl9pq0JenQwQ+U6SArS3b21+Sop9AN1wPP+JVeBKqU64dC27/S0vP8HxLWZJBoTp1TlohlIejDhur0aQ9x3xZJKJOL7FkvkMYvg/wy6yaPUNuY4HFNrBW0fFT+970OBb8oYwriyQGPz9A0SHhkXMFwyAH+qcHuU++Sg4pPQLyv6WyAR3q25PUFY7zb16J3fZaapccvOdalty7/fWaDbUtr47tAv9GNs5JRjNuI0Gqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbGqAoIxQIEg2WIoKjrB97qtIBE6NrXi2ENEwXTkczw=;
 b=CgC8ER+6grC3nvC5S7t4MR9G38uz1uMr93W4xwYVCoPSDzEsBvifizfTkc4aHu36yZtQMKSbNhy6+5Y4pWPklaLJkS7tNjSaljFJecAo0ePzy20I2XsVsccJ1TPKsTm7n6WDajCARZVpSFWaP4M2nen50jhA07hv/EDHOA3zWYY=
Authentication-Results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=windriver.com;
Received: from MWHPR1101MB2272.namprd11.prod.outlook.com
 (2603:10b6:301:51::12) by MWHPR11MB0063.namprd11.prod.outlook.com
 (2603:10b6:301:6c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Mon, 16 Nov
 2020 15:40:22 +0000
Received: from MWHPR1101MB2272.namprd11.prod.outlook.com
 ([fe80::e962:4907:63f6:7713]) by MWHPR1101MB2272.namprd11.prod.outlook.com
 ([fe80::e962:4907:63f6:7713%12]) with mapi id 15.20.3564.028; Mon, 16 Nov
 2020 15:40:22 +0000
From: yaliang.wang@windriver.com
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
Date: Mon, 16 Nov 2020 23:39:56 +0800
Message-Id: <20201116153956.588098-1-yaliang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To MWHPR1101MB2272.namprd11.prod.outlook.com
 (2603:10b6:301:51::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-ywang12-u18.wrs.com (60.247.85.82) by
 SJ0PR05CA0097.namprd05.prod.outlook.com (2603:10b6:a03:334::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.15 via Frontend
 Transport; Mon, 16 Nov 2020 15:40:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 617a813d-07ac-45fa-dc5f-08d88a45ede2
X-MS-TrafficTypeDiagnostic: MWHPR11MB0063:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR11MB0063DDB7643FE129862A31BF9FE30@MWHPR11MB0063.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P+a/JJgdo4psd6Frb+v98M9wQujdcNafAtv4p/Ay300WdSmGqcJSj0qZF47HZ7dOu6SXg/btcc9Ew1U4V5u7nDEXqbm2a9YhePJ+t9JUAIhyhvqjHf+gUaam31cc53uxIb4cWDx6ZvqOJNDBMQEmpPcMeX6FeSZ7Aa44oyrqjIlesjh86HXe2ps9Wru5hxlCT8JvVIlcs+Vx78P2L/zhQyFbs9THTWbwQD77XPGxHGl8sh5KB0R94YgJIaAbnIf2iDct3L/cKZRmiq1s+HSVSj8dAGJZA4aBvy6tNNVzBWHMTLO8OA3s8hQZLy8Ml3jG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2272.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(39850400004)(346002)(396003)(8676002)(2906002)(6512007)(83380400001)(956004)(107886003)(8936002)(4326008)(6506007)(16526019)(6486002)(9686003)(66476007)(186003)(26005)(36756003)(52116002)(2616005)(6666004)(1076003)(5660300002)(478600001)(86362001)(66946007)(66556008)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +XGD2W24bD8IZyV4WrBPIBVfmrC2sn2y6eRwEPRRpHuUcr/S3952OSxoWtwgWlprU0aJHLBnzBS6MBe32cOqzG1isTR0flHsGt0itA9cJWQmYnSf0czRRA8QquZW4G6K8SwcB7QXFeu4G6DUQ0VUKJF8ygkeWSF77oJvmHRY/0Hm26UcJ+WthQLLXMW3G8T0vU1v9JGHyHbT1/MNTjOhXKGhktG++kpfY6eKRUhZyqwyQZsNUytigxDYpVFRYiZRN2gEoPNZGGX+oYl3Vmm8g/s1Yk6tdENnw0jViB2cUTf96Hr1Qps13b5SQ2VL82rJlgWezkUenzC/+J4gInGIRObR6iHZtjNVQK7HKAEzBCYFWt6YPkpf97tZTvehO66EpCRtVFDvppAiPg/wE71CMHThSMbWHOy5I6XTZb28iRPY5bDsPdNQpxQBdnWG3pRqCspUx+upsEFtxVCRxlxv5i5KNQc5Nc/Pqzn1rvuPPjzLNtIQs8aKVHNscLNxEImRi17uuA2IUK/cGf3qWry9CUAEdQzYzgHgXmbflCoxyUhrsF64o/I+/BiL959rCz2+ZHrCKK27k78bjVv5tzPB+msRKUc5bKyCf0LZy+x/G6aNjcr2VxMnwWkFuEL1nAxgz4ePZaVCrX3GTKg92mVGjF326IGh15aBDRUc4K6MYfwzDTsuN06Z2fwx5j+vUlrjSL7GJjDGUDr4yWXAPp8Ke6mv5mNzkqI3cl+HXTfOQBh736PuwVomkykUzP2tzQWgUCin+70FhRtC2v4eX34eZ1g3psRztvChifF3v/DK0l1doO9w8NBhQ5l/7HjR08JcSx0IZZN+emY3+Z0M4y5na7t6AHECM0bYiJGggW4LAdagNKeZssLetBWrXtxGUG6QL5/LJ2KAy3b9+1wb47MVbw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 617a813d-07ac-45fa-dc5f-08d88a45ede2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2272.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 15:40:22.5777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpLtbBpxjXjr+B5uu/Naun0q+o4/8Tq9kcxgtY/Mlhv0A1qP4Gm+4b23yHd8uYcBEYx+RyYeKOmOt875l7R2HwyjZgwf0SK9pRAOUGyNycU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_154033_513995_93D8E039 
X-CRM114-Status: GOOD (  19.37  )
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
Cc: Yaliang Wang <Yaliang.Wang@windriver.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Yaliang Wang <Yaliang.Wang@windriver.com>

S25FL{064|128|256}L chips can't recover from errors, when there are
program error or erase error, P_ERR or E_ERR bit will set to one, WIP
bit will remain set to one, A Clear Status Register command must be sent
to return the device to STANDBY state.

The error first recorded in commit <c4b3eacc1dfe> ("mtd: spi-nor: Recover
from Spansion/Cypress errors"). Whlie FL-L chips shifted P_ERR or E_ERR
bits to Status Register 2, which causing the current recover process
doesn't work any more after enabling using CLSR.

Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
---
 drivers/mtd/spi-nor/core.c     | 96 +++++++++++++++++++++++++++++++++-
 drivers/mtd/spi-nor/spansion.c |  6 +--
 include/linux/mtd/spi-nor.h    |  1 +
 3 files changed, 99 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f0ae7a01703a..3aa1484deb85 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -537,6 +537,88 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
 		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
 }
 
+static const struct flash_info *spi_nor_read_id(struct spi_nor *nor);
+
+/**
+ * spi_nor_s25fl_l_read_sr2() - Read the Status Register 2 using the
+ * SPINOR_OP_FL_L_RDSR2 (07h) command.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @sr2:	pointer to DMA-able buffer where the value of the
+ *		Status Register 2 will be written.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_s25fl_l_read_sr2(struct spi_nor *nor, u8 *sr2)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_FL_L_RDSR2, 1),
+				   SPI_MEM_OP_NO_ADDR,
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_DATA_IN(1, sr2, 1));
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_FL_L_RDSR2,
+						    sr2, 1);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d reading SR2\n", ret);
+
+	return ret;
+}
+
+/*
+ * spi_nor_s25fl_l_sr_ready() - Query the Status Register to see if the flash
+ * is ready for new commands. Used by Cypress FL-L series chips.
+ * @nor:	pointer to 'struct spi_nor'.
+ *
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
+ */
+static int spi_nor_s25fl_l_sr_ready(struct spi_nor *nor)
+{
+	u8 *sr = nor->bouncebuf;
+	int ret;
+
+	ret = spi_nor_read_sr(nor, sr);
+	if (ret)
+		return ret;
+
+	/**
+	 * P_ERR and E_ERR bits are located in the Status Register 2
+	 * of Cypress FL-L series chips.
+	 */
+	ret = spi_nor_s25fl_l_read_sr2(nor, &sr[1]);
+	if (ret)
+		return ret;
+
+	if (nor->flags & SNOR_F_USE_CLSR && sr[1] & (SR_E_ERR | SR_P_ERR)) {
+		if (sr[1] & SR_E_ERR)
+			dev_err(nor->dev, "Erase Error occurred\n");
+		else
+			dev_err(nor->dev, "Programming Error occurred\n");
+
+		spi_nor_clear_sr(nor);
+
+		/*
+		 * WEL bit remains set to one when an erase or page program
+		 * error occurs. Issue a Write Disable command to protect
+		 * against inadvertent writes that can possibly corrupt the
+		 * contents of the memory.
+		 */
+		ret = spi_nor_write_disable(nor);
+		if (ret)
+			return ret;
+
+		return -EIO;
+	}
+
+	return !(sr[0] & SR_WIP);
+}
+
 /**
  * spi_nor_sr_ready() - Query the Status Register to see if the flash is ready
  * for new commands.
@@ -546,7 +628,19 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
  */
 static int spi_nor_sr_ready(struct spi_nor *nor)
 {
-	int ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	int ret;
+	const struct flash_info *tmpinfo = nor->info ? nor->info : spi_nor_read_id(nor);
+
+	if (IS_ERR_OR_NULL(tmpinfo))
+		return -ENOENT;
+
+	if (!strcmp(tmpinfo->name, "s25fl064l")
+			|| !strcmp(tmpinfo->name, "s25fl128l")
+			|| !strcmp(tmpinfo->name, "s25fl256l")) {
+		return spi_nor_s25fl_l_sr_ready(nor);
+	}
+
+	ret = spi_nor_read_sr(nor, nor->bouncebuf);
 
 	if (ret)
 		return ret;
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 8429b4af999a..e0ccef793e12 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -95,13 +95,13 @@ static const struct flash_info spansion_parts[] = {
 			     SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_4B_OPCODES) },
+			     SPI_NOR_4B_OPCODES | USE_CLSR) },
 	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_4B_OPCODES) },
+			     SPI_NOR_4B_OPCODES | USE_CLSR) },
 	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_4B_OPCODES) },
+			     SPI_NOR_4B_OPCODES | USE_CLSR) },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
 			      SPI_NOR_NO_ERASE) },
 };
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 60bac2c0ec45..a802f8f9e1e5 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -99,6 +99,7 @@
 /* Used for Spansion flashes only. */
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
+#define SPINOR_OP_FL_L_RDSR2   0x07    /* FL-L chips Read status register 2 */
 
 /* Used for Micron flashes only. */
 #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
