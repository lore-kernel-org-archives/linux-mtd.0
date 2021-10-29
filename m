Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B86CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 19:01:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDDA160F9B
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 19:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDDA160F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MRKDGuYz5jseXdS5e0887NTpuNUMfKGh+j7YYIJq1+U=; b=HLnZgDLltGcJhD
	s7IJnDwW0ARZirSYs5bLViavQ9i4wouIL1KLQSRWk1jYvMyA8wn+kNxkY6GqbonczLAcZKQ2RbZYh
	XZ0XQ4tDocR1lqVq70Oid+oST0wmGBHOCt7aajTwCJ9kYODYpcfeSCRv/rRq3RYMM986JUEluXLUP
	KTmrlJWhp1kcYgY4E3XdWCLW1BK70zkCqyKsVjtGDMNBUVsH67AG0ajg9Ij0mAIGOWpicXaAt+FJR
	9AuO7UDAXVQqZKgMnZttw3h2bJ44WUjD3qIlTNr2XW9Y63KJBGQNMNRmEjnVjkf4LLvnXzXz2I0/y
	eVZH8iS2b2u29U9QRSfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgX75-00Bts0-St; Fri, 29 Oct 2021 19:00:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVkY-00Bb08-LJ; Fri, 29 Oct 2021 17:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528786; x=1667064786;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ML2diIhoECRMd1vK8Gi6X5bPD8xBKm46WOjba/TmUXc=;
 b=fpJHijkWhu40tYqe7UUK6NZa+DAOVq1NZ+j/TQPSvoeQiup3TniPJppW
 EZSAdMb872kRlblN3RmRWMKYsrDqwH7/4ewU0DDWTM6JGeT9TC5caY3GD
 W726ljWSEU3b1y0PBONDCAchXghJatRl8d3mq1x8FnZWfTPT+uuaA32PK
 ZDp+6T+9Fpk1motT1I7521W29tDBkBrXeeRprS2/6BDLKDJ62TUhWLDKs
 rMTCuYUlAvlQ4TUW7ueWmdvLxDh2fsPMHHPHIdhX/GkUSAhSgTOlY/ZsO
 l/LNlGm3vbffe6n0nhc+0TAbQq6i3uluhn83b9fBNZ5cA3HOfVRAJd7SM A==;
