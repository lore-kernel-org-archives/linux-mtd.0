Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA2AC4360F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 16:48:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E8E521925
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 16:48:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FVbPWto3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="rMAkYCmo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E8E521925
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsu2jiQoLBs++a9vCj98eohWUrpBHBdBSb5zx09FV9c=; b=FVbPWto3plG5X/
	+rx6Yg9/2tiPza5XsuOH7QIcG/cu61wAETWK6STq6jtFB5QRMsXmw2znRPOEaNmEeWfI2UWYapeQN
	zTQv0W+jfwm8WCfGThiLqlJmhaeAYCdsUhUdkx6MJnQWwhkkemeYDmq/tOTIHP+XsbVVRS+8KftXp
	zGS+HZnhqgmwBrV3+TbzbH04gtACv8tyloPzSBwuM0gqV0fxMoXjmPjNTqrBqUk9/d0jJzVkYdJBn
	QxA/ocsonTgBQoXFId7qDCP1J4mCg0qjS7aGMDbWrimj10xx1TTti93EuivnUeqUMh7xtX6k/D385
	RkOYcftj3bUPuHU3QvpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h70rz-0001Se-Vh; Thu, 21 Mar 2019 16:48:44 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h70rA-0000Jp-49
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 16:47:57 +0000
X-IronPort-AV: E=Sophos;i="5.58,498,1544511600"; d="scan'208";a="29830239"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 21 Mar 2019 09:47:47 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.107) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Thu, 21 Mar 2019 09:47:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2euNF8bOA/TbNgo5jojuWBCYHf2GkWMtxap2pmq5PSc=;
 b=rMAkYCmoW4zYjphYdxtoAbAaAp+tXWnGDwJmaJQ604ArHQMcVm20lGKorX43gr85zmpjcCVhSMW5HIJO1cxCuxA/wQj8PPqzLEZHPo4UZW4hk07Ar4uhApl+sdIBUTyacrPVYuPPvhjF/qPECPTlapHYQ5iIRZ3sbVsXs4nYMxc=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB4146.namprd11.prod.outlook.com (10.255.130.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Thu, 21 Mar 2019 16:47:45 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Thu, 21 Mar
 2019 16:47:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <geert+renesas@glider.be>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>, 
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>, <richard@nod.at>
Subject: Re: [PATCH] mtd: spi-nor: Print all JEDEC ID bytes on error
Thread-Topic: [PATCH] mtd: spi-nor: Print all JEDEC ID bytes on error
Thread-Index: AQHU2MDpyRPQBDU5M0OWBDxTBWRvk6YWWhKA
Date: Thu, 21 Mar 2019 16:47:45 +0000
Message-ID: <dd9193d5-4700-7b83-b397-fc363ee9bbd9@microchip.com>
References: <20190312104549.22721-1-geert+renesas@glider.be>
In-Reply-To: <20190312104549.22721-1-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0128.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::26) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38a6c054-714e-44d5-43b8-08d6ae1cf150
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB4146; 
x-ms-traffictypediagnostic: BN6PR11MB4146:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB41465C9B6B5355E2179591A2F0420@BN6PR11MB4146.namprd11.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(346002)(39860400002)(136003)(189003)(199004)(478600001)(53546011)(6486002)(102836004)(486006)(97736004)(256004)(186003)(6246003)(14444005)(229853002)(4744005)(71190400001)(71200400001)(446003)(106356001)(6436002)(66066001)(7736002)(31686004)(305945005)(105586002)(2616005)(476003)(5660300002)(6306002)(11346002)(6512007)(316002)(72206003)(8936002)(25786009)(53936002)(86362001)(36756003)(966005)(26005)(68736007)(8676002)(386003)(52116002)(3846002)(81166006)(31696002)(4326008)(76176011)(81156014)(2906002)(6116002)(14454004)(110136005)(99286004)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB4146;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ClM8dh4izRQwAks67S2TlopxixiqRqjAoMfRBBIcbouUtT7J3+niDzA8bdBkYJm8owjLL2m7mvBlGTnZOPkzbuTQzbaozton9E2NEFleHvsqhC10LHJ7Xth2EoejCZv+ZnOt4dnwTE5XsZDf1lxoOqLGiqv/Z6+4wnlFK8YaTHjhQ6cCFN/Q/O6BtkPI9Z8o+GgQeUagqMYFXDqqXkBAlwgOXaihT7d85bLpJ3OoC1aFT+RJ3LeQjPJhnFZRYbCZ49cQHpIQay2nrcRXaWEQU47kC/9/WhVlQqVlfFW/IYWo4cFXXdZUwMYn3dpzbQeEMujVnT/+icppRk4fI4OIV4IfkfLTtGdub0BC3PI0sNqa6Su/j0vdI0RatJvbD6irWWpFDKSr4r4S3kDNz+DqMjzADUj3E1bhAWNp/pu3NsU=
Content-ID: <C22E655159336841A2543E00C46778B3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a6c054-714e-44d5-43b8-08d6ae1cf150
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 16:47:45.7056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4146
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_094752_984921_144423B1 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 03/12/2019 12:45 PM, Geert Uytterhoeven wrote:
> If identification of an SPI NOR FLASH fails, the JEDEC ID is printed,
> which is stored in the first 3 bytes of the ID read from the FLASH.
> However, the extended JEDEC ID, which is stored in the remaining bytes,
> also matters, as it is used for identification of some FLASH types.
> 
> Print all (currently 6) ID bytes read to ease failure analysis and
> debugging.
> 
> Suggested-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to http://git.infradead.org/linux-mtd.git, spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
