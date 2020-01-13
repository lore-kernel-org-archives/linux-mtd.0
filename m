Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032BFC33CAD
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 10:18:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C833A2080D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 10:18:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ybp/HHgP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="GBO0cpTK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C833A2080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IcFv4NS7MshhOhSeEYkhN4QSp7P9XkQExHSxI4zFU3g=; b=Ybp/HHgP0VsOtn
	QSn5hmfltJBUUPE/zNGN97Oh0MSJ53OgnBedZhvXryRdMDHxJyMRyVGakzFTjMCYHC5UPFVxasZbh
	roUrFG+2Gz5jQIQ+HoxZZR+uhnZpvcPsyNARzpD60h4rdW61suk+UFQ78n8HEGLh7HXoZYDdVC/J9
	cPiE0Etz7xxIRp9HktxeJXzjU4ISGs7UyDkgNbExgM5O7v5jc+QcaOB6Tl/4xMxiMMKd877UdfImy
	fCYO18cR5DDP41CYVUuY5QC1R8s3/QnnCjkV3AeRXag2uqgnrBemUGEu1tCq1koCaK2mSRqhLY1tM
	e0B5mMuOb/2URh7X4Mdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqwn7-0003SZ-K6; Mon, 13 Jan 2020 10:17:49 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqwn5-0003S6-Hv
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 10:17:48 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: vIWTnFFM6h117cfhgT7Tw50qzQp/nYt0yCJvuDYH2ybEW25DnOcUfpls8hzFawAUouwtgsUv/G
 LZ4WVZ8PeKHaZI2NR0BN0RnA11U28tAeM8aNRyW7QRpf8F45QLqqJ3p4ulgdmxD6tUdjxqGXFB
 u0Jr5guBxLhbB0ub9/LHz6p/Q/OL9ht5V6ruBXJzA4mtOsEJjN+lNBcFQ9W1eExPvkJ295MEk/
 dW9kWPspyi1E2dCFFSv2Zqh0egurpuv/XDTO/C8YE3ayxAnrNoqDdSscw4za2WoaCFGZZgYnDw
 efw=
X-IronPort-AV: E=Sophos;i="5.69,428,1571727600"; d="scan'208";a="63049100"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jan 2020 03:17:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 13 Jan 2020 03:17:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 13 Jan 2020 03:17:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzb3I3GTOzuM7IaP0k8cU3bR9ESE8r2cMbpTs7MzsNDVCJwr17H/jJidTo9gsmXf+EYbmtoJxKVCRCWzLjn/qykrG7OJaY9Hhna3732LnV4gyfel3VqCKo6s8phFuqwkItOUbrSVrYAFGqO9dOeOovGy3WL2UsWo89RGOGxN9UL4/6k5Q7+fNM+3eUXYB95JnSUG5jDaajg41lladchwvApWqNf+UQ0dbODqx7VTwUrqSukC9dpUB3tgtpqrK0di4vhVeTU/NGmadJ8hF+zzTBoFQdZN1FZXce2I7A+CexvWeGY3VOXpEe5Eowbs+hHsp+4T43EBTLdT4BPMMqCS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhI20TNRgwf4GK0Htr2IjMmlwgW22gFtlJ0hp/8ESgI=;
 b=H3rSL75LM/ozfpHMyWBfiYP4Sb62Cuo6mG4jKQ7oOqUAG2a807rtD/5x/085yf+zG3BY12sJgCQL/1Q0nSCE42+udpNUX4x77f8UQxh0V6syqjn28o8x9orcBWikoDvJUK4TW57ORybd6FZ2XCkjMkHBlODPHRfdlhq6DN9d3n3ikjQwHyb8FRQJBFKsmD4/dHgrJXestbxk8/kh9dCZTBGVNEkuNVPxCJxvP20+Cj1mDpNC/YCliSiJElXiryiEMkbp6NqKkzk97SmevfzqnWIcGO9bJy76yYeTNGvWwOwomxkfIywIZ1LSBHjOwYQOz/X6do2prvDJSNH7PGYRBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhI20TNRgwf4GK0Htr2IjMmlwgW22gFtlJ0hp/8ESgI=;
 b=GBO0cpTKTYDbWrZ4ByLm4xDFET2zL4cYZvXAIXYE2ZAWD1XclfoThhOv4C1FVoggDs60h4bNTOz2RFQ8KSHE//0RQ1CEe/FYOVJeFWWfkA2ZwI6ne50pVIt6QvbVLP5jc86pRwp1In0lmZ9TXnoRtb5OAMrmhIJUE5rnpN0j1+w=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4303.namprd11.prod.outlook.com (52.135.37.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 10:17:44 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 10:17:43 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix selection of 4-byte addressing opcodes
 on Spansion
