Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CF3D358F7
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 10:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=otbIsTwxZkXFfSfmSlteHH5ihYPTsIjBJsCr3729ALI=; b=bH6e5O9j2F0Ty4
	B/R0uvN0wMe2qOeRQflZBRg55I+xsqh69VWzD4ZYgIekKyXCbFGhO1BerGCphjqDvqACUgg85/d3d
	W0cbyS7ulJJZKqH/AdrDLrYOsB/qvmF8bN58OfnOIc51H39cex8/L1mO+5D9ntBKhkDcvYc5huZv1
	UEPyZPAvP/6VEtt6iK5T8othiTC22qrvOZHrDfm96gVmMUyVSdaUFgQdsdwLKhb3nFH+nPvCCPMPd
	nHhDar26rT14o/WA1n0Kt/DFHsXKC4iuFsogH7Q114AwHn1OKDr4DQQeheug99kZbMHfS2I+lWvag
	w9MVaY70qh+igFGmCqFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlPII-0000000HaJ2-1DWH;
	Thu, 29 Jan 2026 10:30:34 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlPIF-0000000HaIM-2J5Z
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 10:30:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEC5NfOdMJsawjDDbSDF6lmlgumf1dDtUvMzuTlTUkl8Z7/TlNS1Hz4/OZms6fV/i3DdAxcKCuScBhDcxguBDCAZocqVehIH/9qk2G5NDSR02VxRuE/gECTfiV1qvFKraNGs3y3tUBNEbr9nuaLBbecN/Nf0oSGf/zxx3be0jdEvN9Zw7HdODrT7aG8ICKS/Mn+kxvA1jpTM/yjFdgWSGLXYGtnwL/6WHDPpxGAJIqJ8Bzbdmws7+5aNddF++TYHENkbLsYaafcYD6+UzTduq7JluPvMTa4OmZIprOg8kmG03wfzW9FORCO0Ti6GKoAMMTO0WWEfWr2HLboa66LUYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96J0/3fpQN1M6Wt6Jz8nwP3gyXM8tZO68d4OlypDLcg=;
 b=vny2jgQPPncTMEvyYdhRLjy2p91ZIDkH3htzUyzx7ieqg0NFNzrn3G//E9d02rH8ANPjbJZDZszoWoU6Q+/NpxwZzQLZipVQJeFR/igymCclWFdSRjWaKw7j6ruvTHF7C4zFp9Eq9SvxjBkq8cYJCcVtZCazjaHsmMMCJrecU7Ficu2sWAM9Bvqazekr2F+Cbk4KakgQARh0Zpt2n8RFN2uze3q3leCYYsq1Ae5+z1Y1y2580SZYH3XuYr8/OajlAbUx2BAF7fD+gH3wQDHemYX3F9XNR8ckqajVFg63ptto0rhxtSy01Gh4noNiT/Ci2gyoG5HPO9qIv1zWaefZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96J0/3fpQN1M6Wt6Jz8nwP3gyXM8tZO68d4OlypDLcg=;
 b=VC3rXjMuwED+cuJ6Y1EV8iEvrb5Gnv+phuVxtIKSgbCb3nGHohr04lUku8zvXxAzS50HWaIZY0gzZNzMleCxIsr+Ja6N8Nzd/K+agDekmmIGebxKELvpfgjMTVPFiJOIqxRaJDhgJWjfPF9WuXSgQ5Jx67oDW5aaXfeknBKLgq5kYIAHnl9k/9eQAC7lfKIwkD5oizp8SRF+RNGzD6vt95NLd4Mme8t9Kf10DndSp8T9Zzg6ZCAL6ZO/IYJGkP/Q/Ojd1NTk1h9PQMD35s8RovEjalTPuiNROkqhgzppCsD0ilYcaukxTwpbBGCE81qR2WZQE4viD8eQBLlzYKI08g==
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com (2603:10a6:10:291::22)
 by AM8PR06MB7505.eurprd06.prod.outlook.com (2603:10a6:20b:365::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 10:30:26 +0000
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab]) by DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab%5]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 10:30:26 +0000
From: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Topic: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Index: AdyRCkfQa4Zi0XkcSIOaDwEHvEKqQg==
Date: Thu, 29 Jan 2026 10:30:26 +0000
Message-ID: <DB9PR06MB784979B96C388174F81F9103C29EA@DB9PR06MB7849.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-processedbytemplafy: true
x-templafyemailsigvstoversion: 9.26.0.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB7849:EE_|AM8PR06MB7505:EE_
x-ms-office365-filtering-correlation-id: 2b4b3d1d-9041-4e78-663c-08de5f216af6
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cDFibnRyNzJ6dUJ6L1c3OVFUeHlhRUhiK0lqbzRhQVZpZjBUM2t5VDNiZVgx?=
 =?utf-8?B?cXpUemg2c2VhWFBRNVNJa3BUSmdObEFqTVhqUTMzWHpJMXBSK0EvcGZ3WkhY?=
 =?utf-8?B?dGw1N0h4WGJaQVFjR1VseDd1NHVhTlZNZjdjUXd0OTkvMlpyNXN0K1VzYmFK?=
 =?utf-8?B?aW55RnE4UXMva2tWMEJNalBwaE8wY1d6QmlEL2RQT3JzaFRoK2haQU1tb0Rv?=
 =?utf-8?B?MjduU280bEZXOWVKdkpFRVl6TWJmb3R1bUJPa1UvNlpZcGhXci9ubDNPb2lT?=
 =?utf-8?B?QkRmSENLT05pUlRCWEI1OGJoZFYxNWRkRkRNTlpUbzJrRW5wdkFPQWV1V0h2?=
 =?utf-8?B?R3VZcTY0bkxSS0N6VWxqaHR0bXNjRWFHY3NJd3duQ1V5K1VvM3pvRWlZRTNY?=
 =?utf-8?B?b0tnUzdaVFZWd1o5enp5V1ZxaTVGM1Z4VlkzaEVMWmtsMVVXWVh2Z2ZLWkNY?=
 =?utf-8?B?QU9wRTM1ZEp5WDNHd01wWmFWTzRvbXNhVDl5RDk0dHgrSTJ5QUFjdmVmSzgx?=
 =?utf-8?B?YkdUdk4zTFZxZG9zck5ncE95SXpMeUQvYzFpNG9mVEJwZzlEUG4xejVFTjJq?=
 =?utf-8?B?WEFaMjM3TG1mdWpSVmloWXRISmw4czR6ekYxNXU1RjNGNlB0NmQ3WGtMcndL?=
 =?utf-8?B?Qkk3cUVaWjhkY1N3TU1nZlJiU0VpckNlQVRiSEtZeFovYnJLQVduYWVKVkxh?=
 =?utf-8?B?UXBaZ3pvekxOL0lsdUtsLzM3Y0tYVzA5SGNLS2FOTGFuTmt3VGlBMTBtRlpv?=
 =?utf-8?B?SWVqRGMzQUlHUG5NRVp1TlRyeVJDK1FLNXFiaHVEYXdCVk5UNzJ5NnVkNE1z?=
 =?utf-8?B?M3pjL3pBWGdGQ3h2VlNmUjVVcGcwcTF6aUhEMWk5OXh1UEVEUVVLV3Bsd2VZ?=
 =?utf-8?B?V3dBTitJalAvbktOZmtsaVh0TCtrL3ZNU0UwYk9xdWRiZ3IrT2hybG5vaGU1?=
 =?utf-8?B?S1NaZ2dsdGFIb21UOWIxa1ZzYWRpZ0k2dVJZZkRWM2NLa2pPZkdzemwrTFE0?=
 =?utf-8?B?eGlZMHc4aEhJVHRMWlZKL0xUeFhSQWR5M2dxWml2a2xWRDZFWXZlSktxcURv?=
 =?utf-8?B?cCtBcGRiaWw4OEl4TTdKZW5RWDZTWWY2REtHRk5qZDNpbWhURzdha1JUZFl1?=
 =?utf-8?B?eFZiSFhUQWx2SlZvbi9hT2M3MDRFQnlCRXhnbi9OcWtwNkJtd2VGdTAzdXdV?=
 =?utf-8?B?OFRZOTI3N28zNE9Xc25aVWJzRStlTHNQUk1YdGpPUWdPYUhnSHI5ODN0STZM?=
 =?utf-8?B?VG4rb2p1dDJuaE5XMmlYekUwRlhwYXVBWm04STdURUlCSTJSNUhVekFBcVdW?=
 =?utf-8?B?aXBYZXUrYVVnY1V6YzJMeVM0bEhhd1BVNFNUVllWNFJmYndMTHRsdzhJcUMv?=
 =?utf-8?B?MmJKbzBEcmpYMHRmeEwrV2lpbHhqY1FsTUlPSVkvbm9sbTZSMGFtMTNLWHJJ?=
 =?utf-8?B?ZHl2V1VKejlyWDBCb1BybDB6NE9DdmxGTHh2ZjJrbEdCRmZCQTF2ZTVrOURm?=
 =?utf-8?B?Zm96MFdlaUY4alQvSHorRTZHbzIzdGt6ekVUQWhUZCtablJ0N3FpdXBxa05W?=
 =?utf-8?B?eWNENlcwKzdLeWZXNWpjY1dwZHhRMVNvVm0vQ0t1ZGJoWHZ2MVlyZkpKc2x0?=
 =?utf-8?B?bExDWUUzWkpxOW40eW44OEg5Y1lSY002aTMrS3grcTZpRzRXK21ldU9Sempa?=
 =?utf-8?B?Z2FuYnJnMm9NSUZ5ckRjSTVGY1JBOW41QkV6OWQrQ005dUEzY1YrNmZ6b09y?=
 =?utf-8?B?RTRXdURtc1d0Nnk5WitLVkpBRFA0d1JsOG9MWWU5bHB6UjJTRVJraE5jVE5Z?=
 =?utf-8?B?cERUU3FFY2poMElRRkdNYXk5dEtWRGJRcGJFZWM3ZEE0TElVbDdaQk1KRFQy?=
 =?utf-8?B?cjBObjJpemtzWFBmTVpHM3lpcnRURURacHlzWDdwME9weVh5RUpjUTBxVmZQ?=
 =?utf-8?B?M2J3OEpMcUZ3bWpFaklOVkUzbTV4ZnpYRHJ3d29TV3dzTlpmVUlSNVYrTnI2?=
 =?utf-8?B?M2dSUmc5bjZ3K2o5dElOVUZlMy9mNnpsK1puaElVdVpobjlXTEV6RVhKZDcx?=
 =?utf-8?B?Q1dGd2crakt6RjNzaGdxUUJQenpHRFJkTHo1ejVJV1BqL0poYlFUa3NzMlVB?=
 =?utf-8?B?OUNMOUlPVkhVc2QvYVhPRHduRXBzWlpRQzJNT29KR0xNblVUSDlacFdlbnV6?=
 =?utf-8?Q?sXItskx23DYIUjVHJZ37+2M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7849.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmRpN1ArOEx5ZE5vYXh3WkVCUGdldDJDQjVLb0tMQm5pREFRNWhiaUdSZkRw?=
 =?utf-8?B?dzRLa0JXcG5yeXBHSnNNT3IxRENnUWJSSGR0R2hscjhjbktlZTN4STc1S3p2?=
 =?utf-8?B?TjJTUGZZbWYxWEduZ1FLZ3JZM2tjKzhxdzBLM1dHck1lcExubUwzSzRabkhi?=
 =?utf-8?B?cmZGcm13Nk85T1poQWVzRCtjdUV6MXdZckhYRnJuenVDMk9sVy90YzR6bC9Q?=
 =?utf-8?B?a0JtUVo4NmdrY1p5ek1hMkVHV3prSHAyUGIxRWpZQStoVFo2clNKd1FGSk80?=
 =?utf-8?B?RTh2eS9zQjFVczFvNFdHcEY0ek02VE1vaVdScjlrMytSamoxT29WMmdwVSsr?=
 =?utf-8?B?YTZqdTJTajJyUjNjWUNSUjAxbWhNckc2azFJNGpFWjNnZnkzSElFZE5UYk0z?=
 =?utf-8?B?RkUyMktGdm5zR0dIK0g3RW5SNjlZblZxcmRLdDFRSVAxUGUxaTRBbFR2c1N6?=
 =?utf-8?B?RnViODhGc200eGxWeWx0VVdNQUhLbFd5Y2E0UFNGVW9KVnl4ZFJ0cllMUGI1?=
 =?utf-8?B?RS91SWZadDZ2eUk5RGYxUDkwSmtwdkhUSGxhVDNwSDVsOEFyTHpvS2N2bE41?=
 =?utf-8?B?emVaWDl2NGNYQnduQjFqM2oyT2hpTDI1N20yRGYxTFJUbzkzU2xhMkxPZ2Yw?=
 =?utf-8?B?dTRqVm11RmtCZzhvVVhVdlFqWTRKSzVJcjQzVllHSXUyQmxoRCs5Q1dDdy8r?=
 =?utf-8?B?dWxpTTFTSFRmKzBXMllkMkFrTExTdG8waW5XK3Zia0hCVkU0M1ZXODNVdU5Y?=
 =?utf-8?B?dmYrU2VKMEpaWm9mbW9NZlpxSURIYWlaQnd3YmxkNXFyQ1ZzaDdiSTczYzY3?=
 =?utf-8?B?NkJ5SlVEemVvb1AzWSt6dVFGdHkvL010UndXMnd6OTlyT1Y4VnVydFJVejlL?=
 =?utf-8?B?aW53TWNLV1l2bCswc3hWT3RnT0U1dXBTYUR4c09FbTdYcHltQ2VVaXM4clNW?=
 =?utf-8?B?cndZeW1FWXRtZGlmUHJpeXprSnVjbGtCN3Uwc1EvdGNZNmZlMG02SzFQYXZX?=
 =?utf-8?B?U3hvNHFlTkh4V0ZBenRXNEZvZ0pyVW1YWG9tbEJ5OCtKRUhhenlzOHFRenJv?=
 =?utf-8?B?NnFpem1MWVhxZzIrWjVYUUx2N1Y5bTJ1UWFVeUZ4VGRMRE9kNkNwdU0rN0Yv?=
 =?utf-8?B?RG5QbWh1TVJFeG95YlFRR0lBRW1FNkhDc2lkcEtNY2dHU1pTTVNRL3h3Z1p0?=
 =?utf-8?B?R1oxaG5BcFZXemI0M2tHTHVsbjN0SWw2VXpCZ2NjMFRySEN5Q01ZS0N4dFNX?=
 =?utf-8?B?Um5mYkE4ak9rdFlhb1RSbGJzTnBVQjdZQlBmOC9XSytBZFFTQlJHekRTM2dL?=
 =?utf-8?B?M21aTG5mQzFWc3R6RVBPbEdPUjEwYTNZZTBpS05ETHdsZm1aNWRHVnUxNGtG?=
 =?utf-8?B?ODM2TzFuUm94RFNaNTBuajRZS2Rvc096TkRSekhDWFZzcU1KZ3VDalVIdGNP?=
 =?utf-8?B?czFiWnhvcTdqNUJha3lDWnFZY0UyemlUTnlKZGIwV1hkSXQ0dWROaU95R2p5?=
 =?utf-8?B?dXY0akhnYUMxV3RRSS9DdVBvY1dxR3R1QUxXcWxZdENISzRWekpDN1h1RUlX?=
 =?utf-8?B?MEdpVzU5VjJEVUJZdDEwbk15Ri9pSEhzTUUwOEZla1BhWXZrNlJveW5McmY4?=
 =?utf-8?B?ZTZNYUtSc0hoN2JhditNandpL0FqVmZsRCtxRCsxYXJqWFZNQmtOOW55R29J?=
 =?utf-8?B?dWt2cTg5NllQTGFGSDJMcDJRa1hPOE1GcjZyUmFDaEU3U1NrN3Y4QnpDbm5t?=
 =?utf-8?B?MzJ0TDhKTE1nekJoVG1BUTBCQkFqSWZLY0xGMUlwendhL0IyNmdSekU3RVpZ?=
 =?utf-8?B?N3FiNzN5UnFXR2N4TlBvTUs3R3VPVDJKMGZXWk9XVHFsaWpNUFA2eFBRVmlv?=
 =?utf-8?B?M3R2N2RoWDdyWTB3Q3FyWExZNWNOVWNTQ1ZYQWRCbTlqbUVJdnF0NFBHUU5T?=
 =?utf-8?B?NG56ZXhTT0hWL1dXZHE0RzUrWVdzTFBVTFZaREF2L2dsNXRZaFZsWWJ2a2la?=
 =?utf-8?B?V0JHdGVjZnZDZ1RaWjZlK2FpSytkemNhRHl4VjJBS0RnOC94bEYvR2RlK0d0?=
 =?utf-8?B?RHN4dUJCTTBWdjI0eHZ3OHNjd3o5TURxN2E2TTMrMmozSFB4Q21pbGtudzJ4?=
 =?utf-8?B?dUs2TnhSaDN5U0QxNHVOUllkRzY2RFNDalQ2elNRL2VKWEtlR25yQk1CSlVv?=
 =?utf-8?B?R0tzbFVBKzA1QldsalVZSW5uZkRJeENoMkxFSXpHU2lxQi85b0V1ZkJQZUFL?=
 =?utf-8?B?enJMMDh6cWZKc2MxaGtDeTF1Rm9VcFF6RElNeW1xOG1CV3p0dWMvV0gwaksy?=
 =?utf-8?B?ejQzalkyd1QwNlRYREZkUDFCeTg2cmpSWEtoa3FoMjlUMGRnMlBWQ2EwZEUr?=
 =?utf-8?Q?F8uLvjF59ofHzm/PsV74X/u5OoxQslLQzj4nQ?=
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7849.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4b3d1d-9041-4e78-663c-08de5f216af6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 10:30:26.6236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZRazNs3IESpXA0eLmHGIypb8lTrs8t5x2y174tuTQc0EkiAG3hIS+BJvd1fmvzbCqAC3PK4qY48dksveP7fCTqFKK4VbR1SMQxhtMtcsYrbJ1oy53ecMswcRCoWcKQDz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7505
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_023031_750749_E7ACB730 
X-CRM114-Status: GOOD (  10.27  )
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

