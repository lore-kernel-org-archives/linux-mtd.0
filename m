Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD32C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itTfBTNSxbPbxsT3TNy2IZr+/HgPWR8LQbEzHtxTd28=; b=OQFUiFCsLyvdMy
	Ag/DbfInrO2H/vDe+FItSwj/GuthChkwA72F7A9b5Ue396gkWbCyiw8i2YKHi//WvrXphqY6Rq/c4
	Jh4DOmOV1R8bQ4CNcrlQyd3aL2TMQBa8sjBIBgUxGdocq9MTi07T3UOZDjUSmDHj62mIwy+1jF//L
	x4TbWIzSBHY/wBpOMxAeYBpZ3nBXASHHXAOBkGmtBU2TfHbxEmf+ItsvKRT+D0kRe+g6h7SIZ4DMC
	asVord73SDEdXqPI3B45cfV/l5ERpjeJeaJ1oDUg44IQD3HwV71pEucfftBeqTm6qrm8wV8AFKcVD
	wrJBcfBIfY4xE5dfddyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muEPp-0045mS-AA; Mon, 06 Dec 2021 13:52:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muEPm-0045lF-S8; Mon, 06 Dec 2021 13:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638798742; x=1670334742;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=d2y+lwhhqBOeKCd1rdEjTEVxgZwCXlsvWynU3SC0yMo=;
 b=tDAnsJNkU7oseMTppWL2Uq74rnJh46IGcQs+djAU1UF5oOoOZ2hsADYy
 zubvSJan0gY7Hpm2mBErVPuFmbLHvr0I+rcdtCfLxY3j2sE5V/7PeP6d9
 Bbv6VR2ovkxTIIJna73/RCd4LkGYxMQL5e2wUaHPW8XtWMnibsfYdz9Jj
 VsLtMJEQugSNuDPj+dNcwmRuWcGIlQ9bkVGjduGxIcdGkzze2wijwgN60
 m6wnr/Qsvvra83IIWsF6jQyLKpcW/RSJZ3CdY/C9tWrUNndsbABG3eptG
 D4vT4KvYTTTL1p75+ETN03027kDcVef+sBgQ+TEC99bRkBku9LWGsSww1 w==;
IronPort-SDR: IOhSrYcLCyR6E4/4hff5NhIMTEcLlio4fLUxJLHvh1nN2tJawNOoQZQtF1EfQP2xGSySzF7iBw
 tIRPeIrck6aAzBFGXqQxGDAX5t70UY023Ee14U2JiQzE1CqDhEUmeOKg8rS4iQB7EFtl75Vs7A
 QmL6rR2CMXzPcDEg2UphiNTyr7d16lPcqaQZGts5JHyXkIcZTZ8dZGtp6bn9/wstMm8kNwv7yQ
 c+gl6dmoxF5N35uCiY+4EwUySOYCnxHjPYHJHzo9TNHDy8V5PXmX6XnAImBFZ+Ex3AZzizYrv/
 HfEiHPZxUa7Ltd5HsUqsdRh2
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; d="scan'208";a="154392457"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Dec 2021 06:52:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 6 Dec 2021 06:52:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Mon, 6 Dec 2021 06:52:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYB0o8cJ3NyaogiCTM9q9I+58Ax5mezkq01QlpRJMMH6wRkpr5EYZMwnaHz1lXtOvLU/PI55GihWFVtvaofNzDb1wueyO8lJg0BAO2c0jn3884XQz+RwYvVKa08XxSbr+kUo1BXRM2Beok3gliS12MrJrHiaBNHJ4oFrs1HUKcRvf+NAW0j7eh5aP0sS4C/KTkTJnd8RxgVi0Ui5yDUa6q8NhsHDA3jsro1TkQMp+P9x1E7HWApsjenrNi7v+1BLkWCL/bJzwiT0rO15roheJKK4V1K2qSJ5tvG9EeVwRyxmNEN/c4cW8z1KaujyIEBzUNsoWaYmJWGR4bZcIIEUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2y+lwhhqBOeKCd1rdEjTEVxgZwCXlsvWynU3SC0yMo=;
 b=mXt7j8SQIkUuaiTCF3euB3Ni4E6rVzybI5nRKJPpsDQR43FR9Tw7BBDTkQCfa7hRO46cGLDXm0eL6k9NTJKuLs7x1C+zQWgnLYEnmAfdYoKjL65G+jln4NNcbrUy0RqlghecMtVAurnbSrUX5qpZMyfuCxvMuV2PIHWgR0lB0NimBOhffJsiiokdkSa01RcdeRoPjl63xZ/D3I0rHZ1hjN8etRcKeJuuQG/khXO5SCoeHV9yLcb7lts4AHBWXvUrJrm1yx1mvCXZ05F3vPjPS2aoDAt6OCEAbEz1xP4v2J2h3FWIGMya448/S3b14zb3CvtUs75hPhWCP8tuDJZiEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2y+lwhhqBOeKCd1rdEjTEVxgZwCXlsvWynU3SC0yMo=;
 b=uyF0+3bTR+5SgwrMy7nLVW9bJQO3Smfx947xNc4XwEcbtt5/TU806N2bhHCI8LPqUyDEXBBdO6BzbCeAMNiO7g4UyIapnbvhaXiImzIvxaSaHmNW14FCUWBxA8C2R2rRwJh7w9EcxuJD1L3VnJNP6OgqP/XF0965GwKNTdkLJlQ=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2879.namprd11.prod.outlook.com (2603:10b6:805:5c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 13:52:18 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:52:18 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v5 09/14] mtd: spi-nor: core: Init all flash parameters
 based on SFDP where possible