Thread-Topic: [PATCH] mtd: spi-nor: Fix selection of 4-byte addressing opcodes
 on Spansion
Thread-Index: AQHVyfqx7b4WTBnS4UypfxmdSedmUg==
Date: Mon, 13 Jan 2020 10:17:43 +0000
Message-ID: <4323032.MiQHyusyOz@localhost.localdomain>
References: <20200108051343.1939-1-vigneshr@ti.com>
In-Reply-To: <20200108051343.1939-1-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7eb70763-b3cb-4967-f68c-08d79811d445
x-ms-traffictypediagnostic: MN2PR11MB4303:
x-microsoft-antispam-prvs: <MN2PR11MB4303A3EF76F0F8863A824CFDF0350@MN2PR11MB4303.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39850400004)(396003)(366004)(136003)(346002)(376002)(199004)(189003)(66476007)(478600001)(86362001)(53546011)(6506007)(9686003)(76116006)(6916009)(91956017)(6512007)(4326008)(66946007)(26005)(64756008)(66446008)(66556008)(186003)(6486002)(5660300002)(8676002)(81166006)(81156014)(71200400001)(8936002)(54906003)(316002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4303;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fRcFlir0gucGwiaD6L7gQwt3eLjGRPAFmCoBKNmF5uNATFvCfai0H4CQAWKf5WNg6jQkhLlwenqKqrEFcbojFeYQEs4fo0JtT3VQhaA8fS29sJgXNOBsCVk2ld68TOMtuTIKFt45dnfcNVxr+JuLkjXRdJuAG50DRMuWAtgPWzpeGNoESr58tTkX3X3C88B9AKdejLqncwhMb6PqDsaYq/EdNntxdipqlq3QcwIJ4cvnGevRLguEkimNzgucZ/IMqOXUtjPa8jcxbr0+SoWBmqUDJjzVg/stJs0JR9aTqPi6o88VU41cqwkmXxSoXbisdF8Ynq1WhairTsAjT2NEEaZbvESQ5xns0jhKy82mx+MxTDy4hTSZVYdJxYSrjq0gRBacBhl9oiSm35w/FYUy5tyY/7vXzVQPQNzV8FMBPd2ojOzyj8DOGJCSuK1ZGBrf
x-ms-exchange-transport-forked: True
Content-ID: <5D3AA406E295F449901DD33A7A5C4971@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb70763-b3cb-4967-f68c-08d79811d445
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 10:17:43.6866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fj9NuUbEqsIAjkAbI5QvLC8iJnedM0wOXHGyw1hd4X7ZqasdGlYf6/z5OpRxer8S7oAWvOoQVzd7GaEsP6nwc5k9EatovfXgQnov0XONZeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_021747_602693_0CF21A98 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Vignesh,

On Wednesday, January 8, 2020 7:13:43 AM EET Vignesh Raghavendra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> mtd->size is still unassigned when running spansion_post_sfdp_fixups()
> hook, therefore use nor->params.size to determine the size of flash device.
> 
> This makes sure that 4-byte addressing opcodes are used on Spansion
> flashes that are larger than 16MiB and don't have SFDP 4BAIT table
> populated.
> 
> Fixes: 92094ebc385e ("mtd: spi-nor: Add spansion_post_sfdp_fixups()")
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>

This fixes a recent bug, so if you want to take it through mtd/fixes you can 
add:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

If you want this through spi-nor/next, please let me know and I'll queue it.

Cheers,
ta

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 1082b6bb1393..cd47f07deff3 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4783,9 +4783,7 @@ static void spi_nor_info_init_params(struct spi_nor
> *nor)
> 
>  static void spansion_post_sfdp_fixups(struct spi_nor *nor)
>  {
> -       struct mtd_info *mtd = &nor->mtd;
> -
> -       if (mtd->size <= SZ_16M)
> +       if (nor->params.size <= SZ_16M)
>                 return;
> 
>         nor->flags |= SNOR_F_4B_OPCODES;
> --
> 2.24.1




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
