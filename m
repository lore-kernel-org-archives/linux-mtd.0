Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9475CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jigcKii82OesxldFOYCn0KqKNC0jBUu6gD11aFrflks=; b=WeQr7H1wy9mQ6t
	wS/G+vk4qJfjEofSKGXRXrD1tMYWFcxKB5+XUjvWxiXchyjBBOTGVv+ZhQZA6chlGbKW95EAv2pxE
	xTDy57A0+FelgA0Z0EypCHElre6l9+RBklY1nRGcWC6+v2SVuFYaZV0kS2+jbF/Fc5/dGpl81g6aM
	74AKvxg450rGg/PdCoJQjxsNsTg7c0pRduSEK5JoZnChLvIsS5GNXhkOgQtYjrNbAA/nsXNoz76OK
	iTP+jisin3rXpNojLOlEA4qjMmcbK+3USNybRNm+4HtwjaV9cQGG5gfUHbukFawfPgKihWyjSduDv
	UfN+SdfbEKpWxZWb9V7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDTCY-002jGI-VK; Fri, 28 Jan 2022 15:30:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDTCV-002jEa-Tp
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 15:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643383812; x=1674919812;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=l0yQo9tBAHbMJch0+AxqzfsOX11J9ogWZ+3sMbn+8X4=;
 b=EfLkM/63MNyXBXPaaqtBWVT9pl7cCfSmbOEgJSnweKP7Ihw0iDm7FLsp
 z2OD/7es34RkVB3PDwkYNvyECXk+PPArOPac3R/xnAgAFuMTWSv8yLvGf
 XDELxKev7QqcNvbYU8pliZRRJGx0W1XTXuBHTSNfyuNBdXbZBw5/gUrif
 svXDWYLKilha/DcyUr3+VOGRepOic9apwUvCDxf6NkkU1EorHAlXXa8xc
 HbBDoAfJkIxNr/lvQGv1N9PHbBNSsh0xKnz2/2L0NVTE2RtJzmtcKO5ye
 Qx6K6An+Xrl1HjXre47IotnBqG0xyEuZxYSRjY7bAcVFp25l8Yz/0EUCM A==;
IronPort-SDR: iHKwobPn8eJPsygr+C09ttAiY69uBSHP7GvgLDrKsvTd6SlaioRGQ9Apv1xEuusYHB+GB6jzYx
 q7n8saHHLhGzCWhZbuGU6XDIOu4L9PVWvc5sFjbRloq/TJGiqjjKh5E0tITW2zn9Fo8OfMM4aR
 PtFbDc1SVt7SqGUnwnJsicRv7Vs4MnppipXeuIPVqVkaP1DrBtqLM6qYNoZER/R7UNhcC0l367
 9Fy/LgfHxjoaur8xiig4QYAS6qtZXMBj6NliC0UtkYlgFX8pztWmMERC9mNjfNb93W+sm8poQj
 +/xNcRZ4WEdqhN895OnUEW4l
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="151251705"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jan 2022 08:30:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 28 Jan 2022 08:30:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 28 Jan 2022 08:30:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1UcD0NOhseJuRCWaeyxnZImxj287GEuwuo/VNPDTrnruq3Ljom3RLt2AbfECglfe8CF36+Q7mr1EXt1Z9B3D1vLHr0BpG7mgnhzEJKq4+6X/geKvyy/8ChyEajcZuo+sZIhsGWkY5+PDn6Rtr/44JxdlbjZAJB0zNXrhnrHXaiOlvZr2iBCLlNNX6l8qX/22pcK1S1NOKHMwmj3p3+N5TB8ADzwJlYpd93SULcoLYA13Q2subpu+K1hjO5TwyRzQmv65mlBA/sHKT0TGGHnzLJqffH+QtarvulLJ7ZBdCzo5TMXwpOvF7RGUM6LvNr1Bn2u0qmy2Yqk95d4pH2mMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0yQo9tBAHbMJch0+AxqzfsOX11J9ogWZ+3sMbn+8X4=;
 b=AiSb5QDE2gxom5jE5wYIG7IlPlByWjE6R5iKcbfbmhUY9WlcJfNDPQRwpnu/xilaupJZ4MAJq0n4GpVIYGmH1jEWR+T6D2K8IN/CRjwgNHPluNVI+2yOjNBI3AGrNOVH/k7ZKkYbhshiZFhZGvTkUrxI6mXRm1r8l6/opoEMWF1pp7jqhKpi9qa2XJeQPtjz7222v7HQLs4StErHww/Jtkvp45d2a2fmE2NE1N8eT7IT+pdmZjWXt7Pxdxcv51c2l7i/U76+obHCBnukfYLkNGyAI0Xkib0oaHIVh8tWf0RhPnoVEE86oyF/bXtOnQKGCVSIP4VulMwNTM+5Uh9WnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0yQo9tBAHbMJch0+AxqzfsOX11J9ogWZ+3sMbn+8X4=;
 b=ENvqhC92aimxUzKRE+9nY5W7ygUhqJX5V05T4iBc3NwiqQv/o5Z5P6FT4BnOh5ou43I7pMj8U81Up7UqoA+UNfIvstyFfC43eMoFi5SCy1mejmrr4ZQofaFvKyxfpyMN6Df1dgtAcMAlDBBmcKuLuWxGdLkrnqP5GMGD2zDmZxw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MWHPR11MB1566.namprd11.prod.outlook.com (2603:10b6:301:10::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 15:30:04 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94%2]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 15:30:04 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>, <broonie@kernel.org>
