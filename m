Return-Path: <SRS0=sGI+=HU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4868CC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 10:27:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7C5760235
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 10:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7C5760235
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Po0bWvBlvPN7w87zyBPcnxRvOrB9SfIQjoZwdzqY1cI=; b=JR9JqLDXeNIGDKBNUv9EVBdN3
	8m6K/a3Qd6efsVTYm8pnZmbBXzRv4CYw2lecXCFnKeKz94EZ1ZOpfZgbc//z+ZY6U5DHak5uGyf9Y
	qosGzYPVE7xz0eCwbxX7L9oA91YAxumsIf9By7ft4V/XA+hJ1IbWgCY+IS7eDhk3BLC7+CpKFMGlv
	TasfeEX30px0rZpqJoV63arfV/MXozM5h32dV2oiS03XPiqPp2XNMk2dyfr6HEpmkMNOY8yhykvet
	X/To15sbkscu+1VewC6XTHW5S4SWmRTNifJUew8OljSCuGXQkDC+HUv+F8YFvKH16wACeIEF66iNi
	ZFSb6mAZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCgW3-0002gR-C0; Thu, 18 Feb 2021 10:26:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCgVx-0002g5-Ov
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2021 10:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1613643989; x=1645179989;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SOTdipZbMueg84vDaws4DD/Jph12bi2dzjRuwqjhaH8=;
 b=G+XjoXMBvmdVX7s98iLoay+qbnmw4yu2xoQ71oNm4YzrD9d0hrINnA9O
 7N0ONXB/VJry5dtNIMIUfWwwSPpt2Mzh3iHRfwwseMEJUt5GfnJpwvhCB
 61HYwQ0iMMljoYfsHPjb7CAqKudsZYErlBBzcDRpNeIYSBEgkvCl8O9ej
 nI9FbpxdA1jQrXFfhgdMC92PiJ0JZ2LQ5ipqGvMG1oNfsVmGk3zdhcgsz
 73QovGG3tatI0ZHY0J2+JL2g/YQKXZjE6boniJwXWrO4cOZLtTB8yNUqx
 HQEQ2bCTscn4PS9bYKx9uUsKB0xD19wmV2wqI537IILvL4ksefjNSyenE A==;
IronPort-SDR: SlWTf/3Gl28THpFr4VS70sZ9g5XyiYGOf5Ak6sFRBbh/74V/XHlmKPpm3uuSSGSKGtHBuLwgtE
 lrQ4Ke5h9ebOZce/MR4abHK98ShyvqRpHlZC3wFwJ6FQN5GLGDWnO8o6Ggarhs9eKPnL+SHSmK
 yLvT2G0pqbSIXxOzn7n1XxAKy7vKQ62nVvVv4l90549sSSQGxcT15NQTDGxhD/VOS7MUHrP8zp
 B8/QDDfwtzgBPk4vSzhtpLuoZm4aFbSfRtF+tvrdAytO1xyhEWUL+WqLgTMFxplEexJpKMtHxg
 D8Q=
