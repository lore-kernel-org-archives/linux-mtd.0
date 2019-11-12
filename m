Return-Path: <SRS0=8T9L=ZE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DA3C43331
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2019 09:47:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B93920656
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2019 09:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="joabNMLr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="gaJ5MStA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B93920656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wueBaARd3qonjeznKAF64xelsf/HK/ZpFeKBnSgmB/M=; b=joabNMLrTY6bt/
	UMtmFDCtAJ+WpgJLnMd0KvuOzS5YAp7LU2wO8EKw5C0PZoin5VoocPafZmD4oRQQXG0OEIkoWwMFe
	cmZpPSVd8tpMlEGc6TC6Eg9TyvnaxaL1t9q4XGQJPGmhhl0jl7iZY1CoH9vR/oyw5nmn9uBPnmz43
	2vKmg14mDbVomu7+X8g3oOjw2cTlKbxW+BGILEpGixam9EpitWV7Xua4IZF6XtaWzs6TXim7bhPpT
	jwWSvFkH3nKL8MKcMiNpteaxDYebrK5v4KwBzUMZk7Qvv9BmsKNGrd39Bd1hAuBdjxGv2wGSgRIS2
	xHPXoR0D3MQjFlc5EH+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUSlW-0001yp-A6; Tue, 12 Nov 2019 09:47:14 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUSlS-0001xs-KW
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2019 09:47:13 +0000
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
IronPort-SDR: nUpa66cnKf6N80o4NbfZ5cV/9HPHUFhyQFmoDJxNAIWNbAQdQkitKr2UGoH/4dKBy8RgY46INx
 TVzy3gTjW66kBKo4yf1QNejy1xITeKw+nNek5qvYCs+S2hOnrTzSpLSSJeZ3/u+z2ukf56HLsM
 4G3OXB4Lb/evHyiPM2nnLmbb9raPJLur6SiZj3BixNWGxffLBGPIkbanP0zAhcu6RqElilXUg4
 gPXyyDz0e4NZKt5o0lknpCWHxD2Z1fRsr9udP3OGlVRBR3oZTUwZuMDQ7dq1ZftFOtD61qi9sT
 HFE=
