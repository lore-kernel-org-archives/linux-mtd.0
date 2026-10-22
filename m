Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1348606A319
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c8JI+Wa+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=b9AmbH1R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7ZRcYrNS2rvJlQ0WHuM1joxKPELP8V1V1WjQQ2xcf7Q=; b=c8JI+Wa+jezPTrFhF6QrTVz6sO
	SwEgeEK1ZenrE30+F0SDXWJ3NYxIGEqy8x+Ejs6P4I5uOSbPRQnSIL7apDj/9uBPshO6L0+NV4/LI
	4vbZ9BTbTaB8jcytsGCWEu0oidzVXuUm7uwgkoo7mZMEZklBHyQKlbm9TEhf626FruSeyTJ/FcvRm
	CwTQ4d3vKVm/uZKP2Cxrrt+KWZep3VyohpbVwRM/aS/ATMplozWMqbA2Lboud1Y9dtoMHLx5ZiONX
	z5D/mQVAXPdczToPW88XGBAcD6A7ckAc0icac7lkWri+muyj+mOSsOVIMtQ1PRodWO73pd+YTs8zt
	lW1EL2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqEI-0000000Dwxy-3ZhD;
	Thu, 22 Oct 2026 10:41:02 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqEG-0000000DwxE-07oU
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 10:41:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptrVOrn642MuDX1ZzCt5YfoyLB6Pp657psGUZjEWVa3c++NZd5FQcg+iZfIundKD5bW6wbETVn4iyXeW12/s5+EfdLwX5lwcX2POmWM9mGtegOUhwxaPNPTsLTYpO3WRLIqVg0MEFnzUNrvAHoB0yFhFpCtGESjA3hpEK+ThkmNQn5PCvcSTCPxbr7IzylBPkZ8/EtGoRUNHCMoevJIzbOedYz+u5DDVPHUdZbBV9y4mKYhT3ZYo+ugordqAKKhe5M2wH9KHnkZWdILYECyRLGZCSlI2dkeVOuI4eg/CuIeMYeqEll0k6JTMt3wvFHQjozFxSOj8Ka/7qaUl4I7M5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7X9GRYih3KTWeByxvkaBjCEPQ6lmV7bfEHQKldNKBQ=;
 b=LSZJ0YWx2RnGsmjsPa2QCaJVzKcJLJVswkQ6t1uFOwokxgmsHaX2bPDL6JZz0ZDreNXXQkg4VIwN+CNfycdVytBx7XT4G28KVmWSWql+sc16cCbyCuBqK+AvYKqG9sUPhWNgfbWI7kY2gz/8Y0aIdeM4RSpKRNKoK0xR7xQWg2ifqcnBMkdZ2TON8be4DNCFD2VJ1sOUAOEwhvPjknpoR/g60u0XzVoxi2Vz7/EI7bW8ED9hTQYYfJ7ghiycP0l39KSijbheOYjmOcoPe2Xapqw9AxUDh+3TwnmH/CuKrzaRM7WSrW5yG24rLVrs7DqO+EoDPIFZ85op76JzSiBxuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7X9GRYih3KTWeByxvkaBjCEPQ6lmV7bfEHQKldNKBQ=;
 b=b9AmbH1Ro5ElW1dgfVRXP7uX+p/OjTD/RExZKF0+eg2AytrB2asb8osd/5EeIQn9FDlCK5QGYG2padh6lyWtCftHbm0KOz7RbW+HFiY+8ce0dFQf27BTxzvHO9E79hHOZYvmkEpA+jFeNXS0ii1tVqJ2qpXzvMtl4En9p467L2hIOXWjRu6GYW/Z0RjhfCYCNeWVxbO5RlhejCKLhOi8eiSiYr7P9TieR6q7Gf5CMC1pmEyK8bfHpzkZR0p33jqhI/POBGkXCyOqI3fyb8WuiU0Zxl1PnLUkMf2qd8d57GQD2PpECHtdP+A28pUTfHH+JXsxcpnWc617LVLWvbWeoA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by GV1PR04MB9149.eurprd04.prod.outlook.com
 (2603:10a6:150:24::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 10:40:50 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 10:40:50 +0000
From: haibo.chen@oss.nxp.com
Date: Thu, 22 Oct 2026 18:45:16 +0800
Subject: [PATCH v4] mtd: spi-nor: clear the default read_sr2 opcode for
 Octal DTR flashes
Message-Id: <20261022-spi-nor-fix-v4-1-fba3ec3d2b5e@nxp.com>
X-B4-Tracking: v=1; b=H4sIADvp2WoC/23MsQ7CIBSF4VdpmMXALS3WyfcwDkAvlkFowJCap
 u8u7aA2cTwn+f6ZJIwOEzlXM4mYXXLBlyEOFTGD8nekri+bAIOWdXCiaXTUh0itmyhqiRoBlBS
 MFDFGLPdWu97KHlx6hvja4pmv7/9O5pRTg22jVceM1f3FT+PRhAdZKxl+ZbeXUKRshCgMBcp2L
 +uP5AxgL+sitbWKMS0bA/Irl2V5A/pz8/EYAQAA
X-Change-ID: 20260928-spi-nor-fix-eb7ebe22a740
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, michael@walle.cc, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792665932; l=6944;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=nwZuUNTOH9BSxo5AJscL2sk47seeCfCOZf/Y0WHCKSc=;
 b=nbi36uzyWhpH8k8HjA2cpbNP4Oh9eC1Zaq2pNkiPfspowI0h2mXhSiXnoszyNsI48j1bhj6hj
 4FMPNbv0VaxC439JAGW5/umWIMD5PGV0ViA7tvpudxf3qFbqWo2ewZG
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|GV1PR04MB9149:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d920f7-5470-47db-8a22-08df3028f030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|7416014|6133799003|18002099003|10067099003|261021121427099003|3023799007|5023799004|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: K12awhtxQJQFj/SIGITcgD+WNWfFsX49UacfBOzHAVnT5HCZVv7ZT82t67UIDxgGhVRXQGRNvcWJtiGVbG4xPq5GMWNRAekcss4Bd4r9qe24YsamqaYk/IGey5I3e5NkShU9JsE9E3lIFXbOlXuOwLEvS9iNQ9sPnAMi+W9ag4WIOKO3K4wFH8VUzOa2gDZNt3YW5HHdQhy7PtDinEK/Zs0Iu8221KZl3g7ecLUYk3oND9hC1AQQ5KYqK1Q0fQQiZ+NtNMAYPzw0lUiBWthSaDsMIx71g8ZM5vnQGd0s5RkYrfJJ2wukAImown9ZzguZ0r+I2FVUdj7RF5hDnZ4gjKi2MRJLYlkQ5O/cERzAsKv5uGCT04Z+UvWU6BdxzaNcrB6B8apHar3O/EDzytuyIucqtSzCdyTD/lBlvCp81+MtYnqJPg5ujbUXiT0xOtALM7fsoUQQvMaqH1ZsJRVwjx0Ev9oe/pW51dzCQUTzAzNa6Ip80t1wQBWj/3p7sCr5rgUbxjCtyfEQ8foFk0o28YBrh6d5KH7DgdIRjdTevsdzF8c5eFD80JK5KhCyArpFsAivHjmXTtkjMQu+Hz6FYtnabyumZQFfym0O/wcdq6k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(7416014)(6133799003)(18002099003)(10067099003)(261021121427099003)(3023799007)(5023799004)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWI4ckFNWEJNVTJGSUZQbUFuSUtENWp1R0dQR3BtNFgrQTU2MCtDMk4yaHlI?=
 =?utf-8?B?Z25xU0pORUNuVGZwSyt5NWdyRWtzQWRtSzN3dnp3bEpJMFplMlQzR1VpRm1H?=
 =?utf-8?B?K0FldjRna2VTdExiR0hMSDVxSWJ2Qyt2MXRrb1JpYkpIUlRnOEIwWXJlTDhy?=
 =?utf-8?B?aURQY25YT1NEOVNnWjh1d3dCTVAwV1JqWnpheHowRzJLN29lcXprd2plZVdq?=
 =?utf-8?B?bmU1bmpzOXVncklkTnVZb2tIWHhvQXRUSHFScFIzaGpjT2ZFdVEwOHVKUmZU?=
 =?utf-8?B?QzVSWkRsWTA3VVN2SmNCMEg1NE5mTk1Vd01sMVZWTy9mOGdSUFVwTUJydzJR?=
 =?utf-8?B?YVYvWWREdXozNU05Um1kNFpyT3FLUENXNFI0WlZIMVUzRGZxZjNJdVRpSXpv?=
 =?utf-8?B?WUxlRmV5S1B1Z08yQllDaWEzZzNGaExMOFBDZTF3dnJmZ1pKZ2hMUUxjSnYw?=
 =?utf-8?B?YnJGYVplczVzaWo4U3R4NVRzamxvNzhRbmd0a3RoM25sZDBCeEk3L0U3Ykxn?=
 =?utf-8?B?RStZK1cweWp4Qk0rNm16T2p2NEl3Zm5VdnRIVXBvVkVtRnpRU1p6SzNDd0g1?=
 =?utf-8?B?WUJpUXhPcmJVQWJqOUR6N3dmRFN6c3IvSG9ETGZZbTB2VUEzV3VvM3lTelVz?=
 =?utf-8?B?VVBsUTM5OG5XT2ZyS3EyVmgrdVZUU2htMkZENVA5dzdKd25VNEtCNDhXMmdD?=
 =?utf-8?B?a1VWcHltenBrM2ZoaG5sNithRUZndkd2aGJsNDh6YmlhYTY1OWpvZjQxeENB?=
 =?utf-8?B?TDFiTmpSUVh4RXFkZlNqZGdkTzVQN3h6T2tsV3MyYWpDbGlGblNCMUdGTXVZ?=
 =?utf-8?B?eWdOVnhBZ0JFUWx1bnd0U0JKbjNFYncyYXo4OFBjL1VYZjRDMnF2NlJzYXJI?=
 =?utf-8?B?WjIyNjdHTEo0VjNsTDNJV2IxN0R2Q3hZOFhBN2VPTXFYcnpWcjVxdTNWNFJK?=
 =?utf-8?B?ZmdiTUl2WDlVY0VpZGdYNlE3S21PelVKbjJUN2lXbmQvZUgzNHVRcDgwN2Rk?=
 =?utf-8?B?V0hob01Pd04vaS9lRm5uN1VjSTVldE94L1AzSm9ZTEFvYlBKTDZDdml2aFl6?=
 =?utf-8?B?OUE0ejBROU9kK1JDMlhVakI5MzVPbkthRnN2Mmd3dE44WlhvbXI5RDNiajdh?=
 =?utf-8?B?QnZFQ1ppRmhTeGZYMmR5cDZBVXBJTVMxUWQyRm0ybVJUSUt6L3pEUG5XWUNY?=
 =?utf-8?B?QlB0NFoxeU1wRjExY2kwZjFKRkFiZjdreDZ5SW1WQ2ZNZEZMc2NNa3NXUmNR?=
 =?utf-8?B?dm52TlhmeWRMbVh6WXNBZG5KNHJ1VGN6ZmcraGo2QWw3emJST2htTkpTaVZv?=
 =?utf-8?B?aHFMLzcycmRYMWxyT3dqalkwNlVWaTB5ckU1NFFGbmNUbHYxajUyVkdEMDhY?=
 =?utf-8?B?dEdCekpzSFRFbHp6QlBTZXVnRlZqVmJXNjE0M01QS2RQckRCcDREU1I1RG5q?=
 =?utf-8?B?WE5GMXd0YWJYSFBvZ21xem5NYTRqTE1qeG1qQVQxd1F3WC9MVlh1eitDTTJB?=
 =?utf-8?B?OEVjWStpOHRtbFQvVDdSUEZIY3ZoNGdIZ2l5UjE0TmE1dVBveXJCZzNUaXZU?=
 =?utf-8?B?Q09kTjhIMy9UK2hNcGtOdmkxUDIxS3g0WnRoRmNlSFhtZElZeW1vTDk2QjhP?=
 =?utf-8?B?cVNlcW1oT1I4aU1zaU95SzE2MzFuS1FTbDF3b0NVb2IvU2RxM01SWXZJL2tB?=
 =?utf-8?B?bFdNck0ycklqZm8xUThEZ3dkb1ZIV2dDb2w1N0tBL2FkTzNhZXJPWEU5TG1k?=
 =?utf-8?B?aFhiOTlpQU5BSW1td3V6cmNQZjJjUnZYaC9FL0FkUVByVDdOSGFkd0dWMEZO?=
 =?utf-8?B?bExxblExaTNESUxhd21SSmtRb1BWdk0rVVlvT3ZSR2d5R2g1VEtJdm14TDIr?=
 =?utf-8?B?NHBEbTBHbDZRV1lLVVJXSzNQV1FqUTI5NDJUdHZtUUJwTHhFeXpTT3RsRkR5?=
 =?utf-8?B?N2RldlFTZ09Sa0pwUHZDM3Iwc3dXeHlSeXNWb21IUHp0YkRuU2t1TDkzcG9p?=
 =?utf-8?B?akdUbHpZTFZKUjRCV2YrVG1Ndkp2NnZJSnVSSkZGdzg0b0RWTWJQaE8yZmpR?=
 =?utf-8?B?UVlHRmptUGZZeWVodWVvTlhodmE1Y1JKREZrU3dVWTdGRXNKUjZqKzBRdWIy?=
 =?utf-8?B?UlN4K1hKZ0JoQitabFVTckp5YVpBY3ZUTyt2bU5wMzRyUW1OeVNWZ2VVc29Z?=
 =?utf-8?B?YkxLY2o3YTl2bldBMVE1TTMzbkUyVWZxVEtvN3BFaTBMWE1KNTFvd2IxWG45?=
 =?utf-8?B?SEpRT1RqMlJnNFJjUDlaaVJ0V2dqT2JsaW5oQ3J2TlRwV3RwZWNuekxFTmwz?=
 =?utf-8?B?bUZGYW1WZXlseHozdTF3V1BDaGxCRFpPa2llSktUMENNUXAzanRveEQxbWgx?=
 =?utf-8?Q?VgaaF+07poSfaxiNFwCbt/svtWwZMK+VsUXAv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d920f7-5470-47db-8a22-08df3028f030
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 10:40:49.9729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Na8lxPGYieK3JNthvQZ2p2bk3CHhSq7dt/P+aEwW7hIaoSnLAfGJnu8dis0zI6D1CMbDZKhgKjXkMsGrIEldUIAIB9g7vCBO6YDwhjvzmcgnoPIf78foVvZX7RvcyXj0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_034100_176824_8FABF493 
X-CRM114-Status: GOOD (  21.00  )
X-Spam-Score: 0.0 (/)
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

From: Haibo Chen <haibo.chen@nxp.com>

The core defaults opcodes.read_sr2 to the legacy RDCR opcode (0x35), and
spi_nor_cache_sr_lock_bits() reads SR2 during spi_nor_init(), i.e. after
the flash has been switched to its runtime protocol. On an octal flash
running in 8D-8D-8D mode the opcode is extended per cmd_ext_type (e.g.
0x3535), but RDCR is not a valid register read there: these parts access
their status/configuration registers through a vendor-specific indirect
space, if at all. The flash does not answer, the register read times out
and probe (or resume) fails (on i.MX FlexSPI: -ETIMEDOUT and a controller
WARN(), seen with a Micron MT35XU01G and a Macronix MX25UW51345G).

Clear read_sr2 on every path that enables 8D-8D-8D, so that
spi_nor_read_sr1_and_sr2() degrades to an SR1-only read and no
unsupported command is issued. A manufacturer driver that genuinely
needs an SR2 read in this mode can still install its own opcode in a
later fixup.

- spi_nor_parse_profile1(): the common case. The xSPI Profile 1.0 table
  does not describe any SR2/RDCR read, and it runs before the
  manufacturer late_init.
- mt35xu512aba_post_sfdp_fixup(): some mt35xu512aba batches lack the
  Profile 1.0 table and enable 8D here instead, with the BFPT QER field
  left at a reserved value so read_sr2 keeps its RDCR default.
- spi_nor_no_sfdp_init_params(): non-SFDP parts that enable 8D via
  SPI_NOR_OCTAL_DTR_READ keep the RDCR default too.

CMP (the only user of SR2 beyond quad-enable in the locking code) is
Winbond-specific and is not placed in SR2 on their 8D-capable parts, so
no octal flash loses a usable SR2 read because of this change.

Fixes: b7b63475903c ("mtd: spi-nor: Create a local SR cache")
Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Changes in v4:
- Following the Sashiko review and Miquel's preference, keep the
  capability-based clear but cover every path that enables 8D-8D-8D, not
  only the xSPI Profile 1.0 one:
    - spi_nor_parse_profile1() (the common case, already in v3),
    - mt35xu512aba_post_sfdp_fixup(): some batches lack the 8D command
      info in SFDP so Profile 1.0 parsing may not clear it,
    - spi_nor_no_sfdp_init_params(): non-SFDP parts using
      SPI_NOR_OCTAL_DTR_READ.
- Checked all vendor drivers; Micron is the only one that enables 8D
  outside Profile 1.0 parsing. Macronix and Cypress rely on Profile 1.0.
- Link to v3: https://lore.kernel.org/r/20261022-spi-nor-fix-v3-1-bffa00b75c27@nxp.com

Changes in v3:
- Clear opcodes.read_sr2 in spi_nor_parse_profile1() (capability based)
  instead of in spi_nor_set_octal_dtr() (runtime-protocol based), as
  suggested by Miquel and Michael. It runs for octal-capable parts and
  before the manufacturer late_init, so a driver can still install its
  own SR2 opcode afterwards.
- Confirmed on a Micron MT35XU01G (i.MX95) and a Macronix MX25UW51345G
  (i.MX8ULP): both publish the xSPI Profile 1.0 table, and 0x35 is not a
  valid SR2 read in 8D mode on either.
- Drop the Assisted-by tag (removed upstream for 7.3).
- Link to v2: https://lore.kernel.org/r/20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com

Changes in v2:
- Rework the fix following review: instead of guarding the read at runtime
  in spi_nor_read_sr2(), clear the default RDCR opcode.read_sr2 once, at the
  point the switch to Octal DTR succeeds (spi_nor_set_octal_dtr()).
- Key the clear off the real runtime protocol so a flash that advertises
  Octal DTR but runs in (x)STR (host without 8D support) keeps its RDCR.
- Drop the swp.c change and the -EOPNOTSUPP handling; a cleared read_sr2
  already means "no SR2 read", handled by the existing debugfs caching path.
- Trim the code comment; move the details to the commit message.
- Link to v1: https://lore.kernel.org/r/20260928-spi-nor-fix-v1-1-ce65ba90cfbd@nxp.com
---
 drivers/mtd/spi-nor/core.c      |  6 ++++++
 drivers/mtd/spi-nor/micron-st.c | 10 ++++++++++
 drivers/mtd/spi-nor/sfdp.c      | 11 +++++++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 90524c58602e1c27cd83951ab0cdd3669a2ebfd6..8ded5cd12669161a95d7c08773b5a3a9a5f9b3ac 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2711,6 +2711,12 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
 					  0, 20, SPINOR_OP_READ_FAST,
 					  SNOR_PROTO_8_8_8_DTR);
