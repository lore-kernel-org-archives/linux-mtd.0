Return-Path: <SRS0=BkV4=SR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12F2C10F0E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 09:20:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 774B820656
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 09:20:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VOCp7RFF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="UJX8MrS1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 774B820656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iz8mZQvRTkBoUPngMuQIhMcO9DdcUMz/uq/eI0huBVg=; b=VOCp7RFFToyeY/
	sM/rTi7AOPCFo/0+ylpdhdI1XUHLXeuMaE2nGarSazZ63G03ISd4F2wdEe3XHvMU1/i6kj6S184jo
	hlKFxAtWnS+UJJspjvOXwaJRVTgE5vG60JpKyio+WoF+ge1pLi8W7z6NbhlabuWIw0kP/OHrjD3DO
	gZr4U3jBfsRlB4XJOuyceyN8j71j1mgsGctEqyaBudX2cqQ9L9rn/ovWs5LYdWxaTdBHyY0zBFThz
	xZ/D/IGMx8E71bmYxnjKXfsciqcw7RpLSbOFRTiiCVLrLEBVyV0e6IggCkc2utaH8ghqDBXYTeqAU
	FsozOdkgm+NPQvEwhYsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFxmV-0008MV-1Z; Mon, 15 Apr 2019 09:20:03 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFxmS-0008A6-08
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2019 09:20:02 +0000
X-IronPort-AV: E=Sophos;i="5.60,353,1549954800"; d="scan'208";a="29928976"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 15 Apr 2019 02:19:57 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Mon, 15 Apr 2019 02:19:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGtrtTm7nQLSXBnsrNA/jz/mtKBC70Hth/Pk+aNlMok=;
 b=UJX8MrS16NMPWL9s8SDZreQMibt6L3Lvt4MglIZwSS46sJVj2lSJr+uKg1vwjOCinDmeItRzMgL/mrSlTPojG1nv6/sd9ptFjshBEkBE04X0eQlfGTY3aJbYNqzzJwld26TkxhqXoIAulKyUL0MQqUx6XKH8p0Y6U93uGvTQ9qk=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB3921.namprd11.prod.outlook.com (10.255.130.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.19; Mon, 15 Apr 2019 09:19:56 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3%9]) with mapi id 15.20.1792.018; Mon, 15 Apr 2019
 09:19:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>, <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Add myself as MTD maintainer
Thread-Topic: [PATCH 1/2] MAINTAINERS: Add myself as MTD maintainer
Thread-Index: AQHU6J07NoNqQXuVikKC6cpxgXg906Y9B4KA
Date: Mon, 15 Apr 2019 09:19:56 +0000
Message-ID: <9c3ec04d-b0fe-b75a-27e1-3b4ca061b6b3@microchip.com>
References: <20190401150938.10607-1-miquel.raynal@bootlin.com>
In-Reply-To: <20190401150938.10607-1-miquel.raynal@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0055.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::44) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb446235-b642-4b7d-f6dd-08d6c183863c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR11MB3921; 
x-ms-traffictypediagnostic: BN6PR11MB3921:
x-microsoft-antispam-prvs: <BN6PR11MB392132EE0E619ECE4437A4AFF02B0@BN6PR11MB3921.namprd11.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(346002)(396003)(366004)(189003)(199004)(6506007)(14444005)(386003)(256004)(5660300002)(25786009)(72206003)(110136005)(36756003)(86362001)(478600001)(52116002)(11346002)(81166006)(105586002)(81156014)(2616005)(446003)(26005)(97736004)(486006)(54906003)(8676002)(31696002)(68736007)(106356001)(316002)(102836004)(53546011)(476003)(14454004)(186003)(4326008)(6246003)(229853002)(305945005)(7736002)(6436002)(71190400001)(71200400001)(3846002)(6116002)(6486002)(53936002)(4744005)(76176011)(8936002)(99286004)(31686004)(6512007)(2906002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB3921;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dIivv3hRG5DH98U3MLARfV78t79hq2qdqZmIl3SKwn1XFoo9c/ztT9uUlxl/aU/FV/bnvou0aMSSVH16UiwDNChk0Cb37NjWRmq0tfkkbgD3l+i2BDXMAmK8NHxKC5IB3th1nII8Yy4FIiBk9l5Z1UjWKS/m8+fmAknDJOgtUrj12uQJldZhQ/v2/a8E5hrlrOx9wBwctTS5HgKwEf+VMpHNf0iPCaHtQYEJ/hqGiDgXtG8EupRKDiXqM1vKemi/jSITB/LNOw0yp7tA4LUNPIu31bt/fFJp9LcfaFVykNdtOuvxc06Ye46w8T8hfIxY0Sh4CqYrCx7x+5m6MY/7HHl0pFzhZbXbPRakg6QvEQO6Y+cWkxXEdCHIuKtHiXKePqbDPCnZgy62wMIf9OPacFDQLlSdvT6GVKd1O5NNWcI=
Content-ID: <5D3CE6C24E5E2645A8877C99DBE19F33@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bb446235-b642-4b7d-f6dd-08d6c183863c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 09:19:56.1046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3921
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_022000_162934_583033A8 
X-CRM114-Status: GOOD (  13.31  )
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
Cc: boris.brezillon@collabora.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 04/01/2019 06:09 PM, Miquel Raynal wrote:
> External E-Mail
> 
> 
> Help Richard and hopefully Tudor and Vignesh maintaining MTD since
> Boris is leaving.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a0a549c2fdf..383915d69a51 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9998,6 +9998,7 @@ MEMORY TECHNOLOGY DEVICES (MTD)
>  M:	David Woodhouse <dwmw2@infradead.org>
>  M:	Brian Norris <computersforpeace@gmail.com>
>  M:	Marek Vasut <marek.vasut@gmail.com>
> +M:	Miquel Raynal <miquel.raynal@bootlin.com>
>  M:	Richard Weinberger <richard@nod.at>
>  M:	Vignesh Raghavendra <vigneshr@ti.com>
>  L:	linux-mtd@lists.infradead.org
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
