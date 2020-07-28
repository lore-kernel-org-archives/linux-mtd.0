Return-Path: <SRS0=4ZlO=BH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42199C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 10:43:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0036D20775
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 10:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="leuCA9G3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="bxHA5pIG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="JVdGF+6X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0036D20775
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:To:
	From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CThCCn+qucVqS7UtOCbIyBkngVTHpj0lT0YhlOW1hJw=; b=leuCA9G3vZ5O8ZJOv7/7/5aAfI
	O1dSNZpz0V+g8Vm5RQKuN6DABAAY4TCEcC9WCuXHuT6kzPrWjLbhLS01xgVbKDIuygV9E5d1oSXxW
	/O+kbbVeceGocD87zgdR60OosxW/AzHL1YuYDh1XP4/WYOimeTU4SirRPZJBbSWi5ruA9qhW2TRVG
	epEaddfSQfTod/aBSdzJXZbFRAO8ncA4qTzbwQbJwgotAXZ0zm3gOnNafMtI6+kDa2UbQdKk5Jama
	GK70X6zFpTfT3eRMp8HGUaLS6l0OiCFpegkAcSq2TwnnG7lK2+5ARsqtlaaXhvoPHjrOV6j5ex/Z9
	F7WhI6PQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0N3f-0007cI-35; Tue, 28 Jul 2020 10:42:07 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0N3c-0007Zd-EL
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2020 10:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595932924; x=1627468924;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=aShMBN5HvRNwjQatlHh4QYS/T+aWX1pxCNAYUvnm3w4=;
 b=bxHA5pIGL/QDhHU3YEFAUpncwPKZPIC2FyU2b25wXsN7Gx24GwHdrl+K
 lIVAYL5joAAyjqmjqXHkhCHt+wCctMzafzuGIM4KTJpVzT1b3qniunCQh
 qEPIzP70OWS/Qdsv+MCew3B4mRpu/Rzeiol/PuwwgLJHEpmED9IFwClJX
 Td3bVIMWkDU9U/ecgDEXx6Fmfimaz/KPVqwrWEntMOLJGswUkYxtTbD7i
 E6XJj6Y0isS1sUMaM/7E6Fn1oX5xuAtsjwiZQ4aDEAKNTmq321/YYl6yT
 572EyigMXmMvenlxBc0KLbbfOp1Or0ln1u09AVM8oiNsT1c5mTNMCegSG A==;
IronPort-SDR: zFBjQ5q3hSYNTkzmIQ30q82OLQ2oxp8iUK5qS5Z/B+sRp1pFaFphoFOlxti4EzWQxAtfiIZLgg
 i/VALtQuK+4zOtoxt3zYIkhna7Itr/X3i4IO+SapCtjWjKWgN3np4VIG/31mJNEJiFleiaHrnF
 QxKoDNb8lloOcEbkxtnzpxFkL75/LChMdZI+A9R3QHCA+YW92UCdHdFez/uwH3Ob5IPnKOUrkA
 5ky891igp3IJcdyXzB7fU90pmU65FyuSEApc2BCzuzJdYVVJnd9ajyne8sg7kPS//B2k/FeOS1
 /Zk=
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; d="scan'208";a="81501219"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jul 2020 03:42:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 28 Jul 2020 03:42:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 28 Jul 2020 03:41:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwVfS89bzQSC+ARKGL9KokckqJ9yK9iP2jupzw1WH/+pDzVuEXhc0nSsak1CCnnA4HGWEB3uOh++V0UVLTOZYxKeryzwlzeGgzHTRxwN8GR8BUwSRlHx0AnuqiqzArEX1vaAvwF6G1WSEekWk6sSqS1H4ocakbfSyvf486iqrAabGEwLfi++tgeyHAwZ3UHE0AZOeyRaxACSGcN5g8esSIyDBfjf6SeUAVWLFACELfix6OxKHj3nXDygTxfnaHjD66spRn65fPP1dNHRHfYSPNthhH4oaSstSDm89j8dwozwL5XKaTHM1aizaKBKdQzaFdVxaptDrDBaSl+2yVWXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aShMBN5HvRNwjQatlHh4QYS/T+aWX1pxCNAYUvnm3w4=;
 b=NvwTua3Yb43cYW8KifNzk77HeWH2NB4TBB+6y37TgJMiJpBIlF+tyeCAkvMr+KcyuFovhSi5NHKbaJ2bzrqY8I2dV+zN5wwOZJPeIjeTozjIVov45X8QWRBcjTXz72/wFX09a+PE24ZJDY1Xql5dDBF+Jpjy3PV2Nk3zfIXl66+ufzhgnGolSqF3dUfJk8mANmzXvlHxcV7eOxoS7n3QIjUaQWMuiPXYxJDROaMbl9hNglR6XhJXxz1XJFzMNc5Eb2aBhzitcQ9d1RN1S9obbLcmeYjsvs5jHXfRzUapwsfW6QXuQgLHxQobeDzpPGI0mPPj9EiZRty7L5DKccL9kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aShMBN5HvRNwjQatlHh4QYS/T+aWX1pxCNAYUvnm3w4=;
 b=JVdGF+6XNlvItvopiPExBrivMwwjH7//nTRIRyIdJgQUJliPlxHGNdHY6nTWBbecdEbayxJyHoGZ+b8mQBG6RGC4USyNxddxuQ0BPxy8pCNNyido05vRoX8aOskiiwe9RCLiNfkaR6uc+Hg+bmYl3lgE4zvZAsV4vidknDIVlo0=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB4267.namprd11.prod.outlook.com (2603:10b6:5:14e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Tue, 28 Jul
 2020 10:41:59 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::a8e8:d0bc:8b3c:d385]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::a8e8:d0bc:8b3c:d385%11]) with mapi id 15.20.3216.033; Tue, 28 Jul
 2020 10:41:59 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>
