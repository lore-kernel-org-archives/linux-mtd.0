Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29263C0650F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 17:44:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F16E32087F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 17:44:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tgankOWn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=wavecomp.com header.i=@wavecomp.com header.b="nryBVCHQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F16E32087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00rDbSfOvj8E+k+GEvJNuRpa4TVGLeJHuJuSetuQfGg=; b=tgankOWn9MAwnJ
	+N+V5ZywQI9C0la4H3sdKFU8AaJ808aggNw4ZWy/h37crIfalavg71Sb7w6ohBIxZEzIAbbhVp+kE
	OONfaU6sr6MNG/nfWLsxU2t4FLSWXm5tHzKGO9uTUkGj/E8oECddKKntx1bkWqUTUlF/VD+BrFszj
	WT4GMvI454QHjWYXZ4nkdHXQffEcYGF4dPtrRD5NMjJZrf6rbcljb/abguHOTybhOx1jnuO4FeCRF
	zo40wxucOJ10oBQ+20FKl4qm4/gzxyJzg5KMHpBWcbr1N8ZXkn/zhWKB40zl+itXKrzz/WDed5Yqr
	pUh1SAIo7OjI+MtPRVQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsWAF-0003Iy-RW; Tue, 30 Jul 2019 17:43:55 +0000
Received: from mail-eopbgr760135.outbound.protection.outlook.com
 ([40.107.76.135] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsWA7-000384-GJ
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 17:43:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiJ3XDObEosBmJb9GrW1LTY/kB81GehET/A5e3Ih2LZcyu8kLq2KnBNy/vWUx5g7sMai3FH7vQas+H/+Ml+N1GX8c+KPbfCpRyAZAfmzbLlYVbkJBzQTw0c2GQDktrvarSueRHLBQYTl5vUWe6ECIJWksVGtonv1dJFMUW7SCL8ME5UVT2wiXS21tu28GKe9IxHZJbSsqyQMLZACMLQoYbkrYfYnvTwJsnU7jiUhlRqp7UYEBenDKd+wYKsvkCMokrMe9pdEbj9jy4YMZVSuzUkC7YCDL35lcb7+PDWe1o0QMXqoyedllWTkXAsc1Ky1dsuFdVH+TeS/XClhuOzx4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+zjCxUAQD9m680Ix4UeeuF7K/eR3x6uU6kM5wHy3lI=;
 b=at0kFB58m1/LehSfq0sZLLtbb3QZkY/nASnykmK/3JzR5o32XcRbIYZxtdoWYdywNC8rKzUuB20F94iR6iTXJ9CLcii9J9b8WEb1OZnEUePp68TpLhId84zOq0vSV9Jqvjy7q0HbF1RBcWTIvnG160LbOV+TVTCD4z2euLuZ1eP60Zz7TlvGTot70w61SZrddtg2nrGs+xLYXyh4DodryjFd5X6IovnuCP09Ai3XRVRzZGyuOzHRtH0kf1syTIdrZt4F0sHiess8DnXJStquIulbF9EbpJ16AVfGW/D3Fdv9P/IxqGaIZg0XEzGjAPGoworLrM1ty17reRbOUiNgew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+zjCxUAQD9m680Ix4UeeuF7K/eR3x6uU6kM5wHy3lI=;
 b=nryBVCHQq310G+h3Mm8EjUngRt9l8qzTbYezSaauD2OcL9v0HMKjNxjPgNEynY9G8f7aiQW/Qjj9L11tCTn0Ye/W7HIAwAumHOfZYUpT9Fy9uExVHSQqILVdEL0Ahw8ufSBH9v9kCniV2fbYSVeGfYUL3zQ8menSAAYtyOmr0oQ=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1199.namprd22.prod.outlook.com (10.174.169.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 30 Jul 2019 17:43:43 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:43:43 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 02/11] MIPS: qi_lb60: Migrate to devicetree
Thread-Topic: [PATCH 02/11] MIPS: qi_lb60: Migrate to devicetree
Thread-Index: AQHVRv5UMJ/SoHC9Gk60MsTZ5BIvEQ==
Date: Tue, 30 Jul 2019 17:43:43 +0000
Message-ID: <MWHPR2201MB127750BFB9E4A64236710A6FC1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190725220215.460-3-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-3-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0100.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::41) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07b5ec6c-4cbb-46ea-8805-08d7151576da
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1199; 
x-ms-traffictypediagnostic: MWHPR2201MB1199:
x-microsoft-antispam-prvs: <MWHPR2201MB1199D436144EE4374D04D8B5C1DC0@MWHPR2201MB1199.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(376002)(346002)(136003)(396003)(366004)(199004)(189003)(52314003)(76176011)(54906003)(4326008)(8936002)(68736007)(14454004)(81156014)(66066001)(99286004)(6916009)(81166006)(7416002)(52116002)(7696005)(71200400001)(71190400001)(316002)(8676002)(256004)(7736002)(2906002)(186003)(6246003)(305945005)(42882007)(478600001)(64756008)(66476007)(66556008)(66446008)(6436002)(6506007)(386003)(66946007)(53936002)(26005)(102836004)(6116002)(74316002)(25786009)(3846002)(55016002)(229853002)(52536014)(476003)(44832011)(33656002)(9686003)(486006)(5660300002)(11346002)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1199;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T3g95IsMIEfxoGLC7iAz1B8kCaJZYtFUkYfld7Nn/4xmUWXPAOm3juEELq+kCPUU2X1dQ+Ue+UmfwJ7U7TDNUEG0Gf1pd+okWlpmJKmDzi8YwD7ssQbBW+F/LBuK5E1C37nNcwG6NiCNgFZucLdQYK3aYll3FT2pMNjgA1XM+ippcwcEQvwJ2x8bidRlHdOrJQWFxXMwBpP17weB1vu8dcQQGNZxz5CuWLvbUgkRehE7tZcpgXINHCR6/k7B7U+3RYLPNe00SijQqz8z4kfu6ANF3mzgnr0clctESS+aY1dHEj9VcLFMT+zhHVjy7T4QpjZBo99w5EBgs/S+U3/W4iWoPYLEGJff7bdDQu6Kq2juPOewF6QVK5O/XMRMumbcb0Gz16uBSEi4XwHt5zbacm7fB4QuOMZkRwvcKpbnAL0=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b5ec6c-4cbb-46ea-8805-08d7151576da
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:43:43.2717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_104347_544549_E1C63A1F 
X-CRM114-Status: GOOD (  12.82  )
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
> Move all the platform data to devicetree.
> 
> The only bit dropped is the PWM beeper, which requires the PWM driver
> to be updated. I figured it's okay to remove it here since it's really
> a non-critical device, and it'll be re-introduced soon enough.
> 
> The other change is the CS line of the SPI is now set as active low. The
> SPI core would have forced "active low" anyway, unless the 'spi-cs-high'
> property is set.
> 
> In the process of moving to devicetree, we also switched to new drivers:
> - We use the simple-audio-card and simple-amplifier drivers instead of
> the custom ASoC code;
> - We use the new Ingenic DRM driver coupled with the GiantPlus GPM940B0
> DRM panel driver instead of the old framebuffer driver;
> - We use the new jz4780-dma driver instead of the old jz4740-dma one;
> - We use the ingenic-nand and jz4740-ecc drivers instead of the old
> jz4740-nand driver;
> - We use ingenic-battery instead of jz4740-battery;
> - We use iio-hwmon instead of jz4740-hwmon;
> - We use ingenic-iio instead of the old jz4740-adc MFD driver.
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
