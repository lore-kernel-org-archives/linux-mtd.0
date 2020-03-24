Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070F9C43331
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 14:03:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C46C52076E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 14:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qHee+R58";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="pBzkKbOi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C46C52076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ka4dNx0bw9Hza4i3A7eEAjgiz+uF4CqRR8Sa2HUOYBg=; b=qHee+R58hSHiLt
	+RxWk6c3oRVrPiSTei1pLBPBn65iay7FpUR2jxPiJRAN8rnf6IG0BDl8x8Q754wB50sy/GniPfh+D
	Aj5UZgkEfLuQNZzCfje1c+QkkF0O2zfRf/I65ugTpgjO/CqMOaf2NEPGtgbG24i5DVgdNYkSewUeb
	yw5q0Hiwgd8JGSOGKSy643ySVBAjtrCOp4sLU8TuwsVpHvOQl3a2213yFmI2fKKqKMsMt5n6wINpo
	qcAX70++WmOe4gFZf2LzqAMw1pqnPezALxMjCMq3ChSP/TCF/jR3/q0dyYRapx/dTf/jtHyHNKoGF
	Epyjup8EOKlMQj3A3h2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGk8l-00060H-3Z; Tue, 24 Mar 2020 14:02:47 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGk8i-0005zr-52
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 14:02:45 +0000
IronPort-SDR: VLXKQc4RSA1HkZZ32pT8HyZKK+RslsG66BdemRsA3W5rPWGDSNIDFqDpaMWdd41oaffB89JPGr
 dxqqB9bP8lr/Qwz/v9MJ8dPTOZs7GXYqirU6UdCr/nn7EQgyMCKVdn8g60apcdPk7HjlJMZ3Nf
 21mJi78FPqhkQF1lZkKLKX7RxigJCXUgnkIk3SOz8r6xvlYgcyvkPqdRsyzPUZo6qoneC74WnG
 uu6Q9UEqiGW/RUmV3B2TMAZMGFA7ixW+HCyvGUOgykZGJ2gjILMCYTvpt8MGRuzqGDz2zBlTzN
 H8w=
