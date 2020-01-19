Return-Path: <SRS0=Efe6=3I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650DDC33CB1
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 07:19:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3536220684
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 07:19:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m0Edjyas";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="b4VZnjo0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3536220684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+gdOsg4Btu8cc7FJzpE9BnojXI1NB5+87SZTq11ELo0=; b=m0EdjyasmaIk17
	vbL3qHHtbuoQPcpdG4SUGT6wLMREiQ53CxsShhd2XFIIFmHGQ6mcav7LBOyAvZqLiLiXIaX5Km8F8
	oBdBdQpDyjujTrqkKw1BYQqmXv8VDwcHSFG2lAWLda4VsMzAWWEGK+KjM2RXwZM8u4YUvx5g4yHEn
	XBEEuW91++aRSQ1UcFdpfrcYsij8yDujWhxfI18+emE7btZ0oi8G6MQOIrGlM4nhp2AGgyrfFA9t0
	Yn+/jzdEuOcSGrH+aLH2v0c2gEDwmDW5xoMpTud6H4jQ80yUYajJEVZZBswhixHNsoOlPgyri9//v
	BMPfLE2KvMFMFQLpKiuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1it4rD-0008Ta-Nf; Sun, 19 Jan 2020 07:18:51 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1it4rB-0008TH-T1
 for linux-mtd@lists.infradead.org; Sun, 19 Jan 2020 07:18:51 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: iMbeh+n3WdhBQE/V1MSzBE/hYpMhpK+BP4bXWdnq8hEz+jmvD3PNVcIaRgGybNlSTxWTznC6kA
 Sc8VvVhNxIH0MEnMXCzr27p3zo/ny/RqNOICPEtBAANg4ZwNSUlnWSV43csa/w2wVQONQoNubM
 TenQyun2F4ys2u0aVo+XReXKdAnnJGAZ+QYPJI5osf0JxeQE/RO1mQSeG9d82D6itDYs6z8bLz
 gs9f4Tpw/NuT5cIdXRQheNfl3Zi8KZFMN6UOGyCnyXlkAoCoLvVvOAD4d0uPyVjVse5k/E0e6P
 08s=
X-IronPort-AV: E=Sophos;i="5.70,337,1574146800"; d="scan'208";a="61502180"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Jan 2020 00:18:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 19 Jan 2020 00:18:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sun, 19 Jan 2020 00:18:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2SZskRzuS9NlKEE21wxcfHA240abnT71TYptVu+PQ1g61CtukVNjK70LTQsfdeVc5Dvek0Jax75U+SHqKq3NG51l5GSwozA+L4QcG0lMzerleQ0/DvGL8ZnlR4jw818WajieO6hFPmolG/+l7IdEKX0h7FpoBPGfFu4QCwrodCre4lH23Nj7aKQY3dEyXskOzZU3XrVtD53tbPn5f314w+OtbYjeP8w+RNLlneoK4kqngyx+AeWXMnpC6jBB2WEnBsex0OjC/+BcXqZ99VFYxBZqceA8f/FCohW6U1IAYwtpqrvbJUNaktztu+LFuPcqkV40Kz+9oFdeHf8UlwTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZrbUn2/sNWljzsLafFxYfg+4IZCos5jRXg5/VsqT/Q=;
 b=lXtCLo1YFPnsf2SZ3Us5jydhKqrt304rk+AKfrtvMQMhBqA/YhB5F9i+f4iQx9YGvHFhXdVTgcJm7YW0hn8pxYCyUpkBsAu8EOyD2FFQjSkMu2UTm4NHM3cGb7BkQzXNJyg12O084JNoNh2r+lqpvlTXiLqf2eIcON0naDje76rb1olunaoMRi8CKR0Gg/l/UqSj9rXqtZdJ2P6ws5bNEKB4acOUQqWwTgZVxhIkGEIx10u1lCZbvPu70LovL9h3IskO2C12FThm0us5mt/l/sqbmVQZueLEdLDi4Fiy2VrSdSuFUR+W/4RxAU5nxB0imV4IvXsZl02NLvzkK+0zvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZrbUn2/sNWljzsLafFxYfg+4IZCos5jRXg5/VsqT/Q=;
 b=b4VZnjo0HVdBWVawEkFADrtQ+c7qesRnwxe1NO7RGoLeOVTQ79cmKfkR1EuVfj82t1KAaPx/dINNUXcDakAf4GHR872d3U9hPRUhO1bGeWz9h87ZmraMbO7+BpsDGwDo2hdEq0yJ35+40dLTcWPdedKeuj99J1d12d5xKlIKZcQ=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3629.namprd11.prod.outlook.com (20.178.252.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.21; Sun, 19 Jan 2020 07:18:29 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2644.023; Sun, 19 Jan 2020
 07:18:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH] mtd: spi-nor: Add support for at25sl321
