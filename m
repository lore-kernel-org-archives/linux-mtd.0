Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99543C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Nov 2022 08:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgrDnZSYDx0OCMG+CWxxtsqSvvPqDehr4cfyDuEgt5c=; b=2Tl9vW0XRo3l2J
	YzuIMz4lYk+pqcAraHOBIgP6/xzO6hNPwmWTBwS69Sggqe/T6dhUNvXmfgdrbwX542Re0CHKZnyq3
	yQRnDOaiNkkiaJv7lQdY/uZDArPVcZT+cVBHj0emNKA+sqaI0eeWGH+LK2cxYW3vHoTfEWR7dKrr+
	A6l+vk6aNXs6gg240LqaYQVYLkL1s58dCO9pk98erZz7mZFyErglM9w/rIYA5gCU8ZLt1PtJ4FQIE
	O3Rhhr9Nnths3x5zwatkEiuEwt57LAG2kECAj5k6VyAZwGFMdtZ70UOD5eV78Qlqb8w0oW2Jp+jrf
	dcpS1aguHqzc9HOyg/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0InF-00EiAy-DC; Wed, 30 Nov 2022 08:50:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Imc-00Ehve-Va; Wed, 30 Nov 2022 08:49:36 +0000
X-UUID: 92b2093440864685a48aab4489b8321b-20221130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=tESvJtW+CM/qJfpgMUcytkpFPdIIc+0FqKmqZZsJHgk=;
	b=Rf9gCnKCvc8mAqGagr0Sbs+HMjxa9NoQRsw8piPsqdvPA+eiFnXeOGYrIubCSvckNhlKrkINsAaFECWlP/2G8RI5EBOdTSa6jWc8k31Fi36KSs7xlJH8ErhO8x+8gAFjYBLwGCw74GAubu5BbjrHfdInvthIIZ20LHWMdKb7Zas=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:5e41de4d-459c-4012-9b82-4b1b762dc474,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:e9bcba1e-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 92b2093440864685a48aab4489b8321b-20221130
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 177144816; Wed, 30 Nov 2022 01:49:32 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 30 Nov 2022 16:18:53 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 30 Nov 2022 16:18:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auyBDgA+y4BQBZZRCop3zhSZO0Yqgd6sfxUgOWcUxghbrpkEMGidtZTv3hFOLHybZ5ESDJ3CSxFuxXSXFRbDJf8rx+qgdL9sYOu6EB96x0Ol1AHY0s/vFOYTtZHN+IpoQ9iPWMN0lQOq7OKFvxnRH2s0ll/5U45f9bnrE9Lv1HBoLzUpmUmaVnDO4Di9CO7iA0jkdI/yrsZQyiKimQtwtA5LweCCKW1kfMSFHgXWIFXqW/Be6c6jrjGJsGioOqlyDCO5h1Y/UpCdytCbQdbItZPFtMp51cP6i1jP99ZNyuCKl60OFThM0W28yJ4Z7+hzqoKMwfc4tL18p10zxvH82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tESvJtW+CM/qJfpgMUcytkpFPdIIc+0FqKmqZZsJHgk=;
 b=jsemH4BPv6ofRY8Je9CgsHTUBWdUnMabDIobf6YgzX3sKnFbiWJo1YJTPGyrFOE5Rtmwmem/dAy+alqju9A9k3Y5QwjjbplyQG5z8z2BvJMAlduxqL4t4rcgbxuWEm2hQI4VvEEygQtmDAUdlhjv8gR3K66QbDKHCvD6AP15jb6mqjnQcf35ahOo7qN8E8j5NvS9bFGfnkoRYOD8Q415FRWU2xpYslM8r02qlCA71cYdJMYOGVq00QT6UXO43OM0MBuFnbvf1FY4q6wcrJoIg+obcldFDgf5DB4VTMkgx+frlH8yusLtV9B4tXcBVMend5pb5Cgd+MAeb7XkPaOgcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tESvJtW+CM/qJfpgMUcytkpFPdIIc+0FqKmqZZsJHgk=;
 b=bfL8eBCrXvJq1myAAWVQ/4zSmWMuazqePfejrY6S/1B7M6x3bF0117DWRtpmIc8DUFm0e2HbuvpLHEgkKWryHwtz6tM4NxAn0rszAHTdN0iUCnLFdE/neqQXOc1/0CCJnx9jA52pSpgzM9WIoMc3BzHZLUBzOppXCwE/w+XJ894=
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com (2603:1096:4:84::10) by
 KL1PR0302MB5202.apcprd03.prod.outlook.com (2603:1096:820:4d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 08:18:51 +0000
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::6f36:b7bc:7906:b179]) by SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::6f36:b7bc:7906:b179%6]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 08:18:51 +0000
From: =?utf-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
	<Xiangsheng.Hou@mediatek.com>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "krzysztof.kozlowski@linaro.org"
	<krzysztof.kozlowski@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "gch981213@gmail.com"
	<gch981213@gmail.com>, "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at"
	<richard@nod.at>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
	<Benliang.Zhao@mediatek.com>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, =?utf-8?B?QmluIFpoYW5nICjnq6Dmlowp?=
	<bin.zhang@mediatek.com>
