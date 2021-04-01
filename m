Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146DEC433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 19:54:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77DA960C41
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 19:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77DA960C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kbn62FP83uglVcAtyGHT3KP2+WzrkE6d0HD0NRQEydM=; b=QhJfV8lXlZNVLtrXcTOxCS9cL
	k36pXqpiCdmBW+4KN3KjWmIZST/7wd79T2P9uE9tjzByleTxlCFSH9fioIklrnVpg8mmUfnda3ZPN
	BPCfSNCssRkwy/zcPQoQFrwS0yJyCVd8cKmrSBE5rRneAQHf4z0fFwQyEC5MwTZRuWW6/jLsxVrj1
	AE+mrBy3FxUJu5ZBXGGfeDGMJFPlJUuUQdyhvImWp00oQ5Kwa4l2KfXI2juhd8aVxFOqGBDwM5ryT
	gxg04JGGZV1LFT9dMmSDiz7fMYUQiGtVWAUNwrRqfasYDJOnxSvdKbpN0yNSmU8Dv1ursgrnKW+vl
	rfGEZcKtQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3NR-00AqUW-Lh; Thu, 01 Apr 2021 19:53:13 +0000
Received: from mail-mw2nam10on2075.outbound.protection.outlook.com
 ([40.107.94.75] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3L7-00AqKx-Ga
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 19:50:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5t2djkucNgNrj4mcWUlghS4W2G64I+ptf85kS4P6WkmnHsprmNFAHmt0no48vuMPpMUNsRdK7aEkWtnUiF/xDAm1ShhJyL8swbLwje4Ye7ZoH5Hzuj4IBqKvUQDpDfZuB7vV65AARpvfsr+I2sjCaEPco1KgBvd/LTmN2T1ZvqP8qYzoftc0IiczdJBOsRtxEXwk8tGMx8lm654GopCkFSq6S+x/w84voYVwr0N49zA+qysSzIBZ75aSNa53p4fzLNSaMnN6zLWQom4v/pA8LEVMCYtOlFQLqbAqnU+K40b1mwjYN0umGdsUrZ+OQDXvTrlNbqbBagxGJ8tXI2URQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWTkG51LnAEhpez3qhpS+EyZvHSAqefQOkotEkpr1sM=;
 b=UiezCB8gSeZokxbZtzGvX0cDJupnO/uVremSHirH+s3mHk7GPM/SdNrcx/VUCO2fKp2TZEFD6j0yucKkvzhyjvMJ9DU6DINH4lbQTsoZT7PgTLWNPIOURHJh9f3wI6TRA+KGpAZ9dPU/gjgRCSeDSpNbNoWwDf7zA/lMYIK0DVlttTegBBtrDAFYUcv1OYAmTImwBuMXZJ9OnJky7ucuFDjnivx2sNw7kTXCNTKIF709x0lGDX0gEC4C9d7lR96zeH/VsXzAnr1UfESsyETkMc7eoTGJyPOxQ40m6FNS0JKC8OmIksgQaHkzwwluRwimVlUVvl9nMOYKpqL+Kll6xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWTkG51LnAEhpez3qhpS+EyZvHSAqefQOkotEkpr1sM=;
 b=HTaPapvVNRsPrgBo4vhn/sqOvyC7xz2cIRpyKnJGi0twyeqCdWICfv5iRN5P57rJoVJtw+/+1cOp8ez+iQRdNj4YTxgWYlB9VSMAST+Js4lcsNaLA8XdI8KESD05ektSxDNYYSDl7+U23fJm97nPeOpV4e3MhymYFBT90JAl+i8=
Authentication-Results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Thu, 1 Apr
 2021 19:50:33 +0000
Received: from SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d]) by SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d%2]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 19:50:33 +0000
From: yaliang.wang@windriver.com
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, tkuw584924@gmail.com,
 Yaliang Wang <Yaliang.Wang@windriver.com>
