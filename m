Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB913C38A2D
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 19:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=askjQ/ij7GS5w5aYejljMcHQ121ERRN8L83JFs6YuP4=; b=INmcve4csNXF21
	RRK/ioTKCGAygyrlVH7d/uUmp+g5m8nl+tmyebtBH2NOY8y7jmsti811cFp9XCZbw6MDELtV0M7U6
	z3OxCpbr2ewyuA7ZfDrL18xdhiXvDvh6RdgHtfbboqbJSyiokzJPrF3Z8W+U3gODPtBxcmySa+HhP
	aGFR6SO6kopN54LBxfjoJhH6cVAl0U1AfJixryBJ3zvwIC7LpZRkMLRq+SvxVL/dIVKJAgnOWqjwl
	MMVPAMZk8onVuoNzUfQlTA8/KJVstNkZrD9eBgojl7+DwQkfIJQZKJ0tnzRMg0f58PENZKkfM6im1
	bZP5VWo6qB6c70LlOj+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oly8e-009gTM-6o; Fri, 21 Oct 2022 19:57:04 +0000
Received: from mail-eopbgr80134.outbound.protection.outlook.com ([40.107.8.134] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oly8b-009gRW-Dk
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 19:57:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3N6+k0WcEm6+Tvlh4TGO/Gk9+t0rZWTpZRv4Ev+G0sTHggE92K6dUJy01cCVxXdrao7D3W1/WybgDgZWjF+iFQw/csHTAcxwIaBx/bMXCmk9jVt7HOabs237HUwk2/iuHXE6cCJUjK847KTQCo7F0SuqFbbXrhaj/HsYlVowp4FyuRLYgAYALYBdWTVcG1EX3dr54iRHxi/cr+Nc2aw0DVWFWAhgaay1JaPOAEuWD9+48MkLUt0nTJdujvvu6LD02ntyViBTMRSzym7E9PxMtn4iai4mT6h1B5buGArI3lxWiui0drrNX8Iz1lmqxjgqGHxjg1DtTrA/XwBm+UqCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSnhRFzBBNIKzYX6oSirpwIR46mWn+vbuts4BjAq8gU=;
 b=kpPVzOOFOvMsCQxjbR1RTxs57d1AAdqE4X7T5AdXgdbeLBe7T7MorwVt0sIvubarGT30GK0eVSowQNIAL0QixCey2UPD00RB40/yj5SisMWDqeTW3LIG0eqHaWDYjmivXr1p55uA0gZZE69NaiDc+/J04E4+md86KLaM43KaRZriYj6zq5xShco/tvhosadcVI/53KsNAfwniAwNWqDxVw6gen8Izs9/MzfoI1oKCSTWeb+Yro39gSdPcaUo3UqwUj0qvq6K34F632KKwoP0kC7hyRaicX2BZMEZ3IwVoufBKMximLNMS0kGGRpWSqJ+X5Nd4e71tMOxwcrwjCmR5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSnhRFzBBNIKzYX6oSirpwIR46mWn+vbuts4BjAq8gU=;
 b=iAeEZIgCI6oYuE6gZhhfWm1LpRK5Vf641Vkw3U2XxSmf9yQTcRz3Zhc87WEa43HXZHAy9PnfYOO0s1IkXrOJo85Vjne8Xm2N2UZcZImo6go2nL4CmtlGQpn04CNKQJ1Dj90QcY4Rsm1XegG+9iIDvlfYUnhTDURmo5A3txVmsBM=
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:38::26)
 by DU0P190MB1953.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:3bb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Fri, 21 Oct
 2022 19:56:57 +0000
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::a621:b61f:de56:b8]) by VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::a621:b61f:de56:b8%7]) with mapi id 15.20.5746.021; Fri, 21 Oct 2022
 19:56:57 +0000
From: Vadym Kochan <vadym.kochan@plvision.eu>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Roger Quadros <rogerq@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>, Liang Yang <liang.yang@amlogic.com>,
	Chuanhong Guo <gch981213@gmail.com>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Elad Nachman <enachman@marvell.com>, Aviram
 Dali <aviramd@marvell.com>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add AC5 specific binding
Thread-Topic: [PATCH 2/3] dt-bindings: mtd: Add AC5 specific binding
Thread-Index: AQHY45PTPI7TLc+fQEC4CnOCf8ArC64VZ4UAgAKEjQCAAVm2bA==
Date: Fri, 21 Oct 2022 19:56:57 +0000
Message-ID:  <VI1P190MB0317D2A6E35BB6420023FC45952D9@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
References: <20221019082046.30160-1-vadym.kochan@plvision.eu>
 <20221019082046.30160-3-vadym.kochan@plvision.eu>
 <20221019104654.7ee35744@xps-13>
 <e13c3b91-c092-7756-3969-f1822e04cfdf@alliedtelesis.co.nz>
