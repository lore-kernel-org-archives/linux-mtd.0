Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEB5C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:30:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C2CB2064A
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sW8fJfSb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="UbwtgAby"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C2CB2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0JXeRw0KQpLRbUlWApzhXruu63MsBA1VyjcFXQpXZaE=; b=sW8fJfSb+A5cvI
	0c7MvkFddzJXjjFvGt+kLfwzQgbV1lYiM0yDOqkgCzd60IQegKI3lwAAYxQsMB+r0ScgF+jev9mEA
	THdK7SOeqNRAyMKw9FJHBSpreQ2g8VBTvWtHpM2z5vGbH75m+5FyOXhehEcuAo9FujQpzybncr0gW
	CZuUVNo2Z5+K4Yjro2Vtx1hx6j2evnLHkMKooA7LTB5ZYV5xIGHuOahHWBscEx96B9yDsEMFAWefD
	DmZ9DresxmhKaXaV+QxMeMghFtBvCFQCskLeUfIsfbtntdVvq0HSyXL8SiI7XYe0HSkCxNiNu3tI7
	LCZmRW/NBj6LGqneQI2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Hde-0000PD-0U; Tue, 19 Mar 2019 16:30:54 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Hdb-0000Oj-1m
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 16:30:52 +0000
X-IronPort-AV: E=Sophos;i="5.58,498,1544511600"; d="scan'208";a="28133887"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 19 Mar 2019 09:30:49 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Tue, 19 Mar 2019 09:30:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1nqUwpzY+AWKd5ATqEK883zjrExNnHf4ARe0SK2NZM=;
 b=UbwtgAbym/52MnsB5MOuWAN+zUGGaH1dPtIZj/MXRaX5Tq4axMLtN2qmKFYaz1eN/JUg7IDiGm/p7myzsKIyN8tMhQdilejkYCQe7fYi+50e8fWKB2ni/AwynhuKLxaNFIqYJZ+3xUGFtBqtBP5x5a4n17Rz+AvOLNqNswlAExQ=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB3890.namprd11.prod.outlook.com (10.255.128.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Tue, 19 Mar 2019 16:30:43 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Tue, 19 Mar
 2019 16:30:43 +0000
From: <Tudor.Ambarus@microchip.com>
To: <jonas@norrbonn.se>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v2 2/3] mtd: spi-nor: s25fl512s supports region locking
Thread-Index: AQHUuB/2wb3K3NmS2ki4cC9A5tK5IaYTcesA
Date: Tue, 19 Mar 2019 16:30:43 +0000
Message-ID: <f8f56208-5349-d099-4204-7f9c19b94930@microchip.com>
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <20190129220705.5143-3-jonas@norrbonn.se>
In-Reply-To: <20190129220705.5143-3-jonas@norrbonn.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0163.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::11) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 339fcb62-2c9d-43eb-c6f3-08d6ac883b53
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB3890; 
x-ms-traffictypediagnostic: BN6PR11MB3890:
x-microsoft-antispam-prvs: <BN6PR11MB38900CC9BBB61A63CADB410EF0400@BN6PR11MB3890.namprd11.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(39860400002)(376002)(346002)(396003)(199004)(189003)(6116002)(54906003)(106356001)(316002)(110136005)(8936002)(81166006)(2906002)(8676002)(81156014)(2501003)(256004)(305945005)(68736007)(36756003)(3846002)(14444005)(7736002)(478600001)(105586002)(97736004)(5660300002)(71200400001)(6436002)(72206003)(71190400001)(52116002)(6486002)(229853002)(6512007)(4326008)(76176011)(2616005)(26005)(66066001)(486006)(53546011)(86362001)(31696002)(102836004)(99286004)(186003)(6506007)(6246003)(53936002)(386003)(31686004)(476003)(25786009)(446003)(11346002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB3890;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y8x3cWoSkOAeX9NxkWt/mEY/exM4+fnH0UNsmfu5WH+N2qzXbHInzzI4rqu+vMx3CenQw56k2quspqLO3ZzSMdOM1ZED9+bbr8k7u/+E8RLqD3tB8zkS3tprSZZRfdr4hbo5x+ZOEjGw9NZG94o/IM2ek/zcYXhpAS9akt51rkgXaqSTsuia8sgVMpIkA/wbAmV8cSOABGsfqXqID0LVSID1wG85GVPGbUXV3LynrPulbukjYMNV0HQsHs2vhbFrX3R9jZbfwGWNr9f+vdA4Ee94VSP/meRAXUHdjnNybIVFy4QWlMFzNl/UsrtQylwE6gio+nxq+5+uS7us+qiYLttyXG2dgVC/QHc++3mB6fyseaEuNwInpc+3UuFZIIkfW/FE5J/f99+5Xq+1CXISzB4GRFt996eujuSKtuq+/Vc=
Content-ID: <27501CA9E4BB694FADB0D6BA357D63CC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 339fcb62-2c9d-43eb-c6f3-08d6ac883b53
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 16:30:43.4793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3890
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_093051_136927_6464239F 
X-CRM114-Status: GOOD (  16.86  )
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

Jonas,

On 01/30/2019 12:07 AM, Jonas Bonn wrote:
> Both the BP0-2 bits and the TBPROT bit are supported on this chip.

It's always comfortable to see in the commit message that the change was tested.
Manufacturers can mistake and advertise things that they don't support :).

> 
> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
> CC: Marek Vasut <marek.vasut@gmail.com>
> CC: David Woodhouse <dwmw2@infradead.org>
> CC: Brian Norris <computersforpeace@gmail.com>
> CC: Boris Brezillon <bbrezillon@kernel.org>
> CC: Richard Weinberger <richard@nod.at>
> CC: linux-mtd@lists.infradead.org

The list is quite large. I usually use git send-email --cc=someone@something to
cc people. And CC: explicitly in the commit message when I want the change to be
included in a stable kernel.

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 4c8ce2b90838..d6840c2b15dd 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1886,8 +1886,8 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
>  	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> -	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> -	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
> +	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },

Would you please get rid of the 80 char checkpatch warnings? Please use the
following format, it has fewer lines:

        { "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
                         SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)

Thanks!
ta

>  	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>  	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
