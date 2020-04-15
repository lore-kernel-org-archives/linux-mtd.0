Return-Path: <SRS0=fMXC=57=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D37C2BA19
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 15:08:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8E432076A
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 15:08:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mjAA7+Ko";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="UWqd1PZ0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="PVV+1Ecq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8E432076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n6b17JJl6RuITLqFdQHqe9yEBn3gIMpRILsV3rElT8c=; b=mjAA7+KoayT2eN
	/hqxV0A5ARz5CmhE8SRj1PkeBCH3P6TlQBxfVgRIGWHoAXzu5CQE3HvzBig/DY9VzvprTS8XgZMz0
	MzeJnoVW0H141tUDkC1c1JvKLR77z/PGp1TXn7cFrOXcUKmHW/u/rah6a7mV9tsZB4NJjgXKftQTp
	oB/y5jIxn1QAjuiTQ7WYliRMDlGUC/In1sjPlC4QM71gmxwQ2cL4u2CDQIuy2tMjqeMZ2A9us2NCR
	RRjfcbIfqscFNlxxGkeFNupAXV7PdNJfPyRTYr+XGrsCqTHsH/1nqLGTKTi2UkYNHOl/nwnernER/
	NMJYC0yqCIp2tZUX+aPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOjeA-000150-SK; Wed, 15 Apr 2020 15:08:14 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOje7-00014e-W7
 for linux-mtd@lists.infradead.org; Wed, 15 Apr 2020 15:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1586963291; x=1618499291;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wyBHgdGsMVxvIAGTZ2IuYkFfRR6hREE21Gwa5OCZF2s=;
 b=UWqd1PZ0VquCWmVJzR8rWmCTvPIKeK0Vof3NrXzAiyShLjBI4i+i4u6w
 LdDIGrPBCxh3SPFP63L8Cy7V6yntS8ClaLLOwuYOhmvsnB1l7cXiw8V6U
 uJEQXOnMEDOkHXEQizq20xpmD/YjkAW8qt+cByqFOW7a6DiFqZ5Z88ta3
 558VdKhwZtioKd4Hp8pTA04JcJ+G2oNNLE9gpV0pC8X7uV28oy+Dpymz/
 1THOBRf96uT/cNZGaT4DUM5DoG6wUR0KcyYMrxURMUQ1MakVSbpOhA527
 UOOHlZoGAsb5Cyg5DYPCAviNBe0ZGbLcTYXOhh4HA1gg+CnsxEeqenvyT w==;
IronPort-SDR: 0Mh8+UZE/4XIwvYX6ZeAwaaQH3P+GcRk8+mxe2PInw2o+68Bm7pp/hcWZhsghFN7qhCmklm1X9
 9tUulApFbAGEOSdZPJib68hB8De9eVc5E8ZQTV9i/1bk1/U5nOgJanOXsMRsaBMKp6CcxrrmaJ
 slZnMsaLvLv5xXcR85Uq0Myn62T+ZhEtlxrWyVvOKy8gMhzhEs2oK/qVWk4ugQG4vO34HTUDp+
 4ioWBRs5UV0WpuZzZofe4BCgUq5bMTph/cgYV0K8A6q3yjWW8yf9u5mBtAJ/Y/h4ieD8cAVaW0
 c1M=
