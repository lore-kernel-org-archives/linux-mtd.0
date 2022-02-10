Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B954DC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 03:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmi6WA51S6sVr/P8Rsh+ml2CI1yOk5wbu/cXZVhpKNg=; b=rmikSs7LGFyCZS
	6Lu7xVyBDiQvOdwxhd4xSpPAKZGNVHAY74isliTvFPg8k6IUxEvFpMFqNGJoeoKTGRcKVy4FCxCXj
	ykVUlLbim5RMCvx08ug6aN30qEsWvOjNOyCgKKtP2wnGOc0pE7wWhhhIcTjvhIeNkeQL8Ek/7JnWT
	6SuJf+Az0Eoz/68joPVOwoCtSxMLw6dJxcslEgl4GEao/DFgaXZnmPBfeanTn5bAlLjVb8Q23QpF/
	GiMyc0wCfdlZ3lIpaXtNeEnTxzAJiuJ8CtS6xUcIF/V8+laFcSr8brDOpdAoQmUlMCxZanfyWyc7d
	Wvkbe/uEoumcYudTCBRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHzks-002Lob-L9; Thu, 10 Feb 2022 03:04:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHzkp-002Lnz-7P
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 03:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644462259; x=1675998259;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rwBRa9gFtpBJDASoDbF53Y0STsHSh1q1gkFy1NrpzrA=;
 b=OWAyruVFeDm3wPh7WOFc8qQ5FWmuhZegdExK9/nQCASCBHlfTCi8/DU9
 ftgtUM7LYpheJXT5Ejumx3FynZaMIDHgp3yD5CwhvSXn8RpAjWQKQhBvo
 6hdNdklozkUfkiA0Z/jQ8jR51cXPEh3rata5SMhYRDCucVOEGK9KuTpy2
 NTKM95N2rYEltdmN2IJAqRcEuoa76jDmOye1gCEAu8DGlmJ35aID9WNys
 CfmS2zIhoc66ZziI1845uPvRF+2y1wEhKPBgMYhTMvdrjI9vwwKFL7e9o
 bxsO1s6OkZWlO0Nfe+FFiNXY3GAfQzEf5M9MTncjOXt5EaGRE543nOB4O Q==;
IronPort-SDR: hDzS6pAyFOcTEShWSkiciDFG8K34S4wMe5aurUSDMYYZJ8xxbpvxRJKzROFuVnqLt6fKOvELWk
 tc/7RxeVmx1ViV8DP+3qg4B62FrkuXVm+D7iZmJDxIsNL3+a6SCoU5rk0/NuhtVZUHRzUsrOAu
 fvPeOnOaN9T1QZuavbO600guySVI0yHBR/VXgqFEsHUOxZLpZhQslZuWMRz/Uxm2FECb923CUz
 AHsU6kXsMpbDFQ0P098pRcRpFSSGSpE99N9E1ueqyemNv/Ld/eu8EtqeNDt84wz2KWf8kVpVuz
 wr+XvsxG6er8O5A+ZErfkbUZ
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="152556221"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 20:04:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 20:04:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 20:04:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hG5MayZK6RpSfOPFZj9HchwvebfhwfXC6ctXGOEe3pOh2I5h5BWyZjYfGS/2zlgWjOz5oIQEHOFP0Ptm8mtOZd1ogoXbduFXBTtRtogKI2PFHLMb4F1V4++uGDmV0h/4OOP37rp20cZQ9tV68OC1VYGBKtNzhzVtTiWXUPg3pMqX2H/l7HDevgV/xdAIfXPERPu8l1gt38K0YppXc+U0qwnCD6gO7SBx7kxL8vo48cIH8CA8zMyUhLybrPyUREOlPtr4f/B54E8wg4kZlMJzET2d/MCQOeWQ/wip2SZzTobcwkJROQxTyLwgEJjCRck4KKNKNuZ28KJLMd5iXFgrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwBRa9gFtpBJDASoDbF53Y0STsHSh1q1gkFy1NrpzrA=;
 b=QDG+c85jm7S94bYwkIR89JfiSCTLb/yRWNuZNoVrmg8Ligg3z8obXuwFwWvVm3O5Du/xb47hOCEyeaRUW3I6EW2i61OMTd4QgJwpcVMPZhOH8udQ6CQ4+lvcFrXegkcJzmvwYma+Cla048FaDAx/fdWW9ShNNSGhG2jDXM+lzhV//cAPHC8Ewcune5/9iEUppJ0MqQ7JvrymbTDFbC9mvHR9BUS5mXvLbS8l5feR2jFA7rx9SOBWzEciTbRMyuEZyJwqKBOcdXCiocDm9yy9IhLaq1fmhd/JEXs/Uh1XDMDo4do4kdqraOZ39SgJuSQ0pmKMg3L+zoVLiLVF9YsXKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwBRa9gFtpBJDASoDbF53Y0STsHSh1q1gkFy1NrpzrA=;
 b=tUvzh1Q+yO6xChj6oyg+IZ8KJTXfrbb6LF2zjES/W/2GzvFCYr2Tg8NlfyzEK75Jj3PFAFWwqCyzPSQXGDTlnOHFpUrbVblOiANcQHmKse5lqD+jKuNaIGb1rItA7EgqkmO4xkmxene+a6J3nGzrngQHSCFB6oUPln8sMBZl3Mg=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BY5PR11MB4022.namprd11.prod.outlook.com (2603:10b6:a03:18a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 03:04:11 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 03:04:11 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 04/14] mtd: spi-nor: move all xilinx specifics into
 xilinx.c
