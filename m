Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C485EC3526B
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 14:51:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B71F0222A6
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 14:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B71F0222A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z4ZECyTvgEmTZt4ELmpknep9+tIkT7o6Pxb8vJDSlJk=; b=YtlFdpdXgUvQHIB/fKdAicmlZ
	W5aogJmTvjh2JR9x/uUyxMixJpeRaM/mlwTafdDUiupwElr80AF7gP217PYCJ4UNsuZM5Xausi2Du
	9DvPUqvlwQryF1tadNBnz7hpGJPeTAijAHmL8+K41+p4CPH6qygXX0hAxWH0Q+vZeWxGUYygHBfP2
	Gt2ELnkwR1zQackjP/oX/jgH9cV+tXF7PjUtPcI82xidrsn5Lss6vjI2Yr40z51506DYerxQBbSXy
	3TEias8y/IqGIzIQLMFOMbXD7e1pVID8ks9zXfU8z3VZ4HsUMRkQ0jRoZt/P5orIpfZb0W0us3ZP6
	bDIW04org==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkpgi-0000y6-PY; Thu, 03 Dec 2020 14:34:28 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkpgd-0000xY-8g
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 14:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607006063; x=1638542063;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vTXcx0IErMshe2XtTANjxvPmVgJpd2n6QyksbKHKAq4=;
 b=h2uiy+nZpAStHv2dCbcVfRwSoJ5EmHZFZJ7Tur+dZNWHWaytuBeuPSV3
 FYOA9yhqOzDcZtwjRe4J2g3cNx3HEd1N37FbMViINrMJe9g0b2AKHa14E
 tnZIbTey+SE2+hVzIIxJew1gDBaz0jwxr5cUyC1uh1ydHGL4F7qN0rqjQ
 gwqPar3ejzyYLZwhll3HdxRGoypG1THTMWwju0c6gaq1yT/LTySP/regk
 fjjDxxXjCFVMRApSremh4Ngm/hVWiANnymYdIM8SlVra0qrkePZIJtB8L
 iP9pDnarYAs/RBT4vOLh1tewAiRUhSKBCms69zLHF8ceR0lJeSCE2aAn9 Q==;
IronPort-SDR: bnu8a5n8tRsuOV//0OUmrye2B8vEANQ1TtJBEBdHnslX4ijF+mKyz2Q4zy2LSxHGdwG+YtL3Wz
 VD8A71eBR/rXeyRVDbmcIxyq/BbET3W3y1l6lKdrdkUQ9lTMjSxoXEDCEdm72GnHr5TG0rEPzz
 PW6t7/lS2E1y5Y1cQQmhwLy8GPrX1H2tBppiWMSRdef3LSxDIQhnQT+Lnp/PPz1SGy/dQSmztF
 Eo10+euSWFfBarTAxw0vcijDd/LJhKFzVoHeQW9odj17c0/GvQmNsCOg0HW4CGexjCGViUBKqh
 L5o=
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="35963898"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2020 07:34:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 3 Dec 2020 07:34:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 3 Dec 2020 07:34:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4pV7du6qOlyv4CfmDka+ZqmcGcQ1AjpQ7yVQfGT6wC5Qne3uQsJCSyiCzPudb0W/OphAstXK782k9dKmfyaU4iMgVBYwX2i4moMN3CiWRXAL2i+WTMNAN6OwlHvnhsknmipFCItteWeEWaVWkrAIyXpUzIWl6Dp/r3a+p/yCyLMKzzbC59OeajC3yGG8qBa3BTv8fZaaFDyMY2mHnfVRFqzUEk/Z2Cav7153plEdtaLPeioIpnrn13dLa5YlcHYyqb+D/6+CBgoogj+w0A787DLw2shEGroyGDAzdBp4ecbc22gBIRxW2ZhNotdUieo0K+b+rjPjhbBRMJ/JdN1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTXcx0IErMshe2XtTANjxvPmVgJpd2n6QyksbKHKAq4=;
 b=EaKGe/UJPY2OyKIs2+3cPRXWchHmiA4IBAsz6b5Dk3SYEyTiVE9Q6tMLWvw+PdXnMEXzUqLo85VZFZ9fPwZtZj5UtzBH1oIudK6Zs8cIFCM3ewcBcT6BQZ2GC+7KOkxd2saRDZnBGGjil0Xm9M41tKKmgCU3amrlGyrmmHayzoPngogXmaRTEd851uWdGoZYxi9Th5EZzU94sMfk1XhuO1+4B4eDQJcfpmY3X0m9SQRzhpglMNXAr6ANISAyLOU1jjAKifkUGXXK5fnPT+UO4NaA5NuM29cwH0+W+FljxSxXGef4IWdigJTNOryVvdlmGcSfh2kDPB5/yaR809yeCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTXcx0IErMshe2XtTANjxvPmVgJpd2n6QyksbKHKAq4=;
 b=o0vOSe8qPL/Bxwh/jTW5yo5iOxkdbhlv67I9/3ej0ms3i7aAy3Dcze25XNL3LaQle4OE53ZeVwVvSrGxDz3VgOb3c15/FFOi855zDDwwp4Dpi24dG7CHXXWnbVQkoPl1oQBtgIjIgiBsGudrrXUvhC6+34fBMCdnQ7TK8okWwPw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 3 Dec
 2020 14:34:18 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3632.020; Thu, 3 Dec 2020
 14:34:17 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/7] mtd: spi-nor: sst: fix BPn bits for the SST25VF064C
