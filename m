Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1131C3A589
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 15:25:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F8A120578
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 15:25:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OQPm/upn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="XVpBTmb8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F8A120578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/STpSZBwoKOXSHBy3TeOEcY8ADDesNRyk8DSYc447M=; b=OQPm/upnl2DyjV
	HTVdvDUDhl4ABH2x/+l7tlXsH4HqJEYlzJxIVJe8l/ZZj87h5o6J0bq/0KFyNCJ9E3iKnKOr9qdkw
	Qe0gw1gzYnMHJVgEwo0pIndCY14rb7NkkTxVgdp5DhPABxCEoDmXw0fCEZCpwsLoP5/9cyMzytQ5z
	ppytnzGL+OxlwBdhwX/KH6uf80fgt0n6yft/tP0XyuvEzhUaNS/ZuSq24gXA2qBtwvJQAZrtqmeVB
	6DCGr2fa142IZ+SnS/9sa5ESltTCY1q+aCTtfgjxYyAKPFjUhaJVlHqKK5OB3N/V3/Fku4xgy/OaH
	eSqH/i1qSwC8YifaQqDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i060E-0003CN-HN; Tue, 20 Aug 2019 15:24:54 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i05zz-0002qG-Sl
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2019 15:24:41 +0000
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
IronPort-SDR: WZkB+0FxIjBTNoVRTwTZu02Vfj79r+XtRRUYPt+82wOfuzndIGS6uEbJOsP9MDxV5IIoQ7+Bub
 5oAKj+SCx0Tw2w/hwWg/VDs71/B4hnshNSrd/++/OXQqenkqYK/bqKj78hz8oZKare0uLzojTI
 jL0XDMewDwHCtspKAc5w5tG5/DmB/d3x1moQ5YKzo44khPfX1FCxl27IzwwqzLkTmnluzkT1Wk
 vM2N+nz/vWVdbsL3zA8YckA21jAtmgO9cVrj2hcxWLuatquYTfEjp5+TwX4s2wpg/yjHpRf9Yk
 EUA=
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="44953261"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Aug 2019 08:24:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Aug 2019 08:24:37 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 20 Aug 2019 08:24:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RisKZVIgjfQUzAZT46s/aXejH1YhCRgFbDTj71hVx+aw/jRqNtSbvDooU0gOQgYVFx7ix1BC0Hk8+lz4lCxV9ijU8bm0mVs0Ng4rW51UXPH5JMwrcQNSGpCQvVhzhxHbot/sdeAGbm3967UL1ZKxpGn9YPRstHwyiPEBZDF9LJilhJH7Ttw4RrEXjxGYozSaZvHGOi6CmcOq5vweaoOiZAqb2jVXfE9PyQ4O0SvQgUkBNBZPIUQam5MD99bOsdsd2QN6x4sEVLoDCLeJlGcV97w0chn2Mf+Lut2niyweSqhwv5dldDThj5QRkjgHSwJ/RsvsGjtguvQVjKtlcdCKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5ppeXnSg5Yf18Er0B7NuLKG6eaGlCMmN2Rt0AkupxI=;
 b=KLvGCw6xhuS+5i6tP2HEvaFuP9XPKtFT+pv32ZIGxcj6TT8nD47UjuM/EtCNOAICgdBRlCmM+na7n7U66oOIOUrn7pF9I+pxiucdkbCvWWdnhQVU7aCXR/Kr3B3Gimt4y7qfGDwTCZ1O7/ig+YV/2BMyNt3cO129Do4qDk7uXiULg+4cpLcN/7jkF1L7H28ion97/K4y8kvxp0U0VQO46WvxG/99Mt2dyFCGaY+clv3tZA9H3c4mw/1ygQ+Mm/MXSa79mpFQNRedWYLU3Ag8ItYgGuC1t7xpy7T7GzodP/Eba6GudJ472nU+N9YIkRptOZEOCMGqAvU22jK3ZpyRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5ppeXnSg5Yf18Er0B7NuLKG6eaGlCMmN2Rt0AkupxI=;
 b=XVpBTmb8pEJdGkFRKRtNvZrjImN13mF5gfLGXCj+6IK9qrXXQBZSrQZjlBCdGksvyANcgH0ZJPP2ipyh9cEUi6wVkf3HZiliytj/Fq9ihcavLg7OuDZgYdfjJOPvXSb7dS4c/KlfPxjEh7hU/71DFuZzS1SdMz2tnXrKg9hn9jY=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3808.namprd11.prod.outlook.com (20.178.254.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 15:24:37 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 15:24:37 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>,
 <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] spi-nor: intel-spi: Whitelist 4B read commands