CC: <lee.jones@linaro.org>, <boris.brezillon@collabora.com>,
 <michael@walle.cc>, <p.yadav@ti.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <corbet@lwn.net>,
 <mauro.lima@eclypsium.com>, <alexander.sverdlin@nokia.com>,
 <andriy.shevchenko@linux.intel.com>, <hans-gert.dahmen@immu.ne>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v5 1/3] mtd: spi-nor: intel-spi: Disable write protection
 only if asked
Thread-Topic: [PATCH v5 1/3] mtd: spi-nor: intel-spi: Disable write protection
 only if asked
Thread-Index: AQHYFFvscyEvWuxsLEWQxfYmAZgp0Q==
Date: Fri, 28 Jan 2022 15:30:04 +0000
Message-ID: <7e685db8-57c1-94a7-5a9d-946f5cacdca6@microchip.com>
References: <20211220164625.9400-1-mika.westerberg@linux.intel.com>
 <20211220164625.9400-2-mika.westerberg@linux.intel.com>
In-Reply-To: <20211220164625.9400-2-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c67121b6-722d-4031-431e-08d9e2730eab
x-ms-traffictypediagnostic: MWHPR11MB1566:EE_
x-microsoft-antispam-prvs: <MWHPR11MB1566A6A02949E0C8E5FE86B3F0229@MWHPR11MB1566.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /fTHVsG5XoVWgmh1wA+JvrSsIOiX4oLMEb1ZZyASwg1MKcm/i8VS3DDwx5i6kORbbR31oMNvL+vaKXsyxpXOgoUWjQp7yyOrE13qaSdE6Bs3LiJu+Onvdermx8E6nJLjUHfuK1hhu/F6II+gahtirZ6JvzqSQIt101jtrg81BVrBcKGqzzO221b2MIDHj7/EfYPfXK8nWtfFGwR/qGOu8ancH5uv26Y+Ah//N7bH4HbCGgZEt7LSzwtLu5VhvcPcWXYecXi8MhMUej1ZHv6l+5hV1iSxzqSfNVaXP1z+y9li5euprpZmT3HExrl2stbgeYXNWgfz6aB2SSKBWKBpbEfAEoKDdj+P6ENKdcCeQx31SmZfVFI3jtx9JtJkwOXxHhFV4bkxLf7zsmUVi+5VFpigGo7AuEllWQggNy/veKMv9/ahfDnkBISVyKt8MtLMJnTw6YJY7kvria0JXl2Ojx1IAxbSKrWLreOXRA8fx3HDW3xPPfeWJTHIq41XuNVVz62+jkpSIzbKgTJwp8B9oTwYNVBiyv1axiOTEO42CfrTT41BG5ZHfLYet0L1J6De9eG4Bk/6RTrGDBM16WqdhXBQ2Y4tDtcAv1tP7ffMVtKffFb+AVLBXE5Rlkc62MzG9zz5eiMtSzQ5JpDEtgdZZHaX085pg655iVsKnipMmTzYuM8JcT6NWYDA7U/ZZFwXTFFW9a36tRxg21/iK/7mk1uZ3aK9NVWuvKlFzjwCQ3iVHXG/rCpJOmQAA9d90wy/fPmZ0RuFXMt1IUh6MFAWSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(71200400001)(31686004)(186003)(122000001)(4744005)(7416002)(26005)(8676002)(2616005)(6512007)(5660300002)(86362001)(38100700002)(6506007)(4326008)(38070700005)(36756003)(64756008)(76116006)(110136005)(66476007)(66446008)(66556008)(66946007)(91956017)(6486002)(508600001)(2906002)(83380400001)(316002)(54906003)(31696002)(8936002)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWpSRitKUnBscklPbG1rTmNrbFZVeWtyYlg0WjN4aDRxSmRzdkl6SlpkZ1pD?=
 =?utf-8?B?MWpwRU43VWFJcHhQcTV0bFJ6OGZaVElNclhuMjkzQ0dzSTBYMlpZMVVBRHM5?=
 =?utf-8?B?bUJ4TlVhckJmTGRXRThMdnE1QXZpSUNWcG1CMWR5UU1HZ1RlZWl2NFFDL09l?=
 =?utf-8?B?R1Jmb0E1YW15RE1haU5UcGlUZ3lYMVNXUElpU1NDcVdPZDNRMG52Y3dobGE5?=
 =?utf-8?B?Q0hxYUNNVEU3LzRpR3N4UEdKZ2dJUWJiS1FhSmRYa3pOcjZqRGd0SEp3cGQ4?=
 =?utf-8?B?UDlObHl4aC9kYjNoQW5NTzk2NGNMQXo1QVcwZ0NMbEl5Z3drMUFGeFZxYk14?=
 =?utf-8?B?U1pqTmFtZ1pycWcyMWtiV0FNVjBrRFJMajRDYXlCU0NOcDQ3bG5ZSE03cUtw?=
 =?utf-8?B?RGNLT2JFQi9uSGkwWUZIZG1YY01IdHpoNXdjVnBmT0ZPNUVwbkRCYXlVYzF2?=
 =?utf-8?B?RituemduZ05Rc3BneUk5UkdhaXZKR21aY2wyRzhPL2hsTkIxZFQyMUR1dDFM?=
 =?utf-8?B?NUdib1FDbXBPcFVjQnRiUENRQ2tLSWJsRlY5TGQ3b1U1a1pVVUZreXJONmYx?=
 =?utf-8?B?Slp2czVGbEVGeDJHcGpTMVM0a2Y1cXNRRHcvOEhKZlFUS2pnajJNeXp6bmhS?=
 =?utf-8?B?S1J5QUhTSEtHMnFyWUE2OWwvNVFQZFZWR3o1UGwyQUgwdm5wc3h6ZjhDbGVJ?=
 =?utf-8?B?NzdFTWZ4NkpHbWFrS0M0VVF0ZDgxZjRKTDl6eTRKNWRHZHZSbVZ2RnVreG5Q?=
 =?utf-8?B?cDQ4Nm9QdFpmWnVoZ2NreitDczZIZ1F5NHlON2Jsa05wQ0QrdDl4dk16OW5Q?=
 =?utf-8?B?MFhZc2NRU2VwWFU3UjM0S01GZnM2UUlKMWkzcFU5T3dNVWxaN3BoVCtVd2w0?=
 =?utf-8?B?eVl6bWNGV2JsTGZHaXZTemc4a05ITmNZcUhuQkxmSG1XMlNDejI3elQzbk5k?=
 =?utf-8?B?TlY3YlY3VVBTR2NjRlRXMEkyRjB6OEh6NldNRGttQ1NpUjZGVkRZMzBYUjVi?=
 =?utf-8?B?enZqV3hGUjd3ZWJOWG92ei94MStWOGNBV3laOTJzdVF1VGpIQVpDOXRFb2NJ?=
 =?utf-8?B?S3NPZEJ5d2Vuc3BMWXpNUGpCbkZVVjhya0tGT3p5Ymh4SVc0YTB2OUdmR1ZJ?=
 =?utf-8?B?WEJRUkNJajNLdk1iU1lhZmVXbFcvdDF6aURKaWxlc0laMXI1cjBjOWl2YXNM?=
 =?utf-8?B?Z21xbE5nWTRZcCtKbDZLZ3llc1UvWmE2cGowUGl6NnR5R1dlZ2lwZmViNCt2?=
 =?utf-8?B?ZlN1UUZoeFpwd3RFT0VOaDZ1RUhlcTJySVpNbUd1emR3bWxhTVNVR3htUXBF?=
 =?utf-8?B?K2hjSnBxQTZaUXNsb1cxbCt1dVdTcXpYVW5OcDVETXRaendnSXpma2pCQU9n?=
 =?utf-8?B?RitEZ1liMGNiSG0vaEJxVHhmWXlUSXRMVC9Bc3hpcGpLTkZnT2dYZTlhZm9k?=
 =?utf-8?B?bEtyVjBjSzVYbCtob3NWS1dlbFUrY2NOUkJNSHNRVXRhcU5GYXVWT2xMRExq?=
 =?utf-8?B?VFNJbzJZTWZhcVM1VXdNWmMvcHFjT3hGYXVtM2l3RnRxMzVPbGthRVUrLzVt?=
 =?utf-8?B?WFhMenBnSk5TYlNONWNGdlRELzh2TGM3RmNCU1NNT1pnYUFtYXZNSUFTTmJx?=
 =?utf-8?B?MGc4bnV5L1JCbFlIM2NYcGJEZDlpZzdKcU5KdnhUZTc5SFUxcCtBSWJIN092?=
 =?utf-8?B?YnVVeVBzNm1yMnVtUXFTZVdScmE4L0VlSlZ2aUVEUXNBOXJjZlpHRmpSSXFn?=
 =?utf-8?B?VWkvWThBSHRnT0dYUUdkRWM2NHczOExla2Fpak5UN2hpbksyaDRydmtxYnN4?=
 =?utf-8?B?dEVpWnJaV2pjbUcxdjQvZXlLWnV1c3pYdHg5OEdrTHN5Nm1rMUpqNmtXelUx?=
 =?utf-8?B?bDJETDlmUGpseWp0QktSYXBGRmFYbjlzRjRPak54Qkt1amR1SWV2bFBpMTV6?=
 =?utf-8?B?NndDdzZ1VGl6dGxzejZaSzJaWnJIQjdiSzRsdXJBZkdweGpUS2hYUUlUdDNW?=
 =?utf-8?B?MU1IWEE2cmdtckFnSUxrcUkySUhCZFhOSDdoc0tiVXd4SjJ1OWJEQ2c2NjdT?=
 =?utf-8?B?eUNBRGxoUnJKQXdSNy9zeFVBbnNNRzlpRlViWTJhcWJPb3c4djRXL3ZSUFV1?=
 =?utf-8?B?MXNISUl5YnJyanVHOWloRE81L3NENEZvSnh4N3prYnFRRVdXL2FsWmhJZXRK?=
 =?utf-8?B?UlNRMklGL3licldtV25IVmEycVE0eTFXOGcxdm0xUG5CNVV0dUJhVGtCVG15?=
 =?utf-8?B?R1NhNVdhdndBWkdJMDA4a3FOU0tBPT0=?=