Thread-Topic: [PATCH v7 1/7] mtd: spi-nor: sst: fix BPn bits for the
 SST25VF064C
Thread-Index: AQHWyYFhbYejLXpUREmrcdCKcR8FGQ==
Date: Thu, 3 Dec 2020 14:34:17 +0000
Message-ID: <44be8e3c-86ca-501e-e575-55f17747bda6@microchip.com>
References: <20201202230040.14009-1-michael@walle.cc>
 <20201202230040.14009-2-michael@walle.cc>
In-Reply-To: <20201202230040.14009-2-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 974217db-7acd-4eab-4464-08d897988410
x-ms-traffictypediagnostic: SA0PR11MB4750:
x-microsoft-antispam-prvs: <SA0PR11MB4750C904973E2C064546718EF0F20@SA0PR11MB4750.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SfvtGKDALkggJCntT1Be7GIsB/OaBIYPyamcELTlgxgBw2Jjz88m1avG/LlQQyjyBZtJTTTLJRnkk5ex3sVXf4ew1278qNr93FVJ8UkLhGIvilNhzK9L11jSYJnDi/rQYBZZB3P7kEXCr4ZEKlyu2Hwn53bGqNeRtnYlOugTG0Lf9MXv4UTZOiBWO/1fsq5bWKHQQI3khC/uWTX0s0EV/GVQndzoKgvVDo9PVDSAY4VwARbhez/L+BidzXIowEdPbXEZNP5S162RBPWRnML/5q78IazmHk6EdzT/AQuckQWOx1Xefxkom1e60RfIHUJHgBvdCNXdLU5P1v7QlFwpvQ4yZAOPKFz/vbsuoDP9geEzTBR2ubUV2EpxCGmC1S7ma2i1v5bxkCxTArOBCMEKl+qikKvY3aGQ5manSuHlgSk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(136003)(376002)(39860400002)(396003)(36756003)(8936002)(186003)(6486002)(66946007)(6512007)(5660300002)(26005)(8676002)(66476007)(66556008)(316002)(6506007)(53546011)(64756008)(66446008)(76116006)(71200400001)(2616005)(86362001)(4326008)(110136005)(31696002)(2906002)(31686004)(478600001)(54906003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WGplY2pHbGtNMU8rdFcxcHA3OEdaQkVxdHM1czYyQW96dHFML1VyK3dXSlpB?=
 =?utf-8?B?TCtDMmdWcjE4UEl0Uk1FZi9HeTd0OXdOUlU1YUZ5aWRKaWtGOUFKOGxDcjZU?=
 =?utf-8?B?SHpnQ21pT0RUdW9rMmlicFNJNWlUK01FVzVQR3pBYWJVeTdQaURHWlBsVVpp?=
 =?utf-8?B?d0dkYzZ5Z1dvQjZXUXRuZjl3V0p0cElWb0FCbWdXd1dIcTIvaDFYT0orbkpL?=
 =?utf-8?B?U2FMcFcxTkJLNUV5Slg3YUdIRUVUeHRScnhrSzRLYWZsU2J5cGxrTXdSZjl1?=
 =?utf-8?B?alRPM08vTXllWUlGdVBLTmQxQm1WWHRWMVhUNERHeFBDcXQ5YWhTcHh6Q1Rp?=
 =?utf-8?B?c01mUThxbnY1UVJ1blBSbndmam50OEQ2bGdrcFArakxpSkVSU3QrOEdTcE1O?=
 =?utf-8?B?TEYraEZ4MzhEYVd0ZjJYT1RJUFgxYmhtbjBtSzM3S3NWck5uMkJKN3U4eXNr?=
 =?utf-8?B?azlyaFJ0NnNXbnJCZHIveE9aTmh0bWtpUGJiSUtOKzR0L0VjcTJjZEYxbERr?=
 =?utf-8?B?VkZhMGduc2Y2bzBtLzVqUkpmakduT3B4d0MwNHNLN2lpRVNERytxNmV2MkEx?=
 =?utf-8?B?MU8rTjhRb25TZlMyM25QSVZDV204akpsbHVMRG1TMzBCbmd4d0gxbXpUbjM1?=
 =?utf-8?B?SWltQ3B4by9JRXkvTnJseVZhVFI1K2hwa3p0L2JOQWlrN2lNdzNuUVJRYVBH?=
 =?utf-8?B?MS9sMS9kTGpYV2tHbFJjVGhJQnl4UGZoeEtKTkVFRjc1VkpzdUpaOEpyWnBP?=
 =?utf-8?B?TnppelBHUUNVNUh2cFd2Q0U3QTZ4ZTV2d1k4Y2EzYTJibm54WENwTGgrS3B3?=
 =?utf-8?B?RmdwaEtvS3ZTL3RnTzlmbUlPTG9LVE90WWFjMlVObldicDg1dWRlbTh3S0lG?=
 =?utf-8?B?WXpVRGY4ZmhnSEw1cUN0MzNnckxOQThQK1JIWnFFeFBzUHlTWE44YUpBVXd6?=
 =?utf-8?B?T1BLWFpEK3dFVEtFZmh4UEh6VFFNRWNaVG5CZnhMMVFTYXlETHd1cWdpUGxi?=
 =?utf-8?B?blZzTThUZG5Td2F3c2wrNHNSNkhIeEs4c21zMHp2UlBSOW15YitOMnN6WXhF?=
 =?utf-8?B?cEVMcW42MkdsZzNoYnVKQzQvSk9YMEZWMVVZbkJPOEVrdjl2Z3hETW8ydERV?=
 =?utf-8?B?ZjhRclZleGptdFpTOFhsaFJORUFqWTE3bUp3bS8zZTFGams5dS81U1BNWUFW?=
 =?utf-8?B?NXA0WTJqZ0xzVUNwTHNPQzliUTNjazY1K0pUcWtUV3NVdGV4eWR0WkRRS0Ux?=
 =?utf-8?B?c216bEZVbUFoREUvZTFOVTIzRGkwZHhHYmFGU3dzZWZ4dTlMZFNHMlg3REpm?=
 =?utf-8?Q?wi8xys/hYSjpU=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <DAC9C167A65E844FADB404438A21FC6D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974217db-7acd-4eab-4464-08d897988410
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 14:34:17.7316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXhxVdOt1U7xT8nJ5r7gSOMhUo7DTlQ0g2eOg9DogrNGTGdYEV49L3mL/C+32ZIqIirYKOhekm4cUfbGKoDYDg8kfst6UXeSBT/6p29qsSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4750
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_093423_555008_457B1E56 
X-CRM114-Status: GOOD (  22.19  )
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
Cc: richard@nod.at, boris.brezillon@collabora.com, vigneshr@ti.com,
 stable@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/3/20 1:00 AM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This flash part actually has 4 block protection bits.
> 
> Reported-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Cc: stable@vger.kernel.org # v5.7+

While the patch is correct according to the datasheet, it was
not tested, so it's not a candidate for stable. I would update
the commit message to indicate that the the patch was made
solely on datasheet info and not tested, I would add the fixes
tag, and strip cc-ing to stable.

> Signed-off-by: Michael Walle <michael@walle.cc>

With the above addressed:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
> I didn't add the Fixes: tag because we depend on the 4bit BP support which
> was introduced in 5.7.
> 
> changes since v6:
>  - new patch
> 
>  drivers/mtd/spi-nor/sst.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index e0af6d25d573..0ab07624fb73 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -18,7 +18,8 @@ static const struct flash_info sst_parts[] = {
>                               SECT_4K | SST_WRITE) },
>         { "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64,
>                               SECT_4K | SST_WRITE) },
> -       { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K) },
> +       { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128,
> +                             SECT_4K | SPI_NOR_4BIT_BP) },
>         { "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1,
>                               SECT_4K | SST_WRITE) },
>         { "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2,
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
