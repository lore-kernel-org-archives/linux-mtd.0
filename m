Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB80C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 07:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NAwfK1rfV3M8ezATLonKM0UgX/Tjpgzwnl5Etbh01M=; b=xHg4JaaA0/RTEe
	7mvsTCGuaIad3YisSHVNeRL6w6Ob0ISBKo5bXmkp0PrOTJByu1RchyU+rSCwD5vjxL6DzYGS7aRZ4
	jTgBxCIprSXUKjLQiLKekxaqsar/nP6Z2oe1tvKaPgRWzYHji9Jq5dlenKB0wJC/zOQ2gIJz0Gb62
	gamrUgAb1DgjDc/VN7R0lAO36qxlZfgQu6khW00bqmG6+5rWHiPUk8YvfJsnbTvzj6Q+RXFWw7uCE
	AOQPNneCaGCWNPmkmQeCjqnv+Tzx4ecJDtovHS4mPhUJT8HvQlggYqXghhrgPY6W9D03qD+dj6N0P
	3A5GkTSKWSZBF7F7eVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muVCj-007Gxs-Su; Tue, 07 Dec 2021 07:48:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muVCg-007Gw6-Qe
 for linux-mtd@lists.infradead.org; Tue, 07 Dec 2021 07:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638863279; x=1670399279;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Myc391iKp99OLEE2VIgDCk5ngH9jEsGrgwC3zihb7jY=;
 b=caGO1fgR7Fb/7vt/fnbGvfb2vFfM3w+kFUp8f0Ko0RXhn/2XmI2xTSy8
 l8d/g1T62Cr8W4WoAcEOt2IJnnHDys5VsanRLr3I/S6AOFgd76UpIgC0d
 CZ6C/AirgxnnlV4rUq1WDw++Bl3U4nG1I3WsyDxrD10rJyMuEjL7POzwc
 zkql6A9qR4smEzx5/XEfmIQ7Ref50Z+qOqEmmwDPbztPztNRqLfrSI03A
 ZGOJzHAUpS2mDlV5wc3GFFiA7ibQoBonsK4Nzx9ZzV6N12/FwMZlJpxYf
 0YHjMf5UskVCtcrp+yCqRoahv38Ujmot5nQKFvMVQWsAnoIqbU1yxv77r w==;
IronPort-SDR: n55mbTDiPuxTqSqhq5IwAMioI2PNkoU3q7/OQTv31+JTt8uiL7xjoAi8tX2I4Cq4ZdWxmvhFEa
 aqW7qTHWqaltdvWjpwtCKM6TKFcBoiKxHisatLpNSTvBPQXGuG3Z3nciwH6p/96765KYcicXO1
 XZp5tu29eTlVJoDXEmXA0OvnyBWhczSo5UpcEqgxAr4EBGW2EQeQ9VV6w/KBZwnTFNUQA6Puc3
 SfkzQFpFlFVCv2wC1iE4seoi4j0Rgs933O7pKmQGgh95ENu7ELS+9TJQK4ADCwAvJYYYJViQSp
 t2V5wgXM34Bdy+I65MeKLd4L
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="141530697"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2021 00:47:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Dec 2021 00:47:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Tue, 7 Dec 2021 00:47:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/L1hmnGbtTjoIwV9vmNOW5OsyZycMSqr2aF55TWazRxtwxHfmfWLt78r/mAeSeb7Onqwc2oos5YBgyjO7Lo6dzDiJts4MnIJ5e8hdI2I3rfF4rx19Fcp+CeV1bhARj6Exp7QMZrxohoMjCy6VuVm8QSeicyE+565uJriyGRigFPRj3Ef71CCcAhXazQeYKpYqEIiTOhw8a53U88pqQQJATNU5uCIinm/YNkH2NVJlZu0/AmjbOEJkAaXNuzFBN2MN+7gl1ERPEfiOiRiiPZbWB0WgPuXT043sfQESift3k3mVdElLs4Sq+c1urBtn3H74fOTHZJNIbcJA4PAniDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Myc391iKp99OLEE2VIgDCk5ngH9jEsGrgwC3zihb7jY=;
 b=T+Ku401pvAuAP+eaPnJaVftUJI+LkBHsF6sdphdgLfhRXQttdyf16X+auuGoXn1lyODjo7S582zO0RWM/qc0JBqvHYoHrnCS4aHfxX6oTJEJb0u4CKYatTAuxXz+t1BXwY1KQl6EjCutpyMv5CaYaLM2mTptPuhPH30NFk81y5FeitggqU4qk6cON6oQeHsAiTc9ECPjdrOizrkjVGjsRm+nbAqrfvqLCQIgkiQnnGxLBeEws/W8PLXymDASQhMuaYI90f0Uzhb9LjlGl46YS1pZmcPl43PwvUcUdX64WtFrZFr3DeKSxP6SFCvmgCeoO/iRTESVs1TYoC3zFO4n6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Myc391iKp99OLEE2VIgDCk5ngH9jEsGrgwC3zihb7jY=;
 b=psgnxJwkjAdlmhHTujlatWkGnX+jYFVZI6Qjy8EUGW99fYPpJwu658TMVsXVaELJCotEjJyhitYHTExfe5QCYkiF6cn3YDZNxF3pVo/iYj7Ijz+xAmweuIR0xIRqEUc3e7ovGRkC68G426fXUej7Ki1OALNEHDSeEGF54vs9kYs=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5161.namprd11.prod.outlook.com (2603:10b6:806:fa::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Tue, 7 Dec
 2021 07:47:51 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%6]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 07:47:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <thomas.petazzoni@bootlin.com>,
 <monstr@monstr.eu>
