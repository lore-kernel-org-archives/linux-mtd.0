Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79F6C43217
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Nov 2022 02:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3CNBqJo3g/27duVuhacKMPgisBpHOM+geoQc+GBbNs8=; b=b0PTWlm4xg33QW
	IbdWIVKfKRl6/ZqHeOED4Z4TSmwJFK5eQkttPHcd+mN59ctitipJp5/nMwiKjE7EQi6p5vfninL8E
	tLxr6B0LhVTe0f8/KZIttZTjQ+K2z5hyhWxQdyaNy5EgC1x0/cu2XMl6dy/EgwRNiFaCIkjzQgB3p
	Zi94R2mKR2jdw14gLZ3DDFwe8Rp0U6nzHElupo5bThSBweSFQ36XdZrLwLPJAZdflLiunr1ecbDZm
	Ybf9jhqlhYNwRt5osOXczVVvR+Q2QUPjxPEeJ+tRLeRM15sESjrl2tuxXRNDHz5zUYjuLAB0I0fNX
	t8gYG5+7FFJtVbIUfFWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqiF-005TbS-CQ; Tue, 29 Nov 2022 02:51:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqhl-005TRc-6x; Tue, 29 Nov 2022 02:50:42 +0000
X-UUID: 46c96448876646ca856e8506e2ce1429-20221128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=z+FE7O3hUTUviRpg4KjUjAAI2qZYfX3H09+GDQ7LAxQ=;
	b=ALTemNr0gjQHOqB+u/1nrpj7HYcEuLRV7ckyj82dUXTaK3KbbpH0N0J4T/yIvTyougwNvG/L5YL6U1QtS/wNFrSK0P7CxXIc+qw0LN6QtW2lSGTgKxqOv049ZSwXxFl6A00cSMQchJHDjGtUcc25biO0lOhFIWn8gtnxIJQ0ZGY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:290e88ee-0858-4865-b34b-345f34ac9528,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:f54e911e-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 46c96448876646ca856e8506e2ce1429-20221128
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1884014506; Mon, 28 Nov 2022 19:50:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 29 Nov 2022 10:50:10 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 29 Nov 2022 10:50:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGLsjQzeih0/6YtZp7pguHMwMu1SZ1VCD/Yf1ceRiJvfUMmulSfvAoe/xMJSaYpRgKEFSU6B4LC1XZo/BiCLe3WpU8lrqH/5tNlhiOf3/H1fnRmtGVYuRcd6fV13XiQEHIhJfvSCQEnWlw+Sk1sE4o3ou3sBEbaSKAtA+2G7oh647RFDOKyIGlXesguGmp2PgszcOzGf++WPWpt6/2qvB3AB5IAnJap9yCdgB42TJbXCQ8/E5bqlN8UJ3fLYJ6deQYGAOVT3Tq8AfmH8/Hs3dPmtmwJ/Fc+eSa4orn4iKLn/nXpxVdb7Xrr+a3MbTkyzfjKxEHLbICfdekAFbvoxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+FE7O3hUTUviRpg4KjUjAAI2qZYfX3H09+GDQ7LAxQ=;
 b=QUWx+r5Pwx+d/ela26v+2KD/QbMg2XbuuSL0LBYw5NEtU7F4skrJoyeYFqenCOroayQwGtOJM+e7Iq9uQvsDN+ZgkT/cqH4/KK22Xun8Jrc7l+kvRwZ6HAXpbBdCwO+yGle3DM+348O89eF8nh7PADfoLktB9QHy4mfNszlJxCLonmH3L/oB1dttHTohdJBkDvwbLlN4ewgre4K/qwicDErbKdrE5jzr0HCq4CsFFA6FIpfqE0evYfZMgsob/+HytuJZOidx0JDt1q95CtRpIzBsWSblcLDVmfOkAxD2jt5GOnVaU+yF4htNpnQ4WSPPfMkP+hJ5MpqrJRqjBN9xrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+FE7O3hUTUviRpg4KjUjAAI2qZYfX3H09+GDQ7LAxQ=;
 b=n79XBFkn194LPn/uMD6VCFZvSavg+1aeLVWk1/+TZPAlXTh5lYdMs9vvgl9lB3k5w6Ph/14SCMDmQvyxyfF2nQzTCZOn+1gz3rt45mq6t7srgghTaTDD0RWwqZ8xOGVcDi3wmC1CvjavnVff4D0iW3BylCt8H357HhbLw0E+/mI=
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com (2603:1096:4:84::10) by
 TYZPR03MB6917.apcprd03.prod.outlook.com (2603:1096:400:28a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 02:50:07 +0000
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::6f36:b7bc:7906:b179]) by SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::6f36:b7bc:7906:b179%6]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 02:50:06 +0000
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
Thread-Index: AQHZAs5edHjv2x34ZkyIs4MU4UZyAK5UCgqAgAEq7AA=
Date: Tue, 29 Nov 2022 02:50:06 +0000
Message-ID: <5f76482d33933c19e191ea618f8622cd0660597f.camel@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
	 <20221128020613.14821-6-xiangsheng.hou@mediatek.com>
	 <8b8e4b23-a3bc-7e3d-199a-e8f591d05d71@linaro.org>
