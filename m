Return-Path: <SRS0=5B27=W2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23C0C3A5A4
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 08:56:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC7021726
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 08:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OK5fYHxC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="c9DWf8Kp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC7021726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mHVIkmnij+/dx0Gx8s5ZeE3rRFUv1M0aSl0r4I02mX8=; b=OK5fYHxCmuOFdP
	SiaZHyUeJ/oWY0DG+fa8/8qTjLPC90NosPqYTZThnoIR4kpQrujIike8L1w/rV+eo9GG8NvjYnwg+
	IAbHOMr28I7ciisQ00F2ZsecR8Tmq4htEY25m5pLoW5IlGGk4v8DSFrXKgTZjzWobQ0tmpzkjY/DS
	yw8AiS4QVrKpER0lOD12iVJNRu1koBf1G3j57xgm3YYYFR2RDAteUZbwYdGmvzqhxjMOqnjPQt8bI
	G+PLhnTNfbyB4jZPBz9ZIGYmzOb8jO/PKoQfAd6P4DDfncjHu/AjYFt7PaYxmNTl62nFJHUsQz4uK
	ZT4GkJl4u44nlgxraZAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3ci4-00082E-28; Fri, 30 Aug 2019 08:56:44 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3chv-0007wU-2k
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2019 08:56:41 +0000
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
IronPort-SDR: xmaXItKkVNNr7hgeG+W+fLHvMbU6mE45ZpTd0xDDM8j91pIQvSKcracIAOKUF+LbPMnhPJCmse
 mlyHyaJELVcFfi1otQVCD4OmYptkOGOS3p/4i08wI+vF3XIRnO96yBmI9jT+CkqReOtWFo+bO1
 zPyRmOlSw6wQziCXRxnAM/32BTc2yUls7//5IWnjpbTSsCd8toDDXLBdMVkNgBU4bCBD0n/Rlp
 i64U10+U3DOEgvx7K62wNz9f51iyGeDmBNKcEzuaWmeauhO0s49GI04SfTqWSW7r9DvN0ObKx2
 BkE=
