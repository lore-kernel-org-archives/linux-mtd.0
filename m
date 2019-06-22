Return-Path: <SRS0=H4dZ=UV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF1FC43613
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jun 2019 11:49:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61B9F20657
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jun 2019 11:49:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rlF4jD+d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="CE5P4Vew"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61B9F20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvHAml8lUQAlu1rVdpfVzh12PSoMWaElb3Vyg/d6iAc=; b=rlF4jD+dDqjduC
	0zReijUiOPwKUHzM+96/i9t3ewfATOX8EfEck6aAL6NA12OIxku67/gOJBzJ6ZLjQnlVIeB1jsKl9
	gNJt9SUsulA5Og0+dgyu/NAGHLXMzP7H73QCrAQLTwBLa0JV0CwkRK8DUuOPaKl/GYl8J29lADcvC
	XiK8DCp9BNa75q5udV51D0ERdBQWvPhauaUMIibF/ybClCSxJQ7RzAMbLReagPyQ6h6Y8mighitmB
	LJTJIAkN00LSpQT1ghjCZOYOpglyS+ozduHbKe27F8ImovRuIx1nKNV5aJjSvEz7GsHywxdbaJw4/
	AZPBjiULJpIfJRZRd4Cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heeWV-00057A-FL; Sat, 22 Jun 2019 11:49:35 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heeWQ-00056P-Un
 for linux-mtd@lists.infradead.org; Sat, 22 Jun 2019 11:49:33 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,404,1557212400"; d="scan'208";a="37969140"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jun 2019 04:49:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 22 Jun 2019 04:49:26 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 22 Jun 2019 04:49:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGMzP4NIhKHYOQskA5N/aQBSc8PRYGkAM7AV7HMVgTA=;
 b=CE5P4Vew1V9icQ3C0kVcuXaNJZ4hYPa81I3OtXu0m6Y6ykXuJ9Otgb29/P0/keufftay2qDdv0/zA1PE9EYeR1r6vUHBMZCyr33GyU+0cDJg7SJWpmVUlYjidnr2UfxKuvCZkuuycGsYZOb2xkEPKszr/ZkYwe5w16bDA1U/HPc=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1489.namprd11.prod.outlook.com (10.172.22.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Sat, 22 Jun 2019 11:49:26 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.1987.017; Sat, 22 Jun 2019
 11:49:26 +0000
From: <Tudor.Ambarus@microchip.com>
To: <liu.xiang6@zte.com.cn>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3] mtd: spi-nor: fix nor->addr_width when its value
 configured from SFDP does not match the actual width
Thread-Topic: [PATCH v3] mtd: spi-nor: fix nor->addr_width when its value
 configured from SFDP does not match the actual width