Thread-Topic: [PATCH] mtd: spi-nor: Add support for at25sl321
Thread-Index: AQHVzpilvOutjn1Y2kCsQtSRhdzp1Q==
Date: Sun, 19 Jan 2020 07:18:29 +0000
Message-ID: <2121499.oPre2Eb8Qh@192.168.0.113>
References: <20200116160209.20129-1-michael@walle.cc>
In-Reply-To: <20200116160209.20129-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f8facb7-22f4-4a54-c270-08d79cafc87d
x-ms-traffictypediagnostic: MN2PR11MB3629:
x-microsoft-antispam-prvs: <MN2PR11MB3629B677AD2A04404D35BCA9F0330@MN2PR11MB3629.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0287BBA78D
x-forefront-antispam-report: SFV:SPM;
 SFS:(10009020)(366004)(136003)(376002)(346002)(396003)(39850400004)(199004)(189003)(26005)(6486002)(5660300002)(6916009)(186003)(71200400001)(14286002)(316002)(2906002)(54906003)(66556008)(4326008)(9686003)(6512007)(66446008)(64756008)(86362001)(66946007)(8936002)(66476007)(53546011)(81156014)(6506007)(91956017)(478600001)(81166006)(76116006)(8676002)(39026012)(138113003);
 DIR:OUT; SFP:1501; SCL:5; SRVR:MN2PR11MB3629;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kJZKxhACa+mOZkxaSGgCAF1SkLi/5SLnRQX9sTCZqvMTOCODFBHeexvKNct7gD6ZaweGlP9ZRNM0XpqB1RVcUa34Z1lSY1n0/I9IQ4i3R5uaJaMhvGhkLpy3gMa+gn/y9rPh8dkdzC26nWUFIXYBW1pA3nsxMYeALaztKE0k8KQo3C0ZYIOXhl/zSwK9Esy04JBTSwipyMd/QdP8YVB0U+Eb6xcT1Se2y4LS5sTzDzQVFmJIFjsdrrQshbm84J3yvBBho0YVCEUwJksQZOEajHSAEN8m5STrB+u7jVlGF0QHhEz2KE8HO6hAW1+WetON+LHgZXen6vZ3tm71sa3KfL+e69KTRgTMGaulfrX6fZKED4VvbR4q5iCPo72d/QsH3VPzgSJR5VCPEOM1TY/3mBDFnqICTxMVru5fUrAKtf6oXVXhFi12or6Ml/LduRMPX5+x8755qVizbMzedZ47S5HN4/2Vcu2sXKM+FeuCdwQILMi0rozAbWWs9/Qc5P+ThXBaShX7WuVVBNatXRIVLouTZmuibhG2G3Os4T/dZV9QU1HqR4u1x3miEegSUM/sQ03on+oG4HQ8s09me/6VyILrnAmYlP0rAmjCtTZkUc5Uw0DZVhckvC1IafquFstEpfd99m3IevffVcCc9tZExZHOO4ygVP9X3g5Bh6YzSpp3bI3B6aG1jit0BCvIpZgUQ6tbh//wMlVS3zqBRdXehnPr2HQVX9tzWxyd55TEDPB3ZnGxDrLjz9nD0CMUCBBUt8wZNbAp9unsiSwt4j2RsptpG4/8mb+L+0fWPDvuLGM=
x-ms-exchange-transport-forked: True
Content-ID: <B6DE462137E06C428578221D584C2880@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8facb7-22f4-4a54-c270-08d79cafc87d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2020 07:18:29.1950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I0LOwHlwWHvkZs0Qr2LKS+k0szPsphTY7HIpVW29bVCPWsBxZD5rYNN1a8RTMxS9zd6CXMUCq6MYpbxIcwDx3DPBXV9TzWK3KXR0FV5rZm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200118_231849_974106_A4C865C2 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thursday, January 16, 2020 6:02:09 PM EET Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> This was tested in single, dual and quad mode on a custom board with the
> NXP FlexSPI controller.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 8226d6450069..94747059344a 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2332,6 +2332,12 @@ static const struct flash_info spi_nor_ids[] = {
> 
>         { "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
> 
> +       /* Adesto (former Atmel) */

All the atmel flashes from above start with Adesto's manufacturer id, 0x1f.
I dropped this comment, ordered the entry alphabetically and applied to spi-
nor/next. Thanks.
ta

> +       {
> +               "at25sl321",  INFO(0x1f4216, 0, 64 * 1024, 64,
> +                       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +       },
> +
>         /* EON -- en25xxx */
>         { "en25f32",    INFO(0x1c3116, 0, 64 * 1024,   64, SECT_4K) },
>         { "en25p32",    INFO(0x1c2016, 0, 64 * 1024,   64, 0) },
> --
> 2.20.1




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
