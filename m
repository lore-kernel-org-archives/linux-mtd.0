Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F76C282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 08:17:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C920C2175B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 08:17:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f1LQJJS3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="gB8l9Qqm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C920C2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KNoH0nQRa/uNgOviP5jMyvqQfw9ZkTiDlK0Xw5ukJA=; b=f1LQJJS3xAuPFY
	1YjmGHdHwCdhp0L+X9Tacbac8Nu8YoZD3c1/XTGFVKVF8qAffNeiti02KG4+UiU8b2RI0FWDX6GTY
	N9ScRheaxUiMyce0MOllxKaOsHy3KpJOBeuXfvOPI50Sc3B4JxoKP6S66bLgm33uEgSMiwfJFpm54
	Fn0XXMkMbHpfrqT1Uy2duTaJS5sq+qp9XRCfntP/Qur/GpTfY+yY7mXVU2aj86d3hkop5FTvp9IEQ
	LwFVpZQ1X5CqfeaTtg00c2/CCVguT5BMxZfKUeQEKnXjdQrZyyAqIJDSSClDPtcTPfaTzkQAJOEEl
	BOUX+F/AVm5umtBY/Yqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grero-0006Jn-QC; Thu, 07 Feb 2019 08:17:04 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grerl-0006If-Pe
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 08:17:03 +0000
X-IronPort-AV: E=Sophos;i="5.58,342,1544511600"; d="scan'208";a="26239732"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 07 Feb 2019 01:16:58 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.107) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Thu, 7 Feb 2019 01:16:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5eE043Len1wE2XT6qA55ql0Tu0wYxMgz11UEwZeDQo=;
 b=gB8l9Qqm9u0j5PBwWfMudPhSSUhPSJHJ9TBM1JkXMhzbfkDPkp2onnYdtn4tMlAceh1EHcCTASi4iq2dcF2qhbFz+iR5y5rAqjE20F+l++pK6kagIFQtQKJwLZsmFxvunJ1Ffy3bOpHFHzaF0MUMmJ9tUrO0eUdpFCMVLlP5Ip4=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB0051.namprd11.prod.outlook.com (10.161.153.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.17; Thu, 7 Feb 2019 08:16:55 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.019; Thu, 7 Feb 2019
 08:16:55 +0000
From: <Tudor.Ambarus@microchip.com>
To: <ahmet.celenk@procenne.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH V3] mtd: spi-nor: split s25fl128s into s25fl128s0 and
 s25fl128s1
Thread-Topic: [PATCH V3] mtd: spi-nor: split s25fl128s into s25fl128s0 and
 s25fl128s1
Thread-Index: AQHUvqgtqlPrE+cYqECk98UEglsG76XT/aGA
Date: Thu, 7 Feb 2019 08:16:55 +0000
Message-ID: <7b33d1ab-835b-781a-b2e9-f271dc493afa@microchip.com>
References: <1549518234-15211-1-git-send-email-ahmet.celenk@procenne.com>
In-Reply-To: <1549518234-15211-1-git-send-email-ahmet.celenk@procenne.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0202CA0013.eurprd02.prod.outlook.com
 (2603:10a6:803:14::26) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.52.185]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB0051;
 6:kTFQtLou/43EK429kGWoYH5rEt1tzL9H99PPKYtiZ+mbMkENz+yjeJnNeHGnh8zetAqUwIUiU0IPcIKmSYqDLdL8mmYy975sQn5ANnCDFf5aV5s2Gfm1Notc+iPK6vYQbTc7a4xVyHt37/pDEIIcQeZ9ytkKNSDkIDlTfQTRlsfmZJwbtpcFPFGpBP2oBUtUxst4FILNgRjKcFzyo84Vs/yILA81Pnsh9h5ZA5KxBf7Ni63S4aGOK/HbnNLwX6fz2RylI75dAz8nypBwxSnedUjYiL7eHLshfdskt84CU1PFFflV+1XcNYQVaSt7qToy7gafT7Lk7yqFFAmoH82/++7sZUJo4O4cgwIvVMy26MHwbjZ+lE2GUy+scjATOmVqc+gx1a0tPqx4M4wu9EqV3j+CZM+uvAfTtW4Jy9DIgy7CxSiRG98ElrAqSzNCOjbqmVrYMUcVrP35Zv7dQ4+gfA==;
 5:fxTjfVK2YMF2UWjTZ8AChcUQKRAiDR0KCgm9KmDL2gjKR6lkxL0t8PLv4yaVj396MJEw6fo4q9OAQ7bRxh3X7Rp0/CR37KUFOY3GtnjYneFE2SEOzuo8TodlmXaPN57bVTpBG4KgoD+/MfiFnX0hGxD0vo4BVqscirGQI+0rehz/JmS6rs0gsNRBceLUl5vwTomphYTmCG4E7z+ev1Lxuw==;
 7:uiwcvCSGWD3CzGTisT347TkeY9JTjzk0img6Yd7oHISAgTmNpUXhMCrrTSz5D9vM8r11iDnDKVJ8Fig07bQA2M7lv4r2Ynwws2ftG4mzkO+PKg9Uf7kNDAIZFnKeu5VPKTj7OAQi+qLJNb5UTtWRhg==
