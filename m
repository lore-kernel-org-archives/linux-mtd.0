Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBFEC169C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 08:50:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E0FC20823
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 08:50:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="anq20epJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="mK7YfvIr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E0FC20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HG+JO7ttecgtVJuHS9BcnMh8Hp/RbUz7QPX7Qxk88RA=; b=anq20epJH77xnW
	9Ms+Et5B6Hmf/1h5wYNrg1SepW3Cck64GdvKtTnpvAXKyCeu5+VBNd2f8oTZDQHnqw6YYkRxKut05
	hsG89eaRE1nysprPWZm7XbC6cFi1sfXd/1woGhDISrUpycGpUBfv6x8ycsqB/afjyXuomMMGj9qym
	p67tSVA5Ee4QIwhPWj7yHmiqUD3pxhjP/gsi+uBbcgZ4gbVt6EI4BRjn/xt08gt/yhHCWsSf9pBIG
	CcI6BJ97qrMYg2lh8sBQhCd1WUMjSx69zOV0YgUb/A07uOikrw4KWSO9rY0AvbUQ28Nf0IQfHDlf0
	id6lDuVEkZuEFtVUddcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt7IV-00057p-5i; Mon, 11 Feb 2019 08:50:39 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt7IS-000571-Dl
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 08:50:37 +0000
X-IronPort-AV: E=Sophos;i="5.58,358,1544511600"; d="scan'208";a="23662875"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 11 Feb 2019 01:50:33 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.106) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Mon, 11 Feb 2019 01:50:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBwRBuQUUOm8ZcfVXDtKXs42jcsewZ1trHNcitlHg/g=;
 b=mK7YfvIr+Px9YCNUZLdhBO9x7NTLSp67RtexQGIYLKWCuRwmDn3y4dtkLLFJ2zWmuHyhnipexBAv9tQ08G4/kFHgPurYe6SHQbNZ9lrqw2vzqZW6BGkpLoWL/WEc4XqNDYNIxAuQHot4K6TX7/Omw2UIvNyF8+KEIN0EhUepDmw=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB2036.namprd11.prod.outlook.com (10.173.33.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.22; Mon, 11 Feb 2019 08:50:30 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1601.023; Mon, 11 Feb 2019
 08:50:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <beanhuo@micron.com>, <linux-mtd@lists.infradead.org>,
 <bbrezillon@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v2] mtd: spi-nor: Fix wrong abbreviation HWCPAS
Thread-Topic: [RESEND PATCH v2] mtd: spi-nor: Fix wrong abbreviation HWCPAS
Thread-Index: AdS/3OnQZjj8XegeT+KSU6BShrHJ9QCCejAA
Date: Mon, 11 Feb 2019 08:50:30 +0000
Message-ID: <3ac5ab46-bacc-12ec-82e6-728663057f79@microchip.com>
References: <BYAPR08MB4533F6B01EF90FC66BFB5C87DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
In-Reply-To: <BYAPR08MB4533F6B01EF90FC66BFB5C87DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P194CA0002.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:be::12) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB2036;
 6:AOgg1XTs0q8Po6ZFy90QSxeGvbHk2faTw7UXrRMWjfsTPcQW9SV7nfwv4KNQcsC4IIFNmZwy2PM2Kcq+dpU76GDw5Lzh/pKBcxJ+mX6FkMF7Nh9TYVNFW8GMZgrp/lq1HUXsY+39KVAZuGsiM0yV3XYyAAC6V4nsdBrIWy5ZV8O7bKO6HaQUvourejXyAFzPcVwn21bK/QUmzoXw7uZt+qhT7yF9ws+dspxSx3NgEmmL+f2LKjuoI3asCPeXmKRmcqAzrm8l4b42CpfIYD5Em2CzpGo7HLa0U2h56oGwgQctbLmI2PVolMKxD1mNB/zzBXsAZ5FwcclT9ZLkFHd0hHNPMbkKOiV0TcWCklBQm4Q6ZoIbU6Ix8ag4BvUJm/i67flZmObB5tpHvHMXk4DHEvIs6GfTlVEu6da+P+APY1QFmJYf96ZNjlcMk7dUO0ec2moYblCeJ5ywohSWzu0jLw==;
 5:dLjsdXIt3MDF8J5csBGF8e5E/EureUdisnPO4NXfl4Do1W6qTQy0fMIw/XQWVpiUkx+JwGwIFHvsXTsmSCX8cs6uoRRBaOdodp01QZhPkJMDoQ5ADgklsgn0KkCyXc5pGBnpdJblLZCaHBEB/zO1FFtKPm4d9dsv7DbRB7cKdTbXLT6l5CFwM+n4j8wOQnCQGbCLqQhGrG69Mf70AyO+sQ==;
 7:kr3+u99NaQO5S6ly/K6eM2WlMLnwDr8DxoiZC970N8FcKXg7037hYuoUwiHs4RlZaRMn7xnVNoNiNlk0VUOTWsm/B79OqNCxIaN7x0RITZ54vIiuY0jj9eqQnYDiiHeVc/GJKWzLQSHUutf4jnjrvA==
