Return-Path: <SRS0=6ot8=AM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4E7C433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 06:52:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82FC520663
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 06:52:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gPXvvJhe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="fDUg4Vay";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="P0oU/52j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82FC520663
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZT4K/9lSUt2kRpBTF/q2J9aLq2QGZCLB+yB3psyHVs=; b=gPXvvJheqJ23lu/iTVpAd1xULb
	WppiU1a+BadSWor9jbX2iry8ovl29+KrF1rjEM4waEcFaSuGWDOXK5n8lxnHoUrDY1dMcMEHUowc1
	KkdIEpnKwCXrvgEhtcnuCcLiUtI4Gy4+ecxVnk/IXCEeQ8j2sQ0NJWfRX1SmD/zjnzSWXIVmGqSeU
	y7NJiF9lxWKVuCwZyIgd5MO9yLUI2QdCIAPRvETec/EFRw/e2nnWBDbw/DbJO7YYlVGXmUOFQgxZh
	s5iGOgjyaqPP+KoMVunNNI0ZcnI3vGgkIpd07E+Wqzs2QwKEGmxq8sMxIkjwTkN83a4xYiSWbfZvc
	ng6XCDpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqWap-0006Fl-JZ; Wed, 01 Jul 2020 06:51:39 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqWam-0006F7-BH
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2020 06:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593586296; x=1625122296;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=jeA42hvst2aoeSSq56GO424femNQnJ26WcJ4qt4Zuho=;
 b=fDUg4Vay/rFvKareYvTb/Qidoaqte5yMD/yHSavyFQrg0g2mu6KBzFcZ
 5hK/xZzdR0XdmDBQoqVRw8rrOAbVRIRq8XdOZesDOde/rOwYuPcLElxTP
 w2z90A025EnSa2drb/aruBDUMrIPyAiBuLQiThchezahNqab6tyPK592d
 0nc6pNQJz+ORnysu+PGJRMewlMp7JWCIW1BkdW09cXcAojaMf6I8c/IY2
 4nXjom1qdCxgRJO6v+81e4/hab/Zl8Bs29USozXEiRFfnowOJsaUReR2C
 pghHaHY0G5zHmOglZrrTPW/L5FIMTJ8LHurznwzfQnYolqZuHDFK4Q2Tc w==;
IronPort-SDR: FNLVTDR68zh4xWmhzl1Z76NzWF97IipqBJTlRAj0EPavsHYoJQ1lYr+f+UTtPV/nH1RPbfUIzZ
 FV85NxF4kXtV3eMt4ZlaF8RpimHAIqo7Hz0cILB4f1b4p1/Aig1d1DA42ZzMpQmxJLM1iY7pBK
 dT/WxmfrzNMCEfr58nOTNemO3UDmVx8e1cKIPxHSAqp4sTRMr9v3bKrTWPwJ1Y1bcY3IT2NgCE
 KS3AtjkDlcREpPQmltx8z2OWbLHaJsdhyNr0jKU4S7nm/p+XbYC5HGrhC97YqRx63FCnwuVGul
 mIM=
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="85765212"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jun 2020 23:51:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 30 Jun 2020 23:51:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 30 Jun 2020 23:51:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgBNUWZflO60I7NIIzysBrnKUTd40X6RUMX0PVnwLRUcezQq7VPjVDmcfNjw/GrMKVk5Qu94nejlGAPv2vjmvXH5mHG1WYXPX0Bos37mzhbL4+/CtWkqIwCJnmrUAOijKhS8UxGwdxcmchZAbxaXpb6//seglKtUdB/cgvpNnAQmLnCPaqhDgi0Kbix4YSiWp7oGCkYiSj2z9YywOCzDDNOyQH/nsZ/SmUaGLkIBo6xLV2uOKC3VlyExl3De9TtXQwW29zujIuN7FJOACWvjm+4wqsbqw3+oTsUjSvBloSmAUz8pBFEeKPq91BoQgevq7xOEvRKTNBN0m2/W94H4dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeA42hvst2aoeSSq56GO424femNQnJ26WcJ4qt4Zuho=;
 b=W45jfP1jw5Cu48mKyW5TSyeMvt0AUVdNTAC0mS6e3ecoHSkrm/2EohOAuepdJFjfYSOiIDf3Ni6OMqvkI2iTGxEXYGhUMjyCFhx77LpujbCkmGsKkBdHHVoI5K8lByEfnnHde+h1LXLTruWE7oY8hW8d0mEmTk5DQuGVrxNsP/G3YCVwue7KUOLrwQdEv7GjhxW1lZEY9w3fueyvoCC9aaC3Hcd7qAWme9MooMWb0P+KOHpp9ZAeplxJP1IR2Nn5QFpc7LPeNYdQqX78Z4OynbCgS8NPXd8NuSfqPfWhbLaUb8oH2hE+NIpOhwiQOJzcqzDglhdCBmdKyxeJoPUu5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeA42hvst2aoeSSq56GO424femNQnJ26WcJ4qt4Zuho=;
 b=P0oU/52jtYbcGSGaM53Z5tnEfU0UFpsEYcpUfO3OmYZ8MclH5m9MFm1qhbxp11CGagAEKRY492lVgr9Zr9wTwoYi6ouCYLmxawRjOui2VwUFGUbODbNwKuPU/KGBG/2I+acxAjmdXTsQwu2ZrHJHob4dJaSQgnVoMj15S8qFdRM=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB2968.namprd11.prod.outlook.com (2603:10b6:a03:90::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26; Wed, 1 Jul
 2020 06:51:30 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3131.027; Wed, 1 Jul 2020
 06:51:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <rayagonda.kokatanur@broadcom.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] drivers: mtd: spi-nor: update read capabilities
 for w25q64 and s25fl064k
