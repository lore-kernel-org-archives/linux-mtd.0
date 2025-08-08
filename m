Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AB8C87FCB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Aug 2025 21:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McwE+VumOwfQq2FA/bg3Wl7w5nYGt17/RF/W9qK8jew=; b=NgRG5xKZPphSyE
	fn/wSf+zUg9CnWPOmTmfKCI4ggdurOaC6j+67NMtyrzqJvn6KupMzocyu7pIwhKTJ6YiV7fSpjRPR
	SRuzd1YgFgCEHZo4ejzIdc+W3oY7F37OalZuRFuPTXs9cx8+VdipOfHJP4UBVFyeKUk9YXPdAz7Gt
	jdzBgSYqq6m8jsqTBGDinNJn55g2GywVyu6PpmVUVT8RnYGDLMNVdBiQ1wKwVVZU2IeMREbDtt1PJ
	GX9dHdQVctjLA8kyMmz6uAodLgCKg9Y7vYC6+PAKYJsdXT+vT7Rm7DSmk20aZiiqOAEsx33BG5iuX
	RO8JZ5scVVb/FBcsTJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukULW-00000003iPy-1qvL;
	Fri, 08 Aug 2025 21:09:50 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukUE4-00000003hUt-31RN;
	Fri, 08 Aug 2025 21:02:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gq5etmhHCPO8mJsizyPCW0nfUScbNC4pYb0zZ7cgUlvDJW6EmjBpniR/oE0BzjlARrE7RaVG4YhSdWYKdgXsT9UF0jMacZ2UUeXQnfIBspEXCXlVIAyw3VYK5bi99uH6WjHNgIaWA1H4+wcExiZjmsZI5aoakzc107fhHHbek307c5bQ2LsWrVmX8nhBhMjPUcIJWRz9WboOlxlUh95po2qa66sqd7CoKWEdUw4HJBFsXCQ5oRWXozW85HhrDqN2lG88vxVbwwt51ldZBysFDrJcJ54W5S/AWVmGa0WV/MzGvfhpEsWvFyFFHcwYjX5GQEdymJR+kJdr7sK1Dc+scg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zoo3vSEXvcumSytstAVqmKBlGG4mgrDSeJF6XCkv99E=;
 b=IiDRcHbMQFTxyenM35UAl7gK+U+YOynFQ++QZbIF45sZEjMfAQyjaHwwAd8k/mNSFgqBCbdbaH87sOmerKx6TIheORIZUJry8/OxZgc8XAwRrI5eFVbKIqGDt8dPh593ghRMsyqoZX4ednH281UM3zjPRNhcExX7fC6v4RSnc9TV1l+5TL5dI8Gta3iB108wCuap8Qg628bJQ1De9LBYPNnLoAs5fbueY1umGkcEwooDa5lHmfY4yldt13wdBzTUuGFEdeTHVibYRTojfe0a8JlhGZw3y4MGKu/Qe3n0t8wNYqInSR98uvm4GwdS51aj+XfOsVteAS0G0bPSKAIGFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zoo3vSEXvcumSytstAVqmKBlGG4mgrDSeJF6XCkv99E=;
 b=mV5OLQlXiHRUrVYQbYTZ+d1tlHG0I2Ic5wX5k9/N9jtaY7AcXhbKNm+zAxM5hVp0TJejweefw1CJfONTXhox8WhP5GEQRK9h0qxBndTBcxEiGnI2S0wemEgwFKyf+LlR/bcWEyFxeJbHWsNKHDpAOIl/x525gnVrpGv71m8tiJ/EWDrApsYv8i+GhAHzb54CNpqu9FXleNP6Y09yZP6XVamnD8quNaVczz21V2YWJRz9bueuGs9j9OcJFC39vvku8rOY3kVoE5Ec2ecda7TGBpjaXRPzLFzY9nvD6lxJn8n9aP3vDQjaR/3gWM34uyltv0Jq4yFcLa0Ja004f00Dxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AS2PR08MB9739.eurprd08.prod.outlook.com (2603:10a6:20b:605::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Fri, 8 Aug
 2025 21:02:02 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 21:02:02 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v2 3/4] mtd: spinand: repeat reading in regular mode if continuous reading fails
Date: Sat,  9 Aug 2025 00:01:46 +0300
Message-ID: <20250808210147.3085391-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250808210147.3085391-1-mikhail.kshevetskiy@iopsys.eu>
References: <87cy98g6ts.fsf@bootlin.com>
 <20250808210147.3085391-1-mikhail.kshevetskiy@iopsys.eu>
