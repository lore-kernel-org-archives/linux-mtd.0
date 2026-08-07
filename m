Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C496C5AD05
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 23:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cs7goeYDpmgy8VifSYgphFhgz6iMqHCFzPL6/JrkO2E=; b=kBao73xJcTUas4
	f9y85TokeQNdaEf1tlXv/i6d2EWp4sogq6NR+kEZA1A7oQZ+o0peRGpWEaeRg2UYVk3DZAFRUVsRU
	NApyyXY4N7NfXDjwCZbJASLILvLvT28dZcIBy01FG4jLTWiCvM7Ynpyhe5nuK/WYL3jUMMKSfXmai
	JX9//uaqPMYbeB/EoZycbaLdD0Ma6sp3JtzFN7+XITrexoMRkc194wvc+yel//7EV6HC3KvZJ2bBI
	T49P0jq+ELQvJw9zqY4m2QvKcY22Tjo2oJ1vBpz1u4hIqS1Jkrv6Db2ExXdwnK3cLm+yuAqm3pAhv
	zhtPwkk+JtVTCXQ77J8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTj6-00000008rNB-0W8p;
	Fri, 07 Aug 2026 23:11:44 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTj2-00000008rMG-3DVO
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 23:11:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIoLBVc4mD9N4Gci99/Ic5swakK6CjAH5seAIKAPe+ZTlcs2T1Ni/ZqpbkI7bqrBzIJmMdYd+gA8OVLKxokxw8/9zp/SLJxER6u/oIZrczcWpS8M1kI7JO1g2yQKhfH8oVuNZQaKDzpdV+lYDNlASxKuY0Dmo65ck9fyVcm3flf1FmuwjPEB3LJwlfj38SmfFQzwvtk8GGbJmqsEg+G9zYXDVlr6YySnece0/yxI3XxqDXbSq1Ms64dyWGB1ZZroQfL/F29no9UAftfQiLV4g8xqn0Hj5dFCY4BrBEdqyinnFGd3VMGTDIIbO4aylMuVehgWd+xEyS/gHVuoiDSU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zuh/8ncmpcufKvT7wXyx/jUcDchZxEnTb9gMEnxwmW8=;
 b=i7Au0KIvOekhnedqxVwNACvtrw6SB/UpEWHyia//n9eyGPukQ+gxF2C1SFCUgFEMtjQqjRy0CakqZkAv7M1NytAjhOyZSxP1na83rUK8xt5eeFLGO9tYqachx4Pi36nDi754iHNqU82qJFmLPwgEdJiUQdeSt1jtDiv65H6yu/lYt4RjbkOedH+6g3/yqyQXRUoQcSN+ZkZ2n3doms/9E0ihmbvXlCdZyWk2sPqij1KY/L/m0f/qQ/sRvBLYT9VznarYPvmlwtwjqRLbzc12dAMjG2b7MMAgQh5wmfDzt5X3MZsFQN5OodkNXKJ/qmWdqE+s5ndUX/Fh7mwCwR5ysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zuh/8ncmpcufKvT7wXyx/jUcDchZxEnTb9gMEnxwmW8=;
 b=VvitX/RNza9uF4Yq+DvTvwdkN1s/qiEJjfvhP132De580SjZfCjtVHpqpyUZah2WnnKoMrAknM+Et/H6GteUTo2yu90PQlrn4TugO48leXuwXT+mzefFJW96b8r//A6vl3zdmXP92uAnqD6UP+aSzMwt3iUdk6/3TWJgnxcJoxEq69rHNf7JPzukAeQxHfNIi2S5aMx6dOtC+mmW4009/EgyY591GSJrJ56heZ2VR+Nuscdx4C/MkHgjqanBMsdbNPqA1qE4UUEcqSfiQ8xGbgMrFs0aRk8Xpyx3WjE65TuyT2ijqea+vIuMro88NQdWys/Uw0WFYM1bgVBJXOFqCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9079.eurprd04.prod.outlook.com (2603:10a6:20b:446::12)
 by AM9PR04MB8636.eurprd04.prod.outlook.com (2603:10a6:20b:43f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 23:11:34 +0000
Received: from AS8PR04MB9079.eurprd04.prod.outlook.com
 ([fe80::9761:3d78:e9db:2308]) by AS8PR04MB9079.eurprd04.prod.outlook.com
 ([fe80::9761:3d78:e9db:2308%3]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 23:11:34 +0000
From: han.xu@oss.nxp.com
Date: Fri, 07 Aug 2026 18:11:27 -0500
Subject: [PATCH] mtd: spinand: Enable QE on all dies
Message-Id: <20260807-spinand_qe-v1-1-c102c79834a3@nxp.com>
X-B4-Tracking: v=1; b=H4sIAB5mdmoC/yXMQQ5AMBBA0avIrDWpkhJXEZHSwVgUHUQi7q5Yv
 sX/FzB6QoYyusDjQUyzC0jiCLrRuAEF2WBQUmlZyFzwQs4426worNVJVshM9TqFECweezq/WVX
 /5r2dsNveA9z3Az0aUVxuAAAA
X-Change-ID: 20260807-spinand_qe-dd6148042f63
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Peter Pan <peterpandong@micron.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Xu <han.xu@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786144289; l=1898;
 i=han.xu@nxp.com; s=20240131; h=from:subject:message-id;
 bh=0d93hNvYMm85ubs+Gev58mySFVNTaWHnF+iu8jla13I=;
 b=RTSw3lPFrtA/lfQTCWBjNuXdRoWE++eTaDDOFx2yw2Tqwf4bn98eBxNw6rgEh6VVj5LI5DCg/
 nQDy02DgszPAkQBsfvqWLX4Rh6gDxHG9bBtkspL7rzu89yMDApTQgtT
X-Developer-Key: i=han.xu@nxp.com; a=ed25519;
 pk=XSryOlQ4EKXqt7ZHz2D+BcDu1AWYF0m5bX48xQOVF5A=
X-ClientProxiedBy: PH7PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:510:23d::9) To AS8PR04MB9079.eurprd04.prod.outlook.com
 (2603:10a6:20b:446::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9079:EE_|AM9PR04MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: e56772ac-b1d7-425f-77f3-08def4d939aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|18002099003|56012099006|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 3Z6Z1xL4mDI1iuFo0kwp7Ycdh7yDEBVO7FjPv0JW6BnC6X3gykoV+VY8DTUsj801GCgx1s/+qpvNFY39SID/HCEbBxAI/BurO+S6nPCXKPyKj6YaGyLkcvplMflI2c8DPyXn2+RRFXwL1ICzR3po5iuemeou6BdpFYU8qLZkljXgvq0ZpJkbX9CbFK23oXsQ4C0G2cP0mflpo52nUrH87b46+q36IxavDoiixmbP/WYK7wT7yuAUKFarjwi8QtcXMTvnEUWVSQHgDYOGH/ncG6niA4zrMXki+mTYeLCKdAG6/YG2AMpkwwl5KNlaF3VYkrLKNz5BORyuEvndxawQBd7PZmtgNIlycrx7eVTwkE5tutc/cBuHNfeyJMvAvzzjdj+jsk7UHO+aBRrBYs/5C/rIEq1nYvfTPCFK8yM+8kAN35Nz4aTz0gEyRdQc1gP0OGUQP8QKsW3yXIR5Q2/iAntk2AFFY1j4dsYFiIUMK9AoZdknOmNljj7aQxQ5b+D882VAnPuJeKRqWo4Nt4takwCbTQEvF5sSk5WOx9m/n8QX8Pm78/PeRSVEsfn5Iknc+vhwlyZG84uYAPA1Hrf1A+DDCs9H7GZpEoqV60kyTau/4wrabvSPrMhWIr9+iDVOQ7Ziltp9YJgDeGVQ3eXQudZLs3KV0Qpdok9BPH42HNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9079.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(18002099003)(56012099006)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWRLcjlLMHVGRWJCVkRMRDFXdlk5MnpPNWR0cGx4NllrLytCL1ZDOWJ3YWQ3?=
 =?utf-8?B?OWErVmp1ZFhrWC9MRVd5TDFLWjZEbmltWEE0WTVRc21vV1dUT1hzd3hVZEF5?=
 =?utf-8?B?NDdwRnA1MDIzL3BNOFdBcjhQQlR4N3kyRHpCcXYwZG90YTR1OXNpQlNETmRM?=
 =?utf-8?B?cysvMjVFeUVMbmM4N0JnbklIam1XeEVKRW5QSU5BV2o2M3hiQXowcFo5aHo2?=
 =?utf-8?B?Z3VHTzVlODFoUWtOOVpobDVweFNteGkzNGhKVkFpR3VLVng5S3hMQXRDbWdQ?=
 =?utf-8?B?NzZsTENuNitCdk01Ukplb3JRUTMvSVUvMjZVNHR4OENrSm9wUmJtR3dmcjA0?=
 =?utf-8?B?cGNUN0NGOHIzZ3M4a2YrNkJpZVNEL2p3ZTJhUnphQTU1bXpnQ2U0QnJvMmlC?=
 =?utf-8?B?VjNZUThxRWdhZG8yVW14R0dZMkV2MHFKRUJjVGZHbkdSUUo3aEVhbkk3K2N4?=
 =?utf-8?B?eVl6VGNNZVpPTEFSVDFsMWZ5elFSbVM4SDBZeE1hZ3ZKOFpWVW9hVmJvaVM4?=
 =?utf-8?B?YkJKTTJVWFEwbVRia2VTN3pBTlJXeE13TTk4M2pRa1ZhU2g5MDJpeWFmWGVI?=
 =?utf-8?B?dVNPT0h4cmROZ0l0aWNwU0FQQnJxcnNIdSs4dlpKTEM0dTUzVFJMYWkxQXl3?=
 =?utf-8?B?T1ZhWFhMRE9ZZWdUaElsVitBb3Eva2ZyanRYbWR5TUlhS1RnSmpvT0d1MWlx?=
 =?utf-8?B?L1pyOW9FQlVDNnFtQ2Z3UldUK0Uyd3VJVWNHeVY0TFdJeEFvNjJuTEJDNHlD?=
 =?utf-8?B?M2NpUXpEbHhtdzF1NWRaVXFrZVk0a1c2Ny85R0JQd1dGNmx4SkI1VHYxalY2?=
 =?utf-8?B?VW5PQU52UUVpNUNzMkd3WmttTEZmL0haS1FNeWhienUzMm5Gekg3eVRZRTcx?=
 =?utf-8?B?akF1djJjV29VanBKSUhydVNaMkVzWkVwVXAzbUMyUnJiV051eHZDWFJvbW5q?=
 =?utf-8?B?emQxQjIweVFPZHREQjFmejJHVld0NHNCSURnNmY4R3NCNmF1aGFzcHFSTVI2?=
 =?utf-8?B?V3R1MnRUeUFtL2ZmWUx6QWVRRnRmdmV4bnN0LzQyTTBJdFkwV0EwM2Y3NTE3?=
 =?utf-8?B?OXRWcGhURkVvc2lNVTBMOEZXSzBTdE9Xd1MzZmUrZUZib1piTmtqRzlHZzNQ?=
 =?utf-8?B?UXIvUHpUTkpocDhLK090SmhOdmdrbGU3eU5SRXNJS3oyRE5MdERmMmRXTkFn?=
 =?utf-8?B?N1U0YWxucjUzVDBaOWRRWTJ4RGRTZlBhY2hpQTZjSVJiQyt6Z0wwVkNmS01m?=
 =?utf-8?B?ZkxZcE9GYVY0cEw5NEViaWlXTUdlMVRmQSt4U0RqanZWRmVyd3BjWE9OejJR?=
 =?utf-8?B?Tm1LdUMrQkFLK3ZsbzY5a3NvV2EyQSt2aE8wRS81VHVmalBNYXNRbUFGNk96?=
 =?utf-8?B?YXN1dytVL1VJTS95RldBQTh4ZHRTZW1OV3ZLV20rai9nbmFXbThkcG1ENzFo?=
 =?utf-8?B?NmlraFJCRHZHZVR2a2JSdUhVWm5ZUjBsa21pQ1ZhUWtaYy9HSUc2amZYZGpX?=
 =?utf-8?B?UTVsc3laZW9TVlljRnE3RnRLaGtHQU1iNHVEZ0h6UVQrcCt1dlY2c2FtcGZP?=
 =?utf-8?B?NGJnaE01QnZnQ1JYK1o3Q2xOSURKOGZPcncwZk9DR2MwQTg5QzFoZjlmVVIw?=
 =?utf-8?B?QndwbnprOXlYdERQTXozWHVZZzFQQ0ExZ3F0emlUbDV3aXdlQmFrWWgwdEZS?=
 =?utf-8?B?L3FpSjNLckxCM2ZqcTJ6QjVndHA5QVIwV2tZUURXSmwvMXdkZ2V4MmtwL0JV?=
 =?utf-8?B?amhVTlIycE1sZmxSZHVmQThQdU5iUWNqY3NyQnhNSGdtdENDWnBma3J6Slda?=
 =?utf-8?B?ZlhZNTUwYTZlTHRmZzZRZWwxUXBqR0xXZDNvUjNiT0d4ZmRHVEhmaG5oMkRM?=
 =?utf-8?B?ckZ0NURabUFVMXlRZUY0Wk5lZjhCejlLakwycTkvUjFsQ0lpRGxReFVjZ2Yx?=
 =?utf-8?B?MmJEazNNMnVjTDJIVjJNS2Zsamp5eUw0WnJQVTJSUjhYZk5kenI4anJmVFRX?=
 =?utf-8?B?aDZ4ZmpKUG9BdFR0Sk52ZTUycGFjOFNWUjNtOGhUREYzVWtibHpMcHlYZGxk?=
 =?utf-8?B?QStGbHpPWE1sbEt4N0VXSDJFaFpIQkdCcU9wNThKTzVzWThhdXAxTnoxRVdT?=
 =?utf-8?B?QjdhSzdKd1c2UmxKWFR1VnZOYnhyK2FRL2lOSUJ0eXovNXBqYTB3UVUrQks4?=
 =?utf-8?B?ZFR2ZXFvcDN2V2JheWFPaEh1YXNHVDA0em5jU3A5eDY3UGdxdU5VQnVPV3FH?=
 =?utf-8?B?S0x0QS9UV1ZvcFUwS2M0YmVhZjhWU1ZGUHBDUHd0Tlk5TzQrWEJEaFh1dm9M?=
 =?utf-8?B?SzVZMzlJaUtqK200TTFvWlpmVzhieWhCNEhEUyt3UXprQlFuZ1JCZXRsM0FG?=
 =?utf-8?Q?QFvBZFk+tM3MPcqZy0MjleXcKuj7c/pXKWnwl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e56772ac-b1d7-425f-77f3-08def4d939aa
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9079.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 23:11:34.7873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UM1z5TKMF6IQuMGA93r8uBMSKHy8WHPOSlLgXUWJ96s9vhiXuuZAi0Mj8QyHAElh9wnOFaN4o2rRFzLZUL81AqW4DEUB3xQ+Pv1VYxQiF20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8636
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_161140_815865_15A64F0C 
X-CRM114-Status: GOOD (  12.37  )
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
dWN0dXJlIHRvIHN1cHBvcnQgU1BJIE5BTkRzIikKU2lnbmVkLW9mZi1ieTogSGFuIFh1IDxoYW4u
eHVAbnhwLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgfCAyMiArKysrKysr
KysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKaW5kZXggMzUzNjViNjdkZDhlLi43NDQ2NjI1MzNmMzcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYworKysgYi9kcml2ZXJzL210
ZC9uYW5kL3NwaS9jb3JlLmMKQEAgLTI4MSw4ICsyODEsMjYgQEAgc3RhdGljIGludCBzcGluYW5k
X2luaXRfY2ZnX2NhY2hlKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKIHN0YXRpYyBp
bnQgc3BpbmFuZF9pbml0X3F1YWRfZW5hYmxlKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFu
ZCwKIAkJCQkgICAgYm9vbCBlbmFibGUpCiB7Ci0JcmV0dXJuIHNwaW5hbmRfdXBkX2NmZyhzcGlu
YW5kLCBDRkdfUVVBRF9FTkFCTEUsCi0JCQkgICAgICAgZW5hYmxlID8gQ0ZHX1FVQURfRU5BQkxF
IDogMCk7CisJc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kID0gc3BpbmFuZF90b19uYW5kKHNwaW5h
bmQpOworCXVuc2lnbmVkIGludCB0YXJnZXQ7CisJaW50IHJldDsKKworCS8qCisJICogUUUgaXMg
YSBwZXItZGllIHNldHRpbmcgb24gc29tZSBkZXZpY2VzLiBQcm9ncmFtIGVhY2ggdGFyZ2V0CisJ
ICogaW5kaXZpZHVhbGx5IHdoZW4gZW5hYmxpbmcgb3IgZGlzYWJsaW5nIHF1YWQgSS9PIG1vZGUu
CisJICovCisJZm9yICh0YXJnZXQgPSAwOyB0YXJnZXQgPCBuYW5kLT5tZW1vcmcubnRhcmdldHM7
IHRhcmdldCsrKSB7CisJCXJldCA9IHNwaW5hbmRfc2VsZWN0X3RhcmdldChzcGluYW5kLCB0YXJn
ZXQpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKworCQlyZXQgPSBzcGluYW5kX3VwZF9j
Zmcoc3BpbmFuZCwgQ0ZHX1FVQURfRU5BQkxFLAorCQkJCSAgICAgIGVuYWJsZSA/IENGR19RVUFE
X0VOQUJMRSA6IDApOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwl9CisKKwlyZXR1cm4g
MDsKIH0KIAogc3RhdGljIGludCBzcGluYW5kX2VjY19lbmFibGUoc3RydWN0IHNwaW5hbmRfZGV2
aWNlICpzcGluYW5kLAoKLS0tCmJhc2UtY29tbWl0OiAxMTNmNjIyMjVlOThmZWJhYmJhMGZlZTAw
YWZkMjlkNGVhZjY1YWJiCmNoYW5nZS1pZDogMjAyNjA4MDctc3BpbmFuZF9xZS1kZDYxNDgwNDJm
NjMKCkJlc3QgcmVnYXJkcywKLS0gIApIYW4gWHUgPGhhbi54dUBueHAuY29tPgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
