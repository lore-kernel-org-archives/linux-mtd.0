Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35605CDB46B
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jun 2026 16:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLtdkYsRTAE8oObFwC2uaCn/TrZ4Ew2lAAXfa1XBI4M=; b=mz48Eoi25gV2BGMo8EnSauWa5K
	BpcDxtU3AieZmX+WACMz3Jc0wdv7NHErYQyp2KsxT6zse0wC8Oan/OYRwye8K7m1K+DJuTceCnOp3
	44EyQ+qUFxR6ooP3VTHs8ckw8ZJTFE3E4lbhu2ydAp0HSNUKX9VhciliBVuL+B+TjWBz+jTGWufzC
	BNsGuaJxoV6UcLcSEvohs+7mQKRcjQzDcPS3oaqHBODkCs/FQg3jr4M8A1lhWopPkeywWEqPoJWoW
	sZASutGtZlKcrSB4WGz3bxvX1Xdz98FuZNZlUS7jOzzNzIMwT9EYrLU4bG+hTO5ScdDorh/JJxEku
	tbzTR+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wayB9-00000003RrW-3hHF;
	Sat, 20 Jun 2026 16:04:19 +0000
Received: from mail-japaneastazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d405::2] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wayB4-00000003Rqw-3MI9
	for linux-mtd@lists.infradead.org;
	Sat, 20 Jun 2026 16:04:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oM/LDHuoCt0mT3ZZj3Odv57N9rz+DHnRhwXwB0yq2ug3Qc6WBfo8VYmQAMRzynAqGpDPEc5/uh5pxZyZsgLxtFnViM3HFeDV8R/iZbhg9SteWtscGGBvUn56XA7Stw4oUeTrHgD2cVaUZXt9qYL9JaFtg78J9fU9zSRmpcTbx2QQ+WpBs2NOw9BRCcNcT4KMJ1gC3jJHwiLCCI3I721xAd+6b1nPvOnBYJMiMpvhW3VDJBXlP/oKkrqeBz49ASBcim10PcM6c1zbh5e9PaTL6VPe+DyZb5AYnxw4QMQugGmUoBUc8OEQSvr9U4aj1my4emiIqiDGv8OKs4IGihPt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnXOSWISb3XA2MKkAuHc86t0gQejaqx6kBQyh7X6WdE=;
 b=l3phhacq0EMBSSd/Ax/ki7Xr+XgaZagEM4i4/1tYnQRtFVEcjdHOIqRwThNDuWf2Ns6rbwNDNg/CvQJhmkbPTiMsFA5/ZhvawSIk2eVLiV6nzu/H9WyTa/e3Jjv6hMxXCrenC0FSZhnosWK0EVariXcI4eTx/tiTMImU3qjTC8soSI+4gbNC8DJ4tayicP4KrgdDaZHaSdzPFFaxswPofROsls+l8nErePHdqd4P9uyxK+Jilw2hfFI7J9jlvBYqGxMNP4IsDTfGdz/gpAZSX/nPrXfZD5PmwX1c9fkzuS+LR8a7r+rCVFHEoGgmMMQNmoJ+pGCBTDIeFLEoUZTGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnXOSWISb3XA2MKkAuHc86t0gQejaqx6kBQyh7X6WdE=;
 b=MtGDdaa+ZVOEu/yjNmUPCoG7x/Ah9hKqyUM7rqdMLBB74gt0GXQ/tLO80N93SC7CyQOINyhQ1Mm0rb+7nNd/T20/qAhjzQKvA25w0QwWEqVO5mNVjS0RdVSH+cXbRfBdZ7qdBycLgKaMSrgpCgA02r0VRXdD3cUqanvHorxh7rz9tzk3yfOOJ+L3aIbrWZhKBPG7UkkC2cbRnZIdpt5goeKFw6cM5g9liLxcQqB1AycGNxfBoO4Pil7Oy6clEC/4l6g1o2EKZwzOzMvRXm2CoBl6RIAI76eQZ+U9/zEYFe9wx/a66BCD37+0qR/OMunsJ01m5zIrvQbxOtjDzGFivg==
