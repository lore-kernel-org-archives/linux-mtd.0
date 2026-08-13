Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A65C5CFEB
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 13:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MpX9YYNwMoLiBSyd0MdSaXCZJMzrVenGpXcL3PP62XY=; b=NI4DW8vP5hiFwY
	SQX6QAcgEER3bOEJ4NhFahPG+jj054ns+5WA+MA10KLEY46NPUUv6LuKxsmti4Yt4+xvOup+pgMSx
	CQAA3HB29jwGYEVHWCpeFTM/RWEshU17x6f4hQcfh88EQvCGmYRbAJpFEy3nuvc3gOzO0cthf9jTr
	SR8DwvzExFKUCoUQkhXlPRdNE/U1PC/X+9a6rk8vxHtoqeNTtM3Kw3SJQygliuiGkwo+RK+55Bi1N
	kQRsQfnVevGic4I9XyEkSbMGZMDdApWeqyowQe7GJpvZM+XimB3WnoO1DR+v7siNBM2YrjkPE5GZ2
	ZuoDWlPvpdoNJ5uNJiDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuV9l-00000000i3s-0eMJ;
	Thu, 13 Aug 2026 13:07:37 +0000
Received: from mail-westeuropeazon11011054.outbound.protection.outlook.com ([52.101.70.54] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuV9h-00000000i2f-2i51
	for linux-mtd@lists.infradead.org;
	Thu, 13 Aug 2026 13:07:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mu18TkRQwRIWmHGbg1WEdqYiJL1E0gMvLMp+C2DZ69papdGvGr8ngZ4cjaVRleRS6LkPsmntwO2rYrLkZlh4uHjkLMKFPe7XsE1AYQhCVykRf3U9zbBLw8lKI2o9rQf5GQnBcFMQAyJqXZNVMtzZNS1gId3MdoJg8GjJ772vD/sGs3zWGtw6TGwMUz6Je5eszWlA2pIza2miS58Ael0Iw99weZpN6Ob+V07g5BAHok1CDazNaGFvkhojyXGxxpoDjQX1nJ4MyV65qQelj001Proexv2w8UnkBYipjsYZl098Z1E98mRBKbpof2rhiKj2TdFWjWHHfGOgLVQlIFZD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZT5DWriLSqUxkxcnsH9jgnRzU937IcgdophfMHpjGO4=;
 b=CGlcScFBwZSsxPSNEWVmiGgv2ETVuAzG2FoOTdeIKvPGp6yKfHEO0QzD507XNDr9dER9vNLpWiMmDB9zCUyqjSEyrXjjIulteB9ZrTuB0b9qN6wC4fQvoZhaRJGCteKXpbQpSGIuymYmE5+rWzW2KiljzTWB4GUrLEjYqvEWHNxFf0aAyFQyUQ+CgFElVVfF4vyEP78jfC3rdjJSGTbZPGMlaq81OIIGK6Bwuel5QpCXJ2aIQcKLihjTqxmgemTaMRdyagL5V2S1OlGgyTtVbCQudaBLw8D/rhSlovNWNd6sv1udvbXO3jCWOFLadCC0Fxt4I5CuX8rn60K5dozHLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZT5DWriLSqUxkxcnsH9jgnRzU937IcgdophfMHpjGO4=;
 b=cbzMLcHC04mJ2kVqUsK/3+aUaaDYHJbhSypRpKTi3881ORTCdApy68NhbFLjx2EVFrpfM8+KTYTQ1VTgL9awO/JYK3/NWtsc19GN4BdmIBYobpeRdiD9Y9abm9EyM5zDym133tVvRdMx6T0ZweK0IKiN7u5fLKb+iucSl6Z3T8vqwXy4Iw+0E4Jwsmh+Dz7geqWOS+iCKvxaZnn+ZJCy4bd/31g5KXwPOOppGCWQJ16UcgfsITeRWlRCFbLsxPgbE9+meWMbjvEf5AQ7ocbGTG7/XwwBYU7Dqod4YGpYSKL6ktGkC/nZX2/G1AMlZ96geO/+XJuajxlq4Tof8diSkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9079.eurprd04.prod.outlook.com (2603:10a6:20b:446::12)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 13:07:28 +0000
Received: from AS8PR04MB9079.eurprd04.prod.outlook.com
 ([fe80::9761:3d78:e9db:2308]) by AS8PR04MB9079.eurprd04.prod.outlook.com
 ([fe80::9761:3d78:e9db:2308%3]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 13:07:27 +0000
From: han.xu@oss.nxp.com
Date: Thu, 13 Aug 2026 08:07:24 -0500
Subject: [PATCH v2] mtd: spinand: Enable QE on all dies
Message-Id: <20260813-spinand_qe-v2-1-376193ac7b1a@nxp.com>
X-B4-Tracking: v=1; b=H4sIAIvBfWoC/22NQQ6CMBBFr0JmbU1bCKAr7mGIqe0gY2JbO0gwh
 LsLuHX5kvffn4ExETKcsxkSjsQU/Ar6kIHtjb+jILcyaKlLWctKcCRvvLu+UDhXqqKWhe7KHNZ
 BTNjRtMcu7Y/5fXugHbbCZvTEQ0if/W1Um/c3PCqhhFVS2+pU54XJGz/Fow1PaJdl+QJiiN7ct
 AAAAA==
X-Change-ID: 20260807-spinand_qe-dd6148042f63
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Peter Pan <peterpandong@micron.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Xu <han.xu@nxp.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786626444; l=2338;
 i=han.xu@nxp.com; s=20240131; h=from:subject:message-id;
 bh=Lrsc9qvjhzzgpkaGQO2+qix1YF89TnNTe8MerZjoKMw=;
 b=tIwiObs2J1mZz1u14NcpCPApBT1atlVHmz2hIYbhwckveCIzTu5GkDSZThE03FyZx7rFeFz4T
 5hNhMloxZZBCALfRWfNDHy98HBhjEGZ7rHNvw0gtl9i21gKFjv/iUIF
X-Developer-Key: i=han.xu@nxp.com; a=ed25519;
 pk=XSryOlQ4EKXqt7ZHz2D+BcDu1AWYF0m5bX48xQOVF5A=
X-ClientProxiedBy: SA9PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:806:21::33) To AS8PR04MB9079.eurprd04.prod.outlook.com
 (2603:10a6:20b:446::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9079:EE_|AM7PR04MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: ee03b6bb-db92-449b-6d4e-08def93bd30a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|19092799006|366016|6133799003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: BxUdqaOHJnsx8J4zkytoFwK9JuwJlhG1iGpsXqorqBTKycR5qIhS/MKPNsfglcSUXkVqq+xVlb5xMMsgekFwz07h4SHywIcre/QHEUF+8N/u7Cm0xMxIRDLtTP3dlem3nkLOBoS+PDFsBvKmZ+YXvu8PtC6qKHG1m6LgV3veMP450vaf0KAV11gxBpDgTlCVNJuJ+xtIANWu6lH5oP3vW6CiPRphZkAINgUs6DE7Zeg8fQDCDP0NidduYXwVDGOs7HEg8kEnTwF96Sm8LiHhWrudeQV29rvsEAFTJPynIj6jMJQHseiAWPolliiegRIgQMUebtp6tgUu5snTqx809YLjpIk/6VLSe99QAr5sUML2kx8HteBCVQpbFrMRb9dPcVJXYdlDlUolCx+qkOV0HbcjVbH5m25kHI+3DUad+Pvz+WISAB9vgvhPqEFJG6CpdfEPniVmOe8SHwZN8o/p3jTVOeB6at2fiiOhFz/nof+XAtoqNDvfTyIqu8GkPZN96oetZ2PNuaVM7akGbgEiw0qlTKaaCpqmuedT16iB4caQzAAYF3ZLU4g7OrkAsSoFbA7SBBCaPH98x69ZYgx5Vn+QfASHaQTSITOqwlcAIMNbkomW0K8SNsBTsyoHhH8r
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9079.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(19092799006)(366016)(6133799003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkZSRjZ1Uk9lUy9zWnBvbHExaDFnTHE0T29xcXVrYUIvZ055ejkrcGM1MDVF?=
 =?utf-8?B?a0hUZ0ZGZXpnd0JybkVuRnNJdzNPRnNWTE03TXkvemQxa04xT2hBY0szRmJt?=
 =?utf-8?B?UnZ6S3pQVms1b2IvOG5LNm13WXk4VEUwZDNzNzVrb05LSWpCelNqYWc2WEdJ?=
 =?utf-8?B?UXNqbVlXSE80Tk5JYm9FVy9oczBFS3h5V09DR2RhSWhRNmpnSFROak9Yb3E5?=
 =?utf-8?B?dWdzUnBkV1dmdzRlS2NHeHVzaEhtS0NmaFFnTzhkVk5tVTk3bGJ6T1FESmY0?=
 =?utf-8?B?NDNSYlJUd1YwNkJnTkZ6K2sreDNmNVNkVXVFSzdKelpWUjkxSnBpaUE3RzJK?=
 =?utf-8?B?dWY2d3BQYlU5UERDRmhpaXNMbmNlT01VLzFsWmxJSDlMV0t4N0plVEZQc1pi?=
 =?utf-8?B?SVlPOFdiNStPdE9yejlBTEdEMVpoUFk0VCs4MmdleWQzZnh0a2FnRmpGUlh3?=
 =?utf-8?B?cFRYalU5TFZLMmh6dWIveWJQV3FMNEJud0ZRM2I2eC9tUHk4K2E3OUFML3Q5?=
 =?utf-8?B?RTQ2OTJvK2NyQnpYNGZZalpoSUVONU4zbktQSGVFYXR4Y3hkTThGbEdOdWJ3?=
 =?utf-8?B?RU9qMHI0d3lqS0RnUmhUcmZtbHdkUmpwMzhtR2NWZStTbnE4d0UzYm8ranJa?=
 =?utf-8?B?Y0poMDluUURGZ1gxTFk3OW9laTNmN3hXWGtQeksxcmdIdy9nL0ttemlzOCtZ?=
 =?utf-8?B?TUZtNVE2dXhQdUlHbmQzWkM2VTlWTG5HN0NLZWdPNE55dG9KVTkrcW9RdVNS?=
 =?utf-8?B?bEFPTlNGVHJBQU44ZXNyakZsM0ZVRi9oRG5hWjN4S2I1aEJPalVZQU1UKytL?=
 =?utf-8?B?enlXZTNsZWVuQU1nR3RTaEdaeWVEcUgyR0hGbW5BYkRIaWhEQy9ydEp5bHBN?=
 =?utf-8?B?NXpmZHZSbGRFMTVYMTBwS0lsRWdRaE9aZHFyTDBZWUFld21NRG5QRnVUWkUv?=
 =?utf-8?B?ZGlvOGljaU1GRGR5ejhKenJxUG5YNk9pbTNweUdWRENwU2laK0MwUzRkNXgr?=
 =?utf-8?B?Zk1JOG5aWmdBZ2I5YTNpeS83Y1pJMFVGWXhxZHhMWnVsUGtKZGh1Z04xQ2Rh?=
 =?utf-8?B?RWhYdi9kNEF2WUZyUGtMaWVHaFF3UCtHWlR3QUFva242djlybjNqL2ZCOHU1?=
 =?utf-8?B?TkxlbmpRSmdWd2Jkd0l6S1VVR1ZYcVpSa2syK0F0M0NEd2liOGlpWHJDWm1z?=
 =?utf-8?B?M1NnSDFPSGxWTldsc3d6MzdxRkh0dTVKR3Q0ZGdNbE1xcnNmc2U4ekZmNGdr?=
 =?utf-8?B?cnBNaU5ZcWJnaDQvMk5raEYxREpKNzgweVF4VFpjV3lSUWVQV0NiTUdOL1Jj?=
 =?utf-8?B?MEhEbk80T0RkUU9jUlEvTnZtZUpMUlRvTWo5eThWZE9MMzkyQVVCVm10ZFhq?=
 =?utf-8?B?NlBicmY4QkpzV3BkbzdSSHBtaStKSVRlcW9mNU5GZDdlYVBCQXpwU0FvUUZT?=
 =?utf-8?B?THhVNXVZc0ZzbUFvZDZLTDhvbEljdGNHY3RQdE5rbGU4SU1Ud3NwSFEvMlJT?=
 =?utf-8?B?YisvekFlTlQ3M3g5U3l0aU5GU3luSW9jcThHWG9vZmd5cW5hSnUxa1owUDVr?=
 =?utf-8?B?bkFnT0duM2p3Z2ZEZUs2clFLdnltMjhiZ09Mc1RSbEZra2hzNFJ4WWdJOGZE?=
 =?utf-8?B?eS9uQmIxZHRkdE56ZjU4T1MyUmNoUEVKN293Z1dGM2Y1Slh3dTBBVG1idVFM?=
 =?utf-8?B?ZjFsOGNjdW1ZNGtQOVB1V3F3eWJJYXk5Zk92R2JoamtsdkZtQTZoalNLSGZP?=
 =?utf-8?B?K2RWb0hLcU5oVC9EQ1NhUVVPNmowNllqWWM0MFduSHZycHd5V0t5M3V1UTBn?=
 =?utf-8?B?T3BmME5vL1VSRHQ5a25TMnZTRTBSdUYzWmdPM2ZucEp1K3h3RDVySUVLTUFP?=
 =?utf-8?B?T29mb2FpUkdOWUh6djlUR1FoaG1sSFlMbU5jS21HRDd6ZWVaU0IvSFEyUi9t?=
 =?utf-8?B?ZUE2dlY1VTJXUWp3WCtFY0ZkeU8wYzJUL1k2UGJPZE02NmlNaEpMRVpYL2hu?=
 =?utf-8?B?NGJuL2MrbURjR0x6SVkwUE5XT1ZIVjdZdmRXSDJNZUs5dWpJZ2Fzb1ZrMmdN?=
 =?utf-8?B?bnhpVXRVQ0FBb2tkKzVHbVVBMXFRMWUxbUJqcXlSUkxGank1c2dsSGhZQVJT?=
 =?utf-8?B?N1l4TmYvT3NqRDJWRk1XRVZDdEJXT1drQWZxVmF2YlA3WFJnRTRzcjI1d0xN?=
 =?utf-8?B?V0VmdUk2OVVTU0FIWHY4NWo5ZWpKZTF2MlQ4L3k4UlYwcWszcnBJTU5QRlpx?=
 =?utf-8?B?dnlLRjc1c0pHQjcvZWVqVDZkUzZXVkdCTm84UW9qSnVMd1N3Ukd1YnhKUkRx?=
 =?utf-8?B?ZEM3QTh3TmIvdHQvb2l2N1V2RXVSNnFVS2JhTXlGVW5kb3R0aTRKVDlVWWxz?=
 =?utf-8?Q?uXEtjK+SXs7UCze+DnMVIGBiBPDgHkC20JWKe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee03b6bb-db92-449b-6d4e-08def93bd30a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9079.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 13:07:27.3336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oid04mi5C4x/4x4eGgRFP1w2wQ90M7nnrvabI2b9G4IDqM0GyZsWdZIUDBCTXu9DZ7rBFUK/NniMXPNE394I5wtrJ02mVvxusb97eILwefc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_060733_713655_C3462DCB 
X-CRM114-Status: GOOD (  14.58  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogSGFuIFh1IDxoYW4ueHVAbnhwLmNvbT4KClRoZSBRVUFEIEVOQUJMRSAoUUUpIGJpdCBp
cyBzdG9yZWQgaW4gYSBwZXItZGllIGNvbmZpZ3VyYXRpb24KcmVnaXN0ZXIgb24gc29tZSBTUEkt
TkFORCBkZXZpY2VzLiBXaGVuIGEgZGV2aWNlIGNvbnRhaW5zIG11bHRpcGxlCmRpZXMsIHVwZGF0
aW5nIHRoZSBRRSBiaXQgb25seSBvbiB0aGUgY3VycmVudGx5IHNlbGVjdGVkIGRpZSBjYW4KbGVh
dmUgdGhlIHJlbWFpbmluZyBkaWVzIG9wZXJhdGluZyBpbiBub24tcXVhZCBtb2RlLgrCoApJdGVy
YXRlIG92ZXIgYWxsIHRhcmdldHMgYW5kIHVwZGF0ZSB0aGUgUUUgc2V0dGluZyBvbiBlYWNoIGRp
ZQpkdXJpbmcgaW5pdGlhbGl6YXRpb24gdG8gZW5zdXJlIGNvbnNpc3RlbnQgcXVhZCBJL08gb3Bl
cmF0aW9uCmFjcm9zcyB0aGUgZW50aXJlIGRldmljZS4KClRlc3RlZCBvbiBJU1NJIElTMzhTTVcw
NEc4Qi4KCkZpeGVzOiA3NTI5ZGY0NjUyNDggKCJtdGQ6IG5hbmQ6IEFkZCBjb3JlIGluZnJhc3Ry
dWN0dXJlIHRvIHN1cHBvcnQgU1BJIE5BTkRzIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcK
U2lnbmVkLW9mZi1ieTogSGFuIFh1IDxoYW4ueHVAbnhwLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6
Ci0gQWRkIENDIHN0YWJsZQotIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8y
MDI2MDgwNy1zcGluYW5kX3FlLXYxLTEtYzEwMmM3OTgzNGEzQG54cC5jb20KClRvOiBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgpUbzogUmljaGFyZCBXZWluYmVyZ2Vy
IDxyaWNoYXJkQG5vZC5hdD4KVG86IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNv
bT4KVG86IFBldGVyIFBhbiA8cGV0ZXJwYW5kb25nQG1pY3Jvbi5jb20+ClRvOiBCb3JpcyBCcmV6
aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4KQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRl
YWQub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9tdGQv
bmFuZC9zcGkvY29yZS5jIHwgMjIgKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCmluZGV4
IDM1MzY1YjY3ZGQ4ZS4uNzQ0NjYyNTMzZjM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3NwaS9jb3JlLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCkBAIC0yODEsOCAr
MjgxLDI2IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9pbml0X2NmZ19jYWNoZShzdHJ1Y3Qgc3BpbmFu
ZF9kZXZpY2UgKnNwaW5hbmQpCiBzdGF0aWMgaW50IHNwaW5hbmRfaW5pdF9xdWFkX2VuYWJsZShz
dHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCiAJCQkJICAgIGJvb2wgZW5hYmxlKQogewot
CXJldHVybiBzcGluYW5kX3VwZF9jZmcoc3BpbmFuZCwgQ0ZHX1FVQURfRU5BQkxFLAotCQkJICAg
ICAgIGVuYWJsZSA/IENGR19RVUFEX0VOQUJMRSA6IDApOworCXN0cnVjdCBuYW5kX2RldmljZSAq
bmFuZCA9IHNwaW5hbmRfdG9fbmFuZChzcGluYW5kKTsKKwl1bnNpZ25lZCBpbnQgdGFyZ2V0Owor
CWludCByZXQ7CisKKwkvKgorCSAqIFFFIGlzIGEgcGVyLWRpZSBzZXR0aW5nIG9uIHNvbWUgZGV2
aWNlcy4gUHJvZ3JhbSBlYWNoIHRhcmdldAorCSAqIGluZGl2aWR1YWxseSB3aGVuIGVuYWJsaW5n
IG9yIGRpc2FibGluZyBxdWFkIEkvTyBtb2RlLgorCSAqLworCWZvciAodGFyZ2V0ID0gMDsgdGFy
Z2V0IDwgbmFuZC0+bWVtb3JnLm50YXJnZXRzOyB0YXJnZXQrKykgeworCQlyZXQgPSBzcGluYW5k
X3NlbGVjdF90YXJnZXQoc3BpbmFuZCwgdGFyZ2V0KTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiBy
ZXQ7CisKKwkJcmV0ID0gc3BpbmFuZF91cGRfY2ZnKHNwaW5hbmQsIENGR19RVUFEX0VOQUJMRSwK
KwkJCQkgICAgICBlbmFibGUgPyBDRkdfUVVBRF9FTkFCTEUgOiAwKTsKKwkJaWYgKHJldCkKKwkJ
CXJldHVybiByZXQ7CisJfQorCisJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgc3BpbmFuZF9l
Y2NfZW5hYmxlKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKCi0tLQpiYXNlLWNvbW1p
dDogMTEzZjYyMjI1ZTk4ZmViYWJiYTBmZWUwMGFmZDI5ZDRlYWY2NWFiYgpjaGFuZ2UtaWQ6IDIw
MjYwODA3LXNwaW5hbmRfcWUtZGQ2MTQ4MDQyZjYzCgpCZXN0IHJlZ2FyZHMsCi0tICAKSGFuIFh1
IDxoYW4ueHVAbnhwLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