Thread-Topic: [PATCH v5 09/14] mtd: spi-nor: core: Init all flash parameters
 based on SFDP where possible
Thread-Index: AQHX6qh7PsBA/Xc6AE2iIsXKFl9vfA==
Date: Mon, 6 Dec 2021 13:52:18 +0000
Message-ID: <57890ba8-c0f8-b50a-7126-d74b92537f2e@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
 <20211203142256.47370-10-tudor.ambarus@microchip.com>
 <20211206122244.in6pzwjnxxo7yd32@ti.com>
In-Reply-To: <20211206122244.in6pzwjnxxo7yd32@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de7c925f-81d7-4a5c-f93e-08d9b8bf9e42
x-ms-traffictypediagnostic: SN6PR11MB2879:EE_
x-microsoft-antispam-prvs: <SN6PR11MB2879BF5C040F64F12E31BF2EF06D9@SN6PR11MB2879.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: POwXIvcIJFfF2kEeqT+2laqvrHuFi8d/R+cqrso3ZSveW8JnmnmURwA+P0vOBT6cPXslZclhYwRWHn+r9H2gdmRTrT+mAuROoxcLvlSGBoxQ6OAPxWx7dL5SbPz9aYFeEUvgZEVWI8h571XI9bNnXBtl9rj7mNPVrcFg5+9Zmj2r687BTBB7YDHUJa/hNtHawbWOrQDUyDRMj595ecDd7p/fc/CvQytFaDXv5sg2C4WPZ5fhbNgXMBmW04vXKEsSvclmiv1IKjwOmD9PyKcTggmbUDZQCVg/B7+Hu5rpnlniXPKfS/fDeTXLiyLfq2ZQ1o9BpWW1L0FFUHN9Tkka1G7RSlSdbSp8WtRXeoC8LbBrSrq9DYyZAx27T/qIuW9u1R4gz1rwOESi3Wry5R7PrXYwi4OHcAYLFAUdLcBbNCpNbSVt13AeJwztBuNgJwqcMD5TLX90C8M1xOa1RUnucTAIrIZJaD4MZoMFiYLL3ZJwfU+32PW++Kgew/pSxXwD3QY4KI4FMXqdTstJAzWLvgda3ewytCE0e98p83YwtN09xpJh97VrwE4MyPmPtPBhPs8gcPS9UmvE6vPOy8bNQZCwDCX1aeuXeeksnt4lkwXfAa5I3Lkhme/FL8/+Toh1gUv2QoSAL2wsdmDWCjpnSm5z6erlJev4ztjCan1MlSR989BUhzhkRo701MTaFTDt7XXDTb9bP3bNJWssxjdmklwQIWmoEAB044HiwrRrVXbsKboKwFVAlBjYOCXOCtaAQmZMTcNR6cIuGVQbAw6qqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(122000001)(6506007)(4326008)(6486002)(71200400001)(5660300002)(26005)(186003)(36756003)(6916009)(7416002)(31696002)(2616005)(53546011)(83380400001)(8676002)(31686004)(91956017)(66946007)(316002)(6512007)(66446008)(54906003)(66476007)(8936002)(64756008)(38070700005)(66556008)(86362001)(107886003)(508600001)(2906002)(76116006)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkEybG5ZM1VjOWh2REJhNE5tdlhYaXlDYTA2MWxqQytJRFNmSEJEdXlvK2F4?=
 =?utf-8?B?cll4SVFEelhqeHNVRlR2VzBYWkVWcHJIRHAwVHVlN1BtQThMcXRXS21PY3d6?=
 =?utf-8?B?ZUZtcU1nSUxSakV0QzUxQzdlSGNBU2RSM2oxd0VjZU1ObGp4VGxVb0NKOHB1?=
 =?utf-8?B?WVp1YVFjc3paYmExeEFaUENPRnVDVjN2anQ3V3lXZXRlNEdYN0o1aDQvVm9s?=
 =?utf-8?B?dkpRcm5UVWlnYmxZWG9rRzV0bDhqbWRGYmRSeG5BdEp6SHQ5cGtwaFczN3R5?=
 =?utf-8?B?dEFhbFRIUDl4OVI5M3o2OEhabndlMllTYnpOdWJ2L0F5ZUNyUXlycDBtaE9i?=
 =?utf-8?B?R2pYb0tZRktqOFpaU1QzSHJrUU1XM3p0WGY2cU14dUpYeWFSYXVOZjB2ZnpX?=
 =?utf-8?B?UCtKbUZobEhaWk02K25RZlFIR28rS09mQlJzdDcybUd1bWlFMnYrS3JLOC85?=
 =?utf-8?B?cDIycG1haTBOVXZNeWMvNHlBbDRTWUN6eEFuWnFpM1ZQVWlnUHBZM2UyU0tp?=
 =?utf-8?B?ZnJXRnpaRUhrbFA0Wldac0RsbWdVU3ZseUdRbTVQaWx0ZmJKM3BMTTl0d2w1?=
 =?utf-8?B?ZCtpbHJ4SU1kcUp1cldOMVoxZVVlT0V5b21VK3ZmemN5bG5tU2ZVcmxUM3BG?=
 =?utf-8?B?aGIrNXBUTkFXZTJjcTg5ekRsZkVacEJCOWtPRWdWL2FtRGFMRk5pWThZZlQy?=
 =?utf-8?B?Wi9hTjdJL2IwZ3M4RTBCcjJIa1VBbGsrdXVVV21qS0JJdUs4MHM2ZGZxS3Y2?=
 =?utf-8?B?cVlyYW9rc1JaR2c5UHczbHNIblFSVnlvV2FCa01nZjZoYncvaE5BTFRRNzBy?=
 =?utf-8?B?S2R6OE50UWpUYm8xdXp6NTBYZ1FEcm9kZ2I4YXZRNEZ3NGRCQ0ZWWTFDazYr?=
 =?utf-8?B?eFNYRk8rTm0xUFdwR2o0eEFMakE5RmtOckJpNjhnZzFscWJOQStVVWJVVE84?=
 =?utf-8?B?eW1Iay9MYWl3dUc0UFJKZGI2eXJaM0JNcS9Xdzd6Skl0SjJtWHd3NGpmKytz?=
 =?utf-8?B?Vm10V0RGRjk5RFNpdUJWRVBoKzJuQXdEQktUT2pzb1FoaFJ3d3E1STc0UnpB?=
 =?utf-8?B?S2hDNm5aWm4xL2FFVlo2cnNjVitmTUc2bTJOWkgzR20vblJWS0srd1Rsb1Yy?=
 =?utf-8?B?WXF1OFFSZHFJa0RaWGdDZGY4ditSWFFlSFR3N25VSS8vYk9JdHFuN054bkYy?=
 =?utf-8?B?aHRuZEg1WTN3SjFnb3QyMEZpNWErQUdibTRaU21qSmx4RVJiS0NaNzVBM1Vr?=
 =?utf-8?B?M1BEM1NEWS9hTVYyUjl0MWlIc0FhcHhwZnBtMHg4NTFvei9UWFAxSFg4THFo?=
 =?utf-8?B?Q1p1M0lOOUJHNldCOGpWc2V6UU1IUFpQMG5uQk03SVJHdy9DMHNkNnlWaDdz?=
 =?utf-8?B?N0xwcUI0UnpjQk5GWk96TEdSSFd3QitvZWllS2RRNXZlak5idGNINFcrLzNk?=
 =?utf-8?B?U3IycGxkRHd4VzVKdXFxcHhKcjVJSTRBUk1TYmlwQ0VqR2R2OFdQTUhQbkRP?=
 =?utf-8?B?ZUEvVW1kNGdxSlErUjZobGJIai9vcTBMQUJITVU4Zm1Ca2d2WGl4MUlzSG5z?=
 =?utf-8?B?MGNVVmhIU0FKS05vajdhbHBpcXIzeWpEbHlmSzIzZ0xxbGRGdHNtcm9tdmtE?=
 =?utf-8?B?REpwdUlncVJENWZES0JIdkhaK0M2VTlOZFdQUllhUWkyT0gzeTVzOXdWM2xX?=
 =?utf-8?B?NlZQRUpoRGRhb2crU1Eyd0xYREFIT3l0RDByQ1dKVU1xemk1allNd1Jlc3ls?=
 =?utf-8?B?d3MzRUthR2tuTGc1MGpXbzBDWjR1OElBZWdsN3FJNjU0WmRjakNQZi9sbHYr?=
 =?utf-8?B?QWNhWGdEaTVrcittUlNRV0VsL1M4OVJLSmJUdTczNTFUOHFKV3ZsSkJlNm1X?=
 =?utf-8?B?RTNBdjVMZWxLVHdtZTN2VWVkNzdCbjRoMTVRYUhYWm4zRXByU1FIdlNBazQ1?=
 =?utf-8?B?SmdHaGxkNWNzRllyYU1rcW9SellveXFwY3lBd0xHeitLYWJyQmtuejA4ZG9y?=
 =?utf-8?B?THJyN2UwTFBQbnR1akJPM3NPMUtMNEd3ZjdQYjBjSDhOb1BYOHdZN3dtSnNv?=
 =?utf-8?B?WlFpUHF1MGR1RG9pTm8zeVUvdm9RaE9YdVp4V1NFV2Z2UlpPckdPdjlISTVI?=
 =?utf-8?B?MkhqdDVKLzFyL3EvZmxOd2UrSGUxRTdiUkRyVUJWUUtKU0hJaFpOdTgwMW9w?=
 =?utf-8?B?Ry9SRHpMcUhUcklsUzVwQmx6c1l1RzFScDNaQmswNHJnejQzWVRHU2hoZ25S?=
 =?utf-8?B?N2ZlVTJUVXlRTHV4WnVaZUdPVXRBPT0=?=
