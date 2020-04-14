Return-Path: <SRS0=sS6D=56=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75A1C2BB85
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Apr 2020 16:42:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5353E206E9
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Apr 2020 16:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ijCabQCu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="w9YN5V2U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="cfKZ0xlN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5353E206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rvfND0LxLJNvKTI0B+a8phhtKP87pg109nI5/6Nlzdg=; b=ijCabQCulOHqW2
	mTIarfpA1jEW0QQycXrDxNn1pOpWv51/ftes3Y8n0TvyblQhMpmC+I/yXIfHQ7O2GQXCMtyioYVZB
	75o4wNvjPIWbWgd4fFrN+lVIBzFzP3z0NpsjjecBbfvZa4NucCHhOYlDp/75z4hTZjQes6ZZR4IHg
	H94Uh7dx4fo8e2UzKbUzLlSQFIIm7NKXiiU2fdPVSCpxTUte1ZdgLhFjItzrQJ3bOaN1+fwVWvUem
	yRZBWbq937aen4jLP1YC89xTshOQZ9/XIp6P6Hvw66R7FzKE5gcewnOEGwIGMfIqgLkooB9UBgUn/
	IekpsaG9xXO/SL06aDyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOOeG-0002gJ-JT; Tue, 14 Apr 2020 16:42:56 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOOdH-0002Du-Cj
 for linux-mtd@lists.infradead.org; Tue, 14 Apr 2020 16:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1586882515; x=1618418515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Y1JcFZ0pyNsgDGxxJ6Iiv4rUR6d4xOSm1TICSW527Xs=;
 b=w9YN5V2UYLQOi8u/+x2SIwKlRR1dUfVd2RwqFg54omZNQUA3DutE3PmU
 DYyG6NNT8c7+3GXPWXxtusmZGG0rNPAWQt4hGZf9anMQ7WPrcoUluD888
 wFGixrnGMJZLh0RomgcfNzxGp1r2j6j031g3s2N4gu8BPjecrzwQrRX1E
 Oj8jPVnIVTIM00lRr+9MIQhyk/OTVNbSkar2qOmCR3SH4/jq3HivR1r/e
 lI+LdonOK8Z0iz3BH/phGUqogVHDyZOrXDSE64gM20B95ejSRnt65iTpt
 FDK+AqYwaTy6DuYLNU3Y58w/HH+GmObuDiAr7VSf+VoL82twEvkyRiEAW Q==;
IronPort-SDR: kJkqQU1qiQHMfuZtBrS8exE6OR4+mYUR4XcM7R84WT8geLdgtNKHTPdHBn/GKyctLokDy585eN
 oS1oWG5oE+XJPyGg7vG36wYvx2vDZjW4mnvnq2w/ba+pyW5PKGZqku6hNlqQc7kozT98eyh4Kx
 FPvz7hMHbIUaHoQHvdjlS1Y/4C6N6m6zIpYJOYLmz7wFXOjfeVugqPTBNHDFNe9BK3f51VQCqI
 3Lhs54730Jj/+1mP/qEa+ZpHfwTeYe0LpG6e6+eAgQrvaqsWrACIsKVSKAPUGYaA38pT7ecEsp
 wWc=
