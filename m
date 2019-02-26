Return-Path: <SRS0=THda=RB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C303BC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 10:18:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9052E20684
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 10:18:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SGQJGld9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="eeSvkVYI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9052E20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbDk8f4YM4RhG67c6kTx0vxpWNHydIJZ//DLL4crqxw=; b=SGQJGld9SEvood
	2elaQuquXKflwskTtPfJFNVsF931EjNKpsbIR2jYVaWheIQQsfpKRwgOfKlW3fPBNLcTBKkFqCR7p
	6PK135EZ6Y0lHVIpp411xUDSHJsLkQxq6FJ5O3wancQZqFqMA+Kgi+Sr2fZCi/5UE4s782/3jt8z6
	sK3M6gVKbIR5UbQUq8Za/glwDSbs3EeJGcIXNwyJVE0YUrL6V+K7esTLCNRoHSPXMGY7GHe8npa29
	I8XR/TH5Q5iYOZG+HUYAckh8fD0r5/NEQlONZn5BANCvyskbeUQ0cAvAK6kmWY3lgCsEQuuiU/nzF
	2Q+U7dEjyTk+tLfjfYqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyZpB-0006RM-1E; Tue, 26 Feb 2019 10:18:57 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyZp7-0006Qx-QR
 for linux-mtd@lists.infradead.org; Tue, 26 Feb 2019 10:18:55 +0000
X-IronPort-AV: E=Sophos;i="5.58,415,1544511600"; d="scan'208";a="28322782"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 26 Feb 2019 03:18:45 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.38) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Tue, 26 Feb 2019 03:18:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+dL9ctE4CnijZEjZJPaec+bt8uVrsHN/gescThJqNw=;
 b=eeSvkVYI64lyFroxh1kqvkodoRG63499zDN8C9SKuXMbaSnTK6nHvHmSK6LJsRapgmKSO3z6ikmlC8pT3FeeFvasJwLFs86EGEB7sXWDWT/MP9hlBSVPgrh+Nsf/2szpv2DYTHABIwKZ3YfSLsbXHw2B7H4plT9kG+RPlgoDn0I=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1795.namprd11.prod.outlook.com (10.175.98.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.20; Tue, 26 Feb 2019 10:18:43 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%9]) with mapi id 15.20.1643.019; Tue, 26 Feb 2019
 10:18:43 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <js07.lee@gmail.com>
Subject: Re: [PATCH 1/2 v2] mtd: spi-nor: add 4bit block protection support
Thread-Topic: [PATCH 1/2 v2] mtd: spi-nor: add 4bit block protection support
Thread-Index: AQHUkgiEAn16PhIw5ES2zrfezL5nD6XyVS4A
Date: Tue, 26 Feb 2019 10:18:43 +0000
Message-ID: <e4c27526-116e-0a1a-4d03-ecfb0f4333e2@microchip.com>
References: <CGME20181212102523eucas1p16be703ce8b995b9a5d490b31d0496ecc@eucas1p1.samsung.com>
 <20181212102515.7296-1-js07.lee@samsung.com>
