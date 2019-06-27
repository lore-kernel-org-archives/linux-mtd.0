Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1514BC48BD7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 09:32:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D06AC20815
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 09:32:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PIslawrN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="P05Kf2wP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D06AC20815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E7yPzPVaNCKer3QfilxlNsY4t5njq5dbpU5UR2OHp/k=; b=PIslawrNLF/aX4
	A4vDJwLZPfFQAm5W4/8l5gQg/7TNIk1euCi8WGgEJeq392A7BRzbnPSCkALMJ98F6h+BEQYb8EAkp
	g32m/kH/b/Kl5mmdBvh/eKZ8IBefFdaBx9/1lS1n8NPXLUOr7Wd5v6q6xuciyPqGElvYg4L+Fgs6D
	OfQPcxfj+VZf1BhTreeZP6+EJTQ2uycol1wsYIwr2pgPkFppDlPQ72ZPuEjno4/ChAw4cKaVndF+X
	EK+d1FvHZEMWrS7nh8EZeHImpC+iWe+vHOH1MeDTRht1EI68d6e97PM84y5dzTDyO/Thh8YIzfWLp
	knkUWHW2Um1isCbGr7tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgQkt-0003uw-VN; Thu, 27 Jun 2019 09:31:48 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgQkn-0003uE-EB
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 09:31:45 +0000
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
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="37556930"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2019 02:31:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 27 Jun 2019 02:31:36 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 27 Jun 2019 02:31:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dxJnk3r42a42MW+kQDWfnYbrZa+wpYd1IIRdO5FA/c=;
 b=P05Kf2wPLm/xvS4mT45h17FWVwXBo+32nJKhcTykGNp5ChsW+lwyfnb4XiRYiU6PJ2WllCKIGtMoFOkqcMrkYCjmyDMcOOitht/BIXVySSd1taOa6vUbRJo/BxwkU4hzpm5mb4e3bMS781k6gRcXUNQqKFz8egE1Xdqb/aoWsw8=
Received: from DM5PR11MB1850.namprd11.prod.outlook.com (10.175.91.11) by
 DM5PR11MB1721.namprd11.prod.outlook.com (10.168.106.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 09:31:34 +0000
Received: from DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::5025:6c13:b07d:501e]) by DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::5025:6c13:b07d:501e%6]) with mapi id 15.20.2008.017; Thu, 27 Jun 2019
 09:31:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>, <boris.brezillon@collabora.com>,
 <miquel.raynal@bootlin.com>, <vigneshr@ti.com>, <marek.vasut@gmail.com>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>, <vigneshr@ti.com>
