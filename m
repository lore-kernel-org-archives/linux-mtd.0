Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7FEC982FA
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2026 12:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yJmJ/UWz9fDzO7pui9WjrEJ/Y2mmfiFCH98420DwbI=; b=AqjIDgs7AiCcg+
	yLbs/MrEsUUyITNy11/h9QKKQAmE6Xl0NfGlHNGMpccTlCS0LWptrENsHZp7kazSRYMDiI9XU0P1f
	zqjRFp/KWvH2LlUEmUWVGrcfNPn8vQdUmm+fo8Rw/eozJk8eGoNnax490QRnIWxKYLVXZhB4v14RL
	avSCWacFIrx4pFmeW387vDyKjzid8IgEwm1Ev/EUOrBlosQ/KlSSElS6SC21et8I9RwUdmPP4y/Cc
	lhe1aRTEhQQq0VlzwWTS0lKbLRlws6nbKlrINBgj1DXov4xZcI+YDDGs+R4BYx+qH3J8WeZ43lVwz
	4M6hZ4OsWU1PhOjGgsNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MDK-00000008GXH-2pWM;
	Wed, 23 Sep 2026 12:36:42 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MDI-00000008GWp-0qox
	for linux-mtd@lists.infradead.org;
	Wed, 23 Sep 2026 12:36:41 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NCBK5P651675;
	Wed, 23 Sep 2026 08:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=tbX+l
	fojhyTh9EFOjzwEBlHdlfwpASk3k9CCeU9dTfw=; b=Jx5V1P+nfJbdcY0wGlMsS
	3EpDAWtsDIONeonyYwTdTv351zJMrXoQx6qxDnHMQ60GOnUss3Kq5f39orNY+Sio
	Q+3LOe+2uOwzSeg9gCCN+/shEog1pnTB7kp1sfFzDg3t0EaaQJL7sIWKqcXK9o3K
	9KRrj+8ugCDH7AgsyG/oCGfbiNuqPLBVMYsws9GuffpL/hj2R0TcA9sb4mbQwfvL
	eijfsJ+YhreQas4iDzm567nN0QprVbTM6pBstJGLUVbEHfl32IjHKEsfg5s0ky9K
	DwU4UhY6ZIZp2SW9vFifME6QhsFvngLotYKUSLh9+D/bYby10shR0k8DdxpQqPc2
	Q==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gv5n72qyw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:36:01 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avSxlTJk1Ms8E4tZBI6KhAFN/5q6UkZwUU0S7F+LsQbSGlLrPQCiNVYU6P8VhmJytYm2GCCTpUJyGchKjSualHebc3imlUU/mU9SQ/QsYcspVf22vFFowo9jeRLl/bts+xVPGA4R2fkIXi2pUH7kZk5DV/g01Wr4yrYS/Tgnf0mnqxQr9VnNHfwNbSJNELiWyGGEZvuZV2FYwc+DoLbsYC184f8LOfxUYUlrMiYHXuBzLjUwY8DOB/Z7hEhrgDm4AsSNKgjcNIeBOZ1FnMTb1JKmw4MHBs/s9sxnBomCtfdbOXFR5PjP7HQ9aJPCtVxzzkT0bOdgPabS4fm5CivXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbX+lfojhyTh9EFOjzwEBlHdlfwpASk3k9CCeU9dTfw=;
 b=u5kOzKCSzH3Z/OfKwpVdVfybkSFOhmEcOVy/pMqQkcKy2yKxjlh57xqdGoYKwRzhZ/y+BYHOzWAlJVNis9+se/RsgS+rBFn18jmlcM5oBZFj7UfZyzTr7vM75vrtj6Yer4d5Qyj+/qtn/TKlsIty4fBHSCLYNyywGUVqp3P8/HkoVNzWJBOizbCx2YbocciMC2Oh26xlO4xb/6aVESfyKoPCuHmkRtwyjbiKB+DPQiTfrK/Tj5xqnRiYbmcwU+KfpLwyCiUV8mTjAr4uXMKRBmpyA4rL/p4Lm7MMqoUZ6nijNCXycmlqTOxuWRn9vh3035A5tOCHeEsq2rE7XNI2CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by CH0PR03MB6113.namprd03.prod.outlook.com (2603:10b6:610:b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 12:35:55 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 12:35:55 +0000
Date: Wed, 23 Sep 2026 13:37:12 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Mark Brown <broonie@kernel.org>
Cc: Fei Xie <fei.xie@horizon.auto>, Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Parshuram Thombare <pthombar@cadence.com>, linux-spi@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] spi: cadence-xspi: add ACMD support for SPI NAND
Message-ID: <arPFeKTafhftz9yj@nsa>
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
 <20260921093701.1341766-3-fei.xie@horizon.auto>
 <arFEjzkHGMbecWWV@sirena.co.uk>
