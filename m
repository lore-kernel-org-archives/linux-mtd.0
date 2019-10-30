Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE652CA9EC5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 19:43:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DB00205C9
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 19:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zh5zRqLG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="G54HNnmT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DB00205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvMBeszttYpgeAbtnfH8ZjSa9o2ZMzrFgdnISAqxEwc=; b=Zh5zRqLGOvyy6I
	F3NUV4ZuW+ntITCEtrRQyK0mVXlSJWOEwl94+iqWPDR3OfloSqYAYZzlZuzg3T9mM+2YVAhRgph8r
	4Rxyk0miwYCnp7TBsPg7F+EBZZpqD6lz1pjppKLUBA221Ql0BjdVPQv8ydmAMrhpTjheJZ5p7XfP3
	OuqAS8LC/n592HF4NOsYcBC4/GpNBQCqb4mpUBr2atuTSRub2onSQjDGnmLxRGS0RuHs4hc9ib94i
	u3vZDMYa7X2yWlXgBdcDnI4BBwuTmQE4rwSxqbS5I2B0CbhrJaWxZ9vfkYRn3Fiq/t2iFlisGci3x
	9gIAGApiNhl4b0oxzyIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPtry-0006Ap-2B; Wed, 30 Oct 2019 19:43:02 +0000
