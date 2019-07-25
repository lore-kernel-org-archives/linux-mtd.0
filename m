Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D10DC76190
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 23:48:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60B342084C
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 23:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fHP8tJPX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=wavecomp.com header.i=@wavecomp.com header.b="QCa1aGtG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60B342084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ID4CxpLThzJoOXmIfiD+XE1U9vnuWZUN5y8mBdETG0c=; b=fHP8tJPXaMze0d
	EheB278fCdbjQmoBwoiA21MV0J3RLHQ/ig8KZJnir9eNIa1pECWyn+0BfrUe1ocMNe9l2UiXXLz0M
	7zMMR2FudDfkFdKLDXW48oqfKc8JwSrIUAw10R2sdf1Rlxj7hg52SkAh14DboRZXNCjzKiyz0NWs7
	3RPylRLCfDlcWwgRgQa+1X2R2bHzYUweXfxn8qqom63CrKaNo5m8wgP0WEC1WBg7lktuNtB8kZ51a
	wXhWS16Pb3jkgPhYyE7sLGLTxPRpu27X0UGg4QUWXgijilPElABzpnH7vvDoxoVgncFiTCnJ+UYqx
	U1bWN05jN6L9a60964rQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqnSe-0004Kz-0j; Thu, 25 Jul 2019 23:47:48 +0000