Subject: [PATCH 2/3] mtd: spi-nor: core: reuse spi_nor_clear_sr function
Date: Fri,  2 Apr 2021 03:50:11 +0800
Message-Id: <20210401195012.4009166-2-yaliang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401195012.4009166-1-yaliang.wang@windriver.com>
References: <20210401195012.4009166-1-yaliang.wang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0099.apcprd03.prod.outlook.com
 (2603:1096:203:b0::15) To SA0PR11MB4766.namprd11.prod.outlook.com
 (2603:10b6:806:92::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-ywang12-u18.wrs.com (60.247.85.82) by
 HK0PR03CA0099.apcprd03.prod.outlook.com (2603:1096:203:b0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26 via Frontend Transport; Thu, 1 Apr 2021 19:50:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccb9c58c-5245-4fed-11c8-08d8f5476924
X-MS-TrafficTypeDiagnostic: SA0PR11MB4766:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR11MB4766C01714BEBBA1310F4FB59F7B9@SA0PR11MB4766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UTVTZ6JjAkpbAbGBc1TuH/BYP5TDTfEIYdt6xV+ttgW+tJY7cB4sVTLox51hcLk9fYD0SEMqd8M0TuSjMX98GsOvRfvFbDHvLh6MOSSoDPE7HAAd7A/ZpuYb2O2jIy/xH3K+KUaJmAasodr0cf6ZtdIQmqJXk6INeq91dAJN7GJw31fy3EdHNBKPi+xG2a5oNAyd3HZ4f6TUVlo0D+SJtl2xdZGZaFVj/R1YANgzWUWGUJlMI2AhVNN/agJfdAPD1/pr/INFyPLCiX06o88EHQCEOCetDbKarqCQAO8cPGNm4jJBRv2JnbVALxwlROSrEC29cBXmQarKByic3X4vKYQj0j/7Zx2Ivgm9ef6yrQU2xvpl2JYGxpM9vVqloM7FtZIIMT4yUkqQAfnfjUhEQvxvwIJaMb73JW41QXAQMoP44UK062NzQmFHYhjVbueEn08uA/H1MlsZsYp5FZUJ+PT9oJAz7sj/VPIJO/LC0wYhoeblohXZeLjTVwDgxoERzmsRZ2ORWVzZ9aNroaqhbEFZgtJ82e25jOGCgw2QNXuQPsH3VyoN12+fH4lTfvis848LjeUfdRpyJhJ+7VizaZkLW199UdR6/TXywv5Veef/bmPQOu0p4zy34AmJyV/hyMeWxFdO3I0FSQvKbLFzeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(366004)(396003)(136003)(346002)(316002)(478600001)(186003)(6666004)(2616005)(83380400001)(52116002)(2906002)(6486002)(5660300002)(38100700001)(4326008)(1076003)(107886003)(8676002)(6506007)(86362001)(36756003)(8936002)(26005)(66476007)(66556008)(66946007)(956004)(9686003)(6512007)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oztvnCCPxJ++1QSZxU0kDIhPhsw3ShnF8F/GHJpso8Fl8cTIRo8eXVtTJ1Us?=
 =?us-ascii?Q?eGo4o0uy1BesNHXS2r+pHF8MWFJDkn1oWlmlsOp+IuQlDINhKuQTLvQ0TWQJ?=
 =?us-ascii?Q?spMMZmXIKaLYB8d8tavPSoXSBLIbCFUj07om1VpCJg2/kOvQ1YfLoBVCytRx?=
 =?us-ascii?Q?gbaMUuk9fU0yEr6YjrI9jH+wORC8bKhe0WOhefWNjitH1gTyYFSnag6lKzeG?=
 =?us-ascii?Q?rVIlQ99PnyoqnYw3oUiWzTz+357efL0ZJZvVOF6UcP87aYnlpZMKQGw+1+pF?=
 =?us-ascii?Q?5TGiwKvrGq7CubDFEZBeMm1dt/42GzmlD9vEMkbnWIR+zdFWrM9khZvpYpk6?=
 =?us-ascii?Q?l9MSOzhgpY+tyeE75dF5ru5Tvbvr+B3JktmCOERO/OX8AWxKqu+7VJc0snct?=
 =?us-ascii?Q?M+0ug1prM8I4C9iUN8aSf0ibGjvKAJ54046s4DBOosMiFXfEtt7ZOQQhXgbO?=
 =?us-ascii?Q?agAKL9hDQtWmGcAsVy5NwrLTA3VrVTnVcGVOMLHT6lsSotfkSlSkiG6+tRmd?=
 =?us-ascii?Q?fksDzQI9tD/G3l2H+7TiGH3xncL+jmbsl+yE8BHNV+vG8Ju4/dEcvnAzbuyI?=
 =?us-ascii?Q?bG/JUWSvmUbT8FFYkkuKEaeF9sbTGFWDuIGSZk93vMebJnW4yRDhWFEm/q5a?=
 =?us-ascii?Q?7tsGGg/dUExYApaIX33rCwD/cPJ8UKUuMM/JvEPU91Bbo9vfIrv4vo6C/yyZ?=
 =?us-ascii?Q?yF94H1h7pUakhfMYSlJsX6phqBx3eEao12UsNrLKssI8/dtmXBrroXIAQO9U?=
 =?us-ascii?Q?E15Rn1wmBW+nU8xg5DrjhMBxhmTzWR5HY1GDHeVd+DzKsaarSNdPE4FdluAf?=
 =?us-ascii?Q?P+eD+Lb2mYQKhk5coJaQCcGad0kO/ijcmuHPU8VV5A0oRSvWo0dQx+KuudiV?=
 =?us-ascii?Q?7FN3aueObP2CCPfIe02VXXu3QrTVu1i6ly4M81rb8h9dZt9TMBJ3lQXG/Z9V?=
 =?us-ascii?Q?hqoUvN6/ICycOxNs2qUk6X7uibAh2tFBnLOmu/YDPT7qzUncTjymhfw0LBCK?=
 =?us-ascii?Q?V9rN0DnFCJiBnBmOvqgvGhGhdGr5FO/wCKVbRPED9UYa3NAET1qmDUvirUE2?=
 =?us-ascii?Q?ZETtzECo2Z9CMC6Ffs7VzgAdFZV4iocccFSvdOGsfkbUr0h8asSvbbM0gmAM?=
 =?us-ascii?Q?asxTTZIGksIffomeTYeRFHxTwgjbmezy4X6eY7G0nWr3zIO/gV6Zg6kN7EiS?=
 =?us-ascii?Q?OM5EpYkHF9yuTjNgb4w1eJTe5Uspm9C+5SUls0B1lhtdjp2vZUBx1svVQ6XQ?=
 =?us-ascii?Q?x3iHBlX5ID9hM9BDhKRPpOvf5Nhk4zg6xx0kYMil9z50hooxywcByI6xcd9H?=
 =?us-ascii?Q?gfEh1QJgEuJxsXAEh1Je6onM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb9c58c-5245-4fed-11c8-08d8f5476924
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 19:50:33.0560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RopUFf42ouix7u5GKfkNxtpu3UFo5LTIJ76iawCWXSM2fzZE8+UZY7MxPvNWO+Vchsq3pZxYkyI6nzNx7CAp63cRro1e7wxpyxAt+6ggtAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_205049_685263_2CE9A488 
X-CRM114-Status: GOOD (  10.78  )
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

From: Yaliang Wang <Yaliang.Wang@windriver.com>

spi_nor_clear_fsr() and spi_nor_clear_sr() are almost the same, except
the opcode they used, the codes can be easily reused without much
changing.

Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
---
 drivers/mtd/spi-nor/core.c | 40 +++++++-------------------------------
 1 file changed, 7 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 6dc8bd0a6bd4..dbd6adb6aa0b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -652,14 +652,15 @@ static int spi_nor_xsr_ready(struct spi_nor *nor)
 /**
  * spi_nor_clear_sr() - Clear the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
+ * @opcode:	the SPI command op code to clear status register.
  */
-static void spi_nor_clear_sr(struct spi_nor *nor)
+static void spi_nor_clear_sr(struct spi_nor *nor, u8 opcode)
 {
 	int ret;
 
 	if (nor->spimem) {
 		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),
+			SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),
 				   SPI_MEM_OP_NO_ADDR,
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_NO_DATA);
@@ -668,12 +669,12 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
+		ret = spi_nor_controller_ops_write_reg(nor, opcode,
 						       NULL, 0);
 	}
 
 	if (ret)
