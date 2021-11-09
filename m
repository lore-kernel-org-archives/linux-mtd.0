Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39818C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:36:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05BA96115A
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05BA96115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9yrv4Rlpc5hR5CQ1RMTcVHKkbrFhCbf8HLyZ5X/Qx4=; b=avYCLpkhn2MTwI
	s130PMQGB+qSW9Uj0ORcQW157ha16nV6zdaa2SIyZAi5ALyaFfpmV0JpQgzJNHy+Mt1VAamGZpQNZ
	sePFSOF3otnZNsgjaxfIQL0b0hloziZUVq7QhRw8asEAq4x1GjS2PkGiva+c+LDqsidhK1Nm0fYTv
	3Dzcd74/HZBiYKzdlxnyWwl0YsICltu6wCd6iKtifCJHUaTwrE7AR0k3xJ3WiXMypjAUJvyz2s2UT
	9UJIKyS3UvKFU1RHUrofCniKiGIZUm6iuZ2AozRCLNoQmSDqXIFRrR4mIgpq7sAu/Z4EhgSD9qiQ/
	SR+inBCwflEroIClEnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMbr-0012NZ-HN; Tue, 09 Nov 2021 08:36:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMae-00120g-28; Tue, 09 Nov 2021 08:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636446887; x=1667982887;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YOQEb30t4ffom0QyYpK9ukGEfLncghPoVj5Ejo1pSCY=;
 b=PX3Mn+goY5iUaBV9etwbDZ3xHrmth/4z0b9QAovgKR9ZWu97gdVYG5V4
 pid6/UvXi8Em7gnNAccKAJ4Cbs+9+ZqHKpobBXSx2gfNjo6r7CxUWY17O
 Q65Lar5EmaWnFdUWmohHEuh/LmJz1cV1bSVLBoZnvkAI4FjOQuruGd1RN
 GH5I2z1SJh7u4l/ic11J/rJVSHRJcyoyiA0ZGjbG9HwntmOAuwwIkECYe
 KaWyKWmS+/sppVSo1xu7tzJ5ZCAvnqkZDSAC4mVlLUBKER/19TfrDw0+K
 9LWfuuTt+9Y/GnB8kkI6zsWsTQp/0eIvIixpjGuDtBA6Rnfft1U9VzV02 w==;
IronPort-SDR: qmjUkaqo3gzJnK8qSHELv2msBc+2kLMeVdUcQgYCuKG8bY+zr6s2xvCx3gDCRbgScTAjLvh0YL
 IFylJf2HV2/1a31e9qUR5jIJJ4CaN5DreHtBI5ExOiLm8iFsvxcHaYdgquvPrEioYoWdocGblA
 oMJlVarWvxlQgDuR7iA33IKnbl4AgUxA6v1lELAvEbaE4mEm4ogaMDVVzgJ8cMqdeZbv0Af7VB
 NVTLsiJX8qq094TGdKHhg562dGxzN4DZ9BqGddWUBdM+4+Yus32sFKgscYjC1QEyNAztzmeR1C
 8sF0RIdh5UdjezdihAOICOxy
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="135945723"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Nov 2021 01:34:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 01:34:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Tue, 9 Nov 2021 01:34:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpN1xiHYEPJlfZraofvq0xWG+QlnEwYdvgREQYQxeS2f25MDOASJu4EAlWD8biVkB+553MPlKyNaub6OFETG1lcmS9B7NcDfEUSSwmXYcmbr0WHqtqZJb60wO2O+xFHCXB8AoCL31fd2uEkJVZxDPRzsLhNFmjGHjdZHLzlPdHG0sjlJS6DTauGu+3D69r6hgZqxvBa3H11dPRExU+7uC/m7h8MHiRb8aq0D296EIuUBqCYcZn8bU8wDORTIdLiZjF8Mi6uUQP7T8zFAvpAdx83R8A1jm1qcYO9kjz+fuqlyvXcMCrKeTYjugF12Z2JS9jkDGZLVM01PbHKoCj4cFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOQEb30t4ffom0QyYpK9ukGEfLncghPoVj5Ejo1pSCY=;
 b=VeKxUmjbld4MokVO28szrdy2Djjgu40OG1WXI5k+seW0Nto7lzXWLKbOCFAMYuFX9+/Xu1MawhJD81ns7kFYJat1+mYpzVjIJul3WGcZxjddPSQ/bHKG63HHjUYzWEE/UDB539ooGvkGsRHA0u5rh6DcR/1mmN4fUlSH1nvzck+ps53lBzc6w9jRrGBk9V0phFcTzvd6c9GUzcYCM//tk1IIixfYzCbQ6T73Dlz5exgqNhah5/uK3OJV3pcZYRd1K69yeErsHW4+GCfQYP/LpobY7JudDbAYngcR0Cusigqti72uQ1ELg3mCLlsnEgveavcqQUwz/1b1LoIBAtZdiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOQEb30t4ffom0QyYpK9ukGEfLncghPoVj5Ejo1pSCY=;
 b=XhvpnIyGn6WcGrjHxaaA5PCVE9Rgwmi2VUTH8yVX9O2riZvY4T/xmTg9CO7ez+ijEWa55YCyCsZXzaFNmYh/Z//QKOekHth02Lwyd0mp1Rc8flNfME9HOmFH3WsOuMBCTWUuBHcvTL4axodTyE0QhZ3e4/Kk9BYGikybm9s7de0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2637.namprd11.prod.outlook.com (2603:10b6:805:54::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 9 Nov
 2021 08:34:41 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 08:34:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 04/25] mtd: spi-nor: Get rid of nor->page_size