In-Reply-To: <20181212102515.7296-1-js07.lee@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0300.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::24) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06bc2de6-83cd-4d38-b1df-08d69bd3c906
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1795; 
x-ms-traffictypediagnostic: BN6PR11MB1795:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUIxNzk1OzIzOjFXcEFHV2VaYytZUDB4V2hYVFUzaUkwUjVp?=
 =?utf-8?B?SWRmcjBXK2N5NXhVd0xsYURhWjE4UGhkOURORk9SaGpEb3dnQmZTRkVlakJ0?=
 =?utf-8?B?QTRJRHg3WGNsTDVMcG5tVzgzbVN4dzd4VTRTZnJkQ1dqbVdQODd6YzY5RjFK?=
 =?utf-8?B?c3dwbGZmbE1CQmJZZFpkeHIrWFZqOEg0TjdOaUU3cVgzcjRsWXlIU2kxT0F3?=
 =?utf-8?B?Sm1pS050aXNJSEdNclVuZVoxSnIxcklITk5BTEpkdGJsYkZWZ1luRzBEL1Fn?=
 =?utf-8?B?cThpeUMyeXlTS2g5ajVwWEd4ZTJjV0JNWnkrUVZqNk92eVo2TW1QUHZhM2FV?=
 =?utf-8?B?aUFVTUdFdWdKVVRUalFLbGU0amJibG1YZHcvS0JCVTZDaVhoNzViNWJzWWFX?=
 =?utf-8?B?d1JYbk5KZE8xTW5GQi9WQWljenQycTJXakJ4cmdCVlhOZFlUeGFPUEpOc0xw?=
 =?utf-8?B?UkI1TFJLcVd0cUxIbWlGTUtHeXQ0cWJpYkF5Q2ZlZmdTYTRFSDJ3NFJDei90?=
 =?utf-8?B?Vk55RDJQWitZRXp0RVFBTWJoVzBDaUQ4Y3BabHBnUUE5Mnh5Y1RnTVBrVEEy?=
 =?utf-8?B?N0JkOWtBWWxXbm5LWWFnU0dHMFV5TkJuWStSMmNCUWtsazRNY3daNTF2eDYy?=
 =?utf-8?B?eUx3b3R4cUNjbWdwTW5wdWl2TE5CbUxnbUpJMmoxSTFqclNUdTJqM096MU5L?=
 =?utf-8?B?QUN0MWtWQkp4TW9ia2xEWllETUhwODVjNDhjYWl4eTdKcGdBalh4YWdpUi9P?=
 =?utf-8?B?VDhOYitZYnBxWVZnSFZhd3djeVdiVmE0OWJIVmlESitPdWIwUXZxM29iZ2dG?=
 =?utf-8?B?Szc2aVJmYmVwV1dCbHFKVkwvR3BEbjdRaldKMStnY1F6cG02bjQ4VjV5bW9y?=
 =?utf-8?B?VEZ0eW1lalZZeC94MUg1UEZYY2haN1YvQi9FRTJRcFJyelNLNzhTa1g1cU8z?=
 =?utf-8?B?aG40Um9iMzNjWnVGQnkxZTladmRTTjgrQ25SRVdIT3VjNDBxQlJPQVNVTlZO?=
 =?utf-8?B?dDRZMWpDaDNrMlNHY1l2bTlRbzVHbFBqUXBUZktHSUpldXJKdDZPbWtFb2ZG?=
 =?utf-8?B?K0hjYzM3V1dkNXZjTnV5Q3kzNERtSzZrN3laVEpKV1ZrYzhCNk55MjdjVFYw?=
 =?utf-8?B?aUwyMnR2aTVTT05KaE9ycWxxdWNUcmkrc0dhbnFiend6aGtQTmV2bEZSdFlL?=
 =?utf-8?B?cTFrMnArMUNHbDJKN2tjUjVpSFVCbWVINlZWQ2hiSERqSFlJMnppMTY5N1Yw?=
 =?utf-8?B?TTJVdnlwN1pEVm5rWGtLcXRvaHdadk9PTjdnT3A4TzlmMVVzSGcwRHF0UDdq?=
 =?utf-8?B?dlhoMGw5UG9PTDdDWlVRUCtja0w1cCtEZmlxaUlOaFpCSDRZdmdDNkExV2hi?=
 =?utf-8?B?aWpaT3RFUE5vQlh1bnJlQkdaTnZUQmpmU0Ftc3ZhVkNWSTFYKzc4azJsT0xW?=
 =?utf-8?B?U3Y3cFVmSmt3bEgyRWc5L1hlbmVQSnNjVU02YWgyOWdGYmJkNm1vYkJDRFlY?=
 =?utf-8?B?V01DQ2xZc3JmMFdtWGcwUzVMcWZlT1lEK3VDMkNKWEtZYnl3aGFTRllPTEl5?=
 =?utf-8?B?THJpb0F3Z1J1ME5aME41NC9Vd3JVZXRtZkZIVlgrbFgxaVNlNnV2TGxPUnZi?=
 =?utf-8?B?amdWZlVoNkhicDU3aDN5NkhONktnUU1LYm4yMFJUVThibWpQQUp1SWM4eVlD?=
 =?utf-8?B?QVpEbTlENmhLallnSkd3R1FMMVBLcS9kZUh4YmJaR0xDQ0NabmhWclFoR29v?=
 =?utf-8?B?cU9QRXB1b0N3SmdZYnMrQXZJVU1CbWM4Tm5zWGFvQ3M1dy9nVHVIclhrNjJo?=
 =?utf-8?B?dmhFcUtuM2Z3aXdIOVAxWWg2VThENk9IK21mWkE1bkVwd1E9PQ==?=