x-ms-office365-filtering-correlation-id: 80b8348b-081f-4ae4-8792-08d68cd49edd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB0051; 
x-ms-traffictypediagnostic: BN6PR11MB0051:
x-microsoft-antispam-prvs: <BN6PR11MB00511B8523F61802CA27A376F0680@BN6PR11MB0051.namprd11.prod.outlook.com>
x-forefront-prvs: 0941B96580
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(366004)(376002)(346002)(136003)(189003)(199004)(2906002)(68736007)(446003)(11346002)(6512007)(81166006)(6246003)(14454004)(97736004)(25786009)(8936002)(53936002)(229853002)(31686004)(81156014)(8676002)(76176011)(486006)(52116002)(99286004)(6486002)(305945005)(4326008)(476003)(2616005)(14444005)(478600001)(54906003)(36756003)(110136005)(6436002)(7736002)(256004)(105586002)(316002)(71190400001)(71200400001)(186003)(86362001)(31696002)(386003)(26005)(72206003)(53546011)(3846002)(6506007)(2501003)(66066001)(102836004)(6116002)(106356001)(138113003)(98903001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB0051;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 830ox7Yg5EpgySwiNRhHoQ6keJDl3C2uIoMK2nPIqEtDEGp16DzGUba/Xf/7czUYtcPq4od69LJNfaQkYyiZR0skSD9PLbXgOqwreuaq92QLLmcFtyd/y+29w6Pw5HQM/2vx2pA/IkdB++TLGrHt8uSAnMG00mRaC8ZK1Cv52Q+FwIs+fSrMqf5Ex+9JxG+MjhAa3rh4LBahFth+1IBHsmKKi6PiVQjQP5q3OrRN1ZcyFgCus+ARiTZ1WWUqqEnNUuQ444POSBEJ2ExuzbhGdIiocxokKPLxWu4/26gswTlu+OJJDDQhQiwH0BmNY3+gFWl9r4wieWM0AcaWQlMNjyradrOaVCmSsXfg+/2fYtZ/0d8l9xHPW8+sYdGnJ/uzI4CTCIQgaHo8ZZubNXZ2A8SR1VOQueS2hRPSeOEkYjE=
Content-ID: <ECAB6841D5497345B58ED2071E1593E5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b8348b-081f-4ae4-8792-08d68cd49edd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2019 08:16:53.7580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0051
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_001701_863851_BBBA50D9 
X-CRM114-Status: GOOD (  14.99  )
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
Cc: marek.vasut@gmail.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Ahmet,

On 02/07/2019 07:43 AM, A. Celenk wrote:
> From: "Ahmet Celenk" <ahmet.celenk@procenne.com>
> 
> Due to two different versions (S25FL128SAGBHI200 and S25FL128SAGBHI210) of
> the s25fl128s qspi memory, the single "s25fl128s" device entry must be
> split into two to match the correct JEDEC ID's for each version. Solves
> paging related issues of S25FL128SAGBHI210 chips.
> 
> Signed-off-by: Ahmet Celenk <ahmet.celenk@procenne.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> ---
> V3: Added missing SPI_NOR_DUAL_READ flags to new entries
> V2: Removed the old s25fl128s entry
> 
>  drivers/mtd/spi-nor/spi-nor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 6e13bbd..3cd9052 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1891,7 +1891,8 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>  	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
> -	{ "s25fl128s",  INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },

The patch is good, there are few nitpicks however. Would you please fix them?

When running checkpatch I get:
$ ./scripts/checkpatch.pl --strict
V3-mtd-spi-nor-split-s25fl128s-into-s25fl128s0-and-s25fl128s1.patch
WARNING: line over 80 characters
#43: FILE: drivers/mtd/spi-nor/spi-nor.c:1894:
+	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64, SPI_NOR_DUAL_READ |
SPI_NOR_QUAD_READ | USE_CLSR) },

WARNING: line over 80 characters
#44: FILE: drivers/mtd/spi-nor/spi-nor.c:1895:
+	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ |
SPI_NOR_QUAD_READ | USE_CLSR) },

Please choose the following format, it has fewer lines:
        { "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64,
                        SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
        { "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
                        SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },

While here, would you please place these 2 entries in alphabetical order? They
belong just before "s25fl256s0" entry.

Thanks!
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
