Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4A6C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 16:50:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F8D21902
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 16:50:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JxiNDBRa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cVYXCaj9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="KATT5kqF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98F8D21902
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhBaJ5q19+FfZWLKSn1DyqLF9LphJOTLjGBb0XrWscE=; b=JxiNDBRa/2oV9q
	tHiZGIK3Hv7jArRa2tE4bolci4uHD7zojyQu6bdAnKDS6yb+XOe5x8vlgwnTU7wMXjVslGigZj6Gj
	2SW5z2brooKiV3gZeLzb31v6WR3N5QvUiR/NIF2xTaZBkIlMKAZXfn3oCz/oLYp0RurmMW27YprKb
	HpDQNYUlN4Y2ORNiEyNabNSbm1LaWWuB84ibi1xkliT8hSRv+geMqfNacp2Hsyr4EtvzaY8dfi8QB
	LIl7rLdtGt26yDezaHnFJizPAVJ7pMRJ7uWRrnzbYRgLpDigdXNhvoETJLgAti7A5y6N2ZYXvPpRw
	THs6doH4xQFKA7tzVkPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h70tc-0004dX-9J; Thu, 21 Mar 2019 16:50:24 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h70rm-0001BR-1T
 for linux-mtd@bombadil.infradead.org; Thu, 21 Mar 2019 16:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:
 From:Sender:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3lTre2w9pXLjcNapi+LHgLKk9TVZ5a8QmSb8UBUiD9Q=; b=cVYXCaj95HUWhHtqNSHxtJq9fH
 fmxFh4EghMioj8b/soZ4YP1UbtsOzyLF3/TpXsu/UMdaY7DtWANHoT0YuVu9AdBZH3apJYlE+iH8J
 aZ8tBPqa4DMd/DDao6LOCwLmE4Dy6pWogI1Qu+FNfI5LcYauxyHZmL7wEbKUdbYBeba6bvKdZWTvp
 ZsTRxEwnIGmV7XjkN8R+1k/CihkNm7J5dVeSK26oePctww9pA3AaJHP/+tqRIa/oHnyfAPqvHbavR
 +KbqPO2YMhKXGqzr0SXkCuKSzTbWnpXrybanMHO55OpJTtltGSDPRzyBE1lR9MWzOkBuJfDTOysS4
 6Xhg6dtw==;
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h70rh-0007y2-RK
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 16:48:28 +0000
X-IronPort-AV: E=Sophos;i="5.60,253,1549954800"; d="scan'208";a="28709930"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 21 Mar 2019 09:48:17 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.106) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Thu, 21 Mar 2019 09:48:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lTre2w9pXLjcNapi+LHgLKk9TVZ5a8QmSb8UBUiD9Q=;
 b=KATT5kqF1VlmtknYfXLtkwVuuYqPdG3aCa9zdxH66SWWdHRpzFIal6ENEIgz6DD4F3/RP+yuL1+iGo0r/RW/YPJUyxDgeJBTCeO5Z5U+0HXroBNDFck+ZXWWysMC+nuVVOpCPxDU8/HFQIQ0y6JZVeNzjOnfYi4MYn70tDzi98g=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB2035.namprd11.prod.outlook.com (10.173.26.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Thu, 21 Mar 2019 16:48:15 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Thu, 21 Mar
 2019 16:48:15 +0000
From: <Tudor.Ambarus@microchip.com>
To: <jonas@norrbonn.se>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKYWTd8A
Date: Thu, 21 Mar 2019 16:48:15 +0000
Message-ID: <a5d9dcf7-e2a1-0eb0-d044-56116aad58af@microchip.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
In-Reply-To: <20190320071605.4289-3-jonas@norrbonn.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0123.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::21) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e14e58f-8449-4896-4cad-08d6ae1d0302
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB2035; 
x-ms-traffictypediagnostic: BN6PR11MB2035:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB2035EAE92A009680CB620F67F0420@BN6PR11MB2035.namprd11.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(3846002)(446003)(14444005)(476003)(316002)(71190400001)(99286004)(256004)(106356001)(2906002)(105586002)(97736004)(71200400001)(25786009)(305945005)(486006)(66066001)(68736007)(7736002)(72206003)(31686004)(110136005)(5660300002)(53546011)(36756003)(2616005)(186003)(6436002)(2501003)(86362001)(966005)(31696002)(478600001)(4744005)(14454004)(229853002)(6116002)(8936002)(81156014)(6486002)(8676002)(6306002)(11346002)(81166006)(6506007)(6512007)(102836004)(386003)(76176011)(26005)(52116002)(6246003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB2035;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d2VQcgEMkF7w6/2sNw5BkRJ0BN6asPYu70Nlz7abm2MTHOqavwekLgItFpp8yqf+k3lc8Ketal/xggL/T+H3R4b8i+ubqJF90wwdYeiy8x5G9y53d/8AgLxlxga77VqGzusRIdRe1UZI70qoY62/IQTCX69IF3YfqkHyWxYyte6sguOUDzbT2cOrvYlKMIme6Ax7L/snzzpVclA0m2SCGOvtbCHO2OuqEh+2iHm2RyEw66zyAnWIqocpo3epnQQyB7YSiI1sUoTP2XHK+ujIybMfOVYAW+AMqdK1WTIuRD5Fbts+NnBDFhpbdFRBreSrm1J+/lu7oZfz7VUTQauVwsjBYxLhTzMKN+DG+WMdnhMm5ztkRd3inYwyFvZDhhl8nzrngi+0nBjlCL8zo66trYkI+Xyaj0m0ZOLzVaEMpD0=
Content-ID: <2DF618669AA98448AE04D842C48B7F16@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e14e58f-8449-4896-4cad-08d6ae1d0302
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 16:48:15.3195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2035
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_124826_288765_38EA0859 
X-CRM114-Status: GOOD (  10.05  )
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



On 03/20/2019 09:16 AM, Jonas Bonn wrote:
> Both the BP[0-2] bits and the TBPROT bit are supported on this chip.
> Tested and verified on a Cypress s25fl512s.
> 
> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to http://git.infradead.org/linux-mtd.git, spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
