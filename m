Return-Path: <SRS0=p/wV=5W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49264C2BA18
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Apr 2020 05:31:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C4AA206C0
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Apr 2020 05:31:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ujznbYc9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="oSS1hVmx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="f1sZnWZ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C4AA206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BYJ7up9OgLRXUuch7SjxWLJPgeFwWK8xZmtVqLphl8=; b=ujznbYc93WXF4t
	cRV4z/IFcwHr6gho0MuFfXvGFnyeowhMZfhnOWtHE4WW658mvg5omxlusKqeF4hdSx4+jfUk4/eaW
	ZeKQrhK3T+af1xwQb6laZHKg39QLEZtJXhj6votFyjGolvb7xjx4DucwgIJNtuvPbwYOYXwhuik1g
	tnN8NfHNYEtqe4f/uEFQpZ+tc+wgZKdIQabPs3T1fa+RfKL4CiBsPE/xCuaJnC8d7s5cXB2M+S11l
	8hmMqX3pHIXDx+77JSYG9sV8cY0D/Kpgj2MAEqFoxa30rXBsey9mcViPu6E2YNM/OzVjb6WaDZ+9F
	1+If9f9t8IRBg3aRIlPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLKMM-0006Vw-Un; Mon, 06 Apr 2020 05:31:46 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLKMK-0006V6-49
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2020 05:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1586151105; x=1617687105;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rEVo8awS9PFxy8otrsqLyO6CH4zUofRhBdNyX92y23U=;
 b=oSS1hVmxIuz1nBWJqwInpbhk+I4UpFOP6wCAi2eUa3n3P9+Rh3Bh0V2G
 lOKs5DM0CeM8Sxi0xuNkPOxMTB832wv6r8LaWsKee1FHTT6XRXIIihARU
 /3oAoCAE3JlRlHD2xxNpl13DdE71cTAZQLXEe95mo/cCAnESknMSicwbO
 gomXY1Xl2mRy4NAbp5dA5TCoMkOOiPQTMa9vuDBh1MHl9sCspa9XCXOaT
 kvJVZ2fBYIzThLqNKSart/Z711KgfxCJp3bD1kLtKsh57+xklet/M3taf
 qlzpt6LIVpzhlHAJyj+q0XjG08HMHNi5KAquChR8iPW1mbJfvVhftLrr1 Q==;
IronPort-SDR: Vg0wVTbzaigO/dFugHiQG2x19oTzlw17Xx9x2EIi3YCp+rF6BXEqc+o8pzR1Xze4DQcn49Gpvz
 6fcnz6XeoQh/sjsnjM9jensvWtWgHHdALGpiIukPPxWF3QOM0k8P3fo7p9W6R+8/uOQKwi7z7H
 V+p8d4cOUTO91QNLTpwZLXeMR22Oq9mwzm9C7P3vamcBp2p++lXm4qnVb7pbUiS7epYkRUbGJX
 q25ZbW7Cgo9nJEQhS7f/8eNRR3RAYe7q70+G1j7hSk3YIGVZfwxHmjjT5XvF7dpELgz1ZJUl4L
 aOQ=
