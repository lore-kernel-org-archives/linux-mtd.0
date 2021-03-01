Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD77C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 14:30:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C57EE64E01
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 14:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C57EE64E01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x/ttC3kDfrGqRzkTLmFTBdjXwuL/v5xgQXlkR0P6vJ0=; b=lTw7PeuZS7ckCSku/1DLzKFgm6
	539BcPQaz2PNn/oT05GYuz52oYvlzhBd2QyXkCBc9EU3shCLBJOmyb7bKjSNx7qmmk0sB5UtKKniC
	4CuOF8kVdw/VN0HajAgUiZJXdVuzsMpx827zu0OCNLpFCp5Psq7dZG2LqzPiS1Lf32wJVmFnaILFe
	9WTjXn9qsikdguz87JjZnMowmS182PKshqHCnfAmTIc4H/Wj8H+Qnos3D8Shfjw9KK4+k/hYzvbPs
	eqK6syB1EzUk1z+anwuPsZ9J1DD7QOQtflNWPn6pvx5USKOhrwpx5Nzoz/DDxK9L8A/DG18opnvQh
	m8WRdT7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGjXo-0000Kt-LO; Mon, 01 Mar 2021 14:29:08 +0000
Received: from mail-bn8nam12on2061.outbound.protection.outlook.com
 ([40.107.237.61] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGjXm-0000JU-78
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 14:29:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgB1nu6hb0O7BHfFbys4EgZIF4Qu2Qp1zgCGbJV5LxjhnGs3TMMyUGXz8Eznzb/jmnQaxHwVdlIqdKQkWxIO2NvhxPEY+rkjMkvYaQtuEDsC7r5DD9b2tEbHxd2nUwd3xu7FuwDZiweNNhUQB6SP1+9nUj8IKCvT4w1/DF/V2ABlnZeW6ScvhPCGqxNM2nQxzzWkYcLZX/GEfuGjrk9s8Owu59xIEckVvhc9Bu5AbXxP/1proM74ucmFOK0IIMBfsO6mHNarnqvFuN5ZbfR6Mda6d1vZuSCfnYjT86IEgyD4XEirdPZ410U7YwqSfPLIKsiiVtunHmKywKq3ap5Dbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmRUf/JlmIJvCKyMzw5e95bSIxyazyztnrJHKsTXk/I=;
 b=WuCADqxT2d7S0RMiKzYvyw082EJmHHvkIbB5yrssKW/zwUPM6a5YmHFEpZkNGEFEgRVQ1CUlHVUDsgBAQjxMLNkCxnVpdokGe3SSuxmABFgGS+hYH978ZohE0aOFYGES7GmmFMihIr2w28/Xx+WWEYbT0U9JxJfTMRdO90VLpCRkp5/X2MNkZMGOOnvvgaLWL9+28ecp1b3FAl13Qt5ngE40C80vymei6nuxf8BVm2CjdIC3pwNaWCjrTdDrg4g6JXk4MVzvr+nMMO86t8b/VAcUzSAx2YXM8M+AVPyi5lzfkI/0GLXAe2Sfw3rpXp5DAxhTsCj/MiRvOF2QUC9TQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmRUf/JlmIJvCKyMzw5e95bSIxyazyztnrJHKsTXk/I=;
 b=h6Uj6k20V+GRX4XvzQecwgetEzDSvUoigShGUu4iVV69TjHCPpbyFZEVQQC6iEjdd4kKS8mxlb3Y4a1gF4fwCPRxMAfx/lVBqID/DtALA2WK3mjJnhmVJdivYMD7QGkhBC3m9z6UVvcmT/y1M/ypbQjl28M3dqKBs1+Hz48uvvg=
Authentication-Results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 by SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 14:29:02 +0000
Received: from SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::1402:f204:de5d:c47e]) by SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::1402:f204:de5d:c47e%4]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 14:29:02 +0000
From: yaliang.wang@windriver.com
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH 1/2] mtd: spi-nor: core: move Spansion SR ready codes out of
 core
