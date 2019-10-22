Return-Path: <SRS0=fgf0=YP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB02CA9EA0
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 16:44:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A23620684
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 16:44:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ldA/L6HH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="DViErgIc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A23620684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sv2ZZ2JzrxYBfX68OtxwKfYF33E+XwgZqRLou1n4ss8=; b=ldA/L6HHsm8KDx
	himDbXQOJMLBuF74ihepsqqbR4KFYLkvsW6sDDfgPMBrsnVfZ8e+xCpFuKNRFkHkkv0DayBfaPSqm
	x0XLXMRfx7gZYnQ7eDNT+EeN2hI0Kz9KYc06LIu7fmL8ONMswsEhYCoNcoVliOHE1MXU3Iz6U8ovz
	56npU2eZRSQsKwsKpuiLlhhZfnPtnuTA4b6gCA8axf1ggaLstIOp6p5wk31mFD8jdNZXiXomlTzR8
	Pidf6Ust2TnwZb2ct62bG1CSPgSvneYnwuWT6hVAhxLnpG4i1UgSH0HkrVB8Gf7DKARon6ypGB+E/
	PPUP4wPnIMososbPL1TA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMxGR-0001r9-FX; Tue, 22 Oct 2019 16:44:07 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMxGN-0001ou-Vm
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2019 16:44:06 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: UuwsCHoOuA/hagAhYISu1vhQ7PVKnBnwDJsqcm4fLSD3V9WZYoKVSImJl2XXbBsl4eJfMeDQdK
 C5B2WUQfPZVinGx+MxXsj8H2w3goQu//LmLc/w0KUEZ/yZxMNAp+1gHJZJJ39qeNlRzHZevacj
 5Ug2ruRaX4EWExuvelhi6l3Mp9vb+aFGGSatLVhcZMDagXX5nh3+pojNSxX83NU2pghHTBtA7b
 Z2HFYOBwlLZMbRH1xCUP9tgC7axewUFWFNS76jCDKeMXavY5yFsi6y89dOATVKRvG5PkWlP9dU
 JoY=
X-IronPort-AV: E=Sophos;i="5.68,216,1569308400"; d="scan'208";a="53637852"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Oct 2019 09:43:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 22 Oct 2019 09:43:53 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 22 Oct 2019 09:43:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TupyyhrqZsqEBPZ2ZIRi2TveZXBS/+7oMMtWL8QC0bQT3ptR9EI3QI5SPVu5NN0KYYv5CkUiZer/mfYqLSdjHTtgTzEgGJiISaYN2DxNRSEuXV70fQUnH/q9IMTUuXLSzR1E2d+PhRZHYbyvm3el/1uel3ka76wNd7hOO9yTQXprauC4FPyNQ5/Iu58E5EseEUhyeUFekK5jDm5UBgD3QyqXq85Yq+tY0hfhkT91y5Bx+aSwr0jj8F9FcudKwjK0IwQlpsV2/n8F2SHko6Lldx15RcKyKJkSphuXLbmOJk88ziqbysRM9Q+/s0KD/48mAzQC2qLiGgTUYCZAS2F8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Px1LYpzqH1Phi1Xa8VqUvhoEbEZDT6h6JdkJIlMu/HE=;
 b=OH2h2Mt3V/xphu6T/BhDbFFCkclYYZD3JlbRQhLOIe2wwg/sWhgEgdcUprTyJlFRQycb+cLqJSyuSpb6wmltzrr8MZW3MebIGOBpMEbXHK0RZ0VJbN89G1H8iCgVlPOEkoRpIfx1cuG4x1x7Hli5oFu+y60cR7m3+jpu0h8/Fv0vNVDOq+WLJpB9GFg7ElnKn4tU0+62thS+fIsEyEZsjQQhBbQrrcg9hollZESDwZvdz0SqtB/V0kXifs6VqsFwa3N3ov9Icl7CWjkz6i79awJJWoF4NWJU2TvTX4btTC2jqB0IM/WlLipYlUeQamVuqXpZGQ4O2dTb5ZosAkCGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Px1LYpzqH1Phi1Xa8VqUvhoEbEZDT6h6JdkJIlMu/HE=;
 b=DViErgIcq//xX/YMWXqd//vyL6kD+AelmZ5YS+ZzejcjIBYT5nl3b5tJ3R4CLODLK2TZJzkjgUCCLOXMSiV9buyg8LafGwXL5uUAPzCUT0ety6f84uZcvf2pWEMP70JPvbzOFTlL5UE5rjA+xRrar3SYeVjUPTovL9ZL3eadreU=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3759.namprd11.prod.outlook.com (20.178.252.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Tue, 22 Oct 2019 16:43:51 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 16:43:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dqfext@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: add support for en25qh16
