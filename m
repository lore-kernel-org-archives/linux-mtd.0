Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A516CD6E52
	for <linux-mtd@archiver.kernel.org>; Sun, 31 May 2026 12:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5gq4KtOclyupTd2eksi6w0OV1b+cnP5zf0/KK2xiDQ=; b=nJoFnKucDgF7LM5QPUapjtn4Os
	oZqLGqFU2o9XGJG13W4xL5CZn7F9kMZ9iqmPYhsoboG6Jsk++/0n60jihLiDXOUd8Hmky+8S/u7yZ
	PLaQjO2nJoC9Qv9N7tzqZvP2ShBORZywUofWvx5Ain4ILKBQFi4KOuoqxAgxaEf8J4KS7hYrXXS/7
	yMolAQIT8Z/ByNZHl/XspbbmJ3VJ2dFt/OoDUnxl26wjIxwwLTVyS+V9PfZ17YRlLRD6McJg4+aKc
	ZUMQva8/cTB5hHNLbD78qSpkfcC6F5LZlEtytrvjxakuNg/l92G90XV4SxggPaEvsjSnSZbvL8ku3
	qHxxsmsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTfbh-00000009bQo-30mL;
	Sun, 31 May 2026 12:49:33 +0000
Received: from mail-japaneastazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d405::2] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTfba-00000009bQI-2a9X
	for linux-mtd@lists.infradead.org;
	Sun, 31 May 2026 12:49:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Riy+kqwOUJ6hxkr27j8472Fg2TTWCPGQ9MuJMlcP9VPrD0V964xLm11WtrSrtAhotvb7x4AnMeLix1AftNa7LD+MdwzH2eH0SxfLcNwasDf02H2SDwah8qzU/6cB9tduk6SNp90cUe+zxrZTYeX21hPnAMNgld6Bjg1IKAK+3OTAUa5oY7t/oDDZpWrMVKiL96sgsLEnbEsT3ybg1L3EDay5SrT5fx83xZt0jd8C/NCSUKa8uoHoNnN5cfGVn7gfZlNwEojURAmBA0A5qd4BIv00qn7owi3+PaofA5GahfZatXy394XPF7FGItdEwrbYHdwtcIZAT0z50qaD0Do3cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArpYsKDENq8U9cPNzEgdiPw5bhbidQQTVQYJUZlWXTU=;
 b=iz1rbXqbI1+5lJVh4S8BIldGJ6p+TkRbdPJZJN1lTQFq0m7aohiC8qE3n1Er/VwRKL2pRGBSv+EETWQNw4RvXYicnuYGI3yLaxm2VhN7tit8BEh+ReFifAW4Bq99TjF5WD92j8aA3GyWiGxPFc0TyHoizxHcGOGrvuz+qiYx+CPQWZZt1FXHko/ezMMIJRyO19ySv2dkiBEu4f7XblK4G3/h+IKidRu0jXLMZtYETju01FbcwrPJ5vMHZ+SCmyPZL7ykx7R1oTKxkktvNkZFdtud/+d9SX/N5wRiIYAGZuKE08+wcN86fgxFENmme2Dt0M69HSprVxHf7KDzXSjLQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArpYsKDENq8U9cPNzEgdiPw5bhbidQQTVQYJUZlWXTU=;
 b=VjBRzeSD4W+KbtkswvP7p4n4Dj6pQeO4CFB5OSApFBVbhRzMYmAxwT4YX/H8mWRnkZeVyiVqnvqqdgEXyHH8l7RxUtakyA+rg50vWaEJbxGMlf6lKYB4efg953jlglG5WYxE3E7ShiU5m6gUp/VHIBdPkfa68eSBnzWu98M1jLIOhHV0xsk4HycvWS1VSTg6dWGrcR8vvLYr7GAh16wYYMSnOYGurh6KD1ca7s6aDjC2/TPohMDdScCpZlAz5IiTQb4R4esQbBc4y9poyqzqH4V4kBvSooCxLPRd1pQMUMWe8xbG0N0GErNF2PovvWMP1kqOztCL9pXuUO0BM6xdMw==
