Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE47CC6B19
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 06:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SBkUXik4JmznO9hu3wVTXxG7xmAZ4KrDXiyZqIBTI74=; b=FvsRGU/6Qv6A2eG1hX2sB1HZjA
	lfqgNcYTg6p7JSlHxrBUgBt5vfD22mVDx0+DhZrQCTasVOvoQw4/JGGTOkX3pWMmKbw5qUYdyHysL
	e4BanU5eMl5kf2zsl7I5OtizfUNHt7aJ03YSq+tHfb/Ui92dMyMaRTpBHbdRtgFuzE6i2hu6hyDBg
	TYK7YSmSAQWskzGTmLewGP393/E0/LUkxkOTQF9sjjWR7NVMXGk4k+DjgNtM8vRvg3nK/aI2sCKvz
	HnFYwa/V9jqxJtOzhNvhzz9kEVEP+1yrjR7hGmRnFqUGWqDWshC8XmkUSZnLSVVxaspLlDXT9HZDI
	8XP2lQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGshp-0000000EdrJ-12W1;
	Wed, 14 Oct 2026 06:43:17 +0000
Received: from mail-northeuropeazon11021114.outbound.protection.outlook.com ([52.101.65.114] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGshi-0000000EdpX-2Rms
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 06:43:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjcIAkYRaqa1ps/iKxJE0nl8oM2BwtLVpSIVUfakhPs8h10lNcNqu4u92TQpJu2Yz1V4WmsNmeqm2arXflCBaVPuyrvNqce2RDaUYrRQjF1ulZQmKNGLokeGC86eIh5u2V0a8cTpV7ZGewvq3GA54Xpya5TmZWRqpDc+3zDE/1eLOf730WZZ/L1sCsKYojXqbdNqlNTtZ5etCn4EkYdZu5feV4ZIFcmj9NxOmAxf6NJW3BSf3tQR0Zc/qqzdutH4yu9sR3vVlj0FfQvzwUC0XrjOw1mH/xKANSKmi3e49rXXPVPfolmNoRBjv/z0zRHobxJtC+33ni0WZ5KqbYziJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sAoByyFN9WMB5Ps8ghvDWHvqy/f7jhAK6Oayc4G8Uk=;
 b=Oer8ZZnTX3L0EFBGxOf26gonB0ZbNXmmyAl/DxXxsjPnoZ83lf0MnwPnKldG64RHhff5vqJdto9hW27hoeGmLXcVmiCrPZKiuz4eq/WFRkY1drwaGFawFYzDOXs2ApMv424HBB4s2ZmwpujkmHsLoVg2k2t3tLjE/YMxr2YWq8bTc8fAjBER1V+M6yAFxdNoWrxWwcy3JdSO1UwTO/YnKJon4wlf3BGb0CYrkTxHP9PN7+cLCE+94ht0nRjej1wFK0DdwlYiXAkUROFDLxSVkD5yFPE5hmRoAiZxvYyXHzr1DePQVVpdi1FXLrPCaIWqLVQ5H7EuIh8K7nExfe87CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sAoByyFN9WMB5Ps8ghvDWHvqy/f7jhAK6Oayc4G8Uk=;
 b=gy11qyofZHRTy44xNweDbVMcqybxTNzJKq8EaNEqSptBadaammZZDZ1fvUGOooVvj8EtjC5j4f/ETn0ZAjVbiFY8B/GPW1DhFRdoCi/CmXNbVVlvI0d8jEBpcyZoCJAYK59eRkSWSJdvkMq4YKuRpAhgslTuH+3Y7rY47bRZSi4uMb3Zykhmy5mCGWkwUoyQ+IOPdW45gqwPHFkK3PRbO/xqMXb9B8WJP4HeZaIjnLTi8FB/j5Ix1EJc0iftPqIrxZrn0tuUYOrboAVPmxW7wHU2JwD5LN4oBgOshFJa5NWkTRy8OVvdqqPKRzql19LfoOr3IUF4sGCRhXLe6ujrFQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by FRWPR10MB9291.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:184::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 06:43:04 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 06:43:04 +0000
Message-ID: <1aa5753c-0c63-48e3-a649-8a87955c2362@kontron.de>
Date: Wed, 14 Oct 2026 08:43:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spinand: Do not re-enable continuous reads vetoed
 during variant selection
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Frieder Schrempf <frieder@fris.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261007-spinand-cont-read-supported-v2-1-4c63a0f8828a@kontron.de>
 <874ieq3lj7.fsf@bootlin.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <874ieq3lj7.fsf@bootlin.com>
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|FRWPR10MB9291:EE_
X-MS-Office365-Filtering-Correlation-Id: 04516122-847d-4377-d8e7-08df29be65d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 9eZtVaWxGaZGkNl3OhIFaXHlz+EKVLy1xG4OBP5cRiseocpJMh1hzOAfO5aw8+nuKimfQZvQDhGoLLTKiSw0rmPGQ58Q2+DEWdyLCtZyHNKxeZeuYkidCZXsLx9AOyoH6gZsboTkWkEhegdM8tXOUkQhMkVloI557/K/almAlfOQzCXL/HL2H1j7BCNajZvpnUYmyIbyJZ7tRZq3MHUhfdke1DgvFHer5P92SXnrkz8bFJu5TLAQ/odphxZkm+iLZS2KltCzRXVzBIfLUmUnjeiCYRZ7hWBmtuhrmYk3ZqviToHUA9iFXU69WntAAwty2Kfa1dT/suuAyxwHpjajj/D7s9fxgfE6o9+4+c2Mkk1VyYBBIOP4DuPImvvqZy5AQ3JEee1RmpFwa2NcvVrErypsGYI2rip/LnWxs/Z97gTWjMu8bBKZPX+RKJJl7HlTu5mcSitBnf4TXSAfXUajNJsXpX7PUrfpxfzcQ3SoRgQfyJ5pi6KAHae+q3owm8HM2iLdKse3Z5FRS2Ofdr5y6dvz7OBJBdkrKu5TYxYAoSBG1U3JSJGKtcyDcT0drVhUoRqLoUorNCoZaiOkuMXCr0q3XrcZgXJqHAxrK4L2Bb29H9loFG37/dD/61g9R3qlomAIdKq5svRCYGMXj01MxR07o8x1voS4FcE5h+/KVQg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDBOQS94WUcwc1NrbDhFbkE2cTZJN2lWRUsvaTRUSkVJTys2dUM2RzkxYnE3?=
 =?utf-8?B?MURySFcwa0l1QytLSURPeVpRbTdUdFMxOE9keUttWlh4NlJnS24zUXVOSERH?=
 =?utf-8?B?V2xhcjZhTDlTRlJ6aXRaOXJ2NTkvZmxPb0hWYitFTm44WmxHRkxGYlVCUVBQ?=
 =?utf-8?B?WU16bnluRnJseWR5ekdmazgvdmppNEFNL2tCUjhJTGRBMGRDcFB0OEtaK0Jx?=
 =?utf-8?B?NHltc2QrbVpSRG13L2FCcHEwQjV2c2ltUlN1N3hrSEpoZzZLb0c4RlJTNnNz?=
 =?utf-8?B?WWU3SStIMTl4UUlYenpZd3dYRUVKSDl0YnpLNXlEM0syaXA3d2lvOFJ3MUla?=
 =?utf-8?B?aFVXMEZYVDdweStqczdvV2RyUmZSaXY4a0JMakpEWE9Ca3lZbzF0LzA2MDVL?=
 =?utf-8?B?WjVzZERLSGRyNWZSSlZnTm9LSjdoSmcxRS8vM0FOd0U2MEJJQXZmNHFOSHhv?=
 =?utf-8?B?N0tNV3BtWTdWejJleHpBZ3oxaDFnb0VTaFJVM0p5UDRUZXl0cXlCek1tcWZ2?=
 =?utf-8?B?OHpOV0JXT1VxTWtJUzVxQjEyMmpMZmN1VzlBZFNqSWRuT1dtOXZ6aFN3a1Ry?=
 =?utf-8?B?ZTdyaVdTSStlTVBEL2lCSnhNdXJnYmNmbXMwbVNUZlF6enhmbTNWV3J4eito?=
 =?utf-8?B?d2pFQVQ2TWVodWVPWGxFR0x2Smx0Ky9OSmowbmpqSlZ0ZkVlcFpKSFgrSGVo?=
 =?utf-8?B?WHZrVEVadGFKQjRrVGZtMTFmVnR0SjNlbWRCejhsZ2pJSGZSbTB6eUlNVUlq?=
 =?utf-8?B?eVc0cGZvdnE0OGZUbWE0NjRjNGJkYjFBdzhrd3MrS0N1VURMamRRL0NqYUpY?=
 =?utf-8?B?aGthYUpWYzQvNExIOGIxSWhJMkZNSFJHSjZMaXI1RmlnSktjUWtQQ3VhcG56?=
 =?utf-8?B?WXdDbzVzYy82bUx3U1JMZWc0aXlHNmtndXh1R2wwRlNTZEtaOVplcVFrWVgw?=
 =?utf-8?B?T1piczhZdWFhN3RGZTVDNGtDL2lpbXBhR3ptZ2dqSFBXZWJSZHVDL2YrS3Ur?=
 =?utf-8?B?akN0QzZNcEtnMzBlQlk4Vjl1SWR4QVlBeUM4eVdxT0gyQ1U5YjRGa2pteFlB?=
 =?utf-8?B?MDA2bmlMQXAzMXRRU3dCT3NQM3gvRmJiTVcwelFkdFc2U21adXVHRE1uT0Qw?=
 =?utf-8?B?eEwzeE9ydHhDZHQ4K0wrampOd3JKdlE1ZUZTVU9vTlA1SVpuTU5HaTNmdktR?=
 =?utf-8?B?NlZ3MmFsNTljb3lOR2VFYmcrdE5HKzBzZkNZRHBGNGlJcEZQaSt3YktmRGhx?=
 =?utf-8?B?Z21MNzU1Q05oL0Z4LzhDT1gyS3lJd0tHd0RPTHRaN2lGaWl0b0YrUkNkVERs?=
 =?utf-8?B?VUtqZzdFdHhCbTNDMWR2ZTEyenJjQ0pUbm5YM1FnR0U5aTk1Znc3Sm1Kck9w?=
 =?utf-8?B?c3BkaHRkVldqVmlCd0xqWk9QMG1ETjZuRmJGM2RYWTUybm1uSzRhNEdoRWFE?=
 =?utf-8?B?UVczUUVaWktUVkpwVDJuYmtvTENFTEpYUGZqQVdvMHdFMXBBZ0R3a2k5QmlY?=
 =?utf-8?B?MG1KOVowNFhzY0lqKzlUVTdFZlBKcHZ5Uk93cWtPRXM2YlB1ZXdWazZndkt4?=
 =?utf-8?B?czQxZDhTbFB2ZTdrak5tK3lFTk5xQUdBa2VLek93ZlZVa3duMFBkdTlhdXZu?=
 =?utf-8?B?d3h3aEJvQWdsemhITW8vVmR3b0tya3cwdHBRVnlOUExvaCtKOGcyNis3a2Rw?=
 =?utf-8?B?dk1PR3g5YWJzY3hETmQ0QlRlcURCTUMvbXlIeEMrL1BxNlRVb1VrQWFmVk9V?=
 =?utf-8?B?dHkrUHI2Z0ZIa3pvYnE4eEwrRnpQTERnZDdHdFptSS9Sbk45V3dEZFkxZGlo?=
 =?utf-8?B?SlI1MTc2Qk9Bd0ZhNlIxMEpOU1dteGNVdTJqMDh4UFpSS3dma01HOWJqSFY4?=
 =?utf-8?B?R2JJN3M4TjBKa0xteUd4UWNXRWZBTm5pWElCMksyWVJGSzdxRW5TbkZZN25t?=
 =?utf-8?B?VlBNU2tMVmNmc0kyV25vRHAwT2RCOWVnVGFhekFxWmFMa01PcFlWY1pFekRC?=
 =?utf-8?B?cXlQd3NFdFpFMTlDWVI4S1lnWU1ObWwycktIOHp4NDJodWZIZWNjSER6VXlS?=
 =?utf-8?B?MEh1OE0vZWNvS0JUeFNGdGlhWEUxeXA2ME11TGRxaVN5M0ZzTHVpbG1yNXBz?=
 =?utf-8?B?M2VPeDJ1NGtRa0tNZDA3aEw1ay9CVEtiNmdPQkgzQXU2eENuNGFaRFBmUFha?=
 =?utf-8?B?Y1J6Y2lBR2xwQWhVbEV0TWFvQXljTzRLN0NuUVU4OGxrSnEzTUJpbnVubG9j?=
 =?utf-8?B?K2xmL0tRZEU2WmRDaXJqV0JyT0M2TW8yODgydnExZTVKNjMxSzVueHQ5cU1X?=
 =?utf-8?B?a1JrNURpY1hHSy9WVmpjeDNHbzltdFhMaGFSSTc4S3dMTXEraTREdy91MFhr?=
 =?utf-8?Q?PKnpJpC++aoaV3OQ=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 04516122-847d-4377-d8e7-08df29be65d1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 06:43:04.0321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNdiKKUysSR3FqdiegL7YbuGNttZEjqzAPIdO8kKaFOIT33ABeNAPe6OTi2vC7FXUgw22w6zMIv8Zh/Jy/QumbUAFDsSYi7oJLb3qOd+qp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9291
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_234310_928548_C6586E03 
X-CRM114-Status: GOOD (  22.28  )
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

SGkgTWlxdcOobCwKCk9uIDEyLjEwLjI2IDE4OjU2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhp
IEZyaWVkZXIsCj4gCj4+IEZpeGVzOiA2ZWI3YzE5M2U3NTEgKCJtdGQ6IHNwaW5hbmQ6IFVzZSBz
ZWNvbmRhcnkgb3BzIGZvciBjb250aW51b3VzIHJlYWRzIikKPj4gQXNzaXN0ZWQtYnk6IExMTQo+
PiBTaWduZWQtb2ZmLWJ5OiBGcmllZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRy
b24uZGU+Cj4+IC0tLQo+PiBJIHdhcyB1c2luZyBhbiBMTE0gdG8gY2hlY2sgc3luYyBwYXRjaGVz
IGZvciBVLUJvb3QgYW5kIHRoZSBMTE0gcmVwb3J0ZWQKPj4gYSBidWcgaW4gdGhlIHVwc3RyZWFt
IGtlcm5lbCBjb2RlLiBUbyBtZSBpdCBsb29rcyBsaWtlIHRoaXMgaXMgaW5kZWVkIGEKPj4gYnVn
IGFuZCB0aGUgZml4IGFsc28gbG9va3MgY29ycmVjdCB0byBtZSwgYnV0IEkgd291bGQgbGlrZSB0
byBtZW50aW9uLCB0aGF0Cj4+IHRoaXMgaXMgcHVyZWx5IExMTS1nZW5lcmF0ZWQgYW5kIHRoZW9y
ZXRpY2FsLiBJIGRpZG4ndCB2ZXJpZnkgdGhlIGJ1ZyBhbmQKPj4gdGhlIGZpeCBvbiBhY3R1YWwg
aGFyZHdhcmUuCj4+Cj4+IEBNaXF1ZWw6IERvIHlvdSBoYXZlIGEgaGFyZHdhcmUgc2V0dXAgdGhh
dCB3b3VsZCBiZSBhZmZlY3RlZCBieSB0aGlzPwo+IAo+IEkgZG8gbm90Lgo+IAo+PiBEbyB5b3Ug
dGhpbmsgdGhlcmUgaXMgYSBiZXR0ZXIgZml4Pwo+IAo+IEkgYWdyZWUgd2l0aCB5b3VyIGJ1ZyBh
bmFseXNpcyBhbmQgd2l0aCB0aGUgcHJvcG9zYWwsIGp1c3QgYSBmZXcgbml0cyBiZWxvdy4KPiAK
Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oCj4+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvbXRkL3NwaW5hbmQuaAo+PiBAQCAtNzcyLDYgKzc3Miw5IEBAIHN0cnVjdCBzcGluYW5kX21l
bV9vcHMgewo+PiAgICoJCXN1aXRhYmxlIHRvIHVzZSBvciBub3QgaW4gZ2VuZXJhbCB3aXRoIHRo
aXMgY2hpcC9jb25maWd1cmF0aW9uLgo+PiAgICoJCUEgcGVyLXRyYW5zZmVyIGNoZWNrIG11c3Qg
b2YgY291cnNlIGJlIGRvbmUgdG8gZW5zdXJlIGl0IGlzCj4+ICAgKgkJYWN0dWFsbHkgcmVsZXZh
bnQgdG8gZW5hYmxlIHRoaXMgZmVhdHVyZS4KPj4gKyAqIEBoYXNfY29udF9yZWFkX3ZhcmlhbnRz
OiBUaGUgY2hpcCBuZWVkcyBkZWRpY2F0ZWQgY29udGludW91cyByZWFkIGZyb20KPj4gKyAqCQkJ
ICAgIGNhY2hlIG9wZXJhdGlvbnMsIHdoaWNoIG11c3QgdGhlbiBiZSBhdmFpbGFibGUgZm9yCj4+
ICsgKgkJCSAgICB0aGUgYnVzIGludGVyZmFjZSBpbiB1c2UKPiAKPiAiVGhlIGNoaXAgbmVlZHMg
ZGVkaWNhdGVkIGNvbnRpbnVvdXMgcmVhZCBmcm9tIGNhY2hlIHZhcmlhbnRzIgoKQXMgYmVsb3cg
eW91IGFyZSBwcm9wb3NpbmcgdG8gcmVuYW1lIHRoZSBmaWVsZCB0byBuZWVkc19jb250X3JlYWRf
b3AsCndoaWNoIGNvbnRhaW5zICJvcCIsIEkgd2lsbCBsZWF2ZSB0aGUgZGVzY3JpcHRpb24gYXMg
aXMgdG8gbWF0Y2ggdGhpcy4KCj4gCj4+ICAgKiBAc2V0X2NvbnRfcmVhZDogRW5hYmxlL2Rpc2Fi
bGUgdGhlIGNvbnRpbnVvdXMgcmVhZCBmZWF0dXJlCj4+ICAgKiBAcHJpdjogbWFudWZhY3R1cmVy
IHByaXZhdGUgZGF0YQo+PiAgICogQGZhY3Rfb3RwOiBTUEkgTkFORCBmYWN0b3J5IE9UUCBpbmZv
Lgo+PiBAQCAtODEwLDYgKzgxMyw3IEBAIHN0cnVjdCBzcGluYW5kX2RldmljZSB7Cj4+ICAJaW50
ICgqY29uZmlndXJlX2NoaXApKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPj4gIAkJ
CSAgICAgIGVudW0gc3BpbmFuZF9idXNfaW50ZXJmYWNlIGlmYWNlKTsKPj4gIAlib29sIGNvbnRf
cmVhZF9wb3NzaWJsZTsKPj4gKwlib29sIGhhc19jb250X3JlYWRfdmFyaWFudHM7Cj4gCj4gQ2Fu
IHdlIG5hbWUgaXQgbmVlZHNfY29udF9yZWFkX29wPwoKU3VyZSwgd2lsbCBkbyBpbiB2My4KCj4g
Cj4+ICAJaW50ICgqc2V0X2NvbnRfcmVhZCkoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5k
LAo+PiAgCQkJICAgICBib29sIGVuYWJsZSk7Cj4+ICAJaW50ICgqc2V0X3JhbmRvbWl6ZXIpKHN0
cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPj4KPiAKPiBUaGUgcmVzdCBpcyBnb29kIHRv
IG1lLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3IQoKQmVzdCByZWdhcmRzCkZyaWVkZXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
