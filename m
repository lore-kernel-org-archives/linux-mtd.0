Return-Path: <SRS0=H2jB=G2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D894DC433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 17:04:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DF2C22D75
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 17:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DF2C22D75
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1n7Bh3C0J2ECogwFv4n4/4Ba9p5sd+XLTEZovfM0rMI=; b=P4edpZSMUHEIGzNQ0EFsvT4Mn
	FU57KU++ksRUGA0JRL7DGE6XfUMPsXIPC/Y8N5unXW62J3RcOhnEjXap9YCgJlf5Jw0m07k20EBpx
	IDrICuKsCSSRFWWA31xvcpN9ydPBhCad57PhxLkTqbl/A6321JWe/3cIHFoFAUyzf1JxepxpafloO
	WHZtsH4W9mMzTYCE+ijx4+7bEDTDHWRTTPlo+SWfAZqwYoHV8EUiRn3M04HFBm/P+/zU+3UvAtERR
	T+xL3SUMvYHn5wfSif3x9NutUFxrEnO3hJJTL2FyGQTiYujt7mPRQP43dlOxqkXUqxTVF8DM52hsr
	NwJrFSXKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3MJ9-0005pL-SF; Sat, 23 Jan 2021 17:02:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3MJ0-0005ok-R8
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2021 17:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611421354; x=1642957354;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=c10A4sHfyyLjeouHZh8+E8X77jDKemtMIF4Aoe5zwi0=;
 b=nsxtXu/KlIIx4OJrXytbwffXbgAZGEYVo/iph9D7LAFVsFqeBnJD+5CO
 DfUfGMdB1plQ3oJrqC0OjV0xfKkwSuA9I8icfGqLZtmHZUAqk+hMfU5YY
 bryk1ZXkHkq2R40U+BHeLmlPy/LQhDbmrMli2XyInIxnGgTK93lXMWJ/g
 QRw4NId4I8597bCXLDHGsaJPPct4CZw+BoClmN1SmSyVsYdPf+JqYhbXP
 8E6Ch6y/cCCDMbvD71MYZjNHjrakJksuFATcZDP3l0N75qUMk38lPFvNU
 AUGFYf8OfiIn83uJjIDqfbaa0IkAgmX971w+E/Aw1SwMeH6XiyqRQyhr0 g==;
IronPort-SDR: V61o9ynxm4MJa0LQ3FLV9nzO12DvmQ1Ghy/+vgYlg9hOmQUsoK8rH/LclC7N1hK/P4RgqXyuYD
 q0EGfdCVWjaBBhDXLCaHTr/KyKaZb3I7LbXydvB85Wq59eEqnP7s/ww1pL9OaSLL4aR6F+Gf/U
 jlyykUQVm1f+Lu0LEKtWM7dMfgVUTc3ZdJQsY7eeGr3B2LrHZTcOL8PeCb+HlEAu/hWzDKI5j5
 WOjtRbJ1zchu9jaZGkPo9+Kk8+6nJXvwXEqCPtUxMZ5asuQhEjeFaVbDKOMMcXIAyMCQrxFz1B
 3WI=
