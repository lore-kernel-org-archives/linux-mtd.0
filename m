Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E075BC3A5A0
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 08:58:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 702CA20A8B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 08:58:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T1coMNms";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="uR6HlduT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="RquGAnHy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 702CA20A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBocMeyyPU7Wppmflv0bciLSZMcqjH8zYbrW8CCHk4w=; b=T1coMNmsPy9Oxi
	jlzJBNoKyj7jVuuWQ7cp/1ajdgq8qiWeZNytrVOhiakfUhaL5SKGRpZMvgb8VVKm97CHhwvrIQpWW
	O75plHmSF7hdPh2i8JW1IEf4l6JSebjUUXDgC45wMpw/gbRZMaD9QxbvDMkPSRPaBGFKlwqZL54vr
	jbR05nIibtC/PNq6eWvFYXV6NBOpGHTixsiw08XvcjNPEMJSjX+vnAkmsB+Ima+xxCtJYbeElVt1M
	d7jZwFJkEFUCn+UC1wUMrkT6R4cHcAAq7cD8Rlz+HZSXNIYiqeagPHwUL0ZpIhCZR5fckxUI4rLq8
	5M+5PgNDSeFKJCsE1ilA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQSFU-0005Rh-N8; Mon, 20 Apr 2020 08:57:52 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQSFQ-0005Q7-Bl
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 08:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587373068; x=1618909068;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=E23YSq0J6DDTP4u4E7SA98uuIEGqYvHWRiyzO3/Irhc=;
 b=uR6HlduT+y6Iaj13K2SrzSd0MSJVQiQs0if/6DaRERSoJsx1PQIad1nt
 KiCLpS1QG8lvi9inGfM4F7bAytZWzQUVM4U67twxnj/BfmdbZ3C7Q0p1f
 qREUJEwl2kHi489/z5i+59oRZE3Ae+wAeh19dMBrvfDR1RYV3aPS7LysC
 R67lnb02xL1KAPYwng+wGlRscrYv69ml0o9B79zBH3LX0xTp1BwMy5Noz
 fFuZuKlfH+zLSyBSQaguaayjVeWG2RSSaJoIEmma0zFjcApmxHGOx5jM5
 woBky/g5FBfLf3PG8WsPSMwjO1V4bcQlKGsvxwRANbEbN7rCU/WKD4qwT Q==;
IronPort-SDR: 4Z96JFkWbAIR+MhQYI+YtTyJfz6nI8/W3QCzFVKLwOt2RslIrs/yltCSfjgJjY+KzX5gVLo8u9
 uTuXVoL5QdBGHdIkOAoXnn+nqZA6jVJbPhLI2NR+fBdIiIRm4gCShYW7kFfNjmTqK5RDi/5eRM
 EkREoWM9zdQXisIDdZPSnOXFo00WTRe5+V0bpqzHbxFIayl2RjH/mJKxn+3uR1vA4MQBwNYzKe
 RRF1xDfuLXCbx2hCcVaHDR3XUAbpySm8PLjNzFBt1SoM8aixHT1Xil/9BMYLGk9w5AE7pidW0s
 bhw=
