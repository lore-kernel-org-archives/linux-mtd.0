Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810ABC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 06:49:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5090D2184D
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 06:49:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MmeuDgzP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="LMc7+WGN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5090D2184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BKqW8qZM2xECUyrijlXoJz9oCKm0+ikm8Niz8erggY=; b=MmeuDgzPFnO+vO
	uOWM/Wox1BVh70kdc9tNoZKmgMJPcNduG8pg5o9XKBDc42Dwfc7YZeX27uBhCYwBF3eIcMyrxhxUK
	nQn2ilzBerLheIv5R+oT97HroFz++07/fxXoGxizb1eB+x+xZ20vY5woggNdq27IZbGXbffROTzl0
	MBc+AeEE1Fk9Xrs+KwWUagVqE93oIpsIm2Mtyvrki+PZUyJ8lZsL40sYucRpi4yZNVEmD6GWuyL+x
	kSKw0uDp/e7pKU72PwhX3z3xjLVug2/+KDiEKyZpVazPt4PBgt5x9XcjH3XnMbGOMfsdMO3NB6BSb
	rnMV6xAY2gssk9MylAEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6V2W-0005nZ-Ko; Wed, 20 Mar 2019 06:49:28 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6V2U-0005n2-5y
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 06:49:27 +0000
X-IronPort-AV: E=Sophos;i="5.60,248,1549954800"; d="scan'208";a="26579025"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 19 Mar 2019 23:49:23 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.38) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Tue, 19 Mar 2019 23:49:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOVei5xqmsLycB/HqGlXgG3sAObyIclktyQ5/SdwgL4=;
 b=LMc7+WGNNx1dJWXHvVzXyzCOmxQvPNC0ipNE7L/XgM4vFwq5pqnvFY1my/jEYtBZPQzT357cUtsc93HN1VhxWtCzKzrlq4J5yaeDgeiuMrkcI6n2mEvtxLhwLCC3ma7xoLNKKD9uYcJ7M6WgZO+J/pK2Oo3ZuFWCQzgNpg5fOhk=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1922.namprd11.prod.outlook.com (10.175.98.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Wed, 20 Mar 2019 06:49:19 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Wed, 20 Mar
 2019 06:49:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v4] mtd: spi-nor: intel-spi: Avoid crossing 4K address
 boundary on read/write
Thread-Topic: [PATCH v4] mtd: spi-nor: intel-spi: Avoid crossing 4K address
 boundary on read/write
Thread-Index: AQHU3ngGI63UOmSWSUaADLrR2sil26YUFRmA
Date: Wed, 20 Mar 2019 06:49:19 +0000
Message-ID: <3af53f8c-8606-c646-2e77-e6dfc8473f66@microchip.com>
References: <e171947a-07c6-d5f4-b81c-dbf8c6b1647d@microchip.com>
 <20190319171749.19052-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20190319171749.19052-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P189CA0002.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::15) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22a6ea8d-c9c3-458b-c239-08d6ad002d17
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1922; 
x-ms-traffictypediagnostic: BN6PR11MB1922:
x-microsoft-antispam-prvs: <BN6PR11MB19222E2BB28FEF75AACEAAB7F0410@BN6PR11MB1922.namprd11.prod.outlook.com>
x-forefront-prvs: 098291215C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(136003)(39860400002)(366004)(54534003)(189003)(199004)(53546011)(99286004)(14454004)(6506007)(86362001)(3846002)(36756003)(476003)(25786009)(386003)(2616005)(102836004)(7736002)(7416002)(305945005)(76176011)(31696002)(4326008)(26005)(446003)(486006)(11346002)(186003)(6116002)(52116002)(478600001)(81166006)(5660300002)(71200400001)(8676002)(97736004)(81156014)(72206003)(316002)(2906002)(71190400001)(53936002)(14444005)(6486002)(66066001)(106356001)(229853002)(6436002)(54906003)(6512007)(68736007)(256004)(6246003)(105586002)(8936002)(110136005)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1922;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mt1wSkM7K90Lun/Ya3b8cn8yemSkU5ItQMdJzHlk2edC7MT7nfds8+dIdQ+8N+ls1EpXMQS+U654Jt8Rq6vX81iTzwwbSVmnveJPMAOAqgDmfATVQhAG8I3rpUBz1XUm70YUaZOT9dqjHhQhDgr45YKpmwd7MmuafYCzDmk/FT1H7EDEXMKHcViwfcKANa2oRvnDJYJ1TuLnKAtkBktG8tQk4ZIhwYJD8nxQXJOp0WN03C9o2CjWPEVLfgpwRp5CjkZgpicOhxXCcN6l9GG5PGwc4CUTyaaE13uD5nQvCXlLLRrHEB+PdsDv78JxbClQ1x+O0WByOVDaQJDyngY/BjlnAaHXo/qAjzR6dSOc1q/hmraFVHQQG7RfUEI6wfzAtsSqTLULitfR1r3/TRIF+lKzsMbdbiPc2nNyymwPHY0=
Content-ID: <AF3F673BD0CE4749A165D8ADADD6CB6F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a6ea8d-c9c3-458b-c239-08d6ad002d17
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2019 06:49:19.2084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1922
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_234926_331479_3B090917 
X-CRM114-Status: GOOD (  16.84  )
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
Cc: bmeng.cn@gmail.com, bbrezillon@kernel.org, richard@nod.at,
 romain.porte@nokia.com, stable@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, pascal.fabreges@nokia.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Mika,

Would you please add your Acked-by again? It's dropped in v4.

Looks good for me, below is my R-b.

Thanks!

On 03/19/2019 07:18 PM, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> External E-Mail
> 
> 
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> It was observed that reads crossing 4K address boundary are failing.
> 
> This limitation is mentioned in Intel documents:
> 
> Intel(R) 9 Series Chipset Family Platform Controller Hub (PCH) Datasheet:
> 
> "5.26.3 Flash Access
> Program Register Access:
> * Program Register Accesses are not allowed to cross a 4 KB boundary..."
> 
> Enhanced Serial Peripheral Interface (eSPI)
> Interface Base Specification (for Client and Server Platforms):
> 
> "5.1.4 Address
> For other memory transactions, the address may start or end at any byte
> boundary. However, the address and payload length combination must not
> cross the naturally aligned address boundary of the corresponding Maximum
> Payload Size. It must not cross a 4 KB address boundary."
> 
> Avoid this by splitting an operation crossing the boundary into two
> operations.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Romain Porte <romain.porte@nokia.com>
> Tested-by: Pascal Fabreges <pascal.fabreges@nokia.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
> Changelog:
> v2: More macros! As suggested by Mika.
> v3: Actually compiled. Sorry Mika, the lines are really long now.
> v4: Add "mtd:" to the subject
> 
>  drivers/mtd/spi-nor/intel-spi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> index af0a220..d60cbf2 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -632,6 +632,10 @@ static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
>  	while (len > 0) {
>  		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
>  
> +		/* Read cannot cross 4K boundary */
> +		block_size = min_t(loff_t, from + block_size,
> +				   round_up(from + 1, SZ_4K)) - from;
> +
>  		writel(from, ispi->base + FADDR);
>  
>  		val = readl(ispi->base + HSFSTS_CTL);
> @@ -685,6 +689,10 @@ static ssize_t intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
>  	while (len > 0) {
>  		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
>  
> +		/* Write cannot cross 4K boundary */
> +		block_size = min_t(loff_t, to + block_size,
> +				   round_up(to + 1, SZ_4K)) - to;
> +
>  		writel(to, ispi->base + FADDR);
>  
>  		val = readl(ispi->base + HSFSTS_CTL);
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