Date: Mon,  1 Mar 2021 22:28:43 +0800
Message-Id: <20210301142844.1089385-1-yaliang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:203:b0::36) To SA0PR11MB4766.namprd11.prod.outlook.com
 (2603:10b6:806:92::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-ywang12-u18.wrs.com (60.247.85.82) by
 HK0PR03CA0120.apcprd03.prod.outlook.com (2603:1096:203:b0::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20 via Frontend Transport; Mon, 1 Mar 2021 14:29:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c58eaf6-527f-42c1-f9cf-08d8dcbe5c14
X-MS-TrafficTypeDiagnostic: SA0PR11MB4655:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR11MB4655FFF47C3C43BEF9ABC3919F9A9@SA0PR11MB4655.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qjTOV84/ro2pCMMhKUubXhGaSmhpPXWy0sSGEGg04RYVvKuNHLrP8LjnUV5BQ62JdW5BqSNGZ4VcYWOPESBzEZRjnvQRrW18vW9DEVTJ7CvG6Ri4ZCRTV+5KjP5ZQvjmLGTH3pBBk0fIE49lpl2MpuMife6Ta4XOghUdkTyxsATnsFpjAhNa/nNQolzgvZY6f/EmFVOqpK+ksoqIo3k2JqpemutN2pSadX1lIL2N4LgwRVL0r2i+xlioLW+pZW8VERS01FA7oyamEyx9KZlj8LHPbyU3ex84h+/J6K8TRAARDuovfu+i2MM8zNP7eGtUuOdYB/TGSmblLV/hG6CsNxJ5ZqlTN+vV4NkqRVdRp6K0xAxXWnuz5+5xkwONhe5pc1QPjrlURjZYN76hbrs/OMDK6qYv+WUyVOy4gzDY+U4XiZsHAPN+F34hWJYSQMApFvAT0tqnjWiw2mXefwawBmw8l51c0Y0kuJknBVLZZ2gCkavQ/KqIte2/vJ1DeWMQ4/3/zfVrfNzns1l9q5w9lQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39830400003)(396003)(2616005)(8676002)(83380400001)(36756003)(107886003)(316002)(6666004)(478600001)(6486002)(6506007)(6512007)(1076003)(52116002)(956004)(186003)(5660300002)(9686003)(8936002)(66556008)(26005)(2906002)(66946007)(66476007)(86362001)(4326008)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?eNioyFBAkxpaUKKT5DuAITgMhXuEw7fSbgv99CXN2oA+EaYPfGKGKXJ5JB53?=
 =?us-ascii?Q?Cm8gmfY6myXigILzUZLcqimqy8VGhHuPDMpaN0ppEwb6nBvG2lT3y+jsyNIG?=
 =?us-ascii?Q?8DYG07jH6l6dXrbcHKSkZIPo0DCQxoodCm0bb2zTQ7Qah0gJfa6qkn5dlZzu?=
 =?us-ascii?Q?znwgV7qPxRTxYX7TJmbs1trjboYNqBr5trtzXG9qBITUh4RuhTS2cyIG06sW?=
 =?us-ascii?Q?/ttcwantthTGoaWY3DjZ19NqNJO26oOjInI0WP19N89Z9fDzXGRpHkcaVzdr?=
 =?us-ascii?Q?tYPA26YRu2XQtzD0AiNIgU4jVB5hI2Xkq3o9Ny8mGv2otDIUeyRBf9txxoas?=
 =?us-ascii?Q?gdtyn6Hs63Fr1M49FYCsTknsevfXKq/csReu5SV8OR9Q/M2AnqiN5+1aeIBb?=
 =?us-ascii?Q?DF+4gMXwh36RbO7Yg07O6EqKmT62obpAcDVO+ixE+2k3q5I8QSiSFpXN6K92?=
 =?us-ascii?Q?hIsaFomwm/H/YkJb/JYNfmbTXBV+IGhY1vA/fsua9fTQzc3CvmLzfYHSBgoN?=
 =?us-ascii?Q?QVs26BPiZYQ8qy7w19rPnBLlbcsQQZ+MxJYoTY2ubpZxJqNdxUz5ojD8BkTl?=
 =?us-ascii?Q?b7BF9EUFw7/WIB9nPPs/sGx/aGMIecGFuQTrr7I6WuTCC9dS0qpI9vBOjTcJ?=
 =?us-ascii?Q?ojot7iZiIvmowAd5jPiCqFMLEI/aK4LpWk5WoqHzhIzQ6ahMDZOmhlgYnXve?=
 =?us-ascii?Q?yO3FoAsuAbGNtNIYLNtadOIm0BUtRJvZHZgTjMOqjrTYVFh6yH8v6e2UUjNo?=
 =?us-ascii?Q?fmb8rW3hZZn693mUcnxn+9dctUEoLM/kDMV3EMWurBbOvf+LjTmmCqEUsfC5?=
 =?us-ascii?Q?e9W/pdYJJ7vCd0hUUJE4+rpNFOLyzwA8Th0KajVe/qw6RxBnh5pq66ovLOcY?=
 =?us-ascii?Q?tt2GPAW/VUpY7cDNss/g++ghab7euYK0u+AvOIUF9LZWgmOH+EM6xtYai1Gy?=
 =?us-ascii?Q?AiTBuUukB6h+q+hasP+j/1GIfPkAf3q5qM+kXnrHmboJwAh+bW0NpRKnT0cB?=
 =?us-ascii?Q?dDPV0we3lD+FC2rxUErqu16SOUmdkgPPlgMLyzI0oJI95sYVD6kJSoWmwP8R?=
 =?us-ascii?Q?TIz9e0bgEcy0BmYsu0fapjxGThMW4gS7qSd7M2ndNkSdHJyVYVOs7X/eefOJ?=
 =?us-ascii?Q?D3Kj4yWqm6Ls5Ix7uHZAOF2fw7dNWmHkUPD2NIbIGbt6bQuN6KgQaICoR/PJ?=
 =?us-ascii?Q?VMSD9HSUNBmU/6I4+Nkv2BIX8NMNYB52sVZIhhADqyngCw0JHPFwkEGe0eIc?=
 =?us-ascii?Q?P2agBV/w/2zy91xMA/tL3jyS9rr83m/+lxzXCe/IlPno7XgKkc6oDEPYTTBY?=
 =?us-ascii?Q?kZAwqK/DNMAzsx/zN0YYE0BS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c58eaf6-527f-42c1-f9cf-08d8dcbe5c14
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 14:29:02.3922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTKURt2HfAiuywA25L29XQT50f9tuuAtGgoWmTIoeKrvkT326BKHH0+ex4/Nv3MqoqIIlaCcQTzDNxNHodNIO6cxhQKAgYx5RqG6FhKIqyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_092906_419754_F8FC74B0 
X-CRM114-Status: GOOD (  23.14  )
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

To move manufacture specific checking SR ready codes out of core, set up
an extra method "sr_ready" in struct spi_nor_fixups, by doing this, the
manufactures can fill in and initialize the method it in their own
files, and leaves the core a relatively clean place.

Spansion's checking flash chip ready codes are moved out by applying
forementioned "sr_ready" method. There will be several following-up
patches for moving "xsr" and "fsr" related codes out of core.

Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
---
 drivers/mtd/spi-nor/core.c     | 84 ++++++++++------------------------
 drivers/mtd/spi-nor/core.h     |  8 ++++
 drivers/mtd/spi-nor/spansion.c | 70 ++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h    |  1 -
 4 files changed, 101 insertions(+), 62 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 20df44b753da..74729eb89947 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -157,7 +157,7 @@ static int spi_nor_spimem_exec_op(struct spi_nor *nor, struct spi_mem_op *op)
 	return spi_mem_exec_op(nor->spimem, op);
 }
 
