Return-Path: <SRS0=H2jB=G2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7EBC433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 17:46:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E779622B43
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 17:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E779622B43
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ckvAPyLrjOBzV54RrksUQ5191LPZyI2nTKJCVSAsAbQ=; b=SHJ/vd3SJENs/jfHjQZjROndQ
	+9WDK1NgSCK9W4x/WCvMyebAnt6ias6x8TrWU7WDGouIrmQpYR23ZgG6TafNQ5AJH+asDpq6d/5M+
	TcchCWkPyPwBQi2aisjzccO9qnTWL1fD4U7jZqHEOCc7Nc99FZWjFFIN2U56zZ9VNpC5CWw4ai+Dx
	9qnQnpntz5sJLC0OoWIxGcFDdV/akFa0hKCghzyXQJFMGS+5ZUmIgMW0at2HodxVNNQCaMBmQCwcF
	TEI6wANrKYpevdL5iuvarnhk2i8RO+TR72vD5Ry8dVE5WG9kSEj5YGCXr64nHE/prdwAerpjSponm
	L4hO/WYWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3MyC-00020m-Tx; Sat, 23 Jan 2021 17:45:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3My8-00020M-Ut
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2021 17:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611423904; x=1642959904;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KaVpx5R3GNRjglZdN/48DRjvfLI0PVov6AFzzaUoQy8=;
 b=kgqtoe82rZ3LYbl2yRettVbr9dlZZI4XiJ7XLYsoFl5NBVxq7EKHJ8Ni
 EYg23SryLlI7AgVKYJ0gu04zDJtAbKEuBysWYnguIs6OzAU7BruprgSrU
 Wbu9zAkqxEipIxbUy9ti82lbI+zGwfHGc+2DjKGK14PNKKeN99pjQFKSI
 j125LeA7XuG4lmj5f3q9rG6fvVKUiYSPAFL+th1Vg0wwceK1O//fNRwsq
 oYhlnR7ucMI3oFkyPhQz5qdXg78dlS0C7DxWif3e48EuxadWW6hBm1HjZ
 u7F2eDSEgbXQq2iDoCiLoKa1nQdsnxyyitCfuE9pxT6kW4GZLf2Bp3NRi Q==;
IronPort-SDR: jQB+LzXJoIY1t2KEgOsBOc2jtXhzVupoo1c19n2zcK8r+SRAxWdnFj4KuwA3AI/5lh7NnEiJt6
 UH9xF8H1C0cyFnYZBQNW3UPpGjffDOKRXW0HtL6bu6KRX67Y3gryVaM/SqZME5aLwQmdZux/kv
 yn8U5e9IEwa2HkcCwkGYkvGMWVD9CCjVR1M2NqrR1Gs/RRzxvAF8ysYgalR1zAe+BSGWkrOXfp
 CUGRVzTNDo5h0hjqrABQpxTZ3/h37QtMbTIFxHnCHVSB2QPk7alXQt+MZjZxLGHBGszKcni56o
 xfo=
