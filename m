Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80E4C0650F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 17:44:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B1DE2087F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 17:44:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LwZOpmY6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=wavecomp.com header.i=@wavecomp.com header.b="i7SNH2Bm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B1DE2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZZ6vsKRBTQm7MiFDRAx7PRYkbwQ5udmIShS/9BBDrQ=; b=LwZOpmY6/wbrYk
	aS3p1IPPc7cAzRvh9b6j9F6u2kqfFZ2bRqu6kFSL8NdsXhScRhM50Ss8VGT8Awyw0rKAIBEU6DCd5
	HUcX4TBklEhQbQs3adMx/0Eq1kRL9Y/Y657LsnpGt2x+KeA7LVl6HfhqKf0DBvxeczNZPWTQ4NWsf
	V2sIKYZnYD9RpPY33LB5ApcfOddquEkOFwwkQnllw6r3W5mmIE3U8wl2/T8z3jT3W15Z6xETAJeab
	0/1WG8lrypyAlENJXuPZaX3Xe2ZwBM1Drglon/9obysdoDKotwNvR8Q/p3y76KK2/fTilaZ+0lMG6
	NvhgJ6E1TZNYGzvytirQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsWA8-00038L-E5; Tue, 30 Jul 2019 17:43:48 +0000
Received: from mail-eopbgr680099.outbound.protection.outlook.com
 ([40.107.68.99] helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsWA5-00037Q-7F
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 17:43:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHKJ6MBBxAKF2whOmS5Bk+w3OAIwjjgysjlr6J1nJOVUseyb4tG85iGdf/0/Xq1fderjhEdjjcRgEgfKWY48KVrA593Y2nr3Ib0OQkkgwEloRIl3ukjGFRGgFxFNlAdfRLrLgES94xso8iDtqmJMCpeabckHya7EblYqjWwcGefS1oH/01ODc2Hh97AJDsMTeHGKOJ0A2zREuIVjc5t5AO4n/qxV9loso+thEoDcqoYQnL8KVmP8ihT+F49H4gQiqGnW7ipQtR/v9r9Gqbg4TczjBwEi+VopmlvhvO0JmkNol3ik4t7d4zToNGgAkVGArLjEaaoz8DqcqohU9vvnVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeuDWkU/r6uI1NbxsCKBz6y/i7szA6zYECYktHMV9VE=;
 b=LGSDOMsaddMIttFo5j3EHF8MTIyydjwGuFL7Cv3fCBXZEd4pxlYK+MgVtVJZGnn4radjSC7ZjSiW3uQTDXkPi92TebjCuBBz/Ohs+Lpw5+WZSXBulLhUpWvDm7WE75zXXlwUFL3Xfr/kZZmFJBZQuWa5XOQXDnSn4fV7pn2/ZOoliy/9C5VqCI5TVMVn8+ObIJEWP1X2ITijYN64152DTAhAG2JYDheIhVUOp4ln98vYnAci9+jWXZ02TT9XLl07u/TDY95atyRJv/w6Kuujsbxi/+K3Ua1qu8tCcDpyKggYZEx+pdK71kzeT7J6Srg26uM5ZqIbocDrS0oaHlqjzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeuDWkU/r6uI1NbxsCKBz6y/i7szA6zYECYktHMV9VE=;
 b=i7SNH2BmvkwNKet+lwUtURmZlSwqXCIdAZHVCKHrdDhRPt+/xdKsdYyPW7r1VTcH1DPJCc0V2O6BlkUaULPeyE1OnsieiS8jzeKE6eFBC2r2HbQVMDrAb7S0HyuZJTuD5t1gVQze/a92AUjC+qyt7XpERloQWlvSnusZCNgSgjI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1088.namprd22.prod.outlook.com (10.174.169.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 17:43:39 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:43:39 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 01/11] MIPS: DTS: jz4740: Add missing nodes
Thread-Topic: [PATCH 01/11] MIPS: DTS: jz4740: Add missing nodes
Thread-Index: AQHVRv5SC/UNRQ0j0kSBIM7bj9GbPQ==
Date: Tue, 30 Jul 2019 17:43:39 +0000
Message-ID: <MWHPR2201MB127769D32FAA4944F9A791CDC1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190725220215.460-2-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-2-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0037.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::14) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ced0446-cc98-4527-5f3b-08d71515748d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1088; 
x-ms-traffictypediagnostic: MWHPR2201MB1088:
x-microsoft-antispam-prvs: <MWHPR2201MB1088E78D70BEA742AA3314F8C1DC0@MWHPR2201MB1088.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39850400004)(346002)(376002)(396003)(189003)(199004)(7736002)(6436002)(52536014)(386003)(486006)(74316002)(6116002)(446003)(9686003)(11346002)(305945005)(5660300002)(55016002)(99286004)(66446008)(66946007)(53936002)(64756008)(66556008)(66476007)(4326008)(6246003)(25786009)(3846002)(71200400001)(66066001)(71190400001)(7416002)(8676002)(6916009)(76176011)(81156014)(52116002)(54906003)(186003)(44832011)(229853002)(476003)(4744005)(8936002)(81166006)(68736007)(102836004)(7696005)(2906002)(6506007)(256004)(33656002)(316002)(478600001)(42882007)(26005)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1088;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: M1ii7ytiPwEAhGxpkKFJMpHe2XzBeS7zQo8zdz0nU6lzNoPhTDPxi99uwN3zo6hj9Pf9bP6HmkFKqesN5qbGRkV62/cGIFXHZ4SMNRoknnIqBQpe/pVjzrWctk6h9ekEnNE52Ds9pOpaWUdLKtBEIxJcfHC/oednXE1SCLWfWbz9JEx20vINHkZxV6hZv4VEO1MtUWO3ZaVMpBydPQ5xY/118hYTVWBZNpZKiLitJ/Vqnoo/9aTIeLwkbT6Zf/h6qhINuXuVCBCLW9F2S5sZ8F+ZjwH4x49PPJ2FCQCRrwTg1v6WcWVx6jo4FwMVqksuvb2vWFBTKFvlVqiCkPpi8P8i/psIIiSVSUhaA8/yojZJhULM7BCQTS2saQsvSi3tPPo6GY9lGiVe4NPTjpQYrKaYJceIgyb4ahQghUs3/Z4=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ced0446-cc98-4527-5f3b-08d71515748d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:43:39.3095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_104345_262168_FBAA0084 
X-CRM114-Status: UNSURE (   7.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Burton <pburton@wavecomp.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sre@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 "od@zcrc.me" <od@zcrc.me>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

Paul Cercueil wrote:
> Add nodes for the MMC, AIC, ADC, CODEC, MUSB, LCD, memory,
> and BCH controllers.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
