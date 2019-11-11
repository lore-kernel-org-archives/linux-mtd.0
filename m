Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE27C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 19:39:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70B06214E0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 19:39:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fg40m7Lu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="DoSQTQ+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70B06214E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2mpsoUX75d/3kFxL5szzhKqmvE1/vVs7XTypUvQZF0=; b=Fg40m7LugM1dxk
	KU3Jmg8HH49E1QxGE0J4EDexxluVD5/tDUqxHQFNNItWC5Mh0ziJUXw00MAeyBRC9DyTg/pWOpFfQ
	2V4Je31PwWpo2854rXbC32r/rFg7r99+MX2ozygOpJZnOuGCfMvd5ww78Edgx19fENvHmSzi1USQ5
	dWya36Ex/UOLWYkWvJLennvOwsncYAGYM0n2PKu02wSdBIF8ED0wIjXxNKgqNwZ3X6tMoire08iKz
	tTkfACX5V2dmMeNDLrLzedTDgiAPA5wmUjKfsagwauXV8SDakQHdJvpIRAMoXhs8TiuAJsrrXTS3Y
	JZRsMAjpscjY++a6rofw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUFWf-0004Px-U9; Mon, 11 Nov 2019 19:39:01 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUFWb-0004PJ-LV
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 19:39:00 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: zODzozOGGZ2jnuyhDIKiP3ZoPdzEJ0CXWY+/QzXr42awRM2ftjUvVIxeUmxXYQTkkZ/Ylu+CBf
 uFIThqdxlttloAEMHjlVXrYnLzXuvCXTyeiKQTxxl+rQ1Gmgf01DSQuKYyD03eljXwDm8K3unP
 gfID4+mCG/cHeH4S6dSDj88xublKWNBIjfi91PRHnpgaWdgN9lPsmd4gCSulD1cPf8FlFcRIga
 Iy5y/ya+KBpSjQVI/OepYXO9bihxIVrx7BRb86VTWFc+2KdZfyZRenoqzGTkriIe9z8fxMLIht
 6LA=