Content-ID: <CE3053AB2D31FF40897934B48CAE33EE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c67121b6-722d-4031-431e-08d9e2730eab
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 15:30:04.4076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: noZwAOXWdPe8M9xNznYiaUTkJGK2ASs5OeJjIN7eF7AF6eZH2ROS7Lm5zw015LL/XS8mViqMyRNJAipM2e/P82LhbRrrY/dgizq1LPQB//E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1566
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_073012_106502_2937D05A 
X-CRM114-Status: GOOD (  13.25  )
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

On 12/20/21 18:46, Mika Westerberg wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Currently the driver tries to disable the BIOS write protection
> automatically even if this is not what the user wants. For this reason
> modify the driver so that by default it does not touch the write
> protection. Only if specifically asked by the user (setting writeable=1
> command line parameter) the driver tries to disable the BIOS write
> protection.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Mauro Lima <mauro.lima@eclypsium.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mfd/lpc_ich.c                         | 59 +++++++++++++++++--
>  .../mtd/spi-nor/controllers/intel-spi-pci.c   | 29 +++++----
>  drivers/mtd/spi-nor/controllers/intel-spi.c   | 41 ++++++-------
>  include/linux/platform_data/x86/intel-spi.h   |  6 +-
>  4 files changed, 96 insertions(+), 39 deletions(-)
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
