Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D8DC169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 13:34:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3EA5218A6
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 13:34:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sfmxPwkV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="MUyagcG+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3EA5218A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scaeP8NO7L0xgPJkMG0klpDdS3fqP9B2A8JSd8gzES8=; b=sfmxPwkVnLKPNp
	g+l9lTjk8bxU0rv6/wn8B8uYcgj9BI2Ps7QQKyQuxGXgi9b/ajAFStbTq8YdDatMzGhf0wYao8Zno
	7HIHaUe4xzxIeyZXsNIH/eq5JmeJaJJOW8MPWGK9tDC3QYzu/6aMV45Z1ucHwoN4wImC7PcQUM/l4
	w2V3YnCkVAu4HW5CxeRDSSeZ3aY2GMf/rDwyiJ5rcQzCnmTnMht+TNtTeFHamsD+1gjCpeX2Ay8/q
	98GKfzJeOE681tXhQHMcC94wHL7s5uA7BE+V72LbjgjnDWVlOkvo6Yuz00XJH2TuREksJPD5/7wIo
	Bq+vWyPX7oP5allm6MQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqHuN-0004eL-BC; Sun, 03 Feb 2019 13:34:03 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqHuI-0004dn-2X
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 13:34:01 +0000
X-IronPort-AV: E=Sophos;i="5.56,556,1539673200"; d="scan'208";a="25801214"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 03 Feb 2019 06:33:53 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.38) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Sun, 3 Feb 2019 06:33:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtzUKZJHrGg6W4L1AfuHk0XS07216OeLlq1HF1ovcHU=;
 b=MUyagcG+eWoTPjDyDv8K6OZy68+/N/fPJxa8ONk4FgWVTzVd08WWFPjgeIxMZzDMeyg1hC1aGh4zg+yG32P0LTH0Zoikgk4awPNjqnHKrQE1/eQ/0QljfNwT/wwpq1lU6+KgcBjc1VXSgYv/tpgWD5NvNTltg0y/2jiPAseSYsw=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1521.namprd11.prod.outlook.com (10.172.23.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.16; Sun, 3 Feb 2019 13:33:49 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.019; Sun, 3 Feb 2019
 13:33:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <frieder.schrempf@kontron.de>, <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Add support for EN25Q80A
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Add support for EN25Q80A
Thread-Index: AQHUsvEnBk05JSMTaE23Hh40f7Dva6XOJEMA
Date: Sun, 3 Feb 2019 13:33:48 +0000
Message-ID: <f0b2c97b-419a-1e3e-4624-52c60fe32065@microchip.com>
References: <20190123075538.12681-1-frieder.schrempf@kontron.de>
In-Reply-To: <20190123075538.12681-1-frieder.schrempf@kontron.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0202CA0024.eurprd02.prod.outlook.com
 (2603:10a6:803:14::37) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.121.188.150]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1521;
 6:yi+ytiG41Yy/EYgQe/B16xyKqVjnI0XrO4+oYKVQQ/tc2j2or4n1jDvWwlMW1dDaqKyDXZzfXVzlxiqIaoZvCSvr+0LtmeIKFqERR3APqYU9pCG7CqEstsFkN3x+l1HS70+zrR7kqu3mNi5WI96JISH1J1Kh1r72w1oeiwu7G8d9qM1r59OZt6xsvJ+UydpYObJXHqgErNBVkpVSLKjxRaAs6sit0LwUq3eGbL7XYRlp2BiGlDWER5sa5lgzPS91R7vFFQjAPoXf4bccY7SjIcECRcgK34uoOGydmKLAlJQvDoRq+FCekseeqJ5KBMdx7TmyTqeSQjUMUrn/mSrtIXRamR+hpCOAbJzRNytInPNu6WIdETN1nHizeq/18w8xaW1HFMZUcE/z4+YYr1MS3qGyncbvJrxWkfdlze9f6yG5PfAH94bovAoLuoWyFGxuPRnuYCd65S7PR1Od6LAkyQ==;
 5:G4EXyyyaaLIbsAzvQAW3W3HLtULs4Nsg9yzOi1wU2lrrUXnrICAuA0pjnRlyTNMX+IDIuKfUzKCd0dIEBkWiUmL0RVCbUL1Gr5KDhauTitSgOkB3f0EWfgv+s6cUH93B/3khvHDOIvURNmUharPD6jbD9Y+GbUrrf7q+znFeeiydXf2JAecPbmeA9bAr6V9O0C72aSh6DDbAE2LiGXlxLg==;
 7:YrLa9cSvCy74IQxVnubAaOBrQ3XsrK2khWHj7/uDhJgL/SvdHd0tQ6WwOjDbc72u4fy9R/oiQmOUXw3z0V1uzgyNtEHqAkqbL4YI/pKXwOl1Auf6YlncXVTsZWb9/uKx41ysxo4lI3kbHt1VrfgYjw==
