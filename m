Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1E3C54FD4
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 11:06:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83B1E208D5
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 11:06:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iEqaKMDv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="lXgu07sZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83B1E208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnnRa51x5hfx4t9eqHm7B5PIHTMG/qEZ3wxIXXvj1eU=; b=iEqaKMDvgbbRRa
	6/erKKZB4yU+R8AsHPDa3vUnopL0hMkE/OlV5RvZKaRaiRHocDl5E7m8xfLXzHJbzM2nwPjOYFj7A
	AvYuK6gceh/oc2J/r+77JdHrO8zxwkSFkmB1kTCDsstPFl+fDZVhZ++lEHlyTtVtKSpouUDvemQkr
	Kdkp/3/IrnrvFmORE7Sque85Nz3ZR/tgGnfW+xrQ/9VuiKZzwar+Yue1JZZxX5PDa8sNoMYJPi/xe
	dS80mlWSCbrbyCmIIW2KdHr0m5Bjy66iMu3rd2yj1SBsgx7AYeIADyitWqNtJYW11yNipfSnkLgZ/
	Bs74K5LICYTRN0HNW0sA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH3rW-0003Bi-9u; Wed, 25 Mar 2020 11:06:18 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH3rR-0003AG-9L
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 11:06:16 +0000
IronPort-SDR: uBrX452C2NERyTE+L9ktyyflvA8Rr2a2et3czWIIFBs5k5skg0R157Ya1bUCCcoz3quw6FiRuQ
 gaIcrqszOk1Y4GQ/aLoS7BDkyNqV5N9kjh+lxt191bLOAN6pgoikT4mupP5FMR4FCOy1z2ztjF
 M6kjONDOORg+Qeb/bIhTixfDCJtw6CAGd1rizV6vD61laedyyH7nhlTbpXKO+ZBust+QWCCS7I
 OQH93b2zFZ74ONQjdLbovneCxs2A27VAINj49a2C1uNL8hjD1tK6jd9TyqgYyS+lucI/oSPg67
 x1g=
