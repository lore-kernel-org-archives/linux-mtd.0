Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A2FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 13:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YtKLsNh1OrklnrzPNKB6YTC3AiICutygyED3ox+nsX0=; b=MnFawIgWpgXJW6
	lg9xH3oLO8tIGrphVpV8jp6rt7sTSFsuKD3kgdU0aZXlJXxmsad6wXNFEebxHX2fBbHFbBW8r8zuo
	wROSaZq2Mt3I1m8nsBOBcIL0NNu6gZDcX7wh6HTNcfdTbSyt2nMaqTeSwe17wjLG8eqBKTepD+c5h
	6jWer76Yuf36QYo0bTVb0tuLMhoWBfmtrEWHA2Lloo5fBdHl0Egstay9vLteyvWzk/hHLDBcKqR6j
	ImG5OFw/Pxn6R7e+qSTl+QVsQErRcmRe4JgqyDsFkMgRHKwcKvzzZ5eAgwaH3L0JQyfV9o9oq0yv2
	nXISrZP7jnT5CngF2P4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJyAM-002tXZ-EJ; Tue, 15 Feb 2022 13:46:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJyAH-002tWV-R7
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 13:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644932805; x=1676468805;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=818XkFQkpr5D5BXu58QLelYHVTh0wjMKJ7e1cqwcyJo=;
 b=YHXwhJP2KyhP2ZFGwOTT/CAk0+drhX5FPADv+9UEs5ejkQ0rOKHlnvvo
 s0Kmk0eboozrcGZGzSfIKCachoMWlbFKHOZZcE+1UUMFfoFRLbhU7H+H3
 m4O+SOa+RjvFCV5z9nhTli6bWGsHrJfJNRfLEILNa9xYauy7syJKMODT7
 6gkmua4TIaDocGGkKlTvNZiESroNpWrEuTepLiUjtqlETr+Z2Ja3nsxHc
 UCeYCqGqscim9JllUI9MCoTSfBueMAiylur6wlXoJVBucioRfchkWw+OW
 vx0U7qBF0SxWb0dpcbSqeIcJIGtLKtYnqE3In5yw1mmlRJVk0z2/mMHrt A==;
