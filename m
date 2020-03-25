Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE23C43331
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 11:10:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F70220714
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 11:10:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cSbhY8yj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="U/kRfgl7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F70220714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuZe8VhXSHSNi/JkM0MXAvZ1u/44tGKoXUF42wED7sg=; b=cSbhY8yj4lvTrL
	WyE7xv6KjBNOADSyb2v4PzlKItFwNSKHJfMziIhSEzESmx5xSY7Qu4UHy90l8NrPODUOZqhH3p/PS
	Hu4snM29RPm76TzgmRy9GKEKA7X9uCnvhzt8N7C3qpdgWZCGnSsoYdTrubR1yRH7k78K91aV11e7B
	s0zxI/AEC+tBsBeVHvGItBBm9QTDk1jdcBC8wAByG3MkpyvvNesodwCwkq8pXtYXrZofbiVbgVQTj
	isgGd4ijZ7uJGy4qvuZPRGsoDSz6u9OcSBwQ/FPy2XaN1YTvZ7HjFYg0q8ZZi3Wf4okI3PaUfQWxC
	CTzPcNWvHNnNrJrzuQaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH3vS-0004yW-7H; Wed, 25 Mar 2020 11:10:22 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH3vP-0004yD-6B
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 11:10:20 +0000
IronPort-SDR: 55dFRhhnAGcd37LdmGnnVFJeyuQrvInmMT6UpFB6bGzDWdJ52LXvey20FBGwGJKIMuHqJbUa8G
 M+l5eW1AUPYjFWq1f1FBK6o9lg7i+Oy6tgj5Ty+IiGr+ejO/02bkvZgLFNvLEn3S6a+nMgVi8/
 Oiobv/FMncqZ+d/+Tkd5/QDsChg9+MQeAYZ3olegc/72QzmHwgvrsdfsm3bH9x1QW7tqsMMoJ1
 kehydI69zJrU1LGt20TOJRdVZc+Q6tG52a2rOFPYhCm6TpvW3VHmdgQ7AWkU8D9IdY9wXGAYFI
 z44=
X-IronPort-AV: E=Sophos;i="5.72,304,1580799600"; d="scan'208";a="71195670"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Mar 2020 04:10:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 25 Mar 2020 04:10:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 25 Mar 2020 04:10:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U85afVX/XdiHdS0MsLVAhqX2636aw2Pes4Vf43EXLw0VFg8ol9G3StB659F7NYnq4Kc4S8YQOe+NSxnfWf6F7B6Nte3lP1/W2mVTtpB9kFuSiX45BOz5NuTMcDJNsHSAoHwiw6Omzkaau6pAbdzaUyF2C3h7+rOi7C0VRgb8IzkmoTGDvOBR1pMb9OKTzlsxzQuoYCnL8Mu4TfjdgoNxr3TLgOn8xbHA8vp3a5rppYjFtRBqalWfn9rk5bpMLDu7zmQNCL54Sa0FKY+pG/gjZoBqG2326L27fxHAfyc9iOu2JZ+Ev6+HSu3uO4JNJ1vQpXxVSHhoauuh5lKeH0R/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdcgtswofFFR2+JQJXtMuzzZoQOhyBWHw5JAIH+RgcA=;
 b=YMa25GUH4QLkDK+4/FK4b7osudEgtByu+jPNDDpthY1kd903o1nMabIp3sB/GxmOR3LqLxRC3P6fT7vt838a8WqD1sbIBlEtYWpRECvM7tH3J4g2qgMo4Ji/9G3UJFXaMuXm4te0Pqg4L10vYMah0vTqHdzPK3NMug5lm1KsZQwv+vsRg5x3lTzMA3fDrrCz95/m+rTyvca1GsmqLOZt0XeuULTOpFE65ewtFF80hRazK+wOWjFPpMG7DBSc+cDMQUzyVIQTy3mbT6xWgDaXaHY5DJp+rWY9A9HMtG2lNc9f/Q1wSejq1x7swRW4vctvHadRBuUsRLA0e0kGvxaANg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdcgtswofFFR2+JQJXtMuzzZoQOhyBWHw5JAIH+RgcA=;
 b=U/kRfgl7kWlnGgm7IEInCe0eBNmUB9Q23wlkZ9e+TZR8tvcVmNCa3QYhCQ0myvEHil5UhpcIwy9MCkjOe8PocS7Tb2QE7TYQtiCoTewTkgo0LIyGgnYAGu9kSYA0L/KxQNt9o5b8AasGDZrxZenm8aHxVIzsyyRp/rgBOM2L8Wk=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Wed, 25 Mar
 2020 11:10:14 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 11:10:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>