In-Reply-To: <8b8e4b23-a3bc-7e3d-199a-e8f591d05d71@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB4565:EE_|TYZPR03MB6917:EE_
x-ms-office365-filtering-correlation-id: dae79d6b-65a1-4d47-5c16-08dad1b46c5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DtMUyBgD+fiTbhN5kYX2ViudtMEGWk2ZcWRuZH48PjTsXZ84H+i7d/a/WCuprlIv0IhMzih8uk7JqltD/iaLttTh3HhMab5lJrJ1h/g61OZdabjm7plFltjdqbIsr1MqUCTpCJr89aX2W+FpC+wtvuEFkwqsoJ4iIyLO76avaf1OH78nfJgAHsm3sickShqPvX5Y1bjxscWQu1Jz2G41vpCZuVQUnQ/7cshFn4TNHe6R03IQ9yAf1Qrj14U/LYKMB//TZoCewHY4w3fYNAqjG9NwkfqmvnsF0/1eZi8zwuz/YSN88FGv1sqPJbObdZl4Dq0lTdlWJcSsYhDDPbyTXnUxqsk/R9PnSI9sA14oJwo4bLogwxnEAC3KQsgz+5/7bdyaWujjIVmm2jBniIM9Ld3cYZQeCg5Mqe06bU/AXwJXPJP0ABICUAqartEEFagTBVI1iL3vwPPJ9TFs+y+kY6G+hfvWMMOwz/WfS4BBH8sikNT8vAsBG6JzbNv/PQ7SRnDzZa2hdnJbcrSD9AirP1PyPs70oEV9Rjm+6n60kjqz23uVAesBiPrKwKzXKq8aUl/gvRjYYOtBDR2EiC/z7qox/Gx6qO/cLhZ6boD6Vwo2gpv1/k4ILD4EWrardDa2yjC6tEJ7t583vfj0gZEyvVucsr3jMJySGsaF9/uNn4HSZV326mozU4rhGHLv/qZgchCyprRgwjqHl6CCNAd+/mH2thpgXkvtOOghqgkHu6c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB4565.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199015)(36756003)(83380400001)(85182001)(8676002)(4326008)(316002)(66476007)(66446008)(64756008)(186003)(66946007)(66556008)(76116006)(2616005)(110136005)(86362001)(54906003)(8936002)(5660300002)(38070700005)(7416002)(4001150100001)(4744005)(122000001)(2906002)(41300700001)(38100700002)(107886003)(6486002)(71200400001)(478600001)(53546011)(6512007)(26005)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3VFQUxXUjN2Q1BUUHZrMTFWcXBjcHZkNUZJWDBhNGVCeVoxaHBaczZIdzJH?=
 =?utf-8?B?bk54Rnp1d2llaVU3OHFLZG9mdExpQUZWcElhVmZWL0Zpc2dDN0VGdkU1Qjg4?=
 =?utf-8?B?TndZUFJiWlMrRngybmlQZmNRYlNwbXhyRnlWWUFndEc4elpFTlEzeTNZVUlo?=
 =?utf-8?B?VUlGQnJ2c1VIQmRnemtUZ2xhR2FnWjU2aEZkOTF4cHZsb1NSYnlDUXR4TnRw?=
 =?utf-8?B?Zk45VUIxa0dSNldPQ2JyYVB4QlhYY3FmRUNFUlF0WEJOS2FZTmVjS1hXNE9J?=
 =?utf-8?B?Q2I2aTQzbk9rZmNYdjIrTGxQZzMxSngxbWZqcGRhZkNva2RFRUZ2TDdHQnhR?=
 =?utf-8?B?dmhSWnVBaW1uQTl4Y2YzbnBOYkhiZ2xQaWNhaHF0dVdldHcveXk1ZWV3NHBC?=
 =?utf-8?B?NTA1LzdianNDSE9zbmJGS0QzWEltUGVPQURSeWdWZWlraHloVTc4Vy9rWTNW?=
 =?utf-8?B?enp1dGJETDVqNzlPT2FsbWFIWDNZTHczbmtHZkJ6YTFXTjlTUlhRY1VjWEVS?=
 =?utf-8?B?dFdiVnk4anM0R2Z5RlhSZUM3NTNqOEx6U2ZRaCtTSmM0Z2xPcmlHYkljelZP?=
 =?utf-8?B?RE9vVUFsQXRHRllOcEY5T3JUSnQxNU51NTJMZCtGcG16dERiWlJYV0h5NDQz?=
 =?utf-8?B?bndIYWZtMytlMVA1UkRrZERBZ0twcVorajNiRjJtY29lWm5ycTFqTlVGY2N5?=
 =?utf-8?B?MnBYZHo4Q2luTTJJODVkYWdqOEIvWkhLSzd0c2FIM0xTTlIzQlVWaXpreEpT?=
 =?utf-8?B?T0RDNDhMZFRzNTBEbWhZZ25aOWJLb05tQkNMRDhGNzhjSTFiOEsvVCtzWFJ1?=
 =?utf-8?B?N1FwQ3I1RGFqdEtDK2RYeHdxWVV4WUdWOTBoeDZnQ21VdU53ek1sUXpSOTJz?=
 =?utf-8?B?TnlFY3ZBbDZlSWd0blZXVTJ2RzdXRE9TZStqK1lSVGRONVc0VGFjMVkvQ0M4?=
 =?utf-8?B?cmc0VkhZb2lnU0lWWEE0ZUtRSnRwT1Y3emd1bW5OKzlDbGhrNzlwenlzVVNv?=
 =?utf-8?B?cUl6TytjTE5Rc0xITnpKSDlFOUQxelp5ZFBDbW9ub1JtZW9JR01SYzRqcjFl?=
 =?utf-8?B?SnYzMThXb2N4K3lSSjdyMXA3Q3pjZk9ESHlVUklKSXZ2a1V3WXg3bEV6bk4w?=
 =?utf-8?B?eWFCRWNWeHlnYXBWZWRDN2lWMTBGVkNQbERBWWFUeHlSUzNqRURkdFQrcDdi?=
 =?utf-8?B?L0ZlaTlLQmpJQ1hFUkViWi9ybEJoOE00Tnl1Q3JsYXFqKzF4RzEybjlZOUhm?=
 =?utf-8?B?aWxyTThzNFl4N09IM1czTEJ2RDd3YW9sd2FRbUp4S3BIY1VNZnhtd0JkaDdX?=
 =?utf-8?B?czI3NnN3VGlRSWEvSXNHVDZIVVhkc3hTcU5FQmtQa3htSG1ndWR6eDhkWUUr?=
 =?utf-8?B?TUlDb0F2NzF6VDVXL3VHTnllTE9sZWR5WDN2N3drYjN6L0FGQzJxbzluKzBH?=
 =?utf-8?B?S3dnYWtaOGZqdjZncUtTcVlIL29ralhNRFMzVzVxbWVHL25LV3BlNEE5L0RF?=
 =?utf-8?B?aWYxMUIrQXRTdmtoVVg2Uk9YRmZSVGtXTjRNbG5wR1pGYWZ3WVcwVE84VHkr?=
 =?utf-8?B?VWVyaFNGRHFyNE5UMEpwSXN5ekZ2M1lPdWpXQVBESk5Nb2l5cXZHMVI2Q1pl?=
 =?utf-8?B?cVV1OXYveUw3OTV3Y3JFdkd2ZVYzdHBVaXpWMDhrdVpZOTB6eFBqM3JoclRB?=
 =?utf-8?B?a1phN0dFMWg4dTczK1VoZDJLeTRsOGZCQVhqNzNUZWJzRlJVa2RwSWxPSlZk?=
 =?utf-8?B?emlyM2s0RTJDeU9ydUE1b3N6bUZKSWZoYkdaNS9WNmdDQ284eklyREM1OXRX?=
 =?utf-8?B?SHhuYnhIclppOWR2amJaSGtVV21YWVlpOG9YMG5YUVhuMCtTSG1TamgxYnJ2?=
 =?utf-8?B?NlFmbzFIaVp6OVdZaXAwNWFBdDhPUXRHaUQvWXR0NEZjMU9aWG5xSEU0cGZs?=
 =?utf-8?B?aVliV05WVDNmZTlvNlVFZ3NoSnZXdkJCZjdzcVk4T3ZTMkxnUHAyMHd0a3lo?=
 =?utf-8?B?bDNGQ2ZSOFlkU2ZmaTFWZnJFcTJTNEhCNVZNL0Y3UTdFaVpXOWpwaWlmajFK?=
 =?utf-8?B?Qm91TnlqcUoyYkdpd0N6ajBsODFhRjJXazJVcng4WnZQb1RsM3dSRzhjY3lp?=
 =?utf-8?B?RndnYU1kRDNKYTUvc3ZjK2dSUURkcDFpV1JUblZ2M3BGVWxQU3dSamFSNGxB?=
 =?utf-8?B?R1E9PQ==?=
