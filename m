Return-Path: <SRS0=4ZlO=BH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8571C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 12:27:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84E492070B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 12:27:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="byxwjV5O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ivvMKpZZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="LSrH1yfA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84E492070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=SnfU235bhmxTrNGMEOUeAjki3M6AFMdW5K9ZmrO8dyU=; b=byxwjV5OG9BGFGQBkV+ZjlGt8
	KppvJLmN8nKoRGNmSSNCIFKqnINlr422/1nchRvecJWe5RlMHXQaLqQ659LLs6pTvHruNKdSs7kpb
	nT1V4Amkg6GFchnese1f8Z7BV2L1k+IGktiG4rk99NCrof4VKUpzjLg7S+9YsMSwdgwyTGQY3Cpqw
	fwIFHqQXyLn7WTBsp4gYwKQGd5qi1Ikb2KpBPEoLD7NKPjLhoMrHA8S4dYhA4NfjoUF0XJeABLk7/
	uJwP8qHWw/KQkGMGw+oIMbX0MIpookNBoAJouRv+p9NY9CWjKUYV2HRgIdtGI9z1pNXyJ8G72MqxP
	qwv6VKnaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Ogm-0000NE-M0; Tue, 28 Jul 2020 12:26:36 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Ogj-0000Le-O5
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2020 12:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595939194; x=1627475194;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=ivvMKpZZQmgyMi/6j6UPcQaCQuquEcDjRGOH1T6MRzqCtvol0NL5GuEN
 ANvl29A1V378kKC7at0LU6inA82guRuJC4II5lvUYgDtZC01tCKNEgidi
 tWFhBISfxcXvhvQvDov3QqeGCVq4ksfh1yBz8SsVml3NROcLX9waxAYdb
 JrMBVLQUpB/LiB8Qznk1H+rzQ/jV1Vzul6uQfteO+tMVukuclNtHBAI99
 aqVW4Xgr54b0UbyeRY0KBrMM/ZYJAlr2yCcHfmRpMHGudkhwKuIct/+xN
 rtTY1GX6dRyHosCgCKoldy8f9ScbRGcdEPYkxSUUtFYDu1Rs49PSEOods g==;
IronPort-SDR: laqEaV+0GF3XeqnKL2Ca1NSMpxDsbtWMFX90l88Wb8l3NKD00Vx+J5QtOEFM7F7U4tG1JNnQ//
 bgF61VQ7GFdAiM8A7DCsukrWsJ6IiMWIZJPAb+Vvbpbc+CfWay+G9ctrhhvHcyMQMQk5sXwwO6
 o0V7EQmhcX3nRXgmk4fTjyAiAZSqytZkbBteBrTpVvrUKAwayBZZHHUNtzlsmXvEzxLeZqtSKn
 Z/uZKHVr9CE/yc4xwxgVpnV/2YvEQ2ae4YZUDYbS+oaCSzK912C2n4NRdaQlJnPtXku5BiB7zx
 vnQ=
