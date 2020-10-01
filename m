Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91BAC4727E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:22:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EB572087E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:22:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IZrrDx+L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="fwHQ9sdw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Vmwhj4S3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EB572087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TtxYa2StMeDQ3DONEl5Kgnam3AfduShokmOYmFw5PcM=; b=IZrrDx+LbtltUyF33XFc4GE6X
	xRh959nZxQt0af7ASDcE2C8xNxeW8uM1RwNz2b32keT6KxlF+8yK3P2ULugdgx7xKaDhBOSO1xp/q
	2FlXp8DaCtzu4CRmi43Y7t7lVM6w9dFPYV/ZyY8WHtL9EafzP10EhpbNqbigUbfrXFXNrXAXEPbsP
	ZLHqt9VSEuXgyoSvFOjzhIWT/+9EfqcsjOa2Lm5GIfDUUsEdGKEpF0Tlh54SXN2p6p+T/P1gfYXUb
	VLHHMGOUar/GZMGF+v2XYptsDy0YyKOD3he37UsWVz73MKhoM0hgamrt+cHVB2iKb4aHXngOooMR7
	APNCjDtRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNtqh-0001RR-46; Thu, 01 Oct 2020 08:21:59 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNtqf-0001Qs-A0
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 08:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601540517; x=1633076517;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qQk+dEvfvSATAq0mFvKsJCPy+7aMmw1iMPEKmZmhbAc=;
 b=fwHQ9sdwpJpqScFf+flJPIG4CTO72Zt+eL4y+QNR22PAt1Vlgna9WRqe
 PWls+ut20jqLakoUMQOPK0En+X0oitODvcVpK+jakHFTkhks4Ex9hd54Z
 /tEJA+V8f1TD4LutIyOEP00pvG3kbUqykFWS4IAvTVAhwA9+r/u7WsPoi
 PUYUtSDUSshgLwvMgh7hQ5Vx6DzT6br+9Vxd4zsIO4RfVrUuf3gJqPAAl
 Go2E/DPTTEa+c5mmkI4CbJ5tPXvhZQ6FMpVIgrFbHxuun+64VKdmMzdMC
 rLAhyXqmJPk+NFBfNcho8jo/CgXYpWx6CslLiRNnqd4BIQrKnLyi/6Hz/ g==;
