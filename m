Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AA9C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 10:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhcMbrArfqrgf6qcZrX8YCBfXILpE6XnDizfcs2aWKQ=; b=E2HHwutD8qb9nl
	QYaS2BA729g9vLEH+tp5UU+zgIpgyujfdueZ66g9R2JlgoaUyJkMv3varYMT6Dve1OCgY4Xq2342B
	dZD/OW5ev2aqCuu0aDInlWLE5MfSV4yKOCTk2e4RsMXMg4ZEQXUyBJOhYlnyTOdrlFUX3KGGGEYMX
	3wAyV94xwFStjDv7pQMsARX07J8AtWBHDEA2GDQm2+cENqYrg59MTp2R1NiPG62z8JH5YsqBVHJJJ
	vWF1pmziaaIEbhbSPsxkMdhMvaUws0VrLawFBr1YT/ig0DWAmJ7fcCpZQH4fNQh0Vi8NvqpRngsbs
	r/1g7VjoEJ6TPy9QxIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhUTs-00D73J-VR; Thu, 21 Apr 2022 10:56:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhUTn-00D71u-7c
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 10:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650538567; x=1682074567;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=md5W+y9WetGSMIzbg7RHtPvqu+nJ/DOv/IHNXWBQgMM=;
 b=mKTE5Jnm4q/Jsaek0PuHvwDcV4gJG6IjKjXcdxGLWxfOlXCv+wEEJLmN
 TUWSOUY9pk0ht2c9ys3pa7WFo5hn0v7op3qXdH9TeQv608mJ3Y9bgC2oH
 rlRqrMa687pjS37SfpbWlqxGgbF5nnh9si296B5CeYHnFzRLtqEJQLKBn
 h4MaeYgi+IgQBscF1dhw6lnp9poimOZFacvgCXzcsZL49bk3em25OVfWm
 Xcj8cRivRuI9HcUjuAoxjolQH0v8LtilWEuJobbDEAZLopUHrwVUc45df
 hk8l89hwqO8kLT4HzFvXa6CixsH+H96z7LbTzTpDEx9HxwAp7X0jGar8+ g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="170410371"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 03:56:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 03:56:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Apr 2022 03:56:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUkFkBexpNYRUQTizj8Yr+A5OEG1oSOilMnMiHpw39WSVYF6GkSdks6tyRcmah7ZEN8WMeEmqfaGIpCq7QXVjClUIQtLnj63oChNMTQUN1buQNr18bcNRCZ22uynZsLESXA5wtFjwT7RfGPR6mQaIwt7UcBxm2+ff5IN6TfmS1PC1K5WpzFneffAR5GsdZ1ohgiWSDZSSGqBbPsu8caIYieYKHToP/gLFOHzXvBF3j8lwuV/9TL0yOPY/RIY3j8GR7GBihobmPgMiY+A3EEJhlnk8Z+IgwPoKrw2SQxfXZRu+2AH6m2CBfPPkJsctPkHP1ycA8BVy5bANX/1Asht5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md5W+y9WetGSMIzbg7RHtPvqu+nJ/DOv/IHNXWBQgMM=;
 b=Q/4u9XcNLNNtm/WYXV3u0yFdT5BB0LWMuZaypznIWjuOtjwPdx+W4WJ4EucypPYui8hoXxDPMVe8RBx9qGJ6CA88aGfMNYyp0x85CiNDBQMc3+mlMgJtSlj7qEHKwcJettUMJEHqOZ4adCzHJk49+HjkbitLV+5uMfP9bVcFl05LVy4y3XNDatpqYQKqVshrzl5gX+pRU0iGGxoBkJymLO9D3Ae1o4Z37yypK8HFI+PpHDfDFYIWAWN7pk3WiotbedMWFhPouFiKm8iOrqxofEPZPQzGcMwCmUaP4SrSlZ/N6WFwGhWqkpwHookDEWsZzFVXAI4jsucPvsPjHq0crg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md5W+y9WetGSMIzbg7RHtPvqu+nJ/DOv/IHNXWBQgMM=;
 b=T8qwVTSZtBQRHiF94R1OBih6hPe2SfnAMy4aMkBKofgl7cWjlZbwcvA3PlazJMMemmGlFEscLX3uK6MlxtIUWDSTX6uk47kPJwWNIZ5/C8jMoSglnV/Bwg432sSE8p0vTv2Z4kSLtRokTrV2T7IEHS1Ywshu90fIyjxtzyVMzsA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 10:56:01 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Thu, 21 Apr 2022
 10:56:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v13 2/4] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Thread-Topic: [PATCH v13 2/4] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Thread-Index: AQHYVWxPC1dIdG4rOEeRpjF1YXhMNw==