x-microsoft-antispam-prvs: <BN6PR11MB1795782B2694B3272340237BF07B0@BN6PR11MB1795.namprd11.prod.outlook.com>
x-forefront-prvs: 096029FF66
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(376002)(396003)(366004)(136003)(54534003)(189003)(199004)(97736004)(386003)(105586002)(106356001)(186003)(31686004)(2616005)(110136005)(2201001)(11346002)(476003)(446003)(76176011)(8936002)(71200400001)(4326008)(53546011)(6506007)(52116002)(86362001)(99286004)(102836004)(14444005)(71190400001)(316002)(31696002)(256004)(68736007)(6246003)(26005)(2501003)(81156014)(229853002)(6486002)(6512007)(3846002)(14454004)(36756003)(53936002)(478600001)(486006)(72206003)(5660300002)(6116002)(6436002)(2906002)(66066001)(8676002)(25786009)(7736002)(305945005)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1795;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +SRM+V3qyaR0B/HMBOmuvY+Gb9EGFhyEjGu0qgOjk2vg7kGKjVVLIl1L/DWJgEzntlg/UfQjenoPn65CCEwqupoyp12+pEkL/Mkmisl+VtPICkNNcMeQkvoC0i67LfGBbBBGaLohhV3+X2fiu06rNO5ABMK9/08cG6jlwq1E4I7uWvYtPve5Is+/kHqH9hLvmza7ZUEJWD73UPqYlQ4b0TQKevCZ8bQd1v7bRf6+NLmnQIN1sVDRdVMCe4m2TcoIEdL7oEYF1SIBnrcn8c/5KOqPXRYZzzgg2Iz4Sy+iELHQLI0dJYFjaawz2+T2cHK9P94H2+/cztgCOQoxOYmnyVf4ZKMoP3un9kST3dq+sqGLIWwaixGyRmrgqWKIZxCSBJNPtjybsitFWRlbADrK1DfuRXRSOcGkMLcgBjT+oU0=
Content-ID: <0C98C56FD2D1174DAE7D4BD32176F46F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bc2de6-83cd-4d38-b1df-08d69bd3c906
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2019 10:18:41.7475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1795
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_021854_017188_BEDA3780 
X-CRM114-Status: GOOD (  24.35  )
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
Cc: u.kleine-koenig@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+Uwe, he showed interest in this.

Hi, Jungseung,

On 12/12/2018 12:25 PM, Jungseung Lee wrote:
> Currently, we are supporting block protection only for
> flash chips with 3 block protection bits in the SR register.
> This patch enables block protection support for some flash with
> 4 block protection bits (bp0-3).
> 
> Because this feature is not universal to all flash that support
> lock/unlock, control it via a new flag.
> 
> Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> ---
> ChangeLog v1->v2:
> - Rebase on latest MTD development branch
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 61 ++++++++++++++++++++++++++++++-----
>  include/linux/mtd/spi-nor.h   |  4 +++
>  2 files changed, 57 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 6e13bbd1aaa5..c33b72eeae12 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -96,6 +96,7 @@ enum spi_nor_pp_command_index {
>  struct spi_nor_flash_parameter {
>  	u64				size;
>  	u32				page_size;
> +	u16				n_sectors;
>  
>  	struct spi_nor_hwcaps		hwcaps;
>  	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
> @@ -278,6 +279,7 @@ struct flash_info {
>  #define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
>  #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
>  #define USE_CLSR		BIT(14)	/* use CLSR command */
> +#define SPI_NOR_HAS_BP3		BIT(15)	/* use 4 bits field for block protect */
>  
>  	/* Part specific fixup hooks. */
>  	const struct spi_nor_fixups *fixups;
> @@ -1087,18 +1089,36 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
>  	int shift = ffs(mask) - 1;
>  	int pow;
>  
> +	if (nor->flags & SNOR_F_HAS_SR_BP3)
> +		mask |= SR_BP3;

I asked myself if the shift variable is still conclusive after updating the
mask. I assume we can add a macro for it, to skip this kind of questions.
> +
>  	if (!(sr & mask)) {
>  		/* No protection */
>  		*ofs = 0;
>  		*len = 0;
> +		return;
> +	}
> +
> +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> +		u8 temp = sr & mask;
> +
> +		if (temp & SR_BP3)
> +			temp = (temp & ~SR_BP3) | BIT(5);

N25Q512A defines SR_BP3 at BIT(6) indeed, but W25M512JV defines it directly at
BIT(5) and moves the TB definition at BIT(6). We will need to know how the large
majority of manufacturers are implementing BP3, and based on that to decide how
we will implement the "generic" BP3 support. I would look at spi_nor_ids[],
check which manufacturers have flashes that set SPI_NOR_HAS_LOCK and I would
look at those manufacturers for newer flashes that might have BP3 support. Would
you please make this study and tell us your findings?

> +
> +		pow = ilog2(nor->n_sectors) + 1 - (temp >> shift);
> +		if (pow > 0)
> +			*len = mtd->size >> pow;
> +		else
> +			*len = mtd->size;

having negative values for pow is not so intuitive. Use Brian's way of computing
pow, and it will result in nicer code: pow = ((sr & mask) ^ mask) >> shift;

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