Content-ID: <B9F0FCDA11A469469F8603D7B616DCA9@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB4565.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dae79d6b-65a1-4d47-5c16-08dad1b46c5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 02:50:06.7966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FT3qQyMUdWQBjAFg/00JQRbruDL+BJze1Z9yAygDFAo4XRaafT/K/MK7YTJEiJ84CovFd8zh77kXXPLjFy78qUBZTYe45m5iYD6tlTQ1BvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6917
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_185041_310628_E7B46BCE 
X-CRM114-Status: GOOD (  11.29  )
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

Hi Krzysztof,

On Mon, 2022-11-28 at 10:00 +0100, Krzysztof Kozlowski wrote:
> On 28/11/2022 03:06, Xiangsheng Hou wrote:
> > 1. add mt7986 IC bindings
> 
> Subject: drop second, redundant "bindings".
Will be fixed in next series.

> >    clocks:
> > +    minItems: 2
> >      items:
> >        - description: clock used for the controller
> >        - description: clock used for the SPI bus
> > +      - description: clock used for the AHB bus dma bus, this
> > depends on
> > +                     hardware design, so this is optional.
> 
> Optional for which variants? For all of them?
It`s only needed for the item 3 nfi_hclk. Is it proper with this
description or any other suggestion.

> 
> >  
> >    clock-names:
> > +    minItems: 2
> >      items:
> >        - const: nfi_clk
> >        - const: pad_clk
> > +      - const: nfi_hclk
> 

Best regards,
Xiangsheng Hou


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