Received: from mail-eopbgr700101.outbound.protection.outlook.com
 ([40.107.70.101] helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqnSa-0004KW-2M
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 23:47:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiGRQXd8nlgpIvGf554PjweZhrBlt8K+l1TcfkHQjBEmAEZK2T7FFXXd2zfhEdWu/TEkn16vB7iueaPotCEelI793bQS8dGZkSdHivKFHT4DerVOVnm3HYZCaoT9NXp0wMttnek5xEXb/TQ/S9vWhJcqTNcSfFYc5jiARHgRWyV4HFkpIvCo62VyNWSWXkrDWb2BotSLkGRkuVGgkRc2tn2Qd2B6wkD6QqH1wuCHPV6agpzk/pq3V6Me/qjQAnlgIzfUlf0mztHxe+ep8+Jfi6zbSzLC6Y592VnSfGZPg6SJEnan+xHXPXZtrRTzWG8sNB4IYwIT2RV/Xb/bnHActg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wI2KyNQLE7IhRLZwhZv0udYhgOmLXOWv5ZIVnLBdQh8=;
 b=UGM8OBXVtThHbckw/Ttm0qcKpzBpuD6NOh1wnKoQRyCABNeJgPVGQlfepruYIJ1/Sg8SzHKpmjhAMZaVXuaBmpvd12hbsz6wJKun2J/0ZjUeM27G39wQR4mEhveCpiYEEdShoFAI9IqgBLM16pE0hIgXHkli/1NcKoJzhv7t7OKC7WQswHzM4wLDMYGmFx9296g5/Sqk+Om8Q3blm9HgvWtALnevVPSPTrs6efW8bf93Y1R/1NwVYU+Cs2SVVTzPV0CuGDGRu2q4rGlSjMmR5ZkXejtaQzKOeH5Q5HxOmsuG5ugqFkpS8C4qyFOFS/FCWhcpr9Sxc2Hawq2tt0rXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wI2KyNQLE7IhRLZwhZv0udYhgOmLXOWv5ZIVnLBdQh8=;
 b=QCa1aGtGfGRnOv5+EsHd7hnho1khRhdXjNTZC5r/6YYn88HUZSFtCnfxUoB54ai7jfUfM9BT6ks87ljlx1/95UxkHl2xitUWJq6Wn92cVRMTyIfPHfofX7oHbqIP1OWT9UTjZOdGBienZugfa2xCGR/5fID8U7LjukDxPS4ctfM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1503.namprd22.prod.outlook.com (10.174.170.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 23:47:39 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Thu, 25 Jul 2019
 23:47:37 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 02/11] MIPS: qi_lb60: Migrate to devicetree
Thread-Topic: [PATCH 02/11] MIPS: qi_lb60: Migrate to devicetree
Thread-Index: AQHVQ0NWCLVfx8mbpE6E+nYkLom38g==
Date: Thu, 25 Jul 2019 23:47:37 +0000
Message-ID: <20190725234735.h7qmtt26qpkjw3n6@pburton-laptop>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-3-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-3-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0026.namprd21.prod.outlook.com
 (2603:10b6:a03:114::36) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a3ef576-5f6d-4b9b-063f-08d7115a7909
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1503; 
x-ms-traffictypediagnostic: MWHPR2201MB1503:
x-microsoft-antispam-prvs: <MWHPR2201MB15030536C74C6D8B37D85931C1C10@MWHPR2201MB1503.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(346002)(396003)(136003)(366004)(39850400004)(376002)(199004)(189003)(7736002)(53936002)(99286004)(66946007)(6246003)(6506007)(81166006)(81156014)(102836004)(68736007)(76176011)(6916009)(26005)(186003)(9686003)(58126008)(8676002)(6512007)(52116002)(66066001)(66476007)(54906003)(256004)(6436002)(6486002)(6116002)(8936002)(386003)(7416002)(66446008)(64756008)(316002)(229853002)(71200400001)(71190400001)(25786009)(486006)(44832011)(1076003)(478600001)(4326008)(5660300002)(3846002)(14454004)(33716001)(66556008)(446003)(2906002)(42882007)(11346002)(305945005)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1503;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iSGvlzuhrUfH7o2YaKIXla9eXn/K/4/8jf/mNeKIxX4RDEG4gzC54Ibj4Jgnp7R+oq+1+xP0cwKpROSvpK0+xI9nNhPEDq26CCycbSfM7iHpAK4GpTa014MsRRhRSkCjU1yKE0KME5rxtOm/lLXWiNE5AuiYXcBy/zee1z/OTtVE4awlsuuNhQ3cSvEFej1pCOaaYblLJ79mnEdYg41Oi2HFLDnkkZ7Ut244N6FVv9zxZsJ6RqKe0//qsFom3rxEb8diKUgqgbESGaFFjvDTjJ9N5GRzgiXoRmX+rs1F2B/m7Rlj9pQETJh2u6wCDJg4q/necjY+sqf/6TdlbxId05iFN+4KVIlmh+OH+CpjlR+srV3EUp5JDwOVkTBkqovmE4GX32GzLyzAvC6e61ymiAlktpPvMHEdUIhiDFFvylk=
Content-ID: <D8ACA55FCC1F804CB7F8CE8CFDE41571@namprd22.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3ef576-5f6d-4b9b-063f-08d7115a7909
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 23:47:37.6021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1503
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_164744_167115_B9CE6638 
X-CRM114-Status: GOOD (  14.12  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sre@kernel.org>, "od@zcrc.me" <od@zcrc.me>,
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

Hi Paul,

On Thu, Jul 25, 2019 at 06:02:06PM -0400, Paul Cercueil wrote:
> Move all the platform data to devicetree.

Nice! :)

> The only bit dropped is the PWM beeper, which requires the PWM driver
> to be updated. I figured it's okay to remove it here since it's really
> a non-critical device, and it'll be re-introduced soon enough.

OK, I can see that being a price worth paying. Though it's possible to
include the binding at least for that in this series I'd be even
happier. Actually I see we already have

  Documentation/devicetree/bindings/pwm/ingenic,jz47xx-pwm.txt

in mainline - what needs to change with it?

> +	spi {
> +		compatible = "spi-gpio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		sck-gpios = <&gpc 23 GPIO_ACTIVE_HIGH>;
> +		mosi-gpios = <&gpc 22 GPIO_ACTIVE_HIGH>;
> +		cs-gpios = <&gpc 21 GPIO_ACTIVE_LOW>;
> +		num-chipselects = <1>;
> +
> +		spi@0 {
> +			compatible = "ili8960";

Should this be "ilitek,ili8960"?

Is there a binding & driver for this submitted somewhere? If not then do
we need this at all? It doesn't look like the existing platform data
would actually lead to a driver being loaded so I'm wondering if we can
just drop this until such a driver (or at least a documented DT binding)
exists.

Thanks,
    Paul

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
