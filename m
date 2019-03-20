Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B8DC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:39:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 765E52184D
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sm/nJnIZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="fYGMv7IB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 765E52184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFe2aE5m1neJ0UzoTMXYcZ2kSnh2w2e6KnCWRSlbKvE=; b=sm/nJnIZq4AD3E
	/wFuFQ7qZcisxO2mFkTE1bZmEZcti8uuM+W2XJ3iRgrhiwKhFR9lGRJslNqIu9dFRoqTktQKQDLz+
	4rgc7hYmzR3wS6IvGyM57/fU8Tr8+NCUQbceyXc11Xf7nOlUXC8G0Cn/k6fy5SGOD1E2SLaaBAJqL
	+uBqUEcOkn9otf0ZteiF4tXHdGZedLqPO4EwB+SPkSTDE2h6WC+EszJUTbAdkFl/hfSgt2gGwj6LC
	eN6cUldVc/NlS6kzNpdlag1US3JC3i2cbjkotvySra3dEPgxUNT07GBRXjfXyLH0C9fzapZ9y/Mhp
	IrVtMPiVldWsk2F4KlTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Voc-0007GM-Ax; Wed, 20 Mar 2019 07:39:10 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6VoY-0007Fk-GD
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 07:39:08 +0000
X-IronPort-AV: E=Sophos;i="5.60,248,1549954800"; d="scan'208";a="26581963"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 20 Mar 2019 00:39:06 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.106) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Wed, 20 Mar 2019 00:39:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuw7zZklrJ3r3wfzm1ctjifclKUKov4BDC/upqsgwqo=;
 b=fYGMv7IBUJG/8uIbUQRvP+mOlNbTc6a4Lcef9lHArYUXAkAy7g2akW0kDQIdr/6RHq3CXpTddQy+sMgu3EpDP9518vcMuFNDdQYBcZnm2uh7c8iCjZV8d5syvBxSl7tJqVFco1X8iYXWdvMh8ODR53U230aS71wzL4/xEfNKT3A=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1460.namprd11.prod.outlook.com (10.172.21.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.15; Wed, 20 Mar 2019 07:39:03 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Wed, 20 Mar
 2019 07:39:03 +0000
From: <Tudor.Ambarus@microchip.com>
To: <jonas@norrbonn.se>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKYUIhgA
Date: Wed, 20 Mar 2019 07:39:03 +0000
Message-ID: <5a6b361a-95c1-2817-5b07-2600e61ea6e8@microchip.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
In-Reply-To: <20190320071605.4289-3-jonas@norrbonn.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0502CA0020.eurprd05.prod.outlook.com
 (2603:10a6:803:1::33) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aafa9714-fc04-4684-4b25-08d6ad071fa8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1460; 
x-ms-traffictypediagnostic: BN6PR11MB1460:
x-microsoft-antispam-prvs: <BN6PR11MB14609C82C0A822423B1C0239F0410@BN6PR11MB1460.namprd11.prod.outlook.com>
x-forefront-prvs: 098291215C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(396003)(346002)(376002)(136003)(199004)(189003)(53936002)(476003)(6246003)(2906002)(6116002)(3846002)(71190400001)(71200400001)(6512007)(68736007)(105586002)(106356001)(7736002)(305945005)(36756003)(97736004)(66066001)(72206003)(2616005)(478600001)(14444005)(256004)(14454004)(31696002)(86362001)(81156014)(8676002)(81166006)(8936002)(5660300002)(25786009)(11346002)(446003)(486006)(76176011)(186003)(6506007)(53546011)(386003)(229853002)(99286004)(316002)(26005)(31686004)(6486002)(110136005)(52116002)(102836004)(2501003)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1460;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BNz8JkQ4p/3u88Knqyr1Gv+c5TNguNmctVqjoeOh34siOSG/I18XAWv3WdZ0UBwAFE+e3juUicLKhDcoJ2bMFxhZj/c033sa6VCC19uz5WLQEadwncM302UKAgWG/rGpZLwh3XqdxPthGJ+9kSEjxRJ2crSJ4uVSrvoqzCGqA4D3tW2qB+Kwlm24Q4eLvmTg/LzfVaHf8nh9MtJwrosfwZCKGNJTQdop38AIrbwwQFcdORwu4W2TvKx07hTvRB5vH7TQ6V+3RswJvROCO6EQPprh9QakJm0sjtetDNnyIFUBpAWoif4xUbczru1t33CdcNEL5LcfXg1AhoRVoH6PpiQoohI1hw7rSlTFiedo0/2rv0X7mWRo4FjKb8YqEgRnliXIOsvuyWONZu9DnCxzYaM73KeyMQlSYkqBQchszN0=
Content-ID: <B312F47F8AE0D943BF5B4809E59D233C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: aafa9714-fc04-4684-4b25-08d6ad071fa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2019 07:39:03.0466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1460
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_003906_699792_4DC3F978 
X-CRM114-Status: GOOD (  13.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 03/20/2019 09:16 AM, Jonas Bonn wrote:
> External E-Mail
> 
> 
> Both the BP[0-2] bits and the TBPROT bit are supported on this chip.
> Tested and verified on a Cypress s25fl512s.
> 
> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 0cc0ef4fbf3a..9abac9e326a1 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1898,7 +1898,9 @@ static const struct flash_info spi_nor_ids[] = {
>  			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
>  	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> -	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
> +			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
>  	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