Thread-Topic: [PATCH] mtd: spi-nor: add support for en25qh16
Thread-Index: AQHVfGmLZPpGc2UqZEamM2T4OiCElqdm9ueA
Date: Tue, 22 Oct 2019 16:43:50 +0000
Message-ID: <42c313a9-c681-2b8a-8406-b9a0b14065b1@microchip.com>
References: <20191006171404.7253-1-dqfext@gmail.com>
In-Reply-To: <20191006171404.7253-1-dqfext@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0401CA0011.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::21) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.183.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c46edd63-c4ae-41b4-0f16-08d7570f046b
x-ms-traffictypediagnostic: MN2PR11MB3759:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB3759A29B766E1288ED90935DF0680@MN2PR11MB3759.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(346002)(366004)(376002)(199004)(189003)(186003)(66066001)(110136005)(6506007)(53546011)(386003)(52116002)(26005)(6436002)(102836004)(486006)(99286004)(25786009)(229853002)(6486002)(76176011)(14454004)(11346002)(476003)(2616005)(446003)(86362001)(478600001)(6246003)(6116002)(31696002)(31686004)(3846002)(2906002)(81166006)(316002)(81156014)(8936002)(966005)(8676002)(66946007)(64756008)(7736002)(66476007)(66556008)(2501003)(5660300002)(71200400001)(71190400001)(6512007)(14444005)(256004)(36756003)(66446008)(6306002)(305945005)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3759;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cyu6I2DKNvum5smtwrx/619pUDpkJ/+bmdDEouCms6I1fS6QL6uBOGTaS61GbNqrNXfUiYqEEEgEPsgm99jag23w23zx5ZNcLz8tVKAAHp4i5FvSMsqEeVuza18aFr9nbpME2n0fXecyCSBSuRFeIirazp8X0STfxKcpPINuVGvFdWWzwUJzst1RepUC1AOVn8MH/4tw/8LtDR0GUnZmURnr17PK990/rrucJc9IY6+vVe5+7YZOYfPeStfWebjX0OcLTN3w8f6LgtBOX09ahqaQGSSSNSttzPAi5b+wRRA/48U4yOzZ+qT7c6G89MybcxfThL+vf6jrTU8QQHtCZBIMDWaUr0YFeph4QrGQWRVrZpKbhKPXCuKCuznrNmWMOiyNQCk3t+LBXCueDze9/otwQEvzfXbYS4UAW/H++V00le8DKUH4oS80TLAZCcRteSRBI2qnFoEpZJrhxZp7cdYI/Vniws1oUL3fCakyfGA=
x-ms-exchange-transport-forked: True
Content-ID: <7C6363A4BAA746448740F7FAC8C73593@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c46edd63-c4ae-41b4-0f16-08d7570f046b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 16:43:50.8854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uI6vs6Ztm2eeGCXC7JeM+jg4h4nkG+d/pUy8ZgVNkESrOfKbGsWqxEKSv1O6MSy/Sqss3BMG/tNG854fc8MW0TILj51AlJTVyfiwr0VYPnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_094404_112130_718D585C 
X-CRM114-Status: GOOD (  13.75  )
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

Hi, Deng,

On 10/06/2019 08:14 PM, Deng Qingfang wrote:
> External E-Mail
> 
> 
> Tested on HiWiFi C526A
> 
> Datasheet is available at:
> http://www.xinyahong.com/upLoad/product/month_1411/201411201256018276.pdf
> 
> Signed-off-by: Deng Qingfang <dqfext@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 1d8621d..cc797de 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2179,6 +2179,8 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
>  	{ "en25q80a",   INFO(0x1c3014, 0, 64 * 1024,   16,
>  			SECT_4K | SPI_NOR_DUAL_READ) },
> +	{ "en25qh16",   INFO(0x1c7015, 0, 64 * 1024,   32,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

Looks like this flash does not support the SPINOR_OP_READ_1_1_4 (6bh) opcode, so
you can't specify the SPI_NOR_QUAD_READ flag.

SPINOR_OP_READ_1_4_4 will be discovered when parsing BFPT, and you'll use that
instead.

Would you send a v2 to drop the SPI_NOR_QUAD_READ flag or do you want me to drop
it when applying?

Cheers,
ta

>  	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64, 0) },
>  	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128,
>  			SECT_4K | SPI_NOR_DUAL_READ) },
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
