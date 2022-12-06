Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8E9C352A1
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Dec 2022 09:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQ8ZY1u0ovika02yNDgYsXEUTF46gV+XzQL8fUfkYBI=; b=YShFWFWxLY98Uj
	D7ylrGcnzdNXYqg2jR+QgI1zj5kJ+0uZbYKCowkrxroSIr4PQkeYGzMfC2fr8mi5TwHQ2bjApxMkl
	LV2CHCoH+tza8X7r8EdxDlo9wvtFJINzaoZ2klSmZBT8Ty4RL2FtUim/h5kL9iddoG248X4rtl2OD
	HCAtGT/dO4fVWixcxWgCoiXfnmr/3xNUVmY/eeifu8EXNHrfuMJdiRrKILztZrvIhJiDa+1r0JjYF
	6Ze8VpgPv0KQUHTkSkaYXTFvu+b3437VN7iKObdk7RLXtB3JJwDCds05w/p4z9I31GxCHDZivHzqb
	lvnWtOUtt89gFaoRYPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2UNK-0068tj-S5; Tue, 06 Dec 2022 09:36:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2UN1-0068Hg-2v; Tue, 06 Dec 2022 09:36:14 +0000
X-UUID: 6452bf4175fb4d4bb7672fe37b4d19c5-20221206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Uy2bHSF3CNl1f5mYwiyxOXnoornJGH7jrmVEUXVyd2s=;
	b=XWWeBhlClml2TnvzFfMkzMAr8NGDRjRMT2J9BodeMhOOt2TkbxpCNJTruUQmhDYqzBp/2aKIdj68SWL/hUdDjGbYYAT3BVYyS4QkV891psIha6U0/Xq/iEAzvrfPEYKvSFRSUCkggFG39rd9jhEMSUEAoCRx+OPAt5U74pCP2qU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:866bc544-9a56-4238-aebe-38576cb4fc01,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:2d5cb016-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6452bf4175fb4d4bb7672fe37b4d19c5-20221206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1812701676; Tue, 06 Dec 2022 02:36:01 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Dec 2022 17:05:07 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 6 Dec 2022 17:05:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjZFFLBpErpph4wA3jaWt0ElehD4JGQpnBrl3UX16dNQOAtHMCKiwLCAD+4k7Lx0Vx4xravbmikfpY9o9shDHX0a2aA/0jxWUuMu+87RQDy8wipEOQjr9Waz+DSnRkY+aKyMb415XmW4z/fS33OmYnoDHtdAUl+LZxCTrAbapDzO6+NBPzT+B0oUOHqPSGAcPC3HDYSJnPwTJXn+EWl29+t2CIMw4FeGr97JA0VZhBOfNun/oDpA6K10Aj0VdJtn5g/pJ+XNvOcAKdHYKjZUpz1VXr1oOXlguHp44fW8ZtUlgRv/FXPdaZGjgchBXUwsTrvmVjYSuuEcLmaitqWMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uy2bHSF3CNl1f5mYwiyxOXnoornJGH7jrmVEUXVyd2s=;
 b=k+sWa5O2OxlEMCP9mPfPGdB+1Uf0zOYZYNzUFdyfo3D/pxOHFCO4LV9RE7I8+1NgQ+z8fPe9f02Ee1jUuLx5IF7sW5PlefD6KdUPrSWq8iLyM23ryoRz/+QwB+KW/34ZN48wH5qx4S5u25r7b4zBtFJQ7QBlN9kB6ZGTY7fPuxoN+qaLRxgi+RxfTRF8yRrPM1JlogKyWJQPgCR7EA5Da8pQHF3k9wiF5PHktl1F2XrHcqBJGndxd4YHjI1Rf8q+qViuFlJOwj0emwwM/Rb1lXqVMUwl6uRnt6BIAFV/kFHRW8JpojK7iAmHZHIXpXNcu5ztKnfLZKHq3UW8rfm9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uy2bHSF3CNl1f5mYwiyxOXnoornJGH7jrmVEUXVyd2s=;
 b=ae3hND12VL1G7jj86GIxSyzibnw1AyuqYv+CFBd79/poa6lNW7DXjo9ZVb6KchCLzAts9Kt6nbHHGEbsHcA+cK9+5Zofe3+ZY4MbbdqRaRuKEpHKSKPa1sUk6FDVhaS/R8FEfWtWLzZeddLPQQ+zYOY7oLOg6nLnXjVv1ilJ9Mg=
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com (2603:1096:4:84::10) by
 PUZPR03MB6159.apcprd03.prod.outlook.com (2603:1096:301:ba::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Tue, 6 Dec 2022 09:05:05 +0000
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::3d3b:d288:88e3:59c7]) by SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::3d3b:d288:88e3:59c7%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 09:05:05 +0000
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
Subject: Re: [PATCH v2 8/9] dt-bindings: mtd: Split ECC engine with rawnand
 controller
