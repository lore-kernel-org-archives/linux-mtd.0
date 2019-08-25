Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3F8C3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 13:08:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EDCC2070B
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 13:08:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hEWaAEAf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="j2LDf98e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EDCC2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gI6IkWsAH7P3msxn+cyKruUWuuF+7EC3SMiFEO5xNo=; b=hEWaAEAfBrcGE8
	UqLvNuArH7s3D75xfOcUDlegy3w1smP7kccld9Kjj8kBueFBX7rF36i+WMKV5Jlnr18IsGa5viyx9
	8sKvAJ04akYuioBFwkbTx3PWCk1xZWyXQRAPGwxNc4K0oAw6J+qqz8LkeQ4H+CrA6I7JtvJoF0r+o
	utjUt2s14suSywjFvOTeJvo/FFzpVs1sPn0XDgOp5rcj8m4VqbJvzqa1FWzhl1OE9ZDWtVwCKE1+D
	xf4ZMlLrtU+RffB3IV+ySPeazHy1MXfrp8ADKjsrqxvM+JhUXPobly5UmT1I6oPobuwhLrIVxXBbd
	1kq9iBFLCo/aYd4UuEJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1sFl-0004pq-0h; Sun, 25 Aug 2019 13:08:17 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1sFh-0004pO-OQ
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 13:08:15 +0000
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
IronPort-SDR: xeFwvD9ZFjK0XXs7Sp7BMfTa98NUbkJW+cKO1KP4r9rQ7rNu0o3ohXcunwvXQEEY9cjm+ACPCs
 wxYd9OFeL6nNn1CaPCnzdNJeUObYj1ZayXMlge6vvx/nkDOVGPJSgrDe0YE2rLa4xxRR5xL/Bb
 Tn7ZZt0d/dpxshyYAdMd74zA74qPTllKNHVuvRUB0J18pThOxHZjz/BOa/iXmkdK2+rlUaMNfz
 D7Z5FfMGMgK7B6RsW/YmyeZLRrAixCCvMSeS1BxKmooFTMFh0nv2QVp+KCZJ/Fo6spE/J8dOgw
 XkQ=
X-IronPort-AV: E=Sophos;i="5.64,429,1559545200"; d="scan'208";a="46445426"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Aug 2019 06:08:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 25 Aug 2019 06:08:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 25 Aug 2019 06:08:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewFplqx6pqevMyySbWS53GbmriBzdSr10t6cca8kcEmp7Qx1eDJk4tyEeBfH9Bv4RtXrfl2ZVsAKHllDAUL74gsfb41Oba5B1cxb0j7ev+zlur81lRaCE5nwrDZwausxfXiGomylSGa4Ca8nTvd0PcG9LfepRgr1soXGF47h3QF07sR/Ol5J3s1qBqme91TD/lBhFJUZKbk3tCxiFONPEq12QHgdZ7enk51/pmYUEl3KUzCoxt9SGihTIQKEyh5oKQR+kkZj6Qjx6nAettxuIiDCDfILCGX1PhkJ/feUkwewbba47L5jROzSFb9XIUurEmPlwMTdPAByGKxDGbHthw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5dZaU3jp+eWsCx+xbjQgVB1GDia4fZGLko6fzk8g+k=;
 b=ij1EMzwTLqI8jKu5tpAHpUnkNUBrf6SPXA172RMaL+aY6w2qSUceJcIwHcgyL8GVMxURpyGL3biHj8jwJTBDpBY8+YBz6UBB4Dy07HPIr552Zgt9ZKg1rKjkZ0XIw2pGsIu85Pm0G7Agt9RoEFL69mRWV0a6MNZj+MJyotX2aofd9RFFheC3WRE8rLvWNxE/5PO9Rromw7mJN4JQaL17pKJKyrcHO0Qvj0+Ya5LXpym6tiK5izhodfCk83cKw2Q9/18YeowChGeiQgAyvW47lhMKSqHceMR3TYV2/FNFiiyW3xCs04+UuU4pqq5wsumfWZq+B0yqjdWn86vOdDOIOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5dZaU3jp+eWsCx+xbjQgVB1GDia4fZGLko6fzk8g+k=;
 b=j2LDf98e4Z0H+uDvyZ5ykuy0ucKfdqApB6VuwIHsxXcCQMN32ENm30HZuMK64oGu++OY7cVPGkA+M5wim+HxWnF5H0QDWy+7p5AojCje4U8wMjYaVChkIJ9gZjICddGOKi2mLbYV6otFtCKfWQJ0q+krUc0/zkX/Dfb6kTJPn1M=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3630.namprd11.prod.outlook.com (20.178.253.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Sun, 25 Aug 2019 13:08:08 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Sun, 25 Aug 2019
 13:08:08 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 3/7] mtd: spi_nor: Move manufacturer quad_enable() in
 ->default_init()