IronPort-SDR: TQxlE/nRWn907iJNEdFW0LOtVbl8RHWClIbHzaKA0XQhrgXRYnIMlbsVXUWFbnKAqS0S+iMoLa
 6eJ4IIE7idaz7ZboX1etGqBO+2vycDxR0/rcjpGlOrjVL6g9hmBXlequj/+reuyPXwm/Am9cLK
 B7EUzFm9eUCmNNZBfPue0k8lieSQWitvjtKe3oLFugvV+9/HXCAZDLp5jQhkwyU70TFiFC3Wkj
 c1YupHY9NUptcalJbdVkJ6fyr3mNmhDMj3dzMdQc+peF0TsjWmRMvvdG24NWx+4hBAvBGdffXI
 UrU=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="91054103"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 01:21:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 01:21:55 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 1 Oct 2020 01:21:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcolDNh1Sen2CXgc6l7k3SGM3tqyCDC8XCu3gakyZyGFQdq+VsgZ8BaST9VIh4y/aOXrZkmAyPDAcQ88NcZJOlodkFWvDlLe8lk5dmXONqouakanD5CYt4Zxp7eK6ZAjbkOtprFmRVtVngaouglwByJvYRrf/7X1Okw6L6EU/zZ4FLnnVk9LriQ9I6EhjKJtOQ05QLItTn35VKm4b+kgsZb9qCAS73T89mcD2Rbpvzw/R1j77VQihat8WAgrppakyia3dIJd5IaaIWI6b199fM2V3esnctD6HghHLzX7Dq72XKeySbHPAGBvmAgOU7OcheczmpHzKynXXLpQU6koxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQk+dEvfvSATAq0mFvKsJCPy+7aMmw1iMPEKmZmhbAc=;
 b=DlMTMW3JTndP0NVHMtC+hs5WLLX9KPWRVzAquYrQ+ERjUo3vd5VLrW7jL4Z6k54w65l1aTMgN34LPbyD04qgL3GRwWbOy3XaPEdm6t12d12SiWWcuam9kjypYhy4IrLY0qrm1HJa8X7FhsZe13o/WOTqxGbRlwvd2whnDx8aNHiObZgC4Ea4M+xYORV2SfzSxz9W7eQcezCkpBz2JMQdxa5fREiq3rLck7rVeBzNhBGTPSduESYkkEqxnfMnmoSsy8B/Fp8MFoXij3nl9AIYNWT/4Z3tM689xlDHzrn2aqZVT3q600/fMI4j6H2v38XtIu4B9Zu28nIvJ3bjRA1kRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQk+dEvfvSATAq0mFvKsJCPy+7aMmw1iMPEKmZmhbAc=;
 b=Vmwhj4S3pTulfPy3F7w5BsFGt1gYAh4MDKGM1MHRo4I3+wgXobQxqG9YHFQ9Aoh0W6oNY05wvO6dzt7fdBRwRF0N/qa6W2/kYIbuJZgDPA3MrPM4/zHQFMAqSH2QDaUp0fSTEQdEq5Ri2ST3bg70Fe9q/gTQHteZN0WjEhUPR5o=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR11MB1947.namprd11.prod.outlook.com (2603:10b6:3:110::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 1 Oct
 2020 08:21:54 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 08:21:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 11/15] mtd: spi-nor: sfdp: detect Soft Reset sequence
 support from BFPT
Thread-Topic: [PATCH v14 11/15] mtd: spi-nor: sfdp: detect Soft Reset sequence
 support from BFPT
