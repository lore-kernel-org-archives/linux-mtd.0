Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE0FC0650F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 17:44:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07EF6217D7
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 17:44:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pb1NW3wL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=wavecomp.com header.i=@wavecomp.com header.b="OcnPDdsj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07EF6217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JWBf4SvKJZ7S6fN67eBeNc659BzkX13H/5Oar9vi9Y=; b=Pb1NW3wLX5NUun
	NiS8/ko9jscxDF78YW+Ok9OKWbfWL6wUMwCl0D5Fre8SawNNZjrjWDS/6oxqRFrhLMQxm///ObYha
	3qrwJn/yC9zyYnDMpJ4CtMUu+gzfKSfSczvYHC9TvYEvBDXUreGa+tu8/lc9UkFMYz/WUYReQwObD
	98v9q6POhkgWLGI7TODTX9dWEq5Z5QV11i7381mlRGvSPnTdiMC1H9VmDd+g6FgjszrFTX8O2Dtt/
	t+dKR+pusgVJbbBLgEcvBMnarZxpMWFKKq7gHYvSNfoX5w1ips+q4eIKbnwunstIqqyL0GHlSxWIk
	K6xEzZLzX5MsljFs9GNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsWAu-0004Bc-F0; Tue, 30 Jul 2019 17:44:36 +0000
Received: from mail-eopbgr680134.outbound.protection.outlook.com
 ([40.107.68.134] helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsWAH-0003Ke-Qi
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 17:43:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMP/QzEf0VuM8IWrafKDINk2T2z8GcNmrl/jLx+tqT1e4twES5/j6xU9gbDovhzPkJEzE3dHhWz8hXJh8j/YCGquJ2AxXJj0rwaEo+UgL3TPTgDUBxThTNfZIj165O+7Oh+hO7UXT08XH7lPhbCmWpyRB9howdqRvBB9bxyNy6KFq2FfS2WRUw4g8ye/RyWpV+407aQMIqM0x0I1k6/jwqzBwgvHqFVHq6tXWJKLDOOo4FDhptn2DecMENKNSe+K3GrnMUhECGgYcCPcTVHFSt+g2B0vcNFpTG0KPcbJ79x8RMYdE7OftnP1n9sMm419FPRHd+u9KMXEmG15n8LHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1azvV6eumHiivRNRXM+PnIWYwe38H2lX6HYhZSS1cZE=;
 b=I8avp2QAZ1jZRi6bFsduVEuFD1m2wpzcCvxIdj5GoeXzioBOD0E5316XDY1VL4vA6RunmKt1xmEB9IuTSdPVCv4LKiv1ACFqqnPOpmDzGiBADFtCIuhSsJgZmH6+PgMTDNNkNXj4D8NJykPj46u2L65eRI1PyhF9U4AHyswcBHxnQ7G6r2SY6Fx2Ns1+sfC307BT2oJWG4bRQMFQgnapB+Y2Ooa+3WFzpbDRSJeM33meDbBVSH6pYA7JZxo50aGHvagGrkw8U8R4u1XixoKuW5Ze2otPuPWk5Vat7fH+1CvsdmBgrQ2ubDupqxQT8mAEf3qpDkv8F+auH58Kkb8pHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1azvV6eumHiivRNRXM+PnIWYwe38H2lX6HYhZSS1cZE=;
 b=OcnPDdsjNKjfyy7uQE0AHgEgMRQ/VUHeMomHztiPQfldzNSfxNQOqUj7BMZVYiKonBrRT8vxZZhlRjhFANMRll5gzLox/CSL9KuPpjKdcrcVtoh/8rSyedtJA/RBlIWtUiTQfclgh/VgoO6EERNnxtpEhSubXPjSQ/ITOiKM0vs=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1088.namprd22.prod.outlook.com (10.174.169.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 17:43:55 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:43:55 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 05/11] video/fbdev: Drop JZ4740 driver
Thread-Topic: [PATCH 05/11] video/fbdev: Drop JZ4740 driver
Thread-Index: AQHVRv5cl8/uMpmuRkq+nlYbqst7Og==
Date: Tue, 30 Jul 2019 17:43:55 +0000
Message-ID: <MWHPR2201MB1277CBFBCC5B2A7DCE8CF2E6C1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190725220215.460-6-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-6-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0055.namprd08.prod.outlook.com
 (2603:10b6:a03:117::32) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85b3a80e-1ec6-4c08-6a37-08d715157e5a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1088; 
x-ms-traffictypediagnostic: MWHPR2201MB1088:
x-microsoft-antispam-prvs: <MWHPR2201MB1088F07BB788CFC3D02B6689C1DC0@MWHPR2201MB1088.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39850400004)(346002)(376002)(396003)(189003)(199004)(7736002)(6436002)(52536014)(386003)(486006)(74316002)(6116002)(446003)(9686003)(11346002)(305945005)(5660300002)(55016002)(99286004)(66446008)(66946007)(53936002)(64756008)(66556008)(66476007)(4326008)(6246003)(25786009)(3846002)(71200400001)(66066001)(71190400001)(7416002)(8676002)(6916009)(76176011)(81156014)(52116002)(54906003)(186003)(44832011)(229853002)(476003)(4744005)(8936002)(81166006)(68736007)(102836004)(7696005)(2906002)(6506007)(256004)(33656002)(316002)(478600001)(42882007)(26005)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1088;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: b+5ViTJwLuKjsrC+C+h7lXppVG7wuPQ5cK+V6fKypF6ety+vnnNDd2CY+xAQiEXH99LqgBI3RfBRg6KRhbF0kfM/7qJwv41JsMzPUXEAkGRRnfcok6zY47KIAnpQAykI5I7Un6/UebpkuWO0VYLe3OjI9JOH+aHzExc2ulKohUIAKRkL5fYFZw+fQ50dr0X26lCje2oVYdniz4caCI8ighNS5yNLVfuMrP5XoE2/f2+OmRR+Nl9NP6uNCl8gJGPzpPaKdzOssbvK/BtfJFEdTXMA4g45jIOYjgmp+lqyuqLu8bl95M7PPj/NsHFR8qvD7npLoe7T1UKjn9Apy8lXzev3mj2L+mUNw4xa8/oAFJKKOaoXq0xdkgJvsg+KWccaq8jhgYVug1P59lFPpgQRY62mvtDe6sB7RYdTBVajs3s=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b3a80e-1ec6-4c08-6a37-08d715157e5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:43:55.7367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_104357_917705_8EB14A42 
X-CRM114-Status: UNSURE (   7.53  )
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
> The JZ4740 fbdev driver has been replaced with the ingenic-drm driver.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
