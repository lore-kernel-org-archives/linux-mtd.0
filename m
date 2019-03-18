Return-Path: <SRS0=8m+b=RV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7CDC43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 05:34:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77A1A206B7
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 05:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dfdoIw2A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Cys+zMai"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77A1A206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2k0EsLoxw+gOaz+rSMZPRYfZ4dqTBA8U1ZNdm9EDM0=; b=dfdoIw2AZyHTSh
	jlrYKgCerJg4imD+2wIvEh/YmNN0b/kZ2owy8NAuFXayaXJEZpsmYQHGeeR69gZaIEgngTt70ynLh
	yqHEwbXFScVvhSA2jR4AvhTYtCh1MP0biyZ38VhUffplfn9UpcN2sB8JjfB+1FvhufdDRY8ESCISt
	/JrQNzmLnfd/oLP+YuA2qtZVEOswGlAlJ/9/8QeliTjS9nsFAQC1cjIWE7LSxgv7XuIxQNOvcO7LB
	3pcMFwan1NM0dWxD3ntQFaQF5VgMpAKjql9TxEcYP5OJj4VIUr7bhpV6IfunweHEhBJ5YwibGYger
	SMm8LcwJd7FJmb+Xbd0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5kvC-0004TS-R7; Mon, 18 Mar 2019 05:34:50 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5kv8-0004S8-Uu
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2019 05:34:49 +0000
X-IronPort-AV: E=Sophos;i="5.58,492,1544511600"; d="scan'208";a="28007183"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 17 Mar 2019 22:34:42 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.107) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Sun, 17 Mar 2019 22:34:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVN5NhOE0bTofil7UlCJL9UEqxWTNmxjWc2NvUcFKwQ=;
 b=Cys+zMaiEjPuhqXSRMKDpy3HJM9HnOo4VA8s1V2PH1nlvhFi4ZL8lxRJ7kiBzwFqrwEpBvu/xs4dLTrsHAXZAfctPMKfVo17Dlb9diqWQvzpVJd2CV4nL+Q3C4rm4KuhCKwv9TP7iezzRIklSGpsDiyj8MIS2v4ny+bGx0WEqJo=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1298.namprd11.prod.outlook.com (10.173.32.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Mon, 18 Mar 2019 05:34:38 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Mon, 18 Mar
 2019 05:34:38 +0000
From: <Tudor.Ambarus@microchip.com>
To: <nagasure@xilinx.com>, <bbrezillon@kernel.org>, <broonie@kernel.org>
Subject: Re: 4-Byte addressing issue with IS25WP256D nor flash
Thread-Topic: 4-Byte addressing issue with IS25WP256D nor flash
Thread-Index: AdTZgzps1dokp2Q3SSmhxyFZkToq1ADyQRIA
Date: Mon, 18 Mar 2019 05:34:38 +0000
Message-ID: <e1e2f867-8a28-c74b-7f01-5f798e37c81d@microchip.com>
References: <MWHPR02MB2623388725B13BB7B133B98BAF4A0@MWHPR02MB2623.namprd02.prod.outlook.com>
In-Reply-To: <MWHPR02MB2623388725B13BB7B133B98BAF4A0@MWHPR02MB2623.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0260.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::33) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38b37266-66c4-4e6a-8309-08d6ab636959
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1298; 
x-ms-traffictypediagnostic: BN6PR11MB1298:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB1298C6A1DE473882E5E51AA8F0470@BN6PR11MB1298.namprd11.prod.outlook.com>
x-forefront-prvs: 098076C36C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(396003)(366004)(376002)(189003)(199004)(6346003)(6512007)(53936002)(99286004)(6306002)(386003)(305945005)(7416002)(52116002)(71190400001)(8936002)(81166006)(53546011)(8676002)(6506007)(105586002)(81156014)(7736002)(6436002)(4326008)(229853002)(478600001)(26005)(6246003)(186003)(36756003)(31696002)(66066001)(6486002)(86362001)(2616005)(3846002)(446003)(11346002)(14454004)(486006)(6116002)(476003)(5660300002)(72206003)(14444005)(2906002)(256004)(25786009)(102836004)(106356001)(54906003)(316002)(2501003)(68736007)(71200400001)(110136005)(31686004)(966005)(97736004)(76176011)(505234006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1298;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a7GvPV7LyXcPSpx+VtUC5B9yw/BXYF0PmnfnytjJb/BNTdBPUVFCuMpRuvlqOYIaxH27eu/14LDRhRGr1c/RHOVzcTMZVMnNfhQ0OVbvKw/FPBMhHotRclKqHvIrYAW9VAJS2ib8WceFSv9ZI4doOODtxcETVmp1qCZvE47dWX7pIlEz8R5vuS9hPOqghjUwu1y2ymreDIsCllthCNA8UKjLdbzsHviR8gsCpBJTCudOKs+JQL8RB3IH9rYaylvbej0Qt6LtKIFz5HPokDrt3UECJ/73r4PMh0blwxOPbmDI/8zWZXqgBdBrcKoYb5GeTt20AAdNocPEYrAZWSxLd/Qd/eTYgBMBh22l9ILZdP/feKpUmkzi4WQENz4F1kO5s0bRVU1CxKKyshE/LAUliRHgbAh6Vcw/WAQDfb3KILE=
Content-ID: <1E5CEF06750F3A46B3B3EBB9B732392A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b37266-66c4-4e6a-8309-08d6ab636959
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2019 05:34:38.1193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1298
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190317_223447_064573_829E279A 
X-CRM114-Status: GOOD (  14.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, liu.xiang6@zte.com.cn, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, nagasuresh12@gmail.com, michals@xilinx.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Naga,

On 03/13/2019 12:30 PM, Naga Sureshkumar Relli wrote:
> Hi,
> =

> =A0
> =

> Currently I am facing an issue with is25wp256d part.
> =

>  1. With u-boot the data integrity is working(erase, write, read and veri=
fy)
>     with out any issues
>  2. Don=92t probe the qspi at u-boot, and boot Linux and do data integrity
>     (erase, write, read and verify) =A0and verification done successfully.
>  3. At u-boot, do sf probe and after booting Linux, check for data integr=
ity
> =

> =A0=A0=A0=A0=A0 (erase, write, read and verify) and verify is failing.
> =

> And here are my observations.
> =

> When we do sf probe at u-boot, as per the device size, u-boot is changing
> =

> The flash device addressing mode from 3 byte to 4 byte
> =

> =A0
> =

> But Linux spi-nor frame work is using 3 byte commands with 3 Byte address=
ing(because
> =

> Of wrong sfdp information from the is25wp256d part). Hence data verificat=
ion is failing.
> =

> i.e. sfdp information is saying that it supports only 3-Byte addressing.
> =

> that means, sfdp table for is25wp256d is wrong.
> =


I couldn't find the sfdp table described in the datasheet. I would like to =
check
if bfpt is not entirely wrong. Can you please hexdump the entire sfdp table?

> =A0
> =

> Here are the steps that I am running.
> =

> Write data using u-boot =A0like below
> =

> 1. sf probe 0 0 0
> =

> 2. mw.b 0x100000 11 0x100
> =

> 3. sf write 0x100000 0x0 0x100
> =

> 4. sf read 0x200000 0x0 0x100
> =

> 5. md.b 0x200000 0x100
> =

> 00200000: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 00200010: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 00200020: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 00200030: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 00200040: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 00200050: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 00200060: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 00200070: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 00200080: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 00200090: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 002000a0: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 002000b0: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 002000c0: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 002000d0: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 002000e0: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> 002000f0: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ......=
..........
> =

> And in Linux just try reading the data,
> =

> root# mtd_debug read /dev/mtd0 0x0 0x100 test.bin
> =

> root#hexdump -C -n 50 test.bin
> =

> 0000000 ffff ffff =A01111 1111 1111 1111 1111 1111
> =

> 0000010 1111 1111 1111 1111 1111 1111 1111
> =

> *
> =

> 0000100
> =

> =A0
> =

> I did the below change in spi-nor.c
> =

> iff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> =

> index 4216ce0..f8603ff 100644
> =

> --- a/drivers/mtd/spi-nor/spi-nor.c
> =

> +++ b/drivers/mtd/spi-nor/spi-nor.c
> =

> @@ -2890,6 +2890,11 @@ static int spi_nor_init_params(struct spi_nor *nor,
> =

> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nor=
->addr_width =3D 0;
> =

> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nor=
->mtd.erasesize =3D 0;
> =

> =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0} else {
> =

> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if ((=
JEDEC_MFR(info) =3D=3D SNOR_MFR_ISSI) &&
Does all issi flashes have this problem?

> =

> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 params->size >=A0 OFFSET_16_MB) {
> =

> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 nor->addr_width =3D 4;
> =

> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 set_4byte(nor, info, 1);
> =

> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> =

> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mem=
cpy(params, &sfdp_params, sizeof(*params));
> =

> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> =

> =A0=A0=A0=A0=A0=A0=A0 }
> =

> Any further suggestions?

We should implement this as a post_bfpt fixup hook.

> =

> I have gone through https://lkml.org/lkml/2018/11/14/599.
> =

> But I didn=92t see any further mails after that.

Sorry, I forgot about it :(

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