Hello,

I am writing beacuse we are experiencing ubifs corruption on our powerpc boards
after updating from 6.1 to 6.12.57.
I haven't pulled the latest UBIFS or UBI code, I looked around the changes some
weeks ago and did not find something that seemed relevant.

We have a variety of architectures running practically the same application
(w.r.t. file/db writing), and have only experienced this in the powerpc boards,
namely one using the layerscape t1040 in 32-bit mode and another one using
MPC8360.

Corruption appears only with the newer kernel, same compiler and libraries as
older one.

We've ran integck and fsstress for long periods of time in various boards but we
have not been able to reproduce it, it happens with some automated tests on our
test lab, after some hours of running tests (not stress tests). The application
uses c++'s filesystem library.

We have an ubi device (nand flash) holding mostly read-only volumes with kernels
and rootfses, one rw volume for configurations (ubifs) and one for storing
coredumps (jffs2).

We don't have any patches on the mtd layer except reverting this
aeeec092e57e6e4a9f7bcc18f71d9e17e9146bce, because we do have mtdblock on top of
ubi for the read-only squashfs and no chance to change that due to
retrocompatibility.

The only way to recover it is to remove the ubi volume and create it again.

This is the output of mtdinfo -a (mtd-utils version 2.1.6) for the volumes on
the nand:

```
Count of MTD devices:           19
Present MTD devices:            mtd0, mtd1, mtd2, mtd3, mtd4, mtd5, mtd6, mtd7,mtd8, mtd9, mtd10, mtd11, mtd12, mtd13, mtd14, mtd15, mtd16, mtd17, mtd18
Sysfs interface supported:      yes

...
stuff on ubi0
...

mtd10
Name:                           ubi1
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          4096 (536870912 bytes, 512.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  2048 bytes
OOB size:                       128 bytes
Character device major/minor:   90:20
Bad blocks are allowed:         true
Device is writable:             true

mtd11
Name:                           bootfs0
Type:                           ubi
Eraseblock size:                130944 bytes, 127.8 KiB
Amount of eraseblocks:          40 (5237760 bytes, 4.9 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:22
Bad blocks are allowed:         false
Device is writable:             true

mtd12
Name:                           rootfs0
Type:                           ubi
Eraseblock size:                130944 bytes, 127.8 KiB
Amount of eraseblocks:          47 (6154368 bytes, 5.8 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:24
Bad blocks are allowed:         false
Device is writable:             true

mtd13
Name:                           cfg
Type:                           ubi
Eraseblock size:                126976 bytes, 124.0 KiB
Amount of eraseblocks:          1058 (134340608 bytes, 128.1 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  2048 bytes
Character device major/minor:   90:26
Bad blocks are allowed:         false
Device is writable:             true

mtd14
Name:                           coredump
Type:                           ubi
Eraseblock size:                126976 bytes, 124.0 KiB
Amount of eraseblocks:          42 (5332992 bytes, 5.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  2048 bytes
Character device major/minor:   90:28
Bad blocks are allowed:         false
Device is writable:             true

mtd15
Name:                           bootfs1
Type:                           ubi
Eraseblock size:                126976 bytes, 124.0 KiB
Amount of eraseblocks:          84 (10665984 bytes, 10.1 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  2048 bytes
Character device major/minor:   90:30
Bad blocks are allowed:         false
Device is writable:             true

mtd16
Name:                           rootfs1
Type:                           ubi
Eraseblock size:                126976 bytes, 124.0 KiB
Amount of eraseblocks:          325 (41267200 bytes, 39.3 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  2048 bytes
Character device major/minor:   90:32
Bad blocks are allowed:         false
Device is writable:             true

mtd17
Name:                           bootfs2
Type:                           ubi
Eraseblock size:                126976 bytes, 124.0 KiB
Amount of eraseblocks:          84 (10665984 bytes, 10.1 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  2048 bytes
Character device major/minor:   90:34
Bad blocks are allowed:         false
Device is writable:             true

mtd18
Name:                           rootfs2
Type:                           ubi
Eraseblock size:                126976 bytes, 124.0 KiB
Amount of eraseblocks:          325 (41267200 bytes, 39.3 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  2048 bytes
Character device major/minor:   90:36
Bad blocks are allowed:         false
Device is writable:             true
```