Received: from SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1e1::9) by TYSPR01MB5679.apcprd01.prod.exchangelabs.com
 (2603:1096:400:412::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sun, 31 May
 2026 12:49:16 +0000
Received: from SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 ([fe80::36dc:66d8:26a6:5612]) by SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 ([fe80::36dc:66d8:26a6:5612%5]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 12:49:14 +0000
Message-ID: <SEYPR01MB58826FF2012EC12F22971FC1C9142@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
Date: Sun, 31 May 2026 20:49:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spinand: fmsh: add support for FM25G{01,02}B
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "cnsztl@gmail.com" <cnsztl@gmail.com>,
 "csharper2005@gmail.com" <csharper2005@gmail.com>,
 "mikhail.kshevetskiy@iopsys.eu" <mikhail.kshevetskiy@iopsys.eu>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TYZPR01MB5556A3E71554A2EC08597EA4C9CDA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB5882D37365BB442818AEC143C9222@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
 <87340fdzcm.fsf@bootlin.com>
From: Ziyang Huang <hzyitc@outlook.com>
In-Reply-To: <87340fdzcm.fsf@bootlin.com>
X-ClientProxiedBy: TPYP295CA0018.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::19) To SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1e1::9)
X-Microsoft-Original-Message-ID: <2d6eede9-0bb1-4e82-9bca-4f534616df58@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR01MB5882:EE_|TYSPR01MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: 4820f211-eccb-4dbe-1755-08debf13047e
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|19110799012|8060799015|15080799012|5072599009|41001999006|51005399006|6090799003|24021099003|10035399007|440099028|3412199025|12091999003|26104999009|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk11Njh0UDB1ODA3L2xzUkNNbllmZWo3UFd2T1k3SzIxenFsUUZBVEZGLzVB?=
 =?utf-8?B?NXRVODExYVhMK29UTTczQW1Ddm9IeTZZWDdxWUtCL1pvN05tV3NEVkg1ZjVU?=
 =?utf-8?B?SkVSeXUyMFZ3c2FVYXQybmRYR25IV3VGTCtyVnZGQ3BEdEU5bDBxY0ZqVkVh?=
 =?utf-8?B?aTd1eTQydm0wejhSaDVnV1cwaGFtdTErUkx5ckwxZiszQjdWL3Rub1pxcWQv?=
 =?utf-8?B?K3NXNllFcDVxWFpvajJ4ejN4eUxrSEJWMDNtS2ptTVRSa2JkVElpMExZVER0?=
 =?utf-8?B?eHpRR2xuaEJqUW90UVBJTVVtcWY1MXNJNVpvckVUL3EvbVpTRWFVVnU5MTh4?=
 =?utf-8?B?VjlOcXg1b3drdjBXRSs0czNabjB6OVlsOTZ2TlVzYjlnR3BRTTFjRXA5S29x?=
 =?utf-8?B?bWE4OEhGVXdRTUhoVmdTVTRXMHlGbXdZcHhSVGF1Nm1GdUJjWWRlMTVuL0dq?=
 =?utf-8?B?Z1ZZeC9DVFdzbTVaQjBKdjFaeWZpQ3l0SFFGbWRlK05vV2cwWnRlUlZlcitY?=
 =?utf-8?B?UzVLV3B6czIvZzg3UlJ2SmVncGdCOXN2U2gvbzhwWkFjcGZ2WTBzaWdLeDZl?=
 =?utf-8?B?QVBNb2F0NmFXaXI3czVsb0k5emJMeVBWUDdkbUptMGdjczFWMlU2bGRib1FY?=
 =?utf-8?B?RVU0ZEpYUkJvRlNEK3FvdHZ4VkVOanJaSGVibE16dndWVGt2WDhUTVE5cGl0?=
 =?utf-8?B?TDFBcnplR0FockxKVWo1eWgzejhmWnIxRkJJN1gybkJ4citlb1hadHd0THB0?=
 =?utf-8?B?VlBqTGRtQzJQbTJ2d2toQWhzV2hTRW13RU9aQTRiaE5yMDlxdFVCZERIRnFa?=
 =?utf-8?B?T0dSQmE1blA5SGdTcGFodlVHUi9IVjlhME1kbFB1WkpXSkVYWVhqQXA5ajVI?=
 =?utf-8?B?ZHQyempvNWo0MFJWVlRGbkk2ZmRWdEJUVHNxbnh3NlJjUyszb2l0cHFIeUZJ?=
 =?utf-8?B?QXFKU0F1bjY3WnJCeG9XcmFhRSs2RjFmamRVSjlmV2lBMWZMU2xtOUMyQzZm?=
 =?utf-8?B?MEE4NlZ2aENmdXpNaWlmcnJ2UE53ZENRV2RSQVN3WGlXcDVQYzg1UUdOZHha?=
 =?utf-8?B?NTdTMWR0TEFhaUIwUFVMSXN3bUp1Y2RqdzVKRXhVMmFHUXc4dHE4dUJBUVF3?=
 =?utf-8?B?ZVNPdWxET0txcWV3VnJDbVhSUE5tc0g3dGpVTFJweHFnMkJjTWM4MmlyVG5T?=
 =?utf-8?B?UzZVNGxqNWI4bXBuMTB2RGIyRFU0Y3FLMEpTeGRCc004VUZUSUhENG92YnRY?=
 =?utf-8?B?ZWRzMmtDR1gxVTUycDRFZVNyWHY3bmlucHNBeTRNQnlkNTQ5OTZjb05qQzdl?=
 =?utf-8?B?NTBoaDIzbzV1TFlSOTJSWnRZdVFLT1kzbEtsS0NiR09TbllaNFM4bFdOZWt5?=
 =?utf-8?B?UDZEL1pMV3Z6Q3c9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDlMd3JwcTB1MG5MS1hEQVNFZ2RzTkoyTVhNU1ZDK3J1TnVYYnRwSUFMRGNw?=
 =?utf-8?B?YVluaHZBcWRzcHRSdWZGTThxeHErWk5YNEgxclFyeW5RZHFrU2tPeFA0RGxD?=
 =?utf-8?B?RGE2Wnp2RklvSzloUzI3ZTQ4NTRBWlNZWmFvR0VpWEl2UENScTVXT0hmTklG?=
 =?utf-8?B?TDNoSk10ZWZHWVkvRHN1NnNVYTZYK1FIc1FHT2pNQzBod3VTQjBvL3UvZktm?=
 =?utf-8?B?Qit5RWtlbXd5a0JaZlF3TDllWWw5cUdFSStiR0p3Rk5JdW83MGYwTEpRZU1W?=
 =?utf-8?B?VDVhd1pXNVFzTUhlVjRzeWt4K3hHSDRyUmpoczdZUUpnQ2RrckhhdTBLU01I?=
 =?utf-8?B?SDVuZzhVMmNWeEZSQ1NqcktnRUhVWDZUaFFKdkZEVnpMZW44ZDVlbjczY0dZ?=
 =?utf-8?B?MjBLU1R0MHhnSUprUGg5d04yS2JSWkVLekw5Zlc5ZGVOT3VDL1hLVXdXbUts?=
 =?utf-8?B?ZkxCWWNWR1FNZmF5VFlUQ3ZJcUtiSVV4eE5QWWM2dm1DamRNZlVTMEpaMFlq?=
 =?utf-8?B?WEtRKzZENDZqTjZBV0plL3l6MW5ZdlRMbzhpQU1tYXo1Wk5vaGswMHBZTmJ1?=
 =?utf-8?B?YVh5NnhSeGF1bDFxSFZtN2lGZEtnV2lJTTNDMmNaSUE3Nk5iQUJEL1hhZFpS?=
 =?utf-8?B?VCtUNXRQRVkvRDFJVS9iT01LZVUzQkJPcEFaK3F3ZytSMmwyWHJsZ282aW5m?=
 =?utf-8?B?OW85cU00d2dDMVNRdTJHVXFqL0RteGttSmxGVi90UUN3V0JPYkl3TEJMMnFS?=
 =?utf-8?B?NmdEUytqWTNXekNlcXdRMldxNC9zVjkzcjJqUXRtK014ak1qdjdzeXA0V00z?=
 =?utf-8?B?Y2xsS2gzMU1QZ2NIUUc0VGxGeHA0bmNBb3h0aWJzb2FFNjFpeEplNTQ0VlVl?=
 =?utf-8?B?SzZzdmowTUgvNWVWUEdkYkJBL2RLRGpvcExiN3dJSmgxdGNrN1QyRUF6QVM2?=
 =?utf-8?B?NVBJeEhyNDlzWmRERjBUZmlZeHNTdzRESTN1WWVmbklZQVIzeWdFbU8zLzBh?=
 =?utf-8?B?ZHloRVpmUmt5ek5EWDlFbjZWUGtEVmlnRDlWSUp3dHBYZ0RFamdvdE5RNXAw?=
 =?utf-8?B?SDlQVFpuVUhGc004Z1E3YThUWXpheG8weUpERGljN2Jzb0hMS2duTGlQbGdI?=
 =?utf-8?B?ekVHUEU4Z3FIbC85aXFMellWTHBqd2dYUHpTNVhOZnpiMHExSHpDR01PeWFK?=
 =?utf-8?B?ZGNuUmhubzlBSEZiR3hTV1NEN2p6T2d4NVZjZy9JT1BkQ3J5TEhFRGU4UVpy?=
 =?utf-8?B?UlRvZkFNNjQ3eURIMkcrR3lBRGZjZ3hTQlAxUXlkNWdpdk9hSFZxZWZ2OHZu?=
 =?utf-8?B?c1BublhYaDV1cDl6d2xpa3pBYmRWcmF6ZmMwdWhjSEpudXV0R1R5cDUzeTNF?=
 =?utf-8?B?UmRXbkFISlRWbXVXNW9sTE1qRXZrZUpVZDhzbWpHVUp1Wk0wRjNUZWxsZHE1?=
 =?utf-8?B?aS9mSFRPaFZuTXBnYTkxTStJcFFwemJWVVhJanNHWDZXRXhJVDFMQkEyendY?=
 =?utf-8?B?NGlxcE5DVmhGNCtIYnV5eVlvSUJLMHpuMkxXNFNZeTROREMwc0JnczdOeWZq?=
 =?utf-8?B?RUZRVTRWQXpwdVNGZy9MYWFIOXJtVS9MS1BDRUtvbE9DeXdUNHJXaDJVZkRn?=
 =?utf-8?B?OUdGZFBTRnA1UUIzd2J6OGtSS2tCNmRKQWlSRGc2YkdMOHR4ek05bm9xNjdu?=
 =?utf-8?B?K0dzSklpamNwUHB5S3dNUmdZYWpZZ0RuQ2h3SHEydlhIWHJ6Qkp2dHZ4U3N0?=
 =?utf-8?B?S1BQR2wxUWxlK3Q2ZnRuUzU5MnBuZzFVKzFLSlpNWEY2dlBKYUJNZlRHbDc3?=
 =?utf-8?B?bU1jRHR4aXZ6KzQ5bVA0TDVGbExaZkQ5Qk5NQUl5OUlna3RTeGE0dW5qa2tk?=
 =?utf-8?Q?+zV0xfJKUwNi4?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4820f211-eccb-4dbe-1755-08debf13047e