X-IronPort-AV: E=Sophos;i="5.72,300,1580799600"; d="scan'208";a="71068140"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Mar 2020 07:02:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Mar 2020 07:02:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 24 Mar 2020 07:02:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnhMdzEI70yA7F6kpOo2xd0wPhmTGzj0mvHM/aGLM24hEJpiJT4Czu/QUd9NE5xCSu4SyBnoJMzXzhNDK61/kGObSBMvt9quPndpIam7WC5SahL3SrsLBz/9ZSgrW53HZA2AZoizaaft8wGddSMQSHBQelocdKvyL2HnDnvT6+r9LXm03u660W1rKtZALJWSePXHW4z1QaB+zWkJqTeFTFvecMEeB4imInnRmEOxymLzo29/y6n6AXpALPmlF/EpPV5FAAykgpe0BII2DDxQXcddmVEl8KUMarETTgKd5fQtNMZ5JLCl3trKR3fCDR73Hp5lVpOB71Lv0ubXHVi4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oWJVRYD1xet7Gzb5N3Sbggk5PNsIev5w2julySlmH0=;
 b=bTLT+jGSK4Bo1ezs7NS2U9eXwLyAcxOXCA/8L7EY2Lu3F2Z1SP3Yc9C4T3bORwqUzhx6wxRb956DVNKgEs4WJL/bc5rWQgYdSxFvtMYHlmhECTmWSARRq+lMmwPO/rzA53/UindNQa8S8s1FJ8izcQ9g/LQiGs8vs+qItVJMCxSFQ3os1mKa5Ng7I0XwA3jPac5BIY8yWc72OmiixbnzBAH9tKTra2j0GMdFdmayGfLma49pSVG+oK4TOk/8EqES7HfAn9fN5bN8F/lG3+mkhE0pjEOpO568vGVELLHkz7wu6Aa9ECl6n7iqxLXZxgfuMTB1uKKk16DcUyJsfzsPkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oWJVRYD1xet7Gzb5N3Sbggk5PNsIev5w2julySlmH0=;
 b=pBzkKbOilaoDq+B4BAhVn9WuqPzy9LQmFdXgQ2NaWxOGfYg0Sh5QCrdmyb5PijLb/bNPvey2i/xr9YPQu8KpMg+VEUMnxhSZzIEupVbHq627dT40ScC5enVuIzCgwDJ9BnpRjqitmy5oT8toUExQCYbrbAL+oDLlehjjZVVev+s=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4353.namprd11.prod.outlook.com (2603:10b6:a03:1b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 14:02:41 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.023; Tue, 24 Mar 2020
 14:02:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <broonie@kernel.org>
Subject: [GIT PULL] mtd: spi-nor: Changes for 5.7
Thread-Topic: [GIT PULL] mtd: spi-nor: Changes for 5.7
Thread-Index: AQHWAeTijK4IZ3aTgEWSDeqJMNx97w==
Date: Tue, 24 Mar 2020 14:02:41 +0000
Message-ID: <3920122.fqK6YPyDo2@192.168.0.120>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 414f38b6-e76c-44ce-79e7-08d7cffc04a0
x-ms-traffictypediagnostic: BY5PR11MB4353:
x-microsoft-antispam-prvs: <BY5PR11MB43535307C3594CFEC043849AF0F10@BY5PR11MB4353.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(366004)(376002)(396003)(81166006)(81156014)(9686003)(14286002)(4326008)(66574012)(2906002)(5660300002)(8676002)(71200400001)(86362001)(91956017)(6506007)(76116006)(26005)(66476007)(316002)(66556008)(66946007)(110136005)(64756008)(478600001)(6486002)(186003)(54906003)(8936002)(6512007)(66446008)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4353;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mk+39yz6U7IKOLjxhzB2ViSVtQmZSqqpcuW6PuD9JR4VuKtM5mVjY64ZPat2K3+LngqELyiF0uOjf/Ih82+6FEJtSjYFhzI5cXsCL0Sdxu+NmOMJQlda43gsGrpw7rMk2PmVhLjehajOQEIC4C56/7p7cTiJCeqHb9ctzvfC9zb74fMlq0FeEFKvO8oWQC1+5YG+obh4CoC6C7vG/ewzJUr+9bZqZVd7uiEYwjfuKODE+wRmpfXvSWnXBFvjvv8FBD4ngRJ9P/zhkuWKodtauvnQ4hnDTfqToVjW+rxHOyC+6ac46AHV5o2gnzwrhQ6awkDL0KgjJvvVnM6IVe9EcjCFqoPwTF+9erdpZDK1XfY/grJYboh1abzrWC1t/iy/4xxesCGgd4lwP4oZgYwvV4x7kqo8+1gwSSuRW/HFrkNJLTNvJcNbyEbH0Wo7pFBJGaQrpt6eWvbt5YcGVKHOGzEo5TuMtLhKyozORF4HPHqRCfVx4FOCE78j7wwRPn69
x-ms-exchange-antispam-messagedata: a9oxs/Z+yEefivXZPE0r+AK6MMqEp5Yz6BatNxkeskOclu8EzRIhRSsZnCYSQ06ynQEeEnUPgOmmHfcuKDb9Evwrq/mIs7BhC5EkZ8ctmS8aiaavBC0AVdzNjO2+wn1GmexgE1G8V8i4MpWsVtIpPQ==
x-ms-exchange-transport-forked: True
Content-ID: <4321089A7C443D40B54E389772FD2321@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 414f38b6-e76c-44ce-79e7-08d7cffc04a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 14:02:41.0979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NzyWm7dJ7hb2yJIKqeuRSyoqlAdgfgGzOHJYD1xUw38H/fvwWp2ema/k/JM6HnbmnFliCRNWGUzeypdSWEPvCj0IonJfA+krKyuxj4yOCcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4353
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_070244_215761_189B5F87 
X-CRM114-Status: GOOD (  14.88  )
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
Cc: michael@walle.cc, linux-mtd@lists.infradead.org, js07.lee@samsung.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Here is the SPI NOR PR for 5.7.

I would like to thank Vignesh, Michael and Jungseung for their involvement =
in =

reviewing patches for this release cycle. You did a great job!

Richard,

Please note that I merged tag 'mtk-mtd-spi-move' into spi-nor/next, in orde=
r =

to spare Linus of solving conflicts during the merge window. The mtk-quadsp=
i =

driver is replaced by the new spi-mem spi-mtk-nor driver, which was taken =

through Mark's tree. There was a conflict between this driver move and the =

move of all the SPI NOR controllers under drivers/mtd/spi-nor/controllers/.

Cheers,
ta

The following changes since commit 11a48a5a18c63fd7621bb050228cebf13566e4d8:

  Linux 5.6-rc2 (2020-02-16 13:16:59 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/
spi-nor/for-5.7

for you to fetch changes up to f3f2b7eb2f1c5889b0a7162b6b5a69c0f357befd:

  mtd: spi-nor: Enable locking for n25q512ax3/n25q512a (2020-03-24 11:47:52 =

+0200)

----------------------------------------------------------------
SPI NOR core changes:
- move all the manufacturer specific quirks/code out of the core,
to make the core logic more readable and thus ease maintenance.
- move the SFDP logic out of the core, it provides a better
separation between the SFDP parsing and core logic.
- trim what is exposed in spi-nor.h. The SPI NOR controllers drivers
must not be able to use structures that are meant just for the
SPI NOR core.
- use the spi-mem direct mapping API to let advanced controllers
optimize the read/write operations when they support direct mapping.
- add generic formula for the Status Register block protection
handling. It fixes some long standing locking limitations and eases
the addition of the 4bit block protection support.
- add block protection support for flashes with 4 block protection
bits in the Status Register.

SPI NOR controller drivers changes:
- the mtk-quadspi driver is replaced by the new spi-mem
spi-mtk-nor driver. Merge tag 'mtk-mtd-spi-move' into spi-nor/next
to avoid conflicts.

----------------------------------------------------------------
Boris Brezillon (21):
      mtd: spi-nor: Stop prefixing generic functions with a manufacturer na=
me
      mtd: spi-nor: Prepare core / manufacturer code split
      mtd: spi-nor: Expose stuctures and functions to manufacturer drivers
      mtd: spi-nor: Add the concept of SPI NOR manufacturer driver
      mtd: spi-nor: Move Atmel bits out of core.c
      mtd: spi-nor: Move Eon bits out of core.c
      mtd: spi-nor: Move ESMT bits out of core.c
      mtd: spi-nor: Move Everspin bits out of core.c
      mtd: spi-nor: Move Fujitsu bits out of core.c
      mtd: spi-nor: Move GigaDevice bits out of core.c
      mtd: spi-nor: Move Intel bits out of core.c
      mtd: spi-nor: Move ISSI bits out of core.c
      mtd: spi-nor: Move Macronix bits out of core.c
      mtd: spi-nor: Move Micron/ST bits out of core.c
      mtd: spi-nor: Move Spansion bits out of core.c
      mtd: spi-nor: Move SST bits out of core.c
      mtd: spi-nor: Move Winbond bits out of core.c
      mtd: spi-nor: Move Catalyst bits out of core.c
      mtd: spi-nor: Move Xilinx bits out of core.c
      mtd: spi-nor: Move XMC bits out of core.c
      mtd: spi-nor: Get rid of the now empty spi_nor_ids[] table

Chuanhong Guo (4):
      spi: make spi-max-frequency optional
      spi: add support for mediatek spi-nor controller
      dt-bindings: convert mtk-quadspi binding doc for spi-mtk-nor
      mtd: spi-nor: remove mtk-quadspi driver

Gustavo A. R. Silva (1):
      mtd: spi-nor: controllers: aspeed-smc: Replace zero-length array with =

flexible-array member

Jonathan Neusch=E4fer (1):
      mtd: spi-nor: Refactor spi_nor_read_id()

Jungseung Lee (4):
      mtd: spi-nor: introduce SR_BP_SHIFT define
      mtd: spi-nor: Add generic formula for SR block protection handling
      mtd: spi-nor: Add SR 4bit block protection support
      mtd: spi-nor: Enable locking for n25q512ax3/n25q512a

Lukas Bulwahn (1):
      MAINTAINERS: update entry after SPI NOR controller move

Sergei Shtylyov (3):
      mtd: spi-nor: use le32_to_cpu_array()
      mtd: spi-nor: split spi_nor_spimem_xfer_data()
      mtd: spi-nor: use spi-mem dirmap API

Tudor Ambarus (7):
      Merge tag 'mtk-mtd-spi-move' into spi-nor/next
      mtd: spi-nor: Emphasise which is the generic set_4byte_addr_mode() =

method
      mtd: spi-nor: Move SFDP logic out of the core
      mtd: spi-nor: Drop the MFR definitions
      mtd: spi-nor: Trim what is exposed in spi-nor.h
      mtd: spi-nor: Clear WEL bit when erase or program errors occur
      mtd: spi-nor: Set all BP bits to one when lock_len =3D=3D mtd->size

 Documentation/devicetree/bindings/{mtd/mtk-quadspi.txt =3D> spi/spi-mtk-
nor.txt} |   15 +-
 MAINTAINERS                                                               =
     =

|    2 +-
 drivers/mtd/spi-nor/Kconfig                                               =
     =

|   83 +--
 drivers/mtd/spi-nor/Makefile                                              =
     =

|   26 +-
 drivers/mtd/spi-nor/atmel.c                                               =
     =

|   46 ++
 drivers/mtd/spi-nor/catalyst.c                                            =
     =

|   29 +
 drivers/mtd/spi-nor/controllers/Kconfig                                   =
     =

|   75 +++
 drivers/mtd/spi-nor/controllers/Makefile                                  =
     =

|    8 +
 drivers/mtd/spi-nor/{ =3D> controllers}/aspeed-smc.c                      =
       =

|    2 +-
 drivers/mtd/spi-nor/{ =3D> controllers}/cadence-quadspi.c                 =
       =

|    0
 drivers/mtd/spi-nor/{ =3D> controllers}/hisi-sfc.c                        =
       =

|    0
 drivers/mtd/spi-nor/{ =3D> controllers}/intel-spi-pci.c                   =
       =

|    0
 drivers/mtd/spi-nor/{ =3D> controllers}/intel-spi-platform.c              =
       =

|    0
 drivers/mtd/spi-nor/{ =3D> controllers}/intel-spi.c                       =
       =

|    0
 drivers/mtd/spi-nor/{ =3D> controllers}/intel-spi.h                       =
       =

|    0
 drivers/mtd/spi-nor/{ =3D> controllers}/nxp-spifi.c                       =
       =

|    0
 drivers/mtd/spi-nor/core.c                                                =
     =

| 3466 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++
+++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.h                                                =
     =

|  441 +++++++++++++
 drivers/mtd/spi-nor/eon.c                                                 =
     =

|   34 +
 drivers/mtd/spi-nor/esmt.c                                                =
     =

|   25 +
 drivers/mtd/spi-nor/everspin.c                                            =
     =

|   27 +
 drivers/mtd/spi-nor/fujitsu.c                                             =
     =

|   20 +
 drivers/mtd/spi-nor/gigadevice.c                                          =
     =

|   59 ++
 drivers/mtd/spi-nor/intel.c                                               =
     =

|   32 +
 drivers/mtd/spi-nor/issi.c                                                =
     =

|   83 +++
 drivers/mtd/spi-nor/macronix.c                                            =
     =

|   98 +++
 drivers/mtd/spi-nor/micron-st.c                                           =
     =

|  157 +++++
 drivers/mtd/spi-nor/mtk-quadspi.c                                         =
     =

|  565 ----------------
 drivers/mtd/spi-nor/sfdp.c                                                =
     =

| 1205 ++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.h                                                =
     =

|   98 +++
 drivers/mtd/spi-nor/spansion.c                                            =
     =

|   95 +++
 drivers/mtd/spi-nor/spi-nor.c                                             =
     =

| 5434 =

---------------------------------------------------------------------------=
---------------------------------------------------------------------------
 drivers/mtd/spi-nor/sst.c                                                 =
     =

|  151 +++++
 drivers/mtd/spi-nor/winbond.c                                             =
     =

|  112 ++++
 drivers/mtd/spi-nor/xilinx.c                                              =
     =

|   94 +++
 drivers/mtd/spi-nor/xmc.c                                                 =
     =

|   23 +
 drivers/spi/Kconfig                                                       =
     =

|   10 +
 drivers/spi/Makefile                                                      =
     =

|    1 +
 drivers/spi/spi-mtk-nor.c                                                 =
     =

|  689 +++++++++++++++++++
 drivers/spi/spi.c                                                         =
     =

|    9 +-
 include/linux/mtd/spi-nor.h                                               =
     =

|  285 +-------
 41 files changed, 7126 insertions(+), 6373 deletions(-)
 rename Documentation/devicetree/bindings/{mtd/mtk-quadspi.txt =3D> spi/spi=
-mtk-
nor.txt} (75%)
 create mode 100644 drivers/mtd/spi-nor/atmel.c
 create mode 100644 drivers/mtd/spi-nor/catalyst.c
 create mode 100644 drivers/mtd/spi-nor/controllers/Kconfig
 create mode 100644 drivers/mtd/spi-nor/controllers/Makefile
 rename drivers/mtd/spi-nor/{ =3D> controllers}/aspeed-smc.c (99%)
 rename drivers/mtd/spi-nor/{ =3D> controllers}/cadence-quadspi.c (100%)
 rename drivers/mtd/spi-nor/{ =3D> controllers}/hisi-sfc.c (100%)
 rename drivers/mtd/spi-nor/{ =3D> controllers}/intel-spi-pci.c (100%)
 rename drivers/mtd/spi-nor/{ =3D> controllers}/intel-spi-platform.c (100%)
 rename drivers/mtd/spi-nor/{ =3D> controllers}/intel-spi.c (100%)
 rename drivers/mtd/spi-nor/{ =3D> controllers}/intel-spi.h (100%)
 rename drivers/mtd/spi-nor/{ =3D> controllers}/nxp-spifi.c (100%)
 create mode 100644 drivers/mtd/spi-nor/core.c
 create mode 100644 drivers/mtd/spi-nor/core.h
 create mode 100644 drivers/mtd/spi-nor/eon.c
 create mode 100644 drivers/mtd/spi-nor/esmt.c
 create mode 100644 drivers/mtd/spi-nor/everspin.c
 create mode 100644 drivers/mtd/spi-nor/fujitsu.c
 create mode 100644 drivers/mtd/spi-nor/gigadevice.c
 create mode 100644 drivers/mtd/spi-nor/intel.c
 create mode 100644 drivers/mtd/spi-nor/issi.c
 create mode 100644 drivers/mtd/spi-nor/macronix.c
 create mode 100644 drivers/mtd/spi-nor/micron-st.c
 delete mode 100644 drivers/mtd/spi-nor/mtk-quadspi.c
 create mode 100644 drivers/mtd/spi-nor/sfdp.c
 create mode 100644 drivers/mtd/spi-nor/sfdp.h
 create mode 100644 drivers/mtd/spi-nor/spansion.c
 delete mode 100644 drivers/mtd/spi-nor/spi-nor.c
 create mode 100644 drivers/mtd/spi-nor/sst.c
 create mode 100644 drivers/mtd/spi-nor/winbond.c
 create mode 100644 drivers/mtd/spi-nor/xilinx.c
 create mode 100644 drivers/mtd/spi-nor/xmc.c
 create mode 100644 drivers/spi/spi-mtk-nor.c



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