Received: from mail-eopbgr750052.outbound.protection.outlook.com
 ([40.107.75.52] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPtru-0006AQ-UB
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 19:43:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJ07MgJk4ifJM6akOdcOt5CuBXsl2l4itH7J9fBPBRl3bO64kW+XXAyhPp2AUY8TyaR6MC7g07xT77YoYtbCwwxHoNbWqOz2fcs3nE+ZxHmlDPLnR8w3vdZvEoZg2QIjKzEuxq6aZx+69A8HF6YPiPLD5yjCaqaCEMSIl5wgdtCx+QehKkjdSlD7UTwJmB6Y2MCCXU1U6rCFKNNUiyP2XCQaHHqq0aT+R+486OZSzX3sb9J2yVh0tb0yKoy/NEpl7JI65zFRNs1czC8Vh/8KtUXFX0ZV/jscMdroZTh/8FS6/eimLjBgcxtVQCb414Vl3p6HDXpTcYnex7UJxwsA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSQ7yz4kNfOMySImOcl2GzdlLO87nAvqXsDpgY37zYA=;
 b=N0SZ0wJSi4R1AJbvqwg3jPHaMfc8lQSy/rfnBT2mX7Ps+52ZpHEf87TXixIhioi6UYfFSHUqaDj0feePeFBgiNkm13/JIzFj+THtL42kTjVAXpLl8HZvCznAl2SeLx6Zc3Nz2SEkxEh5n1fsXkZ8bfISEPnYJajxWqyoMxbmY4ZMnEqPpwCboMbqxBtAVAzcuuoPUUBYBO8iC8YqasW5rEFN9eJR9+IhCXZc8oB9Tbh75HHO8K5MnWg3BOmmCksukiATwu1AnOyWN1ANVIc6wXA53hV3iBbiGCLSuZF4fUoOAEFzc22IJugF/ZnEgPIGJUCTKtlP0F0uuGvJx5aZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSQ7yz4kNfOMySImOcl2GzdlLO87nAvqXsDpgY37zYA=;
 b=G54HNnmT9FiQfeArcwDtgdvA8jbWKwD+BmfUMXcGfhM3A1WM7AFCyMxp+9UORVTbpQbx6FnWV0Im6KtJ1vnQG6e0PMR+spe0W7n/ncLNN8f4p4H0du4txJuf7HSid9QRv/yrCfYusXdBdnTviwprGXQAs/ALPBAv0YXRGXZiaKg=
Received: from DM6PR13MB2442.namprd13.prod.outlook.com (20.176.101.153) by
 DM6PR13MB2601.namprd13.prod.outlook.com (20.178.229.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.10; Wed, 30 Oct 2019 19:42:52 +0000
Received: from DM6PR13MB2442.namprd13.prod.outlook.com
 ([fe80::7d30:b9a5:427f:35f1]) by DM6PR13MB2442.namprd13.prod.outlook.com
 ([fe80::7d30:b9a5:427f:35f1%4]) with mapi id 15.20.2387.023; Wed, 30 Oct 2019
 19:42:52 +0000
From: Sagar Kadam <sagar.kadam@sifive.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>
Subject: RE: [PATCH v10 2/2] mtd: spi-nor: Set default Quad Enable method for
 ISSI flashes
Thread-Topic: [PATCH v10 2/2] mtd: spi-nor: Set default Quad Enable method for
 ISSI flashes
Thread-Index: AQHViP1J7abSJZAD+kadJ9TR5g5vHKdzmyxw
Date: Wed, 30 Oct 2019 19:42:52 +0000
Message-ID: <DM6PR13MB24422F313C5990B2149D633E99600@DM6PR13MB2442.namprd13.prod.outlook.com>
References: <CAARK3HkOwyvg=xr7fw1SrP_=B+Gj+waQmtZvgiK4AUpQrbM41Q@mail.gmail.com>
 <20191022172210.19865-1-tudor.ambarus@microchip.com>
 <20191022172210.19865-2-tudor.ambarus@microchip.com>
In-Reply-To: <20191022172210.19865-2-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sagar.kadam@sifive.com; 
x-originating-ip: [116.74.149.191]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cae8abc-aeaf-4da7-8303-08d75d715a64
x-ms-traffictypediagnostic: DM6PR13MB2601:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR13MB26012A2DE6F1BBBAA680F8DA99600@DM6PR13MB2601.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 02065A9E77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(346002)(136003)(39850400004)(51914003)(13464003)(199004)(189003)(2501003)(256004)(3846002)(44832011)(6116002)(52536014)(316002)(33656002)(476003)(5660300002)(186003)(486006)(26005)(110136005)(2906002)(9686003)(86362001)(74316002)(7736002)(6306002)(4326008)(6246003)(305945005)(53546011)(6506007)(66446008)(71190400001)(55016002)(66066001)(76176011)(14454004)(102836004)(76116006)(55236004)(99286004)(81166006)(11346002)(81156014)(8676002)(71200400001)(66556008)(478600001)(6436002)(8936002)(25786009)(966005)(446003)(229853002)(66946007)(66476007)(64756008)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR13MB2601;
 H:DM6PR13MB2442.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TaB/8/x1h5t8vXuQWdcP8JsJKBZ6gT9JPf+y4SBUcCARdoAZ0mAMLB3MSPn347Oo48wEe9MIQr7ShWRNCSJI9Y4Zwhy4J/9cPuPSuguSnWb2Mf62HE04IRV7FvX1usTAkXjLUq5dRCrgFaM+fFbB8KTLlF27EGl+EnT3Fasg8dcPulU4qJzY1ePpBe/0+4nfB9wRSK5W9TUYAzqC1hGdfWZJQA8HtKtJg4MQsXerQPCpuFkQtFas8FJ8L2AYRFGx5fFDguMN8JxRDTwqWclwIrEeiHgNiQcMumRBveQVVbXn8ggk4yI6/Qclh26JGlSNDFILDLwJ8RD9n+r0L+WgwNEhYrNhLxbCpcHlfXFkLYVuR8JQEzWyfR1/usqEZ0ZnAeT75ivfsQj4W+ctiQYn/ov6PG7E3kXh+wUt5pece1t4HhrEF6H+X9qQQhXrWW0LjfmMJ8eczt7T7WMVocBx//LBL6q4VI4xb11v3OPponA=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cae8abc-aeaf-4da7-8303-08d75d715a64
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2019 19:42:52.4019 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GbYxpgSZzzTRlYzAk8uk1geUc1shFgUvyewgMDiBAqlLA0/6i/RGMXqbLDo5QlRJYZLAYVzbBevvAuY/1uAFcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB2601
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_124259_050177_6DB34D43 
X-CRM114-Status: GOOD (  18.66  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Tudor,

> -----Original Message-----
> From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
> Sent: Tuesday, October 22, 2019 10:52 PM
> To: Sagar Kadam <sagar.kadam@sifive.com>; vigneshr@ti.com
> Cc: linux-mtd@lists.infradead.org; Tudor.Ambarus@microchip.com
> Subject: [PATCH v10 2/2] mtd: spi-nor: Set default Quad Enable method for
> ISSI flashes
> 
> From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> 
> Set the default Quad Enable method for ISSI flashes. Used for ISSI flashes
> (IS25WP256D-JMLE) that do not support SFDP tables and can not determine
> the Quad Enable method by parsing BFPT.
> 
> Based on code originally written by Wesley Terpstra <wesley@sifive.com>
> and/or Palmer Dabbelt <palmer@sifive.com> https://github.com/riscv/riscv-
> linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b
> 
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> [tudor.ambarus@microchip.com:
> - rebase, split and adapt for v5.4-rc4,

Thanks for considering this patch and  rebasing it on v5.4-rc4.

> - use PMC CFI ID for ISSI. According to JEP106BA, "Programmable Micro
> Corp"
>   changed its name to Integrated Silicon Solution (ISSI)]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> Sagar, this is needed just for the ISSI flashes that can't retrieve the Quad
> Enable method from BFPT. It deserves a separate patch. Let me know if you
> are ok with how I reorganized the patches.
>
Yes, your changes for using the PMC CFI ID looks good to me, as it also indicates
that ISSI was  earlier Programmable Micro Corp. (Thanks for the pointer to 
JEP106BA where details on name changes are provided).

Due to some reason, I am unable to see the other patch in my inbox viz
[v10,1/2] mtd: spi-nor: Add support for is25wp256.
(maybe something might be wrong in my end, so including reply to it in this mail
I hope that's okay). Your changes to include the fixup hook also looks good to me.

Thanks & BR,
Sagar Kadam

>  drivers/mtd/spi-nor/spi-nor.c | 9 +++++++++
>  include/linux/mtd/spi-nor.h   | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 3fc1eb20dca5..122e5bedf4f2 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4385,6 +4385,11 @@ static int spi_nor_setup(struct spi_nor *nor,
>  	return nor->params.setup(nor, hwcaps);  }
> 
> +static void issi_set_default_init(struct spi_nor *nor) {
> +	nor->params.quad_enable = macronix_quad_enable; }
> +
>  static void macronix_set_default_init(struct spi_nor *nor)  {
>  	nor->params.quad_enable = macronix_quad_enable; @@ -4412,6
> +4417,10 @@ static void spi_nor_manufacturer_init_params(struct spi_nor
> *nor)  {
>  	/* Init flash parameters based on MFR */
>  	switch (JEDEC_MFR(nor->info)) {
> +	case SNOR_MFR_ISSI:
> +		issi_set_default_init(nor);
> +		break;
> +
>  	case SNOR_MFR_MACRONIX:
>  		macronix_set_default_init(nor);
>  		break;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h index
> fc0b4b19c900..b4636ff707ad 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -22,6 +22,7 @@
>  #define SNOR_MFR_INTEL		CFI_MFR_INTEL
>  #define SNOR_MFR_ST		CFI_MFR_ST	/* ST Micro */
>  #define SNOR_MFR_MICRON		CFI_MFR_MICRON	/* Micron */
> +#define SNOR_MFR_ISSI		CFI_MFR_PMC
>  #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
>  #define SNOR_MFR_SPANSION	CFI_MFR_AMD
>  #define SNOR_MFR_SST		CFI_MFR_SST
> --
> 2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
