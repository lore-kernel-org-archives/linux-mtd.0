Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D2AC10F13
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 11:48:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12FA52087F
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 11:48:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EkSfDbV2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="T97/miVU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12FA52087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3t4B1MhwRji65ImnkcTkHk68WveoOapWyoci7Ao40yY=; b=EkSfDbV2xQ7puA
	aBynCrkucBr1ioMkpl1SFIhxFUvfwdw2+ZkowVNyvuBPHJUzAq38EWo+qn3BD3+sFOeutd62CJNo8
	kLbZ4tcx+xYSEs7D1JkItWfS0GOMjkukdsHxetrHSy4lnpX/c0QJitVNnnL3pnTb9WI9vwDSgNnyb
	SivN0ZtWcF27X4+K/Ml/q/XDIbkde3BOUH+ErCi5qk+j4b2WwclYC2nvPRpcRMCBqCdrRzqAfHys4
	EbeTPB7aQxurWr9gI4pPUglPszCSgyGQBW/tGLNbz+u4LXBxOMTttUe7WF5WePT1VxiQ+FpyHu2nH
	BhJ5ozw/5OCQBP17xe+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDSl6-00065M-3D; Mon, 08 Apr 2019 11:48:16 +0000
Received: from mail-bl2nam02on0624.outbound.protection.outlook.com
 ([2a01:111:f400:fe46::624]
 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDSl2-00064q-Bs
 for linux-mtd@lists.infradead.org; Mon, 08 Apr 2019 11:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8WSg9nK0pRsGEhFb+Ulbkrvcco1fQwhruIWLM2GW4U=;
 b=T97/miVUVeRD8G1eagJV5R/3/mN8ExDkSA7/psYtfPk1GBqS11Pt0oXL0WvGcOR52LcmA8uDR2x5j9+YGYfkdywqrN85hYNb8X4UGbx/NhrHUXpi9LAMd8C4Jz+MWBPZ4sfWwkVG4w6KDZGqA8FNXYzEt8Zk6zeejE7EL7iIbbE=
Received: from MN2PR08MB5951.namprd08.prod.outlook.com (20.179.85.220) by
 MN2PR08MB5807.namprd08.prod.outlook.com (20.179.86.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Mon, 8 Apr 2019 11:48:08 +0000
Received: from MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::c561:284f:9768:a4af]) by MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::c561:284f:9768:a4af%8]) with mapi id 15.20.1771.016; Mon, 8 Apr 2019
 11:48:08 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Boris Brezillon <bbrezillon@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>, Boris
 Brezillon <boris.brezillon@collabora.com>