X-ClientProxiedBy: HE1P190CA0037.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::26)
 To GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AS2PR08MB9739:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e96bd4-d5cd-4589-f0fb-08ddd6bed259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PNcR8nsqzpdKdBM8MnTJWyWC/U7bLsT781ReS+j43UwLSayQhWkQvlYzITFq?=
 =?us-ascii?Q?ezo2Ny49gZFgo3I3MysxGtbsDU15XQBMp+sGvGODD+JUtx69XlNTQywfjHMp?=
 =?us-ascii?Q?1DWjBsmXfuZQfvVgsGAKNAonwNJUewkIW+qORwxeuFolrU+Smw+BqztuxNz7?=
 =?us-ascii?Q?U5OeSS9R2Bwtx72AcMbwDg7ayLogMVsOzPZWsqkwEEZeNDCwNBb/cNFvcrAT?=
 =?us-ascii?Q?ODLESO4Rj905nuz4Rb/75D8hPe4CzS0SuEX97MBNHQ5RHQvCe2DPmDL59+2J?=
 =?us-ascii?Q?TiCEvBbYhInrb4hUwuI50LVtBITR58ehfAmPLe7rKh3ZlwiIB3JSZnqvThWA?=
 =?us-ascii?Q?zStnny3izLJ/aq6bkiTW4+wTpMYTQTOXfIt2k2iYIpzHOz0vcLsTiIk4M5fY?=
 =?us-ascii?Q?Wpu1MF+f8lAhMnk7Eh3y46Bt72rzUattRYHejTfdFN4nzB6atffRSETYqqax?=
 =?us-ascii?Q?L1C5HryctXQQi62vulccyfZaBKFKQNNtsA9U4+7Vxee+ctqIVxy/al81IGDu?=
 =?us-ascii?Q?HrzzfX73pl0VYICvZuZ5o22m9Llv3naLHqUZKwIYqEpxXqoJH6N0xcKvRGJN?=
 =?us-ascii?Q?Wd0jNv9eVue8eDiaNmhF7iyLRm176WFwHTiGk5/h1jkBk7ZLjaoVGwuQ/V5b?=
 =?us-ascii?Q?L9VjAZswNGDWquAQj2RqIBHXYIsuC6zRdB5RPFmZexygPyNQ3+zZBywIRzpE?=
 =?us-ascii?Q?BP4o2nTdAPLfloPQXxEa1G2agObwYNQ5hsvw3ArAwK3CagoM7L84gUtL9MpI?=
 =?us-ascii?Q?mGq5VEhBnfVt072hXatIhV+/8JRxIe+Ese6EHTehMPBzJR9B3ql15Pv1dBgz?=
 =?us-ascii?Q?UMOzDbGib49lLpaFaiaUmb04MizqhRaYNzbJodQnv9rFi0s8gWfPAG6EzUsC?=
 =?us-ascii?Q?v4lK7MjNtrfk+QWD8nBw/GPihsPs+tfdeQj0cyBRjdHwcT2kDrcbYm5RMn9/?=
 =?us-ascii?Q?O7GnmVAW4XwfYvrUyTxVAJrYOHzXy70eOLpslJqLDx/ltfQGpkGIG7gKjtXQ?=
 =?us-ascii?Q?NGgZnzchyiXzXyH4vo09GUc889jCpsWdxAOQu2CMWY4WtHasPqPYo4IPajLc?=
 =?us-ascii?Q?EcSUdZ9kkR7imq8Q6xo95VVTLghlzw9UjU1rs8kmDnCr22MN8iiP0xFwNLSY?=
 =?us-ascii?Q?eF7xmDXoj8tM/CA1OQZBTqxD72MqN3LXPU5yBH9ler2miWIdQArF3HOZ452T?=
 =?us-ascii?Q?2jIXOVsnK8vVfjS9IO+f3JzuWMQ7vRyuKbgsx04LJdkz9efuC+Cc7Zu3j740?=
 =?us-ascii?Q?riJiRuICvfaE0t5wGg5eyq2B10auaXsQsFlGQRO76AAONJO0WDa/auw3QFt4?=
 =?us-ascii?Q?1Oxd/j2ZmbmB7rl/lqvzHG/pSmnG8+jARSQuiy/ASSY4Eq2KXdKAJ8FBPtJo?=
 =?us-ascii?Q?CItuFtv0tmLRkaSwDH3g/gFFDNfCv1bGZRluS+1lUHWqNNJJ2KLEJ2+JGT8J?=
 =?us-ascii?Q?TEUeIhdgcszZuoqk01Ux7dtp1cE5ntnZVLzXeL3uaThY6hKaAcquuEB74gJj?=
 =?us-ascii?Q?m2xyGQ5mCpCZIBA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A+4tJ9EEMmGVnVYYZxc0mngGoiYXp8ykro1Lvaub2yGZl+VJaLBumlP2jzxb?=
 =?us-ascii?Q?sBmNk7xQeCjarkDUR81Pe1/Za0znAPJQUcGGo9i0S4No/9mxRbjxfij3mLX1?=
 =?us-ascii?Q?OctT3hlbibjhudp09aOqDYi1GG+qq9AcagwTN9B2JaCPjHMi6/AHjdY+j8k/?=
 =?us-ascii?Q?Ji/T6ECCaKr4u/JQuAwFtyLsThwckVBLiNB+1EVfiw23hmPaQSZzfpDhPTm7?=
 =?us-ascii?Q?Z9KUtfj62lxKRUehxQVhdzV4Q96a9bqSPbYYJ7IbumpJoizWEn+yEdv9n1iK?=
 =?us-ascii?Q?HY7mFlNqynzbQK/rnLDj4DK8WzZWqBz5bCOWrX0AdDXnI2HbdxLYIIHRhXgA?=
 =?us-ascii?Q?D89nOQMK8/SEZFCt/g/GI9ukJLiDnKBnhhT6l3aNXDGFQ37Knr5b6uIIXXcc?=
 =?us-ascii?Q?lA+QG9EiYTdb+BQ045k3MMnBL/TxXxM5ZNkBrliUX1gombmslCb/mqvnmemR?=
 =?us-ascii?Q?FSXVRsTlQxm4WlzQc07D1TnBcjRCHsl55RfTgQ6J0Z+ZwQRxRA2J8kFM5uFH?=
 =?us-ascii?Q?x7zkgJwYS77darLA/D2x41CWM3gNdJAbbS9RHo3VY2XKz7+1mkXdO4daoEz8?=
 =?us-ascii?Q?D2i14v1XGVdQzeOnuPlf8LD13054kGWU0AJ68CeNS/XgrFgw5F0ICnqv0lQ1?=
 =?us-ascii?Q?d0fQd1v6bEVXB/m0ZK+ehpS+XnUcL5OBmuEbQxrX4lb+h/MoD/kvhmKGDgtp?=
 =?us-ascii?Q?ohkVK3RSN8nOylOMsl12nNP20/b1hModKSqHxY5Z0tEIeeGiBToTEnV8ZJzU?=
 =?us-ascii?Q?vlAg5RwGNUfT2P2bHLF88aDPK3gkAFoq0qPaX4NGwDC/nHm+p6lHTt0am3u9?=
 =?us-ascii?Q?jzN81/5qVP6IG0ozylCeXs/hcVnn6XZ8fAqjCErVMf4+5tdmr/vbGkIw+Bk/?=
 =?us-ascii?Q?HAwDu9li0qLrj50PeolbAK2IOHoti3uCg8HXsbPpDWnN3mpfnTrWJYQ4w7IM?=
 =?us-ascii?Q?Y58S1HUEI90eW6hKbjhWFh7AHZM0ifYGthOMWBj95MHmm1b3p5YgW9X1e6Pl?=
 =?us-ascii?Q?627NuHlbMGHBF+az2r0IHJAzrstquiQyXgFAuCRSQdnkS7zJMxRRt43/D1dN?=
 =?us-ascii?Q?M0J6tdtKEh5OQXT7nL6P354N77omMJSY8gPRyDCcINR17QmWVDxe10z5z/ZA?=
 =?us-ascii?Q?p6+goHmgJIaKDleEW1w8zCgvDqIhu1engpjAxj7myElhWdvn+swL6LYvWXsF?=
 =?us-ascii?Q?I+bA/RLyfzdpAKgPHWUp8ADxRIXdsJUnNJQvFeepyi4VvfVT+OuKPN3X9QkE?=
 =?us-ascii?Q?neQ5/czVs14LVFtCH/NdTKF3TMfB6G9WbYWRWONMraw8I1zVKQ//2ijDB0EX?=
 =?us-ascii?Q?8E01xNyCgV3kNsrFKRrvzg1h04f5teI/et3ho6AnDCTyTeaC3JTZtULG7uR/?=
 =?us-ascii?Q?M+5Q38tD2LEnYZFdMJhf6m+S5y6kGsCTxWhN9wfFd590qQ4YeE47dRUO+9as?=
 =?us-ascii?Q?lOXK5nIWKBzTNBm4yCHcyGYLdtNIKKIaWaKHC3swo6Y+kLkPuGJWfukzkx91?=
 =?us-ascii?Q?73UbOUOc2MBdQhOf0MHJKzKmTHIvxrQgzvOQKHCBJgqFeDhIQJ0AuMMQ4hEX?=
 =?us-ascii?Q?l22hp3uutjDr+J/CFWal2n2wgAN6fy+xcaTP3nG1HelO2X4g//lTYKUNb7Ay?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e96bd4-d5cd-4589-f0fb-08ddd6bed259
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 21:02:01.9487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEGDj9lUH+QRqOpWkAqVTndvBL+sCeVH3xNg4TdmBdgzik+F0V2LOw6gt4cE0XPu2xCGFZyrlkf/6eLVL+WB96d1fEpLFFwUWAP1dVs0bPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_140208_779980_4E47E928 
X-CRM114-Status: GOOD (  16.30  )
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