Received: from SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1e1::9) by KUXPR01MB8117.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:a5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 16:03:58 +0000
Received: from SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 ([fe80::36dc:66d8:26a6:5612]) by SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 ([fe80::36dc:66d8:26a6:5612%5]) with mapi id 15.21.0139.011; Sat, 20 Jun 2026
 16:03:57 +0000
Message-ID: <SEYPR01MB58826F4355F2706E10DFB8C6C9E12@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
Date: Sun, 21 Jun 2026 00:03:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mtd: spinand: fmsh: add support for FM25G{01,02}B
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "cnsztl@gmail.com" <cnsztl@gmail.com>,
 "csharper2005@gmail.com" <csharper2005@gmail.com>,
 "mikhail.kshevetskiy@iopsys.eu" <mikhail.kshevetskiy@iopsys.eu>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <SEYPR01MB58821E380C5DD8F7B3FFDA23C9142@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
 <87fr2t8ryf.fsf@bootlin.com>
From: Ziyang Huang <hzyitc@outlook.com>
In-Reply-To: <87fr2t8ryf.fsf@bootlin.com>
X-ClientProxiedBy: TP0P295CA0033.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::14) To SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1e1::9)
X-Microsoft-Original-Message-ID: <32a8536d-eef3-4f55-84b1-3f5e6877ccfe@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR01MB5882:EE_|KUXPR01MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: 22943fd3-985d-4413-8ea6-08decee5889f
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799012|4140399003|51005399006|23021999003|5072599009|8060799015|15080799012|25010399006|6090799003|24021099003|26104999009|40105399003|3412199025|440099028|10035399007;
X-Microsoft-Antispam-Message-Info: Z5zEutASUNOHTeFoHPfl7t2fwfjFIuGi/f5WbcwsW9JEprbufU0A/rq9RZ6zQm088BO2pSga5mazg2RtOIbltulRR39XuGEvLO+7/L64fKRAWQO2OAQt6dj9YKCrJaBbIuC9B2ERuMTKUa/cn1qzkz2uqQp/ncAn49JFa/yrPj8rAKH5TGBiWKnH7/yURoXEPhN8CEuSxcbl73AVMf80XzB6+q6BooYQVoGJhJCWkPBIdtZbihpLel9nj7k+kIr/cOO3aOSNc/PooOJKkrBYlmXQh4p+Owdi3Gmmbi/ddQ8xb8wQrs1UG5gGH8VRV1tUF+rph+wliWgGxAZ0feBr1J3t4ZWJIqIDcRMJAzO1VhRI8BX/+8jVOtwJ3gLq1WBV9GuVU2ufXX1p8xNVC6azA/aVPo/eTP3BdXRtaZBKuJ5brur8xUPfW5UTd6dz13sifu+TzFpgm6qb5UBez10vr5HGeA942KWed1smubNDHVdTE0mzGNJYS5UeGm2ju8znnZ9uicVv8s/9znJY2tgYpfFXiVm+B1gE53/4GKgx0ZHD/Jc5UZeBUowKWT4jX9DmIMqzJOfSrnn6rBx3+6NMmeZBoAkiRagXDPvaUL1IBEwbtViC+AusXbkWPbWoTk2fgpz/90/VKm8fOhhxdZnHOcCtZ4mCkGBc1H9miBAv75IVdtX4x1xp5Ky9dFnHEdtMdHyDydbuTMe9Mjjm9R2Eqp9ppz6HCitx2yK2C/TTTSQuiasxjY+YC9Z2aHrgTgFSU23PN0I/iyhyNWl0O7VoUvAHQBtCvV671uhghwZXKEYfiYR+wfwjuUHNu3Frvk6o6amLjuXniKL2l2zOcucivwd8EH/7GG8IaVOAi9lvs1dtU30XIU3Z3Tk+icFfvQ1dMJxqc6Hl5DE0LOKmZ6IU2RMRRyze2i1pUPVs6zlAtQxC1qTcDThq+dSA3DLmtlJx
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjgyVkZUTmJhS1dBM21UNUdjeEsvd3dCc2MvbElrWUEzMzVzeVNvbTk0Syt5?=
 =?utf-8?B?M1Q0eWZEQVN2WnM1K01YV1FzNDhDSWdCSjJCejl4S1VYZmloaHpHSEkvTi9R?=
 =?utf-8?B?ZVREQzlsci9iM0prZDQ3aVR3QVJCN0N2RlVJTzUvWlF2Mk15RGVWaGp4NGR2?=
 =?utf-8?B?aEN2MzV2dWIvR1hTZVdnd3EwWE43MU5ESTJwbHhyMll6NWwvRWc4SWx2SDBG?=
 =?utf-8?B?MjFsNXZaWG9DT1p6ZGsvSkI5ZmQyYjRHcm1yazUySVc2cHE5SWc2OExUNkxx?=
 =?utf-8?B?UmUzTHY1K2NwaDQrTnJGTG1TNEVUckVTNmpoU1ZVM0RlTDNLU2J4NXY0NG5h?=
 =?utf-8?B?TmZjR01VZnpXNnIrU3NsbkNkLzFFcEZ1cm12RXorL0JqdEZhbzZLK3NYaUl4?=
 =?utf-8?B?TlArZ1FDeFoxZTlxSlYzWEtSeS9TajFxeTFhcFUySFJMR1l3aFBkbEpaN3RD?=
 =?utf-8?B?NUhpQWNSRkRmclN1TWgxMlRnK2diOWptcVU4QnUrUS9SdENxTUZ6aHJCSS9t?=
 =?utf-8?B?RFUzWVJ5Q1lVRm9uYjdIaE9Vc1NEOVZQOUZtYUlTWXZwdTJKYVRPYUljYWxT?=
 =?utf-8?B?VU45N1Q4aHQ4OUN4OXNkcGNDQWxjNlh3cjFFcHovQXhKOExTanpTRDFkbnlL?=
 =?utf-8?B?T25Kc0gxRzZTZlZGaTlrUTJaeWh0ZFJKS1pVcnNUTk1xdk8rRlFxOWJxa0VQ?=
 =?utf-8?B?SjZqVm4wbWM5aWw5M0tNV2lGd2RtcVhLNEZFZ3Zqb0hQdEpHMnBkUHg0YUVy?=
 =?utf-8?B?ekdrSGtrV1JmL2x2Ryt5QnJTSU8rMzR1SG1ac0E5UWxPVGt5bkV5V2ViUFk3?=
 =?utf-8?B?Qnh0djZLVnZKTVFTZEp5MStuczc5V29ISGliYXIwMVVxNER2S3NhMUpLejVO?=
 =?utf-8?B?eWtVbWpHai9jckVaS1AySXZ6ODVYTDdwZGJwQmhZdUdMOU5Ub3ZkYU1SeWR2?=
 =?utf-8?B?bHZCaGlqR3JUZGd1bk5Qb3ZBRTk3ZVZsVVlkVUdzMjVvQWNURTI5UVkzVHRo?=
 =?utf-8?B?TjErRm5qR1Jxcm9CQnZRTk1FVjA3TTV5T0ZTZWR2WTlCb3R5MGdkRjZETUUx?=
 =?utf-8?B?QWdYMG5pbklnZ0txWExZS1RqcDQ4VzlyZ1M4eFgzQW03dXVSNmJXOHY5VU91?=
 =?utf-8?B?WjV1b2hReG95cFM2OEY2T2hYaU8xdERZQVlFaG9TMFFMWjlxUXZjK3NOMmcz?=
 =?utf-8?B?ZnNZcnBLdHVvK1pmVTdXd1pkdDI3aVJYWmRyZXB1S3BVRkRrcmowdGtSU0VR?=
 =?utf-8?B?VllmYVptTHg0QnlCQTFLZEt0M2QzeHJuaDhLOU5hMVVPNElBSnZCWWE4blNB?=
 =?utf-8?B?U2wxelRra0NPQklNQnU4bkNKSWdRWmFvNjFETjhjcWovbFJrZEFHQ0FjT2FK?=
 =?utf-8?B?bDZxaE1aTFFJMithSVdORytYNHB0SGgxT0lOTzRXbFVBSnpoek9pUGdpTUhN?=
 =?utf-8?B?ZWxUNzBDb0VUeCtpK3FzcjMvbGNHaWlvaStxdWg0T0U2dHVHVlE0RnpkWTJJ?=
 =?utf-8?B?MzlJTFJWNmZEWkIwM0UwRUR1WkpFeVdONFZpVkhYTzdJQjQrcWllSVBEc0Zx?=
 =?utf-8?B?QWZ2MmxWaHg5MkpuZ1B3L0RuMTAwYlFRRlRWeU1uVEU3MWc1dCszdWZYUStw?=
 =?utf-8?B?MFB6S3QxZnJ1MGxhUUZzcE01UjB6azB5KzlBVUV5bHEzNWdkcVgyOXpWd3I5?=
 =?utf-8?B?VlY0REtYdnh0VWFENzlBSTdFOVN4aEFBUmFVcjVkNTMxaTR3cVBOdzBCaXA2?=
 =?utf-8?B?NVNPKzMrdGJIQVV5cUU1d2oxOU1ZcURKU2JzOGVoUW1MT1MzVmQydVJrTUVi?=
 =?utf-8?B?T1NGbVplRDRxa1BORWlUSm9LNUY2TUhoV3pBSUtzQ2k5Z3l2cmFMblZmNkk0?=
 =?utf-8?B?ZE43anlIU3d5eWhRZzlPc0l1UWpTcWF2cTYrNTV0UFIvb1ZaU2R2YXVqVmdX?=
 =?utf-8?Q?sC11qjibPuSO/YUSRUMqkDZ26C4bimRC?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22943fd3-985d-4413-8ea6-08decee5889f