X-IronPort-AV: E=Sophos;i="5.81,187,1610434800"; d="scan'208";a="107092450"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Feb 2021 03:26:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 18 Feb 2021 03:26:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 18 Feb 2021 03:26:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLprZ+5+k6R4GWG04wwMqyKgzCU9KYySMTvGh5qVZTf0oAso+YDsn29uuVkhH/eAGJUcRoZ8X6H8YuKwFxX9c3ggRwNBeynUqjOaXFFTwIziB1mJX1OgxwQKEfVhlQyrsT15W3NHBuJvnL3krwV5moAHP10cghU5W7suQZJUXeBCSnW1R3OUjxZzIm7MRKS24pjp500msgVe7n02IniMuTXJ3gXWqtnYIQ+bX6YBo6kNoxSA6ac5v1eiL14z9arSHeubVL73QxfruGZGyL4WlHqMvUewubbw8Si+eFcVGOP+ew2Y0Op9UP3kpAGMAyGIQB8B32B+GhQrNg5wWfsCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOTdipZbMueg84vDaws4DD/Jph12bi2dzjRuwqjhaH8=;
 b=BPmGz6dVCD8MQVs+NIj8qPAacNAhU26Vp9Y84P6UQBFrFCPb0OLaod6Ykxh8P1UbmJO5+kOGImVV2j1kDHabjKkXzC393f9aOh9Ff6UKJpbAGKsYvWC8v5rRUB2dPOojQY1jwUQpVVR1Cut1KqFlfvRWfckhW2KMDBgT9DOP4xO7IR/dqE4oy9QRQlXKDZ6q1fhVVCEa+l5/SROdjyWYFRFpMdwtBCQyg3r1Gi/QfKk8U/9LvV9YXZfDj7elggt33eus91/m8fPszC2+a/9WP32WihBa1E8xeQf5JN9TXI4ThVO+8MQVqDBLhJ5Rq3RGRRtVjEFkA6SCN3uE8xplgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOTdipZbMueg84vDaws4DD/Jph12bi2dzjRuwqjhaH8=;
 b=PipanIjiCUilnOfiWZN4QYPnVDJjn0NcNhO+3hJjkDUKFO+0qg+6Vylqux12g8hcUHHSKvB+cw7H30uV/o4EED7xMAWSwOyHvKOynV8mfAoqG42ihsaDW2hRboTDJ1LIKamQ6dsh8a1K9Kous6enb6uplh512+cQsON6wLrhQjc=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4954.namprd11.prod.outlook.com (2603:10b6:806:11b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 10:26:25 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%4]) with mapi id 15.20.3846.042; Thu, 18 Feb 2021
 10:26:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <heiko.thiery@gmail.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