Continuous reading may result in multiple flash pages reading in one
operation. Unfortunately, not all spinand controllers support such
large reading. They will read less data. Unfortunately, the operation
can't be continued.

In this case:
 * disable continuous reading on this (not good enough) spi controller
 * repeat reading in regular mode.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/mtd/nand/spi/core.c | 39 ++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 0f8636047365..5528e1f72dbc 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -378,7 +378,8 @@ static int spinand_load_page_op(struct spinand_device *spinand,
 }
 
 static int spinand_read_from_cache_op(struct spinand_device *spinand,
-				      const struct nand_page_io_req *req)
+				      const struct nand_page_io_req *req,
+				      bool *controller_is_buggy)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	struct mtd_info *mtd = spinand_to_mtd(spinand);
@@ -430,8 +431,11 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 		 * Dirmap accesses are allowed to toggle the CS.
 		 * Toggling the CS during a continuous read is forbidden.
 		 */
-		if (nbytes && req->continuous)
+		if (nbytes && req->continuous) {
+			if (controller_is_buggy)
+				*controller_is_buggy = true;
 			return -EIO;
+		}
 	}
 
 	if (req->datalen)
@@ -646,7 +650,7 @@ int spinand_read_page(struct spinand_device *spinand,
 
 	spinand_ondie_ecc_save_status(nand, status);
 
-	ret = spinand_read_from_cache_op(spinand, req);
+	ret = spinand_read_from_cache_op(spinand, req, NULL);
 	if (ret)
 		return ret;
 
@@ -770,7 +774,8 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
 
 static int spinand_mtd_continuous_page_read(struct mtd_info *mtd, loff_t from,
 					    struct mtd_oob_ops *ops,
-					    unsigned int *max_bitflips)
+					    unsigned int *max_bitflips,
+					    bool *controller_is_buggy)
 {
 	struct spinand_device *spinand = mtd_to_spinand(mtd);
 	struct nand_device *nand = mtd_to_nanddev(mtd);
@@ -808,7 +813,7 @@ static int spinand_mtd_continuous_page_read(struct mtd_info *mtd, loff_t from,
 		if (ret < 0)
 			goto end_cont_read;
 
-		ret = spinand_read_from_cache_op(spinand, &iter.req);
+		ret = spinand_read_from_cache_op(spinand, &iter.req, controller_is_buggy);
 		if (ret)
 			goto end_cont_read;
 
@@ -892,6 +897,7 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 {
 	struct spinand_device *spinand = mtd_to_spinand(mtd);
 	struct mtd_ecc_stats old_stats;
+	bool controller_is_buggy = false;
 	unsigned int max_bitflips = 0;
 	int ret;
 
@@ -899,10 +905,25 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 
 	old_stats = mtd->ecc_stats;
 
-	if (spinand_use_cont_read(mtd, from, ops))
-		ret = spinand_mtd_continuous_page_read(mtd, from, ops, &max_bitflips);
-	else
-		ret = spinand_mtd_regular_page_read(mtd, from, ops, &max_bitflips);
+	if (spinand_use_cont_read(mtd, from, ops)) {
+		ret = spinand_mtd_continuous_page_read(mtd, from, ops,
+						       &max_bitflips,
+						       &controller_is_buggy);
+		if (controller_is_buggy) {
+			/*
+			 * Some spi controllers may not support reading up to
+			 * erase block size. They will read less data than
+			 * expected. If this happen disable continuous mode
+			 * and repeat reading in normal mode.
+			 */
+			spinand->cont_read_possible = false;
+			ret = spinand_mtd_regular_page_read(mtd, from, ops,
+							    &max_bitflips);
+		}
+	} else {
+		ret = spinand_mtd_regular_page_read(mtd, from, ops,
+						    &max_bitflips);
+	}
 
 	if (ops->stats) {
 		ops->stats->uncorrectable_errors +=
-- 
2.47.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