Thread-Topic: [PATCH] spi-nor: intel-spi: Whitelist 4B read commands
Thread-Index: AQHVOKtgwqaYRthXW0GNL3NvkrzY9acEZWOA
Date: Tue, 20 Aug 2019 15:24:37 +0000
Message-ID: <409a9e10-e391-2403-5aff-c2e5a361fdef@microchip.com>
References: <20190712121401.28578-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20190712121401.28578-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::21) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d4ed606-d4b9-4714-f1e1-08d72582834f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR11MB3808; 
x-ms-traffictypediagnostic: MN2PR11MB3808:
x-microsoft-antispam-prvs: <MN2PR11MB380814573F7A5569A4C4D873F0AB0@MN2PR11MB3808.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(189003)(199004)(229853002)(8936002)(81156014)(81166006)(25786009)(14454004)(6436002)(6486002)(6512007)(6246003)(498600001)(53936002)(4326008)(76176011)(52116002)(7736002)(305945005)(2906002)(110136005)(8676002)(99286004)(54906003)(86362001)(36756003)(66066001)(31696002)(256004)(14444005)(3846002)(71190400001)(186003)(31686004)(6116002)(486006)(5660300002)(53546011)(476003)(6506007)(386003)(102836004)(64756008)(66446008)(26005)(66556008)(66476007)(11346002)(2616005)(66946007)(446003)(2501003)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3808;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MbZV42RzFXPNbpVkjh+zkYLsaZJDyX1uCXrlj4gOKWPgzV4HhgpD4mljiEBwZy8AP1Ok0ouHOCBpKWCkBCjLIHmbcZ74/gnCO7P9OfryBKTd59Daw1AeCNhFGKtUGfqu3iscDji+yM0J2muE0SC13ty4wbn04ohU7C6ZUdSYyBT9OfS2EnNg4Ww+GDVHM6ARH8NwHXJ+bENLPf+ReTFOn2vGPJt3ia/CUqu2lI8sRicOZ/AmoqFVI5ZGPHBD+fMdW3vmzZ4naTedUQsUex4RHIa9qST1p1Yy/7x22wL/EtJyOQLqRl0UZ6OeTBk9lWjdTpTIIpodVVF5ka/lyQj4aNKryOqGU7uiUNfiB6jXqCnYYfgcZAvPn5a1S4dHkwlGIyxIkZoras6Ou2mhPZ6vPrq9VXM3b8TNBp5xbhz+SRk=
x-ms-exchange-transport-forked: True
Content-ID: <17E93E83753F8649946E4B893E6C76D7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4ed606-d4b9-4714-f1e1-08d72582834f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 15:24:37.6644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ov2/pjxWWSlxi7d7iFg2lmkbWYBrMScGFDAbHoUfpltHjXVFE5Hg2K6QaWiInTg80o35hCmg7KrHDFuBQFO5D3tBP7YpVnSZ/TlJH5tBk/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3808
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_082439_999235_AF99153A 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: vigneshr@ti.com, richard@nod.at, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Mika,

Would you please review the patch from below?

Thanks,
ta

On 07/12/2019 03:14 PM, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> External E-Mail
> 
> 
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> spi-nor.c issues 4B commands for some Flash chips bigger than 16Mbytes.
> Xeon(R) D-1500 documentation mentions its Integrated PCH Logic supports
> Flash chips up to 64Mbytes.
> D-1500 Integrated PCH documenation however has inconsistencies regarding
> FADDR register width and says nothing about particular commands issued
> to support 64Mbytes of Flash.
> 
> Nevetheless the tests on Xeon(R) CPU D-1548 with 512Mbit Flash chips
> Macronix MX25L51245G and Micron MT25QL512A showed that erase, write and
> read operations work just fine after SPINOR_OP_READ_4B and
> SPINOR_OP_READ_FAST_4B are white-listed (currently only
> SPINOR_OP_READ_FAST_4B is used and only for Macronix).
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/mtd/spi-nor/intel-spi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> index 1ccf23f..43e55a2e 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -621,6 +621,8 @@ static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
>  	switch (nor->read_opcode) {
>  	case SPINOR_OP_READ:
>  	case SPINOR_OP_READ_FAST:
> +	case SPINOR_OP_READ_4B:
> +	case SPINOR_OP_READ_FAST_4B:
>  		break;
>  	default:
>  		return -EINVAL;
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