+		/*
+		 * The default SR2 read opcode(35h) is not usable in
+		 * 8D-8D-8D mode; drop it so spi_nor_init() does not issue an
+		 * unsupported command.
+		 */
+		params->opcodes.read_sr2 = 0;
 	}
 
 	if (no_sfdp_flags & SPI_NOR_OCTAL_DTR_PP) {
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index f97f2dead8c2f175564410871c896260dc31aad3..cff774a83d7656ca2d7dc5af13a78c8c520b1dd9 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -181,6 +181,16 @@ static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
 	nor->params->rdsr_dummy = 8;
 	nor->params->rdsr_addr_nbytes = 0;
 
+	/*
+	 * Some batches do not expose the 8D-8D-8D command information through
+	 * SFDP (see above), so spi_nor_parse_profile1() may not run and clear
+	 * the default SR2 read opcode(35h). Drop it here as well: it is not a
+	 * valid register read in 8D-8D-8D mode and would time out during
+	 * spi_nor_init(). Clearing it again when it was already cleared is
+	 * harmless.
+	 */
+	nor->params->opcodes.read_sr2 = 0;
+
 	/*
 	 * The BFPT quad enable field is set to a reserved value so the quad
 	 * enable function is ignored by spi_nor_parse_bfpt(). Make sure we
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 4a3f82e97cef8a76c9704918aa6558ca4e2f2b97..722eeff71d0df8c47ec7bdd795c08ba1bdf5e9cc 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1344,6 +1344,17 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 	 */
 	nor->params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
 
+	/*
+	 * The xSPI Profile 1.0 table does not describe a Read Configuration
+	 * Register (RDCR, 35h) instruction, and the single-byte RDCR default
+	 * is not usable in 8D-8D-8D mode. Drop the SR2 read opcode for these
+	 * octal-capable flashes so spi_nor_read_sr1_and_sr2() degrades to an
+	 * SR1-only read and spi_nor_init() does not issue an unsupported
+	 * command that the flash never answers. A manufacturer driver that
+	 * actually needs SR2 can install its own opcode in a later fixup.
+	 */
+	nor->params->opcodes.read_sr2 = 0;
+
 out:
 	kfree(dwords);
 	return ret;

---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20260928-spi-nor-fix-eb7ebe22a740

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