X-MS-Exchange-CrossTenant-AuthSource: SEYPR01MB5882.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 16:03:57.1455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR01MB8117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_090414_870107_D438C680 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

CuWcqCAyMDI2LzYvMTEgMTU6MTksIE1pcXVlbCBSYXluYWwg5YaZ6YGTOgo+IEhpIFppeWFuZywK
Pgo+IE9uIDMxLzA1LzIwMjYgYXQgMjE6MDU6MTcgKzA4LCBaaXlhbmcgSHVhbmcgPGh6eWl0Y0Bv
dXRsb29rLmNvbT4gd3JvdGU6Cj4KPj4gQWRkIHN1cHBvcnQgZm9yIEZ1ZGFuTWljcm8gRk0yNVMw
MUIgU1BJIE5BTkQgYW5kIEZ1ZGFuTWljcm8gRk0yNVMwMkIgU1BJCj4+IE5BTkQuCj4+Cj4+IEZN
MjVHMDFCIGRhdGFzaGVldDogaHR0cHM6Ly93d3cuZm1zaC5jb20vbnZtL0ZNMjVHMDFCX2RzX2Vu
Zy5wZGYKPj4gRk0yNUcwMkIgZGF0YXNoZWV0OiBodHRwczovL3d3dy5mbXNoLmNvbS9udm0vRk0y
NUcwMkJfZHNfZW5nLnBkZgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBaaXlhbmcgSHVhbmcgPGh6eWl0
Y0BvdXRsb29rLmNvbT4KPiBQbGVhc2UgcnVuIGNoZWNrcGF0Y2gsIHRoZXJlIGlzIGF0IGxlYXN0
IGEgZG91YmxlIGxpbmUgdGhhdCBnZXRzIGluc2VydGVkLgoKU29ycnkgZm9yIHRoZSBtaXN0YWtl
LiBXaWxsIGZpeCBpdCBpbiBuZXh0IHBhdGNoLgoKCkJ1dCBJdCBzZWVtcyBsaWtlIHRoYXQgY2hl
Y2twYXRjaC5wbCBjYW4ndCBmaW5kIG91dCBpdC4KCiDCoMKgwqAgdG90YWw6IDAgZXJyb3JzLCAw
IHdhcm5pbmdzLCAxMjAgbGluZXMgY2hlY2tlZAoKIMKgwqDCoCAwMDAxLW10ZC1zcGluYW5kLWZt
c2gtYWRkLXN1cHBvcnQtZm9yLUZNMjVHLTAxLTAyLUIucGF0Y2ggaGFzIG5vIApvYnZpb3VzIHN0
eWxlIHByb2JsZW1zIGFuZCBpcyByZWFkeSBmb3Igc3VibWlzc2lvbi4KCgo+IFRoYW5rcywKPiBN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