The error we are seeing is:

```
root@kmcent2:~# find /cfg/ -name *tar.gz
UBIFS error (ubi1:0 pid 134): ubifs_iget: failed to read inode 3917759, error -2
UBIFS error (ubi1:0 pid 134): ubifs_lookup: dead directory entry 'ne_config.xml.gz', error -2
UBIFS warning (ubi1:0 pid 134): ubifs_ro_mode: switched to read-only mode, error -2
find: /cfg/board/cfg/mob/backup/ne/ne_config.xml.gz: No such fiCPU: 1 UID: 0 PID: 134 Comm: find Not tainted 6.12.57-00435-gf9e139970f1f #0
Hardware name: keymile,kmcent2 e5500 0x80241021 CoreNet Generic
Call Trace:
[c2cabba0] [c0bbf558] dump_stack_lvl+0xfc/0x120 (unreliable)
[c2cabbc0] [c041c8e4] ubifs_lookup+0x378/0x394
[c2cabc20] [c02f100c] __lookup_slow+0xb0/0x1c0
[c2cabc60] [c02f60d4] walk_component+0x158/0x24c
[c2cabc90] [c02f7078] path_lookupat+0xa4/0x238
[c2cabcc0] [c02f77b8] filename_lookup+0xcc/0x200
[c2cabd90] [c02e7b08] vfs_statx+0xa0/0x150
[c2cabdd0] [c02e858c] do_statx+0x84/0xe4
[c2cabec0] [c02e87cc] sys_statx+0x8c/0x120
[c2cabef0] [c00127bc] system_call_exception+0x9c/0x1e0
[c2cabf10] [c00170e8] ret_from_syscall+0x0/0x28
--- interrupt: c00 at 0xfe37b04
NIP:  0fe37b04 LR: 0fe37ad0 CTR: 00000000
REGS: c2cabf20 TRAP: 0c00   Not tainted  (6.12.57-00435-gf9e139970f1f)
MSR:  0002d002 <CE,EE,PR,ME>  CR: 24008483  XER: 20000000

GPR00: 0000017f bfe51f30 b7e51800 ffffff9c 100dc360 00000900 000007ff bfe51f38 
GPR08: 00000001 00000008 00008ffa c2cabf10 24004884 100c365a 00000000 10144bf0 
GPR16: 10140000 00000000 1015c110 00000000 10140000 100042d0 b7e7ebe8 100c0000 
GPR24: 00000000 00000000 100c0000 100dc360 b7e2e010 100dc360 0ff2afa8 bfe520c8 
NIP [0fe37b04] 0xfe37b04
LR [0fe37ad0] 0xfe37ad0
--- interrupt: c00
le or directory
```

I wanted to pick the lists' brain to figure out what else to try to debug or try
to reproduce this more reliably, or if there's any relevant changes that you
recall that could be causing this issue.

I would also like to know how to go about dumping and flashing this into another
board or to investigating it in my own pc.

I tried dumping with mtd_debug and nanddump and then writing it to another board
but I get ECC errors, surely I am doing something wrong.

Thanks and best regards,
Tomas Alvarez Vanoli
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