Content-Disposition: inline
In-Reply-To: <arFEjzkHGMbecWWV@sirena.co.uk>
X-ClientProxiedBy: MA3P292CA0022.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::17) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|CH0PR03MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 680c18ad-c411-493b-4b75-08df196f3621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|56012099006|5023799004|11063799006|4143699003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ulRPhoVfv2Imj760Q+nBa0sE+1Xi1FNbHkNSjutkIkN6+o3qkdUxZzrtKEQIqzUIncBoAIYCn5pvZQq8gdl2PKvHUfh144B7HXXV9+UlRIKla3usQCwZF3082GazRjTv9T/F/LntK3T741W6acfmfuNwBgk7IZVmbpiqlOP0kj5+fg8cjX8FHb947u8tsleUmvXwP0fNkCFoxSVdVW+lPpteH0tsEbxmQn7d9sCoggA23zggARu6/QSBT9MIPA3H79XSdScKWmnZnBJy80JAZkEZtNKOXwGKYjoK4E/5HO7cScvYyuwfIVY5AZ/UHRI6G7+dnTM4Ef2fTF7OcYKvDJ1mFvrr+o8MhlWJjttT9dGeLx/LQJHyK3JoILGlilb20YvKdb55ZwOLA38cxDHgv5fFD1EIM9Pk52faKMouWSpKLZ/J08Ai+LmSQFY8wpA7Y2W0xECkYJOfWiDlgSQ4QWJu/kMYztK26kMKr3SpV0eO/UMJpCQUKOHp7/vPCnnKV4bZiRFyOr8JIDW1cHEL75A8/IYfFvLQ78Hhjs1m1Rcr4vqqyvot/cvtT3d2KVEj/yZ5COSgkGQNyBezZ3I+4MsYLx+HnkgF8jExi/LAzZftk+WF6mN0OvCW7dJ8jBJYpbA8wO3lWtUvIAbPx4L8bDvYiCZz7RllLBfb6OgT5LY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NCt6cnNWQmxIMzFZL1hlNnhNaXhBYmt1a25wdXNCNyt2THQzdjJhOWsyVjds?=
 =?utf-8?B?ODZDcWJOM1ErVldiMXpDNWovdWRhYndhUkVqZnhtWXp3bVZCMSsrWXd3SXB2?=
 =?utf-8?B?b0l0R0FVK2xPc2c5eEFIdHFCZ1ZTUllORVc5NWt6SVh4U0JMUnpzTWtWRFkz?=
 =?utf-8?B?dHhrU2RONWpxMHZ0aVpmRTBuOFNFZXVOYXJ3MHRrZmtLcElqRXdRS1I2N2pG?=
 =?utf-8?B?eWIxNWptaUx0cEtmVjc4L0NEN0tVRk52dmYzNDdMSnpPVEVMSDB0b3ZreUFZ?=
 =?utf-8?B?R2sxNENyWW9Ldk5HcmUrWVoyeTdlYlc4VTNBUUpyL3B4aTlIYVBVblU1RzJ6?=
 =?utf-8?B?by85TnhiVEJQSkxwVHR1enNySXltWE1lbVl4V2xXbHNLR1pqWExYN0taYWFz?=
 =?utf-8?B?NVpORUdSdEV0SGVyTWZLUkVlbkJ1NHZiL1lqTGhZNS9PeDdNWXF4NjFBc3Bx?=
 =?utf-8?B?NTJ6MzlHZkJFQWZNRVgyTUp6WXV0bTBidTFOVmpQVDhrUWR4QVBoc05qdDly?=
 =?utf-8?B?TUZRZFVlRS91TkVQc2dnbkIxOFUvK1lMQ0N4eHZaclB3cXV5VlZ0bU1ITFYw?=
 =?utf-8?B?UDl6M0N0MWw3aEZwaXB4NVBBSW40MWViY3VXT2pqT1BsczIrcG9abTdMU3cr?=
 =?utf-8?B?NWt0QW1zMW1mV2NzclJuMkdabWNPRDlhVTBBWE90cjJ6Q1hZWXdIQm1ZQnZy?=
 =?utf-8?B?clZndkpuUWF5Rmo5KzJTaFgwS3dPUytxenVpOGttcUVXUm0xQnVETStrRUh4?=
 =?utf-8?B?M2ErT1IzemJtVEh5dDVibWJEc0dHMHhITjl2eHNhR2pmM2d4VW9JSm9nenR6?=
 =?utf-8?B?TmJLNkFCVG1UMTN4UWNjaXBPSjF2OWMvVE45dTZIYVh1UkpaV1pMY0M1WTVT?=
 =?utf-8?B?SHdHczBmcTIrRisxM0NVZVIzc0FQUWU3My9zYjZVNElGMzVkb2w5RjY4bzMv?=
 =?utf-8?B?akNPZitVZ2wwVzFJN25qMVpuY3ByaXJ6QjQrcmFKSTBvRXY3aytXaHNISnJL?=
 =?utf-8?B?Vks5NnpHSTNsN2hZRlpvcTd0QWxTTlNKM0NCZVpHcGRQK3RqTVZSSllZeVdv?=
 =?utf-8?B?b1ZFSXRnVVg2OE5hU1A1RDhKOGtQaWJCdWM0aUFhMnhFREl0ZVVNd1o4Y29x?=
 =?utf-8?B?Y1VCTmhUSjFVQlVRMDgyQzZzNkU3Tnpyd29HL1YydTF3ZEM5ampiaXZ6UlVG?=
 =?utf-8?B?RnpXSDVVb1ZOU2swdGEwaG5WMm9LUUlPamRNNGRhNkcxK0lRQUJLeitGb3ZL?=
 =?utf-8?B?U2dabU5aNkd3WFgwOUFXTE0xOTJ3Zm13dVVTZ05TcytrRUdkRkNzVDg1bjdS?=
 =?utf-8?B?TXMvZzFqRjlNdEdLWnY1Ujg3VEVLWitZSjh4N3YxWmVKTngycVNSd01LTVVH?=
 =?utf-8?B?N25CZlZuZDhFMVZWdFUvNGVDazI4b2kxZkVCQ2FTc0FEeDVrd0I0QnRMQUox?=
 =?utf-8?B?a1NEZWdHalQ4KzVyNHY5Nm8yRzJGTnpubDhXK05hS1pDUVRoQjIzaXNON0Ru?=
 =?utf-8?B?RHpVOG9UMGFLWXdWNmV5dVUvbEk2L01oZG14S0IwcnVKZTNBREp6NTQ0YVYr?=
 =?utf-8?B?R3F2TGovN3NPeTdFbjVYcFo4L2VKeVRwaUd4eGoweHMxaGtDSkMyWXZTTXRB?=
 =?utf-8?B?OEJaNHRxQlp6WHVwQ1pvUm5jT2RlRUZETUI0TGRJV1BsNXNtL3hQZlNBSS9r?=
 =?utf-8?B?dVloV1puUG8zR3NCSWhmbEtud1JrRnBhK2JtaUxyNmN5Z3BTTXJxaVlkbnFC?=
 =?utf-8?B?dm5yWWVMZkIrZ2NMWHBlZVdhWGRQKy9uQytGQnQxaWxhcDNOMmZEOEhDTTF6?=
 =?utf-8?B?VmFqSGt2SmpLd3FqTHZIdGI0djVNaURVeEZVMGlDNnBoOGNLTlRHdjJlNE1x?=
 =?utf-8?B?T2s2MUVSRENpYXF3NTFVS0pMZE5TNU11Y2Vxclpja0doMDJFV1M4K2ZWZ0VF?=
 =?utf-8?B?NVNrYlZiL3NKWDQ0M3BHckFyaE9Zd0pSQmlsRUo2SFhIaTk3ODBES3JsZzZ2?=
 =?utf-8?B?OFVmT1FZS3FOQUFYWmEydDVGQTFpdHd0NGpFZno5em55aHRMMGpsRHFnN0RM?=
 =?utf-8?B?dCtTUXdpQjdrYXZFcWJlZWU0SCtXUFBNcTR3NGJWTU1UOUtrSUdydFlRTldX?=
 =?utf-8?B?SlhHQWcveGpUY0tCWU04cVNBc1NBYXVrZlBBT0pvWUdJR0xNWk44VTJ0U1JO?=
 =?utf-8?B?L1NiUWZBL1pheUsxRjZEMkIxbHUxRjVieGpLYXdWYUMrd0REWGljUEQ5Yjlx?=
 =?utf-8?B?NlZyV0o4SE5HaTNLMWI2eXIrdGZla3dNNmtKTHpBaS84OFVFWG9xSnFITWJt?=
 =?utf-8?B?QVlnTDBVeFJobHhVanBMbUhPdkZ0bGJhUGM0OHdReGJmRkZ1cjlBUT09?=
