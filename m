Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB6CC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 07:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrqeELZVf74b7cJKuDgDLtkFcoO/3Cgc84KQZdPjpRo=; b=wFmRLgui9P9Rzm
	F5hFDV3Ff0Y6IGLKEqNwJ7OXYNh5OJPJtcaUR6sm5aS0QJfuMVn2zulHJek5MCgjtkRXdEJ4dQiNU
	sar8kXk/bkjHQrbXETCmmZEuMYYhx63zy0E0cf5YrxFrhjinlP2qdQy/mB8FVuDHJ69/v+KEp35lr
	WAv/dpyRTFaQYV9K9Z7Cq7sIobwf+SDfbTZOqGrbgrgqc1c3+SCCZHMYS6vxVQTP3ZIgW+zjUbbZ2
	wYFJP9mSV093QTp2KURrAdIelW5030PvdyACn/Mjz7mppiAS9EXogHvXDxdYTjvX604Hi9bsQoi0P
	sjJJYbZnqpkxG8soe0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh53a-007sN6-1e; Wed, 20 Apr 2022 07:47:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh53T-007sJX-Lh
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 07:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650440835; x=1681976835;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wTSX10BhuHo1/U/y7diAiY9d7/iqcjy7GloEb7fvcpY=;
 b=YUPwSZWBRgxb6gNzPYi2uVlZFdLnqvRXVJ3Uq4sXJ/RzPu0d95pkSbl3
 B5XUGRfwr/rN9stzJJq9WpC8OIknc9WKGo9OZrdgLaoMm1acMQqCSYJI1
 MhIZn1YeJ5Wg7thmCGgEAUhHqahBzjah3Qw5YUJFJyVq+4GZBSFn9Ai40
 dC47jSJ0/I6tJfjyeVLWJSy0rGJG5FlLBPqQG6mkugV8VMGwgHwTd2Y05
 g0onGBLpY7JECe6YNaF4+7wQSK4mtK3KQCMtcs7Y+WQsFM+itaRctFRNq
 jm4HSY7YAyHuvoUGyN7n+xb75f2QMZI1pGkY3YOwWP4xZ7hFJxFgyE9jL A==;