Thread-Topic: [PATCH v2 1/1] drivers: mtd: spi-nor: update read capabilities
 for w25q64 and s25fl064k
Thread-Index: AQHWT3QL3jLieq05KESXVn3RHsNxaA==
Date: Wed, 1 Jul 2020 06:51:30 +0000
Message-ID: <2c308101-ba40-2dd4-7304-7e2e29e9aa64@microchip.com>
References: <20200529071655.739-1-rayagonda.kokatanur@broadcom.com>
In-Reply-To: <20200529071655.739-1-rayagonda.kokatanur@broadcom.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: broadcom.com; dkim=none (message not signed)
 header.d=none; broadcom.com; dmarc=none action=none header.from=microchip.com; 
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47deb50b-274a-48f5-008d-08d81d8b2f2b
x-ms-traffictypediagnostic: BYAPR11MB2968:
x-microsoft-antispam-prvs: <BYAPR11MB2968502086E6A3ECFCBB02A4F06C0@BYAPR11MB2968.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:383;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l4ZBCG8sFRcZeotJ43+wehrz490zVeJ8qsuOkiUG5N8sRjHme4lowdsp4OtB2xTBJZ+GkEk+uZdDPNzLirPo7XMN+ymMQh6js3qahwKsrCyRVM7hQF1mF6BEMQHRObD9+KlRH76uJ7A2xn5FjPz8yq7agHE+caORXfT0nPmdeb5sw/4m/EihSDD+YJpqp8bhvypLG/JwWsn56dPQc67fp4n1ajs516+WLRgMklovP0VMGAj0654fXqBcAgIvZ6DNNObl6MW2j2jQYxYqtDwKVQXQVA7NIKneSQjC4lY4uM3zJpc/cCpZ2vwF6ET/0cyvRbT7lZhdTAC6eNrvv7OUL8Tt+znOxLOu3Y+gvnjPHV0BVbENGaIg0PbGbCQd7PFv38YsY8sDDOM6ZMRBPJArewNhfylU8dKGU8EZJilgZVs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(136003)(376002)(346002)(366004)(39860400002)(53546011)(6506007)(6512007)(31686004)(110136005)(186003)(26005)(2616005)(316002)(83380400001)(66556008)(86362001)(64756008)(36756003)(71200400001)(478600001)(8676002)(66476007)(5660300002)(15650500001)(66946007)(8936002)(31696002)(66446008)(76116006)(2906002)(91956017)(6486002)(138113003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: PqG1bKxddv3VL1V5EmFMDgc3+1mg5c6O/Y+Mtuyr70+nKCYMApe9aUedbWoVpHbORBA9eoJsGE6rQLGcfPZ7GBeWDgvyYhr1eimkHwMg1aBIgxmiP7cttBpSD9KzUXqC8qPIC6Zanl9nUZlodwrJEc4Mhb4ZoSqHXxIhtAD3/nxcf81QAx+Vcex8y91Ifx+wibXiSCH25b6cBjJ7M3NeytlMwy6RkDIGmzpemVKXoYnwwpaZ6ubBxl/QKCDh+F3aUMZQzDimL28MN0QkUK4dhjAp7fWrSMkKtrD5/KX5w/MbgKNkJIr4PUugz/BqJ44h+R2if1rxHQsL1oybWaYDqUQLDXBtRl3OG511eI/BaoP6QhQj9mb3ytez/VbJCPH2R+JOzu1327SaBFhidEHtgC8kDGwPKnKz42BTyX0ZUukEout64lT7X/UPESEwc4mL4AQsgDxPGNz/8OppThDva1n3jgNvecE5Y4OmGnSgZ9U=
x-ms-exchange-transport-forked: True
Content-ID: <A25F22232D3BE748A8DB031BA23C961E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47deb50b-274a-48f5-008d-08d81d8b2f2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 06:51:30.0722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5IhbqG3Q81nnrk6FDYkg/cYiTpiBPHLZ4MT9ChN51g1q8HVRhgdci2R4aAy9SMLJQ8IAEMhwqnnB2s+ul5tOyFPRQk+IcoCBjL2ld7khn4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_025136_561524_506720B0 
X-CRM114-Status: GOOD (  18.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 5/29/20 10:16 AM, Rayagonda Kokatanur wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Both w25q64 and s25fl064k nor flash support QUAD and DUAL read
> command, hence update the same in flash_info table.
> 
> This is tested on Broadcom Stingray SoC (bcm958742t).
> 
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> ---
> Changes from v1:
>  -Address review comments from Vignesh Raghavendra
>   Update commit message with testing details.
> 
>  drivers/mtd/spi-nor/spansion.c | 3 ++-
>  drivers/mtd/spi-nor/winbond.c  | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 6756202ace4b..c91bbb8d9cd6 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -52,7 +52,8 @@ static const struct flash_info spansion_parts[] = {
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32,
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> -       { "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
> +       { "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128,
> +                            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32,
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 17deabad57e1..2028cab3eff9 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -39,7 +39,8 @@ static const struct flash_info winbond_parts[] = {
>                             SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>                             SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>         { "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
> -       { "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
> +       { "w25q64", INFO(0xef4017, 0, 64 * 1024, 128,
> +                        SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

I checked the winbond website and from all the w25q64 flashes, W25Q64JV-IQ/JQ
and W25Q64FV share the 0xef4017 flash ID. Both support 0x3b and 0x6b commands,
which is fine.

I see that s25fl064k and w25q64 share the same flash ID. The search alg will
return the first hit, so s25fl064k even for the winbond parts. What is the
difference between s25fl064k and W25Q64JVQ/W25Q64FV?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
