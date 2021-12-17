Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01095C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 10:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MtOtXj0YkKNIAJugJPlQBRfPCEcrdeZ4hwu4L+/hJg=; b=MF+v14zY95MNTw
	aZoqqYu5JQnA2cw4tqoWDhLuy4tH/Xen8c5T/yt9T5qyION6B+r5ZSsvoC1CH2Xd65QWRDOSXXBmy
	jye5E+oz4LCaMBWstn09CcO6oXa6NVSWR5119+UfeO/WgHB4St85knVZBhJrFhEijXzbK4wHf/dcf
	LXDcwN3lc7mEBoxQizOyXtEYkpWfxWjSsQugDOPnxlMy4Lz2pXGloOVvi4OOHEIWUHkZ7wcgUwFxu
	kP0sh71CmGfadhn7ewe3pBsBfoB8f5V3Us1UHr6Xy9sjrVqKcg5wB4ynaH/vRe3nWaxuoyhml+gOa
	eHesoavTsDTVBLFrG6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myAfS-009Ypt-O6; Fri, 17 Dec 2021 10:40:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myAa0-009XEp-7n; Fri, 17 Dec 2021 10:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639737312; x=1671273312;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/a4ruIn8Wa8idXCLhrgLMgZ0aKQCaSwb9618eN1R7is=;
 b=A6BFBXdi/yO8rFuvJBCJwYE5FIi+dIwsgOh2Kjuy/9WWfSa2zZYNbEtw
 t5gUktXJtND6vO2R6XvFWsYkW8ot4H4LyxHgw8oEJfWKMURdvTMaU2zfX
 nSlRGX0pSmZ/+99+5EbuScjE0IRBJpb+Bw3SPZ4c65TqVWaz5hk+woAlW
 b2hRH/E2l5nmezG3NMSRpxhWp3NAvtI4QpAMoCCoiV3WrmOK+UvJ0crOB
 ypRbN1YIVzj92IAo0NrC9xtQ+cG274Y/HjVzfFJAkar3xFywdMBH+koQx
 9wStVJIfNblXEzmCrOH1rvHlHUd5XwbhvRQsZH54L/TFovxBwpUPJULkw g==;