X-IronPort-AV: E=Sophos;i="5.72,304,1580799600"; d="scan'208";a="70122846"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Mar 2020 04:06:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 25 Mar 2020 04:06:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 25 Mar 2020 04:06:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZ2PyeuoANGaPxZi5UYvM0FX2LG7kLVOGfn+aUOml13zEaD5NJSk9Xmq/UgvqO+CNRN1iG63vreH8rxwomgQzfzCcI0mOXf3jNMWiJrH/Y/W++/GOnT82atwwrCKZ7X846aevM41uel3On0HkQGeFmSAS7TTXTlynZmBjvUHi3f95Jt8YdM8Q/vRTOTjSFhNzzn8gjH+RYZNZzE/YpV9J8Tjj/yn+uyhZ8Wd1ArrNlV49balsB3tyQ7xJHKVk9ce38nBJO7+zaPtJCxQSFUsbNluC4tsPL8BJCQznsXp6LefyCnnp2G1Zldcd0sjzJJg/2r5mizFIvw046britcE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHXBA1gaUrv60TKTndJFM/yO/Ijz5OvjQpFkfM2nVo0=;
 b=IqeXH2Rry+Vo/6SCnxmwaeHge1Z7/gyuFFb9iYiVVAVOyi/QfZ0gakW6ILVRVLT7AxH5dUkLKavrjJr/vwwQqwSe9pNjGakvezI8aQy56ExjUnfQ4PyrAQkglmQvAxi/kZ3acx1IFYzMjmJN/epI1KpK8ygMtvp1+2MzN2PH+W+4zZ8P2pBZeJJjRqiAeZgBi8I4TDpDhzC76tRfLu3pDlLqrwZlUreriFne/q1ppVAPzUOH6sZ/OLZKGlGQYQb0z5Sy4729TQoLpUc4pMm3K7ww/DGYESh0VlIPj1u16hZ9WLnoJ/AYvZAPIlsg7GcLkIM4PNvNp77p6sR3tFAs1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHXBA1gaUrv60TKTndJFM/yO/Ijz5OvjQpFkfM2nVo0=;
 b=lXgu07sZ7/yc6zbmhShXDGMqQsQAoIOqRqYUuReTS8GOIXnnflTu3biC3Hhpv+B9b8tE4K+H6xY5fowMnT4YSzVCYXhrBLW0CdTvLMoLSmlTxMEwG649eflXg47zKOqkQl8pFZkJZwPpsIi+Rjd2+F8UXaVJ/S9/H1cA4/psPEY=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4225.namprd11.prod.outlook.com (2603:10b6:a03:1ba::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15; Wed, 25 Mar
 2020 11:06:09 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 11:06:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: Convert fallthrough comments into statements
Thread-Topic: [PATCH] mtd: Convert fallthrough comments into statements
Thread-Index: AQHWAis8DL2tMEYn3k6kmnWVwkN0ZKhZJm2A
Date: Wed, 25 Mar 2020 11:06:08 +0000
Message-ID: <3012544.xGDKOrPs75@192.168.0.120>
References: <20200324222538.16446-1-miquel.raynal@bootlin.com>
In-Reply-To: <20200324222538.16446-1-miquel.raynal@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 928cb005-586c-4486-bc01-08d7d0ac85a2
x-ms-traffictypediagnostic: BY5PR11MB4225:
x-microsoft-antispam-prvs: <BY5PR11MB422514E66521D0704813354CF0CE0@BY5PR11MB4225.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(376002)(346002)(366004)(136003)(66476007)(66446008)(91956017)(64756008)(66556008)(14286002)(66946007)(76116006)(316002)(5660300002)(6916009)(26005)(86362001)(81166006)(2906002)(6486002)(53546011)(4744005)(6506007)(4326008)(9686003)(71200400001)(8676002)(186003)(6512007)(8936002)(81156014)(478600001)(54906003)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4225;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8tajprVSK8XlJF6bIFL1r3do4jST952zvjASUoyHFEmrW9YDilJS2vV6GYyvLwlHcBUC0ma/d15bd01srKLHEEwqhNJDA59l/aUiQn1wOKKxJKJG6gUL0k1FIdYjfTuYLJEO7BlSq/E9EICKw2VvSRpwxd5KAMVlY2nFmrEQ6aIgE7YYmvx1f6TR/Ly/bZ2TUCCMSyGYDBDYBNVWT6rJnPn/P1Z89aYvTG3TS34R8WKqppfEcprC6e1k7WYZ3U3puLvZ/VhzfGv+HW6cC8GJ9HilYGa9U3kaMWYqpouQQIVNPCgmSF0TYgaMuQ3+ncO2Uuglc+FAD263JUyQOshaqQyebE7H+pGd+hJcFjyGPWCp+Hci/TnCslzKV+0dG/x7ItdjxAy86jrItdqlHWFEzfS7mwC6roxOnyVVlGu87pcbZ585jcgmtL9XgbdYWoax2MoU5q8u1FQ22T6ZKnu4lKBM5FmqRgNUqAaeur9B8BX/CJXd1R49Yabv+8iZQlIa
x-ms-exchange-antispam-messagedata: NCUPb2n4qRNU+k6LQtYN+oltLx8dwW2SSnfzQ+5dq+GJ504EIyR+RLfqQ/lDkvXg3Wh4jRiIN9exfEkiR2j0kzaBD1KkxDIp0Tomfk3lDul9r8m/PdUzKgxnL9G6VEvdYTztyu110lWV9QroIJ+s7g==
x-ms-exchange-transport-forked: True
Content-ID: <E64E28FCD7DE9148A53D0DD75CB700CB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 928cb005-586c-4486-bc01-08d7d0ac85a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 11:06:08.9902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XUpGnjO2avRsTciwA2cmquUVzQfZvRHpqQ3E5dEJunB5vRdkOAhGWSwx+yrXw1yKRetwmOVJveRWP8EykWdTcgHrbrUariFtQLxw6NJD/mY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4225
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_040613_432450_924A4A67 
X-CRM114-Status: UNSURE (   4.97  )
X-CRM114-Notice: Please train this message.
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
Cc: joe@perches.com, richard@nod.at, linux-mtd@lists.infradead.org,
 vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wednesday, March 25, 2020 12:25:38 AM EET Miquel Raynal wrote:
>  drivers/mtd/spi-nor/aspeed-smc.c                |  2 +-
>  drivers/mtd/spi-nor/spi-nor.c                   |  1 -

Hi, Miquel,

This will conflict with the SPI NOR changes that I made in spi-nor/for-5.7: I 
moved all the SPI NOR controllers in /drivers/mtd/spi-nor/controllers and
drivers/mtd/spi-nor/spi-nor.c became drivers/mtd/spi-nor/core.c.

Cheers,
ta






______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
