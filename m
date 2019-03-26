Return-Path: <SRS0=gzro=R5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54807C4360F
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 10:52:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24B9C2084B
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 10:52:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l5DYoq1K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="Bi3K81Gj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24B9C2084B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ssrv6YQlfFXw/H4YEh0aaBzR6XHpRO5RwNvkpNcgAY=; b=l5DYoq1K8rV9tO
	KBHeybe2HwDXYbYsKHxzwbXaG6y5TNH7wGEk5Ynljo/CBd3ejo9ngMp+twQSKEwcIRTIA+LtH+VF0
	LvmBbysKtHLTNI9NHvvCl39M81I11FW1cUYOMVxLswQiS2kK6FZSId8hgyQU2jb9lOltHkb3onNLs
	04C0bMhQOcYE5TRCVfp6vAalkofBOQhpd1H8gGWrEN2Dhn3QCZZB9Oh+lzuFdSAWRaTnLhdHUxb9C
	p5vx11mOVEyocY3AEHhads8QHCinDjnoEuS1oz6A2oAJYAefWNeJFlqD7LGHHW3/19ZqBi4rwDfQJ
	Jyt8Y08H50iWOEhlZWTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8jgg-0003MD-DW; Tue, 26 Mar 2019 10:52:10 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8jgc-0003LF-SW
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2019 10:52:09 +0000
Received: from mail.micron.com (bowex17f.micron.com [137.201.21.111])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x2QApl2J032408;
 Tue, 26 Mar 2019 04:51:47 -0600
Received: from bowex36e.micron.com (137.201.85.221) by BOWEX17F.micron.com
 (137.201.21.111) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 Mar
 2019 04:51:46 -0600
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (137.201.84.23)
 by bowex36e.micron.com (137.201.85.221) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 26 Mar 2019 04:51:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBKtfCahZfMK4e3jnlv9SRMsW+VKBTYTk6nYuxqKTo0=;
 b=Bi3K81GjtVfpHef1zoBni2Wx9IQLHWB0b6ZulWa7kMl8iXMNoxQdzGMTGtd1skfI6N9jNepgFgRztaSfvkUlculp3e5vathmsImSSZldvrxImfw6zzZ2Yt6x2mzGzMnl/kVl2HeZIFAEG3cLBA6xngajxwRVPCZNk/mZQ2b2FiQ=
Received: from MN2PR08MB5951.namprd08.prod.outlook.com (20.179.85.220) by
 MN2PR08MB5838.namprd08.prod.outlook.com (20.179.87.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.16; Tue, 26 Mar 2019 10:51:44 +0000
Received: from MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::c561:284f:9768:a4af]) by MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::c561:284f:9768:a4af%7]) with mapi id 15.20.1730.019; Tue, 26 Mar 2019
 10:51:44 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Boris Brezillon <bbrezillon@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/4] Introduce generic ONFI support
Thread-Topic: [PATCH 0/4] Introduce generic ONFI support
Thread-Index: AdTjvjij23wsaI7kSFiEJjPFIWIGDA==
Date: Tue, 26 Mar 2019 10:51:44 +0000
Message-ID: <MN2PR08MB59510D880AD3E92A7D4C12CDB85F0@MN2PR08MB5951.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.81.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1fccd8a-185c-4b0d-03c9-08d6b1d90994
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR08MB5838; 
x-ms-traffictypediagnostic: MN2PR08MB5838:|MN2PR08MB5838:
x-microsoft-antispam-prvs: <MN2PR08MB583853867331E96DAE997B85B85F0@MN2PR08MB5838.namprd08.prod.outlook.com>
x-forefront-prvs: 09888BC01D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(39860400002)(366004)(376002)(396003)(199004)(189003)(106356001)(71200400001)(14444005)(478600001)(7696005)(71190400001)(256004)(105586002)(476003)(53936002)(25786009)(6436002)(97736004)(2501003)(9686003)(8936002)(186003)(33656002)(110136005)(81166006)(4326008)(8676002)(26005)(81156014)(102836004)(2201001)(305945005)(6506007)(2906002)(3846002)(6116002)(55016002)(5660300002)(99286004)(14454004)(486006)(86362001)(7736002)(66066001)(54906003)(74316002)(316002)(52536014)(55236004)(68736007)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB5838;
 H:MN2PR08MB5951.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: E7MINXQK2v0HF3qhd45/tSbRDoL04Jol6Hp7xBXI/xdbFC6HziKoYD1hdWecuQ4/8e6B6AbTFaQI1vxbuw09DOtggBSaY5lSIVVtFgtQ6c0LHsvKdLPwbLvpuakZXg/LLjag7K2NUDvxwLK9W+YuKQ/vDqeZF9u40uO1kqfexPUE8zRM+9qx/YSbbem61y2MTS7ZK06MfkkcBnFDcC7eV5igOuxrfHbgnLTHFSkLev1/EWDF04idrvNkbqolYJXASJgTFHpG+/CE4j6EoHDe3DAOL6w4jmm+CxBfebl9wiUpi5gcTiftzGUioljKx1wAojKhGQb6r9uyrvZ5C/iVahU3Lw5kiua9kmFzZquQ1CasTuSdEdYKEiIVqXCcMBFVq+EqwzSR3xSrIluaBjYKlzXui0HVBitr6obdP1VlK+s=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fccd8a-185c-4b0d-03c9-08d6b1d90994
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2019 10:51:44.4707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5838
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24512.005
X-TM-AS-Result: No--3.483400-0.000000-31
X-TM-AS-MatchedID: 150215-105640-704156-702358-113289-708060-704425-702126-7
 00038-705450-701604-700648-700016-703529-847575-148004-148007-148020-148050
 -42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.82.98
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_035207_154221_00FD3563 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Current support to ONFI parameter page is only for raw NAND, this patch
series turn ONFI support into generic. So that, other NAND devices like SPI
NAND can use this.

Support to detect parameter page is enabled in SPI NAND core.

Turned Micron SPI NAND driver to use parameter page.

From SPI NAND side, this patch series is tested with Micron flashes
MT29F2G01ABXGD, MT29F4G01ABXFD, MT29F8G01ADXFD, MT29F1G01ABXFD.

I created this patch series based on mtd/next + Miquel Raynal's new series of
patches, as I needed some of the changes done by him.

Shivamurthy Shastri (4):
  mtd: rawnand: Turn the ONFI support to generic
  mtd: nand: Move ONFI code into nand/ directory
  mtd: spinand: Enabled support to detect parameter page
  mtd: spinand: micron: Support for new Micron SPI NAND flashes

 drivers/mtd/nand/Makefile        |   2 +-
 drivers/mtd/nand/onfi.c          | 169 +++++++++++++++++
 drivers/mtd/nand/raw/Makefile    |   1 -
 drivers/mtd/nand/raw/internals.h |   6 +-
 drivers/mtd/nand/raw/nand_base.c | 236 +++++++++++++++++++++--
 drivers/mtd/nand/raw/nand_onfi.c | 312 -------------------------------
 drivers/mtd/nand/spi/core.c      | 113 ++++++++++-
 drivers/mtd/nand/spi/micron.c    | 109 ++++++++---
 include/linux/mtd/nand.h         |  30 +++
 include/linux/mtd/rawnand.h      |   5 +
 include/linux/mtd/spinand.h      |   5 +
 11 files changed, 620 insertions(+), 368 deletions(-)
 create mode 100644 drivers/mtd/nand/onfi.c
 delete mode 100644 drivers/mtd/nand/raw/nand_onfi.c

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
