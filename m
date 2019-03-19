Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D216EC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 971842064A
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:29:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gTdrLD5P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="YG7kuy3Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 971842064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qyIXDDVzkwAb0Tp+5U+hNg/Mj2gw4EwPQv3SzAd+Fak=; b=gTdrLD5P4KVp4j
	k9PpH8W5aqRM97eP7conPyZiFsl4HejjSYvbcwN4mtOpbKrzFXbZwG6azTq/YsNeDyESI6LY6R1/z
	8xqR0Y6vpF68W0jRUTiYqaSejuCf0vHMUCEifTlZ3JsX5VBUKF/J5lorws59YIPJPGf1tBtecTGpA
	gtpIMzC21pcsn2cSSW5bOFFbuVhzLSoBN2Ux55WWtU/TQXj0I7QmiCP97Qw2VWYRgwg/50BbkTAzH
	SGS9tAPuYoLHL0IG59HJCS0nukaccYT3A5drZhF54O5V30Iyk09zwATrHaTM1+iaDTfp/jEBDn26/
	qJCLr6g/QECmavWt8Tyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6HcM-00075k-Dz; Tue, 19 Mar 2019 16:29:34 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6HcH-00073Q-Ua
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 16:29:32 +0000
X-IronPort-AV: E=Sophos;i="5.58,498,1544511600"; d="scan'208";a="25683210"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES128-SHA;
 19 Mar 2019 09:29:22 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.37) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Tue, 19 Mar 2019 09:29:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmziN2I+73KyKno67uR18PAHsqXQCRofAVrXrJvOHBI=;
 b=YG7kuy3QLZ0gGNeguNoh1qx8l/i46qnEXZePFDvLxSH7dSSqAHFlyPwYFwvDJlnVsgpx0yccHtPAxjE4vFvDh4gH3YpenUZHIEQC1/M+SUfQtEJd2KXnEWM1L8rp2Xp4Qi7R8+2647F9skwdscxyay9SSCU08Vc+tFso4UhdP8A=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1380.namprd11.prod.outlook.com (10.173.26.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Tue, 19 Mar 2019 16:29:20 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Tue, 19 Mar
 2019 16:29:20 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix comment of
 spi_nor_find_best_erase_type()
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Fix comment of
 spi_nor_find_best_erase_type()
Thread-Index: AQHUs9bso/GnQYE6mk2WTEcPOT6KLaYTehkA
Date: Tue, 19 Mar 2019 16:29:20 +0000
Message-ID: <8875821d-feaa-6a7d-d9d2-d992be9cd235@microchip.com>
References: <20190124112014.20167-1-alexander.sverdlin@nokia.com>
 <20190124112014.20167-2-alexander.sverdlin@nokia.com>
In-Reply-To: <20190124112014.20167-2-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0183.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::31) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b7a6074-981e-4601-4ebb-08d6ac8809c9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1380; 
x-ms-traffictypediagnostic: BN6PR11MB1380:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB1380565BA7D6F3781704A283F0400@BN6PR11MB1380.namprd11.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(136003)(366004)(396003)(189003)(199004)(4326008)(8936002)(36756003)(31686004)(31696002)(97736004)(105586002)(71200400001)(476003)(66066001)(71190400001)(86362001)(52116002)(6246003)(106356001)(25786009)(486006)(316002)(99286004)(68736007)(102836004)(53546011)(6116002)(53936002)(2501003)(14454004)(2616005)(446003)(14444005)(26005)(72206003)(6486002)(3846002)(386003)(6512007)(6306002)(110136005)(478600001)(6436002)(966005)(305945005)(7736002)(81156014)(6506007)(8676002)(186003)(54906003)(256004)(229853002)(5660300002)(76176011)(81166006)(2906002)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1380;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fjl/6vh+ckoSlZZUA0J+0LhLZ9Kgnrt74RTnlKKae91T0WvwzEhcWdbIGpiDKjWUk8hRDCPThrpLXeWWm4AkQo/uuorzQFCCLvh6H27qHi2YjNATB4BgaC0G5rYOMPKNhhikbjvzatsVmEaSFq0UYi8wXGc6WEyp69HOUH+VvacFcGs5OXMiyMDPlIH8necxqUzJO7K6DogV8o742aTT1bcV38k9T+Mz/sl/1yoh6XjTLEBrehBB85E73tzl7SCViDuqSpSJZqO+DCbLhX9CjNn5z7WiAUeBSKVLbvRZir6N/Ex02F8LJI9D8sDrNTwCzQ2yNNI07PNFOAHcRwOSPrntPCLbhXiVfh40Av6KMzMIGRBx3j998UYY44JRNI0MguDX2TW08lujYruKpPRjIEXJ+F6mb0YKDXJ5ZjQiGUk=
Content-ID: <6DEE7B927041A1499E91CA88E653A173@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7a6074-981e-4601-4ebb-08d6ac8809c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 16:29:20.3525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1380
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_092930_607928_AB05A0C3 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: marek.vasut@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 richard@nod.at, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 01/24/2019 01:21 PM, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> Erase types are sorted *smallest* type first, refer to
> spi_nor_sort_erase_mask().
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Please fix your author name to match your S-o-b tag. See
https://lkml.org/lkml/2019/2/8/556 for a workaround.

I'll add my R-b after this change.

I didn't forget about patch 2/2, I just want to check the upper mtd layers.

Thanks,
ta
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 6e13bbd1aaa5..c3598f0571cc 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -739,7 +739,7 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
>  	u8 erase_mask = region->offset & SNOR_ERASE_TYPE_MASK;
>  
>  	/*
> -	 * Erase types are ordered by size, with the biggest erase type at
> +	 * Erase types are ordered by size, with the smallest erase type at
>  	 * index 0.
>  	 */
>  	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