Thread-Topic: [PATCH v2 8/9] dt-bindings: mtd: Split ECC engine with rawnand
 controller
Thread-Index: AQHZCHcINmtQ+RSt2UWpbgrOZRjewq5fBR+AgAGNmwA=
Date: Tue, 6 Dec 2022 09:05:05 +0000
Message-ID: <7e507c3a4832d12471a24b75033bd1e742151f03.camel@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
	 <20221205065756.26875-9-xiangsheng.hou@mediatek.com>
	 <3a9b5a27-e18f-226b-065b-f09c568b4d85@linaro.org>
In-Reply-To: <3a9b5a27-e18f-226b-065b-f09c568b4d85@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB4565:EE_|PUZPR03MB6159:EE_
x-ms-office365-filtering-correlation-id: 2a8ed235-4bba-43f7-da65-08dad768f7a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LmvcXhN7EPmXmHe1q0SSRrFEOmKdroGo9bt75uMjF9YL5sNFqZCNzCqVWliK8CtirmvZSzmy3L6oSCcqhEG3oAO3VKu6HuRnGECUyfkI/xynW9sQCjh6EoJQDjuUfuVzaXir4UFzXXWCBD994N8PSqSfp1sONc6PLlOn+2rfNwJ4BiHla6TqbPCOG2OCaq4mB8Oz+J4Ns2AnfJssfoS+gWWnyJp/FEAD6JR4Usk/38MaTIMxL+4gpAlQ8S8ukmajWFQKZs5ZvCr4DVJ5QDjv4HpJfeo89rbmoPyiH9AD4Kkw+B2lCuDQ8rduong9bu4gH1hNa6l21RCxu2RJSVY9DusoRTSVMHp1NUNiprXlZlm/VRWenoYZDEaFl1w7w8QB3JPmE/V5E9ll+SnZGRSWNYtRkb1Q/NDT5tx0PjiCPBcM4fBCtabC1B2KVN8mWhz5GRfAxaz8r5f1e7m9vohaxNco7JVUIpAS80u+8cFlGFK4pk3g+lw4QjO3wl7dTda+rRBd7/prCj1yyXl5z1rZKBYcVsLnNuSabjyPxMmbd2gQA5410cjvfKn2JUtqDkjrskBtPuYnYTAYzGfEHF379PD+5PNlVE5zlrYZXX2wqE3bkqy/Z2ePuDY7cKKFDm1F7xnkaPbxi/aePKJ/bdna6sAaixau8C8YcYgO313jtIhxFMoAArABW0JZMUuxk4tzVkxRzABbQYE2YJ0VbLYXZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB4565.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199015)(5660300002)(7416002)(186003)(110136005)(6512007)(26005)(83380400001)(8936002)(54906003)(478600001)(71200400001)(38070700005)(53546011)(86362001)(316002)(41300700001)(2906002)(107886003)(6486002)(38100700002)(6506007)(36756003)(8676002)(122000001)(66476007)(66446008)(66556008)(64756008)(66946007)(85182001)(2616005)(76116006)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGhaTURDdHFRakEyL2hUS2llb0J5WHVKalNLT09IVjMxK3pOQWxlZkxGK05D?=
 =?utf-8?B?NE1lSXdCVllPVkYxSnFxV2plalY0eE95WkxvaE1ZSzRwU0VDZ25hais0NGFG?=
 =?utf-8?B?SE85cFNhZTFnMC85WERETTJHVHpKeHVxRGRNTERwVGtYWVFPeldESTY1aVVk?=
 =?utf-8?B?ZDRBUVJqWEE4cnRkbFh4S2pOa0tIWFFyUDB6aTVSMldubEI4NXNxZjNuTVN4?=
 =?utf-8?B?bnhHcXV5elB6b0RDU09DRDQxUDZ2VU9uajM2TVFoNXBHelNEMFlXVFFNSWx3?=
 =?utf-8?B?YXZzdTdBRmNqelhRYlBVK2d4WVpJSXJQZ3ljWmJEcnMxbGliaGpCL0VKVFBY?=
 =?utf-8?B?ZE5GdThPTUgrbVY4bW9Jd0hubzZUSVJlbUJyZ3BMcTBaNmxjUm8reXNQNGlI?=
 =?utf-8?B?cmFEYjVxNmxET2pEZklORHM1SkFVNk5nWkZIT2pRODdGcVZsWE1PcExhZjd3?=
 =?utf-8?B?RU96Uk9rY1NKdXFpM3dPYjlKbGFzR0JGYTc3eTZSaXRxTHBsZnN1dlpSdktm?=
 =?utf-8?B?N1QwOGtyL1ZCL3hJYUV3bTZ4WmdzSlB4WW9yNmQyRjRoRjhXbVFVcUpKY3h1?=
 =?utf-8?B?OW8xdVFHaDFINkg4VGZldHlpYjFVVlBLa2plaVdJaG52SGtvNlM4MWt4SXFo?=
 =?utf-8?B?QnFrZkdCNnczT1RLS1dCcWxWV3hwUWhZN3lvWWVzZUlzZm13L1JzZkU5REha?=
 =?utf-8?B?eXBjVWtUa3gyNzhtOFhyRE9IUW5TWUlLSGFCQWJkVWtxRWEyM0NrMGdNSlY5?=
 =?utf-8?B?UkQzMm9CLzM1aWFZc3Y4Wm5tYWt3KzhVaXlwSU1GdEp5MUNxSmVuVFM2ZGw4?=
 =?utf-8?B?NVZwZDc4SmpFK1NNbHAvWFZmZThhWXpwNDJhT0NXSVRrcUpNbnBZZ1U2NmVk?=
 =?utf-8?B?c2lOUVMvWTI5MDNXbmFJVUFnVnFyK2ZxNnFaTytGNjZxa3hIVUVUbk03Rkh2?=
 =?utf-8?B?R3FjSC95dlNzZGxkajJDcDVwL0c0cmxLWUgxbzBhQlFCaGQvRGhkd0s0bjhV?=
 =?utf-8?B?QUhtSGQremdZM1Y3UWxHOG5QK3U5Rm5VbzhmU2lyTHd1Z053eCtsN1RQNFM5?=
 =?utf-8?B?MkhWRTFSMHFKQkFWRWgzM29BQ3JuK3h4eU1BTEk5TlQzcithNlVSN3hUWE54?=
 =?utf-8?B?czYvd0l2WHhFa1ZjZUVwNjdCeWZ3WmRQQXZnY0trTkhvdk85TmpicHQvMGNr?=
 =?utf-8?B?U3JEbnRUMGxMK0oyNy9HQ2RZV1IvZnFnRzBieVZwcHkva2lxak5kckNFVDZX?=
 =?utf-8?B?ZXRGK2RLY2dpa1ZiT3p0ZlJqZVk0NllqTkNneGhQNDQ3M3FKT0g4WEtOcm5a?=
 =?utf-8?B?b0RLZkJJRWJpU3MzdFhscXgwNjBTVEpIWnBVT0hPYlpWU1dIdjZHZ3Zjc3Q3?=
 =?utf-8?B?eUE1V3grM0tQMjRjdzBZUHAwOVdjU2xjWTFzN01ibXVXUkl4WmxmYkZua2Z3?=
 =?utf-8?B?Z1crRVZYcDhSK3MxMVlLTThGWm1zRE1hQnFGdlR0ZTgyVndWc0d3ZDNRbGM0?=
 =?utf-8?B?ZVBVY3VIZVh6d05GSU1BMzlZVEVUdnh4clp6ZmU5RGx2UVFVL1hSa2xEOWx5?=
 =?utf-8?B?akNnL2IxZFQwT0xwWUZ3SGp0dzdSeWpZWFNPQjJ6ZmozN2JFWHlSMWc0VVBx?=
 =?utf-8?B?QWxFWkF0ZERRdXhLYTJGSGRUd29zYmtGQmhVVzF3dmdXU2VaWEVJaUVqUFBz?=
 =?utf-8?B?bFZRbEFHbkxmT0FFZGhHUy9pbFpDVzNJSGdvTDlhdDJVMG9leFpnb1ppMnYr?=
 =?utf-8?B?Qml5M2xHYjlrcTZtcjE2alJ3VVdQVnpRbHVLd0t3bkFiaEs3MGtEV1U5WkxP?=
 =?utf-8?B?dWcwY2FWN25CRmdRWE1Td1N4bjJETkoyTG1EemY0OWFaVlFSeGdaRituY1FZ?=
 =?utf-8?B?NUFZWlJnb2xUK2hZdlcvRHpmYllHNXhzQ0taVnBKaWJOcmV4ZWJaRVlGeDZ5?=
 =?utf-8?B?N21qR3BDT0tqb0hEdkhMdFdIS1I4ZE9oSmYrYm05TlpmOWZMdEZ4dzVRWkZB?=
 =?utf-8?B?WlBpOWRsYU93cmFEZHpoVFArYmcxZ1FOdU9xTkd2Q1lGdUY2TUJwa1p6NXBi?=
 =?utf-8?B?N3pQUFVBbms2RlZvUjhZVHYwek5Ra3ZSdWdJbzhLTkE4V2x2UW52My9pS0xa?=
 =?utf-8?B?MlU2cVZKdlFzalJjRzJ2YmtXVXlDdzdQR1R0SVllRnpjNGtvVHlNNHBWUVZw?=
 =?utf-8?Q?O3IobFJye7RiH2E6dddnKw4=3D?=