Thread-Index: AQHWl8vrAD9FOiJx+EWZ8429w5IrbA==
Date: Thu, 1 Oct 2020 08:21:54 +0000
Message-ID: <42ac8a85-8d39-07c9-e117-1c26f11c18e4@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-12-p.yadav@ti.com>
In-Reply-To: <20200930185732.6201-12-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.51.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7c2f4d8-55d3-40e4-8c16-08d865e30e62
x-ms-traffictypediagnostic: DM5PR11MB1947:
x-microsoft-antispam-prvs: <DM5PR11MB19472A171DD52C3ABABCBB68F0300@DM5PR11MB1947.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OCICqK6kPmmU1yG8IPes4pAeIGZjCQDzZJh8fY/nduILolpJV7Tkg1MQ9MgtTpv6GUTrsowAcOzwB3vlvdnaFYy7FRGNLDGSd0U+tHo8aJny38eCTxqLfwzA9Tm4GIPDTydV7UhMiXYFsSj8SsJDLnQHIZweSmgQUgH6Rtf8v2Cr1se0K4yjgOhZO79sXBMkqtsidqscWyUVZENZJBmXUxmbAwKPlWP05i8Uoe+71EMl43h13rbn8tXeTJsrij3DTckqaebKWHOikbPZy2hlXGGxvl1g5jAzuO5pLxEWdNaRyPd9x1W+CEdk5uYi5WaTwIF/JH2fhv0JaUXPcoSWKwCEw9FrCJ1hzY01ozy7w/Jn00NOP6uedCZk8PngcAO3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(4326008)(66946007)(478600001)(64756008)(66556008)(316002)(66476007)(71200400001)(91956017)(186003)(110136005)(2906002)(76116006)(86362001)(66446008)(36756003)(26005)(2616005)(6506007)(5660300002)(53546011)(31696002)(8936002)(31686004)(6512007)(6486002)(8676002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: NS+Pg+QNYMEayZFPBg83e5qT9JKbhj9DYmzVX00AY/t5IM02U2CBVb7jWsv/gi7K5T8hZqMJSNQL59A0RIjTDSLTyxi5VtuqQPFBhLzMe1hbxiJ1ZjgUuAXY2fBQQrwfk394lc+u4p37QzZ2VB+LqMhTivB2RavqQ1JG9ilP4atGVwj6/uUxdAohTc5TLIWQ2mJ1k/b+Ay5iy1OwdARYYD5JwFKJzbADtld+NYrP5Y9I1JHaeLcknkN5Sz/Bq7/wmEe9gD+TRLxQXZZtxzuTmVXV1rzfkvK8eaNqWfkq+xgAF8HXB1v0yXmZ3Sa37Mb5tRJ/xfNhGVniVtu2B8i39b6sxkz+cjoDumo3pbVzeppLYw45tywxJMFYRJz2RKqQCTrKzyBM2hgSR7lnInC4OMpNs010GbzIsDyBB+vEF6/hN1A86ruGiKbRooj8/c5A/g+BM+JQ4jK5Hoe8hN/cu3H5fS7jETZzSyCcR6+bDRxLoZzujRJsEuXwj7m6dEDQYmDxXOpyhYzPr/3ffhhlrqlcZqXFYGA7oFo77jG7CrcStiHiSe6m6yrEW+aGKysrd52jfIj24hLoGHzyJWWUW/mf44NxTOIkQPIG5i9SuTu2Xtj+mE475IldosSw9rocYyXVncNm9N3YSCkMxbtDMw==
x-ms-exchange-transport-forked: True
Content-ID: <872E48137618514A899BD4641EDD7E32@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c2f4d8-55d3-40e4-8c16-08d865e30e62
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 08:21:54.4946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vUMDIrtRiYeTzqH24FXcmM7VLkW8CJJogpOdkDUpormBEb/436GI7BpsVVsk1agVNCowEZmvOF6ShE/oHa8ym6N6EK7sabIvv69KLQ1gErk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1947
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_042157_666643_AA6C19A1 
X-CRM114-Status: GOOD (  20.86  )
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
Cc: boris.brezillon@collabora.com, nsekhar@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/30/20 9:57 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> A Soft Reset sequence will return the flash to Power-on-Reset (POR)
> state. It consists of two commands: Soft Reset Enable and Soft Reset.
> Find out if the sequence is supported from BFPT DWORD 16.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/core.h | 1 +
>  drivers/mtd/spi-nor/sfdp.c | 4 ++++
>  drivers/mtd/spi-nor/sfdp.h | 2 ++
>  3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 105a4ddeb309..0a775a7b5606 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -27,6 +27,7 @@ enum spi_nor_option_flags {
>         SNOR_F_HAS_4BIT_BP      = BIT(12),
>         SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
>         SNOR_F_IO_MODE_EN_VOLATILE = BIT(14),
> +       SNOR_F_SOFT_RESET       = BIT(15),
>  };
> 
>  struct spi_nor_read_command {
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 0b5b9ea44cfc..f6d77004fd4e 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -608,6 +608,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>                 break;
>         }
> 
> +       /* Soft Reset support. */
> +       if (bfpt.dwords[BFPT_DWORD(16)] & BFPT_DWORD16_SWRST_EN_RST)
> +               nor->flags |= SNOR_F_SOFT_RESET;
> +
>         /* Stop here if not JESD216 rev C or later. */
>         if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
>                 return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt,
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index 6d7243067252..89152ae1cf3e 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -90,6 +90,8 @@ struct sfdp_bfpt {
>  #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD                (0x4UL << 20)
>  #define BFPT_DWORD15_QER_SR2_BIT1              (0x5UL << 20) /* Spansion */
> 
> +#define BFPT_DWORD16_SWRST_EN_RST              BIT(12)
> +
>  #define BFPT_DWORD18_CMD_EXT_MASK              GENMASK(30, 29)
>  #define BFPT_DWORD18_CMD_EXT_REP               (0x0UL << 29) /* Repeat */
>  #define BFPT_DWORD18_CMD_EXT_INV               (0x1UL << 29) /* Invert */
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