Thread-Topic: [PATCH v2 3/7] mtd: spi_nor: Move manufacturer quad_enable() in
 ->default_init()
Thread-Index: AQHVWnONChlfDI2lKEuSOGQMw5/1e6cLwLkAgAAWnQA=
Date: Sun, 25 Aug 2019 13:08:07 +0000
Message-ID: <f847222f-238d-f76c-398c-cf20f892bc08@microchip.com>
References: <20190824120027.14452-1-tudor.ambarus@microchip.com>
 <20190824120027.14452-4-tudor.ambarus@microchip.com>
 <20190825134704.677c83d6@collabora.com>
In-Reply-To: <20190825134704.677c83d6@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0121.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::23) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.53.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04f258ae-8a7c-4cfa-1fd1-08d7295d45e7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3630; 
x-ms-traffictypediagnostic: MN2PR11MB3630:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB3630BD53CCB80F9601191125F0A60@MN2PR11MB3630.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01401330D1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(136003)(366004)(346002)(39850400004)(199004)(189003)(53936002)(305945005)(8936002)(25786009)(102836004)(31686004)(14444005)(6246003)(71200400001)(71190400001)(4326008)(6512007)(6506007)(386003)(53546011)(446003)(256004)(8676002)(81156014)(229853002)(5660300002)(6486002)(6436002)(6306002)(81166006)(66446008)(64756008)(7736002)(31696002)(66556008)(66066001)(36756003)(486006)(54906003)(66476007)(66946007)(99286004)(478600001)(186003)(14454004)(76176011)(6916009)(11346002)(476003)(86362001)(2616005)(2906002)(52116002)(26005)(6116002)(966005)(3846002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3630;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1QkcMxpK3b6MMc9pB/W5ar9q5uo/4WUIrTHOo+qIg1Nue1dvYmzNWRJvLN+JWQHIRycfPPaGXJbHB2bDNCzGjPu5iTxBytBYmThWf0Tdwxozh1IvPV4VT1PYQr1NqKI7bgxIa9gefGjRz8U+OSYyCejUMcId0mC2bzN8ChjLZSldxq/10RKd/yux5gK8DX6LMRZ7bAmS8sjxp/T4l+/MEckDW8JoY33j1l+4KTbohbzcXXk4+tuObDcit/gRgw7rXDFzwUM8UJ++9bVF/P1TTZJaZZHJ0ODtsddFWYP2xa+AV2Bw+l4R5duCGGbvmy5cxmmPJfukfBgK3SoZT/jUDGyUAr1EPPX8WUw09EiMX5Ns3hiP42RDNcqXi+hZDqFofBqbNYB0zvgUBEOVCuWS8hTIUFdDMZ9w2yHNhFNtQL8=
x-ms-exchange-transport-forked: True
Content-ID: <613A3ABC402649498D4185DDF0BBA57E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f258ae-8a7c-4cfa-1fd1-08d7295d45e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2019 13:08:07.9625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BQQCHmmmgndaece3mD6sc+roAxpJLX90dpcxuABPZ8OCMHl1vcCfRt/FPJ+XdeliLqb6MbnoUz+Jg5DMBf/t9qvzU84tkmG6YxMmKtJDApw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3630
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_060813_830491_47B25269 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/25/2019 02:47 PM, Boris Brezillon wrote:
> External E-Mail
> 
> 
> On Sat, 24 Aug 2019 12:00:41 +0000
> <Tudor.Ambarus@microchip.com> wrote:
> 
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> The goal is to move the quad_enable manufacturer specific init in the
>> nor->manufacturer->fixups->default_init()
>>
>> The legacy quad_enable() implementation is spansion_quad_enable(),
>> select this method by default.
>>
>> Set specific manufacturer fixups->default_init() hooks to overwrite
>> the default quad_enable() implementation when needed.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 48 ++++++++++++++++++++++++++-----------------
>>  1 file changed, 29 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 27951e5a01e2..c9514dfd7d6d 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -4150,13 +4150,38 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>>  	return err;
>>  }
>>  
>> +static void macronix_set_default_init(struct spi_nor *nor)
>> +{
>> +	nor->params.quad_enable = macronix_quad_enable;
> 
> Since it's now supposed to be the default QE implementation I'd
> recommend renaming the function into default_quad_enable() (this can be
> done in a separate patch).

You are referring to spansion_quad_enable. Yes, you made a patch that stops
prefixing generic functions with a manufacturer name, will follow.
https://patchwork.ozlabs.org/patch/1009264/

> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
>> +}
>> +
>> +static void st_micron_set_default_init(struct spi_nor *nor)
>> +{
>> +	nor->params.quad_enable = NULL;
>> +}
>> +
>>  /**
>>   * spi_nor_manufacturer_init_params() - Initialize the flash's parameters and
>> - * settings based on ->default_init() hook.
>> + * settings based on MFR register and ->default_init() hook.
>>   * @nor:	pointer to a 'struct spi-nor'.
>>   */
>>  static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
>>  {
>> +	/* Init flash parameters based on MFR */
>> +	switch (JEDEC_MFR(nor->info)) {
>> +	case SNOR_MFR_MACRONIX:
>> +		macronix_set_default_init(nor);
>> +		break;
>> +
>> +	case SNOR_MFR_ST:
>> +	case SNOR_MFR_MICRON:
>> +		st_micron_set_default_init(nor);
>> +		break;
>> +
>> +	default:
>> +		break;
>> +	}
>> +
>>  	if (nor->info->fixups && nor->info->fixups->default_init)
>>  		nor->info->fixups->default_init(nor);
>>  }
>> @@ -4168,6 +4193,9 @@ static int spi_nor_init_params(struct spi_nor *nor)
>>  	const struct flash_info *info = nor->info;
>>  	u8 i, erase_mask;
>>  
>> +	/* Initialize legacy flash parameters and settings. */
>> +	params->quad_enable = spansion_quad_enable;
>> +
>>  	/* Set SPI NOR sizes. */
>>  	params->size = (u64)info->sector_size * info->n_sectors;
>>  	params->page_size = info->page_size;
>> @@ -4233,24 +4261,6 @@ static int spi_nor_init_params(struct spi_nor *nor)
>>  			       SPINOR_OP_SE);
>>  	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
>>  
>> -	/* Select the procedure to set the Quad Enable bit. */
>> -	if (params->hwcaps.mask & (SNOR_HWCAPS_READ_QUAD |
>> -				   SNOR_HWCAPS_PP_QUAD)) {
>> -		switch (JEDEC_MFR(info)) {
>> -		case SNOR_MFR_MACRONIX:
>> -			params->quad_enable = macronix_quad_enable;
>> -			break;
>> -
>> -		case SNOR_MFR_ST:
>> -		case SNOR_MFR_MICRON:
>> -			break;
>> -
>> -		default:
>> -			/* Kept only for backward compatibility purpose. */
>> -			params->quad_enable = spansion_quad_enable;
>> -			break;
>> -		}
>> -	}
>>  
>>  	spi_nor_manufacturer_init_params(nor);
>>  
> 
> 
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