X-IronPort-AV: E=Sophos;i="5.72,383,1580799600"; d="scan'208";a="75854826"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Apr 2020 09:41:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 14 Apr 2020 09:41:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 14 Apr 2020 09:41:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2HWkgGHznipeHFf4bGG44twwz9P5ahalWw7jES/L8K0Yvpdcy2cJsz3xifC6CjOjk1QzrK6Y/RhXYqjdOt/9mHs1e9rSWw/nrNDclKvGPKYym7I+zV/8N8P13BUQUZvHG/UTIQ1fxsvaDrz8EfVESc7nnL0lM6YpOpnAdLG70ktNjaK+PktHsUfdPbqKdDQ5JwxEwDaXGlzk6M8VPFsUWYagg6BXqbPxD3ToXtu6W37B6hTr3eyRswSvmllpd6F9Soi2fVAbWi7IWKFAk7Ypbhpb0pYAukHlSEd9znFiLu7RdnLUGzgXoxGqI/P6+bSKd31mF/0rmG67ittb1s5vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1JcFZ0pyNsgDGxxJ6Iiv4rUR6d4xOSm1TICSW527Xs=;
 b=VYIkU0+23wCvpONJaE1Bpov6wWQLg4O67w9oHScUJ9QqMbuPm+8eAgxV1a4yaQyabggXu2uqPYihCZNQKNRLeboKVp6PHD7KkIDFYCbVK2hVWAM9IChQ9y/Y6UNgJRQlRiZSkl8TnBqIYNCnH2JPpJ9hS2LKvPCGRAdyYQxEWXNd1cppvg1BvnqwsMg6j+fU4ARzy4ZrvM/fk1RcL27PEV/c0aACc/o8rW916h9k+3DIMz/8XMQd3EIkU3bNEuv3FEf+dQs4vGQ3QXJ8LFw7D2blEax68DYdsZzTBXDIStDuINLEvD9zDHYPGuLO3BURnWbVHeBC73JoW2MpAL15hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1JcFZ0pyNsgDGxxJ6Iiv4rUR6d4xOSm1TICSW527Xs=;
 b=cfKZ0xlNtM2etxe7SIzb1VviVpcJSaWWT8xDDFzoTjY6CxJ4iQrGMheS0a1XcdHmxXoFmjHth6MGwWNSAUqeX+crxa+GYRyZAIe2nCMDjDzMwyETkYRbyOhoqE6vJQGop3Xnadhe+Ccdd953lqEdq3KYuxKl+WGIsl+/G4oLh70=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4069.namprd11.prod.outlook.com (2603:10b6:a03:191::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Tue, 14 Apr
 2020 16:41:42 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 16:41:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for cy15x104q
Thread-Topic: [PATCH v2] mtd: spi-nor: Add support for cy15x104q
Thread-Index: AQHWEnuT4hgYqXhoI02IBeWilZMz6Q==
Date: Tue, 14 Apr 2020 16:41:42 +0000
Message-ID: <11398746.sNIsW2IRu5@192.168.0.120>
References: <20200305120242.1391-1-s.hauer@pengutronix.de>
 <20200309084033.8752-1-s.hauer@pengutronix.de>
 <20200414120945.GN27288@pengutronix.de>
In-Reply-To: <20200414120945.GN27288@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4583f96-b518-47a2-3d07-08d7e092b68c
x-ms-traffictypediagnostic: BY5PR11MB4069:
x-microsoft-antispam-prvs: <BY5PR11MB40697647DB7B92B10C0DEF2EF0DA0@BY5PR11MB4069.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:OSPM;
 SFTY:;
 SFS:(10009020)(376002)(366004)(396003)(39850400004)(346002)(136003)(14286002)(8936002)(2906002)(91956017)(76116006)(66946007)(5660300002)(81156014)(6506007)(316002)(8676002)(53546011)(71200400001)(66556008)(86362001)(4744005)(6916009)(478600001)(64756008)(66476007)(66446008)(54906003)(4326008)(6486002)(186003)(9686003)(6512007)(26005)(39026012)(138113003);
 DIR:OUT; SFP:1501; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZVcJCJIZLY11Pcl4Q+qi8NW/tsg5o+mrV0UAro626VTOxOXwCi+MHRenpVHU1stTL1yAWp4oeQiV1Xb5OCHSidj+4KS1XlkUeZyL2CziB1rEvsNmpsYeEDHb8ongYFIftUR9qd8ndNXxbZptSGRGo6WnwYwdsrm2fAwqGIuSeIPImk/vZ9szvrDKJpvTmTS4tRcqyHFYBXjHyQjUP21dtVN0XHtvgUcryWQzZjrWqegOrqcnqGm7Ft/YxIfKliRwb0OSkidQsjzmgqHEU6xnogiNpvujLPyfCqacECA13sLc/r56qk3QImHy4nYgwFQo1/kr0IIbVgdpsfGh3bwQWS0GcPKs7R6/PZI95Yv3YqHIREDbZNqm4joq60BCChDWh1yjSpDSHu0XlRXOX3Y9h3IPQQDdWVfd1J0jpNVpM0wQQrHIp9mXXgLazTbDipWY9n4GFJrQJ901ePkrK7iXa2gKsf97WkVCkjOJj3lwKa/MKzbMuVqJ2SYx4gbI5DETimNBtVvVvdtYjgZ9teSeP/OwEj1qr+q7kcbF77n3i/ZbcTI2KQlycEc257jvmG9H1VEujOMFVRE1ndubDXe/6LrKUK71DHPCQP0YMmlHRimrd/7nGYZ5orm2X49F1rU5cQRJXXJPLWwq65bqeHgtV7DZDLZOPktpPDkLtLix9fDjdXNoaumkyfYfDL47OHZdUFsU7qD/AyPr0H5ry86Q/qsfXYqy/N/ze10E8PuhgGJbPPOAHEWnWTOgJbuZyGh5fIb2rmxb0cA9CJcdxgspqPRzlNDb706MjyJB9sc6HB4=
x-ms-exchange-antispam-messagedata: bHsBi3YMcQ1E0yxFww5I4A3JF1Yj/OpR/l+oKbrIZUYT6uR4RioqAWS5ycEQIHch5+v0xbyLghu6I+lCQb4S2a4wtCbBOh1MyPiIUuo2qj/ZGSqqmuRhoNtZ+JZMld9vUjvV/W2V6adSCUUeeeFCCg==
x-ms-exchange-transport-forked: True
Content-ID: <E7D85AC18A4EE34AB5297AB3AFDB408C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c4583f96-b518-47a2-3d07-08d7e092b68c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 16:41:42.7416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y/Nf9MU1Dc9B20YVJYXzDgFsD34cSbAFWPCKjK7E/Y6R/a0OrxbVn52vG6kdw67srb7QRr43f+8TWBR0HaKZQ54B16sTKMyvfe239Kv+g5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_094155_614460_F5392B46 
X-CRM114-Status: UNSURE (   7.96  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, April 14, 2020 3:09:45 PM EEST Sascha Hauer wrote:
> Any feedback to this one?

Hi, Sascha,

I'm a bit busy but I'll try to allocate time to review patches sometime this 
week. BTW, we moved the manufacturer specific code out of the core, we now 
have a dedicated file for each manufacturer (this includes flash_info 
entries), check the spi-nor/next branch. I know that it's not your fault that 
your patch was left behind, so I volunteer to respin your patch if you don't 
feel like doing it.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
