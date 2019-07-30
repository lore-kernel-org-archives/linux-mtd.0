Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192FEC433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 17:45:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF0E2216C8
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 17:45:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IPv97x8O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=wavecomp.com header.i=@wavecomp.com header.b="S4rDSpaC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF0E2216C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6O6x3tnk8wpy4NnnhUw1Uy4bU3nOM+3HvHMXU0xWP5k=; b=IPv97x8OfqFxVt
	CMGkLuf6rsof1q+XBuTF2jQeOm41Y72G7Y+iVJAwrm2XLGrRpX2n9zTHqhrGaoJ65/cOmICI50y84
	Bnrm4pMi2hD2tpUHAKtPZ+by6a/ChYt3razULt4lgT/+EFf+KGHGMKSo7ZmxMJIOAVXDhWOdmkS0v
	5h7y8yfog2n/NmTBPgF2UUb1YR44JBe6+bZFfgJp5gjN2ay6jZCW8UHoAw7A4fKCTpbJN1sByFXly
	0xCplhkWEyqWMYNnuXw6qMjrDzsJ9DbluMyGMfx62RkdBcisUBup3UywKLnKHQCwDa3fifiSH50c6
	8EpSiSNDAzL/tWVw5k5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsWBw-0006Nu-E8; Tue, 30 Jul 2019 17:45:40 +0000
Received: from mail-bn3nam01on0727.outbound.protection.outlook.com
 ([2a01:111:f400:fe41::727]
 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsWAa-0003ee-1y
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 17:44:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRNsShTB3W2YN18KscRiezzbVRVOaHwU++9fONhjG4JaGD6ywGy4SZdIqMOgc0hiKhKZYDFqKG4o7q5lcpa9ynRSR5AqqxtwoPETYY13CTnKqsmJQAKPdn2gkDZ1R1zJPEodWHinxSrfcgI2kiEqjydujKpQDa58UHrE0N2ONJytvJ9f/uaIrCDQ6zNmbDmHzh19RC4ggSkyaLNBakgdtfsBUlCBL+1FsdhQ58nq73cRnXGA+vHa58kgTyWnnS8dfNlJpGl0fu7v7cu7a0uHTeY27vsVWOfBoSRQ1RmYoI3NQvuGNFr9LcwCPWIZwtwywWaZmtbALc/2mKhbiG7Xcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTtK0xexa6OefAxCOUkdSxG1tXcEDaHWIg1jxrq+2Qw=;
 b=m/VT+Hui31gkZ1+NXQQjKrlW4D+yqt967qZuFbu6J1xHc6DNqs2A10LjcMdfgRFbx9VbcueNnqNkbYZFZR4bCJEzPUU0BTus5vwBMms7bvVzK8+PkCc+bCe/DCCFsOhflAP41YmMWdtSasLygsZmA8r+wkd0yWXO5elnQr4H3lPavwxMfsrWboJYUzNkGL6WL541m2aihYYPIFzvZP2pLdG2lx+co7P0LNf4Cu0JyOuzlFKYCYoxVD3J/ggReVJON0WAmBNNM++RFspXYmd12Wo5cgjWkZzpF3l6OoVxNzILnM0y5SuH9vDTCQOfQ/qILAuANVxYQ1KpQyJX9gsgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTtK0xexa6OefAxCOUkdSxG1tXcEDaHWIg1jxrq+2Qw=;
 b=S4rDSpaCNgUAliugZ9qODEgD8cyc6CU5+nYX3+Z4Avkd2kiAcpfn/hkgAUSg30BamFdeteBYlpg2WDVFuGzC6Nx0Y1LCtjjJmuUjwj8sRVpWVHJdRN9y2B4tstrH0C4yARiFKpJQoMGnwcckMmrI3LKwNe6MhqCG8gsg2VN3a0s=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1023.namprd22.prod.outlook.com (10.174.167.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 17:44:13 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:44:13 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 09/11] hwmon: Drop obsolete JZ4740 driver
Thread-Topic: [PATCH 09/11] hwmon: Drop obsolete JZ4740 driver
Thread-Index: AQHVRv5msVS8eXHddUW+EWQ0JmG3sg==
Date: Tue, 30 Jul 2019 17:44:13 +0000
Message-ID: <MWHPR2201MB127717A25A015893A7BCB916C1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190725220215.460-10-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-10-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::35) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cefa3c0-4884-4b40-3d1c-08d7151588ff
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1023; 
x-ms-traffictypediagnostic: MWHPR2201MB1023:
x-microsoft-antispam-prvs: <MWHPR2201MB1023FD94F018FD52EB5182C1C1DC0@MWHPR2201MB1023.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(136003)(376002)(39850400004)(396003)(189003)(199004)(6116002)(53936002)(66556008)(52536014)(8936002)(74316002)(71190400001)(6246003)(76176011)(71200400001)(446003)(81156014)(81166006)(476003)(64756008)(6436002)(14454004)(66946007)(66446008)(26005)(33656002)(256004)(7736002)(305945005)(52116002)(186003)(386003)(7696005)(55016002)(6506007)(486006)(66476007)(99286004)(102836004)(2906002)(229853002)(44832011)(11346002)(66066001)(7416002)(316002)(5660300002)(9686003)(4744005)(6916009)(8676002)(478600001)(42882007)(68736007)(25786009)(54906003)(4326008)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1023;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wrjsRhYO4vUkdcevYoOPMGH4LmQ+yXjxc1W7WKNRtxI3t/S8HAeLqp1X47s+5RbKb8a91cbBReJCcWJtJHL/f3RoHku19srxbHMUDXhnV4BmObf4APQMHzdfrES+XLzFrBAhTP+m0Mpn5Qsk6NLIkkWVa/OKiaOURKfdtcfxuYl3l025KxqRfLIUQBd4BC2nPzRGKETSYRDmH5nABDVSdPlqQQuF8VwM9C9NxVYDc1FLOopIfKrkBlZOC4WxeFlfxSk14OUP0LBOj+PPD1L4Hh5WOJyuRW5kGhPnlthonzKIiKnyMjcurMu5Do3LLP/zTlK7RlQwV9aOz4NGwzREnZCi8FXhqT+SHMz+74UG1dUVnbox2c3Ex1w5FjzeG9zR2g9vUtdku7AnDjth04YAX6VHysQ8pG4wANLLj9u8mho=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cefa3c0-4884-4b40-3d1c-08d7151588ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:44:13.6162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_104416_138950_EF860FAC 
X-CRM114-Status: UNSURE (   7.25  )
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
> The JZ4740 boards now use the iio-hwmon driver.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