In-Reply-To: <e13c3b91-c092-7756-3969-f1822e04cfdf@alliedtelesis.co.nz>
Accept-Language: uk-UA, en-US
Content-Language: uk-UA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=plvision.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0317:EE_|DU0P190MB1953:EE_
x-ms-office365-filtering-correlation-id: 1b44d0b0-8abb-41a0-7cb6-08dab39e68f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  zoI4IULcRNGM7oyZTX5JKkQTryQdWlSyxmHMJtDYKdhKkDiBfzhsEVXtcRvUSMjTKJ5Iz+UAMMbci6l/y8HSVVOEUhftTyC89e80LGhod2+uzsXA4xYWR6/1OA3PsPXBY94Lq+JNKRNI2sxrEcG5hNWTKuOtdZebwrhqn4nxKXs8Jv0xs2gNSjy/a285b+C35mHp9Tq3RgJRPPbvb0z9o+wddlneDbpo8nTv4HWDBZ22ktvDKMVnYSjeZHuSOroYHWRr7TH/tyQ4EJhgC1lK3yJda0bKzFfqF9oTxSKSvN0JGE9FlKbdv/jziOyD3L/E0ImyvVmzt95kYPa5c962a2RUTAQcqR4fFmN0Wpo1z8fvQh6jGfappjuPm9D0ESSGpvjBsUqNQbHAjJefvctI7AZnny3lxaDAErN1ZQzUmHmeTgqSB8woxzCHRdaTy0HTwv9tbhnlTgai7aWiBvOWA3JFJv0dAZbfW8dN1eVGJc/ncFPNzPPoGLimtdYsdsuKiQPs8l9QYjEaf7PmVESAaaWwfchnbJXBpCJCGXCklF/QQJAEokhUtbVJfK2I5I5fn3MS2memn4XgwQmK3jzvqK5CuAzNKqs2Mdft6k0LPuqTRTV+emzoD+dCVj9DVxNMD/WgXK7LxU/0Hi50RYIo8VburvB9fj7+g0w40SLSZreTS4lDxjIICYRXj9J7o6EoCEgGM4k8oqACUMA1YLUb3hEsceED+9jIi9+Tii6vGh+gvKuNwxyD4P6L20m5YrVP
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P190MB0317.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(376002)(34036004)(39840400004)(451199015)(33656002)(8676002)(110136005)(7416002)(86362001)(4326008)(5660300002)(66446008)(66946007)(41300700001)(91956017)(66476007)(66556008)(508600001)(71200400001)(52536014)(2906002)(44832011)(8936002)(6506007)(41320700001)(7696005)(76116006)(186003)(54906003)(316002)(38100700002)(38070700005)(64756008)(55016003)(122000001)(9686003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?koi8-u?Q?pBftSUoauGT7Fv1X6X6oQ0gUxflX0J5JV4563kxSOggeMEMslxDuI4kyAOp+VK?=
 =?koi8-u?Q?f7BEpJ/0lBybRv48so6uLKfqNOSboP91lWofh1lXouzxUlfdx8tO2sAceBPlvo?=
 =?koi8-u?Q?mzI1f2l2gG7puuf4O2GoOaTOTiwOqcM/fzDolTIrjAM/PDTGtvI/SuVmZ9k6iV?=
 =?koi8-u?Q?CBplDaJH0dhOglsAZLt5anLTd9nzLOqITMxgtYG1tPtww0bg8FBoVmp1rZnRw8?=
 =?koi8-u?Q?T6BlDb2YE7hqdJGVrLKg4q8XV3QOaOYUVDZ5tCjL6ooa0pEn6WPuQp/sF++u+b?=
 =?koi8-u?Q?IO/Bq23Wwt5kBuLNoWe4m04CBXDLIL4L0/NyZg6yX6k8PIqySYFAEmmqNh6UnE?=
 =?koi8-u?Q?Ok1B6dSiDbVxQntuxIz3VwjJKTrloJ+U3PFQjnZ4kJiX3bj79SM+bWPgIlzISi?=
 =?koi8-u?Q?MgpXcrtzVP+V4gzB8J/TAvyCnFs8sMiSvRODi5ywb1s83Yqh1oopm2mESvyknY?=
 =?koi8-u?Q?Eory1itFcXRWEeNufeTzK4BNmcTfD9UXEdSbkv5NoyhWk3Iq4U6VCfQphLbWQ6?=
 =?koi8-u?Q?rK/mG/096dFKm6WQp2W52TaDDZoDzrS8J2pACYxTSjmPpvnRDZvJkU+1Jiqeeu?=
 =?koi8-u?Q?aHA7hDw/BDq4uaI8frBHbjGhK8PX/N/qfKUrfmyh3z1gM9V4lbIhhvSI2P8gDo?=
 =?koi8-u?Q?jFnuqQW906WQIuqFyMnB8DVCTHPliXC057oRHsdoRRiJ00nkqy/+O74NRQ8lKT?=
 =?koi8-u?Q?3fYUQt0JTBJf7DRUCxNq6O8jrHHWK4Q5PHMXQC1qEMhs0Yn/9VnP5YfcvF8uzN?=
 =?koi8-u?Q?kZRwPpu2ntUm1X3mF1y3qeFIqfItQ1E8pKNxGyIdij3/nepg2bYz7KUpwb+crz?=
 =?koi8-u?Q?4yHYa4BvVTPRbR7lt/dozg41st0zCEMUJIMHt8HFKLcwXadTOO/O2nL3z9f1Oo?=
 =?koi8-u?Q?C7yKgIpZ5he1BB9TokKsJgp6Y66hnDn46K0lmjWeUGqhElUKieoTjZ7Ew3Fohp?=
 =?koi8-u?Q?6/nI8bthaq0ijzD6mOZX6UmhYDYsdaSx+gU0CA+KvSrX1ubrV2N+IEBD863Hma?=
 =?koi8-u?Q?12ahUhcdyqNgGK5DL8l7BtY9T5G0rPrU1uXCCMo+gWvUJ0Bf4kXT7mMmpJHOzP?=
 =?koi8-u?Q?+RVb2JoOCYGTS7shQ1R4jenu5qFKyApPikPpGQrIsLmkGzacU05R5dhOQljGrh?=
 =?koi8-u?Q?einRo5RCnep6g7V9H//Cper14ta2Sr0tzp02HkraERTOC3JccB0U2fvB0A1P9A?=
 =?koi8-u?Q?S66blTlDEsStKQ2rHN2XhWrBIVnJvywXUPyFmd0mrJnIeX7KxvoLgzDzTYXBSi?=
 =?koi8-u?Q?imb76RUdhuIaMpfIFAnKO9mzz4Ngt4LNa5Yfi3RYU1/Ou907kVxQr16/PIwfdJ?=
 =?koi8-u?Q?easqjoEkZhge9R1nJdgsJwhgvGXs6NFhpzZLx4mJJ5v2Pxc0d7b9he2ZAT0VEb?=
 =?koi8-u?Q?a3O6MG5R4KCbY3lYWximWj12r+l0YMM8kPszP61WD4DXkjSBaohatrIZBqlZGb?=
 =?koi8-u?Q?BLhcUfthLJY0lTFwlug72KlwE+g/EL8ZL53HWKPy9/mx/lQFA9nfcWH7wKuSE1?=
 =?koi8-u?Q?UGGpNeGlN2UT+MKViFA/qBMb2y2bM9Bw/2itJc5GI5uc3v1ag1?=
MIME-Version: 1.0
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b44d0b0-8abb-41a0-7cb6-08dab39e68f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 19:56:57.2829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9KejrgHFRnjg1jmYE2oRMvu7iPI65mPeqB4KaZReFEIs/zdlaqMLq3Ka7d1PWkqmzR/VE1OxI3J1zvWxcv/t095Nyz3kgEmhUIQq6hSYQsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1953
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_125701_494718_DA79E07F 
X-CRM114-Status: GOOD (  10.11  )
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

Hi Chris,

>> vadym.kochan@plvision.eu wrote on Wed, 19 Oct 2022 11:20:39 +0300:
>>
>>> From: Aviram Dali <aviramd@marvell.com>
>>>
>>> Add binding for AC5 SoC which have its special way of handing
>>> NAND layout.
>>>
>>> Signed-off-by: Aviram Dali <aviramd@marvell.com>
>>> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
>>> ---
>>>   Documentation/devicetree/bindings/mtd/marvell-nand.txt | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/marvell-nand.txt b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
>>> index a2d9a0f2b683..293551ec7350 100644
>>> --- a/Documentation/devicetree/bindings/mtd/marvell-nand.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
>>> @@ -2,6 +2,7 @@ Marvell NAND Flash Controller (NFC)
>>>
>>>   Required properties:
>>>   - compatible: can be one of the following:
>>> +    * "marvell,ac5-nand-controller"
>>>       * "marvell,armada-8k-nand-controller"
>>>       * "marvell,armada370-nand-controller"
>>>       * "marvell,pxa3xx-nand-controller"
>> Could you please do the yaml conversion first?
>If it helps I've done a few of these conversions in the past. I'd be
>happy to help you out with doing the conversion if it helps you move the
>rest of the series forward.

Thanks for your proposal to help, I already sent the separate series
just for YAML conversion, actually it is my first YAML experience.

Regards,
Vadym

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
