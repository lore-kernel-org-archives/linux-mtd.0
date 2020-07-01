Return-Path: <SRS0=6ot8=AM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED84C433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 08:42:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD4A20747
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 08:42:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vz8TCRVO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="cn2RhXcw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="JI+M2fWA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BD4A20747
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qw0cnWyqdp9Y3cMDFKo8mn/0fsX/M0ORQQe6a7W0poU=; b=vz8TCRVOiQEupMUqec7VJ0kLm
	1PHNbX0Syvb5+NP7tUFCwUG1Mbtyvoqaz6z6PcT+tWGFm6MxNzpPK7celMo6PGp4I0WxVsV9NFOrW
	qlODie/CDewdkjSSO2JReoMNR/FytLZh3Z3PAo4PgpxMKx9Mlsod3lCyub+NMafJBsglwQQF+3/SO
	Kfd5IRSe9BLztxGXh1FMCvQr9+npmEculVEKBM1k9KEL+FJjXft41NWiyS7RmM9r26qMjYfAwesJ4
	143+xLcJi2NjsCkw9yGUQCWZaZi7jjIFF/j73IVQalYMqDB6b88I5f5cFKYjUXtby+RjlqzxoH/Ss
	EBJbYLM8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqYJg-0002Up-FO; Wed, 01 Jul 2020 08:42:04 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqYJc-0002Qq-W0
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2020 08:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593592921; x=1625128921;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=euoqUb6UiQUAU86ug0tGvfzv+zbwA1reQrNl9BEUGR0=;
 b=cn2RhXcwtu4cO+zfsNjNtKjdKcyM0OL2BfgNj5ymLoQb8nsDy0UWgYnm
 oasSWYs15hb1f/keZIeOL8slXZhWweStcdfxyj55Z3EKFuFadqDCqUvRw
 +tVPakTqEfN8ScQq4rV3JntD0VULw4TgwsMW4CXEVqQrw/kIDx0g4vbfH
 UFxJnOLdcy46rdMrjfcEG85a28Djg0ANarUrmBwKIDZMLnXu4OCaO0AA9
 VpXRi+hvLk87Um6OrgpN5DwPEAh/xWbZp6S9hbMEn9C+jKcJ7C7E2nJ0L
 DDT50hCyz/4xmGmXa3FyDUr89oyrMYQSjJZfzyPEGJ7QjXiIDok1UrGYW g==;
