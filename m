Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45E6C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 06:52:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4CDE2184D
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 06:52:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IkhfVmgo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="gLLcd8dK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4CDE2184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DlTKswZF286JiHbmS4lezhgIS5aTwkikVB+EDcfuerw=; b=IkhfVmgohX++IH
	ftbrSYqfdbSpt5Y+wE4Y6feID/Hr8iSSJB7s+xhZkRUBm6Svv7ezVxZHZcBhhCK1dHXP9Prf0HpyH
	rMDGQaoJ5mGkQ0i9VcCycmcFd6ZAqEAbZshJgTGw+spuV0HQN9UUT4VvxQ9d589CqF8oqDTvyouaY
	buyNxKoYPUjGebwL0Ck8XXdAIYoBAYnHsEj4p/hNj7TrSoI7pvftKLPtK/XDcJ/8xOismW7deI52i
	471d9kWmtPCTQFPQX21t4ghz8Q9apqHRGcVax8YxgasiB/8hZFTTpbLcbDxP44kP/Xj3+8W57Afsz
	3W8cRNWGYqe6Lyn1gGgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6V5X-0007PS-FO; Wed, 20 Mar 2019 06:52:35 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6V5T-0007P5-O3
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 06:52:33 +0000
X-IronPort-AV: E=Sophos;i="5.60,248,1549954800"; d="scan'208";a="25731072"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES128-SHA;
 19 Mar 2019 23:52:31 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.37) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Tue, 19 Mar 2019 23:52:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeT+nocLbFrph4L0CPoVT9BDHVwbrC7rg/HyfynVuXU=;
 b=gLLcd8dKUFxma/1H/B41NMKB2+WQUUQVlI1QvqbXln4171GMtDOr5s+rhiXpzFgcoXjL1fLsB9LELiHthH/6+jSOOpG9wfCUfcqsCeHKGFhGd7Qdty13SskZxFeLbxa5ICYveDgM/cXFyDPjXGSref4dcnqG/OdLE6GcD98LG4g=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1875.namprd11.prod.outlook.com (10.175.100.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Wed, 20 Mar 2019 06:52:29 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Wed, 20 Mar
 2019 06:52:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix comment of
 spi_nor_find_best_erase_type()
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Fix comment of
 spi_nor_find_best_erase_type()
Thread-Index: AQHUs9bso/GnQYE6mk2WTEcPOT6KLaYUaz0A
Date: Wed, 20 Mar 2019 06:52:28 +0000
Message-ID: <417d4274-4fe2-9b67-c6ba-ad9024c5ea8f@microchip.com>
References: <8875821d-feaa-6a7d-d9d2-d992be9cd235@microchip.com>
 <20190319165651.23695-1-alexander.sverdlin@nokia.com>
 <20190319165651.23695-2-alexander.sverdlin@nokia.com>
In-Reply-To: <20190319165651.23695-2-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0901CA0098.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::24) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bca3e3f-9044-4678-f2ed-08d6ad009e3d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1875; 
x-ms-traffictypediagnostic: BN6PR11MB1875:
x-microsoft-antispam-prvs: <BN6PR11MB1875B000AF2B4D3568EADD06F0410@BN6PR11MB1875.namprd11.prod.outlook.com>
x-forefront-prvs: 098291215C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(366004)(396003)(39860400002)(346002)(199004)(189003)(5660300002)(6246003)(81156014)(229853002)(386003)(76176011)(7736002)(6486002)(14454004)(8676002)(2501003)(86362001)(81166006)(52116002)(72206003)(14444005)(316002)(66066001)(110136005)(36756003)(53546011)(256004)(6506007)(99286004)(8936002)(68736007)(3846002)(446003)(486006)(476003)(2616005)(54906003)(6436002)(53936002)(478600001)(4744005)(2906002)(26005)(305945005)(4326008)(11346002)(186003)(6116002)(71190400001)(25786009)(102836004)(71200400001)(31696002)(31686004)(105586002)(106356001)(6512007)(97736004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1875;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YIKVimVjFpEomUDNghQDzaxCMBSZ32wjIpRsQQ/LLwHaNLP0vDChaq7zLKbOfOBG/k7f6WpdJF3hswKYEJDrYETHyB9Nr/4K9rNYzXP7CsUC/XtbcWRs8JD5DSNF1N0bT/IE6BXL90tfNFvXfVNpjUI8sgvDIIRArl4I5cZr5Bs8UJKBCNwK+Fkbxk19oFGpEh3VZsADgKIjioqBxxv4rDR00fcnAu0S8dpukp+5lMO7CMjt5fI3iNywQuqd7Xs0bqPbn+fBgFNG2FXJM2p7pNpLYqNv2Gjr4WtzIGnVyPn6hQYTtXLBKpT6XgUiHzz5GudtR1wWUzseSDMvuz5HoOt2iMPIg8FvX5qO3xds/zk3xZZEVeSKYXUeKV8bfFIYktBjVpCb3H4fIFteazax2QYHhIgy8Tq/54ToS+m6dAg=
Content-ID: <E2ABDA1622D52241AA4A817D4AAD1D65@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bca3e3f-9044-4678-f2ed-08d6ad009e3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2019 06:52:28.9702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1875
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_235231_822983_7A899024 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: richard@nod.at, computersforpeace@gmail.com, dwmw2@infradead.org,
 marek.vasut@gmail.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 03/19/2019 06:57 PM, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> External E-Mail
> 
> 
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> Erase types are sorted *smallest* type first, refer to
> spi_nor_sort_erase_mask().
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

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