-static int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
+int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
 					   u8 *buf, size_t len)
 {
 	if (spi_nor_protocol_is_dtr(nor->reg_proto))
@@ -166,7 +166,7 @@ static int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
 	return nor->controller_ops->read_reg(nor, opcode, buf, len);
 }
 
-static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
+int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
 					    const u8 *buf, size_t len)
 {
 	if (spi_nor_protocol_is_dtr(nor->reg_proto))
@@ -175,7 +175,7 @@ static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
 	return nor->controller_ops->write_reg(nor, opcode, buf, len);
 }
 
-static int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs)
+int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs)
 {
 	if (spi_nor_protocol_is_dtr(nor->write_proto))
 		return -EOPNOTSUPP;
@@ -649,32 +649,7 @@ static int spi_nor_xsr_ready(struct spi_nor *nor)
 	return !!(nor->bouncebuf[0] & XSR_RDY);
 }
 
-/**
- * spi_nor_clear_sr() - Clear the Status Register.
- * @nor:	pointer to 'struct spi_nor'.
- */
-static void spi_nor_clear_sr(struct spi_nor *nor)
-{
-	int ret;
-
-	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_NO_DATA);
-
-		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
-						       NULL, 0);
-	}
-
-	if (ret)
-		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
-}
+static const struct flash_info *spi_nor_read_id(struct spi_nor *nor);
 
 /**
  * spi_nor_sr_ready() - Query the Status Register to see if the flash is ready
@@ -690,28 +665,6 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	if (nor->flags & SNOR_F_USE_CLSR &&
-	    nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
-		if (nor->bouncebuf[0] & SR_E_ERR)
-			dev_err(nor->dev, "Erase Error occurred\n");
-		else
-			dev_err(nor->dev, "Programming Error occurred\n");
-
-		spi_nor_clear_sr(nor);
-
-		/*
-		 * WEL bit remains set to one when an erase or page program
-		 * error occurs. Issue a Write Disable command to protect
-		 * against inadvertent writes that can possibly corrupt the
-		 * contents of the memory.
-		 */
-		ret = spi_nor_write_disable(nor);
-		if (ret)
-			return ret;
-
-		return -EIO;
-	}
-
 	return !(nor->bouncebuf[0] & SR_WIP);
 }
 