Thread-Index: AQHU55VmKdhoFdZiLUGlGE6PYVpZk6aoEd+A
Date: Sat, 22 Jun 2019 11:49:25 +0000
Message-ID: <5ffc9e32-ff69-9819-7bfd-ad9f793bb629@microchip.com>
References: <1554018157-10860-1-git-send-email-liu.xiang6@zte.com.cn>
In-Reply-To: <1554018157-10860-1-git-send-email-liu.xiang6@zte.com.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0010.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::20) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.138.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66b1799c-ef32-402f-78f9-08d6f707acb1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR11MB1489; 
x-ms-traffictypediagnostic: BN6PR11MB1489:
x-microsoft-antispam-prvs: <BN6PR11MB14899215CA39D616AD987004F0E60@BN6PR11MB1489.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0076F48C8A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(136003)(346002)(39860400002)(376002)(199004)(189003)(31686004)(8936002)(68736007)(52116002)(25786009)(186003)(6486002)(7736002)(76176011)(2906002)(305945005)(81166006)(54906003)(72206003)(110136005)(71200400001)(81156014)(8676002)(71190400001)(486006)(14454004)(2501003)(478600001)(476003)(11346002)(99286004)(36756003)(6116002)(2616005)(3846002)(446003)(53546011)(6506007)(53936002)(31696002)(386003)(256004)(86362001)(316002)(14444005)(6512007)(26005)(6246003)(5660300002)(73956011)(66446008)(4326008)(7416002)(66946007)(6436002)(66066001)(102836004)(229853002)(64756008)(66556008)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1489;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8gxXBSRGsc1knDZNI4QcvRwVhHF5T6+x+QlxH5TSj5zGmlarszO8H5mF3+nqYvQsuRoE3enoLUDOOuPfPk1znQ8hwe0nmuBJCh7FEVJdwLYY59G+3nTl77JOm6ZOYWJAQEJivm9VaIlrb7O8L4Sdk3+RARa7TNvQYXfiUOwnxcGTKYMl/0m1O6yR+T6EewBIjNVSfDYZxIRwV0aPV40sJ0tuPQYh9ETxjuGSPA1C0hw3OUZgWC/lvzRxzPJD0JAKZmmy4mD8aNuQgSEcDDbl357O/b+I+eG/ktJd210A6Ky1EqdGeaRpOYyo+1luzHULi7oZEoa97EOcUxTdnDfulePRsbsz0GAmuolZFKKrkpaNC9FFU4NxBDx3OcOxGDoIx9NPp/BBQNOhqoENgiXFbZNpTf0F3IsrIflVFMDsPDQ=
Content-ID: <C823C2096139CB458DB5A047284C88F3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b1799c-ef32-402f-78f9-08d6f707acb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2019 11:49:25.7430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1489
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190622_044931_077604_469AACBC 
X-CRM114-Status: GOOD (  18.99  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, nagasure@xilinx.com,
 liuxiang_1999@126.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Liu,

On 03/31/2019 10:42 AM, Liu Xiang wrote:

> Some is25lp256 get BFPT_DWORD1_ADDRESS_BYTES_3_ONLY from BFPT table for
> address width. But in actual fact the flash can support 4-byte address.
> So we should fix it.

It's better to be imperative. Substitute "So we should fix it" with something
like "Use a post bfpt fixup hook to overwrite the address width advertised by
the BFPT".

>

We'll need a fixes tag here.> Suggested-by: Boris Brezillon <bbrezillon@kernel.org>
> Suggested-by: Vignesh Raghavendra <vigneshr@ti.com>

When? If they didn't explicitly suggested this approach, lets drop the S-b tags.

> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
> ---
> 
> Changes in v3:
>  add a fixup for is25lp256 to solve the address width problem.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 6e13bbd..d252a66 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1682,6 +1682,28 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
>  		.flags = SPI_NOR_NO_FR | SPI_S3AN,
>  
>  static int
> +is25lp256_post_bfpt_fixups(struct spi_nor *nor,
> +			   const struct sfdp_parameter_header *bfpt_header,
> +			   const struct sfdp_bfpt *bfpt,
> +			   struct spi_nor_flash_parameter *params)
> +{
> +	/*
> +	 * IS25LP256 supports 4B opcodes.
> +	 * Unfortunately, some devices get BFPT_DWORD1_ADDRESS_BYTES_3_ONLY
                            ^ which devices, did you get a list from issi?

> +	 * from BFPT table for address width. We should fix it.

How about "IS25LP256 supports 4B opcodes, but the BFPT advertises a
BFPT_DWORD1_ADDRESS_BYTES_3_ONLY address width. Overwrite the address width
advertised by the BFPT."

> +	 */
> +	if ((bfpt->dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
> +		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
> +		nor->addr_width = 4;
> +
> +	return 0;
> +}
> +
> +static struct spi_nor_fixups is25lp256_fixups = {

Naga will use "is25lp256_fixups" for the is25wp256 too, but it's not the case to
change the name yet. All good here.

I really want to have this in next, can I have an update in the next few days?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