Date: Thu, 21 Apr 2022 10:56:01 +0000
Message-ID: <cd0599c2-6099-def1-3cfd-f70ae1545565@microchip.com>
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
 <2c04068f34e4dbd25da541062f5309b1d9878c22.1650532121.git.Takahiro.Kuwano@infineon.com>
 <fff074e7-07ca-0334-a6f4-f4c0d57577d8@microchip.com>
 <f96c55f6-8d27-57f2-892d-d4fd922bd2e4@gmail.com>
In-Reply-To: <f96c55f6-8d27-57f2-892d-d4fd922bd2e4@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76dd5b1d-7704-4e1d-ed1e-08da238585fd
x-ms-traffictypediagnostic: MN2PR11MB4533:EE_
x-microsoft-antispam-prvs: <MN2PR11MB4533080E60232BFDEF13537CF0F49@MN2PR11MB4533.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CUggXCvUtFGmbavTIjpV/4kdyNAXssZGrT3EZVnd43cJo0UvL1uv6l/QklQrgUzjbr9E+PlbUtU84+YX7criWNRs3NsM9gSl7eeoRzb8OmzxMdDiD0Zz2QT0xlPKi7++AT26NGuaowDAVhGsqj/VsZDrtUnoyxnU0B8Az8NZUm30jsfMLnT2VJiB4Ji2QguxUsbHtM/tjIB15q2n2gDYrMcuAUblIMj9XLbc2kF0Qu7zv1e5R6YBh/LoOsDtPLkQC5rxC8HAbAJtmQEmYmibPbvmjr0VNQLMDxuWGCQp8aOZzRX3yRq0ziiGkb9pnZ7FpaWV/p/HEsTWoo0GX5ioSPdYb4nueFjp/DevSiYTvq7F0sCRiXsBdtFcCCbnd0MKt5wWp5vfSc60yvW5+y7jTsKb3SD2oCMielq1ltd3YfB9/33PL+4vgFIkrrtPpEQ7d6aZ+vvCFovA+GBPiKs/luVB5Ba8IbfC4AVyhLi7sSSckF+ypkRxZXdwUNrsB9E6SoaMeSDVSBLRHU9PLdFF4zFxMqs5CwlBwVmg4C0LP2eWgAQptpVvvihGiRO4mnFUR5G0Oc8YwRFF34+/3/o507ZlSmF7U0yFHoOkSBaACfmRaOLRsY8S7zco+D8qXFoAgeI65o2EDwTLR1XIN1iRj+mCwcqbmglXTr+rkQqYmxxeqLu7FLtd9sjCmcKbWP8cYcf+4RGIV6LjQX53uSnjLjJAZNGTgUZDjAdtYrPudGUMi1hMaM3pky3+1ODyuaBB0Lob1Q66vvpEPuX/yHBIYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(4326008)(86362001)(122000001)(66476007)(316002)(186003)(36756003)(31686004)(54906003)(110136005)(6506007)(26005)(91956017)(71200400001)(66946007)(66556008)(31696002)(53546011)(8936002)(6512007)(8676002)(64756008)(5660300002)(66446008)(508600001)(6486002)(76116006)(2616005)(38100700002)(38070700005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1Y2K082U1psdHAwaXE2T3I1ay8xVThid1MwQit1Uy9nR1BNbWhYREVvN2li?=
 =?utf-8?B?MVRKY3ovVkgwckhlcUQ0Sk9TTzMxTzZCMWU3UitxL2ZxbkpqeHIyR3BhcWhk?=
 =?utf-8?B?MzBNOXR2MUpOMmtXWmZvOUJDcEg0b2FGTld2TWlscWNJSDNYR3lpRFNyS2dR?=
 =?utf-8?B?ZzZiNXBlSTlGSFhjV2N2WXFwemloZzNXOUt1aTFpUkdsczB3THEyRStPK3lL?=
 =?utf-8?B?RWFPMmNJN01SVGFtSVVtYSt5MDg3V3VhemtZN0ZtdUpDOXdjbC83NG9Edzli?=
 =?utf-8?B?WHIvMTNuWDN2STNwbEszeWZQbytUQ1NTdkk0R3dCbitNTTN3aVc4ZXFIbzMy?=
 =?utf-8?B?ZnZ6b3liZ2swcmwxY0hBamZpZXV2cW5TRW1BKzRjYzRHNTlYZ05nM2p1RWt1?=
 =?utf-8?B?S2RPWngrNHozdDhUVWp6ZmZMc3VNbDJPQTZ1bFVVdFVIOEY5dlFIVkE3VUVD?=
 =?utf-8?B?T3g2ZmI3bFdFYlNseWEzUHIyZFpMWTRBc2NZZjlLRU5hNXlnWVhRY04vOEZK?=
 =?utf-8?B?OVVGZWs5NFhwTnV4VHJlRURWU0tyeHV1Q1NreWROc01DaCtuR1VCanFWUzZt?=
 =?utf-8?B?REVnWm16ajZaWXVjYXpzdnA4L1ZVeFU0dVN4R3FiK2xKUGNQQzFPdGZRc1o5?=
 =?utf-8?B?VXBtK2tOeGN4TW03azBZTzV4RVIxV2lyOHBQT2JRcDV2dnZxN1pnalNweUVs?=
 =?utf-8?B?alJLYXJqQkVSM2hwRkxQNHBuVndXNWFUSk84WGh2aEg0NGRpc3k0cWFMbVZn?=
 =?utf-8?B?YjFCQThFWXp2bHRnMU5vTXNRNUtXL0hZWHNkUEQ1TTk0dEdpTUFiNEpFMUFx?=
 =?utf-8?B?bkhsNXRZcTVjU3oxWXNkNFVUZ0RpN21UTWlqeU5aWmNWRG1UN0s1eko1c050?=
 =?utf-8?B?STU5N25RQVA3dndwUVhvaERIa1FPcTY4K0NaNWpGMFZBanBNWjBlbzBiQjJJ?=
 =?utf-8?B?b1JyY0dkOGhORkh5ZDRxbEYyT25EUERiR251MUdubGN0cU1tM1FsTXpoRUl3?=
 =?utf-8?B?c1BXcXdBdEJZeURVeTEydUU4ZWU0QmdyZzlkOEo1T1FtcVRhQnVFWTFlV1Nj?=
 =?utf-8?B?SWE2TkFtSEZLS3p2cHhkcjhrYitGU3BhQnV0T2NVcEx4dnY4RGtzOXMwWnRK?=
 =?utf-8?B?ZVNpZGNkSlo2T1c1SVNDTVZ4MVZTd0dybTlmeUx6Y0hTbHN6TVVTTlFUT3cw?=
 =?utf-8?B?TjUvYXI1SEFzK0IxTnJYN080TG9CL1E2eUNnTGUwYjVYNmgybjdZTnU5R2NX?=
 =?utf-8?B?V0hzZGJDZzJWbWlsQTl0MWJFRS80aVhqRFphZ1FabHVEd3k3ZG9GNGJrd1pz?=
 =?utf-8?B?T29zcXN3ZU5lSGJzT09aQTArYVJIM3FCaFdkTVd5Nmp1Y1paakNLaTI2Q2Nh?=
 =?utf-8?B?OGlQYm0vamY3SFRjT2s5U1ZLamtqSm1JencwQ01YM2FLcVEyUDAxdkNNREY1?=
 =?utf-8?B?cTFUR25mK1FONS9XeStrQ2YySTJ5aklWQ1hBMkMyRTk1Qmhzcy9JaHdnT3gw?=
 =?utf-8?B?dERyLzFzdEtsNUN2MGRXVUY1UUdYcUhmVkZ1U3dubWVzeVpBTnRSWCswbjVI?=
 =?utf-8?B?Ky9ET1NRSkxJQTJqN0ZKakFURzlCK2cwYjBCTVBTRDd3MnRQWTNVdE9mQzZP?=
 =?utf-8?B?elROZG8rbGRDdi8wYkVBSlpDQVhxOVQrckR3RGp6S1R6UURZZ2g0SUlOL25V?=
 =?utf-8?B?SU1JdWQ1RnBhbnlESU9DaDhRQysvb2tjNFVjaEVxVXV3QktNcHovZVRENjZ1?=
 =?utf-8?B?YVVpRU45U0pFZ3U2TGduenFwbzZzcmc1b21KMUc0bG9KWWRzR2hVNWMyVTJZ?=
 =?utf-8?B?akJQTS9rcW9JenhJS3VyeVZiQVFoQ3hmZXF6OTVPODRRVFlEL0dNWTBQRVZE?=
 =?utf-8?B?K1cvcGREUFNJNHhLc1pGMDg5czBJdVpKazZxYXhnNWRldURnbHhKSUJJeVBP?=
 =?utf-8?B?OGJ3M2NHZzkxUEhzSHlvU1BNZE44aXdOdzU3ZVZ3d3NFTmNhV2xKUi8veGdM?=
 =?utf-8?B?YnVuOFdvUkZUbmxLdUZwN3pidUkvSkoyMUpxSTVDOXRsSWxvejc5TGF6SWZv?=
 =?utf-8?B?TTNwZEdZQ3RndFpaWFBYSDFZL0FEbVlZZ2hCVzhYTS9iU1dKRVpZZll3M1Rj?=
 =?utf-8?B?VHFUajlQb3FEdUdQcEdyZVJKaXEyYTNpQmlVcHV6VWpjQUVyam9IRGFsN2py?=
 =?utf-8?B?Tmk1ZGMwK1gyekZacjRoSVNOUlVLelc0dTM4eEdIZUZPZjh0cGNpbVJJNTBv?=
 =?utf-8?B?MVRHTFh4MUVibWJ4enpnVEpNcHcxdWZsa01GN2M4dzdMWGFNMTJpNzRqUDZq?=
 =?utf-8?B?dm43K3BnRVp0Y0hkaW12cTRXdCtFTE9WSERvY2p2SVVhWkhYS1pqWFRORGxu?=
 =?utf-8?Q?jDzX8rjinSBQ3nrA=3D?=
Content-ID: <D7EB576D0B487E4A9FAF199614933D9C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dd5b1d-7704-4e1d-ed1e-08da238585fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 10:56:01.1823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1/ZkPdwWPurUT1z6I5MkpZGOZA8ZtmW/ro4TSyUOmaiVoNUwuu4JzR8dJVg0H9rjRZd0hDGOyDvpb+MTtpWjKuY92DT51DGzYaBZdTdiAuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_035607_325562_60581D93 
X-CRM114-Status: GOOD (  14.15  )
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

On 4/21/22 13:47, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 4/21/2022 7:41 PM, Tudor.Ambarus@microchip.com wrote:
>> On 4/21/22 12:40, tkuw584924@gmail.com wrote:
> [...]
>>> +/**
>>> + * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
>>> + *                                      register.
>>> + * @nor:       pointer to a 'struct spi_nor'
>>> + *
>>> + * It is recommended to update volatile registers in the field application due
>>> + * to a risk of the non-volatile registers corruption by power interrupt. This
>>> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
>>> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
>>> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
>>> + * also set during Flash power-up.
>>> + *
>>> + * Return: 0 on success, -errno otherwise.
>>> + */
>>> +static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>>> +{
>>> +       struct spi_mem_op op;
>>> +       u8 cfr1v_written;
>>> +       int ret;
>>> +
>>> +       op = (struct spi_mem_op)
>>> +               CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR1V,
>> nor->addr_width is 3, isn't it? can we use nor->addr_width instead of 3, please?
>>
> No, at the time this method is called, nor->addr_width is set to 4 by
> spi_nor_set_addr_width().

I see. Allow me some time to re-read this.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