X-IronPort-AV: E=Sophos;i="5.72,387,1580799600"; d="scan'208";a="76011390"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Apr 2020 08:08:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 15 Apr 2020 08:08:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 15 Apr 2020 08:08:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeB1dZJoVhGlE4lXbiuR0mZik6eicZ0n+2IXR/nOfyAGn4qkKtdWW2BEfjpd+Nz8yNAffjZQ3aGpCeERNs6+76Uoku+EuDLxqDPh9e0sAdzvLaYRe4Em0NZG8LJTY4pn51ePCOnPEI/M8MWTsXxrOx/3EwGb8A8nZWjiXLg/TB3ca+dfQiDtWT7fnQ9tpZhpMBqEBagBicYWgZLwMtHDZzPtj0KKcjVEQx2CpKh2pFJG/adDr92W7AYqlGW4HJcDyOt3gt2b5jXMlQQrf7TDoiFl5wPa7O+4YMvwLQEuTdnD7xt30+0U2b7zp9IMPMpxKPImBgIbm84zLFaLSGUYKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyBHgdGsMVxvIAGTZ2IuYkFfRR6hREE21Gwa5OCZF2s=;
 b=Mem5qETl/KKn7xghJWPvwC4pVpxAYLy9gezC0NAvfPCqbXJWnP4hO8UUqYkwlY+px/OGYMcv9L0/MaG3E00UlcW4rIslpEqA74nLUngQbV8Qs/bJOvT2DufOxUSvhdfxntpsV1imHd/6tyY0IT3XejUEKSC/KkUsHLGaZbAcLAe8zrGpJ7lhzNuQEqcAEqIjXNbvr+qiMwoXhN4T9XcSdoq1AwazBC7lOlDz9xCfQXJwmddk2jljr9kPCJ2VIgLaVH8gCKvcwUE47eP6i0N1ZCoJcuabThJGxYSEzc3U+TQYhvRxU7yHwHKK/v/QKvEgFmoz2FGTWPYGmGRIUgaAWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyBHgdGsMVxvIAGTZ2IuYkFfRR6hREE21Gwa5OCZF2s=;
 b=PVV+1EcqP46Q8b55W8pZQu0Ra93sNfAhmMXDCEvw0jOzmqLOZAb/k410zhNUipzsBQ9wzml/rnLa6WkVRNWZjGVHDQADhlb6TDyOHcCwOFrWZhTlC30OINdCsIfpKV2ADWr4PqmiSYLuL2Rd4/20Gdlh06+L8oyMnBUObT4njqY=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4005.namprd11.prod.outlook.com (2603:10b6:a03:18c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Wed, 15 Apr
 2020 15:08:07 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 15:08:07 +0000
From: <Tudor.Ambarus@microchip.com>
To: <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for cy15x104q
Thread-Topic: [PATCH v2] mtd: spi-nor: Add support for cy15x104q
Thread-Index: AQHWEnuT4hgYqXhoI02IBeWilZMz6Q==
Date: Wed, 15 Apr 2020 15:08:07 +0000
Message-ID: <2197279.sbjyDCPTkD@192.168.0.120>
References: <20200305120242.1391-1-s.hauer@pengutronix.de>
 <11398746.sNIsW2IRu5@192.168.0.120> <20200415053527.GQ27288@pengutronix.de>
In-Reply-To: <20200415053527.GQ27288@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8079e825-e95e-40ca-3a81-08d7e14ece0c
x-ms-traffictypediagnostic: BY5PR11MB4005:
x-microsoft-antispam-prvs: <BY5PR11MB40054143D7C1839100D50E1EF0DB0@BY5PR11MB4005.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(346002)(136003)(366004)(396003)(39860400002)(376002)(9686003)(6512007)(4326008)(71200400001)(2906002)(5660300002)(14286002)(53546011)(6506007)(54906003)(66946007)(26005)(8936002)(66446008)(64756008)(66556008)(66476007)(478600001)(91956017)(76116006)(8676002)(86362001)(6916009)(6486002)(186003)(316002)(81156014)(138113003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MP9jhwMATcemPnnx1OPc0dX+xPoB45gK7Si3sUkT3xg/DnHaUQ6I2HmqKYTIkslQ2ZrW/AyyxvbitbHB039wgcbewaLl8NRgtbSxFHtQGA3C9FW3WnH8o0sfoOd2Om+pyLmYqToZZZSXp2v+znm1eYoAALax5LlGyaGfTJuj/MleGReI6YdLX02Swql4F1w8v8+QcO/tuV3zIKQ14vnvEELirwn+QgRMdNqxoLmtFM8tRSy8jYb00tvn+TrE774my54TEHWl3OFwqsqWZM+4BgG2U4rtWwNfRe7ZTUwhDKzztrP0KsF/b5Qp3XDHrPZfvNYbrdrwzbMNPoNyNTed7z4OvpdeD/JvFEzaeiEr3d94OoCCwb8ZQmS+vm7sdWV+ROoUwhQHVG6u/R0N5sBYxYJfX+tnK2a0s4Kbz3zkwptl4/2IBeCM2NWAJIdf7UpenTmhBZGiXWl3M6OCxcBr/BAssOSaoLG/wFv6x4I3Qh/b7gIUDu9VsYpOLvrDv5DS
x-ms-exchange-antispam-messagedata: zPb+BoaWmP4GlBKXVdWDQkejnxwqB1Wmvsa3T50uM1NczZ9Ghm8DrzSzPsut0pU3ERTUZJNDCw1XXWGsPr4bBW+8fiYBgsHRPXxOdrl4ATJfZT97vlZ1ptCr2puf01fSh/XrEjOxzQF33pYYzjz01Q==
x-ms-exchange-transport-forked: True
Content-ID: <E63BDDB89B0F20478BDA8B1F15A13613@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8079e825-e95e-40ca-3a81-08d7e14ece0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 15:08:07.5052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bo2FU4CSFvOyptWhxJJzreKut5EoR2j+REonIP06BOlrNT2It5ZndV06wCFYGHCUZ3tFkP/wUvgc+8o8wWS0JvvVG3RKKVPXKFZ3X5aE9Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_080812_122638_22A8FFE1 
X-CRM114-Status: GOOD (  16.68  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wednesday, April 15, 2020 8:35:27 AM EEST Sascha Hauer wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Hi Tudor,

Hi, Sascha,

> 
> On Tue, Apr 14, 2020 at 04:41:42PM +0000, Tudor.Ambarus@microchip.com wrote:
> > On Tuesday, April 14, 2020 3:09:45 PM EEST Sascha Hauer wrote:
> > > Any feedback to this one?
> > 
> > Hi, Sascha,
> > 
> > I'm a bit busy but I'll try to allocate time to review patches sometime
> > this week. BTW, we moved the manufacturer specific code out of the core,
> > we now have a dedicated file for each manufacturer (this includes
> > flash_info entries), check the spi-nor/next branch.
> 
> I see. It's in master now btw.
> 
> > I know that it's not your fault that
> > your patch was left behind, so I volunteer to respin your patch if you
> > don't feel like doing it.
> 
> Don't worry, I can respin it. You want to have a cypress.c file, even
> though it has only a single entry, right?
> 

I think you can add this as the last entry in the spansion_parts[] array from 
spansion.c. Cypress and Spansion merged back in 2015, they are a single entity 
now. The fixup hook is not affecting this flash, we should be fine. For the 
moment I don't see a need for a spi_nor_cypress struct.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
