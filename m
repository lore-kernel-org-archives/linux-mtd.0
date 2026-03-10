Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BE1EB1056
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 14:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:
	To:Subject:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIOrx1WWrNlkdRRKUvdsLwIVBNqZ90W/umH2+78P+eE=; b=zL0fcd/QXRdVKn
	o512982jpJKOT1s5J2gsrTPojVTuZJmvH8vahSAR4x8WT4kYRqGXuq0jY22Kv7DXGvnawE0QqBYFF
	6oWLngtFZk+ejgxrFjyk23npSFM1J3pZ50Xe+KwOfgC9A+RBVImI4X/jvpoZP0FuW9hRzrXa1Qf5B
	M/5VVcJxUTemFRuWq0abvah0mhDSXz1GXmYQW0bWk2R4pw3+3DbK2HYLRS4g/efuMM8eDiDeCJH1W
	QZ57aYq9bgPBwsKJKWhSIQf/vFpEji4ZGV9FaYgrp+lHqpY2KCPOUmXfNadDF9h9YZ1VmIPS8T6X4
	YY6QP5F32+IJQXmsjFCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzxtL-00000009g9u-3yP0;
	Tue, 10 Mar 2026 14:16:59 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzxtJ-00000009g6a-2axg
	for linux-mtd@lists.infradead.org;
	Tue, 10 Mar 2026 14:16:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwPMi07BycAdHy6TOHDBflD8375zVMGBiGOoPJDdhechvPLJ5rI/Jcl17PeL3Sx4ptUTBC3DNeA9DsuaOg9V5XIxYEYlp/G9c6wTgjBt+QwbznmaSJmcmNy3me8aJeIjDXcLuWi+c9WYKsPt/Gjr8ZGlp9yOXENjykbS3vdhIzo2tSGjtI7Rrwvd1kgB/NjLFAAIjyTJmS5qgiUfRZoFdxyWiIuZ+iozGP03+wf5TLyUVeS/5AlQJ+EPonFfYdjqpP7ukQFdJWqh5eefYoi/4kPtK5Dc4efxRtJunTguRbVwosL26SEWEkq7jYJ58zCxAbBH9g9RCvUDTs9jx95s2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVWSpAXWmJtLYUl0/pEluaJ6wCh87uXNtYS7wRaHb4g=;
 b=JnW5LZXHmdCKif2I7IIx50C6g4RR2UOoSd5O8hhLEap5Uskg66KrQlHrJxhfGeWHkl+ToMKpCzWg6Qwq9aGOmQKC2IpkW6NNM92Qy+GpRHbXyFnIa5SaGsUL1UF/JIj846afMFW2tXy4ppUzPqAPeIVegL9zI7gwzXK10vegb8VCxvXrsd7WpRzgBHqEHwezQJxCqL9Gd6VJdg4tkp0NE5GbE7ODl/jJ0AYBCez16n67lcdooIb9ZLcVFVO5l1IrA1vc1LfZTABBbmTX5eix7gh/dkve7Hacd5r7bJFqz5brOOZ3oxs1bC9hYryUEjfj/rl2hh1Yl24lQJFEsjh34A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVWSpAXWmJtLYUl0/pEluaJ6wCh87uXNtYS7wRaHb4g=;
 b=w2bx0ErCZ1uvf+LZjwllH+qPCo1nGcIOLwdsasCkoJaGGYVtteREN4Erf9sWHi+VK332MF3a1xSVE1LwOI8gakZQq1LfRL8JDHHEcZCfFgFNKmIfEsTMCsY7j+MfDc9Da6ItL1sE8J7CvVNTYRzRj0GXsXx/cNXRMpqsygbcDOpX2YLuiESuLBLFAaCC06u8kTOk7gDZo2hWvvpD01o39JnRgmM1dJ6ybqbfvKzBR+6RhMv0fXX/4TiexENEK2W19aPXzfZOHxzgueyCgY03tTZ3A4lj4UMhr9chwBop3bZaBdyTEzVYXyfCuxnVP+OJ6LVO8Q+N8H/tbekII+HTDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by GV2PR10MB8040.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 14:16:49 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 14:16:49 +0000
Message-ID: <a1a711c4-d9df-4bba-8831-2ec787f84cc4@kontron.de>
Date: Tue, 10 Mar 2026 15:16:47 +0100
User-Agent: Mozilla Thunderbird
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH RFC 6/7] spi: spi-mem: Call spi_set_rx_sampling_point()
 for each op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Frieder Schrempf <frieder@fris.de>