Subject: [GIT PULL] mtd: spi-nor: Changes for 5.9
Thread-Topic: [GIT PULL] mtd: spi-nor: Changes for 5.9
Thread-Index: AQHWZMu4UFwDBpVOY06ICg5yGMtRaA==
Date: Tue, 28 Jul 2020 10:41:59 +0000
Message-ID: <18367873-6ebe-3f41-7307-0f0933becda3@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: nod.at; dkim=none (message not signed)
 header.d=none;nod.at; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [188.26.61.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd2ba1a1-ddf0-48ac-d770-08d832e2db5c
x-ms-traffictypediagnostic: DM6PR11MB4267:
x-microsoft-antispam-prvs: <DM6PR11MB42676E125D52040D7702C9FAF0730@DM6PR11MB4267.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nrIt0R/k5O2wn6idXF9Drf4KVaRJ/9+kN+wRKT8cp12pvdQ463kjmP4Rz3p9mIFTgoYvzHaPFbremy9OlMasKdSjOariquJ3BIXN12BdJ4gUUiff+KW7yzTYfGAiVrNEUZiWlB5TiyWUyJEihrwE+IzeukulUk6RqmYLf3VPe9T6h6OjIMK3Cbl+jWLTQWTWFUCRvf4/zTUhhvOga1TyLg7OPoW44W7m+qbeJ838G1EXTwaAU+O5bDNCS5HgFRuLfcVTP6neogFV2qI2BB6PQ794PdTpNIdgVgL4ABq2QmrHD3XNyxIA42NhMUmvP0ot8SV1f5D0T0kxNgAM1zft6ScI90dQ18uJqf+wnqqL/tpF8xWVBjoQoYeiK4zlDNXMZYjsBor95hdlyym0WF8FVZXjDmOkUdGFyvQz8+ynngps+N+Xj9xBcPzXNYkcynymhjNXE2URYYam9VOdcTTURg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(366004)(39860400002)(136003)(396003)(4326008)(6486002)(86362001)(2616005)(71200400001)(5660300002)(31696002)(6506007)(83380400001)(26005)(966005)(66476007)(186003)(478600001)(36756003)(8936002)(6916009)(2906002)(316002)(8676002)(64756008)(66946007)(91956017)(76116006)(6512007)(66446008)(31686004)(54906003)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: an/Ipa8V71Lk5BxdrDzKrJaHwaibI2Kq2jPWtdu26gNsiByHUN2EJg4DAYcDQR0+aT2efme3B/avsKQsXawo0wrbJX6yHY2LvIRPnvJBOG2i5yp3GYKcxXo2DpGjbHysQwYR3cFW3eqw05hvywGBYgGpk65tKl5cM4H8ZCBBJAVfRQZ2IlXeP+lj2s0YLDoz4bhPGLZoXb/XTr2z0j0mrzqXW3eg+jLoPoPDJ+vmlzUOFCNbDE+9djJgfBp15gtmYpVgGRs794tO2uZiroKjMjt6We+L1ox94N8Q+RC4WNsk1RAr3RXMCMqQOjDowo5TZSVLOf0yOxRbtKHypPG/wMZnoNXrjvqe7YAGYfc1UL5dl2YAvz3Cib1x2Ctn9uhJC+yQyKtsyyVYOGVeoKTIm8AYhRE+CVXhat/+0v0fvPjuaTY+uLzSMk/+yLCbvL7yaGsYG2s3OGBjulv1XuvbXBPkG7WHUdFKFRS9VvzsqgA=
x-ms-exchange-transport-forked: True
Content-ID: <187661998FD39444ACB5061352812C36@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2ba1a1-ddf0-48ac-d770-08d832e2db5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 10:41:59.5568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m0HkVqbolwUffSXGkKQ+B0Fq3Q0C/R5ER/ZtgqGfjDZ944vgsDeauqjfIEp+y632AbAt7wTAQ/TSDCusNYCDL/qg/hRzIzkJJJR6oyljows=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_064204_834421_1B5330A4 
X-CRM114-Status: GOOD (  15.36  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Richard,

Please pull. Cheers,
ta

The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:

  Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.9

for you to fetch changes up to e93a977367b2aefff3c1fb426bbdfc6e2980815f:

  mtd: revert "spi-nor: intel: provide a range for poll_timout" (2020-07-28 11:35:27 +0300)

----------------------------------------------------------------
SPI NOR core changes:
- Disable Quad Mode in spi_nor_restore().
- Don't abort BFPT parsing when QER reserved value is used.
- Add support/update capabilities for few flashes.
- Drop s70fl01gs flash: it does not support RDSR(05h) which
  is critical for erase/write.
- Merge the SPIMEM DTR bits in spi-nor/next to avoid conflicts
  during the release cycle.

SPI NOR controller drivers changes:
- Move the cadence-quadspi driver to spi-mem. The series was
  taken through the SPI tree. Merge it also in spi-nor/next
  to avoid conflicts during the release cycle.
- intel-spi:
   - Add new PCI IDs.
   - Ignore the Write Disable command, the controller doesn't
     support it.
   - Fix performance regression.

----------------------------------------------------------------
Alexander Sverdlin (1):
      mtd: spi-nor: intel-spi: Simulate WRDI command

David Clear (2):
      mtd: spi-nor: macronix: Add support for mx66u2g45g
      mtd: spi-nor: micron: Add SPI_NOR_DUAL_READ flag on mt25qu02g

Frieder Schrempf (1):
      mtd: spi-nor: macronix: Add support for MX25R1635F

Luis Alberto Herrera (1):
      mtd: revert "spi-nor: intel: provide a range for poll_timout"

Mika Westerberg (2):
      mtd: spi-nor: intel-spi: Add support for Intel Emmitsburg SPI serial flash
      mtd: spi-nor: intel-spi: Add support for Intel Tiger Lake-H SPI serial flash

Pratyush Yadav (5):
      mtd: spi-nor: sfdp: do not make invalid quad enable fatal
      spi: spi-mem: allow specifying whether an op is DTR or not
      spi: spi-mem: allow specifying a command's extension
      spi: atmel-quadspi: reject DTR ops
      spi: spi-mtk-nor: reject DTR ops

Ramuthevar Vadivel Murugan (2):
      mtd: spi-nor: Convert cadence-quadspi to use spi-mem framework
      spi: Move cadence-quadspi driver to drivers/spi/

Rayagonda Kokatanur (1):
      mtd: spi-nor: update read capabilities for w25q64 and s25fl064k

Sven Van Asbroeck (1):
      mtd: spi-nor: winbond: Add support for w25q64jvm

Takahiro Kuwano (1):
      mtd: spi-nor: spansion: Remove s70fl01gs from flash_info

Tudor Ambarus (2):
      Merge tag 'cadence-mtd-spi-move' into spi-nor/next
      Merge tag 'spi-mem-dtr' into spi-nor/next

Vignesh Raghavendra (6):
      mtd: spi-nor: cadence-quadspi: Make driver independent of flash geometry
      mtd: spi-nor: cadence-quadspi: Provide a way to disable DAC mode
      mtd: spi-nor: cadence-quadspi: Don't initialize rx_dma_complete on failure
      mtd: spi-nor: cadence-quadspi: Fix error path on failure to acquire reset lines
      mtd: spi-nor: cadence-quadspi: Handle probe deferral while requesting DMA channel
      mtd: spi-nor: cadence-quadspi: Drop redundant WREN in erase path

Yicong Yang (2):
      mtd: spi-nor: Add capability to disable flash quad mode
      mtd: spi-nor: Disable the flash quad mode in spi_nor_restore()

 drivers/mtd/spi-nor/controllers/Kconfig                          |  11 -
 drivers/mtd/spi-nor/controllers/Makefile                         |   1 -
 drivers/mtd/spi-nor/controllers/intel-spi-pci.c                  |   2 +
 drivers/mtd/spi-nor/controllers/intel-spi.c                      |  13 +-
 drivers/mtd/spi-nor/core.c                                       |  57 ++-
 drivers/mtd/spi-nor/core.h                                       |  10 +-
 drivers/mtd/spi-nor/macronix.c                                   |   6 +
 drivers/mtd/spi-nor/micron-st.c                                  |   4 +-
 drivers/mtd/spi-nor/sfdp.c                                       |   3 +-
 drivers/mtd/spi-nor/spansion.c                                   |   4 +-
 drivers/mtd/spi-nor/winbond.c                                    |   4 +-
 drivers/spi/Kconfig                                              |  11 +
 drivers/spi/Makefile                                             |   1 +
 drivers/spi/atmel-quadspi.c                                      |   6 +
 .../controllers/cadence-quadspi.c => spi/spi-cadence-quadspi.c}  | 541 +++++++++++-----------------
 drivers/spi/spi-mem.c                                            |  16 +-
 drivers/spi/spi-mtk-nor.c                                        |  10 +-
 drivers/spi/spi-mxic.c                                           |   3 +-
 drivers/spi/spi-zynq-qspi.c                                      |  11 +-
 include/linux/spi/spi-mem.h                                      |  14 +-
 20 files changed, 338 insertions(+), 390 deletions(-)
 rename drivers/{mtd/spi-nor/controllers/cadence-quadspi.c => spi/spi-cadence-quadspi.c} (74%)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
