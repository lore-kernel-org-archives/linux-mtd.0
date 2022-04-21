Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DC3C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGocwTO1agmD9fRiZxisrlctPRrjFwox5BsGPBj1hus=; b=d6jCw7mlFVedrz
	7j7bbuMy4VKbuURX/aTfp8wsKpU9fqIwLx5B5SwZEO001S4+PYiY46SWngBDhBfKFpDNEM8hBiuBh
	lTAdPizdrDd6pXYqTNDdSKhssIoRutqArKnTtxrpy9SeqqKlvxLKOTwFAYmQfJunLqYTUKeMhph1q
	GioD3ngYB+oLYAjTOODNxONtNsSNYdVQyG9fOXSB2DXjS5w5XkzpLjViSYrQiy8Hvk9E39IU/eCPu
	kfew0Idn4F7fz04v7vPXSaYce+6BMn+WDWNeOFVdec3Dez0yz8zm5jMKupOkM2kwFMQeGpcg+/nVU
	Wfk0jUAS/X2DSK7uWOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRRd-00C789-QD; Thu, 21 Apr 2022 07:41:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRQW-00C6N9-19
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650526832; x=1682062832;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cNchogo257G+AJGsZO94OtlB7yCURAHYheJC/1iCIyE=;
 b=b5YiCy7quhtNb6DKbPel/tx4lBoA+5GojtbQ/9n+i0fKXbV44aJRkn8V
 BBWO4xvpK2eTDv5+XUJ0WyDI6J8+R/GKE5xjuWyb+l0lhz4J4iB4tfAYy
 Lf2Cbpv7+KeAD9XgSVadhlmeqBxhgGS4OnaxmDRyR82Qim66tuMYDze11
 f7lpKFZ5uMwJ7Skg+9ZOVgUhGlsNI5BX6qqIXQw0vKRZ2hhv1TFBc6O8c
 mFDgvG05LpVgD8qPWOIfxJiRBIZgyVZL0khWHCZGpQ5bsvVDfyVBDcUv/
 fcZrvUIzQbRpoA1pmZylnMrsAeNMf5PexeeFwqMODxoUuIMDj8coA/kvI g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="170389271"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 00:40:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 00:40:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Apr 2022 00:40:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQ+TPocJ2wtV8RfRWWwJwnY8IPI0Cd8J8xuO5cxoeugjJGlwT75M0ig2w9Z12yYMqHnOidUPRN9NGYIpJaZrtfpMzNaids94SpFNHlY/nOQdK/ZiXTqF+b3b0yk7n1ETkFRxY13ZuX7FDcPjkNGpVOa2LXbWSw+hLCEIqFfnR4+BWBbW3Q7iih1gwkSBmlWbIH7KgSJIak2FG5HZ9HJ6Z4Djy8vU+1qmDT4Iw3rYvVNoI6Whyk+1FVEbW9uhp1YVLhK+VkffRBurd08XnroN0f1F2MwGIlejdN+pmBOYdoz8W7STaHptoRgKzDasAZmk9cJLEU1z1dNLKxdygBfy8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNchogo257G+AJGsZO94OtlB7yCURAHYheJC/1iCIyE=;
 b=aSpCJwlHX5/S9XTXqMXcBw3niO3Lpj98YvXJcGhflUQdVS7Tna2uY/EexbZTjJK9S+9i2qARgN6kC2LkPyQ669B26R/S7bo7nLvjQ4xSq69l7cB5pX3oYVeZvAtG/YmzfVP+kcS0WSDaedKJhB+nU1u6GlanwmLV+W/2Z6nWAv/PeksQTOF2SnKsReE+NLhcwIWMBTV3Alr8xmXZZSvCH5M6gAW2hQv3phob5NgFG0Z/hoXYaTp7Cgayg5ETQ5Y/QZ1OUwZQLygKhqGzXdcsEBQAccC0p/ZnBfc1FiVe2sVPojgXLxmvgzAkohdS8iwQiVKa4aD0/jLnQo15IZnOnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNchogo257G+AJGsZO94OtlB7yCURAHYheJC/1iCIyE=;
 b=SotccW1QRnL/+fzVr4oQvGo67/HGk/dr2rO75vvWpSWwJuOdSSDo3j4pyNV0v7tvyKzwIOmS1n6g7XFgTKzjrd9u4mC4Cs4wULZtaX+B2g/Rv6TThbOThw3uAv9H7knrbC22hZxxgqKz2016vMB6uPKZUTI0gegNDsoQbfhfNMs=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by CH2PR11MB4408.namprd11.prod.outlook.com (2603:10b6:610:4a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 07:40:26 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Thu, 21 Apr 2022
 07:40:26 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v12 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v12 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHYVVMQRwRia5UDMEq04JpPsxvQfg==
Date: Thu, 21 Apr 2022 07:40:25 +0000
Message-ID: <40e5698a-05e8-72f2-f62b-12cba1315817@microchip.com>
References: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
 <ff03da96d144b74b102dadf641931f6bf5ee9c8b.1650519576.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <ff03da96d144b74b102dadf641931f6bf5ee9c8b.1650519576.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b492bca3-2e24-4a70-1436-08da236a3345
x-ms-traffictypediagnostic: CH2PR11MB4408:EE_
x-microsoft-antispam-prvs: <CH2PR11MB4408C561BC9384130BE62CF6F0F49@CH2PR11MB4408.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PQ/Vo2ZPvbmR8+MHUAa1bpgljTEYYXiyYKls0NtOVClegs4SHlLzYZEr6xsOHuLpUhsh/JUBCHLf6ip8KI+vcNywOcUt3kC8q1XP0/n7c4yWWKEAQgT5kmh+r4Ivep8rDrTQ+IYNpTQtXtihAkLs28bwvHv4ytyuRCI4qu9WiJIBTQh/dVeXKVmbvJb7faNyCIBHp75V52aNxv4vxDYe2uGov6PUmD4wPGGEnldrtRacUzeo3Qk2WdfPySCFHzZ83VVXvDZKynebzEuuO29LBVf+JXGHoGK4x2RsOJtmcc+xGvHNS+3OXO5DcHqnQIvVAHSusLE4/uxtD8DJgpqoDBaCqpNfIg5vu1A6DSrcj7i0e5TYRWOesnkbjp2lqq+sbkToNgOFKPEH5sLR27RUvIPFSZtEByGMNg4EgmLrdB1oLXwmHrfEUC4bAnRJg8k8jUB4IHYVAI2RBhyW4hB/ojaKNw+Zh/AaQHBAH7nrHdyVsj6po8jcr3eiIEIiG/TuNB8E8sLvtcwEI4efdiVmbEVXXH9po1qbyYYlBQIA3bgajGlxJe3KXXVs9mUrw8zHRKnR8I477kskTHfOwHwlhQApqGov+TX25Z5M60YtaVb4xF5E/IvX2QldGKYFmCzmXs88BLviazNhqhrnZjqpStVXZA7nVQXsWmk/6x+D19kUPjqsz9AetOj/8Lawz3gezUabQfZBjBAxxNOjAeWlyhcTEW2FrgAcdxX4qkwziOpnHwNho+rE8kbECky18A+1obqQdKTYfcpiLIr4/7doiA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(6512007)(6486002)(2616005)(186003)(83380400001)(71200400001)(86362001)(508600001)(8936002)(2906002)(53546011)(6506007)(5660300002)(31696002)(76116006)(122000001)(36756003)(110136005)(4326008)(91956017)(66476007)(64756008)(8676002)(31686004)(66556008)(66446008)(38070700005)(54906003)(38100700002)(66946007)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGVjOFllamJBWEp1ZnBpYjVwbnRTb0R6ZlFmbnQ4RjFnMnJOcWEyWTUxcnJD?=
 =?utf-8?B?TDFhWkZBQjE2N0pmZmlGbUpwWW1ML2tKL3YwZ3g1VkUwd00rSXBKMkc2QmZT?=
 =?utf-8?B?bXprM09yVm1hRlFhdkJRc0JMemoyZk5USXBNRzJwdEVYNWZKVVdJeWpOMFcr?=
 =?utf-8?B?RDR0ZGViNVF3UmcyeUVQN3haVUdUdGg0R05BNlliSG1wY3Bnb1J4OEg3eFNv?=
 =?utf-8?B?ZDBzN1owdnhvbk53TGIza1ovTlhHR0ttVmZIT0VWT0xkR3REZy9Sb2NjQkhN?=
 =?utf-8?B?cDlySEZ6Z2xHdFFQUlI5WVFpdzI5WFhpRDV0Y1NOYjVMSFJqWjNuQ3lSSlhJ?=
 =?utf-8?B?REloMUhOS0pIU2VkVTQ0STNUTmhZWWg4dkRKc1ZXbEpmTTY0cnN3NFRSaFFK?=
 =?utf-8?B?VmpId2hEMGVWM2VqcXNodUVzQlJhdy9PSVhua1BKdTJiZnRVTU9Nb1VWaDQ1?=
 =?utf-8?B?ckYzcXdVWmx4b3pCWmFvTlJyR0o5dVdxbzNRWVVuVHZpOWNtZTIrUGg4ZVZa?=
 =?utf-8?B?UmF6bEJRdkdSUm5oeFNXNkdPYlVTdUxrem5wdUtpc0tGRWc0QnpVTVdHNEdk?=
 =?utf-8?B?ai91eUcwSS9WTVI1c1VhZDROTFJrUmtWa3hzb1NFOGNlUkJ0VW5SSXhPck9y?=
 =?utf-8?B?TTRaMTE3MWVCeFVyckVvdWNBVWpFdEtSelNMTWNhY3ArVWVCeXVUZnN1N0tz?=
 =?utf-8?B?emowc214RWNJK01IV2tDVk80MnpBVGRvMWxXbW9nN3hVZ3V1NGdQUjlRUTlt?=
 =?utf-8?B?R2dMd29SQTlGNGg1Vng0dW0vOVVKYjgwdzBPVXU5UG02MGZWR2loQmJMeERH?=
 =?utf-8?B?ZG9wVGdUNHpoNVIxRDR6Yy8vMHYwNnRNdEpSUWdjY2hOQ3JMaFBSSzVkekJR?=
 =?utf-8?B?QXI3ZWVGeHpYaEVSa1MwVDFEZXNsUGgyZzdxM2k2Tk9sWC9Id3hwdXQ2b3d2?=
 =?utf-8?B?M0VvTkZucVpXVks3eWZZa29jaHlpUHVabm1PaDR4NC9xM1FEUzFyQzY3WmxE?=
 =?utf-8?B?TVc4Z25DdVZNZERzTFU0MXY0VkZ6ajFKZ256NGJaQUZlRk1hdW95RkR5NWFR?=
 =?utf-8?B?SG1IVjZTODB6QWhMcGVPR2lIS3Q1NndvMHF4ZFhEbHlvV25wdkU5VG5zMVFP?=
 =?utf-8?B?OVJqU3h2OHltQ3FKYTNLVldtMkh5Ti9UakRZVVNPTkJsNzl5WWtTMmdwT1Ri?=
 =?utf-8?B?bmRITEtXeElnOGkzUzlLN1NKL2swd0ZqczhldXNEYnJtRjVnRDk4TklpL284?=
 =?utf-8?B?dTBlYmJlODc5ck5kL1hNQlVFaXJSQU5GQVQyMlhYRDJKaUVTM1N1ZUlxUW5W?=
 =?utf-8?B?dFJ6WklJSEF5OVdJUDN6VlRsSWlvN2ZkYjA0YWtXYzhPNmVPbkg1NEp1K0tR?=
 =?utf-8?B?WmNSSkE1UGhMK0l1YkZuREVodGtUZXYxRk1VK0Q1TnIreU10OFBLdHhwL2lN?=
 =?utf-8?B?Qi95WEYzanlEQ0YweTBnM0x3ZDFlYkJza0ZDMlpKd0pEZXNYSldBT1JiNFNY?=
 =?utf-8?B?eFFoaFU2ZUlsaU9vbFo4WHhoTDcvRFgxZW9Ja0lmMHFwVndmMGY1MGtMcFZ2?=
 =?utf-8?B?dEJnR29xbzJ0b0JvejdJelN1azdlclVpbGxGa3Y3Nk9saUU0dTFuWUtPZWJB?=
 =?utf-8?B?anZmYTBOYWZPQTg2UzhORTlKK01Ea1B2WEM1TGMwb0ZWOW0rQ3F5bS9XZG1x?=
 =?utf-8?B?T1FLTWdZR0RwMEU4N2cwL3IwWUpGTGpkaWxVblk3VW15cHNCYUFIN05PbGRP?=
 =?utf-8?B?MSs4dWFkVURpK2ViYXhPaUlsSWZmWHcrRUJTWjJhd3JJV09rSHhrMHBHdlZv?=
 =?utf-8?B?N1hxQithbUZiMmVqdHFnUDMzZ1lZV0hCVDV4by9qKzU4bG9ITXN2d25weTlB?=
 =?utf-8?B?MnhBbkdYMS95amQ3K2hmRWNzcUVQSjdVbUhIUE1HUGk4YXFRNnhISFNTZnNS?=
 =?utf-8?B?TDUwbWF5cnhZNnV2Ly83NTB1MFhGSnBQQnBhVDkrMUN5SC9PV1JkWk1VVTla?=
 =?utf-8?B?SGpoVklWOWNEWHphb0Z2RHlTelpBR2NTSzBtcEhZWHRWS1F4UURvajlYUkt1?=
 =?utf-8?B?L01HTzZNUmhsVnFLb01SYkYyY0w5NDF5c2s3K2h0ZXRvT29PWWlmeFdySWxJ?=
 =?utf-8?B?YUo4RzgzVXE3ZGExMlovR3ZwMm1wZUNwK2xLUkVoRERudmVLUnBnOTJ6Rnhi?=
 =?utf-8?B?M0ZsdEkvdVVFVnhyL3BGeVdZU2l5RG9FZUdrcTFvcitiWHVubnJuSXFOeGx3?=
 =?utf-8?B?aTk0bTREZXY2UjdrM1NrWWJYbWhtN3lPMUF6MjhBNzArRGs3MkxveitnMThv?=
 =?utf-8?B?SlFoUzIvSGdwOElDMVNER2xTNko1aTBZSE8ycTFFK2x3eXFLQ0VsQWVRMklu?=
 =?utf-8?Q?E4J483wsv1831OGw=3D?=
Content-ID: <64198D8D4C401B46A2E8EAF8066148D8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b492bca3-2e24-4a70-1436-08da236a3345
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 07:40:25.9392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ks1kRi8UpXhs2Ot8fk+kSdYxP9VSvBYtyl2wgXD7jZWS5DTFpoFNsFYPfHZ44c0JKEmPth7IUL+9NfZfnOKlzb9ricgzB7e5r2wpKewCXlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4408
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_004032_136201_3318AA8C 
X-CRM114-Status: GOOD (  26.19  )
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

On 4/21/22 09:40, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
> 
> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
> uniform sector sizes are supported. This is due to missing or incorrect
> entries in SMPT. Fixup for other sector sizes configurations will be
> followed up as needed.
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v12:
>   - Cleanup fixups based on other patches in this series
>   - Add part specific set_4byte_addr_mode()
>   - Unset SNOR_F_4B_OPCODES flag to let core to call set_4byte_addr_mode
> 
> Changes in v11:
>   - Cleanup fixups based on other patches in this series
> 
> Changes in v10:
>   - Cleanup fixups and ID table based on other patches in this series
> 
> Changes in v9:
>   - Use late_init() hook to fix mode clocks and writesize
>   - Use PARSE_SFDP instead of NO_SFDP_FLAGS
>   - Use MFR_FLAGS for USE_CLSR
>   - Add comment block to explain about addr mode in post_bfpt_fixups()
> 
> Changes in v8:
>   - Call write_disable in error case only
>   - Use spi_nor_read_reg() helper
>   - Use nor->bouncebuf instead of variable on stack
>   - Update ID table to use FLAGS macro
> 
> Changes in v7:
>   - Add missing device info table in v6
> 
> Changes in v6:
>   - Remove 2Gb multi die pacakge support
> 
> Changes in v5:
>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
> 
> Changes in v4:
>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
> 
> Changes in v3:
>   - Remove S25HL256T and S25HS256T
>   - Add S25HL02GT and S25HS02GT
>   - Add support for multi-die package parts support
>   - Remove erase_map fix for top/split sector layout
>   - Set ECC data unit size (16B) to writesize
> 
>  drivers/mtd/spi-nor/spansion.c | 64 ++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 248fe1b221fd..a1f6631a3449 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -14,6 +14,7 @@
>  #define CYPRESS_NOR_OP_CLSR            0x30    /* Clear status register 1 */
>  #define CYPRESS_NOR_OP_RD_ANY_REG      0x65    /* Read any register */
>  #define CYPRESS_NOR_OP_WR_ANY_REG      0x71    /* Write any register */
> +#define CYPRESS_NOR_OP_EX4B            0xB8    /* Exit 4B Addr Mode */
>  #define CYPRESS_NOR_OP_RD_FAST         0xee
> 
>  #define CYPRESS_NOR_REG_CFR1V                  0x00800002
> @@ -45,6 +46,13 @@
>                    SPI_MEM_OP_NO_DUMMY,                                 \
>                    SPI_MEM_OP_NO_DATA)
> 
> +#define CYPRESS_NOR_EN4B_EX4B_OP(enable)                               \
> +       SPI_MEM_OP(SPI_MEM_OP_CMD(enable ? SPINOR_OP_EN4B :             \
> +                                          CYPRESS_NOR_OP_EX4B, 0),     \
> +                  SPI_MEM_OP_NO_ADDR,                                  \
> +                  SPI_MEM_OP_NO_DUMMY,                                 \
> +                  SPI_MEM_OP_NO_DATA)
> +
>  static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
>  {
>         struct spi_mem_op op;
> @@ -207,6 +215,46 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
>         return 0;
>  }
> 
> +static int s25hx_t_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
> +{
> +       struct spi_mem_op op = CYPRESS_NOR_EN4B_EX4B_OP(enable);
> +
> +       spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +       return spi_mem_exec_op(nor->spimem, &op);
> +}
> +
> +static int
> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
> +                        const struct sfdp_parameter_header *bfpt_header,
> +                        const struct sfdp_bfpt *bfpt)
> +{
> +       /* EX4B(E9h) is not supported. Use part specific method */
> +       nor->params->set_4byte_addr_mode = s25hx_t_set_4byte_addr_mode;
> +
> +       /* Replace Quad Enable with volatile version */
> +       nor->params->quad_enable = cypress_nor_quad_enable_volatile;
> +
> +       return cypress_nor_set_page_size(nor);
> +}
> +
> +static void s25hx_t_late_init(struct spi_nor *nor)
> +{
> +       /* Fast Read 4B requires mode cycles */
> +       nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
> +
> +       /* The writesize should be ECC data unit size */
> +       nor->params->writesize = 16;
> +
> +       /* Read and Write Any Reg ops take 3B or 4B address */
> +       nor->flags &= ~SNOR_F_4B_OPCODES;

as I previously said, I'm not convinced you should enter 4byte mode
at all. Help me understand why you need it, please.

> +}
> +
> +static struct spi_nor_fixups s25hx_t_fixups = {
> +       .post_bfpt = s25hx_t_post_bfpt_fixups,
> +       .late_init = s25hx_t_late_init,
> +};
> +
>  /**
>   * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:               pointer to a 'struct spi_nor'
> @@ -383,6 +431,22 @@ static const struct flash_info spansion_nor_parts[] = {
>         { "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>                 FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +       { "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
> +               PARSE_SFDP
> +               MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
> +               .fixups = &s25hx_t_fixups },
> +       { "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
> +               PARSE_SFDP
> +               MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
> +               .fixups = &s25hx_t_fixups },
> +       { "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
> +               PARSE_SFDP
> +               MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
> +               .fixups = &s25hx_t_fixups },
> +       { "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
> +               PARSE_SFDP
> +               MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
> +               .fixups = &s25hx_t_fixups },
>         { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
>                 FLAGS(SPI_NOR_NO_ERASE) },
>         { "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