Thread-Topic: [PATCH v1 04/14] mtd: spi-nor: move all xilinx specifics into
 xilinx.c
Thread-Index: AQHYHirgeaxNDtJqXUqqihQgM+VNfQ==
Date: Thu, 10 Feb 2022 03:04:11 +0000
Message-ID: <886c6c8f-061a-7591-ad9e-28e39ce2a3cb@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-5-michael@walle.cc>
In-Reply-To: <20220202145853.4187726-5-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3fd1ae7-36ef-4129-c856-08d9ec420350
x-ms-traffictypediagnostic: BY5PR11MB4022:EE_
x-microsoft-antispam-prvs: <BY5PR11MB4022E9826D01C62BF603E64AF02F9@BY5PR11MB4022.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KEPy8hNYXhKHL214dyDozaHGD+Yyo4Pfpy0TXVYq+pD23E/xkEol1yv3lnvLlSSr3P/rV3qSAUkhf+pA4GcuE64ExXxb9ulJeQBze3sXjnKB8ALsGjJD/6O0BcUUthNtDK9yZ6b+h4WtI5nH2B1pAenZ9oknIz4LdY2jcejjWDA2ny1XJAxRN+14Q8oWv0Oho6+RkTRN7KUftEpVeygtPNh7ZyU41R0O/o5WWuywJNbnEzoQeOHEdSu7MXC+Umi+Lss/eTpqQuzLpE01IT/pZtFK9ZaJZQlR+p30feJB820Zk8Sc1jqZHgnEwk33qwS0SXB/jgmP0q0V99TodkgQxXkjIKLZYDCyPiNFmOE9tKi1aeZmaHw12bvyvQRE0JW5MoLlWDZ0T47mds/NWa9h+SuuLM8eH4cgOxYxI24xV8xnNnEEtq/CqEB0iYbWNycaBi2Rk/5iVt5q9Ab6hbOJ47bA6mAdreCXT5v8Hh/dpgVyGSr/YiVTKm+Hkckpu7EPGrCbYA216JxZxneH0CxLxT1tMR5pa9/3GEdKATsxMme4LXCL9Y8Si2pAfWAQoWcyMGbdDyUvBv85jD8YijOXabNyPk69TqMmGgZfeDNfIRTloYW1JF25uYa/OchOrmTFdFIEGZCRXEVA/K77YRuHT5uWb2gmBe1JJKgpFvERpY1JDBWe6u9I6ygTSh74Ncu3MKClMmmrlnwkDYcRpkpr2pOInad0OcXIFgBJcwJXZVEEHZoXfXZB1HqgESSWBUOOBwKrx9k3XcQ/+V/Wfu39fQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(8676002)(110136005)(4326008)(54906003)(38070700005)(64756008)(66946007)(31696002)(2906002)(66556008)(66476007)(66446008)(2616005)(6506007)(6512007)(71200400001)(31686004)(91956017)(186003)(53546011)(316002)(38100700002)(36756003)(122000001)(508600001)(6486002)(86362001)(26005)(83380400001)(76116006)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkNPZE1VTHR6YytaaXY1ZHF5UG5ncmdWdzVSZ3RMQzJFZHIwZk5JZ1l2VzFD?=
 =?utf-8?B?YnJIMHE4WlVBOVlWK2FaMlZ1eXpOdytMUnhyU3l1ai9IVHdaSG5NbU8rMnBy?=
 =?utf-8?B?V2ZoeFVaVWlWSnFlZkZ6cGpIVFl5SS9ySlFUdUFKdVA1ZkZzVFc0OVZNQW9R?=
 =?utf-8?B?c2ZSSkFjaktYR0xZWWJWWENlVjBVLzlIUDJUS0RVY3VGRDB4THpzUHphY1dD?=
 =?utf-8?B?dkF0MWF0VG9ESjFaclU4aEgzQmJTZnp4b1V3WDVxTDVGRmtrU2VlZkdkTFRs?=
 =?utf-8?B?RHBmbXFHeDJxMXVzbTB5NS9HKy9ldEFicHAxUlRHcnU0MFNLMThCVG4rNVE2?=
 =?utf-8?B?UmNMc0NSYlhMS2ozR215ZC9PMGppWFNaTEF4U0hTcHMrQ2U1OVFOVFQ0VWJt?=
 =?utf-8?B?T2x3NlR2Uzh1WjdsUCtlMXdqL2p2cEN5ejNaUWp4cytSL2F0d3c1U0hUQzl0?=
 =?utf-8?B?RmNXNEsxZGNMOVBRZjZ0UUt5SFJMZE04b1VRaWx5MGV6ZkFVVlcrL3pITzlV?=
 =?utf-8?B?dVRMYzE5bndFSUtnRzhNS0V3cHd0VDdoaEVFY0pWaHF3bkJFVVVPNjBiNWdr?=
 =?utf-8?B?OGRUY2VZY1hsU3RLRjUwdEJwanllbzNxSm1MQjU4bFFoUThhQ2twRjV0MlRl?=
 =?utf-8?B?dks4YnlRNThza3V2QTc1MnQ2TkF3ZTZGdTVPZnpNTnQzdzM0VjlPSEhTZndz?=
 =?utf-8?B?Qm5UL3ZBTGpIT2hmL0tBY1pzUjFwTWNYcXV2NlplQ0dqeGptTklhTTYzVFVv?=
 =?utf-8?B?NXZGVk9BeVNXMDBqMmh0WnR2ZVVoQXFFY2FUTlRadUZ2SjJLenFCWjdveVM5?=
 =?utf-8?B?WmNtSWxOdGtpM0hZd3JkeGxOZDAwRkg4VzBybkdGQ3dQTU1nRlJ4RUk5Nncv?=
 =?utf-8?B?S095WHRVT0hOd0JoYjUvWkIwMjh6aEtoRmRycklQZXFHQU9LRWo2VVgwMkdy?=
 =?utf-8?B?MW0wMlJIUGt6K1I4Um9IaVpHUTdUNG5IVEVYbHRhVldJYTZCSklPZGhjekI1?=
 =?utf-8?B?MmwxMXlMYjBoWlFPVy9TNmFnemFMSjIwUW83RHc4bFhaWU00bXFBZ2JxZ0cz?=
 =?utf-8?B?dDdvMHdUVFNUQmNLaDhVTm9CT3h4ZEtRaFlQL2d4SkNHYklZTC9naXpJaTJD?=
 =?utf-8?B?dU1xbUZ6SVFIdUdxRC84dGNPeUNQL3ZwK3dqdUs2NXVMeFVQNWYxNnlaZVNu?=
 =?utf-8?B?aFYvSVI2djNtU2x6QXpjMFhTMjJYaW9wTFV1Sk9WcFgzZ2pZaFFQVWY4Nmp6?=
 =?utf-8?B?czZ1eHIrUlFjbVBaaTZxSVJmNHBrOFl5Y1grZ3Q0ZWR0RFpNbUg1NUJNR1cy?=
 =?utf-8?B?RU5zQ3RHSnlZcHdsMEVzaUdhMUtWcHJ4MHYySVYyZDNydGJZQTBhOFFibWlo?=
 =?utf-8?B?dVBPcmFieUJ2OVJCK05uS1kwMUpUU0FnS0pwbDg3MkFVMnByVEdtZDZGRk9u?=
 =?utf-8?B?WDFDTDlwcVMybmFjOC9FS251T2xBbDNXQlVKcytJOHV2Q3ZheHpYTUIvRWNG?=
 =?utf-8?B?dmtKMTNpMGFRTnFWZitNcE5JRW9aWHNyY0NSbHFxM0x6eE82cU9CQVhMZW1q?=
 =?utf-8?B?QkRrbDRzMUFDVHBjTkFVODZXYmRZWVBpVGkvVktKUkYvcTh6TVJOMVhsa1pP?=
 =?utf-8?B?SUx5WWlyVDUxSVVONUg0SHpKNDRVWmZLVVhOYmZhNFV5T0xWbXo5eDk3OVhh?=
 =?utf-8?B?RWJDaWtDWXd0czZ5blVKUndBUk9hQWRPRFNab3dxNnp6bGpyR0g3NU9XTHpX?=
 =?utf-8?B?RHc2SEVBKzZvdTdvYkZqYTlxdFZZNm9QRHlyWVpnM2JzTHlzZ1JMWUdweWQ3?=
 =?utf-8?B?R0VvL2dMRlhESW04ZXZVdDZtNWJaYjBYb0FBQ0pqTFRGbUFaZEFvMVdJdUZy?=
 =?utf-8?B?VUtZSnhtTWF2QlNva3MzSFVyM3FwQldWUVpaUjZkdzZBOVdtUUd3dDAwdTd0?=
 =?utf-8?B?WE9JRjNBdURVZnJ2Wk9DcXo0ZW52d3NkU1o2VHlzOXBCYjBGR1FqMm4rbHdP?=
 =?utf-8?B?T1RNaXI0cDhiQTVhTXVrTFZTSjYwYnFlSDNSOXlLR3pHSjk4UHNWTUo2NkxR?=
 =?utf-8?B?WUJacDZHTHFYYnpLNWlvZTk3K2V1d0kyOUp6d01GUEFWR3Y1S3lLRWFQZTZ2?=
 =?utf-8?B?anZackFabnVCem9kaklsSXR0OVIzMU02eEFqL05wYzBwVDRrNngySlc4YVJl?=
 =?utf-8?B?dFJoMHBjMkVQY0pPUlIyZFN0c0lLRFRPWU02d1ZzYU1hM0pqcGpDTnRacnZx?=
 =?utf-8?B?NDUySkRFcTVXTVFxZCtvdERGNVJRPT0=?=