x-ms-office365-filtering-correlation-id: 8437c669-6aa7-43fb-7017-08d68ffdf9a5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB2036; 
x-ms-traffictypediagnostic: BN6PR11MB2036:
x-microsoft-antispam-prvs: <BN6PR11MB203651B1A81A311C443288C5F0640@BN6PR11MB2036.namprd11.prod.outlook.com>
x-forefront-prvs: 0945B0CC72
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(366004)(376002)(346002)(136003)(199004)(189003)(72206003)(76176011)(31686004)(7736002)(305945005)(106356001)(105586002)(8936002)(86362001)(2201001)(110136005)(2906002)(6116002)(3846002)(31696002)(53936002)(4744005)(36756003)(71190400001)(71200400001)(66066001)(316002)(229853002)(14454004)(97736004)(99286004)(6436002)(217873002)(186003)(68736007)(6246003)(6346003)(14444005)(52116002)(478600001)(486006)(25786009)(6512007)(2501003)(53546011)(81156014)(81166006)(8676002)(26005)(446003)(386003)(6506007)(102836004)(256004)(6486002)(476003)(2616005)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB2036;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RMid/MmhCbWvxzgCJyhJV20LUu995KOT/wMZykWDldh5rsyCg00YW/bSFcSKEaQRS32UiJ1bLukiPIM4QQ75CJGjrgBIt7KTu60Fd4sWT/+OawAU1ddqhftUERart08iSIzrGa8CQKO7rw3VM+7juYIPDhh3Gs98s1dDH8ikUBJmYfASX0smyzLbXMShxmjsnsS7EP1G7mqV1U59QJLfRG3LfZHtjLT4jDhrchQPBKAuyHTEenCw8RFZT1sjZGo2+KCzL57FBRbldk6Etp2aG6jF2oJuPrcAbM1bPNu90cZDMSd7KN6dJ3EhMeeLLzNjM3oM22g5rnCtxa0dlK6n+OUaWkn5lmSuR5UDuOR/CDSEVnyx31HTcSRFbQzVUvKTUrKEzfQoC9EZv0O3jSpIv/16vZ5uApwP8yifRD3S1q0=
Content-ID: <DD4492E5C185984D8C091E30EDD54752@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8437c669-6aa7-43fb-7017-08d68ffdf9a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2019 08:50:28.8413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2036
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_005036_500618_01F5372D 
X-CRM114-Status: GOOD (  11.69  )
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



On 02/08/2019 08:34 PM, Bean Huo (beanhuo) wrote:
> From: Bean Huo <beanhuo@micron.com>
> 
> Change SNOR_HWCPAS_READ_OCTAL to SNOR_HWCAPS_READ_OCTAL.
> 
> Signed-off-by: Bean Huo <beanhuo@micron.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  include/linux/mtd/spi-nor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h index 2353af8..b3d360b 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -487,7 +487,7 @@ struct spi_nor_hwcaps {
>  #define SNOR_HWCAPS_READ_4_4_4		BIT(9)
>  #define SNOR_HWCAPS_READ_1_4_4_DTR	BIT(10)
>  
> -#define SNOR_HWCPAS_READ_OCTAL		GENMASK(14, 11)
> +#define SNOR_HWCAPS_READ_OCTAL		GENMASK(14, 11)
>  #define SNOR_HWCAPS_READ_1_1_8		BIT(11)
>  #define SNOR_HWCAPS_READ_1_8_8		BIT(12)
>  #define SNOR_HWCAPS_READ_8_8_8		BIT(13)
> --
> 2.7.4
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