Subject: Re: [PATCH 5/9] dt-bindings: spi: mtk-snfi: add mt7986 IC snfi
 bindings
Thread-Topic: [PATCH 5/9] dt-bindings: spi: mtk-snfi: add mt7986 IC snfi
 bindings
Thread-Index: AQHZAs5edHjv2x34ZkyIs4MU4UZyAK5UCgqAgAEq7ACAAFMzgIABmvoA
Date: Wed, 30 Nov 2022 08:18:51 +0000
Message-ID: <36d71d033f6926dfaefed7010bced94b4cd4b339.camel@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
	 <20221128020613.14821-6-xiangsheng.hou@mediatek.com>
	 <8b8e4b23-a3bc-7e3d-199a-e8f591d05d71@linaro.org>
	 <5f76482d33933c19e191ea618f8622cd0660597f.camel@mediatek.com>
	 <e512b7fd-3404-3c2d-dbf6-dc66ee662a06@linaro.org>
In-Reply-To: <e512b7fd-3404-3c2d-dbf6-dc66ee662a06@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB4565:EE_|KL1PR0302MB5202:EE_
x-ms-office365-filtering-correlation-id: 2742843f-b82c-43ea-48c9-08dad2ab83bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C1mj1H3vm3WAHqAOglN+xbe+Ly/i3MfejtQj3tj6KzuP83VpXhDFhVTBdL1TrvWC4qVN2lBTpv+p9Q26Ag1SC0xNIbue5LtV3Z0NPosxABq/kGMxfOCjORj6hM3pLkmg99uRHVH8f8zJyG+gChXG2GLtjJ7LN9UJnejkWaslv9kn8CFjZzjqDy3ldW1CUv+OZ8WyTGqKVtJegzdjf2O8bP4jh5XeErLHSy6yehNjW5jLY18VVeduc7KL3C2tRfF8HgrOjnkzu0ULohg572YCzmCKu6J9Zr6E4ziaodAlXT1FZdpeQZN9WYh074sLxexqGnJrIQdPJ/Pb6m6SvmES/nIjAml41pnwKfDvNVh7dm7P826gx/BTa94aP8MazmUkrze6hZXfoZzV0Dx4sMzNuRO6G1YJp2M/D3r+j+kXCwekCZ3n5I8+6bm8BoFpEq+P0XrFnkpeE7vDY2wPOebNX0L4W3zMtS9OLTVdCQ5+V7lgudxeyddpvT5RZsmQSSIRI40PHGP7YbvV3YIFGW/wcPAeI41dZmlDU486LDOjVlVL+UFn02+Qn5bwW4junGeiHmPMAeGmehIKsJL13F+3wCHViGTdyErIozCokz1yOk0ijBOaCxvZ+Ho2v1BYjUxeRnKCRx02hUPMPA+VVcPdenWSB9HDueb9xmobwDEKi6MS2H2tz9ga2oLTDwwx++s6IVftIYNXXpX6OFKIZqNNg+deOlVknWmVYhL40INHbgCBXCzkiWxf2rpCLMAAfpWB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB4565.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199015)(38070700005)(85182001)(36756003)(54906003)(6512007)(478600001)(110136005)(316002)(6486002)(8676002)(5660300002)(4744005)(66476007)(91956017)(66556008)(66446008)(64756008)(7416002)(76116006)(8936002)(41300700001)(4001150100001)(66946007)(26005)(38100700002)(71200400001)(122000001)(86362001)(4326008)(53546011)(2906002)(6506007)(107886003)(83380400001)(186003)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekl3VUJxeHYzMXB4OW02TURvVlVCQmo0QURIaHFVNG9uemRGa0xGbFpObnZI?=
 =?utf-8?B?RC9XM0Q5T2FDMVlsNm4zUjdpWFpGTFplaEpKbFlaYzc4ejlCdTN5MHo1VUVU?=
 =?utf-8?B?VUVHN3BTWUEvSjBJR0tuYUZmWjFVZTBGelZLTi9LMmFqczZTRFdIN2NPaHE0?=
 =?utf-8?B?UE5nZDFyY0xRQ3hmOU0wMEZaVUFWWXN1Zk04b1JzaWh4N2VXNm9HUlNJSHlv?=
 =?utf-8?B?d2E2Kys0OUUzNDNLNG9iRU56N3hBNG9hQ3l1cmxjVmRLUU5HaGpSUVY4QXll?=
 =?utf-8?B?RU92V2IwUzk2bWE5dlAwTjVtc0xFNVJKWE82RnpJV1ArZnl4Tkl2aE5TM2JS?=
 =?utf-8?B?djNnTGU3dHZ1d3AyR05YazZYTWRmWmNHRnRYVVFVUkVEUjlQM1lWWlRNeUIr?=
 =?utf-8?B?RC9lTERkUG9zN0tHTDJmL1ZwSXFuRXhGZVFjVjQvUHVmZEF6WHE2Wi94MjZU?=
 =?utf-8?B?NVJPQmNUbFBaU0dYV0NITEgvbGNtVUkrNmY0ZmxoVy9RalVoejFKeEFCVytG?=
 =?utf-8?B?ZU9QbWFPZno1WG9aTlZ5RjZGYVlnNnh2UnJIOWdMRGV3dkFwU3RLU3J0TStp?=
 =?utf-8?B?TXZqS2R5bDZ3bEsvaEtpYk9manFoMFY0V2JXcG9WQThjM3hJcTBITDVpWVJl?=
 =?utf-8?B?ZDFwNCs5RkZWL1FackI1NThCalU1NFVybTU2amVnTzNFZXlSck5zQ1A3NDV1?=
 =?utf-8?B?VThpcmtOeG9UbTlPSVk0aXlUNXBWK2NZUTFweUNhVm8wK3I0bThCTkZScGpG?=
 =?utf-8?B?Y3JIOHorTXN0dEg5WkN4eEpIM05HVzBUWldqZHA2a0tqK0JadUFOK2c3NFlR?=
 =?utf-8?B?a0hqWERNYktnYlVselNpTm12VldJVnV5UjF3ZlZjNXo3Q014WVhrSEJPQUdi?=
 =?utf-8?B?OTFpRlB1RjdUczVoZ2FlYnlXUUt1QWVhTE4yS01OcGFwUTcvb2RESXN4MVN6?=
 =?utf-8?B?bkVzU25pN0ozTHdMTDI5NVl3ZUxMSU43NDl0TUkvTFJuVDZ1ekhVbEpuMzR4?=
 =?utf-8?B?UWgzTnRBRWhuckdpT2VhVk5Na3F4K3BqQjE2azVlQmF4MTlaMERDVEVkNTdS?=
 =?utf-8?B?cFYxakJxd1ZlUFQ1aGxSVGNPcWZId1VYSVZpTzFDRDNreWNyN3l5aENUTEd4?=
 =?utf-8?B?azI4WEYzdFdpRyt5SzhYVzFIZVpjM3A2blREODFzS252c253enpjOTFydFkx?=
 =?utf-8?B?ZVRQdVNoWWEyK1UwT0FpOE1jMzYzUjFMMkt4WTFEMjBxMy9JUUx0V0N3WFpq?=
 =?utf-8?B?bzlmNk9LZm1Qd1pOdnp2MWFQVXFqeUFWUlBCSHBndmF5ZG5nTElSUGFUemUy?=
 =?utf-8?B?Qy91VGM0djVwRGtNKzZtbkNTQlRHUFI3Yy9JVHQ0RU42NnFYWmJaY0E0eitr?=
 =?utf-8?B?LzdkWXZaK3JDVWZBVGplMEtNaFBIN2NZWGpFb0o4ODF1SFZaOFlBWHpJU1lT?=
 =?utf-8?B?akhlY0p6RDdpZHNTdHNyam5nZ2x3UkQwTEVmdXRxU1ZrZlJhNTJtOVdTMWVr?=
 =?utf-8?B?NFQyeENubk1PZGlTb3EraEs5VGIxbXFKWndRNnhwR3VjbXBnSjhUeUtGajNo?=
 =?utf-8?B?bWI3NmorTUliVElOWitlSGRydnovUS9EckZWeFpXbWNmVmJkWStGdERHdVAw?=
 =?utf-8?B?WEswbU5TSDkzNEgzdEh1T1BMcDVDeEk1bFE3YVhlRlVmUnB4emFVdGI2bjFG?=
 =?utf-8?B?VFJ1WmpHRGl5YlQ5Q2ppOEJhekFrbjZuczFXUTJJUHp4bnptc09VWm13bzBY?=
 =?utf-8?B?RjE5Qm4zemQzcSt6SXd6SnQrWUVsYSt2YUxybFBueTJKUHlYZTB2UDdOdHhu?=
 =?utf-8?B?bEVvZW5GWDR2ejE0OHhIaCtXbFJKRG00V25Gd1RVOEJwUXZyS0JySFFQaTF0?=
 =?utf-8?B?TnpXVnN1SzFhUjcwenV1YVBUcyt4VFBmQXlFTVEzSURTNWRxeC9FTnppZEVF?=
 =?utf-8?B?WVVjRXQ2b3lWdHFSek1MU1UxcXFlU1d1bkdrWFo3SGJBR1Q0UWpBMVlwdWpB?=
 =?utf-8?B?ZmlUdFJnRzVHLzlrNFlIL3EyMTN1MHl2azVrMTdCWTJHYTFhYTFYeHR6Qysz?=
 =?utf-8?B?MGZaYkJBZzFQOG43bHdzOVozT3VrVHN3NFhrT2FQWjVvQ2w1OTkwdkkvRHFQ?=
 =?utf-8?B?U0dyQzZaeGR0cXZ5N051a1ZXZlRVaWZLSy83SGR6L2NlWnNnMnYwN0hlaFVh?=
 =?utf-8?Q?7YXPaZxl6rpsPu3bWX2RZXI=3D?=
