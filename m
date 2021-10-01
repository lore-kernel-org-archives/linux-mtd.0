Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CCCC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 11:59:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DABA61A05
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 11:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DABA61A05
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRKv2dE3cKEzBZ4IzqSSGwvgBPSVkvOIf0e9naUHeU4=; b=WBQkJdLHG3wFw7
	q/JsdPBVX09M2jrgWUbzkMkloTRR5oMg4CSV9UpCi/isWGrzAwml1vIlLRp2WKsGeyJ6fwbtvKBDK
	QL8qcUMAV0srr3vUl/LKPH+hF+H+lorUd0NSnZdKwO5uLf4lK1y15M0ozkXf9w2S0UM5kHtE9kTOE
	vN3BC3W1GkwsofvJzMj8JNfXPYSznEt+5y/KWjbcRGlC+LizvIqfAeog52YclhoPbtJ281rAjwKfs
	SZpp0Vxr7eRY8H8j/zStI5T8KAY9E5XvVIck13G7RgP5EAH1IQKwHPLjKTs5qDzqB4i2W6bcYVr43
	YXRPVW3oIb/YFx1Yjh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWHBc-0003vB-Op; Fri, 01 Oct 2021 11:58:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWHBH-0003o0-DX; Fri, 01 Oct 2021 11:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633089503; x=1664625503;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Dj+Mq6I9zYy2XnaC1GqRMuDc99hGpGWkucsUeZJVdH8=;
 b=mNS085Kv2/MWtL0xKiy2HSrtL0qu6G2tlTrmpZDpX5dgzkPxu3l5zbCj
 a1EO33PvqBlMpT2j6ZvzyQ6cuhsLd/KzLyHdxtDQBUh4e8GrPRI3iEcYf
 ztU+E5j9nchr9w3AMjTri2s/38Njys/4iSplDp6RRzWdO0z18OJC+jd+J
 Hi0WNQiCi+pHAVZbODZ0aAcnlXWe5phAqAdKvH34/MpPzk85zkFFEbsSh
 GRnE0QCw9VtGWCuGzygq3pjf8tIo1nN+PmRvc7wzmERB1PSTmvElLrNNx
 4MCCLLkgSxbtimDAl2KyxbPuYPgzsdd0xH8axeIqy1PsAO2BDgT4VxWc3 w==;