@@ -792,18 +745,27 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
  */
 static int spi_nor_ready(struct spi_nor *nor)
 {
-	int sr, fsr;
+	const struct flash_info *info = nor->info ? nor->info : spi_nor_read_id(nor);
+
+	if (IS_ERR_OR_NULL(info))
+		return -ENOENT;
+
+	/*Chip specific method for querying whether the flash is ready*/
+	if (info->fixups && info->fixups->sr_ready)
+		return info->fixups->sr_ready(nor);
+
+	/*Manufacture specific method for querying whether the flash is ready*/
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->sr_ready)
+		return nor->manufacturer->fixups->sr_ready(nor);
 
 	if (nor->flags & SNOR_F_READY_XSR_RDY)
-		sr = spi_nor_xsr_ready(nor);
-	else
-		sr = spi_nor_sr_ready(nor);
-	if (sr < 0)
-		return sr;
-	fsr = nor->flags & SNOR_F_USE_FSR ? spi_nor_fsr_ready(nor) : 1;
-	if (fsr < 0)
-		return fsr;
-	return sr && fsr;
+		return spi_nor_xsr_ready(nor);
+	if (nor->flags & SNOR_F_USE_FSR)
+		return spi_nor_fsr_ready(nor);
+
+	/*Common method for querying whether the flash is ready*/
+	return spi_nor_sr_ready(nor);
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index d631ee299de3..36356f27ee92 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -253,6 +253,7 @@ struct spi_nor_flash_parameter {
  *             parameters that could not be extracted by other means (i.e.
  *             when information provided by the SFDP/flash_info tables are
  *             incomplete or wrong).
+ * @sr_ready: special method for querying whether a flash chip is ready.
  *
  * Those hooks can be used to tweak the SPI NOR configuration when the SFDP
  * table is broken or not available.
@@ -264,6 +265,7 @@ struct spi_nor_fixups {
 			 const struct sfdp_bfpt *bfpt,
 			 struct spi_nor_flash_parameter *params);
 	void (*post_sfdp)(struct spi_nor *nor);
+	int (*sr_ready)(struct spi_nor *nor);
 };
 
 struct flash_info {
@@ -471,6 +473,12 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 			     const struct sfdp_bfpt *bfpt,
 			     struct spi_nor_flash_parameter *params);
 
+int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
+					   u8 *buf, size_t len);
+int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
+					    const u8 *buf, size_t len);
+int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs);
+
 static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
 {
 	return mtd->priv;
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b0c5521c1e27..67619b64c148 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -18,6 +18,7 @@
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x3
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
+#define SPINOR_OP_SPANSION_CLSR			0x30
 
 /**
  * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
@@ -175,6 +176,74 @@ static struct spi_nor_fixups s28hs512t_fixups = {
 	.post_bfpt = s28hs512t_post_bfpt_fixup,
 };
 
+/**
+ * spansion_clear_sr() - Clear the Status Register.
+ * @nor:	pointer to 'struct spi_nor'.
+ */
+static void spansion_clear_sr(struct spi_nor *nor)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SPANSION_CLSR, 0),
+				   SPI_MEM_OP_NO_ADDR,
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_NO_DATA);
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_SPANSION_CLSR,
+						       NULL, 0);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
+}
+
+/**
+ * spansion_sr_ready() - Spansion specific method for querying the flash to
+ * see if it is ready for new commands.
+ * @nor:	pointer to 'struct spi_nor'.
+ *
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
+ */
+static int spansion_sr_ready(struct spi_nor *nor)
+{
+	u8 *sr = nor->bouncebuf;
+	int ret;
+
+	ret = spi_nor_read_sr(nor, sr);
+	if (ret)
+		return ret;
+
+	if (nor->flags & SNOR_F_USE_CLSR &&
+	    nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
+		if (nor->bouncebuf[0] & SR_E_ERR)
+			dev_err(nor->dev, "Erase Error occurred\n");
+		else
+			dev_err(nor->dev, "Programming Error occurred\n");
+
+		spansion_clear_sr(nor);
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
 static int
 s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
@@ -291,6 +360,7 @@ static void spansion_post_sfdp_fixups(struct spi_nor *nor)
 
 static const struct spi_nor_fixups spansion_fixups = {
 	.post_sfdp = spansion_post_sfdp_fixups,
+	.sr_ready = spansion_sr_ready,
 };
 
 const struct spi_nor_manufacturer spi_nor_spansion = {
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index d13958de6d8a..43bd66204fdf 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -100,7 +100,6 @@
 
 /* Used for Spansion flashes only. */
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
-#define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 
 /* Used for Micron flashes only. */
 #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