IronPort-SDR: QvAqGU7S8K8M7ZmWFaAWZ4h+/K0TeMNDw9lDne6ZFmnrbK/jK9tWCx0UkRU+zwMADxXBCHdmlY
 qc++LOwVPMuZIfIRLtYTjBsnuwXv6tfVMSyPRTnB5v1/L7BL7RlFvRgiP1/wXU5hY6hu7CLE20
 /OZ8IwmpHYviHaBQEAKRhlYfPZ//artITCmwIflSKADRoOUWv36ONIzWQHvsb58Dm2Pv/xQMFW
 ELJBzoAzb9ezFC/Ca47RqrjWTIqKpNf8a/lhFzw4+CbGgzZeG+jwK/+5KQii45Osv5r8XmiWqO
 qSzdKYQVdtUfnF5dfkPrWMdI
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="146033682"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Feb 2022 06:46:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 15 Feb 2022 06:46:30 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 15 Feb 2022 06:46:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLXZMUFUtgKwDCbNf0CNcCZBwKnQ5YZQDK/0/ydTCEM2sytQXWhStpSy/i4P+XjXForOY/VR7hDd70JV4/S/79nAI+mK/1LmOByOj12dcWqjsZq2dAQEtfojv5IatZsqaYYimMYXoZIMJW7ViHaEXJvpYr4dMU2yZDtcMDMELZYNcmQWzlvPWgUGzS1bQxTRXaFofP/YD4YdmGIVqoyrxzGCHjBJPm1nlywcKfmyKbqrCDjzFmo+fpi4UFr9gkxdHIWDBm4uSLdHg2jFr5Qn/JsmP0tZJHbEISSw3x+Xna+yoN347KmTVEnAvNROZryzoFDcL3859eigsNNTtCWcJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=818XkFQkpr5D5BXu58QLelYHVTh0wjMKJ7e1cqwcyJo=;
 b=FhB5AyGppG4YA5nbaxJxiI/FrvrnCLgttq2DdcB0dJE1FqdB+LfsDgFLMY6k18xoyaHW/6sHNsv1/3nERdIfIeFuvLAN7HB9HCq7zbolHXLyIzvwuIpl3Y2+9MOux1iFSrjgc6X9cLiZMxkzuPtOmDP9ErqLeoiLdNercDley3gOtogoVcsUtB3P/vDR9K/SiRifoS9IaziOO7DUIsJb6mKv1uUxQUmhaNkb24t2BFyjg+g217WECdt1wEbt97BlhrWHiJdUQNp3Wn9PS3eUSvcjuiMdQapWpofvfdLX0smMaTXKVthR8Ske6JKdXxp9XrCzjTo5VE24yPYjWPIWwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=818XkFQkpr5D5BXu58QLelYHVTh0wjMKJ7e1cqwcyJo=;
 b=n3Eyn7IhpzHdxVVV8UK8IoypoaOZzeT1tod8b72ATGQQz6zvDDvj4ivaw0U10UKuOjmbnCdD/qq0z2dt1/kfvzH/Fscon6MteHLL7H8FZMEkm2w5NahmmvTcnDiOgLzK5WBaYZHwrbpIKJVLXNBQbmq9rKiAtomHe1ZZMgnPmTY=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN6PR11MB1937.namprd11.prod.outlook.com (2603:10b6:404:106::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 13:46:13 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 13:46:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <broonie@kernel.org>, <mika.westerberg@linux.intel.com>,
 <lee.jones@linaro.org>
CC: <p.yadav@ti.com>, <andriy.shevchenko@linux.intel.com>,
 <linux-mtd@lists.infradead.org>, <michael@walle.cc>,
 <mauro.lima@eclypsium.com>, <hans-gert.dahmen@immu.ne>,
 <boris.brezillon@collabora.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <lee.jones@linaro.org>, <linux-spi@vger.kernel.org>,
 <vigneshr@ti.com>, <alexander.sverdlin@nokia.com>, <corbet@lwn.net>
Subject: Re: [PATCH v6 0/3] mtd: spi-nor / spi / MFD: Convert intel-spi to SPI
 MEM
Thread-Topic: [PATCH v6 0/3] mtd: spi-nor / spi / MFD: Convert intel-spi to
 SPI MEM
Thread-Index: AQHYInJkffyeWf2vb0aX96QKM8+hjA==
Date: Tue, 15 Feb 2022 13:46:13 +0000
Message-ID: <ec42e96a-0240-9cb8-2f27-746fbbeef56f@microchip.com>
References: <20220209122706.42439-1-mika.westerberg@linux.intel.com>
 <164492969770.14011.5135767095761454169.b4-ty@kernel.org>
In-Reply-To: <164492969770.14011.5135767095761454169.b4-ty@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97b96715-3a5d-4b35-266b-08d9f0898825
x-ms-traffictypediagnostic: BN6PR11MB1937:EE_
x-microsoft-antispam-prvs: <BN6PR11MB1937F64F9DBDA8C3B22F9AF2F0349@BN6PR11MB1937.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 31ztnthfvI6/ytechyclIEDFiPbeDg7PjemnWDlYYfGG6H7nCSzp4R8+hbqXu2RCbIp0UTKnUYu20Bvk2vh5HmK0ZAn/ZCO5R7TRBgR0FNBS9IHodphScjrKoeCQf6tTHsm0r5L37+T72/tEci6ZwK0YVC9YdUU0EvvCIQAHWMW1IX9Fu4BeJRbW8zJSKSWuQbeftMOS+Ran2dfZ0bR3yWVZDI3qKLLUt3hqOVjr4OLlN4w1jKoa8Cko0YtsDVvF073ZIwVn4SF1aahTZ7d0Y+Bir0zoW9iC50RJlqUEOMDJqALs04NTc+lfxbnoaeqXHFhevIxy+17Boh+Zyrnuv9nc+N6C7INTsAYpgjSxhL6MhtafQCCj0Pv0hI4zSavrKWcWgH1S1Lz/fUWw3Pu8WGVR1wOLxSFBoa94pzM+n7ZEtbT+HXbPsoHxCpqHDXluA/iJfepP4jeisRPOLfz1RqXY0xUVJYU2nF4COCoAXaHn4dWN7LgMDZGuarXsDLn1xDlHlT//l7juSJTr2+0x9ciSfav9hDR7Sh8PppYOWarPvkXIc+AxlhpR8T6srHx56sVE7/Jaq3jriVt0j/rmlumkmGxPHPJEiqJqN/lsBQpKDdcpYqwWvLdiNf+q6pBAZAZRIJvN4PMR+DkapLShkAkMyEbe1GdsUNma4BeRYxYyDtaAc/ZFuXOfzozTAA49LE+iu4BUBamMrI/V8ejXkUrBiAROSgq7lYcW8e0yB4dRKSzGjVWwMZ+l6AnZc5HS0V3IrNpGYhNA83kknuBWvQBplAHTqakZGm5ldwRWgIYs82gGPw5r+eDg3+Px+8VAZ8LCLfUXn0K3wMo1bVAVsxcfm8NJEDVgerTJuIcJOjz/w8BIsCoXQumgdKHTHLS8pZBem108y+GZ1q4N8mStuw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(186003)(966005)(8936002)(38100700002)(36756003)(110136005)(122000001)(31696002)(26005)(31686004)(316002)(6486002)(508600001)(8676002)(2906002)(71200400001)(76116006)(66946007)(86362001)(64756008)(91956017)(53546011)(5660300002)(2616005)(4326008)(6506007)(66446008)(66556008)(66476007)(38070700005)(7416002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aStEeTE1TDI2OVRzcisrOEl2dFZLc3NVQy9Ib2xUWTQzcU55WFFBdEFxVHRp?=
 =?utf-8?B?SUtKOTNyRmZDalVlOU5GUkd4dDVPWm9mSWxld3hoNEc5MGh4eU1NUkVkcTln?=
 =?utf-8?B?N3Q3RzZHa0VwUjB1ck8wZ0dMZ1VZOXhjTDJKSmJNZUVKVzBZNnZJTmpZSEwy?=
 =?utf-8?B?dnlmVWJONnFTYVY3UGo5Rk5FYURJL2I3SGp6eU5ScXh0M0pWWTN3QUQ4TGY5?=
 =?utf-8?B?eCsrNWJiMWd3TXNpMzlGRGJnL1N6WS9mVFZjUUJsa0R1Tmw0ZWd5emFyWFZm?=
 =?utf-8?B?cExhY0xDRGFIZEo4cFNQckFpdHF6cUdFa0E4WTJQK05aWjY3VlFoOGNHbVNt?=
 =?utf-8?B?bkpKNFlISmhTOWZHdzRDS3hCYmdyVlhScWNHMHVDd0xCSmdZZDUyaTBjamZi?=
 =?utf-8?B?SEYxUWRBWldFYXJZdmVmcE5tRGtnaVpLK0lldEZOMFhXVStSOGh5a3I0ZzUx?=
 =?utf-8?B?eWNuM1dheDFVUm1KSzIwbjYrdWtaZCtJNFZCZXJDLzFteVkvbzNNcE04ZVVV?=
 =?utf-8?B?YURPcE8zOGZDdE5GMGlCeCt6czZmQjkrSFJvY3haQ1VPeFUwYi9HVUFPdnls?=
 =?utf-8?B?VjZzV2c0a3lSREUzTXVXcllnSWFHVHIzdml6L1ptV09HdGFLeHFHRzY0MExZ?=
 =?utf-8?B?ekxDVTJIays5WXhQWlBvVW5rdjdWdTRlT0N4SEVqRWVXWXNsSTMzVjhkUzRh?=
 =?utf-8?B?dFZBZjdhYko1MElPLzlMYktXamovWkZDNk1lMHgrNXlmemdtN292YzNRbXND?=
 =?utf-8?B?dUlqUkJEOWtKb0ZQY29VY0dMQk4wNFlMeGp0L1ZvMVg4S1N3WVNCTXRPV0lO?=
 =?utf-8?B?Tyt5dExISWM0dld5OEJEZ24xbGtKMkMzS1FDZnBxeExCYUlyRHJjZnlLU0hz?=
 =?utf-8?B?TUs1eHhYS3FJTVVrRHE5MU9RQUl0cEJYZDFya0RjcmZvVmFVKyszWGJSYk5t?=
 =?utf-8?B?L1l0VGRpbG4vei9DRmZjUEV5UTduVmlObzEwUXlKZER1a0dlaXh3WFVsaWs1?=
 =?utf-8?B?ejc1R1BTSGxGdVR3bnpBbHdoVGphSjdnQlg1R1FVV3BGT0JaK05wZ3FkbmNv?=
 =?utf-8?B?bnpqYUVESUp0SmJrZVNPV3JqajRnaW9IazllNWtmNUZPejVjSk94RFlvR3FC?=
 =?utf-8?B?MmFqRk1ZUThZUzhPb1F5SThMdlE4aFhaU1dZeHliRHBWb01BWHlmcjZ1T0Mx?=
 =?utf-8?B?S2xqUEI1UTNZR2YxNVZWWlR5b00wOWRWK3dHUExlSlR6bnJSdm1wNm9FZ255?=
 =?utf-8?B?Ty9qL05NR0dMTjJreS9tbjdtcUVKSjJnS3FBUXVFcVpiUFZPcGhVZzFDYUl5?=
 =?utf-8?B?aThwYUlZNGRtSFB0Rm9nUlg0bWhTWHVjTkorVnQwZzJXc1h6VVpNU3gyVEFK?=
 =?utf-8?B?Z0lrUTFmTWFTelA2UytnZC9IYkNqUzNVOHU4cHFhSk1TN3pJaDVTVys4MXNC?=
 =?utf-8?B?RE1EeG9DQ3dqZi8waU9BNS9oZHhSbmxUTlZ1bXBzQW5FYWdzblZxZ2h5Unlh?=
 =?utf-8?B?MU9PbytiNzNEdVprcmx1YTNnRVpTNkRCMTVwTTBySWpFZmZjTFFOZXpxYThv?=
 =?utf-8?B?VHFWbGpYRVB0b2lKUmNlbjk5YkhZT2VZT2kvNGJJS0hkVTZ0N2dYZmtvYkM4?=
 =?utf-8?B?WE1CN002c01JN3lBRDlMZXBINXRLbFpDS0RaOU53TWN2R1RBeG1NWkJleDB2?=
 =?utf-8?B?Vlk1Vm95QXhRMmsxQkJMeVBIVU15czVPSzdwZ2k2MzFSTVk3N3lIcHNGczlB?=
 =?utf-8?B?UG5sRjdObzVHTiszeTYxN0pkSXR0VUhlNVhCR1p6OUQ2cUVtdnJjWGZSaE5Z?=
 =?utf-8?B?cnNvYzI0TXJXZVM0d2NnUFZEYW1EcFlxN2t3WEtISkJXcE9SNVpNbTdFblBq?=
 =?utf-8?B?dnBkSHpjcnFzRjBLOFd4bU45VFowY2dyaVRsbnBjSTZXRDFRK3UxNGdXYngx?=
 =?utf-8?B?NzkweXAzZTJuVE1XSE9OVTNTQzhHSnRKM2Y3UUYyaUVrR29DdFY2Njl6Y3k0?=
 =?utf-8?B?NGhwbGxsOGF4Sks3dE1hZDBTUzFhbVFxU0tIeUxiVE81R0k1U1RDN2Vkems1?=
 =?utf-8?B?L2svTkNnSTlBV21tQ2pETE9nU0Y1ZWpiM3NuSVdEVWdpOVJqMC9zL1BEdmw0?=
 =?utf-8?B?Lyt3MDJGc2doZXBHVVExNDRnTjRkeWlscU1JK0xmdmtOT0drQW40RGY2Rysr?=
 =?utf-8?B?dUF5TzBoS2gwZGowME5zcWdUQ3I4c20wblNyd0dZVlRLMHlJOHZENkNFVDU1?=
 =?utf-8?B?UFE0UGpKbGhSUmY5d0crV2hkSFRnPT0=?=
Content-ID: <994C721A93C1F84FAEBD0A5FE35B6000@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b96715-3a5d-4b35-266b-08d9f0898825
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 13:46:13.3707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WBxnJXN/8t7rn+jSRrcRT66sw3Wl3n3yWFhnssQTHa/8VX4w/LNts3+G8ErZbT0Py4c+NqIunsokJVun7vaDn96pcPZYhrIFQPx2XD4ZR00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1937
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_054646_050988_3BC7F64E 
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

On 2/15/22 14:54, Mark Brown wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, 9 Feb 2022 15:27:03 +0300, Mika Westerberg wrote:
>> Based on discussion on the patch I sent some time ago here:
>>
>>   http://lists.infradead.org/pipermail/linux-mtd/2021-June/086867.html
>>
>> it turns out that the preferred way to deal with the SPI flash controller
>> drivers is through SPI MEM which is part of Linux SPI subsystem.
>>
>> [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next


Hi, Mark,

Have you synced with Lee Jones? I remember he asked for an immutable branch
when the patch set will be applied. There's no need to sync with MTD.

Cheers,
ta

> 
> Thanks!
> 
> [1/3] mtd: spi-nor: intel-spi: Disable write protection only if asked
>       commit: cd149eff8d2201a63c074a6d9d03e52926aa535d
> [2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
>       commit: e23e5a05d1fd9479586c40ffbcc056b3e34ef816
> [3/3] Documentation / MTD: Rename the intel-spi driver
>       commit: 4ab13489735d9b5b6e91634eab83922914a3310c
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