X-IronPort-AV: E=Sophos;i="5.68,295,1569308400"; d="scan'208";a="55096551"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Nov 2019 02:47:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 12 Nov 2019 02:47:02 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 12 Nov 2019 02:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIMwffZ/OIx37AyaiGCqduqfy8y519eH/nF+U78tUpM54tOGtSktkSMIDLWs5AoVrLiHhWupSwuDYUgoLGe9YxZPgqZ19TQtZCGuz9Rv0iXxmJKRXGagS6jKhJimOyX+j9XKiduwKhhfADifi6oyX00fzEgmnWV0ZupqTXqu6bJSlnJviaVpn+LAsLn15pHljiiQq4L46HIG/ri0IYKcD8WwK+MZi3hSQe92UOHeUzVsF5uXPjKK+Lzef1we88C3IyVnzI4hWqC+l2+zBHWq5pt410SWCKj/TBrlvbrDfiapibiKUaULNNFSdcuWWU8DPZXKfbTavzXibPyGYbhqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMdodx/JweGRwAa7HeJ0pESNJ5NzpJPbR3wIVIdlNH0=;
 b=hCnuNsC6fh4QhXEYieIjFuxcMs3/85MF829PMTyqLK70BDltveQyuTWzd3l1PLL3BHp1nMyLFwNQ6pZpnRYKXyTnd+g1NqLsaPihnxMen0WzZwAX8eg0jeg0zLchqB1jzXy0F8cLPdwna6G8HrfRizLyJhJ/yKzwE09XXyw7KR9dpaBBpi+yAL8UZ11FWlJtWQtDi7Lh7EbC3g2YuNDVerOSGl9QQBMcDwHauWF0UZ5UcJ/3uBSAioK6o2xBdKwQoCiAKfJ/6G3wWqjhCi7guxac82oqwbPrGykXnTYamfEcOHhU9ckJ3J0Jsk6EgZ5gbf/xpd6YovMM7xAV9x3taA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMdodx/JweGRwAa7HeJ0pESNJ5NzpJPbR3wIVIdlNH0=;
 b=gaJ5MStAGTLvwaPDDAN8A0oqWNCw1b8HOE21G6R6Lq95Rbc2DnmBhABo810fTQdxIHhBoPGHhgo9rCmV2M/iFtPw2x1F8B5TtQsTt5VQjSiBh8e9+yH2oWc5AUQOGu+XUvERTO3fA8IxswoKw65L73Udy+3vZ2aNDHoQtVkEK9o=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4333.namprd11.prod.outlook.com (10.255.90.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Tue, 12 Nov 2019 09:47:00 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 09:47:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
Subject: [GIT PULL] mtd: spi-nor: Changes for 5.5
Thread-Topic: [GIT PULL] mtd: spi-nor: Changes for 5.5
Thread-Index: AQHVmT4h/z8x4XDwskme2g2bC9oBiA==
Date: Tue, 12 Nov 2019 09:46:59 +0000
Message-ID: <6a79a45e-dfc0-3d7b-a662-601f831720a6@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0063.eurprd05.prod.outlook.com
 (2603:10a6:208:be::40) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2a908c8-7636-4e3d-d62e-08d767554366
x-ms-traffictypediagnostic: MN2PR11MB4333:
x-microsoft-antispam-prvs: <MN2PR11MB43338C2612720B8953AE81BAF0770@MN2PR11MB4333.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(396003)(366004)(376002)(199004)(189003)(36756003)(110136005)(14444005)(256004)(8676002)(71200400001)(66066001)(25786009)(71190400001)(8936002)(6436002)(4326008)(81156014)(31686004)(6486002)(6512007)(3846002)(2906002)(6116002)(316002)(54906003)(99286004)(14454004)(5660300002)(486006)(2616005)(476003)(81166006)(52116002)(2501003)(6506007)(386003)(66946007)(86362001)(186003)(305945005)(478600001)(26005)(4001150100001)(66556008)(64756008)(66446008)(66476007)(2201001)(102836004)(31696002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4333;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Bn27r3Wk1Zk3XwzYBsWLLcke7o+cXh7i2e086TvnDkIV3dojjjp4LDJH+z9xcIoJSgyZzo/Esnq0D7mu4qbYy+7+p1/kFzXuuTg/hTCowuz7qwz75taJ2xF9KtOYTw7+zWsIbQsTExph870OqBn299qG05KbrXSJ15AZGzQb4SoAvmrhbIpPQIV6NbTzmwc77K5ED0i6J3di6FhuPVQvPwFfZTN1tbUc3Evk+7aLc6U21xAq3uKyKXtKt/9/G6afOzNBqyWvRtxnBwYQATjpTlapnUEgNaYvue9bRNHoRoCbwOTqGbtu2TQ440ienizTOGY6QwF8XyJPXas3woByACwxD61Iur26L4/qKyj84ID2tDC4jj5gHgGoFGq4HVmWCqo/9XaZjO+2neJOZcWcwte1TrrIfq5sZZC9AYVhm7FgLXbmDpgzL7VXenoCYPf
x-ms-exchange-transport-forked: True
Content-ID: <1F3A1CDF45E3FB4A9A012026CD1AF5D8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a908c8-7636-4e3d-d62e-08d767554366
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 09:47:00.0876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HKZb99fZNPQHBZhpesQd6sE/jfhFx6WBd37SlAQVe94p/ZT20HWm1IgKqNbPynQAbuw9j6FH3UzOmQBjtWJ0X0uRVlylFNRn3ocDlfco8A0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4333
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_014710_770814_3E26D1AF 
X-CRM114-Status: GOOD (  10.36  )
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

Lots of patches were reviewed by Boris and Vignesh. Thank you.

ta


The following changes since commit 7d194c2100ad2a6dded545887d02754948ca5241:

  Linux 5.4-rc4 (2019-10-20 15:56:22 -0400)

are available in the git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.5

for you to fetch changes up to 83cba933a6db1dd4d7ac85170f99461fbc339eff:

  mtd: spi-nor: Set default Quad Enable method for ISSI flashes (2019-11-11 20:42:55 +0200)

----------------------------------------------------------------
SPI NOR core changes:
- introduce 'struct spi_nor_controller_ops',
- clean the Register Operations methods,
- use dev_dbg insted of dev_err for low level info,
- fix retlen handling in sst_write(),
- fix silent truncations in spi_nor_read and spi_nor_read_raw(),
- fix the clearing of QE bit on lock()/unlock(),
- rework the disabling of the block write protection,
- rework the Quad Enable methods,
- make sure nor->spimem and nor->controller_ops are mutually exclusive,
- set default Quad Enable method for ISSI flashes,
- add support for few flashes.

SPI NOR controller drivers changes:
- intel-spi:
	- support chips without software sequencer,
	- add support for Intel Cannon Lake and Intel Comet Lake-H flashes.

----------------------------------------------------------------
DENG Qingfang (1):
      mtd: spi-nor: add support for en25qh16

Jethro Beekman (2):
      mtd: spi-nor: intel-spi: support chips without software sequencer
      mtd: spi-nor: intel-spi: add support for Intel Cannon Lake SPI flash

Manivannan Sadhasivam (1):
      mtd: spi-nor: Add support for w25q256jw

Mika Westerberg (1):
      mtd: spi-nor: intel-spi: Add support for Intel Comet Lake-H SPI serial flash

Sagar Shrikant Kadam (2):
      mtd: spi-nor: Add support for is25wp256
      mtd: spi-nor: Set default Quad Enable method for ISSI flashes

Sergei Shtylyov (2):
      mtd: spi-nor: fix silent truncation in spi_nor_read()
      mtd: spi-nor: fix silent truncation in spi_nor_read_raw()

Tudor Ambarus (36):
      mtd: spi-nor: hisi-sfc: Drop nor->erase NULL assignment
      mtd: spi-nor: Introduce 'struct spi_nor_controller_ops'
      mtd: spi-nor: cadence-quadspi: Fix cqspi_command_read() definition
      mtd: spi-nor: Prepend spi_nor_ to all Reg Ops methods
      mtd: spi-nor: Drop duplicated new line
      mtd: spi-nor: Group all Reg Ops to avoid forward declarations
      mtd: spi-nor: Stop compare with negative in Reg Ops methods
      mtd: spi-nor: Drop explicit cast to int to already int value
      mtd: spi-nor: Don't overwrite errno from Reg Ops
      mtd: spi-nor: Pointer parameter for SR in spi_nor_read_sr()
      mtd: spi-nor: Pointer parameter for FSR in spi_nor_read_fsr()
      mtd: spi-nor: Pointer parameter for CR in spi_nor_read_cr()
      mtd: spi-nor: Drop redundant error reports in Reg Ops callers
      mtd: spi-nor: Fix retlen handling in sst_write()
      mtd: spi-nor: Constify data to write to the Status Register
      mtd: spi-nor: Print device info in case of error
      mtd: spi-nor: Use dev_dbg insted of dev_err for low level info
      mtd: spi-nor: Print debug info inside Reg Ops methods
      mtd: spi-nor: Check for errors after each Register Operation
      mtd: spi-nor: Rename label as it is no longer generic
      mtd: spi-nor: Void return type for spi_nor_clear_sr/fsr()
      mtd: spi-nor: Move the WE and wait calls inside Write SR methods
      mtd: spi-nor: Merge spi_nor_write_sr() and spi_nor_write_sr_cr()
      mtd: spi-nor: Describe all the Reg Ops
      mtd: spi-nor: Drop spansion_quad_enable()
      mtd: spi-nor: Fix errno on Quad Enable methods
      mtd: spi-nor: Check all the bits written, not just the BP ones
      mtd: spi-nor: Print debug message when the read back test fails
      mtd: spi-nor: Fix clearing of QE bit on lock()/unlock()
      mtd: spi-nor: Rework the disabling of block write protection
      mtd: spi-nor: Extend the SR Read Back test
      mtd: spi-nor: Rename CR_QUAD_EN_SPAN to SR2_QUAD_EN_BIT1
      mtd: spi-nor: Merge spansion Quad Enable methods
      mtd: spi-nor: Rename Quad Enable methods
      mtd: spi-nor: Make sure nor->spimem and nor->controller_ops are mutually exclusive
      mtd: spi-nor: Move condition to avoid a NULL check

 drivers/mtd/spi-nor/aspeed-smc.c        |   23 +-
 drivers/mtd/spi-nor/cadence-quadspi.c   |   54 +-
 drivers/mtd/spi-nor/hisi-sfc.c          |   23 +-
 drivers/mtd/spi-nor/intel-spi-pci.c     |    6 +
 drivers/mtd/spi-nor/intel-spi.c         |   58 +-
 drivers/mtd/spi-nor/mtk-quadspi.c       |   25 +-
 drivers/mtd/spi-nor/nxp-spifi.c         |   23 +-
 drivers/mtd/spi-nor/spi-nor.c           | 1665 ++++++++++++++++++++++++++++++++------------------------
 include/linux/mtd/spi-nor.h             |   64 ++-
 include/linux/platform_data/intel-spi.h |    1 +
 10 files changed, 1115 insertions(+), 827 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