IronPort-SDR: FRcxB1FeKSjglHvCIbXc2yOKLUtihAR4pAOX0EETZZ+U9n5gMeUN2syly3mn5r/6zUGAGlgxhU
 5o84Yh6QtwUD47vT2l46GBw6c8d6gdpyUghOYJXhZ9UHjVBZhmAQvrpKzg+FkrdkvvoYiRcqCa
 vqR+F1NVJ2Brp5p1zFUle9Y9g+lom0dBT1gtIpot5bYBDYwyNLwr698M8iZmLiAP+HJZQWgvD/
 0oOfzvqf8NN4RG/ZCvi9ajmOgsWwZ1j7PA3qBv4I7Rr/iZMWBxQIxMPavJ2YtNPzUgb7u6WYZA
 cg7Yi+wSEUF0zPXMdIVdLaqH
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="140116464"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 03:35:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 03:35:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 17 Dec 2021 03:35:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESf+lO/4EQGI/yFmgXLhv+e0MkWg/ggvBgRCfkX2grRB596GkJBKuzVsuwOuIjxc8ytMkXfTpaxLY1UOt0Q3yw8kG1repZhC1RHN/mWpJZ5yGi+3/v90zZlAGhWq656NJ4J5mHNV9Jf0HRhfJLP0yjuh+d5omihyZ1lqQ5ouhOHhkU2LYDWaKXtkbwyK+rRul4WFmeDTA9lFWM6c3z7g9PpedZfgWVtrEhALGE0HJRjxujFw3g+TiWAn24Zk7kyERbdcb5LalUux6qMTtD+FKDEqww2lxLzD1EN7vQOaGnLoUTuJRUCfkNLZgELQ4fqYceAtEs2Y5NwRwbi5/T3lDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/a4ruIn8Wa8idXCLhrgLMgZ0aKQCaSwb9618eN1R7is=;
 b=Vq6RUYqsCYJsDHm2bYDWLogo53c2OiByFL+oWgpnijzz9kQzqOB8dKoHXHMe7vHUC7qKMBWs8rsH22TE7PiCxbfzuKYzVdCqAYKOJ77UH4W0kbs41UIfIk+hn5bSuyk5En0zUdh/7ArFuCWVOd5ZwRXQhQbMzvhScb6nPuECYGb0KZ4q/FCEL+AiqTXXv1L3AE3HSIgcYLTn8SzSNmK0V/mVc1+ibnH2KyADTj/8jZFi3j7QZAl7DrFdfXSJjppzsTTbK7D6Co8+AsK0P7k+W3C83adCT2JAcemdBxS/Lk/zxJ4Z2Zc0p/FOwoWYWm3nrupe+vvzexLirP5EeZYcUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/a4ruIn8Wa8idXCLhrgLMgZ0aKQCaSwb9618eN1R7is=;
 b=cazfRz9NTAdLpPxU6dSTUwsqqoYqywuhItzQp4aDZqsNnAa2FRlaJiOM0HFWA8JoVq98xCGBXPQPOpiU1STnbfh/tBxMp0jvMty49VSPIONAKoNGyE2sSvodZqaOGyCJdj8/a7PbS++70PbtJQo1Bq1f0VaDwuE9CrUOWn15jak=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3390.namprd11.prod.outlook.com (2603:10b6:805:c0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 10:34:55 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 10:34:55 +0000
From: <Tudor.Ambarus@microchip.com>
To: <pranav.vaze@iwavesystems.com>
CC: <linux-mtd@lists.infradead.org>, <linux-mtd-request@lists.infradead.org>, 
 <linux-mtd-owner@lists.infradead.org>
Subject: Re: Fwd: Error Prints during SPI Mount
Thread-Topic: Fwd: Error Prints during SPI Mount
Thread-Index: AQHX8zG79y+/iajeAUWaTh9DxM/SOg==
Date: Fri, 17 Dec 2021 10:34:55 +0000
Message-ID: <b70f1535-f052-6686-109b-24083ed1b432@microchip.com>
References: <505a5ad7-edbc-7cd5-1827-4b717a03a169@iwavesystems.com>
 <a4ae5966-0aba-aed4-a25b-051346412fb3@iwavesystems.com>
In-Reply-To: <a4ae5966-0aba-aed4-a25b-051346412fb3@iwavesystems.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 072e723d-23c7-4a1f-240e-08d9c148de13
x-ms-traffictypediagnostic: SN6PR11MB3390:EE_
x-microsoft-antispam-prvs: <SN6PR11MB3390A1412A13374A2519F089F0789@SN6PR11MB3390.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gK/VmKeKzcU3tJnJqOyMst1zb9JQjyrlDEfzbozL4S8mIgqecOOrW+Bdue+OFkp8IhauDP9AVabUy5ExWddSsv4NinzPcNlHLHYnHyCpTxSQFADYbEM7VkmWU7lARMvJd4yh4vcmXg2M5h080pKToWZTtTnK+zIXcIVNWMv4VTDCKdZ0IwqjI/qeF+ehmksI3sXXWe/8RSSlzAxewjossXA1hqb2U1G6/gAv88eqzSLo265yEmE8w4LYG/wH5SMqHszurIrw4sJvmRzs4hL/9ZKZJRwz1a0WlX7sgg3w7cYmxNz6nFqnpo97KcWrjII0Lb6uZIEUmHjI87FRniCEfIXHMBtWZuhOq7KxU/7ZYc0iyzEd5Y6Ao5Go/wX4RLB5BssKK/YjRT16JuuJwG+FvAIxAXZU1I/LcPNCmkQW+Bkbpv0dhdGZbyyHQ7B1gX5EsVscQUN0CLYNODS5EBuTN1tZXdTA8pMq482eITuWV6DDqk+oT52MO25VejhD9OVGafOofFXguPo/CysEMY7UQp0jHbk5yX9i/MDTGPMUtgN85M+kSj+RM3NIKchZj+L78aMs2budE8KEv7esGAleyTTDiJpduEM+o3Bs6M61sXRYYVRZ5IgqNJqJ3d6bwob7ARnKaHM3mWmjSwfdTeZav5Qrxxbxee6vjU0KE4L4NhEC0Is+5rNE9sFjf3ARHZ/cSpg+iwIP8SIrIhLkI4RB7TqF0isqTNLjZ3nnKTlU22VhHNtSsAt9L3q7l6CpN6SoXNhMYr/s5dv3HdmflNBfeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(186003)(36756003)(71200400001)(508600001)(91956017)(38070700005)(64756008)(76116006)(83380400001)(2906002)(66476007)(66446008)(66946007)(6916009)(8936002)(66556008)(86362001)(5660300002)(26005)(6512007)(8676002)(38100700002)(53546011)(4744005)(6506007)(31686004)(6486002)(122000001)(54906003)(31696002)(4326008)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0NDVjBwN3NJclVCUW1KS1Q4Rldhd0ZKcEpuR1N4ZmMxOEcyYTB2alRGRGZY?=
 =?utf-8?B?SGtTY3ZDY2JvZWI3MUtYRFhyRHovcjlJbm1rNkpJTE1iNkQvMFVyWlF6Nloz?=
 =?utf-8?B?enNZSkN3T1RhYStXM1o0VG9UM0hGRVVqQW5rTEVBdENMbWU1eGdXdnJlZUxh?=
 =?utf-8?B?ZVBTZDJaTEpSYlhMNW4wamZiOTZOdlRKRVdBYXdDR0RJSUtORUhnWWZoa3Ns?=
 =?utf-8?B?dUVaajZZUG0rUW5id1hkMnBCZUhsNWgwSnByV0dTemV6VHVkWllvMGdkeno2?=
 =?utf-8?B?b3ErQlBzRXVjZk9QblhpakI0dG1lZmhKWm1adXU5MlBDaVNLdWxIVit3ejRG?=
 =?utf-8?B?bExqRE1kNjFjMW9JRVNPSXZ5cmRsdFN3V21JZHVQWm00dERFWlNPNnovMXlZ?=
 =?utf-8?B?WnVvWnpRNTJncy9yeVpndGlnTmd6OS9vV1ZVWW9kOXBpcVhlMGI3NE43aTdh?=
 =?utf-8?B?VmVqbE9SeFBFODNRKzZacC9lbnFzSDZSSlF3NWRkZEZleWNaemtSV3hDc3ZW?=
 =?utf-8?B?SHNlL0JmSVNlZlNUMkpHY1g2VThTZktKU3JjVmhhOVQwVDBsa2hqU1ZNRzdp?=
 =?utf-8?B?UzJzMDE5bTB0ZXlmYy9kUThzdEZWbWpxMUpqK055N2hESWttS2FxejBtb0xZ?=
 =?utf-8?B?c1BESDkzTGEzb056dUdsS2xHTXk1NmlZVjVrSXRYck5rdDE2VnhSaDA0Q0tO?=
 =?utf-8?B?QWdhcFkyRDQxckFia3BYZmZGdThSSFJsSitWdWRlc053RlVLbVZtZ0RxZnUx?=
 =?utf-8?B?Q1NERGhuSkE0ZzlMWEJtTlFGbTRQeGdPQ3RjV1NKdHJtRzA2OWFWVlB2YnFS?=
 =?utf-8?B?Z2N1YmhnUWlmempFakVuNE11NkVSNkIyaVBSK2JjbGlBck5MVE91elhJRWkz?=
 =?utf-8?B?VU0wRGxldVJoR0NxYVBqRUlwWnNkakc1UThDai9SVVZSazZWZjN6aEJMU3Nh?=
 =?utf-8?B?ZHZnOW1pUzRCTW9BYk81eElpU3hubEtjTXJ3UFN5Q3FiU3NHTTlLZEZUNjQ1?=
 =?utf-8?B?dW5yVGtYL05uR25hYmkxb2UxdEo1bzVqalorbjdFeTZFa1pmWVVhK0lmOEdz?=
 =?utf-8?B?b3pJUUc2aG9YcEhmdkpUTlE4bGpHWXF5SUZEd3BJd1R4TmYrbThhSytTbEZG?=
 =?utf-8?B?S2o0bE5yd1hORGtFM0FJRXl5MUc4eWdPL1RVaGZjSiswcEVBdmNxOTI5dnZq?=
 =?utf-8?B?RzN1WTFGV0h4UE5rOFJLMDhIMGU2N3k1bUtZWlNYeHlWaUV5a0ZWKy9CVHlv?=
 =?utf-8?B?Q21OanVldmMxdXFtNVNSMDZXb0oyZmlJZzFUZzlmN2VDcCt0QzBMdVRwWnhq?=
 =?utf-8?B?TmlLajFiTTIrTXhjdVBrZUI4N1pHdjlPc3hIOFdVZkdOQjdLUzFQSzJLTmJi?=
 =?utf-8?B?RTBzVkpHUTZyaGc4cXFvSWdBdkJqRWlYYk9iRkJBVFpLS29tUlN4ZmJsaWVa?=
 =?utf-8?B?SHRkMHhJTmNXbXNGY1JsNGpJdXNEbWc4UDFBRExsMEFMdlYyT2FzZ2NsUERo?=
 =?utf-8?B?eGJ6amVHbVVFZGZYa2w1OGp6M25rdFNwYzdwYjBENHFQNE1PSWRHelEwejhE?=
 =?utf-8?B?bUZjTFY5T256NHpkU294TEZ3U0pubC9oaTFOSjQ5ODNNYUl3OVNLQXVrOTV1?=
 =?utf-8?B?UW05MWUzTmVuVCtweExVbjFoM0ZicVNyL05QMWRsMVpzTHBqU3BDQU81bHVN?=
 =?utf-8?B?c3R3b21RV2w0djFSUDF6VmRCN2FrRGNMdncxMGJycHVRbEVPSEx4ZzRxS3Zm?=
 =?utf-8?B?Sko4VnhORzU3Z210bnZFUUN6ZlZxZTNxcmVpbXhqUEZXSU9UMTFiMVoyQWlj?=
 =?utf-8?B?cEpoREtrWmo5TGRQU09zOVBVbXlLbHJpSXRzYXNNcmVZeExGV1J4TnlGNVE0?=
 =?utf-8?B?TlZUcUZJNU1jL1pLRXY4enRwTFlLS2VucktmRFVqT3FQWUE0V2JpL3ZVQ2RV?=
 =?utf-8?B?NkxENGxNNHRPVkZvaWhMc085OTFDR0VmN3MzMlQ3MWdGV001bHQvK2RORFRw?=
 =?utf-8?B?N1E3WXRnWUNOdDhYdVFUTHRJRVFSa3RFTFc1eWtSQ0RRTEcxRkpESFh5d0tF?=
 =?utf-8?B?R2tjYXN6UTZBcTh6VktBdURHamJjcy80bTZGK1dtSXpvSDErU3ZqbnlYRDNh?=
 =?utf-8?B?d1NLQlQ1QXIvYWo0aGpTeGFLRlppY291YjJUVjBrNWt2dWgrMlFiZWZxc3ZJ?=
 =?utf-8?B?MjFRNDI2U1VGOWNmRUlUYSsxVHNPeHNOWUdqMWc1eHRVWTV2TnFON2hsN3Az?=
 =?utf-8?B?NGVXLzZ1Z0NBcDNoK0pwVmdxMm9BPT0=?=
Content-ID: <10652C6BFB91C44FAC021C57DAD222A2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072e723d-23c7-4a1f-240e-08d9c148de13
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:34:55.6192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PPiMt5DgP8my32cnpiECicq3Vm9VDjGQ6V1XCMjCXtLgv61jdO3m4vqROT7q586zm7H0tR+/39RLNtkpZu7ZOIBt8dWe6mR2OYXQl5bFqCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3390
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_023512_491341_AD6CBC70 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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

On 12/17/21 11:33 AM, Pranav wrote:
> We are using "sst25vf016b" spi flash.

I would try the latest spi-nor/next branch from
git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
and check if the bug is there. If it's still there, I would start bisecting in order
to identify which commit introduced the bug.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