IronPort-SDR: Ujko8Zk0rhuQHx5xLlTMlExaONsiTnMtitHOQl3tFNBoEf5YTHVS+af6htJlAZK0ak+G8RlrSz
 xgmHu6PWAAMilx/MBhX8hfp8i63OLiLCkdjw/KvAYueR3pftg7iE4ef0GIs2weFVN2y1riKq7O
 /18MDAz27qmZuWbGpLXUCNIpr3racSgLWlp611geLY1tclL0E+XWFzAqEMXMkCr3Q6/iK13FD+
 z7gaRcdPM6Q3hcTbOxqnGExjUnPwPh5Yvi3CpXp43d/dYANJB61gb6cXDxa1ICTJA5FWQKEaFj
 TOE=
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="80323258"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Jul 2020 01:41:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 1 Jul 2020 01:41:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 1 Jul 2020 01:41:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnpN9BbHnRxhsmhCKDGlDHNAWawR0UGOG5p48HjGtuPJz8ezDuIzQ4r9nbjL49sToEAKAPw88og9T6R4Ev/ZGkoiul4NrjjXuJpD5wgf2HI8eHxGj5NN9uoL05SF6IkbNJ7OYH0l38/28r6w8W0PVV3ygGuTa/WrE1DhNYJY25yfRruThG8vIcZzYwAEDeTy/OByMC3Al+xpjD4Ic4n0zxyINNDO8vlZSR/rrGFHQiy7lTuEx+U998KBWCiy2INAXEZqukY2J08e3JT4N2jqmzYPO+5DduzGFjGWqE8cybY9sn/uB6PaAVuHN4J53de1nSyQ8iAnCNuwBDghnkLkZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euoqUb6UiQUAU86ug0tGvfzv+zbwA1reQrNl9BEUGR0=;
 b=ibv8fLJAPIosMKys1YdL+X+rLxzae6rf79DN+MAJmpiWs/XsSIZxlYzpNYbotpnSLGvJsfCSwyR8HBYmqqmASKZOaayPZEJANMNMSPIkbxRGcBkzxnDBnPKYygU9SHHl2coQUP1tA8v9xnGFGr+CBexSAwOaxwQmURZSqb+3grVKc/9AevgqSLudU2ZYbfq4tAI6nrQHgJb3yMIqHOKbTswNnaj3yZInsJKRtOprBYp0fv1swal8LlOUl5u05Eq5NL/LD3vHVbo47jPfe7dDgk0DgggElfcN4YM7GP9StDYL6uu+ifWTqCSlf51R1DiHP5BX6aNBiWMj36F+yjHRjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euoqUb6UiQUAU86ug0tGvfzv+zbwA1reQrNl9BEUGR0=;
 b=JI+M2fWAKf1pO41r9M+pOLiMiqMo+I0e/68EfFpzWiSfJIApSL9yHXzgoIjp/D2efI6czQ6euYHJCzF0Sgv9gYwxHn2hmgACl95f0AGH0P8s+QvxYhiUCNmhJKROuQUgq4mCZmG+G3jghK1qN4TnOlN11gVR9wB2Z/W/v3XkIHI=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3799.namprd11.prod.outlook.com (2603:10b6:a03:fb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 1 Jul
 2020 08:41:52 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3131.027; Wed, 1 Jul 2020
 08:41:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <wuxy@bitland.com.cn>, <miquel.raynal@bootlin.com>,
 <linux-kernel@vger.kernel.org>, <drinkcat@chromium.org>,
 <linux-mtd@lists.infradead.org>, <stlin2@winbond.com>, <vigneshr@ti.com>
Subject: Re: [PATCH] [v3]mtd: spi-nor: winbond: add 1.8v SPI NOR Flash IDs
Thread-Topic: [PATCH] [v3]mtd: spi-nor: winbond: add 1.8v SPI NOR Flash IDs
Thread-Index: AQHWT4N3W/OUOumSFUWYBQmrBfACaQ==
Date: Wed, 1 Jul 2020 08:41:52 +0000
Message-ID: <172b3f0b-9341-7f44-b855-1c353e321e2d@microchip.com>
References: <20200528033600.26105-1-wuxy@bitland.com.cn>
In-Reply-To: <20200528033600.26105-1-wuxy@bitland.com.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: bitland.com.cn; dkim=none (message not signed)
 header.d=none;bitland.com.cn; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 459e0a65-5489-4861-e797-08d81d9a9a64
x-ms-traffictypediagnostic: BYAPR11MB3799:
x-microsoft-antispam-prvs: <BYAPR11MB37998B3C0FB6881FDDA4209BF06C0@BYAPR11MB3799.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4ZoqvkPWC974lFnhxgR4SenA7NQGpfcj5c5C2TF5a0J8QD5Hu7CG8R7373XV/f3ORQ67/I4IZgUtS/ZNul/LWnNhfLxs0iltAJQc9ZiLNpjpc2xRnnO4TuilDB7kBc/IruS1RLa8PC3GO4OHhuq2ZOwR6t3TbUPfjzcM5pJM6EUkSmpvGfxhlbM6z0L6n8026sOJ4OMiwl9Oo7GHa3+ZvbTwgll2ddmYB1+XNyojv09KBw4r8Y0liv1qag0YyVSbb51Ll3EwpM7mF+ZSHJYJsOhTikG7V+m8QTcyHDAA2DSiUNGe0tvFqb7dTohFFOne9BMMBb0WC7ms89F+deTnopAjbnxaJO0oSgnnxaQn2jCDMmYpXjkk50X2TTFEGsHqBwBg6hJkA6aFVUAn3Ba9WOqaZ3wd4C20xqg4I2QFrGTTUduxMG8SVdEUYSjB76XEzrMZacpNPOH+K2QYbzl55w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(396003)(39860400002)(376002)(346002)(31696002)(66556008)(6512007)(91956017)(86362001)(83380400001)(186003)(2616005)(5660300002)(71200400001)(4326008)(26005)(2906002)(6486002)(316002)(8676002)(478600001)(31686004)(110136005)(6506007)(36756003)(66476007)(66446008)(76116006)(53546011)(64756008)(8936002)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: BRCln6OC/X5G8yiB0R61gzPw1abyR2cl7QcPwNHUbubdklrG1XKOpvy8k3uRFNyADuR8dyli1muosokK4SHuvK7/EO8iA4CXvlE2Szy9uaWjthNBeaUI2SLPSLNRb8PRRal9cWG+QsE3bmku/mprKCzYES5Uzc/Vei66G5i3sMwzeiuFtxF6bnCOMHrbJSIs0+Ssg+2U4zltYvO2qRrq6vVE4LMKsq0K0p6lpbOyeGQYsMlelBtfRLY4a1m5D72xBMNfWuV0vMalTbbCmMwb6iBRtuGbotPYYlNBJS7qvEtq4FBmMWHdR8TtIeHLc5no2WQ2V56R5oformx5Op2WEpRKa/01a2q1+aWeka4vMixbHHcMn/kCJy7v07nNhzmiD2vXyXjOBGEE+b7AoHianHZap2FaEErHkDuGqKEm+aVGBWaiW5M0ALqcZmq60nC1dxCSHcyJPTKR2BxjGDgJnEUj06525D1Uuc8CNOw5mMQ=
x-ms-exchange-transport-forked: True
Content-ID: <B3E292EBA091654B8317AF18A9AADA52@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459e0a65-5489-4861-e797-08d81d9a9a64
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 08:41:52.3399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /lzuSlDl2M2QaTZJJ16c3la3+321QHj0Mwrzk6zywlaEyNxCuUN5l4LIXchL/otx+EsT5oGnk00SVEDva6C/fxCmxnvhezD55sz6xKHicKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3799
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_044201_191129_F9EECBFB 
X-CRM114-Status: GOOD (  20.74  )
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
Cc: wuxy@bitland.corp-partner.google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 5/28/20 6:36 AM, wuxy@bitland.com.cn wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: wuxy <wuxy@bitland.corp-partner.google.com>
> 
> Winbond has new 1.8V SPI NOR Flash IDs,we need to use the SPI
> flash IDs in kukui series,this patch can support the new flash IDs.

Which flashes were tested?

One should do a read, dump the content, erase, dump content to check that
erase was fine, write a random generated file, read back and compare.

I see that you added the locking flags too. Were the locking ops tested?

We don't add flashes or caps that are not tested, please specify in the
commit message what was tested.

> 
> Signed-off-by: Xingyu Wu <wuxy@bitland.corp-partner.google.com>
> Signed-off-by: ST Lin <stlin2@winbond.com>
> Test-by: Nicolas Boichat <drinkcat@chromium.org>
> 
> ---
> This patch copied from:https://patchwork.ozlabs.org/patch/1150756/,
> The original patch is invalid,so re-submit a new patch for this.
>  drivers/mtd/spi-nor/winbond.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 17deabad57e1..cda4f8847bd6 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -61,6 +61,15 @@ static const struct flash_info winbond_parts[] = {
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>                             SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
> +       { "w25q64jwxxIM", INFO(0xef8017, 0, 64 * 1024, 128,

We don't really care about the Package Type, it does not change the flash
caps, we can drop "xx" from the name. Also, the manufacturer can introduce
new flashes with different temperature ranges without changing the
flash caps, so we should drop the "I" from the name too.

The flash name would become w25q64jwm

> +                           SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                           SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> +       { "w25q128jwxxIM", INFO(0xef8018, 0, 64 * 1024, 256,

w25q128jwm

> +                           SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                           SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> +       { "w25q256jwxxIM", INFO(0xef8019, 0, 64 * 1024, 512,

w25q256jwm

> +                           SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                           SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },

w25q256jwm has 4 block protection bits, locking was not tested for this flash.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