Thread-Topic: spi-nor: maxronix MX25L12835F support
Thread-Index: AQHXBFUKEDYf95dZGkCecCm8j19FKg==
Date: Thu, 18 Feb 2021 10:26:25 +0000
Message-ID: <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
In-Reply-To: <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab190c27-b4ab-4c30-0e22-08d8d3f7a55c
x-ms-traffictypediagnostic: SA2PR11MB4954:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB4954043A78502AB14AFD90FBF0859@SA2PR11MB4954.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mTlEqeA4pu3s+5D7/kWugTmxafqRIJDe9zbNTi6zAlo3MH4RHFxOuKr1Xntw49o5vX66MezY4QNGAMrWeZ9bkL9IFyk+3AuwFU7bcLReHXHED8Hii/gTLDt0CGs0zZUk61M2X4GgAKEPJlWM9a3IM/DKuLnmwR1wyVdTNhMfLui8y17QQl3pFofkxyDKHOQxfA18n8qdzpTYnEKnv5m9Avk8biUld+t712QKqMk3uSEnXULTgerCmZc6nY0WhNYSjctkdYNctw3Za2ya+pxTaaPLFSXCxigzSqZ/liVMvmXnEGrx7ZO+Fv5AUpmxfknRluIsR4wj71/MSCtyTS5ppXeg39oXCyWDH43e333LfL8BwTTjF5fmTuiRrw5bg/lyXEizUSHMUenDzrmNeNEjx9Sw0hrIbU/czYVJqAp61VhqCtqLc5GF7DR2gTmGUul7hHp6aE4WjgwBCUYFyu58s9+lwsv6pBBjZcjmPC7CZtz7fVoZl2IcsXCWLUOVsaJYKwfj3J4jaNf8xySrZp0CqrkHulIZFqyOOxdLwXkGLkiSfOckRjfbCQ9ku4eMsKrxI0g6g4oN8/dQfLFabjjX0WOeVlg5Pub5vCtM1CUxUqk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(376002)(366004)(39860400002)(66476007)(91956017)(66946007)(66446008)(2906002)(6486002)(6512007)(6506007)(64756008)(66556008)(71200400001)(53546011)(186003)(4326008)(31686004)(36756003)(5660300002)(2616005)(26005)(8676002)(54906003)(6916009)(478600001)(316002)(31696002)(76116006)(8936002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?b1BUUTI1MDBQNEhKOXRhM1VqZndjbUJhMmFRbzlzdWZLaTNtNlJnTXlNbzFz?=
 =?utf-8?B?Sm9ucGVyYjdLKzR6QlByR01sQWRTcnhZTVZ6SHpiY0ZCbVRUbVVHWjBpWjhB?=
 =?utf-8?B?NU4yV0ZuRzMzeGNtSzVUbDkwaFN6R0paVmVjSlBCVE1YZWh5enIvazZNdW95?=
 =?utf-8?B?VEpmczlWMVQ5ZkQvK1N2VjI4SFM0MUJYbXpPVEw5QWJZZE44UVpsMGR1WVor?=
 =?utf-8?B?RVZ1MUd1dGNKR2NvOWxLMkZTUHROUHVSMGkxL0xYUE9PcDlReDFoamFQTm83?=
 =?utf-8?B?TXpoNHp0dWtwbkhweFpEK1hINHBFdEJXNno5c0tON1Q2L2MzZzNuWnNwT09X?=
 =?utf-8?B?TzB0czZWblVhOHdYVUlPbk1PM1VCbnh0Q3EyMjhOVDF0MHZjdWt3cVJnT1ZG?=
 =?utf-8?B?Q1pzSjQ1Y2hvdnJJVFRJQVMxMlRJejFJRnNzOTEzR20yZ04xSmlRN01DOFJF?=
 =?utf-8?B?UDRJY0Z1QXAxWVVJY0o2WHhQK1QrYVJJRGdXdFVZRXBqQXNFTWsyZ25FQ1hF?=
 =?utf-8?B?K1E4R2JFekFrSWJKZjhPNFcvMW1Rb1d0SkpaaWRIRExhcGMwcXVWWEx6bVhm?=
 =?utf-8?B?bFRja0VEUGlEWGh1cFlBU3VQOU50RTRHUjNOeHlrQ2VuQWMrTCs3dnVhZW13?=
 =?utf-8?B?cHF1N2JQNmRlcFZKNFRXeVorUm5oNFlRNkx3MFN2K1UreG1RZXNmd0czU1Jp?=
 =?utf-8?B?b0JHV3F4dWZtRzB2eFNOTGN4T0hleW9XSTF3SEFDOElzdWVhc1NTZjhMQWZq?=
 =?utf-8?B?SUdla0toaHhlQ2tHcWVHS1hZQXlUOEJlTkptWDZsc0ZKL1l1eWZYS3h3WWdP?=
 =?utf-8?B?ZlhRZERmQnFTZDRXNFVmUHphMTc1RWVCZTBXUE9TZzJTSkd6RHVaNm5KaG9W?=
 =?utf-8?B?TUtuM01uM1lCRkhOZ3pKSmdwalV4UU1WQ0FYY2NqbEkwUlczWUc5eGkrNUo4?=
 =?utf-8?B?M1p6VU04NlNYVzEwSGExWlVvR2kyTkNlUXpuRU43U1U4ZmwxRWpzbmkzV2pI?=
 =?utf-8?B?dFpMZWJVd2puajA5ZlRyNTNDS3NwK0xtajBrdzBkVW1VYmhOY1Z1VGxJdU1s?=
 =?utf-8?B?ZzI5TGRmSDRKQWNBQ1R3d2JWSDkrbDEwNkZySHRyK0VsQlpIMzkwc2xqOERx?=
 =?utf-8?B?NnkzSXFaZEZSV1pkTzhkSDlZVHJ3Y28yT0tCa0wzM2lJS2JIVTA0MGhLbU1a?=
 =?utf-8?B?UEJWcEFpc1JIVkpUcmlKNXgwWHl6dDVFaTZ5UkNDdzNTOHBQRUcxQ3MwdjN6?=
 =?utf-8?B?RllxbGlXY2EzMGI0dnhlWlZaT1d5bk5uUjJZajhMRkFTS1E4UXQ4Y0VMSTh2?=
 =?utf-8?B?ZXZVZ2FteTUwRVRybVNxMWRuMFRBMk9GVXU1OUpuOHVibUFEWHFUN2JPODlN?=
 =?utf-8?B?ZDRyOXIwSHZKb1lBVXNVUW5GdHNjY3NEQUpHMjR4RFpWSWFjT2xSaGdLazZT?=
 =?utf-8?B?RTV2VGNheVNhMHpFSjExM0p2akJ1NklVWVJGR3ZQOEw0UzJGN2VrL2F1cXZK?=
 =?utf-8?B?MmVDVXVqellIUW14a2QwWENJb3lTL0Mva2lNOUVvbXhYd3FlbEhmanlJRTN5?=
 =?utf-8?B?Q0FqNWhpcVg0cDRVcy9rWVNUdFJMSjU5QmYxRFBIb3hEc1k0Syt4aVQ2dS80?=
 =?utf-8?B?Q1JvRCthbkQxQ001cXZqOE80eDlXUWRUKzlqTklnczMrZ2MvYkZLR1FuS2Rm?=
 =?utf-8?B?MDFOaDhpa2VPVmlXMkdWVVZ1aUxUczNKNnhGR2VZNDVjdHhqdTZsS0dUMFlP?=
 =?utf-8?Q?FNHnZ9Sr0S2KFVJIjM=3D?=
Content-ID: <8E7B8D87748FED40B22575C05108C12A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab190c27-b4ab-4c30-0e22-08d8d3f7a55c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 10:26:25.5839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 149QAyITefCOQ191jT+I/HBHKULvCYEB/JfsJ2CxmErs3YloAk1pPgj9A364mpQcWdN52zRXiZFr86LWzsUzmYJAcJxExwdEoCxN/0pqIUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4954
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_052630_063949_56FCE554 
X-CRM114-Status: GOOD (  21.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, ycllin@mxic.com.tw, michael@walle.cc,
 linux-mtd@lists.infradead.org, p.yadav@ti.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/18/21 12:15 PM, Heiko Thiery wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
> [...]
> 
>>>> Thinking loud, now we do a static initialization of flash params, that
>>>> can be overwritten dynamically by SFDP. How about doing the params init
>>>> the other way around. Try first to dynamically discover the params via
>>>> SFDP, and if SFDP fails or if it is not defined, do the static init via
>>>> flags. That would spare some code. And new flash IDs will have less flags
>>>> declared, and we'll better track faulty SFDP flashes.
>>>
>>> I am a newbie but it sounds reasonable. I made a first attempt and
>>
>> Let's first see if all parties find the idea good (I'll have to double check
>> it myself). Vignesh and others might help.
>>
>> Until then can you try the patch form below and see if you can do the
>> reads in quad mode?
>>
>> Cheers,
>> ta
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 0522304f52fa..718d0b75df91 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3099,7 +3099,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
>>         spi_nor_manufacturer_init_params(nor);
>>
>>         if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> -                                SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
>> +                                SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ |
>> +                                SPI_NOR_AIM_SFDP)) &&
>>             !(nor->info->flags & SPI_NOR_SKIP_SFDP))
>>                 spi_nor_sfdp_init_params(nor);
>>
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index 4a3f7f150b5d..3495549815e6 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -338,6 +338,11 @@ struct flash_info {
>>                                          * protection bits. Usually these will
>>                                          * power-up in a write-protected state.
>>                                          */
>> +#define SPI_NOR_AIM_SFDP       BIT(23) /* Try to parse SFDP. Used by flashes
>> +                                        * that share the same JEDEC-ID, but
>> +                                        * where a flash defines the SFDP tables
>> +                                        * and the other doesn't.
>> +                                        */
>>
>>         /* Part specific fixup hooks. */
>>         const struct spi_nor_fixups *fixups;
>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>> index 9203abaac229..1ebce775eae4 100644
>> --- a/drivers/mtd/spi-nor/macronix.c
>> +++ b/drivers/mtd/spi-nor/macronix.c
>> @@ -50,7 +50,8 @@ static const struct flash_info macronix_parts[] = {
>>         { "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
>>         { "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
>>         { "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
>> -       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
>> +       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256,
>> +                             SECT_4K | SPI_NOR_AIM_SFDP) },
>>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>>         { "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
>>                               SECT_4K | SPI_NOR_DUAL_READ |
> 
> I tried your patch and it works like expected. I can now read the
> whole flash in ~2sec while without that it was ~6sec.
> 
> # time dd if=/dev/mtd0 of=dump.bin
> 32768+0 records in
> 32768+0 records out
> real 0m 2.08s
> user 0m 0.01s
> sys 0m 2.06s
> 
> vs.
> 
> # time dd if=/dev/mtd0 of=dump.bin
> 32768+0 records in
> 32768+0 records out
> real 0m 6.16s
> user 0m 0.05s
> sys 0m 6.09s
> 
> 

Great, thanks!

> Should I prepare a patch with that change or will you do?

Let's wait for a few days, so others can intervene. I'd like to
clarify what's happening on mx66l51235l too.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