X-IronPort-AV: E=Sophos;i="5.79,369,1602572400"; d="scan'208";a="107048593"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Jan 2021 10:45:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sat, 23 Jan 2021 10:45:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Sat, 23 Jan 2021 10:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcijyhYaDW0UmdQ5a/Lv181CRfcBbmSLcZzwlFFPePIPdfDttuQzFDaUn1rgGnHUL5VLEEv3Jo1ePTm0lOYQNjLZLmXvCBrQe9Vir5R4k3jvYczXwLmRMYvwhIoyMcUkQdwe+7FSGIs8klZEBZOQZxyIajWWoy7TMWvYZ1kB8tGTJdtMOeAssidQLC0SOdCi1cMEBCsBt6kdpw2jkleT9xfQylnogC2Q4pJ6tW5S42p+0dY0ZtU3rffKNpUOplPOaNKeP692z/mQIib7PgBs3LLkG8/z+NVJlRQK+WhtWiCu3VIQQrREtZoPbKh7+OsceWrMkLVi8kSgcPB/pXDR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaVpx5R3GNRjglZdN/48DRjvfLI0PVov6AFzzaUoQy8=;
 b=MsRTrnBsyO5hlXekP1wHTE3ZE05A2h4W2jlCXPKtetbES96+LYjIjfSyt1yXrSdfJ3PxOm19+huZ0d04XwcixVdHh7aGj1AsTd31dDh6XNARU27XbCUX8ZBnM9ZsVvBxqtI2/IK47KsCzabSNqkdtPW7qq3ohadLwVaJsWGO8f7wrZwWUZMoqBhRHrbued2+ucG/Q/w+aYP84SDdFBPdpA9z/nc8ihfvpP2Ovph6iCnYjst9c86SwDTsMM7bQTIVNtLMsSFu3Nj90DMdEb/UuLJKII/Ws7C9A24IAKd+MGJfBMkPRjftznX6OAQJWusgwyjvqzOhJjFRYRIFYLsJTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaVpx5R3GNRjglZdN/48DRjvfLI0PVov6AFzzaUoQy8=;
 b=i0siuIzNyx3MNjnVdvgC5PaI38ZDG74wZLC0VwM9xj0zwC4Zn+bhLFEpYHoMyj7jBfF6sjjAgjP3wXV0UOqwyeKp8ACU5M5FZnhMQqY4+5icVJMiF0HZlAHiBuiJToHu4RLhB9cNKfiIA9lcEP7tvtLv7/MvJGrUh0tRZ2jjWWk=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2733.namprd11.prod.outlook.com (2603:10b6:805:58::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Sat, 23 Jan
 2021 17:45:00 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%3]) with mapi id 15.20.3784.017; Sat, 23 Jan 2021
 17:45:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <yaliang.wang@windriver.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