Content-ID: <180998FB112D9A4484D3CA523618CBD3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de7c925f-81d7-4a5c-f93e-08d9b8bf9e42
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 13:52:18.1894 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XrCHlGJrJzKb5TM/cg46oGWqmzNEc+CbksiGYkv75epMtXgr6N9QHhzjuEUrqeHv4aRblwMs3PtHb9di253R1MeuQXZsqt4sak5bCuF1GF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2879
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_055223_015273_15AF001F 
X-CRM114-Status: GOOD (  25.99  )
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
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/6/21 2:22 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 03/12/21 04:22PM, Tudor Ambarus wrote:
>> New flash additions that support SFDP should be declared with
>> PARSE_SFDP and with all the other flags that are not SFDP
>> discoverable.
>>
>> Keep the old way of initializing the flash, until all the flashes
>> are converted to use either PARSE_SFDP or SPI_NOR_SKIP_SFDP.
>>
>> Flashes that declare PARSE_SFDP do not have a roll-back mechanism
>> because if spi_nor_parse_sfdp() returns an error it means that either
>> BFPT is not supported, thus SFDP is not supported and the user didn't
>> correctly declared the flash_info entry, or some memalloc failed.
>> Either way we should return an error. The rest of the SFDP tables are
>> optional, if one of the optional SFDP tables fails, we just continue.
>> We would like to get rid of the default_init() hook, so the
>> spi_nor_manufacturer_init_params() is not called in the new sequnce
>> of flash initialization that is based solely on SFDP.
>>
>> Split spi_nor_info_init_params() in spi_nor_init_default_params()
>> and spi_nor_no_sfdp_init_params(). spi_nor_init_default_params() is
>> called for all the flashes regardless if they support SFDP or not.
>> spi_nor_no_sfdp_init_params() is called just for the flashes that
>> do not define SFDP and initializes parameters and setting solely
>> based on flash_info data.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 194 ++++++++++++++++++++++---------------
>>  1 file changed, 116 insertions(+), 78 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 86bbd1ca22fc..d5eaf9a705ae 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2509,74 +2509,21 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
>>  }
>>
>>  /**
>> - * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
>> - * based on JESD216 SFDP standard.
>> + * spi_nor_no_sfdp_init_params() - Initialize the flash's parameters and
>> + * settings based on nor->info->sfdp_flags. This method should be called only by
>> + * flashes that do not define SFDP tables. If the flash supports SFDP but the
>> + * information is wrong and the settings from this function can not be retrieved
>> + * by parsing SFDP, one should instead use the fixup hooks and update the wrong
> 
> s/fixup hooks/fixup flags/ ?

fixup hooks is fine if we want to fix a wrong SFDP table.
fixup flags for settings that are not SFDP discoverable, i.e. where the table
is missing.

3/ FIXUP_FLAGS: flags that indicate support that can be discovered
   via SFDP ideally, but can not be discovered for this particular flash
   because the SFDP table that indicates this support is not defined by
   the flash. In case the table for this support is defined but has wrong
   values, one should instead use a post_sfdp() hook to set the SNOR_F
   equivalent flag.
> 
>> + * bits.
>>   * @nor:     pointer to a 'struct spi_nor'.
>> - *
>> - * The method has a roll-back mechanism: in case the SFDP parsing fails, the
>> - * legacy flash parameters and settings will be restored.
>>   */
>> -static void spi_nor_sfdp_init_params(struct spi_nor *nor)
>> -{
>> -     struct spi_nor_flash_parameter sfdp_params;
>> -
>> -     memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
>> -
>> -     if (spi_nor_parse_sfdp(nor)) {
>> -             memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
>> -             nor->addr_width = 0;
>> -             nor->flags &= ~SNOR_F_4B_OPCODES;
>> -     }
>> -}
> [...]
>> +
>> +/**
>> + * spi_nor_init_params_deprecated() - Deprecated way of initializing flash
>> + * parameters and settings.
>> + * @nor:     pointer to a 'struct spi_nor'.
>> + *
>> + * The method assumes that flash doesn't support SFDP so it initializes flash
>> + * parameters in spi_nor_no_sfdp_init_params() which later on can be overwritten
>> + * when parsing SFDP, if supported.
>> + */
>> +static void spi_nor_init_params_deprecated(struct spi_nor *nor)
>> +{
>> +     spi_nor_no_sfdp_init_params(nor);
>> +
>> +     spi_nor_manufacturer_init_params(nor);
>> +
>> +     if ((SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_OCTAL_READ |
>> +          SPI_NOR_OCTAL_DTR_READ) &&
>> +         !(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP))
>> +             spi_nor_sfdp_init_params_deprecated(nor);
>> +}
>> +
> [...]
>> @@ -2773,24 +2807,28 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>>   * parameters that are not declared in the JESD216 SFDP standard, or where SFDP
>>   * tables are not defined at all.
>>   *           spi_nor_late_init_params()
>> + *
>> + * Return: 0 on success, -errno otherwise.
>>   */
>>  static int spi_nor_init_params(struct spi_nor *nor)
>>  {
>> +     int ret;
>> +
>>       nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params), GFP_KERNEL);
>>       if (!nor->params)
>>               return -ENOMEM;
>>
>> -     spi_nor_info_init_params(nor);
>> -
>> -     spi_nor_manufacturer_init_params(nor);
>> +     spi_nor_init_default_params(nor);
>>
>> -     if ((nor->info->parse_sfdp ||
>> -          (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
>> -                                       SPI_NOR_QUAD_READ |
>> -                                       SPI_NOR_OCTAL_READ |
>> -                                       SPI_NOR_OCTAL_DTR_READ))) &&
>> -         !(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP))
>> -             spi_nor_sfdp_init_params(nor);
>> +     if (nor->info->parse_sfdp) {
>> +             ret = spi_nor_parse_sfdp(nor);
>> +             if (ret) {
>> +                     dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash\n");
>> +                     return ret;
>> +             }
>> +     } else {
>> +             spi_nor_init_params_deprecated(nor);
> 
> Hmm, a flash without SFDP would always go via the "deprecated" path even
> if it is a new entry. It makes no difference in practice, but is just
> slightly confusing logically. Can we make this a bit clearer? How about
> this:
> 
>   if (nor->info->parse_sfdp) {
>         ...
>   } else if (nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP) {
>         spi_nor_no_sfdp_init_params();
>         spi_nor_manufacturer_init_params();
>   } else {
>         spi_nor_init_params_deprecated();
>   }
> 
>> +     }

Ok, will do. Can I add your R-b tag on a local v6 with this change that you
proposed? It will spare me of sending v6.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