X-IronPort-AV: E=Sophos;i="5.79,369,1602572400"; d="scan'208";a="112223088"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Jan 2021 10:02:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sat, 23 Jan 2021 10:02:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Sat, 23 Jan 2021 10:02:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sj1M+IcY0mDWTV3d7xgkMQ5EH+NVU8SHqZMCBY7xJMqv7YLVlGXjDYXPDsKtT5EKyoqMR5f9aYNGdxtdlHHk5ebeud7CGDI4GKNImNK3csY2uBSssR4uCWNm91BZohRhHkodkkp/SKsdrLWPuCB9piXpSmxR5PB5zKFZSSWgv43DRDbWHfclqrbMCosa+DIjs5PgW7RdUuORssOBOx+6XSmKYcpDs2QjjxK5YudXIHaLk43iCafho/jmX6Lx6r4SKM47H8Vzs4HufYsGjRfe+Eyu2qOFUy5Oym6rqdBQMyfqCRcsKz2hki+cUnR7sNpt14iTEYKoo3aVH+bunmOfvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c10A4sHfyyLjeouHZh8+E8X77jDKemtMIF4Aoe5zwi0=;
 b=ZXCy0fzw61xkKjYE2DlR+Dir0AiNzuqKAs8qHyoUfyemKjYUswqUT3/DDISFtDUfgnZF3wlW1/M7HxZY4RiqnrJbO7NgUZpHyshk+pKXHR2TYkW89bS0iEXMSG383fUFfWRu5133c+uxJATsUvpTLGMTy/hsVbYhZHAz3FBkFHo0z4+W7GiRMBm2nVtO5+//K149MbNVAL7RytHTus0drNm7rlEqlaSWws/C0N9vnR9OzFYeS/7NDWDyC5CosOWm+VswInZxFD+xX9tMQrUuM4bvx2JvHTewVkwa6IpOhMRsenbZR/O/FbupmF/vQue6rw9s20yBVTP4DTbUTkgg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c10A4sHfyyLjeouHZh8+E8X77jDKemtMIF4Aoe5zwi0=;
 b=Us0dwuyOukxEH1IkyGaxwiywmPo+OWaJSjxFqr0SVUCxFjxjaxdo5yz4G035J/+4f5AhzrnNM7FI0EEQd4MfPDecE3wixpkhAo8QWat973nuxQ9FkAPFDyjpnM6SOs9NXulcBz5olI9P6/+dHG396mtMTXYinDeKfV2tZriFV8A=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3102.namprd11.prod.outlook.com (2603:10b6:805:d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Sat, 23 Jan
 2021 17:02:28 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%3]) with mapi id 15.20.3784.017; Sat, 23 Jan 2021
 17:02:28 +0000
From: <Tudor.Ambarus@microchip.com>
To: <andreas@rammhold.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] spi-nor: Add support for xt25f128b
Thread-Topic: [PATCH] spi-nor: Add support for xt25f128b
Thread-Index: AQHW8amGXnetse7GDkStiA6zZMefFg==
Date: Sat, 23 Jan 2021 17:02:28 +0000
Message-ID: <40568568-b314-7a23-8164-84cbc98debdb@microchip.com>
References: <20201220224314.2659-1-andreas@rammhold.de>
In-Reply-To: <20201220224314.2659-1-andreas@rammhold.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: rammhold.de; dkim=none (message not signed)
 header.d=none;rammhold.de; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfd352b4-7f37-4d9c-da9b-08d8bfc0aa31