X-IronPort-AV: E=Sophos;i="5.75,406,1589212800"; d="scan'208";a="147860120"
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jul 2020 20:26:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f20Jfx0J8Y4268qwaJ3LqRPUmNmJDXtZdsBZq3AEtDcX3JOKr+JnCjk4l3yI3t9E0ju9vDWyt4zu2HuIx1FXALDPlZmOsgT/eedt2Re1h8vhgUVRD4Abp9TYTh9oliiNs7hC0csAqr6h1eAiXYGaqN8/pc9VvV7NADBicp+tC7JuWJJOGY+eQfYC9QkxecHN9LUSASrPgFsW/ys/ebeyep8CrLUd68vduTzetKcLd8b6NOLUufH0tCQsZEI8x9Y4cgS2CdWzs9z23dVbBW5OKqye7hftGBRXKm/3abik4yvcAGpbU77oPKe5bYqxJEEGLqWAMHgaWjvPpbgteGkSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=WL61azz46xOo57FM0eJIz0yQ3+HIx3YMck4E4CBZoauJn3RlM5CBLqQXcrAhz6IKCO8/L/9omOwy5syKjABDQHB3SMHtHNCh3CclzF8N9HRRmnviUhWKOSWSwx/rNxu2XCmD7S4+kvmiPb+lCC3vZ9pPcTOb6FMNjxVe62CBodal1RMk3o/UQBj6UaXzewpPx45CqguQOZ02EOSsXS4zFL4Pv8Ym6A6AHLghqaKmYVPDgaE9vDf22dYLu811LQLkOVA+MGRBwiCcak4fTZPTHqyJG0jpGT2l4QDH3IfSMF2lTi1dXxeIQir8FacoeckoPpn/6ggaO2CfwyxKEL8bFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=LSrH1yfAUbvTUzmi4ptW70n2TaD7K58y4oo2WAYRm8Uyytc8DgzIn+5XBqXBT7gF4E5+RbS4wT+E5b94d7tYxjnXugHGoFUV4KIcGrJG7ld/MVX2iEcaDKvReex8KcAwPwSNdqnMwOgUoHksTVcOWQ6gGwz79rUwBbLVXkGbJjY=
Received: from DM5PR0401MB3591.namprd04.prod.outlook.com (2603:10b6:4:7e::15)
 by DM5PR0401MB3590.namprd04.prod.outlook.com (2603:10b6:4:78::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 12:26:28 +0000
Received: from DM5PR0401MB3591.namprd04.prod.outlook.com
 ([fe80::c862:9cd5:689a:8573]) by DM5PR0401MB3591.namprd04.prod.outlook.com
 ([fe80::c862:9cd5:689a:8573%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 12:26:28 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 10/14] bdi: remove BDI_CAP_SYNCHRONOUS_IO
Thread-Topic: [PATCH 10/14] bdi: remove BDI_CAP_SYNCHRONOUS_IO
Thread-Index: AQHWYYzpyCioqy45xEWUjYqj6zs+eA==
Date: Tue, 28 Jul 2020 12:26:28 +0000
Message-ID: <DM5PR0401MB359158A8461462BA1965C0309B730@DM5PR0401MB3591.namprd04.prod.outlook.com>
References: <20200724073313.138789-1-hch@lst.de>
 <20200724073313.138789-11-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 60fcadc6-39d6-423d-b1ca-08d832f173ab
x-ms-traffictypediagnostic: DM5PR0401MB3590:
x-microsoft-antispam-prvs: <DM5PR0401MB359035DD8826FBCF19DDB1809B730@DM5PR0401MB3590.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DNeJrGF18+rjdGFcv8Gd9GiCTGBx/O0+iAKv5WbgmxBqP4F06zUKlCRokzzAh+YR4CqIUFAJ2YaTZXMfNFPhmHOMqFUZ0QaYd83L3ZXGMLCTY0PvMLKFVUNB6vYG/G398j7HKbJZtZYJ6e4UV34lYdNksbTWw1O5J+76LG20YIc2TgrRTPOSAzumdjmkwXHtT4oWHu8IAUR6FxQFVh4lVQeHNFcMEkPcFelA+YzJU70ooS9/2P2nxv/DKRTVYfvPVRCESv/goKc+bPDkk4ociNQVXYESJGTM57jgfFkFI8J3YV3by6iEC1dRrWamXdfwmS6U0iNCdP1rerGp1EPDnw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR0401MB3591.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(110136005)(54906003)(186003)(4270600006)(9686003)(8676002)(8936002)(71200400001)(86362001)(26005)(7416002)(478600001)(2906002)(4326008)(6506007)(33656002)(558084003)(52536014)(91956017)(19618925003)(76116006)(66446008)(316002)(66946007)(5660300002)(66476007)(66556008)(7696005)(64756008)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /rI+ex+Ij+KJVHn+T9b3VTZgtoJGTsnYFvl6bqq8nTg8Ns355hktYSMF9CeYLbbunhGUKhemsqZlJAbJ3Po2hfDfI3903NyjtEqD8LpUWrv3I+jU6qdrcK/B3yAXJ5P6kKEtQIDDEake0zduOCd4dB1E/EEPUmSZSi+6w8J7Jfha10bzbYA49N7Mz3VOhVNE4R2rZQKezKBMXoMjfcHGSPkP6hPFzIVbRJX1WvA6AXl1wP/1ScymqQXuJ1DkwWpQhfmV8TYkNOpaiUGG4s9CUGH74vkjf4M7uMxa6rIr/s4v5RkL0JmL1QEKF19/c+2I3rmIYPRFeiRdcVUKmlSn8fFqqAbyoi469mJZ0TsQy8bfK/lgTj09mbgQvOksXD6LAcmB4dFxdWOUS7q01ocHCWa21Ssbv2s3Bj3hG+xB+tz2rlFAWb/0jRCrTyAyVExlKxtJ1mjXh9xXZ5gDaKfd77p+2KaTRIeTwi85zh8y8VPH4MLujYpW0NDD31Mz17xD
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0401MB3591.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fcadc6-39d6-423d-b1ca-08d832f173ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 12:26:28.0884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AeAyTh2unrTuXe68K1tDk8VrgGzI+H9VSPCbvZJAeo58+QMVGJRmS9LyryOEHeJCpwOa2zfyFWiSE28wSucXZEbVoONl1laetiAP/Iqj25M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0401MB3590
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_082633_989223_4DBA277E 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