X-IronPort-AV: E=Sophos;i="5.90,275,1643698800"; d="scan'208";a="156121897"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2022 00:47:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Apr 2022 00:47:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 20 Apr 2022 00:47:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuKvWUP14m7OXO8v8g1ao5x5IXuIyWPuhWVsZlv+YBZoGqqWuDEAM8ZhtsEm+8XEhGCFNVbjgamdNBdNz9DcoD9GDcDjMqDqmx7Eqcy6T+a3PC/nadgu7nA9F5FihUt0ca6UWTU9Yxa6PJ84s96Dz4ILTgP51he7SXi1XHgQpkP+V6SeKZ1aWeJeVUhZD3xGBzzr4L7oDamMyaZZmUwOGMSSW/HwKd8tuZ2R6yshYZVuXDZT5t2qB/W3JT5abDU5ijJYH4PiV0nWnHMX/zinh8BJzI87fQ2e9b/wW0IeYLz3Kr781H8xLc6I424n7M+QVBW+c7Iy446uhriTAwaFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTSX10BhuHo1/U/y7diAiY9d7/iqcjy7GloEb7fvcpY=;
 b=EVaBgQzlUp9v5loK/rzfNbc4FXhTJKVsugY7JeIpWS8BdWFXHSG5KJScCRT5JrFFvzeewX82mj3bdzb8JlDvFsD0KlrfQJThi5WLr5C+9zBm09B686m4o7x/WKu4cDBG/yKEbKQElZUxd+2zgjm7V94d4fa5GazcLMxMAFFXuMjcZexydz1C2O7b7L3p/n6orLCMZkP5hzdCQ5RYzbkknE/5Tn+GxaABTD0vstsDoGkH7ShhXcUhFy3pBx1GjIM41128JWwO0/SyHS8ZDAAlCpcb6HezllK52uuEYIS00ae6On8rE3IqzGB6LIfRPJol8kaZy1+ebr18PU66hkUj7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTSX10BhuHo1/U/y7diAiY9d7/iqcjy7GloEb7fvcpY=;
 b=GlzrVbnTvzOqJ8qRe2w8/1IuCvoXZf6fDUFLbFRhKh8QUbBgo6amnMwruktEEEmUAZDagh/UYWBDeiORzm7/N7weWJv46OT/vlN9eVpIOPaT5iOaOJauZopl4m67N/+sXla4QfCVY6JP5My2yRzCtDWWUVbOg91DFhaDWYLSox0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN7PR11MB2818.namprd11.prod.outlook.com (2603:10b6:406:ad::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 07:47:09 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 07:47:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHYU9BgAvSIp+mmK0m8aBEYNky38qz4bgsA
Date: Wed, 20 Apr 2022 07:47:08 +0000
Message-ID: <bb40711b-df58-a951-a5ed-9cb7a6732f6d@microchip.com>
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <ffd36e40c47dd74ac3a0cadf520f8fdd35add856.1650259501.git.Takahiro.Kuwano@infineon.com>
 <201f90e6-e03b-9469-f3bd-f1ae3b5737dd@microchip.com>
 <c8007288-00ef-bc3d-5337-8db710feee67@gmail.com>
 <9220410a-f3bc-b2cf-8324-604ad5b3953e@microchip.com>
 <02154c7d-225b-d3a9-df28-f257c3b7e9a7@gmail.com>
 <bdbde2cf-43c8-798f-9a75-de0bad91a1bc@microchip.com>
In-Reply-To: <bdbde2cf-43c8-798f-9a75-de0bad91a1bc@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d69cf87c-1160-4f38-6595-08da22a1f90a
x-ms-traffictypediagnostic: BN7PR11MB2818:EE_
x-microsoft-antispam-prvs: <BN7PR11MB2818EFF99173E98B2A24464DF0F59@BN7PR11MB2818.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: krFx/YVUx4NUDaA7HtLWljeVgyVijfyc/HUK7lPmJVJIn7rJhe1up86up/uS8fIUIug33GTN7sf8J8E0KRxlmlFC+rV7nPlMQ6kTBdsH2zsGPDg3zjqTJZAzt4ZYVAFgNEbB6AT25COI57jF4ZgQj/auHPC0PeLaA0UX6+aosAkEiZDNK8smrab/imCSfXpjpXRji5DFtrekgps4eobw0npA1oUMKePj2uXNbEBzfv4M+/zTL6iBmJ2QhFqQocHDxXJNAKiJWens6mX7Li+udiuW8qdRna/UCUSvVQKFi07HkNrLE9PHWxFTt1XidBMMTTjy9tMp0J8IITycj/1mky0tSymDZe+tLFge4Mddt4dBNcQjdIFgwouF6oQAV2l/h9470D7C7DPiEvrCeMQtGYJcRBqxkAdIZ+sdW4uFN4lOwr45RbCxe1w5vmWXhfwAnXC3ZRKZDlRq3iYmpg2/V5B8Drv5liqCm57U8As7U8bq2SqrEZ/55S31eK0PZjfnCPvWig5+xZawrqML4DFvJszdBfvsMrrwhwm2tQW5IQaWSvw7gBZt+jmN3b4i/1O/27Xe7gj1MsHbafCrPBAYTgb6DoApHUnkpJ78ZjNZ8SFF8egsjn2KDNwzUZ/gJ42HItv37WGwtYq2P4BgDQz9FBQGPyLHE3zziQyYViM/znYxdIrY5Y950XzWdLpWS/WiLuXmtMIZiRj/SWHj0+f4D3zsE230pPZh3wNNumgNuJFiVStIYLjFU3dYSeJgZKc9zblcyYkfY9Gyil1G7fnoQ5sWV7JL1nEyK7lzJGtDcXXyOTHRZqpxqjMNCxuSl0eYgCq9Mt9HqMj+QuMZ4t4d1Qvk5l6Qpqexj+wx5DGZWgE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(6512007)(316002)(54906003)(66446008)(6506007)(26005)(71200400001)(64756008)(4326008)(5660300002)(966005)(6486002)(8936002)(8676002)(2906002)(36756003)(38100700002)(110136005)(38070700005)(508600001)(31686004)(122000001)(186003)(2616005)(31696002)(66476007)(83380400001)(66556008)(86362001)(91956017)(76116006)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVlBMHZlZVpXWklMNzZkckZNd2ZXT1Bndkt4V0VoMFYzL0xTSlNGZzlwbStI?=
 =?utf-8?B?L3dubGJCYW5ndnZaQjdRdUxSRVBzT040MVpPNkpTVTZCM2F6VitmVDNkVW8y?=
 =?utf-8?B?SUl2TzhDUzJtNkszMFBnSlI3cis5LzBoTGNhQzN5b25OUitlaDY5RFU0NTJM?=
 =?utf-8?B?MVJHME5udmd2clBxODJIQUZ5WEpaeWtPeVVKTFY5NjhHVUlSSFA3cWEzYUEx?=
 =?utf-8?B?OTBWTjN2THdKUWlKUWowSU5ZczVuZUE0YXVMQmpTbThvNkl2U21KQlBEMEV2?=
 =?utf-8?B?UUlqckYrS2xPRkd6QjMwWFN4b1ZISlI4R29tQit4U0w2N2h5Y0NaZzVKeHUr?=
 =?utf-8?B?ZENlcVBwZ3dnRklYelllT3ZoclJLN1VQeTVwZlY4Sm5OaDYvMVcrQUs4Z2ps?=
 =?utf-8?B?eEIzTnplWHlQVms0VU0ydHR0N3RpRVRuaUdzbUZVUTBXUnlIOFBYTDU0RlJQ?=
 =?utf-8?B?a3VydHhDTW91RmdZNDZwV0NhK1FKTG9vbU80ZkJtVm9LTTloRi9OUnhPNnJJ?=
 =?utf-8?B?YndCemFDbjNEalh2TkZycXBXQUtSN3dvU25MeVNJSGFtYXpxQy9uNVBqUlNt?=
 =?utf-8?B?Rk80T3FGUGxlRzEvQlJ3Unc2UVJydGp6TXpOSzNlVTN6VWNoZ0pqODRwblhK?=
 =?utf-8?B?ZyswdVJNMVNqeGRUV3BXWHNHVXdhRUZwUFlOZkd1eWxEWnlzTEZvUlVIOWxz?=
 =?utf-8?B?S0M4bWhmWFpUeS9oMzFJU01wb2RidkFpWGZHakF6QTdJL0o4dEN6TTlDTEJs?=
 =?utf-8?B?b1QwdTAxZFc5RjEvTWptN1c1THJEbEpJc1dOUzBpTHk4NHAwOGEydWdwRTE5?=
 =?utf-8?B?Y0Y3b0dvcEF1ZHArRmw2NXhnenlEdzI1bmNzZWtNTFcrWVZBM3RSSkxUeEtP?=
 =?utf-8?B?enlLRmtwUGdrV0NmS0hIUjBjTUVIdkZ5em1KN2RtNStHOTA2TlpBWldKNnNl?=
 =?utf-8?B?VnlwWVJzcEFXUlpqdkJTNG8xNzV2Zm5adG9WR1VsK0lyd29xWnE5Y0JxYitK?=
 =?utf-8?B?VmhzMDI4bGw0RUJrOHpDc2VuZFZNUGo5WEVnM0c1bEpuU0FUcjFGK21hbHNV?=
 =?utf-8?B?ZWNXZmY1djBTcFlHekVmSWRFdllYWmQydjI4M0FjZ0k1UVZ1SXFmMGlud3Rv?=
 =?utf-8?B?TUZ1ZFZEUnVUU1pQUTNpTTlvdGxaMW5mZ2VUcVloVjhJd1N1VlYrV2UyaVdS?=
 =?utf-8?B?bWdzTmlyT09DNzJoQms0K3J4S3h5UHpoVEFVcXJYVzFmTTFKcXBsOTlRZnJl?=
 =?utf-8?B?WnJpWko3T253WlYxQ2pMU0xmMnBwSng0S05ma3k4SXJGNGsydG1zbzVRa3BW?=
 =?utf-8?B?L1ZiUHl6NXQzU21LZUc4VXJFMm5jcG14Y1BUOFIyTXBKdXZTVlAvN0FHdjZ1?=
 =?utf-8?B?WTVlUUxaS1QyZkxDbnd3aE9CZkt4VXJRam02eDJ6eEU0WFdyNEpxcldjRHh3?=
 =?utf-8?B?dkFHQXFBTGdIYk4vMzc2NnMvNDcrSWFGenhRZ0kvN0l3czZFK01kNTcwUERO?=
 =?utf-8?B?cnpBZWxsYWFmSDJHZWxuZHplMlZienB4K2pObEdIU1g0UjJVOXI0MmNLTzk4?=
 =?utf-8?B?MnRwSEpYRVJoaVJKSzBkajB3M2lUWnpibmVTYmd5U1k0ellreWxPRSthS0Zn?=
 =?utf-8?B?TUxBYklhSmpqcGhtbngyMXRoNWZOWVMvdndybkljY3pIOXQ4MFB0SjExWW9k?=
 =?utf-8?B?QzRJaldxeFplai92M1B1emdCb0JRbGU1Rk1VYUcva2JzeURmRUJEdkc0K25z?=
 =?utf-8?B?c2tIQ2JJSUR6Q3R3K0wwMm9yTnQrNmlYQ3RldFVtYUFSbmJ3dXhqRFpDM3NE?=
 =?utf-8?B?VHFMbFljVlduQU9tM0Q3WUhUbTJDdktTKzZKWi96ZGVQOEtvdXpUOEpCRmZJ?=
 =?utf-8?B?RzhiQ3pNYnpvYjBWME5NWWtvTlFPL0tPUnVsc3Y3MWlnSUpTdzcvNFRnY0Nv?=
 =?utf-8?B?RXpWcHk5TldEbjVndE5sTUw1NlV5THBKdUhBd28rdDlieGxiTkxJMHlWQUc1?=
 =?utf-8?B?K2xhd3dydUhrcUg2V0VHZDZpY2JvOFl6K0VzYWFPd09XWVJsdldMQjM1cloz?=
 =?utf-8?B?ZFRNaWNvR003aE9wbGR4NURaK1FmS0tvWFcwakRXaURDYUFQc1N5RVFkKzA1?=
 =?utf-8?B?enlsYTZ3ZXZnZmpWYVgvUlZhSzg2WUphbm9YWHlwUFlKWEM2ZHZENDRzalFm?=
 =?utf-8?B?S01qZU9OOEFNMmh3REFMM3BKTTY1NXVJWE1sS1NsR20vWDdlWmlwNDM4Tmx3?=
 =?utf-8?B?NEVQalhLTTRhaE1TNndNNlhIOUI3RGJpTHVqbDUyWXlqLzRWL0taWnluckZI?=
 =?utf-8?B?WmR2Y2dTUTdaNGdBQWhGeUtiWndFeit0OVVtTUhPOTNpS2hwOG01eitWWjFR?=
 =?utf-8?Q?ei/W5M8EO9RZSMXY=3D?=
Content-ID: <F112C7880BFAFF4E9CDCC24EA33E69F5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69cf87c-1160-4f38-6595-08da22a1f90a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 07:47:08.9477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: acGnXILMRxNzjuBH534E/ieUY32XFM1/SWNprZd7r0bpk69ou6U/3OJXg/eE040WECxdL3yOzYPV/j+AMr3edQWIhlO4PVcemsELOLurRAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2818
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_004715_865852_86A13476 
X-CRM114-Status: GOOD (  15.31  )
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

On 4/20/22 10:35, Tudor Ambarus - M18064 wrote:
> On 4/20/22 09:58, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 4/20/2022 3:11 PM, Tudor.Ambarus@microchip.com wrote:
>>> On 4/20/22 08:34, Takahiro Kuwano wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Hi Tudor,
>>>>
>>>> Thank you for your feedback.
>>>>
>>>> On 4/19/2022 6:32 PM, Tudor.Ambarus@microchip.com wrote:
>>>>> On 4/18/22 08:41, tkuw584924@gmail.com wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>
>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>
>>>>>> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
>>>>>>
>>>>>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>>>>>> uniform sector sizes are supported. This is due to missing or incorrect
>>>>>> entries in SMPT. Fixup for other sector sizes configurations will be
>>>>>> followed up as needed.
>>>>>>
>>>>>> Tested on Xilinx Zynq-7000 FPGA board.
>>>>>>
>>>>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>> ---
>>>>>> Changes in v11:
>>>>>>   - Cleanup fixups based on other patches in this series
>>>>>>
>>>>>> Changes in v10:
>>>>>>   - Cleanup fixups and ID table based on other patches in this series
>>>>>>
>>>>>> Changes in v9:
>>>>>>   - Use late_init() hook to fix mode clocks and writesize
>>>>>>   - Use PARSE_SFDP instead of NO_SFDP_FLAGS
>>>>>>   - Use MFR_FLAGS for USE_CLSR
>>>>>>   - Add comment block to explain about addr mode in post_bfpt_fixups()
>>>>>>
>>>>>> Changes in v8:
>>>>>>   - Call write_disable in error case only
>>>>>>   - Use spi_nor_read_reg() helper
>>>>>>   - Use nor->bouncebuf instead of variable on stack
>>>>>>   - Update ID table to use FLAGS macro
>>>>>>
>>>>>> Changes in v7:
>>>>>>   - Add missing device info table in v6
>>>>>>
>>>>>> Changes in v6:
>>>>>>   - Remove 2Gb multi die pacakge support
>>>>>>
>>>>>> Changes in v5:
>>>>>>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
>>>>>>
>>>>>> Changes in v4:
>>>>>>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>>>>>>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
>>>>>>
>>>>>> Changes in v3:
>>>>>>   - Remove S25HL256T and S25HS256T
>>>>>>   - Add S25HL02GT and S25HS02GT
>>>>>>   - Add support for multi-die package parts support
>>>>>>   - Remove erase_map fix for top/split sector layout
>>>>>>   - Set ECC data unit size (16B) to writesize
>>>>>>
>>>>>>  drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 54 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>>>> index 493240ebfd70..dd37b829efbc 100644
>>>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>>>> @@ -208,6 +208,44 @@ static int cypress_nor_set_page_size(struct spi_nor *nor, u8 addr_width)
>>>>>>         return 0;
>>>>>>  }
>>>>>>
>>>>>> +static int
>>>>>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>>>>>> +                        const struct sfdp_parameter_header *bfpt_header,
>>>>>> +                        const struct sfdp_bfpt *bfpt)
>>>>>> +{
>>>>>> +       int ret;
>>>>>> +
>>>>>> +       /*
>>>>>> +        * From BFPT, the nor->addr_width is set to 3. In Read Any Reg op, the
>>>>>> +        * Flash takes 3-byte or 4-byte addr depending current addr mode. Since
>>>>>> +        * Read Any Reg op is called in this hook and SMPT parse, we would sync
>>>>>
>>>>> Hi, Takahiro,
>>>>>
>>>>> I would like some details, please.
>>>>> 1/ with "this hook" you refer to cypress_nor_set_page_size(). Why can't you use a
>>>>> addr_width of value 3 when reading SPINOR_REG_CYPRESS_CFR3V?
>>>>>
>>>> If we are sure that the Flash is in 3-byte address mode, we can use the value 3
>>>> for reading CFR3V. However, the Flash's address mode may be changed prior to
>>>> Linux MTD probe in some use cases. Actually, in u-boot, it is set to 4-byte
>>>> address mode. We need to set the Flash's address mode in known state and update
>>>
>>> addr_width is set via CFR2Volatile, can we reset the flash at probe instead? Then
>>> you'll be sure that the flash is in its default state.
>>>
>> Resetting the Flash to revert back to default state should work for this. However,
> 
> good, let's do this.
> 
>> we still have SMPT issue below.
>>
>>>> nor->addr_width accordingly. Due to SMPT issue below, value of 4 would be better
>>>> choice.
>>>>
>>>>> 2/ Where in SMPT parse? I looked through the code and couldn't find the Read Any
>>>>> Reg op used. Why do you need an addr_width of value 4 in SMPT parse?
>>>>>
>>>> In the spi_nor_get_map_in_use(), the nor->read_opcode is set to 0x65 (=Read Any Reg).
>>>> The spi_nor_smpt_addr_width() returns the value of the nor->addr_width due to
>>>
>>> ok
>>>
>>>> SMPT_CMD_ADDRESS_LEN_USE_CURRENT. The nor->addr_width is set to 4 in the
>>>> spi_nor_parse_4bait() before SMPT parse. Therefore, the host issues Read Any Reg
>>>
>>> if 4bait is parsed before SMPT and nor->addr_width is already set to 4 in parse_4bait,
>>> then you don't have to do anything for SMPT, right?
>>>
>> Currently 4bait is parsed before SMPT. So, if we are sure the Flash is in 4-byte address
>> mode (by u-boot, for example), we don't have to do anything. If the Flash is in 3-byte
>> address mode (default), SMPT parse does not work correctly.
>>
>> Please see this about 4BAIT and SMPT issue.
>> https://patchwork.ozlabs.org/project/linux-mtd/patch/20201212115817.5122-1-vigneshr@ti.com/
>>
>> I introduced another workaround for SMPT issue in my previous series.
>> https://patchwork.ozlabs.org/project/linux-mtd/patch/9a2d323b2c18485d13f271e3bb213b96fea0e7e1.1649641729.git.Takahiro.Kuwano@infineon.com/
>> I withdrew this because this does not work if Flash address mode is not default state.
>> But if we can reset the Flash at probe, this should work.
> 
> Hmm. How about issuing spi_nor_set_4byte_addr_mode after parsing 4bait table,
> to solve this dependency?

or maybe we can add a smpt hook where you interrogate the state of addr mode
from CR2V and use the add_width from CR2V instead of relying on what we get
from SMPT_CMD_ADDRESS_LEN_USE_CURRENT. This will avoid changing the state
of the flash at parse time.
 
> 
>>
>>
>>>> with 4-byte address. We need to set the Flash into 4-byte address mode in advance.
>>>>
>>>>>
>>>>>> +        * Flash's addr mode and nor->addr_width here.
>>>>>> +        */
>>>>>> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
>>>>>> +       if (ret)
>>>>>> +               return ret;
>>>>>> +       nor->addr_width = 4;
>>>>>> +
>>>>>> +       /* Replace Quad Enable with volatile version */
>>>>>> +       nor->params->quad_enable = cypress_nor_quad_enable_volatile;
>>>>>> +
>>>>>> +       return cypress_nor_set_page_size(nor, nor->addr_width);
>>>>>> +}
>>>>>> +
>>>>>> +void s25hx_t_late_init(struct spi_nor *nor)
>>>>>> +{
>>>>>> +       /* Fast Read 4B requires mode cycles */
>>>>>> +       nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
>>>>>
>>>>> Isn't this info already handled in BFPT? What value of num_mode_clocks
>>>>> do you obtain from BFPT for the non-4B opcode?
>>>>>
>>>> There is no parameter in BFPT that describes about Fast Read 1-1-1 op
>>>> (as we can see 'struct sfdp_bfpt_read' in sfdp.c).
>>>> The value of num_mode_clocks for Fast Read 1-1-1 is set to 0 in
>>>> spi_nor_init_default_params().
>>>>
>>>
>>> I see, thanks!
>>
>> Thanks,
>> Takahiro
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