X-IronPort-AV: E=Sophos;i="5.72,406,1580799600"; d="scan'208";a="73099098"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2020 01:57:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 01:57:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 20 Apr 2020 01:57:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laxQwLir/5nwtOEmiOPm59ZYUy4xcS9+KYuLuKAif5WeKTeMVnfbCnXzPIzBITRFTHAbgCptCaDNldJp+5ynWO9+v4LZV5u2niZFrvQjFln3wDdQ8pfC3YBKI00Q7XKDtdN20adT2i0U1eIzB8YpP5QyRnkDeQX9V8qIZoWzIB2UWgSugy0gcPkVzRkzIKcZph0F60Ij8rUH1uWq8SF/+8UjalftmL7MCc6HZVHwW1wbnMGrEMEt9ftn3G8nK4T35D38WOsdmcyVSHkgs2qYy4L/91nnQs/Eb0rLkhoPIOre/vNVgBDV40nk/tnBnLvHdJTkNOQs53jYfiR+OEva7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyxDWbvFTRxAyVb0mPwGVjyjB7bjb3m2H2iAhc9r+0Q=;
 b=U+wFmm1NEV4E7IcQeuloPk7DL/mA2UZtq3DqcJQQ4iAIbpFOOjT8+GMkILQ8PZ5Dtio46KzGdskZr8Kicvwcz5pA9rjJvhG1xBE6ka/5VT3prNjqe/rip28QvWhOc0IKWA/UQO/39Bdb1SI3ZzO+jFPDH6xXWV9S1ue2lS/AuVGEEiIK4KyOoF21sYSsk9U8bFTX5eHeWE1lLhsYNO2Q5jCmLVIHAocteJxPDG9RvKsVSHbfkmV8WYVCfKcWQ+D/bARUYmHfh0woC2j/1HFnT4HGVsO4GuQ51n7YQOGn2Q+1x7YGIzqvUamsW4sOnPsHFLTVsUVB8AI9NQiA2GjZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyxDWbvFTRxAyVb0mPwGVjyjB7bjb3m2H2iAhc9r+0Q=;
 b=RquGAnHyafAcAmj47RCKrmfNXgT0Jn63BOA4llyMjUhm46a7Kc3cmmm39SILQFRG9c4Qvgh+9dGkVhhLzGcb83VxRHiHULuvKeITj2lYDxSKXkw9HXqUTTjkjoC09zr2DMuVRC2wQFHiTin6G2kTANUmgGvWTWNXUAt3zM6oWFA=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB3878.namprd11.prod.outlook.com (2603:10b6:a03:182::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Mon, 20 Apr
 2020 08:57:43 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 08:57:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <masonccyang@mxic.com.tw>
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add mx25u51245g support
Thread-Topic: [PATCH 2/2] mtd: spi-nor: macronix: Add mx25u51245g support
Thread-Index: AQHWFvHANv13lIezFkiOi0jmtp6uRQ==
Date: Mon, 20 Apr 2020 08:57:42 +0000
Message-ID: <3097723.HxHl8gbcWJ@192.168.0.120>
References: <1586163611-4565-1-git-send-email-masonccyang@mxic.com.tw>
 <1586163611-4565-3-git-send-email-masonccyang@mxic.com.tw>
In-Reply-To: <1586163611-4565-3-git-send-email-masonccyang@mxic.com.tw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab0366f5-b2f1-46df-4608-08d7e508e32a
x-ms-traffictypediagnostic: BY5PR11MB3878:
x-microsoft-antispam-prvs: <BY5PR11MB38788A314F1E4DCD6E96B470F0D40@BY5PR11MB3878.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(366004)(54906003)(316002)(6506007)(53546011)(9686003)(26005)(2906002)(6512007)(86362001)(5660300002)(6916009)(6486002)(81156014)(8936002)(14286002)(186003)(4326008)(76116006)(71200400001)(478600001)(66946007)(66556008)(66446008)(66476007)(64756008)(91956017)(8676002)(39026012);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OyXXgRa33nCXIGbGFEfZSdv6753i1dh8fT3eBtybAX+NA9WW8rfau56PCxExGkls8j4da541a0sFC4+jlZO1kzfS9/UnZHNxuGVe59I63zUQqi8L/gTWtC4FmEstk6BQ6UBUxDayu7W5j7aCjMjosYh8a+1baYWq6xM/djVTmIz+CDNAv43x2RvR57miow+4ffa/LRpHIDZ2OjKxLebbxdRI9sQo//ck70+ItIM/WyzNc+zhXhfHMAzqnoHeAacayaiTkKLADjwoRdKWvPOtGIg4usM7dunSHru8yapA9D9Ju08tN/qfYdXpb9W40c6mCkFh+zqaphuQs5OmuJupEgWKf5l5a6XsxDMqYdSNeqVTfBCtsxtrtXRK/C5H5JMAa4bFSPdXdNzvFh713w4hPlEIje6ekmlFb0dIKUL61Ve/37hU4K5D5EpX7pPt+OI5sxqdc3LpKaHfwsemKbjUiPhbPplqyNKr+qpBS7CVVHS+x6Tj1FnCBxqUrpVMceGI
x-ms-exchange-antispam-messagedata: HoV9I+DdzWYU1zjgm+IoGFE5aHdFIQCSSNMxTo79hElDqKv6yeTbQnZIb/BtmXzwxaohiO/aP+DtrLs7SkvM5YiH7AfOgsTf8KGgoUcdGhvaS3kQcPFC35sfh2zs8LV+luj+/H7i8Bv2+NWe8JctkA==
x-ms-exchange-transport-forked: True
Content-ID: <57C680001698114395CA3E1C226FA7BB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0366f5-b2f1-46df-4608-08d7e508e32a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2020 08:57:42.8832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gPdHAq6HiyBjsjCQlsb61Lruv2g+nVHsVW2UkNC1LV8ZUzK36XLH/e2jsaK0nDSBWTpO1tCGrslfUU0lmSYJiZlH1uLqoQV7ppbH3ajkMNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3878
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_015748_496235_08687889 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Mason,

On Monday, April 6, 2020 12:00:11 PM EEST Mason Yang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> mx25u51245g is a mass production for new design and
> replace mx66u51235f(phase out).
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index c864ac8..e685aec 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -73,6 +73,9 @@
>         { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024,
>                               SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>                               SPI_NOR_4B_OPCODES) },
> +       { "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024,

Shouldn't the ID be 0xc2953a?

We usually don't add new flashes if they are not tested. Please specify in the 
commit message with which controller you tested the flash. Please do the same 
for the previous patch.

The minimal test is a read, erase, read back, write and read back. This 
sequence should verify if read, erase and pp work fine.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