X-Exchange-RoutingPolicyChecked: qxFL9TsqaFacCPugU+2PkCMUNB/d8vL3k0JlbvdmFVTxMJR9z+vRr4dudD+S5wzvETnqyiku0wmL532s9tok7Edcvz8dPJwZ04kPMLvLvIXjz4895T2iGodc0FB3g70CkRcbLUskAJgFI7hdWZc1whhZ3NHp2s6wY91Ev9QUcItTag1cfnqTrNUlCjuUqJCFdWUBHqvR03ejQKpQnDkijVl+2aqsVIqztMMKqQqs9eV/MsqAGXb9u4WD7KkVEGwvxxxfLyIin364jBl+pLynseOhcbPyXK2O9i61bS3T2Lhhm+rIX9EFlp/1U4pKrtGtceffYczO5irOGL0c7CQj4g==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 680c18ad-c411-493b-4b75-08df196f3621
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 12:35:55.8538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcABdcV9tRc1moPg2fIDUsYvT2XmkOH54GgX8w8Cu74vn2F4dvsDO9yf6X+yCkndK7okVoKXiYkjW13vLOAJHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6113
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX/TJKUnW6fdNm
 3fiIh21zBKYLLZGdBOO6Xz1mTuOj2AsIweSD8FzAosqEonoMdtjlEAICNSRrYIeMOjQQeANp+Uy
 KlzHC9A6hudmJWRduvdtV0kqeD0uBM1Lc8nu6GTDArJHEbYPag8AjV+wbF6GZWGsqNST6EXWk+l
 c9wvmzOqmkzsb9OihzyFmUWMuWElAAD+zYdjflI+H7005ejEDrPpP84ErGN1NrXDpojQcvLwhJf
 wHFjoULvf9ktHMSeMIQt3o1K61KCj9a4+PRO2tj+DMUhL9fvyfe6h1KZpQoCS6C81KR+YVi4os9
 JPxUelyjkPJySifhjgudBliK6IAIgKxcDx9o3Dfzq5xorDi8ePjaQqWlF8cWK9xJ5zZRS1dXSLN
 KNmg0kqyPiER3raWdbWZplJ4f6LCIEbX5Yere5P2EM8h3fdeQqAqNVMp80/aK94gD9+tdm/Tkvo
 WVQZrcV7GeS7Vzn5s8g==