Cc: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Han Xu <han.xu@nxp.com>,
 Eberhard Stoll <eberhard.stoll@kontron.de>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, imx@lists.linux.dev
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
 <20260303-fsl-qspi-rx-sampling-delay-v1-6-9326bbc492d6@kontron.de>
 <87wlzlnioh.fsf@bootlin.com>
Content-Language: en-US, de-DE
In-Reply-To: <87wlzlnioh.fsf@bootlin.com>
X-ClientProxiedBy: FR4P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::15) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|GV2PR10MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 2940355d-ac74-4cd7-807b-08de7eafab11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: yX4/Gxj+s7ESZqudz4XbPyYz+5eoaaj/cQBAcW/1kCw4xan04b9Eebo88ixzAfB6PoZuAOZQlv6j3TZKj4NJp3ZnGEy04v6jDGuTURskQ0qONkeMJpEb4uJfA+2itUf4Ly0U+G8VZJwg5SbaMBhAg1LF7WqIoPT8YmYxfs0LvU23vPlQ4sWpyubWftfP0ZwvYj0Rp3PdPUINeuxWfaxNTJjIZQ6Gq8fSrd9mNiMDxdCJ/Cx4OCagxNL0bMA1jsX2qRSZyT9fHRq/vKYvCwaYTxyJM7QfNnMJzF2G7UZjpNOSzFM3suaA2p69+QwWF/eSr16P+YXXa5VMGfIYpYYY4+tvT+m58ViYmWXxbtkWuFYoRn/AIzWBtiGn2k9poAwq7Ftw81nc19KJs4+zhAXUdDcKkhv5EGcYsgNoZd9GyGWK/5KMvnmzOgj4NJ1PIGz7yF/hgkG/6qjHBIr/soSsyz+ZlJq07uBj5ZqoSdt8tITL2ubsQsvdHHar97xXTJTwGI9bdLoHk/ylX5Nna+zvRQ/6DDQh17S6U5fJpf6PkbuKQrQBjFyGGtkEj4f0Lx6CDvMJmqLxuR1i5904QS/p+eL2z7PBXw4QhDPMMZ1ONM18VI1mLYQ6q8hKmKiRcvv9BMIELN80I1X+axrHifSz4eRMmCDvNNpgY0yX5L7yJw7AVg/8XMDVlR+RAo7whh33mmWO/Qtrka6iaOeEcTxQBw4r11UzEP4hazR+QCA3QWg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0l5YjdYQnBJS0tMMzVFRklvWDZvS1JmSjdxeWtqOUtacnhiL1RtbnBPVzhj?=
 =?utf-8?B?aFd3bTBSalkwVEpSeStPWE1uTU9zVElsNkNhVnhITGJ6QWhxZVhDZzF3OHpt?=
 =?utf-8?B?QVUrVjNlL3AvU2l5dU0ya1EvU0Juc2I5c0p6WGFoVkJ3ZHZVTWhyVTYzcWxE?=
 =?utf-8?B?U2oreHlEUUVUckVwb0NLcE5PU3o5WXlXV0lzSk9GYlVueC90Z0U3ODF2bVpo?=
 =?utf-8?B?SUhCUlZzb2JyMkFWTXJpZ3JJWHp4cnJKNFk2YWpLRXpFSjM5YTJXWjRqTGJy?=
 =?utf-8?B?Tkk2Z0VNd09Pd1BOLzI5VDlWa25JUkN4L2lKYzlMT29lR01zb21EcnAwL0Qr?=
 =?utf-8?B?OTNmVUNoY3I1bkxCbHcrSSswUk1GdFovOUVUQXFNUjRQdmZPRG5WV2ZIREl4?=
 =?utf-8?B?bUQ1WWNXTC9lVXZ3ZXY1K0MydUVCdDM4RTBCTjU0YzYvT1U2UG5YZC81R2tt?=
 =?utf-8?B?aURmdk1yN3VMbjBWMWZMbUd2YnRONGZFdmZEZ2VjK3FTRzV3cWFGaFJHY0FG?=
 =?utf-8?B?V0FBcml0ZG9BSzZhSG05ZmZJRG1GNkQ4VUhJc1VwRUlKdlhtOVdQVC9Ib1cv?=
 =?utf-8?B?STJ1bitNR1JrTFdKVkx0eXR4ZW1JZU5rZVIrbjd0Z3QzRnpVUnNmT3pqQlEr?=
 =?utf-8?B?dEhpR2V5RlduNlRtSjYxZHZCWVR2bUlvMEJmdkhxUE5CZDhtdnNFUEszcE80?=
 =?utf-8?B?MjJydzRuajNLeVJyN1pSbjBmUTV0anJBVmlTbm83V2tHN1hUQ1psL2luR2Ft?=
 =?utf-8?B?UUxwTVF3bVNrSVR3d1NRYURDakFBL0NEeVpRM2hFQUV4dEJrYTdWL2hDREJV?=
 =?utf-8?B?L1dTemVTdEpZQlF2MVFCZ2UvNFQvQWdBNTgyUEJCc1Zuc3YxYjV6SmtBTTlG?=
 =?utf-8?B?MDcwOWhHYmw2QmNYK2VBUGpSU0twR2kySFRreXJLVmJGV0plbnhiNzdnRUdj?=
 =?utf-8?B?QitJc2VLamNHenZvaUo1ZElFYkNOaGNLME0zODdXc1JzLzRsOVRnZURHbnNT?=
 =?utf-8?B?WEdCNFFCcEc2T1hKUjNaZlM2S3U0a3pwaWRMQnJpeW5HdWlaYlZYQzErSnBR?=
 =?utf-8?B?VENFa2YvQkUwc1ZZLzVuOEtXNXBxNUUwTGxXZUJQTEJvNnRBT2o2b09QZFJ2?=
 =?utf-8?B?ZTdwTGtjL3VYTVgyTGtsYlpsa1NOWmFwQVc1S3hEUnRCVVBrNFZPeGJWMnF5?=
 =?utf-8?B?V1ZzWmFaOGFmekdFdzhhczBxQ0JZa2pkY0lleW5LSlBIeURRT0RQZW1XM3dC?=
 =?utf-8?B?MEg2c25ySWd5Y1F1TjdGUC9tbnZIK0RUb2Q3Z2F6VVdDYkppOXNHVzFGL05L?=
 =?utf-8?B?UENwbi9xeS9TdG1iVTc3SzN2NUw2L2FiYXZ4UDdUOUZjZDlLOFBtR0x2azB4?=
 =?utf-8?B?bzQrN1hWQVlqaEJuZ1o1L3pYWk9QNTcvVVB1NlFvVTBwYk9hbk1iaTZlSE9G?=
 =?utf-8?B?a3ZHMHJBbExOVmpKaWkwWnkzNFYvRHNGSU50c2tacGdtUzVKZktDU1M2clY2?=
 =?utf-8?B?Ui9iaFY4R3ozeGQxcFVkZ0NMVWVVck5wWFJzczcxRU9NT1pvRlMvUHU0MHVS?=
 =?utf-8?B?U0sxbXlUZUREbjhpK3pGVnFLOFNMbWVzeGozK2tCS3JxSWY2OEVadmJUK0hY?=
 =?utf-8?B?dndlSUhSRG5wQmZTV2owWWlzRjEzVXg0K2habDkyY2xVSzN0K00rSzM3U1Mr?=
 =?utf-8?B?VTZzS1F0WmJvVEZpR2RHSzQ4cDZQN2tQVWpBRTBXZWtlMEtPbXlXbjExL0hk?=
 =?utf-8?B?eURvQ2MzNVdPYVBEcXRDVWs2NWUxVTYyYlRuK3owMGE3NE1oby95VVZlbEh0?=
 =?utf-8?B?Qkl5WXRGR21qeEdzbk5wdTBWQTJtb3pwa2Fhc2U0cnc1VVFLV3FkWkI5VHJB?=
 =?utf-8?B?aWZTTldWaFBCcEwzbnVIN0lnaG1ERGlFamxNYmdMY3MyOEU1bi9Xc3JkdzRo?=
 =?utf-8?B?MjRQRzlPb0g4aGpWSTY4aUtYaVhoSUtIRzA1RVcyN2NhcmxtOFlJYXBaVFl6?=
 =?utf-8?B?REFsVEtrVmtyWUI4Nk9NUFVPRERRd3VrZmtwUkw0OHhWT0FMUDB6VHVoN2hF?=
 =?utf-8?B?VU9VcE1zVjJmbHV1bmdHRlFQc1RXK1VMdW9BczRwTGMxc2JtbThNNzRKdzl0?=
 =?utf-8?B?WUgzdGZuRWpRbFpGeDBINDBpNWJPSUtvZTM4Y2Q3anErZm1rdzhjSzlDR1BU?=
 =?utf-8?B?a1FxbFNwRTU3d2RWM0xDcVJVdndGQVJjU2owSzZvK3ZIT200V290VURrU2Jt?=
 =?utf-8?B?bmZqY3FYSk1zbHlkUEIweXk0Mzl4VUJCY21DOFBSd0YrcTFKZGcyZlREUkZZ?=
 =?utf-8?B?dCtUbUVYeHVrcS9zdm1Lam1Hd1hia04zS29TbVJhbGQwbVZWWmpUMWkzSm9M?=
 =?utf-8?Q?ny170BaJPIcWY600=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2940355d-ac74-4cd7-807b-08de7eafab11
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:16:48.8927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iM4cQkoXj7Qia5eyQ1CbNFi+2bXaUvSQsQT+J/hsUZbS61BK1Q9aTBGsAYhOg+fEIwT/OGALIovtf8S0aSBLE6QoPrHKz293quCfqwFp55M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB8040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_071657_958387_CD7C199D 
X-CRM114-Status: GOOD (  21.80  )
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