Content-ID: <774A8733C72673459478D50DE6892C53@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB4565.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2742843f-b82c-43ea-48c9-08dad2ab83bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 08:18:51.7429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cVAfTTQhApqj5j2txbrz4wGIBwXoDzv3Ezx3GAMjxH4dQ1SW+lJkUnrUmTBzXQVQbZRzHp9wD7F54v+/c9mwIPghzKu9xHnGuMYritfx3yA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB5202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_004935_108734_9D98988E 
X-CRM114-Status: GOOD (  15.09  )
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

SGkgS3J6eXN6dG9mLA0KDQpPbiBUdWUsIDIwMjItMTEtMjkgYXQgMDg6NDcgKzAxMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDI5LzExLzIwMjIgMDM6NTAsIFhpYW5nc2hlbmcg
SG91ICjkvq/npaXog5wpIHdyb3RlOg0KPiA+IA0KPiA+ID4gPiAgICBjbG9ja3M6DQo+ID4gPiA+
ICsgICAgbWluSXRlbXM6IDINCj4gPiA+ID4gICAgICBpdGVtczoNCj4gPiA+ID4gICAgICAgIC0g
ZGVzY3JpcHRpb246IGNsb2NrIHVzZWQgZm9yIHRoZSBjb250cm9sbGVyDQo+ID4gPiA+ICAgICAg
ICAtIGRlc2NyaXB0aW9uOiBjbG9jayB1c2VkIGZvciB0aGUgU1BJIGJ1cw0KPiA+ID4gPiArICAg
ICAgLSBkZXNjcmlwdGlvbjogY2xvY2sgdXNlZCBmb3IgdGhlIEFIQiBidXMgZG1hIGJ1cywgdGhp
cw0KPiA+ID4gPiBkZXBlbmRzIG9uDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBoYXJk
d2FyZSBkZXNpZ24sIHNvIHRoaXMgaXMgb3B0aW9uYWwuDQo+ID4gPiANCj4gPiA+IE9wdGlvbmFs
IGZvciB3aGljaCB2YXJpYW50cz8gRm9yIGFsbCBvZiB0aGVtPw0KPiA+IA0KPiA+IEl0YHMgb25s
eSBuZWVkZWQgZm9yIHRoZSBpdGVtIDMgbmZpX2hjbGsuIElzIGl0IHByb3BlciB3aXRoIHRoaXMN
Cj4gPiBkZXNjcmlwdGlvbiBvciBhbnkgb3RoZXIgc3VnZ2VzdGlvbi4NCj4gDQo+IEkgdW5kZXJz
dGFuZCB0aGlyZCBjbG9jayBpcyBvcHRpb25hbC4gRm9yIHdoaWNoIHZhcmlhbnRzL2NvbXBhdGli
bGVzDQo+IGl0DQo+IGlzIG9wdGlvbmFsPyBBZGQgYWxsT2Y6aWY6dGhlbiByZXN0cmljdGluZyBp
dC4NCg0KVGhlIE1lZGlhVGVrIFNQSSBOQU5EIGNvbnRyb2xsZXIgSVAgdXNlZCBieSBNVDc5ODYg
aXMgdGhlIG5ld2VzdC4NCkluIHRoZSBmdXR1cmUsIHRoZXJlIHdpbGwgaGF2ZSBvdGhlciBTb0Nz
Lg0KSWYgYWRkIHJlc3RyaWN0aW5nIG9uIHRoaXMsIG1heSBub3QgZWFzeSB0byBtYWludGFpbi4N
CkRvZXMgdGhpcyBhY2NlcHRhYmxlPw0KDQpUaGFua3MNClhpYW5nc2hlbmcgSG91DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
