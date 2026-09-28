Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEE0CA5FA2
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2026 12:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NCM68k0p77nFx/B2xSInRChXNJqMIOb1jIDvcg+TIxo=; b=snLcOoRvZz58jZ
	s2eOAw5QIBtgHY3WCxkxkNmWqe3yJr8bUWCfx2K+HjRxFdXMDPr7HWjSPEK500MntPI0WjY4OugpD
	Uary5I6geYpXwgR3KB+TrosSfa9K9csQvQCu55slIPnNO50JK07vYEZ/LfjN3aag99GOiF2Xq5CSu
	HD9SyEy7sa9NjSExpxdEX0k1sQI+LQv6SAmFCwcv3HKSvD2tmFUb8t00o2MizUMGmDBoj+YWN33UE
	2eFROra9skD8aK5DqhTFcB/P/exXJCWwFqeyoHIt1c67gCnWniPA3B5r0MfgCBmEupNsmiOb0aw8Q
	rj1AVVT9IoQiLnPZiseQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAVT-00000000Yhl-3Vgz;
	Mon, 28 Sep 2026 12:30:55 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAVR-00000000YgL-0Qca
	for linux-mtd@lists.infradead.org;
	Mon, 28 Sep 2026 12:30:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i09qYimp2KpBQMCPblohhc7U1M1CluzAAdCE83xlzGCrXzY6Ph3v7dRgC+QpJGA99+YkTZXdtwuWykDgmq6asmUj7/ROYzlMa2fGezwz6Qygs/i8+wD80vFpYlWhJhg8/zaD1DjZ+iIoSafmABHzllOk6VRejBYCQE4/arIESCZ5fu5ie3b7zbwxpRQuoVkJLn9Z+xFBXd8gULH5d+fDp99980EbthnH5K6UmVW6JXK0CYy++grQ15uCYuQCE0AeHyP6Fw6XfwNd7UWElCxzE76roIUihuwa+rHPaRrCwN+ZOfO49xSlPn7OqiYqvOyYc+U5+hLxA/tKl+cKYuZ88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwLjxXKT63Z6gQzENfTcMTVleVDkigZEc1YJceOtano=;
 b=LtCpz7gdbPTZns84A4nDacCpcsvLiFSEttPg6GgvrDRAMO/dI0xWGHt3+eUsiWH9kaOGr5ClP5h2irtXAAd4abIneKyByPTFWc+HxmgNe0/YzDOJ0EQ3Tlb70OJAIBmaIKDpzcGjSzEuRoYyCuQ0j88zHHrZCZ/7trntLT/4Jxwvts2A3LDa2WDL8mqvc88520nUgFaiC0ObFy0mpQWRlB4zqfotBUtqHpKJnq85iVBX/CwmJ2yhSYnfvxZXNsgeSP2Ipz5hcoqK0mlffa/G+MPNkOjBcIZonHdoyV4jiDs7BQu4cXedK5JtGvdSjoYLNJiqm1mRnYxGijQwHkSZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwLjxXKT63Z6gQzENfTcMTVleVDkigZEc1YJceOtano=;
 b=N37iruGMCr8tvImJ0oHw4/yqcdcLOOk8ZnmHsv3y40rDhqLSdpVbkOPt/KqyHnphdQiszBoG47hbc2wOZGHcZCBnm6EGfvP9gnJ5enj5u9V6Tnd5kDCQG+45aXA5dfkMKkH+GPV17ELPMKP/ue1fvFcDIwr+cBkqknmpAKCqhm1YVAtoRgcCO7jtJu75Lh99b+nozQEvfNwywfpdpfEhu0F3aQ44iXkdyELJNsfE5FwsRbHvmnUqRqpYWoWKs9pVyaz0q/NMdwbAmvUTaQcbngB6QV6R4ZXpUO7rIm3yuvWhmGmhAloly3UBsRlQigS+QWH9j+XXHSESLT4cZLLuPw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by VI1PR04MB9881.eurprd04.prod.outlook.com
 (2603:10a6:800:1e1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:30:45 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:30:45 +0000
From: haibo.chen@oss.nxp.com
Date: Mon, 28 Sep 2026 20:34:40 +0800
Subject: [PATCH] mtd: spi-nor: do not issue the legacy RDCR (0x35) in
 8D-8D-8D mode
Message-Id: <20260928-spi-nor-fix-v1-1-ce65ba90cfbd@nxp.com>
X-B4-Tracking: v=1; b=H4sIAN9eumoC/x2MQQqAIBAAvyJ7bsGWyOor0UFrq72oKEQg/j3pO
 AMzBTIn4QyLKpD4kSzBN+g7Bftt/cUoR2MgTaOeacIcBX1IeMqL7Aw7JrJm0NCKmLjp/7ZutX7
 A5HCZXQAAAA==
X-Change-ID: 20260928-spi-nor-fix-eb7ebe22a740
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 michael@walle.cc, imx@lists.linux.dev, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790598909; l=4932;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=5m+O29imoIgcw/xB3+g/3HW+OkVgJZsk7Q+z+14xVCw=;
 b=zi40QlVQKapc6uJMLagAaCevvm72fmg1FMyysh/mm5dZ7QNrBCMVZcUwJvB/DFHwoQLK/5Eet
 hOv6ZLqIyQvCbv/v2MXoalowU0BFS+uQIgRiyOj6Ovxk/TQxtMYtDSW
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: MA5P287CA0198.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::11) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|VI1PR04MB9881:EE_
X-MS-Office365-Filtering-Correlation-Id: b17efdbf-8ad2-48ca-d226-08df1d5c51b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|19092799006|10067099003|11063799006|5023799004|3023799007|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: KarsRchK0E+ekE+Y0iBRWtPvF9bMKB9sg67szKcvNYVJsVNU0BdoBmEE+BD0cWStjnORfCizzSK3UAKKzpftl95tcLDPaIwny58RpWQSN7kbwzDF20QOhZm2yfEph52GOG1qsOjA63OwjBfn1SLFVAQLGO4QOeDItGZBlERi96k0sFpe8ObUzvdtYWbIljKTBWYFIlcAFCpxEwJPpeu2tMby0BS4F7RQCTU+JqN9hqve3BXlxxxksoMpwJpHpp/+F6CAvBkUpG0KueNtReN46FQTu2BXycAPR/hdwS5c75MYQ3b90fbql8eYNau3JGKasOlCgMhlJrp/8ltJQX2DDNUOKY8adj0srpYRUjbN9raLKvyzd+KTlfHJD0md7dnrWfWC0/5ZZt8TxsA3/5Xqua/g4RmziyhjwRD2+ZEsltU/Qtab9zG1xk3kfr9qCdwVk+gQtI51ly5/6leVkoqhbFK7nBdJaxgx1R7SjvADfzKXEqNRK8pcSf/wqw3n0bNJqaGuD/yUqpOUb9s6zfrmQzbce4WyIm6w0b6GBMNKuwXqo9J1lzA9aGPtrv3OdUqtVbUeVLtlNmeNpevR3I1BwWXBg/cAx6VYjuapbr4YrJVI8iOlJh8g+kUXc0E3Q2rNNZcpLOkHn04hT2J4/wdBLmmTM4KPsEDR2edJLBrst2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(19092799006)(10067099003)(11063799006)(5023799004)(3023799007)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVRSY3pEN1BlMDRMOUtvVk5vcXRGNStCUE1iYkZqcjh6QVV1UWdEcEhhYWt3?=
 =?utf-8?B?WEs3bi9UZ3E2Sk9NL2ZUcmdRL0JmdTliQkFBSjJlTFppMVRKMWhidW1FMFE0?=
 =?utf-8?B?ZXlOVVhJS0JVdjdJN0xNbFZ1cFRLSXRvYUtIQ0Y2TW1WaWRwMEVxdmdMb3VW?=
 =?utf-8?B?dUg1ZnlFbktLeDh5bWlKQWtuL2kyUHBGM2FMM2E5UW00b3V5ZUFQUkwwSXd0?=
 =?utf-8?B?Z25OVGthaEx3WGhGb0o3QVVkSFFVbllBMUNRZ1gybEsyYUFrZUROR29zMjl3?=
 =?utf-8?B?cTRSejlJdW9GTEwwbEwvOGYzVlJsU05vWXpwWGZMVVRGTm1Tb2pEQkQ4Qmk1?=
 =?utf-8?B?NGJ1WjBVT2RQaHRVWC9ncXk0UCtycytxZy9sampVS0gyUVFpQVhBSi9ROUJw?=
 =?utf-8?B?TnRVbmlFcEIwZVlrL2JsYnJVcEhrZ2Zhbll2Um1VZjFuUU5jUGwvbVA2dUl1?=
 =?utf-8?B?dEM5WTNXNE11NWtTRTZMYXd2a01RYnN0bXJWRHpQZ2NtV0pxdGg4a1dlVVhi?=
 =?utf-8?B?Wk5sa1VvS1lpTC9tbXhxYmhyTmo2VE5hT0NJd2w3Zkg5V3VTZjFmZ3hhS1c1?=
 =?utf-8?B?MUVMYXlkTnlQdHRneDFpUHg2bGI4a0REK0ZGZUlLbC9ZOUFBSU92S3JhaWQr?=
 =?utf-8?B?T00yaXJHRUFTUE1hV3BzK3c2V2MzSndtZklNMnYrOEgwdkcwWG9WZWc5QTRy?=
 =?utf-8?B?enk1dmxyNG9MNVRSTEp3Q1NrdldkM3VuQzdiK0JBVDF6OGtIeXZCelhMbVdH?=
 =?utf-8?B?cG1aTUFEdm01UnRJWFRyV1NEbGcwM2dpQ0FnWkdVTmQ0bXZIOHVHeVpvNnpU?=
 =?utf-8?B?NnhpVmw3dDlGQXgvamdsV0tkRVlhN2t1c2V6Vi9GWmxUQXk3a3IrQTk2bGdQ?=
 =?utf-8?B?eHRpUTR0MEhzeWNNWFdndHpWUlRDd0tsQVJhck1BQ1FVTVZVK0NiVkNkelJp?=
 =?utf-8?B?Y28rUjcvQndzeHJNc3FjM2hpaFozeTF3Z1Nnbnd2RjJEM2MrYjNEUTQ3WmpX?=
 =?utf-8?B?L3craG5KTm01Zld1WkZTdlg3Z0pxc0lzY0U4YVFneSszMzRha0FUQWxXbVJP?=
 =?utf-8?B?Zm9sbU5aMVBpeXQ5TGpNZkdnT3I0WDJ0V2N4d0lKcCs3WHlReEJEQlBhcFJw?=
 =?utf-8?B?Rnl4Zzl4U3pYdmZVc1UyZ0hyM1pUZGZSTGxQU2Zvd2Y4RU8yQjdsaCtnNG5j?=
 =?utf-8?B?SXRJd2lwa1pIeUlINCtVMnAycUtNV1Y4cEQxOERNcGtrazFFNHhsRklJM2tK?=
 =?utf-8?B?Y2hUTHRUR2RkMDR2MVZ2NDhyTEpiQlY1TE83RnExRjR3T3psVVpYclhBNjhl?=
 =?utf-8?B?eDdBc3Y4dnZSRFhVZjV2MnJBOWNpZkhnQ3pPeFIvSXlEWis1WCtua2l4Y0xV?=
 =?utf-8?B?QnE1bnVxTjlJWWdCUjZsYXU2YlQwS0pNZkRtMzRpNlBUWWluWWdoZWcyUDIz?=
 =?utf-8?B?dm5weS9zQXhBZzNZTk5kcSszOTZqaUFEUDk2Sjl4WGtKNnl1OS9WQU90M0Ez?=
 =?utf-8?B?R2R2eXU0VUFlS1lVY0c0YzhING9XREtSZE11TGlRTmFuY1QxU3ZQM0d4NkhQ?=
 =?utf-8?B?MEQybWJTd1lsZW1KemZ4dGNhZ0JPSnFnd1dacXRmY3BIR3JiWWpiZlYzekp0?=
 =?utf-8?B?TlZDRnh0YldoMUhRd3hVbkxSTkdiSFlBYTd4c3dGREt3ZHJhYitOMVI4N2dk?=
 =?utf-8?B?SVcyMkJ6MTdnYWwzb2VEM1FMUUFvYTJaTUdvS0NKOUVnS2d4Tnh6TkdXVExW?=
 =?utf-8?B?SWxBUWVhVGxCa0Z2OEVpRGZaTksrUld6TUpGWEFyN0l5Z3l4eGFSeW8rUFNF?=
 =?utf-8?B?UllUcFlBeDdGZzJnc3FSMlJtd1RSS2JWcEl6QXVPT0JodHMyQzBpdzVYSnJF?=
 =?utf-8?B?aXV6RnNGSlNjeE5mTjdvQmM2azJRVzZOMndqeGFLakZiZnVnS1p2QlNESnpQ?=
 =?utf-8?B?Szd3c3NGRmhBampWLzdnZXJXbWRDK29ZNGlXYnBnNjhPQnpMZU9SMmEydjFn?=
 =?utf-8?B?aGdSTjhtT29SQXN0eTVGcGtaWTg1dW5vdDJrUElUcUdUQXpYQzJ4MEdLNmFk?=
 =?utf-8?B?K05zSjZwUUFPWVZHeE9ZSWxLK0lEdDV3cUQyNmNMeWxueUVIaWZ1QVI4eXdx?=
 =?utf-8?B?N3lYaGxCL1JySUFzWXRhQWs3Y2E3WU5pNDdsSTRPQzJwYy9VNUQxclFZa3Bu?=
 =?utf-8?B?SVF6K3VPM0piSkpYNDF4OVR0bDlMNkcvOHlnV2ZheXp5OGhoekN6WnlreU5k?=
 =?utf-8?B?b09XVHJJVVB6ZVJmQ2tzNUZEUDJkRzJKQWJVcUFtT3RLSE1za2FzbTRBeGJU?=
 =?utf-8?B?bVRKZzFkTlYyM3RnZ1dOQ1NwYTJ6WDNzTm9yRHJtVmJIZ0lWSXJyT2dWUGVB?=
 =?utf-8?Q?m1q7CLFlsIAHQajEScL1+bzN33GKNJ2V0EZvK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17efdbf-8ad2-48ca-d226-08df1d5c51b5
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:30:45.6817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZFySyMivIke+vqioIzzJuvIOezbF4aGFLSS2RZfk31OuCuLBsC0+s5RDOYjcUAXoAM0qs80vZ5+miInEZTT65wjjtMfC3AzCnv3zLB0KyyG13+xvGHcLSZ9Df8TqhRQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9881
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_053053_182739_00CD42F4 
X-CRM114-Status: GOOD (  20.48  )
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