x-ms-traffictypediagnostic: SN6PR11MB3102:
x-microsoft-antispam-prvs: <SN6PR11MB31028795015874CEFCF3FB84F0BF9@SN6PR11MB3102.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V5P4Vp7APyo1vbk9Mg9A+6Ysuwn3e4mGP8UvCTXRKupSDoqzlxw4RtA9uQWCZ8DAGj/+U15i+jTuM1l7+iHtwqdzdVuiHwyQBdLIUWwLbKWII5lhFfDMfeUJgMtNxkMe8r4u9Z6aK6DUG8garhWyDfhR349FfFGCoocYQRf3LX0AHX6lJ/hFoizzwpXW2dFX3z+OhD2RNdEXoTiXYf0cZqc5CJnRvCHeNR3VXP7SedPYcFEv8NHQ3Etmvuhx0Raqmgs9uWMgK4LcdQ5DQdzoZMunOhMDzlc6W0DtZGJyuoUC3d9myjV+Xu+ms+SfmA8D5wd+6jHgSK9QlvkM13427g6jzejRZeRk2wRAt9ByCxeLBJj3pS9+WKsAV+Fj3NQmUERtD42VtTEmjwWfFhrJvlQHJGMRsoAsiwBRz5dxl2l1Cff18C+nSceCO1Mhf5WE+nFcePdhRt4VlRtQ1bDuF8BOeKgTPikFIaoQQZ+zIZoJakmZdW8D9i3cTnLByhq6oyP4f5jTv7sW/sdY8FCu4+ww08I0FiuqdvPx2ur/JPO3ZG+SuiR4nUTgXl+YrjCjIXSxREK2H6WfV0GhqJyk+v3Sqvui2rRUYKQAx4+5E1unuEqfn9bdaytOI4Hvu63tJlETU1xaGMCxskI3q9E93X9gg4lN8OXpsqDO5+ULtK3CxHCnH62ojmLYuWojn6kcC3tGdMI+dPJSHUzd0iqEZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(136003)(396003)(39850400004)(5660300002)(4326008)(71200400001)(66556008)(66476007)(36756003)(316002)(54906003)(66446008)(66946007)(91956017)(110136005)(76116006)(8936002)(6506007)(2906002)(6512007)(83380400001)(53546011)(6486002)(31686004)(64756008)(186003)(26005)(2616005)(478600001)(86362001)(31696002)(966005)(8676002)(138113003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Yjdacy9TWGZGczhyV1BnTlNvYmlZSU51WjVEc09pYlhnQ1hxdS95aGxZQWpT?=
 =?utf-8?B?aENWMXY4M3hpQTdXSTBaSFJYUUczRzRuMDRxR3E1L3dsUmtFUlhzR3BrblpG?=
 =?utf-8?B?S0N3ajluaUZMUy92QkVBQ2c1Y1lkYTRMQUF1UXFkYjl1REJCV3NCUU9Vd05N?=
 =?utf-8?B?bFgwb2lCK2hWK0JZVGx6RnlqV3RtRVN1WE8xVytwelMyVnovSW5SMVU3azh6?=
 =?utf-8?B?NURISDRsT3hzenpKamxhUUpMNjVTUVNjM2taS1duWTZqRTNpdEpQbDBtRFl2?=
 =?utf-8?B?SWpYT2N5eG9rbkNTSU9QQzN2QTRRS3VWOUtvYmtaL0pXU3ZVRThaQ1luR1k4?=
 =?utf-8?B?M1JBSjdUcXd1V3Z5Sm0zSFU1SjMvU0U2ZGF5cTBNWFZDdVBjWEtsakI1bHVr?=
 =?utf-8?B?L215VlJYVHkxRUd1UDdzZ0tBczM3blVkYTFQbGNBRGFYLzd0R1RuYi95VlVS?=
 =?utf-8?B?VDNUZGhJbXR0WHpQMGt5VU9VZU5Ba2lLWWdkd2k4dTAzSnMyNDZOaFlWTnh2?=
 =?utf-8?B?Q29KS0dwZUl3b25QTjd2Y2pBUEh6bUFuOHlXbGdIaXpsQUMzYmtCcFdtZHRD?=
 =?utf-8?B?dWpWU1MvZTZSdlJHajRjTG1JRnd5R2pEYmFhUU9vZDdEU01TaDQ5QTZjZ29W?=
 =?utf-8?B?Sm9QYnVRZlZ6YTQyeUFUZnBCUmlqdGVPRmlDUVd6bjlUdEF2UXlNNDM2WVhY?=
 =?utf-8?B?c1BESTBmcWRGeXM2a3E5OHQ5ckZieXZrcExMQ0VEVENEeHgvT0pHUk8wcEZt?=
 =?utf-8?B?RDNBNmpxdnRidWNUaExoWW1KN2tCalF2L3l6TzJFeHpxdVI3cytmQ1N0RnVU?=
 =?utf-8?B?eE1td0MyVnJseHlyWnJnOXMyczJVbVQ1c1pwZXVhLzRBYmplRGFGYWlCR2FT?=
 =?utf-8?B?Wi8vZDhhNG42dSt0NTViVUpvNFZ1VjlLUGcreVhic29YdzBsa29ZWGd4czQv?=
 =?utf-8?B?S2JFUEVEVTNVUG9qRzFvdkFZWWRLREJpV1VXSjg3Mk95cTNmME10N2lhZjVY?=
 =?utf-8?B?UVBGdTZUeXVtZmFaTm91K2JjVGllRXV2RjRQeHBQd3dwSGZmakRjYVRUQ3lO?=
 =?utf-8?B?dFpGbUl1TndiTkNaRFdFVk9xbXUxR1N5U3FUeXJwRE9TZXZrWDNoa3VJVVpy?=
 =?utf-8?B?K2VVZjROcXpTZEhxcEhybWtYbHdpenFPMzdkVyt6L2V4VjJzUTRNeUhMNVBy?=
 =?utf-8?B?ai9ONkVIM3c4dGhIQlE4ZGgzRDMxc3FvbEdPb3FKa242Z0dVWXdNa09GTW1Q?=
 =?utf-8?B?dXZhNk9kU0hIZHZnVHYyUVVNZkFwQ3oyRDh1dDdkRno1UXQycnp5RHFyRXVw?=
 =?utf-8?B?bUF6MDBET1pNaFVzUjR1eUZOYkJVNzVxZzNIcUxMdStOMFJQRHRhb1RBSXNB?=
 =?utf-8?Q?Oocpk1hsiVlpSth3wD3Xnh7W0m1CPRzA=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <87E0CFA6333FDA46B08B9ADA20E41DCB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd352b4-7f37-4d9c-da9b-08d8bfc0aa31
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2021 17:02:28.1222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lWY8DtecQtzmdFXFyTy5zm12t0UK0astkwe/7mj5dUgWIH/44CN3F48n1FIBzPkew+NRegMoaayXAFJQdbBr+GI2QubPKMfZD8RDrQ4TzJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_120235_194375_3ECFE99F 
X-CRM114-Status: GOOD (  23.08  )
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
Cc: microcaicai@gmail.com, daniel@makrotopia.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Andreas,

On 12/21/20 12:43 AM, Andreas Rammhold wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This adds support for the xt25f128b as found on the rockpi4b SBC.
> 
> Signed-off-by: Andreas Rammhold <andreas@rammhold.de>
> ---
> 
> This continues the efforts done in [1] & [2] that went stale. I've
> tested this patch on my RockPi4b which only has the xt25f128b (and not
> the xt25f32b as also propsed in [2]). I have tried to obtain a copy of
> the datasheets but was unable to find them. Not sure whre you would get
> them.
> 
> While [1] was already for the new spi-nor layout it was missing the bits
> in the core.{c,h} files.
> 
> 
> [1]: https://patchwork.ozlabs.org/project/linux-mtd/patch/CAMgqO2y9MYDj6antOaWLBRKU8vGEwqCB-Y1TkXTSWsmsed+W6A@mail.gmail.com/
> [2]: https://patchwork.ozlabs.org/project/linux-mtd/patch/20200206171941.GA2398@makrotopia.org/
> 
>  drivers/mtd/spi-nor/Makefile |  1 +
>  drivers/mtd/spi-nor/core.c   |  1 +
>  drivers/mtd/spi-nor/core.h   |  1 +
>  drivers/mtd/spi-nor/xtx.c    | 16 ++++++++++++++++
>  4 files changed, 19 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/xtx.c
> 
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 653923896205..3f7a52d7fa0b 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -17,6 +17,7 @@ spi-nor-objs                  += sst.o
>  spi-nor-objs                   += winbond.o
>  spi-nor-objs                   += xilinx.o
>  spi-nor-objs                   += xmc.o
> +spi-nor-objs                   += xtx.o
>  obj-$(CONFIG_MTD_SPI_NOR)      += spi-nor.o
> 
>  obj-$(CONFIG_MTD_SPI_NOR)      += controllers/
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f0ae7a01703a..ca1988554945 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2024,6 +2024,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>         &spi_nor_winbond,
>         &spi_nor_xilinx,
>         &spi_nor_xmc,
> +       &spi_nor_xtx,
>  };
> 
>  static const struct flash_info *
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 6f2f6b27173f..cea8c0c25c9f 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -398,6 +398,7 @@ extern const struct spi_nor_manufacturer spi_nor_sst;
>  extern const struct spi_nor_manufacturer spi_nor_winbond;
>  extern const struct spi_nor_manufacturer spi_nor_xilinx;
>  extern const struct spi_nor_manufacturer spi_nor_xmc;
> +extern const struct spi_nor_manufacturer spi_nor_xtx;
> 
>  int spi_nor_write_enable(struct spi_nor *nor);
>  int spi_nor_write_disable(struct spi_nor *nor);
> diff --git a/drivers/mtd/spi-nor/xtx.c b/drivers/mtd/spi-nor/xtx.c
> new file mode 100644
> index 000000000000..a10102d8b3e2
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/xtx.c
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/mtd/spi-nor.h>
> +
> +#include "core.h"
> +
> +static const struct flash_info xtx_parts[] = {
> + /* XTX (Shenzhen Xin Tian Xia Tech) */
> + { "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256, SECT_4K) },

According to JEP106BA, the XTX's identification code is in bank 10
and is comprised of 9 Continuation Codes (0x7f) and then by 0B.
XTX's manufacturer ID should be:
0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x0b.

Can you hack the SPI_NOR_MAX_ID_LEN field, in order to read 12
or more bytes? I assume XTX got it wrong, and put the
continuation codes after the flash ID.

Cheers,
ta

> +};
> +
> +const struct spi_nor_manufacturer spi_nor_xtx = {
> + .name = "xtx",
> + .parts = xtx_parts,
> + .nparts = ARRAY_SIZE(xtx_parts),
> +};
> --
> 2.29.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