-		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
+		dev_dbg(nor->dev, "error %d clearing status\n", ret);
 }
 
 /**
@@ -697,7 +698,7 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
 		else
 			dev_err(nor->dev, "Programming Error occurred\n");
 
-		spi_nor_clear_sr(nor);
+		spi_nor_clear_sr(nor, SPINOR_OP_CLSR);
 
 		/*
 		 * WEL bit remains set to one when an erase or page program
@@ -715,33 +716,6 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
 	return !(nor->bouncebuf[0] & SR_WIP);
 }
 
-/**
- * spi_nor_clear_fsr() - Clear the Flag Status Register.
- * @nor:	pointer to 'struct spi_nor'.
- */
-static void spi_nor_clear_fsr(struct spi_nor *nor)
-{
-	int ret;
-
-	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLFSR, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_NO_DATA);
-
-		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLFSR,
-						       NULL, 0);
-	}
-
-	if (ret)
-		dev_dbg(nor->dev, "error %d clearing FSR\n", ret);
-}
-
 /**
  * spi_nor_fsr_ready() - Query the Flag Status Register to see if the flash is
  * ready for new commands.
@@ -766,7 +740,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
 			dev_err(nor->dev,
 			"Attempted to modify a protected sector.\n");
 
-		spi_nor_clear_fsr(nor);
+		spi_nor_clear_sr(nor, SPINOR_OP_CLFSR);
 
 		/*
 		 * WEL bit remains set to one when an erase or page program
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