Content-ID: <FA07A594931D8D4F808C570B0B81D170@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fd1ae7-36ef-4129-c856-08d9ec420350
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 03:04:11.6789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zl/2qzC3/Mcz71MFCEbsMpLWZ9a5m/58EpVvy0/4DbGfWKRlmtt1Epi2rNeGIAPNe9BT6ZoaRE4RNvcQHYVfsbKsVjqNMn1MYpOvima86zQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_190419_317038_32FD4F71 
X-CRM114-Status: GOOD (  23.15  )
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

On 2/2/22 16:58, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Mechanically move all the xilinx functions to its own module.
> 
> Then register the new flash specific ready() function.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

excellent!
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/core.c   | 64 +------------------------------
>  drivers/mtd/spi-nor/core.h   | 18 ---------
>  drivers/mtd/spi-nor/xilinx.c | 73 ++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h  |  9 -----
>  4 files changed, 74 insertions(+), 90 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index c181f2680df2..fdc8ef623254 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -598,57 +598,6 @@ int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
>         return ret;
>  }
> 
> -/**
> - * spi_nor_xread_sr() - Read the Status Register on S3AN flashes.
> - * @nor:       pointer to 'struct spi_nor'.
> - * @sr:                pointer to a DMA-able buffer where the value of the
> - *              Status Register will be written.
> - *
> - * Return: 0 on success, -errno otherwise.
> - */
> -int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
> -{
> -       int ret;
> -
> -       if (nor->spimem) {
> -               struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_XRDSR, 0),
> -                                  SPI_MEM_OP_NO_ADDR,
> -                                  SPI_MEM_OP_NO_DUMMY,
> -                                  SPI_MEM_OP_DATA_IN(1, sr, 0));
> -
> -               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> -
> -               ret = spi_mem_exec_op(nor->spimem, &op);
> -       } else {
> -               ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_XRDSR, sr,
> -                                                     1);
> -       }
> -
> -       if (ret)
> -               dev_dbg(nor->dev, "error %d reading XRDSR\n", ret);
> -
> -       return ret;
> -}
> -
> -/**
> - * spi_nor_xsr_ready() - Query the Status Register of the S3AN flash to see if
> - * the flash is ready for new commands.
> - * @nor:       pointer to 'struct spi_nor'.
> - *
> - * Return: 1 if ready, 0 if not ready, -errno on errors.
> - */
> -static int spi_nor_xsr_ready(struct spi_nor *nor)
> -{
> -       int ret;
> -
> -       ret = spi_nor_xread_sr(nor, nor->bouncebuf);
> -       if (ret)
> -               return ret;
> -
> -       return !!(nor->bouncebuf[0] & XSR_RDY);
> -}
> -
>  /**
>   * spi_nor_clear_sr() - Clear the Status Register.
>   * @nor:       pointer to 'struct spi_nor'.
> @@ -798,10 +747,7 @@ static int spi_nor_ready(struct spi_nor *nor)
>         if (nor->params->ready)
>                 return nor->params->ready(nor);
> 
> -       if (nor->flags & SNOR_F_READY_XSR_RDY)
> -               sr = spi_nor_xsr_ready(nor);
> -       else
> -               sr = spi_nor_sr_ready(nor);
> +       sr = spi_nor_sr_ready(nor);
>         if (sr < 0)
>                 return sr;
>         fsr = nor->flags & SNOR_F_USE_FSR ? spi_nor_fsr_ready(nor) : 1;
> @@ -2677,14 +2623,6 @@ static void spi_nor_init_flags(struct spi_nor *nor)
> 
>         if (flags & USE_FSR)
>                 nor->flags |= SNOR_F_USE_FSR;
> -
> -       /*
> -        * Make sure the XSR_RDY flag is set before calling
> -        * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
> -        * with Atmel SPI NOR.
> -        */
> -       if (flags & SPI_NOR_XSR_RDY)
> -               nor->flags |=  SNOR_F_READY_XSR_RDY;
>  }
> 
>  /**
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 446218b0e017..fabc01ae9a81 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -15,7 +15,6 @@ enum spi_nor_option_flags {
>         SNOR_F_USE_FSR          = BIT(0),
>         SNOR_F_HAS_SR_TB        = BIT(1),
>         SNOR_F_NO_OP_CHIP_ERASE = BIT(2),
> -       SNOR_F_READY_XSR_RDY    = BIT(3),
>         SNOR_F_USE_CLSR         = BIT(4),
>         SNOR_F_BROKEN_RESET     = BIT(5),
>         SNOR_F_4B_OPCODES       = BIT(6),
> @@ -351,8 +350,6 @@ struct spi_nor_fixups {
>   *   SPI_NOR_NO_FR:           can't do fastread.
>   *   USE_CLSR:                use CLSR command.
>   *   USE_FSR:                 use flag status register
> - *   SPI_NOR_XSR_RDY:         S3AN flashes have specific opcode to read the
> - *                            status register.
>   *
>   * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
>   *                  Used when SFDP tables are not defined in the flash. These
> @@ -405,7 +402,6 @@ struct flash_info {
>  #define SPI_NOR_NO_FR                  BIT(8)
>  #define USE_CLSR                       BIT(9)
>  #define USE_FSR                                BIT(10)
> -#define SPI_NOR_XSR_RDY                        BIT(11)
> 
>         u8 no_sfdp_flags;
>  #define SPI_NOR_SKIP_SFDP              BIT(0)
> @@ -462,19 +458,6 @@ struct flash_info {
>                 .addr_width = (_addr_width),                            \
>                 .flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,              \
> 
> -#define S3AN_INFO(_jedec_id, _n_sectors, _page_size)                   \
> -               .id = {                                                 \
> -                       ((_jedec_id) >> 16) & 0xff,                     \
> -                       ((_jedec_id) >> 8) & 0xff,                      \
> -                       (_jedec_id) & 0xff                              \
> -                       },                                              \
> -               .id_len = 3,                                            \
> -               .sector_size = (8*_page_size),                          \
> -               .n_sectors = (_n_sectors),                              \
> -               .page_size = _page_size,                                \
> -               .addr_width = 3,                                        \
> -               .flags = SPI_NOR_NO_FR | SPI_NOR_XSR_RDY,
> -
>  #define OTP_INFO(_len, _n_regions, _base, _offset)                     \
>                 .otp_org = {                                            \
>                         .len = (_len),                                  \
> @@ -564,7 +547,6 @@ int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
>  int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
>  int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr);
> 
> -int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
>  ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
>                           u8 *buf);
>  ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
> diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
> index 580562bc1e45..a865dadc2e5d 100644
> --- a/drivers/mtd/spi-nor/xilinx.c
> +++ b/drivers/mtd/spi-nor/xilinx.c
> @@ -8,6 +8,27 @@
> 
>  #include "core.h"
> 
> +#define SPINOR_OP_XSE          0x50    /* Sector erase */
> +#define SPINOR_OP_XPP          0x82    /* Page program */
> +#define SPINOR_OP_XRDSR                0xd7    /* Read status register */
> +
> +#define XSR_PAGESIZE           BIT(0)  /* Page size in Po2 or Linear */
> +#define XSR_RDY                        BIT(7)  /* Ready */
> +
> +#define S3AN_INFO(_jedec_id, _n_sectors, _page_size)                   \
> +               .id = {                                                 \
> +                       ((_jedec_id) >> 16) & 0xff,                     \
> +                       ((_jedec_id) >> 8) & 0xff,                      \
> +                       (_jedec_id) & 0xff                              \
> +                       },                                              \
> +               .id_len = 3,                                            \
> +               .sector_size = (8*_page_size),                          \
> +               .n_sectors = (_n_sectors),                              \
> +               .page_size = _page_size,                                \
> +               .addr_width = 3,                                        \
> +               .flags = SPI_NOR_NO_FR
> +
> +/* Xilinx S3AN share MFR with Atmel SPI NOR */
>  static const struct flash_info xilinx_parts[] = {
>         /* Xilinx S3AN Internal Flash */
>         { "3S50AN", S3AN_INFO(0x1f2200, 64, 264) },
> @@ -38,6 +59,57 @@ static u32 s3an_convert_addr(struct spi_nor *nor, u32 addr)
>         return page | offset;
>  }
> 
> +/**
> + * spi_nor_xread_sr() - Read the Status Register on S3AN flashes.
> + * @nor:       pointer to 'struct spi_nor'.
> + * @sr:                pointer to a DMA-able buffer where the value of the
> + *              Status Register will be written.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
> +{
> +       int ret;
> +
> +       if (nor->spimem) {
> +               struct spi_mem_op op =
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_XRDSR, 0),
> +                                  SPI_MEM_OP_NO_ADDR,
> +                                  SPI_MEM_OP_NO_DUMMY,
> +                                  SPI_MEM_OP_DATA_IN(1, sr, 0));
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +               ret = spi_mem_exec_op(nor->spimem, &op);
> +       } else {
> +               ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_XRDSR, sr,
> +                                                     1);
> +       }
> +
> +       if (ret)
> +               dev_dbg(nor->dev, "error %d reading XRDSR\n", ret);
> +
> +       return ret;
> +}
> +
> +/**
> + * spi_nor_xsr_ready() - Query the Status Register of the S3AN flash to see if
> + * the flash is ready for new commands.
> + * @nor:       pointer to 'struct spi_nor'.
> + *
> + * Return: 1 if ready, 0 if not ready, -errno on errors.
> + */
> +static int spi_nor_xsr_ready(struct spi_nor *nor)
> +{
> +       int ret;
> +
> +       ret = spi_nor_xread_sr(nor, nor->bouncebuf);
> +       if (ret)
> +               return ret;
> +
> +       return !!(nor->bouncebuf[0] & XSR_RDY);
> +}
> +
>  static int xilinx_nor_setup(struct spi_nor *nor,
>                             const struct spi_nor_hwcaps *hwcaps)
>  {
> @@ -83,6 +155,7 @@ static int xilinx_nor_setup(struct spi_nor *nor,
>  static void xilinx_late_init(struct spi_nor *nor)
>  {
>         nor->params->setup = xilinx_nor_setup;
> +       nor->params->ready = spi_nor_xsr_ready;
>  }
> 
>  static const struct spi_nor_fixups xilinx_fixups = {
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index fc90fce26e33..b44b05a6f934 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -86,15 +86,6 @@
>  #define SPINOR_OP_BP           0x02    /* Byte program */
>  #define SPINOR_OP_AAI_WP       0xad    /* Auto address increment word program */
> 
> -/* Used for S3AN flashes only */
> -#define SPINOR_OP_XSE          0x50    /* Sector erase */
> -#define SPINOR_OP_XPP          0x82    /* Page program */
> -#define SPINOR_OP_XRDSR                0xd7    /* Read status register */
> -
> -#define XSR_PAGESIZE           BIT(0)  /* Page size in Po2 or Linear */
> -#define XSR_RDY                        BIT(7)  /* Ready */
> -
> -
>  /* Used for Macronix and Winbond flashes. */
>  #define SPINOR_OP_EN4B         0xb7    /* Enter 4-byte mode */
>  #define SPINOR_OP_EX4B         0xe9    /* Exit 4-byte mode */
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