X-MS-Exchange-CrossTenant-AuthSource: SEYPR01MB5882.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 12:49:13.6429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR01MB5679
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_054926_663010_669CCB28 
X-CRM114-Status: GOOD (  14.43  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjYvNC8yOCAyMDo0OSwgTWlxdWVsIFJheW5hbCDlhpnpgZM6Cj4gSGVsbG8gWml5YW5n
LAo+IAo+IE9uIDE1LzA0LzIwMjYgYXQgMjM6MzE6NDEgKzA4LCBaaXlhbmcgSHVhbmcgPGh6eWl0
Y0BvdXRsb29rLmNvbT4gd3JvdGU6Cj4gCj4+IEZNMjVHMDFCOiBodHRwczovL3d3dy5mbXNoLmNv
bS9udm0vRk0yNUcwMUJfZHNfZW5nLnBkZgo+PiBGTTI1RzAyQjogaHR0cHM6Ly93d3cuZm1zaC5j
b20vbnZtL0ZNMjVHMDJCX2RzX2VuZy5wZGYKPiAKPiBCZWZvcmUgZ2l2aW5nIHRoZSBsaW5rcywg
dGhlIGNvbW1pdCBjb3VsZCBiZSBzbGlnaHRseSBtb3JlIHZlcmJvc2UsIHN1Y2gKPiBhcyAiQWRk
IHN1cHBvcnQgZm9yLi4uIi4KCk9rLgoKPj4gU2lnbmVkLW9mZi1ieTogWml5YW5nIEh1YW5nIDxo
enlpdGNAb3V0bG9vay5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+PiAgICBGaXgg
Y29weS1wYXN0ZSBpc3N1ZS4gKENvcnJlY3QgRk0yNUcwMUIgc2l6ZS4pCj4+Cj4+ICAgZHJpdmVy
cy9tdGQvbmFuZC9zcGkvZm1zaC5jIHwgMTAxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMDEgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvZm1zaC5jIGIvZHJpdmVycy9tdGQvbmFuZC9z
cGkvZm1zaC5jCj4+IGluZGV4IGY0MTc5NTVmN2QxYy4uYTliMjE5YWU2YzI5IDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9mbXNoLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9zcGkvZm1zaC5jCj4+IEBAIC05LDYgKzksMTYgQEAKPj4gICAjaW5jbHVkZSA8bGludXgva2Vy
bmVsLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L210ZC9zcGluYW5kLmg+Cj4+ICAgCj4+ICsjZGVm
aW5lIEZNMjVHMDFCX1NUQVRVU19FQ0NfTUFTSwkJKDcgPDwgNCkKPj4gKwkjZGVmaW5lIEZNMjVH
MDFCX1NUQVRVU19FQ0NfTk9fQklURkxJUFMJCSgwIDw8IDQpCj4+ICsJI2RlZmluZSBGTTI1RzAx
Ql9TVEFUVVNfRUNDXzFfM19CSVRGTElQUwkoMSA8PCA0KQo+PiArCSNkZWZpbmUgRk0yNUcwMUJf
U1RBVFVTX0VDQ180X0JJVEZMSVBTCQkoMiA8PCA0KQo+PiArCSNkZWZpbmUgRk0yNUcwMUJfU1RB
VFVTX0VDQ181X0JJVEZMSVBTCQkoMyA8PCA0KQo+PiArCSNkZWZpbmUgRk0yNUcwMUJfU1RBVFVT
X0VDQ182X0JJVEZMSVBTCQkoNCA8PCA0KQo+PiArCSNkZWZpbmUgRk0yNUcwMUJfU1RBVFVTX0VD
Q183X0JJVEZMSVBTCQkoNSA8PCA0KQo+PiArCSNkZWZpbmUgRk0yNUcwMUJfU1RBVFVTX0VDQ184
X0JJVEZMSVBTCQkoNiA8PCA0KQo+PiArCSNkZWZpbmUgRk0yNUcwMUJfU1RBVFVTX0VDQ19VTkNP
Ul9FUlJPUgkJKDcgPDwgNCkKPj4gKwo+PiAgICNkZWZpbmUgRk0yNVMwMUJJM19TVEFUVVNfRUND
X01BU0sJCSg3IDw8IDQpCj4+ICAgCSNkZWZpbmUgRk0yNVMwMUJJM19TVEFUVVNfRUNDX05PX0JJ
VEZMSVBTCSgwIDw8IDQpCj4+ICAgCSNkZWZpbmUgRk0yNVMwMUJJM19TVEFUVVNfRUNDXzFfM19C
SVRGTElQUwkoMSA8PCA0KQo+PiBAQCAtMzQsNiArNDQsNzIgQEAgc3RhdGljIFNQSU5BTkRfT1Bf
VkFSSUFOVFModXBkYXRlX2NhY2hlX3ZhcmlhbnRzLAo+PiAgIAkJU1BJTkFORF9QUk9HX0xPQURf
MVNfMVNfNFNfT1AoZmFsc2UsIDAsIE5VTEwsIDApLAo+PiAgIAkJU1BJTkFORF9QUk9HX0xPQURf
MVNfMVNfMVNfT1AoZmFsc2UsIDAsIE5VTEwsIDApKTsKPj4gICAKPj4gKwo+PiArc3RhdGljIGlu
dCBmbTI1ZzAxYl9vb2JsYXlvdXRfZWNjKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlv
biwKPj4gKwkJCQkgIHN0cnVjdCBtdGRfb29iX3JlZ2lvbiAqcmVnaW9uKQo+PiArewo+PiArCWlm
IChzZWN0aW9uKQo+PiArCQlyZXR1cm4gLUVSQU5HRTsKPj4gKwo+PiArCXJlZ2lvbi0+b2Zmc2V0
ID0gNjQ7Cj4+ICsJcmVnaW9uLT5sZW5ndGggPSA2NDsKPj4gKwo+PiArCXJldHVybiAwOwo+PiAr
fQo+PiArCj4+ICtzdGF0aWMgaW50IGZtMjVnMDFiX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRf
aW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKPj4gKwkJCQkgICBzdHJ1Y3QgbXRkX29vYl9yZWdpb24g
KnJlZ2lvbikKPj4gK3sKPj4gKwlpZiAoc2VjdGlvbiA+IDMpCj4+ICsJCXJldHVybiAtRVJBTkdF
Owo+PiArCj4+ICsJaWYgKHNlY3Rpb24gPT0gMCkgewo+PiArCQkvKiByZXNlcnZlIDIgYnl0ZXMg
Zm9yIHRoZSBCQk0gKi8KPj4gKwkJcmVnaW9uLT5vZmZzZXQgPSAyOwo+PiArCQlyZWdpb24tPmxl
bmd0aCA9IDE0Owo+PiArCX0gZWxzZSB7Cj4+ICsJCXJlZ2lvbi0+b2Zmc2V0ID0gc2VjdGlvbiAq
IDE2Owo+PiArCQlyZWdpb24tPmxlbmd0aCA9IDE2Owo+PiArCX0KPiAKPiBJc24ndCB0aGF0IGp1
c3Qgb25lIGJpZyA2MiBieXRlcyBzZWN0aW9uIHN0YXJ0aW5nIGF0IDI/CgpPay4gV2lsbCB1cGRh
dGUgaW4gVjMuCgo+PiArCj4+ICsJcmV0dXJuIDA7Cj4+ICt9Cj4gCj4gUmVzdCBsZ3RtLgo+IAo+
IFRoYW5rcywKPiBNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