X-IronPort-AV: E=Sophos;i="5.68,293,1569308400"; d="scan'208";a="56112785"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Nov 2019 12:38:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Nov 2019 12:38:52 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 11 Nov 2019 12:38:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zo4WomQ7omYtIemf1qavEMB22KhQGY7YXhX0i3uSbwucqjfS/AkOpohRjGb7Ej+XiWcAoF3IT0KdVY46vt5IlsyLs9t53+WTyWSfZDJSlWko9r9N7ERB8bPDmqCUUMON5pbkZD9PminMCj+RF7Gt7ZUzieqAuF6U9YDsx5QCr0pNSm5O65VSG2qL15eYEWBQOsGKOIWCKkz8euEI+ov5SUD2sROLdS0KaN3Ggrtj3aIM7tsAb0vyfurjXTgMpO9RWKqTjvc4kUJTwcUoJ9wqq67JuV+z3rA+wGjknOpX/qqLhxRy0g6WjyXwG69/7qiUnV/ZBBeTM9csH5wUgANvLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuKHhHwmr5JpYx7guT+6aCQnVe7FSY0LRATeoSPQECw=;
 b=YNsiLni/Wp098XMXMDrGPFWGnoZ5The7JTl8jo1O2RDZ4gGlUelNA09dCXXzppBfWd4IKE7Z4OlmdIVlDOg5n4EzzLwLtb7vRi3Y83d9IP0EZAZw2ZNyva02QqTZZpwvehd4Ysu5UNJB7GmwQ5NCRdeSW0q5uiqT7GtAFKTgwswLeAMbUXDZCDWqVYc7/pMoOralf4zdfvsqgsGvjA+u/CjnkTED2caAciCiUMI2BDYAIY0rgenzYLI/4Fji4hOhbw8xrTcX5zLzGery+5FdOMtIVZyo4bWyx0raluLXs2ZBCndVvrNFMaV+9fcZlktIVUthsMWEPePMYS6v7+nZyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuKHhHwmr5JpYx7guT+6aCQnVe7FSY0LRATeoSPQECw=;
 b=DoSQTQ+InpC+qA6SM1PZdX2DOH7vwam40L4u7dtAFZSxoFUyX890AYDHvl9HaPC9K2Isq/IRnL+dyynt5tFEIHDt0BoIin63fn78Eu5NbIRwtwVJY+bzaUGEw3397kIHY4UQsYYBV1ae1WDtVH3ZSXj+vo6t8H6LhwJxb3eSbF0=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4221.namprd11.prod.outlook.com (52.135.38.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Mon, 11 Nov 2019 19:38:48 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 19:38:48 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sagar.kadam@sifive.com>, <vigneshr@ti.com>
Subject: Re: [PATCH v10 2/2] mtd: spi-nor: Set default Quad Enable method for
 ISSI flashes
Thread-Topic: [PATCH v10 2/2] mtd: spi-nor: Set default Quad Enable method for
 ISSI flashes
Thread-Index: AQHViP1Ciesy8UuDbU6ImldcZKusBqeGfUQA
Date: Mon, 11 Nov 2019 19:38:48 +0000
Message-ID: <0c8db8d3-4625-507e-9954-45c8d8ffe6ae@microchip.com>
References: <CAARK3HkOwyvg=xr7fw1SrP_=B+Gj+waQmtZvgiK4AUpQrbM41Q@mail.gmail.com>
 <20191022172210.19865-1-tudor.ambarus@microchip.com>
 <20191022172210.19865-2-tudor.ambarus@microchip.com>
In-Reply-To: <20191022172210.19865-2-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P194CA0017.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:be::27) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [5.12.60.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17365b55-14d5-4db6-fa06-08d766dec5de
x-ms-traffictypediagnostic: MN2PR11MB4221:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB4221C6ED54ED37A44B13E344F0740@MN2PR11MB4221.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(39860400002)(396003)(366004)(189003)(199004)(386003)(26005)(81166006)(25786009)(6506007)(81156014)(6512007)(52116002)(7736002)(2501003)(14454004)(76176011)(31696002)(8676002)(8936002)(486006)(446003)(3846002)(2616005)(6306002)(966005)(36756003)(5660300002)(11346002)(99286004)(476003)(4326008)(2906002)(66446008)(6116002)(186003)(6486002)(53546011)(86362001)(305945005)(66556008)(66476007)(66946007)(66066001)(478600001)(110136005)(229853002)(6246003)(71190400001)(71200400001)(256004)(31686004)(102836004)(64756008)(316002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4221;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qvqn7DY079XICUVIJm/3lhGDuph2v43hnzqa9Cf04DDh+OUkrCGW1L7nwRGFWIJpg5b7TdUXfTjC6VdV1xzNtynscaKiEIpKa6ThQLrZK8FUgx2UKkIgnXpjrykbPsyBdRCfrh7nh8/NtUkphEewcTJ7Va3QAa6ueZ2+/J/DTa3PFHDlAA6ck5YEhri5Cnqnqqezc/oS+Sv4hqEM4WtY3i4zvSiLe8GFRdYEZCU5iOs9FCffNBYF0TfzZEKm5kwVEVpTS7bHLo9aMcX2oVPp0sXtDym12kK29Vb2jbWuCoHpyluISxJHQzE0vNlMscV/N/4x3Z+H9KnRAQPKlQaWAlkELaaWe8lzhmBTkQoslPlyBUMDCoNgg6EOZ9r16XH2hqC1WnkjGQHEdsPjvwtecNRoii04NRHvSqxWsv/rYuSe49W0GKIrsfKhOsXhNqQZ+W3lPQBS5jgYbS4QcU3B/kslsYzJ/jTxRlG7Yxs9jZc=
x-ms-exchange-transport-forked: True
Content-ID: <6E68FD26C43675498BD1794D1EA384B0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 17365b55-14d5-4db6-fa06-08d766dec5de
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 19:38:48.6860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: voyk7aujY+ItWSuwZHwaSxrxiDY2QQyESt1+m4PDc65ldooXfDiN88gLwjitZ5tPgvSBsFJirkvQiBlsoICj/1TrEP2U80f3HOW2b+DGkxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_113858_735788_144F14E7 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/22/2019 08:22 PM, Tudor.Ambarus@microchip.com wrote:
> From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> 
> Set the default Quad Enable method for ISSI flashes. Used for
> ISSI flashes (IS25WP256D-JMLE) that do not support SFDP tables
> and can not determine the Quad Enable method by parsing BFPT.
> 
> Based on code originally written by Wesley Terpstra <wesley@sifive.com>
> and/or Palmer Dabbelt <palmer@sifive.com>
> https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b
> 
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> [tudor.ambarus@microchip.com:
> - rebase, split and adapt for v5.4-rc4,
> - use PMC CFI ID for ISSI. According to JEP106BA, "Programmable Micro Corp"
>   changed its name to Integrated Silicon Solution (ISSI)]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> Sagar, this is needed just for the ISSI flashes that can't retrieve the
> Quad Enable method from BFPT. It deserves a separate patch. Let me know
> if you are ok with how I reorganized the patches.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 9 +++++++++
>  include/linux/mtd/spi-nor.h   | 1 +
>  2 files changed, 10 insertions(+)

Synced with latest spi-nor/next, s/macronix_quad_enable/
spi_nor_sr1_bit6_quad_enable and applied to spi-nor/next.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