IronPort-SDR: Naly3cbgsYZzbPIp2BByiOfUR+ubtAxng/QCQHBEy/bVKBh+MvIVQM7flOD8k6KREdKEwcGeoW
 b07tNAJjvM7ItGf3k+V5qId7zuegZBiTeArReOKfmESF53j0NKVLm3Q2uy83p1JBDO2rpgUsqb
 Eo3vCY9TXgHYGfLDimor3k3fSSuMEuIanhs8KPYGtxwqBfpPiqT8Kgld6614z9bPDnvUGn2FNM
 +j3fxKMDLTTR38EHJGAVwjWu8qH1eA+jQd0ddQawbs91Mbc3D3QcRKr3WRSqsGO0yte9ThuULu
 fkac13EZqhaRKSztnMwK2FKV
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="133924164"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2021 04:58:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 1 Oct 2021 04:58:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 1 Oct 2021 04:58:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k99cft0eilIiXC09BSXBBpqST/r3AfnizVXcsOaosulBkzTE15nBcH9fVtXAmlHxAgURGhWbabTH59bwbsUbBn3CvDehjYmOVb4NgVdtiGsMPLuIDG5Q2jyCDGXLLbe9fKluv/BqAOYkC1WGkLG7/9hf3VGXzF5xTJ5hlvZDWEYVLbuCpVX6NImh7TPb8dgS09Kid0pJizYxWpqnuiTBBcyEVvciUxi10JK30C3qa9c1ZdWdvgcnRnQ45f1ShVWK//ZB7TEU01RDFRuJZo7cwDS9ScZnrcJFPRJd5PW7sRw3tIkltXdAsq+vteVqZdZJJWipC8nVu/Y6O5IT1EwjlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dj+Mq6I9zYy2XnaC1GqRMuDc99hGpGWkucsUeZJVdH8=;
 b=d0QbHF6VUqr9frqQ45iXSmBCARobYlaAQqpzkx7lWY+efOKCZpCBHyvuGPNv7I9wLQ94xstiDhGrVxWoy5tDPzRdqenLuj70syP9NkCh8a7qwxWnsTbq6tm+/oasKGGEEzHBNQ7+WzDHBcE7hS7VeC4GSg6zAIheRoh7O4zwJQiAE757tesPYQwA8B1YD7jTKr1wGc5f8EYlCw+Cntzed1XsBiFJeJj+SzpEpVVMAdNsEbHCU1r8PAXZ8hPSZk6wQeabsjx1XqYCiqOb3EZZ5WEpS0Mi5ycmoTLEJlWRfpjMfvyd/5q0q0UO5Upqq55F+AcrE1LdNgMGsd1dIQYRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj+Mq6I9zYy2XnaC1GqRMuDc99hGpGWkucsUeZJVdH8=;
 b=aHyrxEoskHBEwMdPmSJdg/IMlCLAXBPMWKX0lg598+ZbWef5vreAAPC5vwwOhtw77DlR6Ymz9Xk1VwZyK6A1ePrNknQ8Y1VxzAUNOsMXtzSryX6nugSoITiQ2kcF2S0O3FUumM57ZsDze1Ks5P6xXvQHiMrXpptB6pg315zdKHg=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2622.namprd11.prod.outlook.com (2603:10b6:805:57::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 1 Oct
 2021 11:58:06 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 11:58:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
CC: <macromorgan@hotmail.com>, <vigneshr@ti.com>, <jaimeliao@mxic.com.tw>,
 <richard@nod.at>, <esben@geanix.com>, <linux@rasmusvillemoes.dk>,
 <knaerzche@gmail.com>, <Nicolas.Ferre@microchip.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <code@reto-schneider.ch>, <miquel.raynal@bootlin.com>,
 <heiko.thiery@gmail.com>, <sr@denx.de>, <mail@david-bauer.net>,
 <zhengxunli@mxic.com.tw>
Subject: Re: [PATCH v2 11/35] mtd: spi-nor: winbond: Use manufacturer
 late_init() for OTP ops
Thread-Topic: [PATCH v2 11/35] mtd: spi-nor: winbond: Use manufacturer
 late_init() for OTP ops
Thread-Index: AQHXtruXusMIpDqfEUSyG8aVPL5uAA==
Date: Fri, 1 Oct 2021 11:58:06 +0000
Message-ID: <88963f61-060f-9f74-9b4f-48d2754d24bc@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-12-tudor.ambarus@microchip.com>
 <20210816191744.k6ufbgrrwh6whhnc@ti.com>
 <a8e4b2d96b13c862e242e8009c7c6861@walle.cc>
In-Reply-To: <a8e4b2d96b13c862e242e8009c7c6861@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a182cf95-c5aa-40e5-f504-08d984d2badf
x-ms-traffictypediagnostic: SN6PR11MB2622:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2622A6F527B376330E84B87EF0AB9@SN6PR11MB2622.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 24yBifd7gaQeXGudbrNJrVK/jhVnUyMaGSV8Lgei1XR/2w0E9wZW3zZ0TQGA/YjKq/EVGvxf6HXfFPFwwPeqylPCLYfyUz+ildSQT2evsh6CrQeM1h0okh5nZuGMwKfE1B1LdmTatubkf2IvRPts7MwVgvPi3wDofSTvvUY1J59v9WoiNkUKf7SbNoc3OAn3p5w63mVYfjqTjixUmyLmwW7tCQIRlmkTFNC3tr5r47vjp4dbeXCNZxTUtwan5oWz1LAJFKcWj31xASXXa7UQSVezPgf8SviNgv7omPF5G53tR4HSo+N7tKpiE5/x1hOIgxalNbVJ0UXSjhIAFrg3p4Ofq7IlEQ/305NWzcxVwURgYCBnh2OVFrC4L0NQ9DUwvJRU9sbKEUDHmt4QcvpgZSzjFzu+5Tbdgld/VxIPZ56DwbWdWimhidgNq3/Zv84AorNAmgGI9+lpA8FJlIEfygqbGPL5Fv8q3NxqWN70oHTHhSP4rh5XsvGehOUmVH+Wjt6ThozWrNVxmEenBMgVEnujWfEXFCrHZ6TX7ykDykmthqD39RnRFp5Hm8xjX4EMZRa2qjUVltvgXnurDJm8Y86Z2pMoGh0+BA1hzOJUyyO0fhd+DaK/Z5FOFvePq3Tk1rXymtW0Fje2QwVCrhTGiN/IL1eXYqggZAqlIM112Up+KXkooKzD0WYv3bo/BR+XsU4dgGNtNG8y/EgmnEBJDofShaYmZy7e+s7ELzPdQ7G+H/RVWWP+DnAKPZ9kFyMUT3iXjXfiTNk8rMojWCwJ2cvar4Vb7gg3/jm9jPs/B+FSodS0H+R3646iNZe7ttgZneXK57bkPmMaq8p1VbhPaFZkydmz5SZcTXLgpC+EIls=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(316002)(4326008)(91956017)(76116006)(66556008)(64756008)(66446008)(110136005)(66476007)(508600001)(54906003)(7416002)(122000001)(86362001)(31696002)(53546011)(8676002)(6506007)(2616005)(6512007)(8936002)(26005)(31686004)(6486002)(36756003)(2906002)(186003)(966005)(71200400001)(66946007)(38100700002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzNJQm1KYzhtelozeDVSUlpmUUs3QnBSWmY1VEdYc2tVZ3llbkVVSUtyNUtH?=
 =?utf-8?B?VDVYNUNGVFVoWXRrSnVKUHFhQk4wODRSNjhsbGlmaHV4dFV1dE9YTEVnQnpT?=
 =?utf-8?B?K1NSeXk5UWJaUFM4UjI1N3dxa01Dc0N2dTAxM1JXWXg4cWlaeXhFdG93Tkdt?=
 =?utf-8?B?aWFCQ2U4MUNVQlVJSUNyM3V5Yk1XSS9iYzNDY0I5SG5ldHNyamtrUnFLTWhs?=
 =?utf-8?B?OXJLb1VndW1wK3liWkFvKzRvRXR0bEdYQXhCVDJyWm5ZWS82OEt1NTlVaHFO?=
 =?utf-8?B?WGJENHo0MHM0N24xUWpiOTVGRFBlRkMyNGEyOHl5WnFMWVBBZFpNK0kxOGxO?=
 =?utf-8?B?QmM0b3Y1dGlEWkJRQ3ZrRTBVUm5DQTBIbHlNTkZITGtja0I1ZDBGblkwdjlB?=
 =?utf-8?B?Nk8rSDhkRmVuVG1vTWR6VjZtVlEyL3FQT3Zhd1dpYk5CakczUkJEUDE1MEZr?=
 =?utf-8?B?LzNIMmdSalQ5dGtpOVZOUEQyZG1xclhkeW9ualBzS1RyUS9vbllRbjY4N3dQ?=
 =?utf-8?B?c2FPTjhIaTN3ZFRPRmdLSFVkMWl2YWoyYmpBWEZDbExsNk01VXFNd0RZcmdI?=
 =?utf-8?B?NEtoZXBNNVNWWEN2ZDhuejhHejFhR1M4aFhFRVhqMDFKTDArMStCVmpzelJF?=
 =?utf-8?B?d2tlb1VPNmx4M0NocGhVbVExTU0vQnEyYVBCVlhub0dYbDdtZGVoZE8zaFhO?=
 =?utf-8?B?UDFlVDQycVFXM0xrZEQ0dUJld2ZPZisxbStiSEpYbVpvTVdISm15N2NMemlz?=
 =?utf-8?B?NEN1Q1RUUnpURmtEZTdnOXRqK2d2eHl4RVVNWkgrSDM1SzFMZnJaS2REZzNJ?=
 =?utf-8?B?VWdOeDB4cmtTOXdtZGMrZEFFanJxRCtSS1FWbzBqUWE2U0JGakFtSHA4eitC?=
 =?utf-8?B?WnFOT3J2U0oveFY1MEIrL2N3bUIvb2NuTXVJcW8zTWZ1QlBPNkxTWmd2QXFt?=
 =?utf-8?B?ejZYQ0hMZlVhWmtjWXhhTVlSLzdEYXVYcXNZZlc5bUFYZDZmNkhySWdacVZF?=
 =?utf-8?B?b2dEeDgzMExlNUxyZ2JQZS9NTGZ0aW1iYjJaelR3UDJFNE1mcFRneGdKb05Z?=
 =?utf-8?B?L3pUcVRXVDFwM3NTUG91NzFqdGNiZHRpMzlEZXhpZzBBY0RlZTJNM2JSNXZ6?=
 =?utf-8?B?SzdDL2RpcUp6S3o4ZmZOVTYvV0swRzZWM1czNHhhS1h3dzNIaG90VGZIbU90?=
 =?utf-8?B?SE1vSDNPUlVrYlk1RE1FSEhaRHIwQVE3aHZlcy9VcHNkR3FYSTdJS3hKVVo3?=
 =?utf-8?B?R3VDQ3BHdVpETTJ6WVVFUjlld1dmNlhxalZvc3hXcmttRDFwZXdkQlJ2Z0ZB?=
 =?utf-8?B?RTdnZkJ0MzQvRFhTeUFHRkZnSHV3LzlWQThqRHkxbUk4elJmMmRpRDR0VWRE?=
 =?utf-8?B?RVRNdTEvSHBZcTJQYThUdFo2dUpVMm9zVGYvNm12T3FxeExUOFkyT3ZVdWw3?=
 =?utf-8?B?Z0RXY3V4MTFKL25XM0JYZHBKRVNRdExnRVNGMmcyUlVRMGdSQ2NDY2JsOUxx?=
 =?utf-8?B?OFlmNzVsbUlnTjVOcktMelVQZzdRd2FtTVVXbkx1aFhMbHRKai8ydU5lYXg3?=
 =?utf-8?B?Ti93K08zam5CZS9LUHZiNklPMmVMNjYvTXhUUVBsZEVCUXJROWNuTWRtWHl3?=
 =?utf-8?B?M3hTM2xxa25lUjAvazFsd3lJWTdBenUyQXMyM1k3N2dpQzVhaG9Ub1BGT1Q2?=
 =?utf-8?B?ZTZEVVR6NFhoWldrR0ZWcTl1cWhocUVwREFBU2xXVkd2TDFxK1QwekVEOGxI?=
 =?utf-8?Q?m1CBiHGUtSGuwZdMC0=3D?=
Content-ID: <3D1A68D3CFA038459495660254892FC5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a182cf95-c5aa-40e5-f504-08d984d2badf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 11:58:06.1997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9yX8ztxnybn3q14ff2kaSRTF0ku9Da1EJtG2vo9rSePiJEOFTZbDXnpkdOTXukapWQaJTdSkUz/rFG7/B6ZzTaABilmh/8/drsIFL6xoVMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_045823_573402_874EF0D5 
X-CRM114-Status: GOOD (  14.04  )
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

On 9/10/21 12:50 AM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2021-08-16 21:17, schrieb Pratyush Yadav:
>> On 27/07/21 07:51AM, Tudor Ambarus wrote:
>>> OTP info is not yet discoverable via SFDP, use late_init() to init
>>> the OTP ops.
>>
>> What do you mean by the "yet"? Does it mean that OTP info is planned to
>> be added to the next SFDP version? Or does it mean that it is possible
>> to discover it via SFDP but we just don't support it yet?
> 
> I've seen a bit (again in the XTX SFDP) which indicates it supports
> OTP. But thats all. It doesn't mention _how_ you can actually use it.
> And there are at least two different variants.
> 

I've checked JEDEC Standard No. 216D.01, there are some OTP bits, but no
OTP memory as we handle in SPI NOR.

https://datasheet.lcsc.com/szlcsc/2005251034_XTX-XT25F128BSSIGT_C558844.pdf, Table 5, pg. 60
mentions something about Secured OTP, but that is a vendor table, we're good
for now.

cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