X-Proofpoint-GUID: XHdhS67x36Ss1GqSjex0gUOsWJFFr90E
X-Proofpoint-ORIG-GUID: XHdhS67x36Ss1GqSjex0gUOsWJFFr90E
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX/xQMthi6SBUa
 hMmTfBPPkI9ZnJwMSSJWaq7uMv+H8lXGoccT/P0fhdLr5cYY8tDQNXDcgWCdVbdaD8WUrCUS5/t
 A+UpoH6PmsSYfHo2eg27MhbWf3lSsufaYwbGN0V9R+f+9IdYCrGQ
X-Authority-Analysis: v=2.4 cv=EKiTQFZC c=1 sm=1 tr=0 ts=6ab3c7b1 cx=c_pps
 a=feJg8xcwi6yo0k/5NfVkgw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=q8uBho_rRhyo8_7UB6wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_053640_250722_8B825D38 
X-CRM114-Status: GOOD (  28.35  )
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

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgMDQ6NTE6NTlQTSArMDIwMCwgTWFyayBCcm93biB3cm90
ZToKPiBPbiBNb24sIFNlcCAyMSwgMjAyNiBhdCAwNTozNjo1OVBNICswODAwLCBGZWkgWGllIHdy
b3RlOgo+IAo+ID4gQWRkIFBJTyBtYXN0ZXItRE1BIHN1cHBvcnQgZm9yIHRoZSBjb250cm9sbGVy
IGF1dG8tY29tbWFuZCBtb2RlLgo+ID4gQ29uZmlndXJlIHRoZSBTUEkgTkFORCByZWFkLCBwcm9n
cmFtLCBlcmFzZSwgc3RhdHVzIGFuZCByZXNldAo+ID4gc2VxdWVuY2VzLCByZXRhaW5pbmcgU1RJ
RyBmb3Igb3BlcmF0aW9ucyBub3QgY29uc3VtZWQgYnkgQUNNRC4KPiAKPiA+ICtzdHJ1Y3QgY2Ru
c194c3BpX2FjbWRfaW5mbyB7Cj4gPiArCXU2NCByb3dfYWRkcjsKPiA+ICsJdTY0IGNvbHVtbl9h
ZGRyOwo+ID4gKwlzaXplX3QgZGF0YV9uYnl0ZXM7Cj4gPiArCWJvb2wgcm93X2FkZHJfdmFsaWQ7
Cj4gPiArCWJvb2wgaW5pdGlhbGl6ZWQ7Cj4gPiArfTsKPiA+ICBzdHJ1Y3QgY2Ruc194c3BpX2Rl
diB7Cj4gCj4gTWlzc2luZyBibGFuayBsaW5lLgo+IAo+ID4gK3N0YXRpYyB2b2lkIGNkbnNfeHNw
aV9uYW5kX2VyYXNlX3NlcV9pbml0KHN0cnVjdCBjZG5zX3hzcGlfZGV2ICpjZG5zX3hzcGksCj4g
PiArCQkJCQkgIHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPiA+ICt7Cj4gPiArCXUz
MiBlcmFzZV9zZXFfY2ZnMDsKPiA+ICsJdTMyIGVyYXNlX3NlcV9jZmcxOwo+ID4gKwo+ID4gKwkv
KiBTUEktTkFORCBibG9jayBlcmFzZSBpcyBhbHdheXMgRDhoIHdpdGggYSAzLWJ5dGUgcm93IGFk
ZHJlc3MuICovCj4gPiArCWVyYXNlX3NlcV9jZmcwID0KPiA+ICsJCUZJRUxEX1BSRVAoQ0ROU19Y
U1BJX0VSU1NfU0VRX1AxX0NNRF9WQUwsIDB4ZDgpIHwKPiAKPiBDRE5TX1hTUElfTkFORF9PUF9C
TE9DS19FUkFTRS4KPiAKPiA+ICtzdGF0aWMgaW50IGNkbnNfeHNwaV9uYW5kX2luaXQoc3RydWN0
IGNkbnNfeHNwaV9kZXYgKmNkbnNfeHNwaSwKPiA+ICsJCQkgICAgICAgc3RydWN0IHNwaW5hbmRf
ZGV2aWNlICpzcGluYW5kKQo+ID4gK3sKPiAKPiBIb3cgbXVjaCBvZiB0aGlzIGluaXRpYWxpc2F0
aW9uIGlzIHBhcmFtZXRlcnMgYmFzZWQgb24gdGhlIHNwZWNpZmljCj4gZmxhc2ggcGFzc2VkIGlu
IC0gd2hhdCBpZiB0aGVyZSBhcmUgdHdvIGRpZmZlcmVudCBmbGFzaGVzIGF0dGFjaGVkIHRvCj4g
dGhlIHNhbWUgY29udHJvbGxlciBmb3Igc29tZSByZWFzb24/Cj4gCj4gPiArCWNkbnNfeHNwaS0+
ZG1hX2J1Zl9sZW4gPSBzcGluYW5kLT5iYXNlLm1lbW9yZy5wYWdlc2l6ZSArCj4gPiArCQkJCSBz
cGluYW5kLT5iYXNlLm1lbW9yZy5vb2JzaXplOwo+ID4gKwljZG5zX3hzcGktPmRtYV9idWYgPSBk
bWFtX2FsbG9jX2NvaGVyZW50KGNkbnNfeHNwaS0+ZGV2LAo+ID4gKwkJCQkJCSBjZG5zX3hzcGkt
PmRtYV9idWZfbGVuLAo+ID4gKwkJCQkJCSAmY2Ruc194c3BpLT5kbWFfYWRkciwKPiA+ICsJCQkJ
CQkgR0ZQX0tFUk5FTCk7Cj4gPiArCWlmICghY2Ruc194c3BpLT5kbWFfYnVmKQo+ID4gKwkJcmV0
dXJuIC1FTk9NRU07Cj4gCj4gV2h5IGRvIHdlIG5lZWQgdGhlIERNQSBidWZmZXIsIEknZCBleHBl
Y3Qgd2hhdGV2ZXIgcmVhY2hlcyB0aGUgZHJpdmVyIHRvCj4gYWxyZWFkeSBiZSBETUEgc2FmZT8K
ClNvIHRoZSBjb250cm9sbGVyIGNhbiBhY3QgYXMgYSBETUEgY29udHJvbGxlciBhbmQgaXNzdWUg
RE1BIHRyYW5zZmVycwpkaXJlY3RseSB0byB0aGUgYWJvdmUgbWFwcGluZy4gSG93ZXZlciB3aGF0
IEknbSBzZWVpbmcgaXMgdGhhdCB0aGUgYWJvdmUKaXMgcHJldHR5IG11Y2ggYSBib3VuY2UgYnVm
ZmVyIGFuZCBuZWVkcyBkZXRhaWxzIGZyb20gbmFuZCBjaGlwLiBQbHVzLAphcyB5b3UgcHV0IGl0
LCB3ZSBjYW4gaGF2ZSB0d28gZGlmZmVyZW50IGZsYXNoZXMgYXR0YWNoZWQgYW5kIHRoZW4gd2hh
dD8KClNvIHdoYXQgSSBoYXZlIChhbmQgSSBkbyBub3Qgc2VlIGFueSBvdGhlciB3YXkgdGJoKSBp
cyBhbiBvbiBkZW1hbmQKZG1hX21hcHBpbmcgZm9yIHRoZSBidWZmZXJzIHdlIGdldCBmcm9tIHRo
ZSBzcGlfbWVtICh3aGljaCBzaG91bGQgYmUKZG1hX3NhZmUgeWVzKSBjb3JlIGFuZCBzbywgbm8g
bWVtY3B5KCkgYXQgYWxsLiBZZWFoLCB3ZSBoYXZlIHRoZQp1bmRlcmx5aW5nIGNhY2hlIG1haW50
ZW5hbmNlIHRoZXNlIG1hcHBpbmdzIHJlcXVpcmUgYnV0IGFzIHNhaWQsIGRvbid0CnNlZSBhbnkg
b3RoZXIgd2F5LgoKLSBOdW5vIFPDoQoKPiAKPiA+ICtzdGF0aWMgaW50IGNkbnNfeHNwaV9hY21k
X3J1bihzdHJ1Y3QgY2Ruc194c3BpX2RldiAqY2Ruc194c3BpLCB1MzIgY21kX3JlZ3NbNl0sCj4g
PiArCQkJICAgICAgdTMyIHRocmVhZCkKPiA+ICt7Cj4gPiArCXVuc2lnbmVkIGxvbmcgdGltZW91
dDsKPiA+ICsJaW50IHJldDsKPiA+ICsKPiA+ICsJY2Ruc194c3BpX3NldF9tb2RlX2FjbWQoY2Ru
c194c3BpKTsKPiA+ICsJcmVpbml0X2NvbXBsZXRpb24oJmNkbnNfeHNwaS0+YXV0b19jbWRfY29t
cGxldGUpOwo+ID4gKwljZG5zX3hzcGlfc2V0X2ludGVycnVwdHMoY2Ruc194c3BpLCB0cnVlKTsK
PiAKPiBXZSBoYXZlIHRoZSBzZXRfaW50ZXJydXB0cygpIG9wZXJhdGlvbi4KPiAKPiA+ICsJY2Ru
c194c3BpX3RyaWdnZXJfY29tbWFuZChjZG5zX3hzcGksIGNtZF9yZWdzKTsKPiA+ICsKPiA+ICsJ
dGltZW91dCA9IG1zZWNzX3RvX2ppZmZpZXMoQ0ROU19YU1BJX0FDTURfVElNRU9VVF9NUyk7Cj4g
PiArCWlmICghd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZjZG5zX3hzcGktPmF1dG9fY21k
X2NvbXBsZXRlLAo+ID4gKwkJCQkJIHRpbWVvdXQpKSB7Cj4gPiArCQlkZXZfZXJyKGNkbnNfeHNw
aS0+ZGV2LCAiQUNNRCBjb21tYW5kIHRpbWVkIG91dFxuIik7Cj4gPiArCQlyZXQgPSAtRVRJTUVE
T1VUOwo+IAo+IERvbid0IHdlIG5lZWQgdG8gY2xlYW4gdXAgdGhlIGhhcmR3YXJlIGlmIHRoaXMg
dGltZXMgb3V0Pwo+IAo+ID4gKwl9IGVsc2Ugewo+ID4gKwkJcmV0ID0gY2Ruc194c3BpX2FjbWRf
Z2V0X3RocmVhZF9zdGF0dXMoY2Ruc194c3BpLCB0aHJlYWQpOwo+ID4gKwl9Cj4gCj4gRG9lcyB0
aGlzIG5lZWQgYW55IHVwZGF0ZXMgdG8gY292ZXIgbW9yZSBlcnJvciB0eXBlcz8KPiAKPiA+ICtz
dGF0aWMgaW50IGNkbnNfeHNwaV9waW9fbWRtYV9yZWFkKHN0cnVjdCBjZG5zX3hzcGlfZGV2ICpj
ZG5zX3hzcGksCj4gPiArCQkJCSAgIHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiA+
ICsJCQkJICAgY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKm9wKQo+ID4gK3sKPiAKPiA+ICsJcmV0
ID0gY2Ruc194c3BpX2FjbWRfcnVuKGNkbnNfeHNwaSwgY21kX3JlZ3MsCj4gPiArCQkJCSBDRE5T
X1hTUElfQUNNRF9EQVRBX1RIUkVBRCk7Cj4gPiArCWlmIChyZXQpIHsKPiA+ICsJCWRldl9lcnIo
Y2Ruc194c3BpLT5kZXYsICJBQ01EIHJlYWQgZmFpbGVkOiAlZFxuIiwgcmV0KTsKPiA+ICsJCWdv
dG8gb3V0X2NsZWFyX3JlYWRfc3RhdGU7Cj4gPiArCX0KPiA+ICsKPiA+ICsJbWVtY3B5KG9wLT5k
YXRhLmJ1Zi5pbiwgY2Ruc194c3BpLT5kbWFfYnVmLCBvcC0+ZGF0YS5uYnl0ZXMpOwo+ID4gKwo+
ID4gK291dF9jbGVhcl9yZWFkX3N0YXRlOgo+ID4gKwljZG5zX3hzcGktPmFjbWRfaW5mby5yb3df
YWRkcl92YWxpZCA9IGZhbHNlOwo+ID4gKwljZG5zX3hzcGktPmFjbWRfaW5mby5yb3dfYWRkciA9
IDA7Cj4gPiArCXJldHVybiByZXQ7Cj4gPiArfQo+IAo+IERvZXMgdGhpcyBkbyB0aGUgcmlnaHQg
dGhpbmcgZm9yIHNob3J0IHJlYWRzPwo+IAo+ID4gK3N0YXRpYyBpbnQgY2Ruc194c3BpX3NlbmRf
cGlvX2NvbW1hbmQoc3RydWN0IGNkbnNfeHNwaV9kZXYgKmNkbnNfeHNwaSwKPiA+ICsJCQkJICAg
ICAgc3RydWN0IHNwaV9tZW0gKm1lbSwKPiA+ICsJCQkJICAgICAgY29uc3Qgc3RydWN0IHNwaV9t
ZW1fb3AgKm9wKQo+ID4gK3sKPiA+ICsJc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kOwo+
ID4gKwljb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqcmVhZF9jYWNoZTsKPiA+ICsJY29uc3Qgc3Ry
dWN0IHNwaV9tZW1fb3AgKndyaXRlX2NhY2hlOwo+ID4gKwljb25zdCBzdHJ1Y3Qgc3BpX21lbV9v
cCAqdXBkYXRlX2NhY2hlOwo+ID4gKwlpbnQgcmV0Owo+ID4gKwo+ID4gKwlpZiAoY2Ruc194c3Bp
LT5mbGFzaF90eXBlICE9IENETlNfWFNQSV9GTEFTSF9UWVBFX05BTkQpCj4gPiArCQlnb3RvIHVz
ZV9zdGlnOwo+ID4gKwo+ID4gKwlzcGluYW5kID0gc3BpX21lbV9nZXRfZHJ2ZGF0YShtZW0pOwo+
IAo+IFRoaXMgYXBwZWFycyB0byBiZSBwZWVyaW5nIGludG8gdGhlIGNoaWxkJ3MgZHJpdmVyIGRh
dGEgd2l0aG91dCBhbnkKPiBjaGVja2luZyB0aGF0IHRoZSBjaGlsZCBpcyB3aGF0IHdlIGV4cGVj
dCwgdGhpcyBjb3VsZCBnbyBob3JyaWJseSB3cm9uZy4KPiAKPiA+ICsJY2FzZSBDRE5TX1hTUElf
TkFORF9PUF9HRVRfRkVBVFVSRToKPiA+ICsJCWlmIChvcC0+YWRkci52YWwgIT0gQ0ROU19YU1BJ
X05BTkRfU1RBVFVTX1JFRyB8fAo+ID4gKwkJICAgICFjZG5zX3hzcGktPmFjbWRfaW5mby5yb3df
YWRkcl92YWxpZCkKPiA+ICsJCQlicmVhazsKPiA+ICsKPiA+ICsJCWlmIChvcC0+ZGF0YS5kaXIg
IT0gU1BJX01FTV9EQVRBX0lOIHx8ICFvcC0+ZGF0YS5uYnl0ZXMgfHwKPiA+ICsJCSAgICAhb3At
PmRhdGEuYnVmLmluKQo+ID4gKwkJCXJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gKwkJbWVtc2V0
KG9wLT5kYXRhLmJ1Zi5pbiwgMCwgb3AtPmRhdGEubmJ5dGVzKTsKPiA+ICsJCXJldHVybiAwOwo+
IAo+IEFyZSB5b3Ugc3VyZSB0aGUgemVyb2luZyBtYWtlcyBzZW5zZSBoZXJlLCBmb3IgZXhhbXBs
ZSB3aXRoIEVDQz8KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