x-ms-office365-filtering-correlation-id: 905573fc-b437-424e-0947-08d689dc3a5e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1521; 
x-ms-traffictypediagnostic: BN6PR11MB1521:
x-microsoft-antispam-prvs: <BN6PR11MB1521D48809A7EF109B8BC3D7F06C0@BN6PR11MB1521.namprd11.prod.outlook.com>
x-forefront-prvs: 0937FB07C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39850400004)(136003)(366004)(396003)(376002)(346002)(189003)(44054003)(199004)(6436002)(68736007)(6512007)(81166006)(81156014)(25786009)(446003)(31686004)(31696002)(256004)(72206003)(478600001)(14444005)(86362001)(39060400002)(71190400001)(6246003)(14454004)(53936002)(4326008)(105586002)(71200400001)(76176011)(106356001)(52116002)(99286004)(305945005)(53546011)(6506007)(386003)(3846002)(26005)(97736004)(102836004)(36756003)(186003)(6116002)(8936002)(11346002)(229853002)(486006)(2616005)(476003)(110136005)(54906003)(316002)(8676002)(7736002)(6486002)(66066001)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1521;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: i1FQHNqua6veQdDKnLLezP9ha2QLq0T0XtI5rmayIUh/XQ1/bSFydHCvEPP00wkPykjW2GnO1otTRTmAYZF6D6/LGZwIdNuOQJAw78ZVv04C/zq1btWTnH3J44BQ89qq2DiDSAwdyRT1aUO23a0KEMWHP6cPWsSDEoECWkmfjVCQ9RYUdkuIUMaK3p3aMnXV3Vecl4DcBwo/fek/82qdKgtZ39l0WZprJGMhsZjwBe/IBvZgxO6ksAJ237YnNMhNGhl7aVZzSwfT9Ks7dKFTEyTu6LXHQDWGTq/ya75bofaSfa5V5D9eb0zKwp16308J5tp1l10FMqJ6mbwqIPYBFGL2Bz9rTbZAywv8cG6Xb9fBzOuLp/L4QKnpIdD8OJbwDJtrvySn44WOFBmi8BR7+jsJWMr1nceyyjiWgdDzcL8=
Content-ID: <D5D02C195F62E64699584B43471C8832@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 905573fc-b437-424e-0947-08d689dc3a5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2019 13:33:47.1224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1521
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_053358_474120_3A14E8EB 
X-CRM114-Status: GOOD (  17.11  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Frieder,

On 01/23/2019 09:56 AM, Schrempf Frieder wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This adds support for the EON EN25Q80A, a 8Mb SPI NOR chip.

I would suggest to specify who is using this flash and how did you test it. This
way we will not end up with support for flashes that are not actually used.

> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 6e13bbd1aaa5..aa8a04293a25 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1737,6 +1737,8 @@ static const struct flash_info spi_nor_ids[] = {
>  	/* EON -- en25xxx */
>  	{ "en25f32",    INFO(0x1c3116, 0, 64 * 1024,   64, SECT_4K) },
>  	{ "en25p32",    INFO(0x1c2016, 0, 64 * 1024,   64, 0) },
> +	{ "en25q80a",   INFO(0x1c3014, 0, 64 * 1024,   16,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

I'm reading EN25Q80A Rev. H, Issue Date: 2012/10/23
 datasheet. I don't see the bfpt table described, so probably it doesn't support
it. The flash advertises SPINOR_OP_READ_1_4_4 (0xeb), but not
SPINOR_OP_READ_1_1_4 (0x6b). In spi_nor_init_params(), when SPI_NOR_QUAD_READ is
set, we assume that SNOR_HWCAPS_READ_1_1_4 is supported, so we will use 0x6b for
quad reads. I can't see how the flash works with 0x6b, unless there is a bfpt
table that indicates support for 0xebh.

If it does support bfpt, set just SECT_4K | SPI_NOR_DUAL_READ, the latter will
trigger the bfpt parsing.

If you will resubmit, please order the entry in alphabetical order, by name.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