Subject: [GIT PULL] mtd: spi-nor: Changes for 5.3
Thread-Topic: [GIT PULL] mtd: spi-nor: Changes for 5.3
Thread-Index: AQHVLMscSMaNalWZYEereGjm/6Sibw==
Date: Thu, 27 Jun 2019 09:31:34 +0000
Message-ID: <31356721-2ff3-13b2-d719-860357871aff@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0162.eurprd09.prod.outlook.com
 (2603:10a6:800:120::16) To DM5PR11MB1850.namprd11.prod.outlook.com
 (2603:10b6:3:112::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb6f60e0-926f-406a-838e-08d6fae23eee
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR11MB1721; 
x-ms-traffictypediagnostic: DM5PR11MB1721:
x-microsoft-antispam-prvs: <DM5PR11MB17219DF2EEB83D900BFFAE09F0FD0@DM5PR11MB1721.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(396003)(346002)(366004)(136003)(189003)(199004)(8936002)(8676002)(26005)(186003)(31686004)(71200400001)(81156014)(81166006)(99286004)(6486002)(52116002)(31696002)(6436002)(14444005)(6512007)(86362001)(6506007)(386003)(102836004)(71190400001)(316002)(110136005)(256004)(5660300002)(53936002)(66066001)(305945005)(72206003)(4326008)(7736002)(25786009)(2201001)(478600001)(66556008)(66476007)(66946007)(73956011)(66446008)(64756008)(36756003)(476003)(2906002)(14454004)(486006)(2616005)(2501003)(68736007)(6116002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR11MB1721;
 H:DM5PR11MB1850.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: naj+0f/eRvekijwT7lp2k0Br6yjbWp/sPqFd1D+vsQsr8Lh/jCeYOCAJMbERbhXKxPbC1Fb9qEyTyiglCOUjJY6CT86G93YSiwXyWkS5dBs4chSFhMdKep18bwn8yZjo2uVF0Fb9QN9XndmhmtT/ZYmVM4WyX1GowftoYTzzhjCdODjFUnqsbAMHXJUjmyta8pp3SguMjQ4LYkplqvtj47mwzo6bAZUKiwFoAA78sBHxX5u1SLVWI5mL3gtie4eFPUId4ZMG7jA+kWWKUW63BmDp1eHVnawxNywmbRZyH0SaJ1Q3uX6UFG/uKWDYyTOAuVCxf4Xp/n6vLS+9wB9X0Iu5f4OOQ5dpif0YR06NNEwrcnWWxSt+1XzOLGqc46bvaKbBp7AWbRHio8ga8BsmnyoBSxRUcbbZdZaWBLpscY0=
Content-ID: <2409DC6B21DDC04395B68A0478385826@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6f60e0-926f-406a-838e-08d6fae23eee
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 09:31:34.7367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_023141_682359_867D5B86 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

There are two conflicts related to the SPDX treewide changes. The first conflict is
in:

	drivers/mtd/spi-nor/stm32-quadspi.c

between commit:

caab277b1de0 ("treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 234")

from Linus' tree and commit:

df6bd6c002a4 mtd: spi-nor: stm32: remove the driver as it was replaced by spi-stm32-qspi.c

from the spi-nor/next branch.

The fix is to remove drivers/mtd/spi-nor/stm32-quadspi.c as the driver was replaced
by spi-stm32-qspi.c


The second conflict is in:

	drivers/mtd/spi-nor/intel-spi-pci.c
	drivers/mtd/spi-nor/intel-spi-platform.c
	drivers/mtd/spi-nor/intel-spi.c
	drivers/mtd/spi-nor/intel-spi.h
	include/linux/platform_data/intel-spi.h

between commit:

d2912cb15bdd ("treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 500")

from Linus' tree and commit:

62de37da9f38 ("mtd: spi-nor: intel-spi: Convert to use SPDX identifier")

from the spi-nor/next branch.

The fix is to keep the SPDX treewide change.

Cheers,
ta


The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.3

for you to fetch changes up to 62de37da9f382455b983f2f92b10012109005278:

  mtd: spi-nor: intel-spi: Convert to use SPDX identifier (2019-06-22 14:59:27 +0300)

----------------------------------------------------------------
SPI-NOR core changes:
- add support for the mt25ql02g and w25q16jv flashes
- print error in case of jedec read id fails

SPI NOR controller drivers changes:
- intel-spi: Add support for Intel Elkhart Lake SPI serial flash
- smt32: remove the driver as the driver was replaced by spi-stm32-qspi.c

----------------------------------------------------------------
Andrey Smirnov (1):
      mtd: spi-nor: Add Micron MT25QL02 support

Flavio Suligoi (1):
      mtd: spi-nor: change "error reading JEDEC id" from dbg to err

Geert Uytterhoeven (1):
      mtd: spi-nor: Spelling s/Writ/Write/

Ludovic Barre (1):
      mtd: spi-nor: stm32: remove the driver as it was replaced by spi-stm32-qspi.c

Mika Westerberg (2):
      mtd: spi-nor: intel-spi: Add support for Intel Elkhart Lake SPI serial flash
      mtd: spi-nor: intel-spi: Convert to use SPDX identifier

Robert Marko (1):
      mtd: spi-nor: Add Winbond w25q16jv support

 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt |  43 ---
 drivers/mtd/spi-nor/Kconfig                             |   7 -
 drivers/mtd/spi-nor/Makefile                            |   1 -
 drivers/mtd/spi-nor/intel-spi-pci.c                     |   6 +-
 drivers/mtd/spi-nor/intel-spi-platform.c                |   5 +-
 drivers/mtd/spi-nor/intel-spi.c                         |   5 +-
 drivers/mtd/spi-nor/intel-spi.h                         |   5 +-
 drivers/mtd/spi-nor/spi-nor.c                           |  12 +-
 drivers/mtd/spi-nor/stm32-quadspi.c                     | 720 -----------------------------------------
 include/linux/platform_data/intel-spi.h                 |   5 +-
 10 files changed, 16 insertions(+), 793 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
 delete mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