Subject: RE: [PATCH 0/4] Introduce generic ONFI support
Thread-Topic: [PATCH 0/4] Introduce generic ONFI support
Thread-Index: AdTjvjij23wsaI7kSFiEJjPFIWIGDAKQeqEA
Date: Mon, 8 Apr 2019 11:48:08 +0000
Message-ID: <MN2PR08MB5951DD5B4DC318D44E01206DB82C0@MN2PR08MB5951.namprd08.prod.outlook.com>
References: <MN2PR08MB59510D880AD3E92A7D4C12CDB85F0@MN2PR08MB5951.namprd08.prod.outlook.com>
In-Reply-To: <MN2PR08MB59510D880AD3E92A7D4C12CDB85F0@MN2PR08MB5951.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.81.56]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cfa208e-e170-49a6-132c-08d6bc1811eb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MN2PR08MB5807; 
x-ms-traffictypediagnostic: MN2PR08MB5807:|MN2PR08MB5807:
x-microsoft-antispam-prvs: <MN2PR08MB5807BCB35FAF5BAF24DCF1F9B82C0@MN2PR08MB5807.namprd08.prod.outlook.com>
x-forefront-prvs: 0001227049
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(39860400002)(376002)(366004)(189003)(199004)(316002)(52536014)(99286004)(53936002)(14454004)(4326008)(68736007)(476003)(25786009)(229853002)(6246003)(6436002)(5660300002)(102836004)(66066001)(55236004)(256004)(71190400001)(71200400001)(2501003)(14444005)(486006)(26005)(6506007)(446003)(186003)(76176011)(11346002)(86362001)(8676002)(7696005)(2906002)(33656002)(7736002)(3846002)(6116002)(105586002)(81156014)(81166006)(74316002)(106356001)(54906003)(305945005)(8936002)(110136005)(9686003)(97736004)(55016002)(478600001)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB5807;
 H:MN2PR08MB5951.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qG3Ijx/qEg3VWlucSdrMbdtc1kGBMjUiNitx4gtbl+4IkSdUszWMFojowWCeC0dG0Z4vyYrAcvfOf9rCnkxwuDVgR7STaof+PGq7/Ed+dlIbj92T04ruB9EwZ2l4T5aPYotIA/+b6VXIeMb4KoTvfGNDERUz4YJzLJb/v8kBByPBCIeL/ft/ACSSuOdpWdOrXaOvjYxg9X/fP82kllLu4yE+hC7B8BWdTV4LSVrqzgYglUsxGmC9O/gPpdZAfcnBA/3gRXJ9GpO6n6pxdpWybe7wDNAT7PhV+AxzLIVwRIHQ64yuV8rudyhyL3KuEG1K9BHhypPtuAaMkMWNz6jwqRw/9Y2H5ULPVv90PBbwWashrnITYZHqlatfKoAbz0e5QIYJzIpqOxYcF+K7eAQd6LZZOVEWpGJlS5x63LGxlRw=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfa208e-e170-49a6-132c-08d6bc1811eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2019 11:48:08.3648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5807
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_044812_420485_475D102B 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Just a gentle reminder that I'd like some feedback on these patches.

Thanks,
Shiva

> Subject: [PATCH 0/4] Introduce generic ONFI support
> 
> Current support to ONFI parameter page is only for raw NAND, this patch
> series turn ONFI support into generic. So that, other NAND devices like SPI
> NAND can use this.
> 
> Support to detect parameter page is enabled in SPI NAND core.
> 
> Turned Micron SPI NAND driver to use parameter page.
> 
> From SPI NAND side, this patch series is tested with Micron flashes
> MT29F2G01ABXGD, MT29F4G01ABXFD, MT29F8G01ADXFD,
> MT29F1G01ABXFD.
> 
> I created this patch series based on mtd/next + Miquel Raynal's new series of
> patches, as I needed some of the changes done by him.
> 
> Shivamurthy Shastri (4):
>   mtd: rawnand: Turn the ONFI support to generic
>   mtd: nand: Move ONFI code into nand/ directory
>   mtd: spinand: Enabled support to detect parameter page
>   mtd: spinand: micron: Support for new Micron SPI NAND flashes
> 
>  drivers/mtd/nand/Makefile        |   2 +-
>  drivers/mtd/nand/onfi.c          | 169 +++++++++++++++++
>  drivers/mtd/nand/raw/Makefile    |   1 -
>  drivers/mtd/nand/raw/internals.h |   6 +-
>  drivers/mtd/nand/raw/nand_base.c | 236 +++++++++++++++++++++--
>  drivers/mtd/nand/raw/nand_onfi.c | 312 -------------------------------
>  drivers/mtd/nand/spi/core.c      | 113 ++++++++++-
>  drivers/mtd/nand/spi/micron.c    | 109 ++++++++---
>  include/linux/mtd/nand.h         |  30 +++
>  include/linux/mtd/rawnand.h      |   5 +
>  include/linux/mtd/spinand.h      |   5 +
>  11 files changed, 620 insertions(+), 368 deletions(-)
>  create mode 100644 drivers/mtd/nand/onfi.c
>  delete mode 100644 drivers/mtd/nand/raw/nand_onfi.c
> 
> --
> 2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
