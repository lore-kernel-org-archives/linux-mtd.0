Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7485DC04AAA
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 09:42:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DAC420830
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 09:42:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d7dkg62e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="OQ7yN5RX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DAC420830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j2BEQl1hZ7VFipCbe8NQtBM5yWq7EjwDN71fWanHtlc=; b=d7dkg62ejzwrgF
	vpQjV7s5C1H3MFF5pcX5pc4stIZn3SeRi2G2NXYakJzbo/AuqlDpSk/ZPqoRNkqBLdQZyYEzrHa3r
	7oXBM2+txKJNsuhRD0hYMbvewf0hd5wpWsdpyc89vSWkJF0RXHN+k6x0/e9R/5yjB5VbNfUZ19Xhg
	5CbWdMpStfVroHuTpK/J+mQMY3DlpGECK6FTViQjxb/xiEy6xGRmQX39/l6oLFf8JDFvRnf6SZ5Ba
	MzgNxNNng2va0SX63rfiVuKx1/5UEzYP4PC2IaNK/UZXGIXsImJtDQ6wkTg9QtyNIlD5eRho703Kc
	enkmS2dOjlAB/BHFJTcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNa8a-0005Bo-4T; Mon, 06 May 2019 09:42:20 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNa8X-0005BM-3H
 for linux-mtd@lists.infradead.org; Mon, 06 May 2019 09:42:18 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,437,1549954800"; d="scan'208";a="30215431"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 06 May 2019 02:42:15 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.38) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Mon, 6 May 2019 02:42:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+Q6gTTAe7xtobusGtwdqvfbpYaSWIXJTN7paPCeiks=;
 b=OQ7yN5RXxselppXog7qI80Zy6FMu8aail6ta0pCqAjnTRCpaooHDI6qsMOosyChAtL0WkEEajCTwodYR3oMWDearHCmKOGLqvUM1fDBX1gfm4P9QIsiwDDOkOTYtbZl/TOY/5NFLaM4fouD/eIsMP3A13J/e3jPTW0W39zXJJq8=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB4083.namprd11.prod.outlook.com (10.255.129.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Mon, 6 May 2019 09:42:10 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 09:42:10 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>, <boris.brezillon@collabora.com>,
 <miquel.raynal@bootlin.com>, <vigneshr@ti.com>, <marek.vasut@gmail.com>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>
Subject: [GIT PULL] mtd: spi-nor: Changes for 5.2
Thread-Topic: [GIT PULL] mtd: spi-nor: Changes for 5.2
Thread-Index: AQHVA+/61qY+FTnJlkShb3blTj5aRA==
Date: Mon, 6 May 2019 09:42:10 +0000
Message-ID: <ab707a79-10e1-6c72-d255-70437995b4f4@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0801CA0080.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::24) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72472321-b535-47cb-7de0-08d6d2071c73
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN6PR11MB4083; 
x-ms-traffictypediagnostic: BN6PR11MB4083:
x-microsoft-antispam-prvs: <BN6PR11MB40836B11214CD5E5050D57CCF0300@BN6PR11MB4083.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:644;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39850400004)(376002)(396003)(136003)(366004)(199004)(189003)(31696002)(2501003)(66446008)(66476007)(26005)(110136005)(53936002)(2201001)(99286004)(52116002)(316002)(3846002)(6116002)(71190400001)(2906002)(102836004)(71200400001)(256004)(478600001)(386003)(6506007)(186003)(476003)(486006)(14454004)(2616005)(36756003)(305945005)(66066001)(66556008)(73956011)(66946007)(7736002)(64756008)(8676002)(81156014)(8936002)(81166006)(72206003)(86362001)(6436002)(5660300002)(6486002)(25786009)(68736007)(6512007)(31686004)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB4083;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1WaGxdqKGHJQ7iWYSQ2dKnI4v4hse8osi1m57aKSeqyJd+0AQmEW2JRTSbgG+uA73CPEHRyLR3J4rn2dvRETk18vZCIRe3j78aMHQRDD5nLvMrrDo2oJy4vpv2C4h58yJusmvzs4A+lODtyai84je8Z/Uimzehz8K95+SJxmlB1kuJRNM5Ter552xpAZUVldU2dbqgJeIFJ1qbFwXne6zIZVxFWTK7vdDvAq9R5qA/QhTIh42AIFwjZ466KVuH7+FSjAn51Cj/EpQxgnP3QPxpQpX9qWTMM5XwwPSReHGe5Eiidi8oA9PtIRJLOHZ/0J602ju2u/HiZMOThlbu6F+LIlY8Cb/MsCJlS2Ab0KWhizbLqW/HKNe4Rm6dYtjJJ+5SL6+D5HqEDjq/K0scn9zaLg0/0vz85UkQgMRcAZhl8=
Content-ID: <AE8FCC6FEC7A0C4EB9558CBEF3243728@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 72472321-b535-47cb-7de0-08d6d2071c73
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 09:42:10.7592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4083
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_024217_313264_21B27BF3 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

This is the SPI-NOR PR for 5.2.

Cheers,
ta

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
tags/spi-nor/for-5.2

for you to fetch changes up to e43f53c22a937d024f070907d02539e413f20c15:

  spi-nor: intel-spi: Add support for Intel Comet Lake SPI serial flash
(2019-05-06 11:18:02 +0300)

----------------------------------------------------------------
SPI NOR core changes:
- Print all JEDEC ID bytes on error
- Fix comment of spi_nor_find_best_erase_type()
- Add region locking flags for s25fl512s

SPI NOR controller drivers changes:
- intel-spi:
  * Avoid crossing 4K address boundary on read/write
  * Add support for Intel Comet Lake SPI serial flash

----------------------------------------------------------------
Alexander Sverdlin (2):
      mtd: spi-nor: Fix comment of spi_nor_find_best_erase_type()
      mtd: spi-nor: intel-spi: Avoid crossing 4K address boundary on read/write

Geert Uytterhoeven (1):
      mtd: spi-nor: Print all JEDEC ID bytes on error

Jonas Bonn (1):
      spi-nor: s25fl512s supports region locking

Mika Westerberg (1):
      spi-nor: intel-spi: Add support for Intel Comet Lake SPI serial flash

 drivers/mtd/spi-nor/intel-spi-pci.c |  1 +
 drivers/mtd/spi-nor/intel-spi.c     |  8 ++++++++
 drivers/mtd/spi-nor/spi-nor.c       | 10 ++++++----
 3 files changed, 15 insertions(+), 4 deletions(-)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