Subject: Re: [PATCH] MAINTAINERS: Add the IRC channel to the MTD related
 subsystems
Thread-Topic: [PATCH] MAINTAINERS: Add the IRC channel to the MTD related
 subsystems
Thread-Index: AQHWAonVXc8Ih56XF0O/r9YkJEY3pqhZJtWA
Date: Wed, 25 Mar 2020 11:10:14 +0000
Message-ID: <1649468.r3SXxhbZOJ@192.168.0.120>
References: <20200325094319.35841-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200325094319.35841-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 962af9b4-dc7e-4deb-d740-08d7d0ad1812
x-ms-traffictypediagnostic: BY5PR11MB4274:
x-microsoft-antispam-prvs: <BY5PR11MB4274D6F9FB32C827B2F265E4F0CE0@BY5PR11MB4274.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(366004)(396003)(346002)(376002)(186003)(6512007)(9686003)(6486002)(81156014)(8936002)(4326008)(81166006)(26005)(6506007)(478600001)(71200400001)(53546011)(6916009)(316002)(86362001)(2906002)(54906003)(4744005)(14286002)(5660300002)(66446008)(91956017)(8676002)(66556008)(76116006)(64756008)(66476007)(66946007)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4274;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +RRgl7E+7qZIETuSFu+FLWm2lZwSAJ715A6vqhI1zxZWMESVY1qeebUxjQC5lolmVN6y3mMTSwZ1O6x3hJ5ksgmAva0xLqc7OTFqcZq6eIuSllA/XpYGUg3dHq4+JYRIlGh0tx1aq8zOa+B3Ny6PXxwFcGojlJdnJ8Td1Oqz8TLSAIGLFIbbo+2ZG2yrS9jG54dcIF+UCt/H/8AxF40tfUaalINRZ7WPNpZsXfoZomO+LDT9VDMH4+7XNTlCD4av6wxg+U2sXRerL1gLUZC8eqFPxJf9YpzoWRhGzOQi26n40gYRWGn69xG9lZboU8y49hz5E1/bW20nOitdWp93/abuirNWldiW6+UIg8BxlbBGeC2ZLNow0qfVn+j4ZmygjqFu1cOLKTRUlPBHbbTXCqiKGMVVlQ5ttFPBI5IzPv56Fau9PBEEhHTgBJBqJrBVV+vvYf9XxHuJB6NwhlMrzlAkHLjZszLJvYntNc5r41gKDm2bJaoHur3T5+dHmDOu
x-ms-exchange-antispam-messagedata: C6I2wImG7nHeSDr5He2vF8S7ARFb5TIlLknFROkgMOvMI2ovmfvFzv39YChzasG21ltWUCKtqgzRhp4eFs0huMH25i554D4IF5SH8/3ZcjWhF5nBA3UTUrobih0QqA+ftNFHkF1Wqr04c++agj12gg==
x-ms-exchange-transport-forked: True
Content-ID: <BA2881F756EBAC419E43D0F600AF1721@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 962af9b4-dc7e-4deb-d740-08d7d0ad1812
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 11:10:14.6542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NXVwj0GVUYmuFSstRjZXvB4SXO8pWUYJZc0RFFM/6IjsbZn1Zkp/VuAzOw2yYxYfVedT/XahrdMjm85Xzr1bNgvjvRbhYdx6VjvXQkqPCDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_041019_270273_BB6AD4EF 
X-CRM114-Status: UNSURE (   7.73  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wednesday, March 25, 2020 11:43:27 AM EET Tudor Ambarus - M18064 wrote:
> The #mtd channel (on OFTC servers) is being used to discuss MTD related
> topics. Add it for better visibility to the HYPERBUS, NAND and SPI NOR
> entries.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)

Richard, should we advertise the #mtd channel on UBI as well?

Cheers,
ta



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
