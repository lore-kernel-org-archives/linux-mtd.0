Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59417C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:30:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29B332064A
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:30:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kCZ3iBGv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="1UK1Eg+L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29B332064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hZPQ1Dbeh2+WX9gv/gNEkP3xcR7Q3pRogudO4MgilY=; b=kCZ3iBGvpROQCi
	iqD31ijGfEEELXLJJJs93hZCl6lMeCWc0YfQnVwc36uhmNv06UBplB+FPOhptwT8gG8pGACEZG0l9
	ulV6Il/aP7glHkW3qM5PuLKeBJiJMJqjjjnjaKFsf+dPpfGQI9I6eBZOxmkWOAEGqTS3+qVh4b0nl
	zAvSCtW0KCpK1QmT6mkufUCIWVgry3F7bu4P0VnL8jWCbm/BF96mmLn7yp31SV9hmWCwi93hgofGh
	TW1UPVzz/qRsNzL0uthvL2CJhCdpEWiTS0ETsmy5fOo3pcUf4wXIO+ONuwV96bVL9Y0JYhDB4QIjx
	btj1TrCpxnvMV2e2zKxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Hcn-0007M6-3d; Tue, 19 Mar 2019 16:30:01 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Hck-0007LC-E7
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 16:30:00 +0000
X-IronPort-AV: E=Sophos;i="5.58,498,1544511600"; d="scan'208";a="28537789"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 19 Mar 2019 09:29:54 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.38) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Tue, 19 Mar 2019 09:29:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92mnAzbtLrkYsnb7bjZwMhlX8Z8qRR4hLwnCPB6i+Bw=;
 b=1UK1Eg+Lf4ugYfIzLyTfP1y7PghGHg46JlYQoG6dS6CO3GtPTffkbnWXSPGr2NPJVNCj3E76ZcRTXQ/lKul0RU9r5WuxRQzmyrLLf/bIzy4vuD9opZialRXHZ8jEY7cLIh95DmiBYIPHO+KbyrYoAyiySTsp/djDD3OZeDrCp1s=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1380.namprd11.prod.outlook.com (10.173.26.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Tue, 19 Mar 2019 16:29:52 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Tue, 19 Mar
 2019 16:29:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>,
 <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3] spi-nor: intel-spi: Avoid crossing 4K address boundary
 on read/write
Thread-Topic: [PATCH v3] spi-nor: intel-spi: Avoid crossing 4K address
 boundary on read/write
Thread-Index: AQHU2XXMQ+jSwdChMUilG2pNVzdJLqYTLv0A
Date: Tue, 19 Mar 2019 16:29:52 +0000
Message-ID: <e171947a-07c6-d5f4-b81c-dbf8c6b1647d@microchip.com>
References: <20190313082120.17913-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20190313082120.17913-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0179.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::27) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61807d28-5e9c-45fc-90c5-08d6ac881c91
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1380; 
x-ms-traffictypediagnostic: BN6PR11MB1380:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB13801DE8ECCE8091B4C6C7A7F0400@BN6PR11MB1380.namprd11.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(136003)(366004)(396003)(54534003)(189003)(199004)(4326008)(8936002)(36756003)(31686004)(31696002)(97736004)(105586002)(71200400001)(476003)(66066001)(71190400001)(86362001)(52116002)(6246003)(106356001)(25786009)(486006)(316002)(99286004)(68736007)(102836004)(53546011)(7416002)(6116002)(53936002)(2501003)(14454004)(2616005)(446003)(14444005)(26005)(72206003)(6486002)(3846002)(386003)(6512007)(6306002)(110136005)(478600001)(6436002)(966005)(305945005)(7736002)(81156014)(6506007)(8676002)(186003)(54906003)(256004)(229853002)(5660300002)(76176011)(81166006)(2906002)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1380;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y17L2++lCnZ+qiSlOgw7auwOPjSZQX8tnZduURlisK2ev40sEpA9Dq/826iGdN94OIE+BhdaTv4m62/KgNFmVIxASTKAaWOyjH1r9YHfhAeBkRbKbWVjjGRGK/j1nIdu4KK61FT1NzADdj9gTF/SK9RqUXGczkCC/5HoD+efT8PjpljJtG4lKgXVrLCln39U3fNnjJy0X+kik6yG8+caTIPuqjfhPMaJuOAYTRurbRWb6ILlLtjjBXM6TWeORjKtKQaANTB7ba9ztRnTR8k41LB4R+1EQ+YIclv99J/NJJYWZYtXr4pkIHOKt6/PJxtgSWLxuWi2swNohSi2ZH1mACAn6QTuDVWj/KtzdcT3kCdc+oGICiOlQPgEpKqJWT6wP8K0IL6ReOjBpgJrF48IS9eotfeQGInAzvaWz4t21lE=
Content-ID: <AED707B8A2F6E9459F9850745BCA583E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 61807d28-5e9c-45fc-90c5-08d6ac881c91
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 16:29:52.1121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1380
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_092958_624691_FADB28F1 
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
Cc: computersforpeace@gmail.com, bbrezillon@kernel.org, richard@nod.at,
 romain.porte@nokia.com, stable@vger.kernel.org, marek.vasut@gmail.com,
 pascal.fabreges@nokia.com, bmeng.cn@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Alexander,

On 03/13/2019 10:21 AM, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
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

Please fix your author name to match your S-o-b tag. See
https://lkml.org/lkml/2019/2/8/556 for a workaround.

For consistency, all spi-nor patches should be prepended with "mtd: spi-nor:",
you forgot the "mtd:" part.

Looks good apart of these, I'll add my R-b tag on the next version.

Thanks,
ta

> ---
> Changelog:
> v2: More macros! As suggested by Mika.
> v3: Actually compiled. Sorry Mika, the lines are really long now.
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