IronPort-SDR: oLRUMGvEOtJx07gJ96LuQ18AZQtsN3Vbj3p5ZF2br2PrLv4wUlyYorVFRTl4CoaROtBunymmq4
 CbBiD3J8+QhU+FlFy4WgdQqoaUFHvf5t3/JZifVAC9I7IfZ1KjH+52lrb+iiEfQ7GzC0uZNZ0o
 LL17KNLV/wYi2ca3453o+BV5p/fxOzCEZyK4NBqNK/jP+pQEDpio49oo6c/p3QpDjrsefF7pbI
 xjUe9UXQWGaIKqtA5KyvZwQFKbqGKqnjHJNBInEDGuZAphQrdfd0o53ekNd2YAcZlheC1ZweXm
 rwOdnITzTimCt75a9QD4aRuf
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="137362409"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:33:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:33:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 29 Oct 2021 10:33:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUfD7jBodo9oX7jNl0Lbva4r6nSAwU8f0RyoLz8OnpuExVzg8yS26l5OTfKBj//A1QOO/K9EYVgBEyCaAAbBNEJk9ge4yu9HckU7Z8GhpvZJpXp/u7ExuihoHwpPu0QNNplpIDPV8JEAhmrYFDtyFod4gA3zalVmq120O5Lc/4SCqbBeqgldhX5j9q1QEoaF6zouI+ulBu1fbQx6yre3OcMqwjeOpvz6Z1UyTWMW+Y95IFhNPUbCrNMXl5BWWvCa5y3laIN5YkisLa2McNtuGnCgLFYuJV0EHOQNU1CKzC3WlslIiA+DoaR86mduzwOv5+sUHgiNrmnu1W126Vvg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ML2diIhoECRMd1vK8Gi6X5bPD8xBKm46WOjba/TmUXc=;
 b=dZ1Hgchahs10WWKdXJtF+rpMZeEMhObAdA/71No+LGRYVUpUPEzSeZszK0lADTP9v0nGv31OZc7ZGxd9VFuRSPKHIAGjnbDOwb3OT9BpQUdtIJxR9Qk4W/RZz+hqwkpvMFw06f08jVN4ewXJe4G6G2TtPPxwM0RDzITntwzMkAR4WUCVY2yf1aKEnoI+V5A/JqRGHAHeyA94tnmeVsFGecE7EdBcyhu075EOL/rCSWFmUw2jc+ShYc9+E1AOc+INs0r+xicsoCtLBP5X3gyasOx/lQ7TvFLRu/OL2zhZAxQysN/AdS9Bzya2d2dNQNTqKLUJRzBs9kHI/+a0gzU+iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ML2diIhoECRMd1vK8Gi6X5bPD8xBKm46WOjba/TmUXc=;
 b=bD0JDDK0w1rHMFiOAW7hvNfS7rkJxiJ9BOX+Y8zLOS1TgttRxcSsNJ7RdUf68absBAx/T6M6wDbyAKjofTtajaxJZqEjXFtNJi2dJSi9bd1y7Vuxg2U5kGEggx5vJXYL7lA3ead/xvoHsR41jcas3/hDGK7NiEzT9K+0Nk3MuZs=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5210.namprd11.prod.outlook.com (2603:10b6:806:fa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Fri, 29 Oct
 2021 17:33:02 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 17:33:02 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: Re: [PATCH v3 23/25] mtd: spi-nor: gigadevice: gd25q256: Init flash
 based on SFDP
Thread-Topic: [PATCH v3 23/25] mtd: spi-nor: gigadevice: gd25q256: Init flash
 based on SFDP
Thread-Index: AQHXzOsGZSfDQ4/PnU2ZQNCaNoHpSA==
Date: Fri, 29 Oct 2021 17:33:02 +0000
Message-ID: <fa48e2f9-22ba-0326-d819-4ed50451f2b6@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-24-tudor.ambarus@microchip.com>
In-Reply-To: <20211029172633.886453-24-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b23c7a4-8b5e-45e5-402d-08d99b02289d
x-ms-traffictypediagnostic: SA2PR11MB5210:
x-microsoft-antispam-prvs: <SA2PR11MB52109BF78B490E84BC3E45F3F0879@SA2PR11MB5210.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GNGx5UJVfDYfaU+sgUwDyaypw+0d2cHVowgopnh4KoDMQAN4SUoMU6BTc+V3BbQS2Vr9fEFCGp6zA3442KYjqG3rqPuIEZIlvwzXO8j+asEqvInZdYj3z+9IOIqDpFWBlwfGSp4kRHYxYg7ay4OiOa3gon6zX7A3x4T3od8yKZQE4uN/hnHmZCtU803lTn/TpjeGDMAE6yavzTZC58jTa0ShycdIkiXwBUeyDnfEBQYMO40S26tYUV2anYjCPx8m/tMwt+fgLama4eg36WViqcYIly3gUpQZfCo4eaH9aHOrY5glLlZlgaxHcK+kvh7cBEiG1AoCQ3W71424vZorQlBd40mYYzPRNO7XUOAFOkZjX1VmWxYYD2dl7+rx1n5gIoXjC2kaFEXomHsGBASuUIpLY360vuYsDNwcRpztu4SgJ7BoyYryQoOr/v+3ylMfTmCtH9co1C3/ByGjlArG+ve9x57c7FbZJrGuNmxcxTd2yVmMoO3CUhJ8yncKgzqfRGMCWPOiJhZ/DEwkj/3yY1R7W0RDeoXonI5odpU/HCN4+4h36ZpXS5mKEMI2Q8YCufWPiQnqGDbIGqC/DN0HwihiuLcP00wHOwoZMn5er8ERRp+yxds9f/TYzY8uH36xmjoc92MprM5QlLJY+unwieRrSHEc9QjLCHDN5yYz40pIjo9/j4eS3sRX7wm5TJpLfwi0i4CT0inpWGnwSZiA2hNRGONZXW5vWvzKGeWUgtLSdC7Bbx5CR+Qyawf32KQSQ6jfP9A+wFVNNyQr/cb8AQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(8676002)(6506007)(8936002)(66946007)(54906003)(66556008)(64756008)(66476007)(110136005)(91956017)(36756003)(66446008)(31686004)(83380400001)(107886003)(76116006)(122000001)(26005)(38070700005)(316002)(186003)(71200400001)(2616005)(5660300002)(2906002)(7416002)(508600001)(4326008)(6486002)(86362001)(38100700002)(31696002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnhWeTJoOEd0N0FvZDVsaS9RTjdHYk91S0pwa204eGZVQXJNSFFCUU51ZFlp?=
 =?utf-8?B?bEhtQk5oVkRHUDRJNTZ5MllyZ1BVeHN6UndTMEdMalJRd1g2Z1I1cWFzc09W?=
 =?utf-8?B?c0ZvdzltTWw5TEpNWE90Q242UFY5OTAvNm85Z216LzBucWRxcVhkQnpQUXRw?=
 =?utf-8?B?bFVFb3RJdW1Bbkt1dzNJYWhOYU92UURnT0RPVjRxV0Erak1NQXYrWnFTQk5S?=
 =?utf-8?B?OUk4VzBDcndpdDNxR1NqNUdNeVRIeHFadmJzNHBZY0c2YWNoc0p1WVZnWHpx?=
 =?utf-8?B?TjFJVkMyVUtaUjJJbU8yQXJ5VVpucTlqakpiTnMwS09vZXB2K1FHTy9xOXVh?=
 =?utf-8?B?VkUwL0hxZGdYd243eXFBZDdPOVdzTGkvbExuSXFJNVJTd3Z2NXdZTnVFMHh3?=
 =?utf-8?B?amVuSE0rcTI2bzA3c0dXNU04eTVvYjdod3dNTFpGZmFLSUp3dWFyd25YVkNS?=
 =?utf-8?B?eUZONTF2bnJyRE44ZzNFM09lYWlINGZCWU5Cd2dGQVpUOVRmY0loYzczQjd5?=
 =?utf-8?B?Y096OW5MYVUvdTQ5cS8yRWZ3U0JXT3NOTUxEZGFxL2ZMNmNDQ3ppRXV3ODYx?=
 =?utf-8?B?ZlFtYnZ6Vk9xRzR1WUd3QWN2UHdlTk5mbDhOZlhEbGM0dGxRZDBwcXQ0azdw?=
 =?utf-8?B?VHVOTGxRemgvK2x4anp0NjUvWjR3cnlZdktPRDZlbVFmYkNnK1QwZjNFdk1a?=
 =?utf-8?B?amdZbDJ4ZEFQbFhoMDVKaHo5d1RZZEJnWHJuVTIwUlNQS2tnVDlWMjQ3NzJE?=
 =?utf-8?B?YmVjQmZ6dnFPLzZOWCtxRW1KQ1k5dDhZMUt4WVVONWIrckdOZk9ubENaTkdE?=
 =?utf-8?B?dGcrbTdZU0J6bUtoVUNvSXhFSW1QeElhTTJQSDVhVnk3a3dMZnEweThQRVZt?=
 =?utf-8?B?c2ZDMXc2REdCeHAxWnN5b3dwNlhLMzVBYW9KSnRJaDl5VFBtc3hVd2ZNZzVH?=
 =?utf-8?B?TVVvZXdITEVmdGhIcDk2ZGtMV1M1T1lpS1BHTzEvTllma2VMZDRpWnUzNExF?=
 =?utf-8?B?K0cvSGlEOEFnN3NSNWhocWVXMCtsRC9NQTBXVHN2U1hwbHBmdDhNTjdNeDUv?=
 =?utf-8?B?L1lUK3c5TzQrTU50MDJUSVFlY3Uya1ZqVDNhYkdSbDdCREtpN2V6b3g4ZnNL?=
 =?utf-8?B?eC9zKzdXYTZrS3NsRFRFU2QrUU1jSm9Oby9rUGJDRlpINnljVXhWK1YzWWhh?=
 =?utf-8?B?Sk0rSENhSVZ5TzU4aHhtT2JNZTlKRCsyQUgvbnJaNktGbjI5WWxhcXZlSkJ4?=
 =?utf-8?B?eEx3bEtZR3dIUUpiR3I5dzNJeFdraTRaTXZDUWN3Vy9rblFVc3I2aDBBS1FO?=
 =?utf-8?B?bFZrTFU1dUZhY21OUVlFTkY3T0pkMVBuSnZ5Y3luM0EzYmZyczI4ZUhmZGxJ?=
 =?utf-8?B?ckhWMUt3NS9CUnBydHFQRHVOWkYyNU5na203TW1XU0FNMFVxeVhWZkswVHc4?=
 =?utf-8?B?N0cycGM5b0hnUHRQVVVRYzRGNzdUaWtoTVk1NnN4NUw0TGZWbmRnOTRHckJs?=
 =?utf-8?B?OVgyMTFRb3JwSFZyYmxudENEbjFDMXUyVkQvUmpjRzNxYUJBY0hyUkVWd24x?=
 =?utf-8?B?Q2o2MmszNW1OR1hYZ3o4OVE2Z3FPZHJtSFhQOFdBZC9WU1hROGJyN1JrWU5W?=
 =?utf-8?B?RGVCNWxpUmcwV01iMUpnTmRzYVcrOWJuMmFTVkNLU0hKZHBTWnRaWkJhbUc5?=
 =?utf-8?B?WDFWbFlNbk8zM2x1RUpOaXFnT21pTTFRdGxlV0tjQkN1a2FFVFdGYUJYaEtp?=
 =?utf-8?B?UVAvK1FNVm5NdHJCdEpEYXFxVjZSbG9KREdxdWNJZ2k4SVl1eC8yUTFXdlR6?=
 =?utf-8?B?bnVrWjNUOEFSTmowRXZtODBTRkdoaWxEQU9SdlY2V1NZS0trVmFMbmhWQXl3?=
 =?utf-8?B?dS9ZR3V0M0pOanlZQUIxdDlteG5tWWxqS1FnN3FuRVFVOXE3OUo0c0Y5blRs?=
 =?utf-8?B?bVRFMlBCN3FZLzhDUndlKzJsVWZNbUJsNGJERVc0WXVHbmNkN3NCb1RzZnRH?=
 =?utf-8?B?Z1AzK1BiK0hxSnpYOEhONVd6SE5VaHNKcnFBU3ZHa2hOQ1Z2eHpWRmIySkdF?=
 =?utf-8?B?R2NsZVE2cXgwZ2hibEIwU21hclBRM0llVUFoRDlsSDVtcFpJQnNBM094aEt5?=
 =?utf-8?B?WG9lcG1ON0x2K2xQV2Y5QmRodUZlR2kzcWdRSUhiSjZjRWY1M3VUbkxmdWtO?=
 =?utf-8?B?ZzdJelA4cTBQcGpDdnliY05NVElUNGorK1MwMjNWNVlhdHJ1QUpNdXlQNUF3?=
 =?utf-8?B?Z2k1Y3NjOWhRNyszcUR0bG85aWhBPT0=?=
Content-ID: <1C466D7152C03A4DA8C73350EEBC6EC1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b23c7a4-8b5e-45e5-402d-08d99b02289d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 17:33:02.2782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V4HajIquMI43h1djdMNNnKlHsO3M104/diOFn6Lkdtk1FaQ2x+8UoL9zX9EblvCLDCpSopCAxBp4fuu3yMVT30dyn2Y4JHcap8RC4tTBeEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_103306_827545_D24AF861 
X-CRM114-Status: GOOD (  12.64  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, code@reto-schneider.ch,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, sr@denx.de,
 mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/29/21 8:26 PM, Tudor Ambarus wrote:
> Get rid of the static initialization of the flash parameters and
> init them when parsing SFDP.
> Generated a 256 Kbyte random data and did an erase, write, read back
> and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4_4B 0xec,
> for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_1_1_4_4B
> 0x34.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---

root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
c84019
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
gigadevice
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname    
gd25q256
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > gd25q256-sfdp
root@sama5d2-xplained:~# hexdump gd25q256-sfdp 
0000000 4653 5044 0106 ff02 0600 1001 0030 ff00
0000010 00c8 0301 0090 ff00 0084 0201 00c0 ff00
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fff3 ffff 0fff eb44 6b08 3b08 bb42
0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
0000050 d810 ff00 6242 fec9 e982 5814 60ec 3306
0000060 757a 757a bd04 5cd5 0600 0044 5008 0100
0000070 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000090 3600 2700 f99e 6477 cbfc ffff ffff ffff
00000a0 ffff ffff ffff ffff ffff ffff ffff ffff
*
00000c0 0eff fff0 5c21 ffdc                    
00000c8

>  drivers/mtd/spi-nor/gigadevice.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
