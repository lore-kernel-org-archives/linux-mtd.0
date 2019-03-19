Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA63C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:29:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F7D22064A
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:29:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kBodXiCp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="epbSZ4xx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F7D22064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSf6FXta+O6gaPJ5kB5vTvgcCvzLJZwHY+4ymI6IxQs=; b=kBodXiCp5UuPH9
	vvETbz2geL+BzAKMfwZSTPCchA8qhzBHMYmkfJHoyKT8+fdmc33jbRHPx+S7TpyAjQe4MjgEP+D3u
	gQ46i+VqV4tOvTcOYDGJ2OLd1kgOEwzD4QCr9XzphW1njVRAUIUn6bDx0XSQzvVmfJQV+w7O58Cbr
	H3PLKSTmyMesfbyoiKLHO/7JGPWyCuYRXjOREhiRiD2ZKNDqM7mdgQApR7fTJ4NyywxJpT6lsQQmW
	FlOxD6/MLF80v+hGqEUMQI3zsYz4dgjdRwKvbmkYDdt6W/1sfC3vSeXTEmWJzkwHeRN00y1LdMeTm
	CvYEYhSlmACtefL52jog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Hc4-0006mV-GT; Tue, 19 Mar 2019 16:29:16 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Hc1-0006m3-IE
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 16:29:15 +0000
X-IronPort-AV: E=Sophos;i="5.58,498,1544511600"; d="scan'208";a="28537725"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES128-SHA;
 19 Mar 2019 09:29:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.37) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Tue, 19 Mar 2019 09:29:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfCIyNqrfab97vVqpZwy9C6SkoDByeMnoxHQsu4bcOM=;
 b=epbSZ4xxcA5kguGpgtFS6gfg4u62AvVpwCvu91L2YKYsGuFIeTuf7M2X23f/UNL4tZ2I+MlBSYyg914cK3CZ9KUNPsYLVBUkmEkuClqlgiTiRkk6UBvH7C1CHhfW1p4fkaK3u31Sp4X1DwWwRtsbDCmLD5P6jO1fE3oWyPy7m/o=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB2002.namprd11.prod.outlook.com (10.173.33.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Tue, 19 Mar 2019 16:29:03 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Tue, 19 Mar
 2019 16:29:03 +0000
From: <Tudor.Ambarus@microchip.com>
To: <geert+renesas@glider.be>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>, 
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>, <richard@nod.at>
Subject: Re: [PATCH] mtd: spi-nor: Print all JEDEC ID bytes on error
Thread-Topic: [PATCH] mtd: spi-nor: Print all JEDEC ID bytes on error
Thread-Index: AQHU2MDpyRPQBDU5M0OWBDxTBWRvk6YTMDAA
Date: Tue, 19 Mar 2019 16:29:03 +0000
Message-ID: <365c56fd-86c5-a0c3-6b9a-35853767d3b2@microchip.com>
References: <20190312104549.22721-1-geert+renesas@glider.be>
In-Reply-To: <20190312104549.22721-1-geert+renesas@glider.be>
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
x-ms-office365-filtering-correlation-id: 3263a422-9294-490a-da32-08d6ac87ffb3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB2002; 
x-ms-traffictypediagnostic: BN6PR11MB2002:
x-microsoft-antispam-prvs: <BN6PR11MB20028DB9FD49A1DBA916D62BF0400@BN6PR11MB2002.namprd11.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(39860400002)(366004)(136003)(199004)(189003)(229853002)(72206003)(6512007)(71200400001)(6486002)(52116002)(6436002)(4326008)(25786009)(11346002)(31686004)(476003)(2616005)(71190400001)(446003)(14454004)(386003)(186003)(486006)(99286004)(6246003)(53546011)(53936002)(86362001)(26005)(76176011)(31696002)(5660300002)(102836004)(6506007)(7736002)(8936002)(110136005)(8676002)(97736004)(2906002)(66066001)(3846002)(6116002)(316002)(305945005)(105586002)(81166006)(36756003)(478600001)(81156014)(256004)(14444005)(68736007)(106356001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB2002;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +PFpNwI4ySYI4iwI/KMWtZNh8ePzzZZouV7LmA/Z7hwEHh6WhEVpx4mXmtZ5xpV4foIIYeUnCysqUxW9D8S9GKcOj9UJZzAhMA03Q40mCnA3ohea/A1z/TkmYgqI37W9iVy8eqIuDHTvi5ikAQtDmmiQIk0AOwSer92JVl625JNfX/ywoMU+csMc1xPyV9vPTjtWe4Hv6kSVfRZsIKU7PtT4QAeUyBmyRHNhsrCSa0aYRbCYRigxWaZCV5d2HFgw8cOc6zlVweDXlfAiIrrVJ7m7VkDMX9hUV4KlapTv4o0LnOB7PaYljRaF9PPh0KiLv/lPXESPgV85GLm5uqrB/hTrdFXDYSrvDNXbPYN4pNXJe87smu6lMgRyCsTeHf+PBiIpFsB3w8e4cEQVQAJ63hrIMu89VtQwQDMC/4JerD4=
Content-ID: <F882A7A98D68A140BDC3DAD8A565DE0A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3263a422-9294-490a-da32-08d6ac87ffb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 16:29:03.4667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2002
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_092913_751779_BD78EDA2 
X-CRM114-Status: GOOD (  14.18  )
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

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index fae147452aff3499..028b21abee0da5dc 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2071,8 +2071,8 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
>  				return &spi_nor_ids[tmp];
>  		}
>  	}
> -	dev_err(nor->dev, "unrecognized JEDEC id bytes: %02x, %02x, %02x\n",
> -		id[0], id[1], id[2]);
> +	dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
> +		SPI_NOR_MAX_ID_LEN, id);
>  	return ERR_PTR(-ENODEV);
>  }
>  
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