Content-ID: <D01EF804F14B4C41ADC364E3B6F30F2A@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB4565.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8ed235-4bba-43f7-da65-08dad768f7a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 09:05:05.7355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DbfLSoHoZ/7yJlst+RAP31a8kHeuAezk9K4dvfnaX/1hO8eaPZ//bWrE48G76LENaa9mRVGx3jC6nR3yriq3TsCG9Mx9YLVmXHGdLbFbsao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_013611_187512_43DD3AB9 
X-CRM114-Status: GOOD (  18.98  )
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

On Mon, 2022-12-05 at 10:21 +0100, Krzysztof Kozlowski wrote:
> On 05/12/2022 07:57, Xiangsheng Hou wrote:
> > 1. Split MediaTek ECC engine with rawnand controller and convert to
> > YAML schema.
> > 2. Change the existing node name in order to match NAND controller
> > DT
> > bindings.
> 
> One patch - one logical change. Not two. This applies to all your
> patches, so whenever you want to enumerate, please think twice.

Will be corrected in next series.

> 
> > 
> > Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> > ---
> >  .../bindings/mtd/mediatek,mtk-nfc.yaml        | 171
> > +++++++++++++++++
> >  .../mtd/mediatek,nand-ecc-engine.yaml         |  62 ++++++
> >  .../devicetree/bindings/mtd/mtk-nand.txt      | 176 --------------
> > ----
> >  arch/arm/boot/dts/mt2701.dtsi                 |   2 +-
> >  arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   2 +-
> >  arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   2 +-
> 
> Do not combine bindings and DTS.

The DTS modification will be separated.

> > 
> > +
> > +  ecc-engine: true
> 
> I don't think this could be anything. You need to describe it, so
> $ref
> and description.

Will do.

> > +
> > +  partitions:
> > +    $ref: mtd.yaml#
> 
> How the partitions are MTD device? Open that file and see how it
> should
> be defined... Anyway mtd.yaml is part of nand-chip, not nand-
> controller.

This will be dropped in next series since nand-chip is part of nand-
controller.

> > +
> > +allOf:
> > +  - $ref: nand-controller.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt2701-nfc
> > +    then:
> > +      patternProperties:
> > +        "^nand@[a-f0-9]$":
> > +          type: object
> 
> No need for type, the definition is already there through
> nand-controller.yaml.
> 
> > +          properties:
> > +            reg:
> > +              minimum: 0
> > +              maximum: 1
> 
> This is the same as other variant, so should be defined in top-level
> pattern properties.
> 
> > +            nand-ecc-mode:
> > +              const: hw
> 
> Ditto

Will be fixed in next series.

Thanks
Xiangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