From: Haibo Chen <haibo.chen@nxp.com>

spi_nor_init_default_params() unconditionally sets opcodes.read_sr2 to
the legacy RDCR opcode (0x35) for every flash. This default is meant for
the (x)STR quad-enable case (QE bit in SR2 bit1, read back via 0x35);
it was never intended for 8D-8D-8D. During spi_nor_init(),
spi_nor_cache_sr_lock_bits() reads SR1 and SR2 to seed the debugfs lock
bit cache, and this runs after the flash has already been switched to
its runtime protocol - including 8D-8D-8D (OPI/DOPI) mode.

RDCR (0x35) is the single-byte "read SR2/configuration register" opcode
and is only meaningful in the (x)STR protocols. In 8D-8D-8D mode a flash
exposes its second status/configuration register through a
vendor-specific indirect register space, or does not expose it at all,
so issuing a bare 0x35 is an unsupported command. The flash drives no
data, the controller RX FIFO stays empty and the register read times
out. On i.MX FlexSPI this is seen as a -ETIMEDOUT and a controller
WARN() during probe, e.g. with a Micron MT35xU (2c 5b 1b) and a
Macronix (c2 ..) octal flash, killing the spi-nor probe.

This is not a per-vendor quirk: it affects any octal-DTR flash that
never got a dedicated 8D-capable SR2 read opcode installed by its
manufacturer driver. Guard the read in the core instead of patching
each vendor: in spi_nor_read_sr2(), when the current register protocol
is 8D-8D-8D and read_sr2 is still the default RDCR, return -EOPNOTSUPP
rather than sending 0x35. spi_nor_read_sr2_careful() (the swp.c early
init user) now routes through spi_nor_read_sr2() and treats -EOPNOTSUPP
as "no SR2", using the QE-based guess so the lock bit caching does not
fail on OPI/DOPI flashes.