SGkgTWlxdcOobCwKCk9uIDA5LjAzLjI2IDE2OjA5LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhp
IEZyaWVkZXIsCj4gCj4gRmlyc3QsIHRoYW5rcyBmb3IgdGhlIHNlcmllcyEgSSBiZWxpZXZlIGl0
IHdpbGwgY29uZmxpY3Qgd2l0aCB0aGUgU1BJCj4gdHVuaW5nIHNlcmllcyBhcyB5b3UgbWVudGlv
bmVkLCBidXQgd2Ugc2hvdWxkIGJlIGFibGUgdG8gbWFrZSB0aGVtIGxpdmUKPiBzaWRlIGJ5IHNp
ZGUuCgpPaywgZ29vZCEgVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrIQoKPiAKPiBPbiAwMy8wMy8y
MDI2IGF0IDE3OjI5OjI3ICswMSwgRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlckBmcmlzLmRlPiB3
cm90ZToKPiAKPj4gRnJvbTogRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250
cm9uLmRlPgo+Pgo+PiBXaXRoIGNsb2NrIHJhdGVzIGNoYW5naW5nIG9uIGEgcGVyLW9wIGJhc2lz
LCB3ZSBuZWVkIHRvIG1ha2Ugc3VyZQo+PiB0aGF0IHdlIG1lZXQgdGhlIFJYIHNhbXBsaW5nIHBv
aW50IGRlbGF5IGNvbnN0cmFpbnQgb2YgdGhlIHVuZGVybHlpbmcKPj4gU1BJIGNoaXAuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEZyaWVkZXIgU2NocmVtcGYgPGZyaWVkZXIuc2NocmVtcGZAa29udHJv
bi5kZT4KPj4gLS0tCj4+ICBkcml2ZXJzL3NwaS9zcGktbWVtLmMgfCAyICsrCj4+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9z
cGktbWVtLmMgYi9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPj4gaW5kZXggYTA5MzcxYTA3NWQyZS4u
NmI4YmVlN2Q2ZjVlMyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLW1lbS5jCj4+ICsr
KyBiL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+PiBAQCAtNTg5LDYgKzU4OSw4IEBAIHZvaWQgc3Bp
X21lbV9hZGp1c3Rfb3BfZnJlcShzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBzdHJ1Y3Qgc3BpX21lbV9v
cCAqb3ApCj4+ICB7Cj4+ICAJaWYgKCFvcC0+bWF4X2ZyZXEgfHwgb3AtPm1heF9mcmVxID4gbWVt
LT5zcGktPm1heF9zcGVlZF9oeikKPj4gIAkJb3AtPm1heF9mcmVxID0gbWVtLT5zcGktPm1heF9z
cGVlZF9oejsKPj4gKwo+PiArCW9wLT5tYXhfZnJlcSA9IHNwaV9zZXRfcnhfc2FtcGxpbmdfcG9p
bnQobWVtLT5zcGksCj4+IG9wLT5tYXhfZnJlcSk7Cj4gCj4gSG93IGNhbiB0aGlzIHdvcmsgd2l0
aCB0aGUgYWJvdmUgMiBsaW5lcz8gTWF5YmUgdGhlcmUgd2lsbCBiZSB0aGUgbmVlZAo+IHRvIHVz
ZSBhICJtaW4gb2YgdGhlIG1heCIgZnJlcXVlbmNpZXM/CgpUaGUgc2FtcGxpbmcgcG9pbnQgZGVs
YXkgaXMgY291cGxlZCB0byB0aGUgY2xvY2sgZnJlcXVlbmN5LiBTbyBpZiB0aGUKY2xvY2sgY2hh
bmdlcyBwZXItb3AsIHdlIGFsc28gbmVlZCB0byBjaGFuZ2UgdGhlIHNhbXBsaW5nIGRlbGF5IHBl
ci1vcC4KCkluIGdlbmVyYWwsIGlmIHdlIHdhbnQgdG8gYXZvaWQgc3dpdGNoaW5nIHRoZSBwYXJh
bWV0ZXJzIGJhY2sgYW5kIGZvcnRoCmluIGNhc2VzIG9mIGFsdGVybmF0aW5nIG9wcyB3aXRoIGRp
ZmZlcmVudCBtYXggZnJlcXVlbmNpZXMsIHdlIHNob3VsZAptYXliZSBkbyBzb21lICJtaW4gb2Yg
dGhlIG1heCIgY2FsY3VsYXRpb24gYW5kIHVzZSB0aGUgcmVzdWx0aW5nCmZyZXF1ZW5jeSBmb3Ig
YWxsIG9wcy4KCklzIHRoYXQgd2hhdCB5b3UgbWVhbj8KCldlIGNvdWxkIGV2ZW4gc2V0IGEgdGhy
ZXNob2xkIHRvIGRlY2lkZSBiZXR3ZWVuIHVzaW5nIGEgY29tbW9uICJtaW4gb2YKdGhlIG1heCIg
ZnJlcXVlbmN5IG9yIGRvIHRoZSBzd2l0Y2hpbmcgcGVyLW9wLgoKT25lIG90aGVyIHBvc3NpYmls
aXR5IHdvdWxkIGJlIHRvIHNvbWVob3cgY2FjaGUgdGhlIHBlci1vcCBmcmVxdWVuY2llcwphbmQg
Y2FsY3VsYXRlZCBzYW1wbGluZyBkZWxheSB2YWx1ZXMgc28gdGhleSBjYW4gYmUgcmV1c2VkIHdo
ZW4Kc3dpdGNoaW5nIHdpdGhvdXQgbXVjaCBvdmVyaGVhZC4KClRoZXJlIGlzIG9uZSBtb3JlIGlz
c3VlIHRoYXQgaXMgbm90IHlldCBjb3ZlcmVkIGJ5IHRoaXMgc2VyaWVzOiBCZWZvcmUKc3BpbmFu
ZF9pZF9kZXRlY3QoKSB3ZSBkb24ndCBrbm93IHlldCB3aGF0IFJYIHNhbXBsaW5nIGRlbGF5IHZh
bHVlIHRoZQpjaGlwIHJlcXVpcmVzLCBidXQgd2UgYWxyZWFkeSB1c2UgcmVhZC1zdGF0dXMgYW5k
IHJlYWQtaWQgb3BlcmF0aW9ucyBhdAptYXhpbXVtIGNoaXAgY2xvY2suCgpGb3IgZXhhbXBsZSBv
biBXaW5ib25kIFcyNU4wNEtWIHRoaXMgbGVhZHMgdG8gZGV0ZWN0aW9uIGZhaWx1cmVzLiBTbyB3
ZQpzaG91bGQgbWF5YmUgaW50cm9kdWNlIHNvbWUga2luZCBvZiByZWR1Y2VkIGNsb2NrIHNldHBv
aW50IGZvciB0aGUKaW5pdGlhbCBkZXRlY3Rpb24sIHRoYXQgaXMgc2FmZSB0byBiZSB1c2VkIHdp
dGhvdXQgUlggc2FtcGxpbmcgZGVsYXkKY29tcGVuc2F0aW9uLgoKVGhhbmtzCkZyaWVkZXIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
