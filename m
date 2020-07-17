Return-Path: <SRS0=C/uX=A4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA090C433E1
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2020 10:39:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8527F20734
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2020 10:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nLrzzz/k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="iKpmxVeC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="E+wyGBCD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8527F20734
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LZvsCVPmeGMKmOBVuMcGsfuAyq4yO2SbxdMgbErgRaI=; b=nLrzzz/kp6m9EHo6Mg0pIjdhT
	3lgh6D/356B2+y73hCGu0k7SyfYCd4Tj74hzeDRNTPKus6yQ1fL4sCONXXNyIx7oieQnHM5qfCk/9
	qED6w/k3LwAinennlTwUvnmBpg6LO5fV0zOy+royeOfDF/zoPvzoaJQ93MmHPyVquaDgSUKH/Z7Fd
	xojkroYMlk5rnROdY9ySsFGIZT5J42/m5FHv/s4VryhjNeniaDKSju1QEfaQimpQgs3WJmuWetHrZ
	AHGSe4128+U0iFAgCKTAzr0j9O9kXUDsMZrkfD3g1hp/X+2rWhZu099JViTLMDK+tQaleojr9XwSm
	yZboM85GQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwNl8-0003Tr-22; Fri, 17 Jul 2020 10:38:30 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwNl6-0003TH-0G
 for linux-mtd@lists.infradead.org; Fri, 17 Jul 2020 10:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594982307; x=1626518307;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=x/pdROAHSaQ0HBx0qVhgIQE3bpQXfNXSTxI53JkC0L8=;
 b=iKpmxVeCB5MYNMoqKUH2oTsyk3bH7BfO3YiZ6Fewz880rccgisl5ybLl
 g6LT5CXkx4HR9JVfe1D7TkK+gEPA+90sBedkZIv/UaafpEMkwCdh0BnOo
 nQg/BJtw531L7F/sI5CIg4TpUh1wQzSdddeetfR9o02a6NFLJcENdUdwa
 FdOu9Sfsi16FKUnzpON056iQkTz3yZuLDt5hyUah+GWncR0hbgMpkMl9u
 cIaXkxAH2TXoAk9HkvW18faHAwRprs0+6jgkbKe3eaTz3vcSqh4IjoTHC
 0pjK/JmCr1IFaVg8ilyv5O1ZHEF2aBc75FC8L9MUfoeYlohmzP4ENS/xa g==;
IronPort-SDR: +Q3cGWjD2ecD4/FVS7Q0yKCVey2A7tgNjyq4DwLVP9vMBZ3rojaBJTQEFEBHs0y+7ZYi4ZkD2z
 4uyXxrB+J7ss7DBmR4qNwInbbSvCndbpyRwv64aFPmm+9YSs8EPfJaJLZ5M3QOB2Q5AVPFC0sR
 llY4OrTQt6jhyI9lkz9Af2U8Mq/IX2pNhN/c+Y4Ag7uusR8dnD/7uUHRmSaizhDd2kxPeOZrZl
 svAVisLpH8Fa+agolb60AilEHXDc/jwIGPmviOpGzWGB0lIoD9BsqU8UkHGZwfBoB9NjULQ3Ka
 AS8=