Thread-Topic: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
Thread-Index: AQHW8a94mMSXtQqoOE2NM8lFQHXK9Q==
Date: Sat, 23 Jan 2021 17:45:00 +0000
Message-ID: <f2fe7e4e-a651-491c-f894-8cc264c64744@microchip.com>
References: <20201116153956.588098-1-yaliang.wang@windriver.com>
In-Reply-To: <20201116153956.588098-1-yaliang.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [5.13.1.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ca20101-ea12-4dc5-eec5-08d8bfc69b72
x-ms-traffictypediagnostic: SN6PR11MB2733:
x-microsoft-antispam-prvs: <SN6PR11MB273340E4E653A735937ED56EF0BF9@SN6PR11MB2733.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 051gQVgb1Eja1s4f0pmqM6o8T/4Jvf9fgbuwdYY1BHRkP9GaodKEf5gaI/fv0YI0eTQOuFPfbKpeRbgsaOE4BEP84LMpW7n01rBnHz0BnRWS4KYB9uCv9n3ByHPNLzmOPIoeVdnKfuUs+yNk2U3GgfCiyAS36qF2287Se23ws8DSEp52s8vz1/2XcjSMdO6aV8hzqGWOwTTNeDXv0kNaHdsmnsTvzKFWQgIBXh7TzmCy02AGY7hr8/8sJWsu4y+IzgIEIS96jJqQFesWOrWTzF/bz3F63zSsgrUlklhE4rrmow6lbf9Uxw7iwtbkKvwjYJgeCFNvPPFC1S78FuH0aum+HxAKQBI5DJ/Jcc1Uq7JJPFasYPQS3NpteqoGOsH8WV9UJagWfmf5GWX37ljfwb445v7DPsQXUemu8IPsWvsqq3R3Lv/F+bMlUjY4UKntRZnlkY/mDMBw0tRn89Zw+sHxwT+ewRynlvdfzce42ECHSgZUzn2VuCbQxcACl85riN/AwX1PIE/KcT0NACGmT5cuMl16qD4sR8ngXtRa7kaq2/ThLniRzH3T5+HKDKGYCEAV9NlY1T/rvrVJ8Wo57mYwoYwo1IV/0T+v3Xd17Aw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39850400004)(366004)(396003)(376002)(346002)(86362001)(478600001)(36756003)(110136005)(83380400001)(31686004)(26005)(8676002)(53546011)(186003)(31696002)(2906002)(66946007)(91956017)(76116006)(5660300002)(6512007)(6486002)(316002)(66476007)(2616005)(66446008)(6506007)(71200400001)(64756008)(8936002)(4326008)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UXFRWS80NVdXNzhkVDg1OVRxNGhacUZUOFU0a1JLOFZkNkN3SEdrODU3NXN2?=
 =?utf-8?B?K3o0WTVEeXJUVFVoSlVFcjl2ajFLUVRCQ29wRUVZU2k1ci9uSS93ZmJKaG5D?=
 =?utf-8?B?djRzTXJzN0FIUHhralFuV0hBK0htaGhGTVI1UzBqMVhZMlVRL3JXYXdleFRX?=
 =?utf-8?B?OVU2Tmk1bUtBVHA0THFaZnZoMXJ2elBzbDh5UTE0ak10SVF4bHlhSlN5akZT?=
 =?utf-8?B?U0d2RDg0VmVJV0xtT3RVUGRDT2tBbU5DN3FtUFNlV0lDdzNVVmlJaGxWSGVI?=
 =?utf-8?B?TTVlaWcwd2tZT1o0M3UydmkvQXRJVmpNZTZqakdhZlMvNGlpRUp2OFlRYkJK?=
 =?utf-8?B?YWdLNmF0TVJMcEt6a0dGVmVXakN1ckFHajU0djE0YlJpSStma1dyY1J0N0Y3?=
 =?utf-8?B?SXhrRUwzL3h2UTdXQlZoTlZxSGxSbllFcWdQTVRlbE1OWmlybDhROFVDQW5J?=
 =?utf-8?B?eHBIcTkvTXpWWXVUQmJYK2JQL0hFSTVWUk1wc1JFSVZIYXRjVFdyR2NTOTNi?=
 =?utf-8?B?dllWeVZubEpuaWNHTkplOWZybW5YQndjMVBlejdVM3lBa0ZvcnFJdTE2L3JL?=
 =?utf-8?B?K0JVZW1IVlVSMTBvQ2h1Mm9JN21MYlJCZ3NNRXB4dlhSYzRxTlhvRk5sV2hI?=
 =?utf-8?B?VDJtdElRdlgwVTFhZ05kaUdTUnNyekxxOHJDd1ZYdGY0ejIwemhyU0IwU3or?=
 =?utf-8?B?bzRGSjZQazFRa3FEc0I5TmVIVy8xVVZsNjFmMmJrczZadi9LRllSeHY2SGNQ?=
 =?utf-8?B?YmNXR1BZR0NyYWlqZjlqSGkraXJIQlBsOWJ1ekcrRERPdlE2bHVDOWxGZHMx?=
 =?utf-8?B?QjZHZFhZMTVOODlKeDlUQlhxYjcvYUxQc05EME41UXRNdGQ4TlhwdmVGaC8y?=
 =?utf-8?B?RFhRRXNQL3RkeTY4R0lIWmlFc000MklSTEg5d1FPclRNYTRpd2JBMDJQTGRj?=
 =?utf-8?B?aXIrT2V1RFlwU0IzS3N2QUtHSTU3TzNJMjRaMkNzQ3hKL3k4Ukg5SkZVZ3Fh?=
 =?utf-8?B?MTlhSHI4dk5UbHRCdWpoZnpyS1FoK2J3MzQ0WitFRW5nSXk3UHVZbnA1OUhu?=
 =?utf-8?B?SXFGK3hsK2Z3TUc2enlZU0VsQ2dnOVp5YklzZFNkdUNocVo2RnYwUzBVRW9E?=
 =?utf-8?B?dTh2UUg0VW04bXhrelZKWm9Ja3N5Mm1vdXk5VVh2VjViUXZDSnd0Sy9qM2ls?=
 =?utf-8?B?UEZMWk9XZUZ2U0Z1eW1sRE42RHpvOWJxMCtqZ1VCNS9jTVdIVjhhT0UxZ2Va?=
 =?utf-8?B?Z29oZGtlYm9jRXRwYUdqTFFZNFRpWEZ5Yys1dmdCQ0lYS2F2cmVPa09zc0Uv?=
 =?utf-8?B?UHdJZ1ZUTGJMT0d0VEx0bFZEeUFqTWRxUWY2aHZnWWxzOUNWc3FTUUc0dFFE?=
 =?utf-8?Q?9qsXDe9SyDK4LWl519r3kCewIJOv6mY4=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <7315FFD80BFD414A95C5D10ECC385DBC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca20101-ea12-4dc5-eec5-08d8bfc69b72
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2021 17:45:00.4628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SwSmoXafWbiPBNalDTNDNGE/lxBvIiVaN3FsFYLiMYHZwcNBb+8ICZfscYxh2KL8E5CI05/6++GVg68FatgqMRku2U/xF9hoOACSgStf0wI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_124505_303537_761614E3 
X-CRM114-Status: GOOD (  30.69  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Yaliang,

This is really useful, but we'll need it in a different form.
See below.

On 11/16/20 5:39 PM, yaliang.wang@windriver.com wrote:
> From: Yaliang Wang <Yaliang.Wang@windriver.com>
> 
> S25FL{064|128|256}L chips can't recover from errors, when there are
> program error or erase error, P_ERR or E_ERR bit will set to one, WIP
> bit will remain set to one, A Clear Status Register command must be sent
> to return the device to STANDBY state.
> 
> The error first recorded in commit <c4b3eacc1dfe> ("mtd: spi-nor: Recover
> from Spansion/Cypress errors"). Whlie FL-L chips shifted P_ERR or E_ERR
> bits to Status Register 2, which causing the current recover process
> doesn't work any more after enabling using CLSR.
> 
> Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
> ---
>  drivers/mtd/spi-nor/core.c     | 96 +++++++++++++++++++++++++++++++++-
>  drivers/mtd/spi-nor/spansion.c |  6 +--
>  include/linux/mtd/spi-nor.h    |  1 +
>  3 files changed, 99 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f0ae7a01703a..3aa1484deb85 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -537,6 +537,88 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
>  		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
>  }
>  
> +static const struct flash_info *spi_nor_read_id(struct spi_nor *nor);
> +
> +/**
> + * spi_nor_s25fl_l_read_sr2() - Read the Status Register 2 using the
> + * SPINOR_OP_FL_L_RDSR2 (07h) command.
> + * @nor:	pointer to 'struct spi_nor'.
> + * @sr2:	pointer to DMA-able buffer where the value of the
> + *		Status Register 2 will be written.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_s25fl_l_read_sr2(struct spi_nor *nor, u8 *sr2)
> +{
> +	int ret;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_FL_L_RDSR2, 1),

We really want manufacturer specific code out of the SPI NOR core.
Can you please check other manufacturer datasheets and verify if
others are using RDSR2 (07h) opcode?

> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_IN(1, sr2, 1));
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_FL_L_RDSR2,
> +						    sr2, 1);
> +	}
> +
> +	if (ret)
> +		dev_dbg(nor->dev, "error %d reading SR2\n", ret);
> +
> +	return ret;
> +}
> +
> +/*
> + * spi_nor_s25fl_l_sr_ready() - Query the Status Register to see if the flash
> + * is ready for new commands. Used by Cypress FL-L series chips.
> + * @nor:	pointer to 'struct spi_nor'.
> + *
> + * Return: 1 if ready, 0 if not ready, -errno on errors.
> + */
> +static int spi_nor_s25fl_l_sr_ready(struct spi_nor *nor)
> +{
> +	u8 *sr = nor->bouncebuf;
> +	int ret;
> +
> +	ret = spi_nor_read_sr(nor, sr);
> +	if (ret)
> +		return ret;
> +
> +	/**
> +	 * P_ERR and E_ERR bits are located in the Status Register 2
> +	 * of Cypress FL-L series chips.
> +	 */
> +	ret = spi_nor_s25fl_l_read_sr2(nor, &sr[1]);
> +	if (ret)
> +		return ret;
> +
> +	if (nor->flags & SNOR_F_USE_CLSR && sr[1] & (SR_E_ERR | SR_P_ERR)) {
If checking other manufacturer datasheets, would you please check if
CLSR is used by any other manufacturer?

> +		if (sr[1] & SR_E_ERR)
> +			dev_err(nor->dev, "Erase Error occurred\n");
> +		else
> +			dev_err(nor->dev, "Programming Error occurred\n");
> +
> +		spi_nor_clear_sr(nor);
> +
> +		/*
> +		 * WEL bit remains set to one when an erase or page program
> +		 * error occurs. Issue a Write Disable command to protect
> +		 * against inadvertent writes that can possibly corrupt the
> +		 * contents of the memory.
> +		 */
> +		ret = spi_nor_write_disable(nor);
> +		if (ret)
> +			return ret;
> +
> +		return -EIO;
> +	}
> +
> +	return !(sr[0] & SR_WIP);
> +}
> +
>  /**
>   * spi_nor_sr_ready() - Query the Status Register to see if the flash is ready
>   * for new commands.
> @@ -546,7 +628,19 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
>   */
>  static int spi_nor_sr_ready(struct spi_nor *nor)
>  {
> -	int ret = spi_nor_read_sr(nor, nor->bouncebuf);
> +	int ret;
> +	const struct flash_info *tmpinfo = nor->info ? nor->info : spi_nor_read_id(nor);
> +
> +	if (IS_ERR_OR_NULL(tmpinfo))
> +		return -ENOENT;
> +
> +	if (!strcmp(tmpinfo->name, "s25fl064l")
> +			|| !strcmp(tmpinfo->name, "s25fl128l")
> +			|| !strcmp(tmpinfo->name, "s25fl256l")) {
> +		return spi_nor_s25fl_l_sr_ready(nor);
> +	}

No, we can't accept flash name comparisons in the SPI NOR core.
If CLSR and RDSR2 are just spansion specific, we can provide a sr_ready
function pointer that can be filled by spansion flashes. Or some other
method depending on the CLSR and RDSR2 exposure through other
manufacturers.

Ideally one would skim through at least 2 - 3 datasheets from each
manufacturer available in SPI NOR. Preferable each datasheet from
a different manufacturer family. Unfortunately I'm not aware of any
standard that describes all the supported SPI NOR commands.
If you find this overwhelming, I can share the workload with you,
but at best effort. If you go through this by yourself, please
save the name of the datasheet flashes that you go through.

Cheers,
ta

> +
> +	ret = spi_nor_read_sr(nor, nor->bouncebuf);
>  
>  	if (ret)
>  		return ret;
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 8429b4af999a..e0ccef793e12 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -95,13 +95,13 @@ static const struct flash_info spansion_parts[] = {
>  			     SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			     SPI_NOR_4B_OPCODES) },
> +			     SPI_NOR_4B_OPCODES | USE_CLSR) },
>  	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			     SPI_NOR_4B_OPCODES) },
> +			     SPI_NOR_4B_OPCODES | USE_CLSR) },
>  	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			     SPI_NOR_4B_OPCODES) },
> +			     SPI_NOR_4B_OPCODES | USE_CLSR) },
>  	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
>  			      SPI_NOR_NO_ERASE) },
>  };
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 60bac2c0ec45..a802f8f9e1e5 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -99,6 +99,7 @@
>  /* Used for Spansion flashes only. */
>  #define SPINOR_OP_BRWR		0x17	/* Bank register write */
>  #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
> +#define SPINOR_OP_FL_L_RDSR2   0x07    /* FL-L chips Read status register 2 */
>  
>  /* Used for Micron flashes only. */
>  #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