X-IronPort-AV: E=Sophos;i="5.64,446,1559545200"; d="scan'208";a="45610661"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Aug 2019 01:56:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 30 Aug 2019 01:56:19 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 30 Aug 2019 01:56:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLhHBaNzh0CzuYl1RXN7LEfrOYlceA2xDyzCGGTFB5Vpu7UEAXJOoJOaackDfdWbiGt5UmKJckoBE1i8FyZXvef0i2QI9dR4knTFgsJfXAiV2PvnobujpQ/9k+7ci8LqXZdlf6GczwVnXmFH2ElKNeGqDJuqtKvb3V4ekO6Kluy7x2a/evd5meO67bcQdYclsIxjSAAoTAn+xjTelCCjqQmgGXXftYCrhjXB5bAup868p15Nd6rzYdNlLlW/5gRwhZ3Gv/2yREVqFI0Mxohfd6YRxCIxT5wm1QRGF8Iio1Jg6EqQc8xBGSH/cu24ZjXo5hu1Qjj+fLLiePjwMOFNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRcZqC6Pib8erFtpjYE+Guzwf+5SXthFIJCYkBEOEHQ=;
 b=FEObG1XWntF2ey+i1L179WgRcMO1BK2uhYouNYaP8VSJheNTmLuPel0mqJeBYPAzqup2QXiuAVteBxD2tCRCxDPGEj4yh4ahiBfUOIgj0aGvvPDy2Qqk9ZYxZFCoJ4swZ9MsOYZ2dDG8Nzbs8ZaAXgex2OIYz8TA671dr09RF6iSOvlK2UiM9yOXv11hFPpXlXn9s7glUc5yr3luC2bvRu6eK3KPJk5TInEvmQw3Af9EUZWLDG+yyC/5SpvxpFjQNUexoYU7INKrl9At+0y3fy7J60lrWMdWtD08Um53iuKts5Uc90pBsKKJ+oRYx1aYQKXZAyoFUrvSAQGYPSN9eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRcZqC6Pib8erFtpjYE+Guzwf+5SXthFIJCYkBEOEHQ=;
 b=c9DWf8KpdD2LYrEpPFunrT8xkUZ2bRaRjLA0CueMTlCsO4oFXxPdznkl6Y8rwd+Ob6qWP622fquZ78puwv7FDvzvFeLyV9TKfFZ8gh2sekbYXVLCUaE3O4G2X4kUMH68RfG0gDQ3q+ASCLkpa+KsXg+LzAHBQGpxwfURlFc6OQI=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4495.namprd11.prod.outlook.com (52.135.37.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 30 Aug 2019 08:56:16 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 08:56:16 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <marek.vasut@gmail.com>, <computersforpeace@gmail.com>, <dwmw2@infradead.org>
Subject: [GIT PULL] mtd: spi-nor: Changes for 5.4
Thread-Topic: [GIT PULL] mtd: spi-nor: Changes for 5.4
Thread-Index: AQHVXxDIgXbTPh09eUCSdmAmwXjvzg==
Date: Fri, 30 Aug 2019 08:56:16 +0000
Message-ID: <7853e731-57b7-1d85-6224-9e566638ee9c@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0102CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::25) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: faf0eda6-f699-41ff-5e9b-08d72d27ead3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4495; 
x-ms-traffictypediagnostic: MN2PR11MB4495:
x-microsoft-antispam-prvs: <MN2PR11MB4495CF34B79ED042D78B1BFAF0BD0@MN2PR11MB4495.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(39850400004)(396003)(376002)(366004)(189003)(199004)(66556008)(66446008)(66476007)(2616005)(6506007)(8676002)(386003)(316002)(81156014)(7736002)(81166006)(25786009)(478600001)(31686004)(26005)(2906002)(8936002)(3846002)(102836004)(4326008)(52116002)(54906003)(186003)(31696002)(305945005)(6116002)(36756003)(110136005)(6512007)(14454004)(53936002)(476003)(256004)(64756008)(66066001)(14444005)(86362001)(486006)(2201001)(71190400001)(99286004)(71200400001)(66946007)(2501003)(6486002)(5660300002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4495;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UeQvPJb5ivpD/rsgj2jj7UavVkioe4j7mWTkup2zYG2J7AySrCxZQegAfiPve9IaLHnVwgaTJoJYbTE2RwPI3CIqfxXdUgiFu2mi9FvD29tmBBbfAmsS4aoytnqIeX5BPFL979io8VZU3Os4hsIq4WMW+ftYRkWEcGA/97gquTmd6tWPFqtpV09BJV8um4XyEZnuclaTnvOEQoI0N/7/HHMjKtIYAcqhK2X++9PXWp1udhgFSvVO0ZuUoKO4/dERhk9oIa4uGWxyVrWd+XnHYdrahye5r0BYwjph5eGyv1EOLX06lOt17MepV3HxayVqdD/1bY/3XE/QwSB5tT76JifHsKvWHyqnXx7D0nM1hayEKXZFMqCjHfzSum95ME985wct7qWweCa9VVUGUboW8/7uq3+FxTGhgvnmW+Ipzwg=
x-ms-exchange-transport-forked: True
Content-ID: <69AA2E91E323DB4BAC7F92C69FC980E6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: faf0eda6-f699-41ff-5e9b-08d72d27ead3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 08:56:16.5088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6uaGZJ8NDVnSZaKH4HNjlp1L8mcOmP6e40G+zTUadr+SVevtXnYgtOA4xw9CDG0v15CPh58B7gwJQhFPA2OAPEbkIrIsmvr2pMsCkndmX9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_015635_543387_FD131959 
X-CRM114-Status: GOOD (  16.48  )
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
Cc: boris.brezillon@collabora.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Here is the SPI NOR PR for 5.4.

I'd like to thank Vignesh and Boris for reviewing SPI NOR patches.
40 patches merged is surely an improvement.

Richard,
Please note that I had to merge v5.3-rc6 into spi-nor/next, to include a fix
that we depended on for new development.

Thank you,
ta


The following changes since commit a55aa89aab90fae7c815b0551b07be37db359d76:

  Linux 5.3-rc6 (2019-08-25 12:01:23 -0700)

are available in the git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.4

for you to fetch changes up to 9607af6f857ff062b29562fc1fe36d22b16b9d27:

  mtd: spi-nor: Rename "n25q512a" to "mt25qu512a (n25q512a)" (2019-08-30 10:11:50 +0300)

----------------------------------------------------------------
MTD core changes:
- add debugfs nodes for querying the flash name and id

SPI NOR core changes:
- always use bounce buffer for register read/writes
- move m25p80 code in spi-nor.c
- rework hwcaps selection for the spi-mem case
- rework the core in order to move the manufacturer specific code
  out of it:
        - regroup flash parameters in 'struct spi_nor_flash_parameter'
        - add default_init() and post_sfdp() hooks to tweak the flash
          parameters
        - introduce the ->set_4byte(), ->convert_addr() and ->setup()
          methods, to deal with manufacturer specific code
        - rework the SPI NOR lock/unlock logic
- fix an error code in spi_nor_read_raw()
- fix a memory leak bug
- enable the debugfs for the partname and partid
- add support for few flashes

SPI NOR controller drivers changes:
- intel-spi:
        - Whitelist 4B read commands
        - Add support for Intel Tiger Lake SPI serial flash
- aspeed-smc: Add of_node_put()
- hisi-sfc: Add of_node_put()
- cadence-quadspi: Fix QSPI RCU Schedule Stall

----------------------------------------------------------------
Alexander Sverdlin (1):
      mtd: spi-nor: intel-spi: Whitelist 4B read commands

Ashish Kumar (2):
      mtd: spi-nor: Add support for mt35xu02g
      mtd: spi-nor: Rename "n25q512a" to "mt25qu512a (n25q512a)"

Avi Fishman (1):
      mtd: spi-nor: Add Winbond w25q256jvm

Boris Brezillon (9):
      mtd: spi-nor: Move m25p80 code in spi-nor.c
      mtd: spi-nor: Rework hwcaps selection for the spi-mem case
      mtd: spi-nor: Add a default_init() fixup hook for gd25q256
      mtd: spi-nor: Create a ->set_4byte() method
      mtd: spi-nor: Rework the SPI NOR lock/unlock logic
      mtd: spi-nor: Add post_sfdp() hook to tweak flash config
      mtd: spi-nor: Add spansion_post_sfdp_fixups()
      mtd: spi-nor: Add a ->convert_addr() method
      mtd: spi-nor: Add the SPI_NOR_XSR_RDY flag

Dan Carpenter (1):
      mtd: spi-nor: Fix an error code in spi_nor_read_raw()

Eugeniy Paltsev (1):
      mtd: spi-nor: add support for sst26wf016b memory IC

Jungseung Lee (1):
      mtd: spi-nor : Remove SPI_NOR_HAS_TB flag on s25fl512s

Mika Westerberg (1):
      mtd: spi-nor: intel-spi: Add support for Intel Tiger Lake SPI serial flash

Nishka Dasgupta (2):
      mtd: spi-nor: aspeed-smc: Add of_node_put()
      mtd: spi-nor: hisi-sfc: Add of_node_put() before break

Thor Thayer (1):
      mtd: spi-nor: Fix Cadence QSPI RCU Schedule Stall

Tudor Ambarus (16):
      mtd: spi-nor: fix description for int (*flash_is_locked)()
      Merge tag 'v5.3-rc6' into spi-nor/next
      mtd: spi-nor: Remove unused macro
      mtd: spi-nor: Regroup flash parameter and settings
      mtd: spi-nor: Use nor->params
      mtd: spi-nor: Drop quad_enable() from 'struct spi-nor'
      mtd: spi-nor: Move erase_map to 'struct spi_nor_flash_parameter'
      mtd: spi-nor: Add default_init() hook to tweak flash parameters
      mtd: spi-nor: Move manufacturer quad_enable() in ->default_init()
      mtd: spi-nor: Split spi_nor_init_params()
      mtd: spi-nor: Add a ->setup() method
      mtd: spi-nor: Add s3an_post_sfdp_fixups()
      mtd: spi-nor: Bring flash params init together
      mtd: spi-nor: Introduce spi_nor_set_addr_width()
      mtd: spi-nor: Introduce spi_nor_get_flash_info()
      mtd: spi-nor: remove superfluous pass of nor->info->sector_size

Vignesh Raghavendra (1):
      mtd: spi-nor: always use bounce buffer for register read/writes

Wenwen Wang (1):
      mtd: spi-nor: fix a memory leak bug

Zhuohao Lee (2):
      mtd: mtdcore: add debugfs nodes for querying the flash name and id
      mtd: spi-nor: enable the debugfs for the partname and partid

 drivers/mtd/devices/Kconfig           |   18 -
 drivers/mtd/devices/Makefile          |    1 -
 drivers/mtd/devices/m25p80.c          |  347 ------------
 drivers/mtd/mtdcore.c                 |   86 ++-
 drivers/mtd/spi-nor/Kconfig           |    2 +
 drivers/mtd/spi-nor/aspeed-smc.c      |    4 +-
 drivers/mtd/spi-nor/cadence-quadspi.c |   19 +-
 drivers/mtd/spi-nor/hisi-sfc.c        |    1 +
 drivers/mtd/spi-nor/intel-spi-pci.c   |    1 +
 drivers/mtd/spi-nor/intel-spi.c       |    2 +
 drivers/mtd/spi-nor/spi-nor.c         | 1712 ++++++++++++++++++++++++++++++++++++++++++---------------
 include/linux/mtd/mtd.h               |    3 +
 include/linux/mtd/spi-nor.h           |  291 +++++++---
 13 files changed, 1574 insertions(+), 913 deletions(-)
 delete mode 100644 drivers/mtd/devices/m25p80.c


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