A manufacturer driver that provides a real 8D-capable SR2 read opcode
(anything other than the default RDCR) is unaffected by this guard.

Assisted-by: LLM
Fixes: b7b63475903c ("mtd: spi-nor: Create a local SR cache")
Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/mtd/spi-nor/core.c | 15 +++++++++++++++
 drivers/mtd/spi-nor/swp.c  | 21 ++++++++++++++-------
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 90524c58602e1c27cd83951ab0cdd3669a2ebfd6..9e176777fae35d815db53fda0056e40ad986a208 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -844,6 +844,21 @@ int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
 	if (!params->opcodes.read_sr2)
 		return -EINVAL;
 
+	/*
+	 * RDCR (0x35) is the legacy single-byte "read SR2/configuration
+	 * register" opcode and is only meaningful in the (x)STR protocols. In
+	 * 8D-8D-8D (OPI/DOPI) mode flashes expose their second status or
+	 * configuration register through a vendor-specific indirect register
+	 * space, or do not expose it at all, so issuing a bare 0x35 is an
+	 * unsupported command: the flash drives no data and the controller
+	 * read times out. Unless a manufacturer driver installed a dedicated
+	 * 8D-capable read_sr2 opcode (i.e. something other than the default
+	 * RDCR), skip the SR2 read in 8D mode.
+	 */
+	if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR &&
+	    params->opcodes.read_sr2 == SPINOR_OP_RDCR)
+		return -EOPNOTSUPP;
+
 	return spi_nor_read_sr_ll(nor, params->opcodes.read_sr2, sr2, 1);
 }
 
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 7e667e4ca84d5101471e60bc839b2ecc23958294..f8dea179f09930af76b8026773d8b648e620fa81 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -211,19 +211,26 @@ static int spi_nor_read_sr2_careful(struct spi_nor *nor, u8 *sr2)
 	int ret;
 
 	if (params->opcodes.read_sr2) {
-		ret = spi_nor_read_sr_ll(nor, params->opcodes.read_sr2, sr2, 1);
-		if (ret)
+		ret = spi_nor_read_sr2(nor, sr2);
+		/*
+		 * spi_nor_read_sr2() returns -EOPNOTSUPP when the only SR2
+		 * read opcode is the legacy RDCR (0x35), which cannot be
+		 * issued in 8D-8D-8D mode. In that case use the QE-based guess
+		 * below instead, so early init (SR lock bit caching) does not
+		 * fail on OPI/DOPI flashes.
+		 */
+		if (ret != -EOPNOTSUPP)
 			return ret;
-	} else if ((spi_nor_get_protocol_width(nor->read_proto) == 4 ||
-		   spi_nor_get_protocol_width(nor->write_proto) == 4) &&
-		   nor->params->quad_enable) {
+	}
+
+	if ((spi_nor_get_protocol_width(nor->read_proto) == 4 ||
+	     spi_nor_get_protocol_width(nor->write_proto) == 4) &&
+	    nor->params->quad_enable) {
 		/*
 		 * Make sure the QE bit is persistently kept. qe_mask[1] will be
 		 * 0 if the QE bit is in SR1.
 		 */
 		*sr2 = params->qe_mask[1];
-	} else {
-		return 0;
 	}
 
 	return 0;

---
base-commit: ba52b770f89bd2f3771b98edb92c4fde68ca8cc4
change-id: 20260928-spi-nor-fix-eb7ebe22a740

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
