Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95E8C0650F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 17:44:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAF6A208E4
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 17:44:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cQm+8w+6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=wavecomp.com header.i=@wavecomp.com header.b="kBcohFEJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAF6A208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnhedlPWQ+9mTdcxRTm+YGzPPLLLtI/OIOuiI8peng0=; b=cQm+8w+6PXZtfs
	8CG5mewRi2KYfAXOpMoHZPD+KhK8JqID9Vrxd6yW5Hl1YBV4ZkXtXTX0qLj5Qzty4sfDuZHUEDQlI
	GEf0u3yLyk6xoq2fO+sCOapbktmgKam96NY26sWq4418Z85kleLwDVBqmrnsC58L6ZP7XjwiVxxF5
	qxATTIAJ1HIk4Dn9JAlQnWDb5i5A0KGu9CHJBVVRq1yKkI30z1KxQA6FVpvOnm631bYjDMjWfJtJb
	hUrQRA7RygsEsB1CNx9OrWG0LGNL8lvu/KnPmp020POE3WANisxaAOOrRAzlFkzs0xifYt3uz1HvI
	qdpW08bQ98bmDpnt5vNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsWAR-0003dl-MH; Tue, 30 Jul 2019 17:44:07 +0000
Received: from mail-eopbgr760139.outbound.protection.outlook.com
 ([40.107.76.139] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsWAB-0003Ay-1z
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 17:43:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYSooRtr6KF+flS7mhRw1vNnmEDXFpMMB+JPAZtN1ZwS2BX5xPjVMTZCzfDQheK0iFdj5R2I3LtDVA+QEjFTFw6FrNWwV41rQohl4uRXVkQ21y72ZVw0TGcaKaShQ8udGmfnqne01ndLhSwZS1f4dBFin2BM5tKUspY0+voLMbkIsJm0vfbimHmM20g5Kg9A2tkHxTLA6DpchaFKDYrM2Uh06mUykwwDnX7jpcEm7OaWJn3O2rb116Wb7NTt6ESePiyOWc8Jl0Nl0/fL6bvHrayZ5fzRE0R7CaPWo/MDMIopBrCwEfgZuDKtuyF7gedwKpoUmUUP5CumjpOZ8IopBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiwYG3TY3kxRFNJZh12NBzqhG4GKm0Mdj1GWDyD0oag=;
 b=mxiLh90Q58BCKv5mWiMO4SsfqeHgaFarj1ROeRsPvXxR0wOubrjThp8P5gbltphmHTviLPLCB+OYou9ixoEjOVHPMOtP5YGqeKTgThO5CeQwfofmnB5ZihmzzHJsgo+chys3EZyO74lvEcQNlKzZqR/ADg3gq7fWy7IvWBt/BvUe28dIWgshkNh/kvzBmq4chlDqJF/mHsf6l/75NhaaPF4Pom4J9W41rTlEmUOxH2vfaBE/hXbobXFSzG5E5FQqE1jSofufghgfjRXIEptPGcGlA5e+PWKOtF2aImJkj/wYFfheuWSgrj/L5Yy0SNIArYFq2HACvRmwRbu5+ifLZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiwYG3TY3kxRFNJZh12NBzqhG4GKm0Mdj1GWDyD0oag=;
 b=kBcohFEJ4A9LgpoUkM/c/bSplLktc8OrRQ8ZLKoEb6JA5qwH2LtUTbKHLhBip9gciQg+UpCOQA7EeLc9+CafEArmfLHLbcwXr8E3bkLtrxPLRXv3cPafmYswqLjStabpBAWhkf7JuwrWLqyfDzDw6b9hpXxxnWJelZQsJ3agvTM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1199.namprd22.prod.outlook.com (10.174.169.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 30 Jul 2019 17:43:47 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:43:47 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 03/11] MIPS: configs: LB60: update defconfig
Thread-Topic: [PATCH 03/11] MIPS: configs: LB60: update defconfig
Thread-Index: AQHVRv5XudYChLMNHUqcnu9Ai4NHkg==
Date: Tue, 30 Jul 2019 17:43:47 +0000
Message-ID: <MWHPR2201MB1277A4C6D97106748D1459CEC1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190725220215.460-4-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-4-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0092.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::33) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d063b250-7264-4a9e-0a7d-08d715157960
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1199; 
x-ms-traffictypediagnostic: MWHPR2201MB1199:
x-microsoft-antispam-prvs: <MWHPR2201MB1199EA5E9E95659DF2388F16C1DC0@MWHPR2201MB1199.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(376002)(346002)(136003)(396003)(366004)(199004)(189003)(76176011)(54906003)(15650500001)(4326008)(8936002)(68736007)(14454004)(81156014)(66066001)(99286004)(6916009)(81166006)(7416002)(52116002)(7696005)(71200400001)(71190400001)(316002)(8676002)(256004)(14444005)(7736002)(2906002)(186003)(6246003)(305945005)(42882007)(478600001)(64756008)(66476007)(66556008)(66446008)(6436002)(6506007)(386003)(66946007)(53936002)(26005)(102836004)(6116002)(74316002)(25786009)(4744005)(3846002)(55016002)(229853002)(52536014)(476003)(44832011)(33656002)(9686003)(486006)(5660300002)(11346002)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1199;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hsjecgSx7ohi78vq+/o9dtOi6zhBeWgwWSlzxR0vkhN2emtny7LaJgTnl2qZI1KI7fKp96aLqGf8s9d1/wshoeoJ00HvHy9d9y90newVZcxciPdVFRmVEfSvMjtEBRV8igmEO8Ao1RXM8dLoYKAbMKtVdN+B25elLm9uj6pa7UgbLJ8SEmqJfoZfkJI3PpQRvKBweO377NJcgBkmpS5x8l0dQs5yecxa28/p0ZJb5toS6DETI8tlzMOn06YYgtllqIUuUqshi94t9jP7nHvVhYrY6Iyg9QG80PbNxC4kXO+/TLEgyayyh4lub8rEcQrvOu4pjTbJWKRYvupVQuJMc52YTYvRKqBBGXp672L8tTctoZnfgUbkDHXePigfVhfEbK6fmHaSSp448JndjrQ/thRoRsxhAG/BWHMylvMWvOs=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d063b250-7264-4a9e-0a7d-08d715157960
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:43:47.3730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_104351_229119_491FCE44 
X-CRM114-Status: UNSURE (   7.74  )
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
> Update the defconfig to select the new drivers instead of the old ones.
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