Thread-Topic: [PATCH v3 04/25] mtd: spi-nor: Get rid of nor->page_size
Thread-Index: AQHX1USjcWtk5wHljkuukYdm70IMxg==
Date: Tue, 9 Nov 2021 08:34:41 +0000
Message-ID: <76238a64-1e8d-9e12-7fdb-1633b4ae3db4@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-5-tudor.ambarus@microchip.com>
 <37626e9222304eb463808a58199f0cfe@walle.cc>
In-Reply-To: <37626e9222304eb463808a58199f0cfe@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 459e64ee-8647-4bd6-ee8f-08d9a35bc627
x-ms-traffictypediagnostic: SN6PR11MB2637:
x-microsoft-antispam-prvs: <SN6PR11MB2637483F6631B14613CE86C8F0929@SN6PR11MB2637.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /r21DyWb2+z30XIspjxJJKYM6zA8le6Ms/QCv7bH/rRrhrwR8QTMjS+Vkz71AtJArDgTYvAFFa55FnCrcVb9VPSjuFAcrDhPRXR2FJ0YwuNc2MGnrUZfoLkVBOAON0VY11L1hxADoe5QLj2n/8cuSQuI1VVKDLLijluBGYsSnPKZjHfsdvOGjKQu/9xpQzypuheDvWX0nyE1N6dwt4XinfS1w9jHBlu3x72HrTbEBnStgdIeXRdSCeWaozMFX/RJFWDSwq02xcY8cL+mDfV8Vwov/kLM+PrOwHQ2+H4EKApzmYQwUQRBsnusSWrRokDu6sDhCuwoStnj1+vnf8m4JYcvPKH6Anb9prG8304d8uiuMo0mXq5hmhcvke+PVGtqqF2Ob3DIX/53Oh2a/Va4xLbGYSGpYHK/tSEHMdLoT+GSRY8iUPkVWD62t6joKnUh5SIlItCqYO1Xk1YH0q4PJUNiB3C34Ev4g4C0QfHQfpSjBztbieHeuiJqq5oDMsC7W3U0gNfDBvLcVoEASbnYLoMRtrVYjPu3WJkG2JdjK6CsuzQXqyC/KvbrKFxqD+7OEDq1UwrKrt7rmIArc+GLI/RXhYp4KlWAN+XPmZ5q1O1EVhSUNr12YL+Ce7TSbCixzzkZzWk0RTd+aZYizy4ovakaROFHEiQ17WWbkIg5d1gdOSdLYg01E+12BNpsEnH+RnsEnebvtO5BZm5HqbCk3HXOW3k+AEy3MiabrjLlPsBGS1imLvt86bGhTGDpm8gElHG+ofJvlWgvqOKGPwuaSWcA//WE1tYwzyVbH4RJsiU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(38100700002)(4001150100001)(5660300002)(4326008)(71200400001)(8936002)(31696002)(91956017)(83380400001)(4744005)(66946007)(122000001)(6916009)(53546011)(38070700005)(186003)(54906003)(31686004)(36756003)(2906002)(76116006)(66476007)(508600001)(2616005)(26005)(6506007)(8676002)(107886003)(66446008)(6486002)(86362001)(316002)(64756008)(7416002)(66556008)(26583001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3l3am01Vnl1MWYwV1NrVU9XQkozV3RaejRpUnhRWGRtaUFzbVhJUGJtaVQy?=
 =?utf-8?B?Sk1ldW1KZ3JybG9Gb05Xd1BZdDBxSkpPaytzWEpjSlIxOEltSVhSYjFtYlVk?=
 =?utf-8?B?UVVDcWU5TzdFSjN1NFh1OWtDcEg4N2xGOXJlLzdNRVlndFFGOUFHYzJwNWtv?=
 =?utf-8?B?eDVzLy8zWWNGOS9TejBLbHRiaVpwdEZJaEs2bVpqRDlWc0dFWlRibXczMFFp?=
 =?utf-8?B?VnQ2cFdMOEpIT3lvUnNuRCtpbHlYbm84eGZQS2FwSkl4eWVaQmFMZWptRkpG?=
 =?utf-8?B?Y25HUVBMTjJ1MS8rMXRHakp2ZnRVUWJZQjRSc2x1aDFOemtxQkJORm1HQTFH?=
 =?utf-8?B?RUNadkEyeWpESDN0TjB2RS9DRHJubWRSTXhZNjRMY2cwYTRjcExUZExvaXBN?=
 =?utf-8?B?TGU4T3lYajU1RUEyczdvLzIwY0gvVGhCV0hrUzRZQzFlbUxyZnVIaWI2L29t?=
 =?utf-8?B?NUo0VE9kUE5MZ09JMTlRK0NoM2d4bThOVzBSOXY3WlRjLzJ3TDB3bVo3QnpL?=
 =?utf-8?B?SlN6YU92WW16VUN3TkpQTDJ1bEY1UHVaOEpGY3dSSVUwTklBVG1PRGpwZ1h0?=
 =?utf-8?B?MUU2SHlaTUpvK1p1UjVyS3VxYTgrZEVuYlBhSm9VWWlJYy9MY2E1ZnNhcm5u?=
 =?utf-8?B?bGQ0Uk5JMG9qTW96aXJMS0dHM0gxVCswaFJzT0ovSWFzWnB1QkhMbWd1MklX?=
 =?utf-8?B?UDdtZjZPNGRja2pESm01NmtMSEZ5ckd2YkZRVlRjOHNvdkhFQ2xybk5ldVZl?=
 =?utf-8?B?aWY4ems5Sk4zdDUvTklSazViSitrSUZPWW5ETjBxRXhqV0RPbTZPTjdZTk55?=
 =?utf-8?B?d1BXQkVTNkJjWWIwdGhveHgzN1JNRER1ellRRllYUGpHNnN5N21qcjVZb1Ra?=
 =?utf-8?B?M3RJaGcyZ0puRERPYzFwOGFJanBjUWRhK29DUld4L1dGZk5rVEp2WDR2c0RZ?=
 =?utf-8?B?dG5SRGRjOXBqemhUQm1rMWtKeG5KcGJ2c1I2OUZIa1FnUU1VRDhiK3U1VlM5?=
 =?utf-8?B?RUYwdmdEVEwwQUNYa3dJQVFPQTFOdVlTQk9hSWwvemsyWEsyOHNHK2Q2L2Fp?=
 =?utf-8?B?SzdFWUFnRDBkOWU0aVpOMVJXczRjRFF6Q2tob25PcWgwb280TUYrUElBcThH?=
 =?utf-8?B?N291ZjQyTUVlano2N2dtTnBFT3MyK3J2QVVMbkwvTzF5R2pCS0h3ai95YWVW?=
 =?utf-8?B?dlgyRllxNlRlNnU0b0JTZ21maTB5TEhXaWdIVER5WHVpVjVYUjN6a2ErRnM0?=
 =?utf-8?B?SzJxc3VmQWpZQVRXYkRmOVc0Ym1FQmhqalZkZWk5aHdBakt3TmNpeTdaN3Ni?=
 =?utf-8?B?Z3l0ZVpTN1krUWpXQjJCUnpTV3Q4akR3QTVDSnQxZnVwZldNMmV0cW9LUVJQ?=
 =?utf-8?B?bWM1QkJ4ME9EUWQxem9HTTdtTjY1ek1lL3d0UGRLem9CS3E4U2sva3FEQkVV?=
 =?utf-8?B?RktGdzlab0cxZmU3UkUveitTMWV1ekpwUEZGY2puWDJEYXRCRzBCWTVBdkFC?=
 =?utf-8?B?blgwWTVaL095NFpyem1BR2FFbWc1WlFLaFAyUVhCQzlhbkZBY1phRXFpSGI3?=
 =?utf-8?B?TnRKZjdMZC9oVEYzQ2IzcFppQXJ1cG5ieHd6YTAyZng4MEs4SFVPU0t6aHky?=
 =?utf-8?B?dVdMNHY2SFRhamF6Z2ZFZ3FDNGsrbG0rL2ppaXBQY2xNM3lMc2ttdXBnUXIv?=
 =?utf-8?B?aHdaeU82NTY2R056aTM2S21RUnlGNkZ2WEh2dDdHRmdQSjNXRmsrS3JGZDlG?=
 =?utf-8?B?UFVXc3BIZzZoWk5mV29VekVIWEFnc0dhZmNibXFyV2xaM2NpZ2RZUTNTem1a?=
 =?utf-8?B?M1Y0ZGp3dHFaREdhblVGZGVHTnMvblpnRnlnZEc3TU1jV1pBNVNTTC84TGtX?=
 =?utf-8?B?VTZLTkgyd2p2djFEd2lwT0R6UkJtR2RybGFiWDBGUmhwOGJydzRrMTBlU2V1?=
 =?utf-8?B?RGh0ckhnYXI1ejdSRW90VG8xY256bzErRzRJaG1QQkp0Wlh4cmpOTXlFb25t?=
 =?utf-8?B?MFJSNTB2ZHpMSUljZFMyWUtqbk9MVU1RTjBNT240TGxKZTZMSmxYRTBkOURo?=
 =?utf-8?B?NDFhYTdMSVFWQ1g4WFdzRld0eHlPMENEd0pSS291aEZwZzFVc2VGOWhGYUJo?=
 =?utf-8?B?NTREZlRFdnhZbytiZXFuMkxlV2hUMExLL2QvOHkwSnBvQngzcFZrenVkRFdl?=
 =?utf-8?B?SGdDUHV4aFhnS0dyUjU0U3FURVNqV2lHYnFzaU9pY3JuVTU3WGpjNDlZZnU5?=
 =?utf-8?B?dUpyS3RpSGd2dS9MWFZWNUtjUXVnPT0=?=
Content-ID: <71D0A5A32310E34780EF871D47B499E4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459e64ee-8647-4bd6-ee8f-08d9a35bc627
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 08:34:41.0736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5PZmkNoqun6liFHBf9t5XWGQ4dVTPRY1n3zfXIypQNTqFW/235i3McPE7ThneFPwpgOEu/c75+AUIX5ScWlrO9e+SrPys53zqKEe1qt/UQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2637
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_003448_210499_16904A71 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/9/21 10:24 AM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2021-10-29 19:26, schrieb Tudor Ambarus:
>> nor->page_size duplicated what nor->params->page_size indicates
>> for no good reason. page_size is a flash parameter of fixed value
>> and it is better suited to be found in nor->params->page_size.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> 
> IIRC this patch already had my:

You're right, sorry. Next time I'll download the patches
from ml, to get the tags automatically.

> Reviewed-by: Michael Walle <michael@walle.cc>
Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