X-IronPort-AV: E=Sophos;i="5.75,362,1589266800"; d="scan'208";a="88023646"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Jul 2020 03:38:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 17 Jul 2020 03:38:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Fri, 17 Jul 2020 03:37:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iA4nyY/pPngHYD6SjUZA9HpU3xthHXICWHTgF4fTi3NEK3zxKgcQfeFuTLfhzeQLAZnZeDcE+9q1C65Eat4Y117whaXfYGiW0kP75yMI+x2FBqft/wHHVTQJhosWVbG+vuiU/3GjF33p0XAXkVG5RcN5V3lfhlpUIOOE4L7qgHZSEHDkhuRKOyKRnblThS2tvxzSkXBjlCh97YvrW0US5V1LEaexWRtaQ05Lo+EM8pOMdkHzHB+4aZC1z4vhHznaF1l+v6axM70SAaF+mVRsoefSW+DmQYi6zQTYZCfCPQ7oRD8Myb6m65qS8tp0M8RsGX11ln5pCHtIf7v41MGzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/pdROAHSaQ0HBx0qVhgIQE3bpQXfNXSTxI53JkC0L8=;
 b=k3wltE/ccWyBbXC9AQA9yXTsX2aI5pSBiKH6cisGkiwsnTjoOZ1q1EnnV/hEmdXLRPrwz/5kYLMc3x9BbrGwSvHFEftgTt2GcfjZNPybxGOgtHl/raK3pnZGlSqBiBj1afc+kcyNUJBeHXM1Ml5WTNWhuzoka5ucDlT1J3iWu1jw6wkz1kRWhwmm/6V9rV04Sv+gUrm1TAoKT88isY59s1LM3j2CSB6MkU6/VOocTHCBIf9apIHfC+Oc65B7uRLYm2bpWAkquAOcDb11ahdnrHWZjWz36ZXOU1au0SCBlDAFGGKcd3CItEh9INRtC6h/GAxEZlvbjqQMZMO+EHRc5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/pdROAHSaQ0HBx0qVhgIQE3bpQXfNXSTxI53JkC0L8=;
 b=E+wyGBCDAEGFqND/jXm0nClcNFCrdJVDnc1QOvn0tB5sr6q7ezqFgjlLWO6hizlSQTxIsmS885UxcBRfrB/9tdx1K45yNhfa2FBTQEQ6ZX11gzQqGklCKeFOW25CyelvKLWrnhan5N3T97fObicK2usjbHR8foU9hrrpxYD+gl0=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3701.namprd11.prod.outlook.com (2603:10b6:a03:fc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 10:38:22 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::7424:cb9d:3c63:5181]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::7424:cb9d:3c63:5181%7]) with mapi id 15.20.3174.029; Fri, 17 Jul 2020
 10:38:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dac2@pensando.io>, <linux-mtd@lists.infradead.org>, <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Add support for Macronix mx66u2g45g.
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Add support for Macronix mx66u2g45g.
Thread-Index: AQHWXCZkSUigDtOnyE6qeIA0m/P7ow==
Date: Fri, 17 Jul 2020 10:38:21 +0000
Message-ID: <d842064a-7d43-6fd4-a544-dd38d124e6ba@microchip.com>
References: <20200716211631.38949-1-dac2@pensando.io>
 <20200716211631.38949-2-dac2@pensando.io>
In-Reply-To: <20200716211631.38949-2-dac2@pensando.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: pensando.io; dkim=none (message not signed)
 header.d=none;pensando.io; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.122.210.166]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 858fcc52-ae12-4947-a34e-08d82a3d8713