X-IronPort-AV: E=Sophos;i="5.72,350,1580799600"; d="scan'208";a="71508858"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Apr 2020 22:31:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 5 Apr 2020 22:31:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sun, 5 Apr 2020 22:31:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8LXu9us0iuHPD+ZG2xNAZani2WC6JcsVjZmKO4oHQdQ+YKOQrFg4cUVVMqZXWUrhA7XVmJokTGRPz6AiTybO35HXyc+CH5ICRUEqhqGqZcaT++kqAzvTP96mHddYfI5gNAKiUKHacabDABNyQtzI/032ZbIdchBSwSRmua+gZL007sMVrxcVnTA6M1f0LPj8B2x1Cbm1NyjDTCC1WDhekUw66BS0T3suKZ9GqMvXZ7ZGnYBQOM8Z+0PXhU+jIugos4b8gmQNw+virEwWZ777jxhVVIBUlHS9qqzFrBA4wyTKEjlYC+ujsD2Rx3jN7ZzLP4OKkaMCo202SlZrnjFMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BKY2ttueTi4th5yzdv7hEFWGPkw9ZzF+mkmvNrhYL4=;
 b=hxtHFlH5EUYwhHbn+pf0xOyhKR0dTbs3Sj73EXNQbhYjuJAFXm27KzO/KrOkd13NpXMUrCq01Zmkn4hkjbJoSp0tTNm44SN/PWU1rYxo6vww71HX9/CS+AiYjHwWVSJx0XO9Y5y6u6ubJ7qG+MrLyXSST6rUV8nL/aj4JthmC2Ehguy6xnbjQhWSAEQyuufG3vW65MMZL2xb1FhYLRfgPT2UMjFTp4/JLOlShzFfSYgW0oGLqwHSElRm167rmQsFBb6EZBj16gdjS/G2Tt+5If70ZPtQig926gDNuf26f3EdbzUH58RfJQ6v7XgOHIf27rYs3/kM2RtsGB5CbOtIVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BKY2ttueTi4th5yzdv7hEFWGPkw9ZzF+mkmvNrhYL4=;
 b=f1sZnWZ91Kt95Z+gh93AuClfOkMevRCoAn8y/knj9SDq7cSYFyMIcffIEMPTzJywa3AyMG7xOGHlPu8ORp5STyWol90tP18Hb/SXMDvTLXrOwcQm+ciOrD+cvCOQHwhYMXCQ2sL+xjhukw64PdUwcbDe3T1yI2BdCI7bstJb0es=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4258.namprd11.prod.outlook.com (2603:10b6:a03:1c2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Mon, 6 Apr
 2020 05:31:33 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2878.018; Mon, 6 Apr 2020
 05:31:33 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>, <linux@roeck-us.net>
Subject: Re: [PATCH] mtd: spi-nor: Compile files in controllers/ directory
Thread-Topic: [PATCH] mtd: spi-nor: Compile files in controllers/ directory
Thread-Index: AQHWCpbheDXg/soJeESDZN/ft7XJMKhrlBQA
Date: Mon, 6 Apr 2020 05:31:33 +0000
Message-ID: <1671412.OU26QM6KFd@192.168.0.120>
References: <20200404153631.103549-1-linux@roeck-us.net>
In-Reply-To: <20200404153631.103549-1-linux@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0fcea1f-118f-460d-7ed7-08d7d9ebc4a2
x-ms-traffictypediagnostic: BY5PR11MB4258:
x-microsoft-antispam-prvs: <BY5PR11MB4258D4153DBBB872B14924C5F0C20@BY5PR11MB4258.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0365C0E14B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(346002)(396003)(39850400004)(136003)(366004)(376002)(110136005)(66946007)(64756008)(66556008)(66446008)(81166006)(66476007)(53546011)(6506007)(5660300002)(76116006)(6512007)(478600001)(2906002)(9686003)(4326008)(4744005)(14286002)(6486002)(81156014)(8936002)(8676002)(54906003)(71200400001)(91956017)(26005)(316002)(86362001)(186003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lvieLi75VynzYNZgi1cdOMmHEprRKoOpeE1MGEln9wVtTVhh2jjyuHp00zc4U197xIY9u32xBaJVVbceKOPkAr0VfYDQ+dFtb10VP0jQE7syzpTe6TvSfHQuGuf+UhU4McapQqxYguS8uQbSTzBz5+ZbUcsUpJixOiYrH1DFmUx37tHauHwGccY/Sk/PAMy2ZwiwV8a9AMyGds+HvBJePZBnviaChd7TqENh7kTBCd+pTjP/7MrfgkK+VYF2hp0Sm6EglV3/UPC8Ea6X6qwl3YpdIJfmH2ZjgsLaTHzlPUeeoRgG6V1heYv+Fe/C9sQTu2WA506zYPxID89aOHK+vlhz8GyvKP0rMZcB+rIX2FBEfUxMF0lvhLNHVggq2bdrwbCa+y/O9Z8MAkh0wi8JBk/NROYv48/sSvPjINlC9qA2vK6ZEwFvD03rJSN67Cp5
x-ms-exchange-antispam-messagedata: vqJ8Uf/wsjpTR8OhWc6pN6XGRhO2m2FWAbvTRStkI18XZqNz3aqeyXeYAZjn5VgflbVHo09wPMyNC7z7iOwjt6ExAXnxZ6Pf3Aole6bJyfI72KV0yancSuzURkzN7jx5kyopMem0/1eiW/ewY1J2GQ==
x-ms-exchange-transport-forked: True
Content-ID: <099568A3620FF145BBF31887C201726E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fcea1f-118f-460d-7ed7-08d7d9ebc4a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2020 05:31:33.4081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MTibZuLHc+F41PIcEhZ9aVLiCGwe5QXO4Bo5SyPW9M/MXsAZeGudMNTBzsEr0pFw2grUf8bKD6vVJ/e2hpKsnsPOxB00Z6IWhq/kWUtcw8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200405_223144_174420_BA0A030F 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Saturday, April 4, 2020 6:36:31 PM EEST Guenter Roeck wrote:
> Commit a0900d0195d2 ("mtd: spi-nor: Prepare core / manufacturer code
> split") moved various files into a new directory, but did not add the new
> directory to its parent directory Makefile. The moved files no longer
> build, and affected flash chips no longer instantiate.
> 
> Adding the new directory to the parent directory Makefile fixes the
> problem.
> 
> Fixes: a0900d0195d2 ("mtd: spi-nor: Prepare core / manufacturer code split")
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/mtd/spi-nor/Makefile | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

I missed that somehow, sorry. Thank you for the fix, Guenter!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