Subject: Re: [PATCH v3 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Thread-Topic: [PATCH v3 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Thread-Index: AQHX6z0TCMDia/NjPUS/CLh9E6BmLqwmpcIAgAABPIA=
Date: Tue, 7 Dec 2021 07:47:51 +0000
Message-ID: <e99a977b-87dd-9e9a-62ea-ef544dfc80e4@microchip.com>
References: <20211206095921.33302-1-miquel.raynal@bootlin.com>
 <20211206095921.33302-3-miquel.raynal@bootlin.com>
 <20211207071406.c2ajc3shqybevvjj@ti.com>
 <0d97a420-685e-5120-3c09-d433382c02aa@microchip.com>
 <11cb8408-1c5b-de83-dec0-5ec67305e772@microchip.com>
In-Reply-To: <11cb8408-1c5b-de83-dec0-5ec67305e772@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 040bb5a1-6f29-423d-01c7-08d9b955df0e
x-ms-traffictypediagnostic: SA2PR11MB5161:EE_
x-microsoft-antispam-prvs: <SA2PR11MB5161E8D3893021DF97230EB2F06E9@SA2PR11MB5161.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PDMSaaK4TzHE1BWlUmqRJ5bThxKdjYLTcncUTQlbYbPDB3qOui9GJNWNFm4q9ZPdUcc+4a+a9Rh1HpEIWAMD2UFQrfoduzecJABZF3Xjf61k4HLR9NbBWEwR/9vwhZ3bEDHgS23p/N7yFImWmIZpdAj5KBNKspHneJ2XqKo58xloRprZfpGJZXfZqAhz6pKeig1eTVgzIX1+/CrtpAVJyrBm3XCh9msoQlaj+hoNx5QKqAl4dpOB3kJHBpgdbTvfnU9xE6ft6p82ywW51U+QTzuS6L+L5AxSCYvmgRmxpll4V3v9PiOet2yAY3rK3h8Y2q82Bu2NdqAJTaHyY2odKpcw4B0qlWLKNXtsweeOS2T4F+cwJL7Vb2tAYyKte48tzay4EeaFKr1BGsPgBOu1SyeF//K9HK5vex8I3tOIICSGKK1D5NjkCP7cSulIksAiCWfq/aKwckQIWBab5TqBdNMBQxvKI472lzMwbqR5u356K5w3wrVh0xqiK7xiapBMG8aPz6P5UdduSbkAYHEICoke9iugP85GawhYXxWxvAdtkGATB7glKxta5JhPJBAC9nEYfisZXQdK+BpmCIXNSxcUldq0/FcZyUg+KTa2tvZwGMQMtt6UbkAYzL1GDqY8HxFbAQMPXVyewJvqCyyOzo831FuE9GC1yHwqOZ9kSuUhIuTAJJKVeYSjjYdu/VVHYoURzz3sftVhvxYMe0BusU8mVoPb4RkJKtD49G6AelYOBR3+BuaCpBNQA4yqgEuBRXN87sjD6SpdGnjrHPH+UV4HIaAICMnNkQ3GqgXkPzWZNGHQrbrplzWPQZeoko2OYaYIs+3RCvVGAfnA124mBhDqDfb5bXPx2QyBB2K/ERc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31686004)(66946007)(110136005)(966005)(91956017)(71200400001)(54906003)(7416002)(5660300002)(31696002)(86362001)(6486002)(64756008)(38100700002)(66446008)(508600001)(186003)(66476007)(76116006)(316002)(83380400001)(26005)(66556008)(4326008)(2616005)(36756003)(2906002)(53546011)(6512007)(6506007)(38070700005)(122000001)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHJPZ1N5N2d3ekFucDhDT3dEd1ViQzdaemllTTMvemVXZWNzREhmeUJoNmNO?=
 =?utf-8?B?Wk44MEF0OWhhUE1XUWhhWSt0SGt5d09ta0tBSW1SdDhuNWJET21iNnJvb3ZJ?=
 =?utf-8?B?NjdBOVpSSkMrREt2R29rVTBVMlJnWEZ3SjBQZm8rV0xXYWR1dXhSN25ZVG5m?=
 =?utf-8?B?bUZFUzlzTXVSZXh0SzJiMXJaRWlXUUlPR1RtcU92S3B5WnIxR2I2anJMeVlC?=
 =?utf-8?B?K3dwYTU1VUdyWEh1NnUzK0hJaG5BSjV0MklXVlkyaHdKeGhKTSt3a0lNRmEr?=
 =?utf-8?B?T0lPYzNDRG91ajMxSERBTkRTRUMxZlY5SGduYWdEbUZUb1hBcWt0U3QyenRw?=
 =?utf-8?B?bThzK3BTVzVvSHlyZ0l6V3ZJNUI1VFdoSmFvYmprMkFEaUUrb0hlZ0dQSDZh?=
 =?utf-8?B?V0dVTXFZRnU5RUZLZ1FWbXNacHdDUW5DY0ZBcVpGd25MTTcrUlVzTGNVOGFh?=
 =?utf-8?B?V2pJdXdtQ0xTTnBtK0tHdHRmcmUrSzNnbXY5cnM3b0hKbHluZGJ3d21EWVZE?=
 =?utf-8?B?SCtEL1pTQUNsdWlNanMraHowSHZaOWdDTHFuV0JyWFhYUFN0V0xFSTJKSGhR?=
 =?utf-8?B?V2tnYk5vR1RhVEg1WGk3bGhkajRoa3pJRVNpcFMzdFFlREJ6SGZKdVpoMFNp?=
 =?utf-8?B?dHAraDJJdHM0R2JsUWdhN0Y0SFUxWjFiWTRleVFGZXFpeStRZG9WbUovZ1U5?=
 =?utf-8?B?SnVWNDVkUjRmTmdEQlhKL3djZE56amtVdmJvZmN0ZDc3S1Y1aVZPMm80N3Jx?=
 =?utf-8?B?SHAzdXRhVmUwZSs4dnVCNHN4S3lmS0VwVHcxSUJEeU1lQTZva3ZYN3ZxeVY2?=
 =?utf-8?B?NUFFUnlXaERLK1hOTmQzWTlqbWlpUGpTZFhyRGFUd25Xc0NxQlNyRHFhUVNY?=
 =?utf-8?B?NG1YcjJyVDhycmpEMWdNRXEvK0hCbTBmYTZ3MmtjdUlnazFMWnIvSFJETnYw?=
 =?utf-8?B?bWNUMXpHemQxcHNwU250N3ZXc0I1SVFNRzA4Tk0xN25aVkFMMDBwSGlISWtl?=
 =?utf-8?B?TjdsaStzM3pRMkxuSjJ3eU5BcEIwTldianFBd2pRQ0hSd2ZSR2xQdWNtR04z?=
 =?utf-8?B?ZkEvYW5iSzNOVGdzdHZFNXVxeG9KWHBCcVBzbUhsMUNROWRIdlRGOXZlNmJi?=
 =?utf-8?B?a2NTQzFac1lJTHN2TGZVYXVOK1dMRk5MUFg3SThkUGVrcG9renhBdFZPcU5o?=
 =?utf-8?B?VUppZG84U3VNT0VVQk0wUzNmZDNGT2EwVkkyTlh3Wmx0d0loOTVPUVphUGw4?=
 =?utf-8?B?RmExbzVmRmVpM095Y005WUtzMlZqNEFRdDFnZXBBTE5nZ3hzVmQxbVQ0S2pU?=
 =?utf-8?B?QWxSRXVzWU9hN3A4S1BqWERXRUlHdFFuSzV4bEpaelM1ZFBCNEd0VWlZWGpa?=
 =?utf-8?B?bWpVZExJb2Mzem8rc2ZHMGIxVzdvODBzck1ydWhqWStnSHg1UjFkV1c3eXNZ?=
 =?utf-8?B?T25jd3ljYXBqbmNOTllBYUUvK2R5c0JaR0RnYjRPZExMcFpxRDBlZ3J6ZUs5?=
 =?utf-8?B?RjJnWVBoQUxmQVdjek41RUUybjAzcnNVU2g4QmRQalN1UVB6bzdHMTI3RUZP?=
 =?utf-8?B?dTE2RHlpeTQ2MUdLMzdRY1NobFZpNjJsQlNMWFcwSzU5M1hUOUQrVEFLRVIy?=
 =?utf-8?B?V3RsTm1YUVZtVEtXSTh4SHJTbWkyK0VyUzlGaTJKdTk0MnBWUzg5TEVzMk9L?=
 =?utf-8?B?TFhZRTJBcXFqOTZXSjVMVG1iVlNGakRwZnAzMkVNVUx2a2M1bTd2WHlSMXpM?=
 =?utf-8?B?MUxITzU3TlhtMXEveDlaaW5BL1NpK0pOZ0x0aS91Skw5cERNVG9mc3pyaFBN?=
 =?utf-8?B?YXg0QXhxUUxvaGNnY1NqRTJkUDgwWG5IL1JGUXlVc1FTdDBxTVlFNTdBRDVl?=
 =?utf-8?B?V0I0bDI5bU1mVGJCTFhMOUZyRDJpenNNRFBRQ3IxN1lMbVBReThaNFhRK0xC?=
 =?utf-8?B?Z3BGMEc2clJhZ0hEUnZQd3o2eWZ6ckkrbkFYalRuOHQxNFI2OGxwaWIwMkxs?=
 =?utf-8?B?QWsrZmllNytUZkhNNEpCeDJLU3JteEFjYjhYeEVRekdjbnMyVkgyalpYY0l4?=
 =?utf-8?B?WjREVUdvUG82Q0x0SEpHazl6WS9ZUGZTSjBoRUZVR1F6OW5BNWhnOGFucTJR?=
 =?utf-8?B?TFcvU2ZXR1FrUlNVRk53NnErSXJsZ242aGkrWUNzdU1DNzFGVWM2Y29PS1dI?=
 =?utf-8?B?VmY1R0liYUp6L3JqZUFGeGoyWENYQUxUR21wS3hLU3BSdXJCS3pkeHU3bHhT?=
 =?utf-8?B?ejNKOXVzd0FPMVFqbmdWY3lHb0VnPT0=?=
Content-ID: <7117E0141C369A4AB0B829B16B5F9B9E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 040bb5a1-6f29-423d-01c7-08d9b955df0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 07:47:51.4246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MHUOm3Bep4m6WvMTIDSuJ7+SGncRriBhWMF8nV7dq+o4Yz8QqQ0qz/p1SqCS8xwXCF/2Qy2L/QDZAYIG1B0nlF7cBCJKlU4U6bUkR+7M1SY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_234759_045668_4398D984 
X-CRM114-Status: GOOD (  16.87  )
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

On 12/7/21 9:43 AM, Tudor Ambarus wrote:
> On 12/7/21 9:35 AM, Tudor Ambarus wrote:
>> On 12/7/21 9:14 AM, Pratyush Yadav wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 06/12/21 10:59AM, Miquel Raynal wrote:
>>>> Describe two new memories modes:
>>>> - A stacked mode when the bus is common but the address space extended
>>>>   with an additinals wires.
>>>> - A parallel mode with parallel busses accessing parallel flashes where
>>>>   the data is spread.
>>>>
>>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>>> ---
>>>>  .../bindings/spi/spi-peripheral-props.yaml    | 21 +++++++++++++++++++
>>>>  1 file changed, 21 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>>>> index 5dd209206e88..13aa6a2374c9 100644
>>>> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>>>> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>>>> @@ -82,6 +82,27 @@ properties:
>>>>      description:
>>>>        Delay, in microseconds, after a write transfer.
>>>>
>>>> +  stacked-memories:
>>>> +    type: boolean
>>>
>>> I don't think a boolean is enough to completely describe the memory.
>>> Sure, you say the memories are stacked, but where do you specify when to
>>> switch the CS? They could be two 512 MiB memories, two 1 GiB memories,
>>> or one 512 MiB and one 256 MiB.
>>
>> If the multi-die flash contains identical dies then the die boundary can be
>> determined with flash_size / number_of_cs. Are there any multi die flashes
> 
> but the problem is there, yes, there is still the case where there are stacked
> devices with a single cs. We'll need to describe the size of the die in some
> way.
> 

Even better, winbond stacks a NOR and a NAND:
https://www.winbond.com/hq/product/code-storage-flash-memory/spistack-flash/?__locale=en
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