x-ms-traffictypediagnostic: BYAPR11MB3701:
x-microsoft-antispam-prvs: <BYAPR11MB37016F6975052353C26E4B12F07C0@BYAPR11MB3701.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jf+grfXMUtmIHb/WrUjk0we2dXQT0uLgr2rKT1ccsZ7wg3JU5LDJ+U7qFxYdcAP9QIWh25AhSnRJo5SVPzkMOCH1VcK1VN6DORJTpFLXnvyrvLFLcyBK7Y10KQrk0dJtYlS1bjPTrCg6YJY/2qu8szTQ4eV/7zg7mYkX19RHKrSoAPdLENkeCAr9VcHFKXvVrnzCqMMwlW7Cs1ZPrNj2wph1bOLZUndsPR4By5qcdyFtMKhgMTIg9+hiIYERDmJxwYzyMwEpnlVVF+EAF5egIw3insL1cbG1T4SNk1C0cGgZt5kHBY582zgpuG2qKqXFftUIgKmPqxWiiMF95qodKPkXEb8muOBgACTi8RIGsPpWRlamhKaGz1EnvLXT3GQpoFYPMK2vC3A3cJNGWmgodf2KwdW+fmDil0q/mKHembLo7zMqaUq9k0QEhgth3RJ9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(346002)(376002)(366004)(136003)(396003)(2906002)(6486002)(66446008)(66556008)(66476007)(5660300002)(316002)(8936002)(64756008)(36756003)(8676002)(31686004)(6512007)(83380400001)(71200400001)(91956017)(478600001)(76116006)(4326008)(31696002)(86362001)(66946007)(53546011)(6506007)(110136005)(26005)(2616005)(186003)(43740500002)(414714003)(473944003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: CzbmnVsvwM9nLap2/f0CfWAHfg67PISjfqWXeyBSPnJD2ID2PFb4tbhmlBMYG1ZiA9h9VWfmAReDNUEUyQ9182sm0MEasYpw5yoiGnSt9nkT+Rmpbe17L07bB+B98p3X9YaBwa1YpJcoVlln4SGsAFSjFZObq0mEXMUH5zQv5na4ePBzvVLGrjEK1Fkuj78tLNdzc+jweIBDYFpEBvGqEwI9Rmq5mW2y9QYL8ikukXPtmuPs5Kvhfr6sPT1nlQGOcyK8mq/xxGv5xvPCgMQnpWhZ6qx3gXMqfyqH5joLXOqkLVa8GgKXnbaRJ6eeS8pK/Gs1p1T3Tbz0clnE9XxgsCj9lekuzx/N/9am619Hr5B4tOZiktk0Attv123AptMhumqsTpyQKIV/Uj8YK8/1vKMlnChCyiNTAVkH76+7y9jMBtEQ16DmSsmZgBIGLClZOaSxoDBxuDak9N5Ns+v5RQO6Y7He/3pp0idcWyN/m/OBebHRqjZpAfnblBofpWu7
x-ms-exchange-transport-forked: True
Content-ID: <EFA5C44EBEBACA45A21BE9D5F9B972A8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858fcc52-ae12-4947-a34e-08d82a3d8713
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 10:38:21.9778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TENpnWg/DiClKa9kI8n8WN5Je8bRromZX4bbYXLNYfyC8CMTRmCxy3IQuceON4VSFUfCpTC0ZIPyMnGxZ1GnsLuuMPoLteqEbRsmewWgKuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3701
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_063828_181834_CDC0A465 
X-CRM114-Status: GOOD (  16.75  )
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
Cc: snelson@pensando.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 7/17/20 12:16 AM, David Clear wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The Macronix mx66u2g45g is a 1.8V, 2Gbit (256MB) device which
> supports x1, x2, or x4 operation.

Please specify in the commit message if you tested this flash
and with which controller.
One should do the following tests:
- read, erase, read back, hexdump -> to verify the erase op
- generate a random file, write, read back, compare
(e.g. sha1sum) -> to verify the write/read

For locking operations one should do some locking tests.

Vignesh, maybe we'll have to update the documentation to request
these kind of tests when one adds a flash entry.

Cheers,
ta

> 
> Signed-off-by: David Clear <dac2@pensando.io>
> Acked-by: Shannon Nelson <snelson@pensando.io>
> ---
>  drivers/mtd/spi-nor/macronix.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 0ae0815a3633..f97f3d127575 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -87,6 +87,9 @@ static const struct flash_info macronix_parts[] = {
>                               SPI_NOR_QUAD_READ) },
>         { "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048,
>                               SPI_NOR_QUAD_READ) },
> +       { "mx66u2g45g",  INFO(0xc2253c, 0, 64 * 1024, 4096,
> +                             SECT_4K | SPI_NOR_DUAL_READ |
> +                             SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  };
> 
>  static void macronix_default_init(struct spi_nor *nor)
> --
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
