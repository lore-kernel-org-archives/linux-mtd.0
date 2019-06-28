Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173DDC4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 09:00:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7BF8205ED
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 09:00:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ahEG+d+2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="SlpvG4XX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7BF8205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yLnnA9roeKtppDYDjuHvxLMP8/ym/hMqkwBTFtdIQ9k=; b=ahEG+d+2vQiVDa
	aqeCfF1wyGzKxyxG4hqzgXqTSdSt+agjaOSXP+prf5pCK+U0UK1IjxTwhGpCZLq6GJX1DH8pfoEIl
	OF0El0rnAHFMWoouRetl6dvbjFRzFb+zHBLHkZfmKBi72SCJxImB49wG3SNSEALiaqmrzuyr4cfVS
	g2nBU3hVi5A9rNPCvepGfgTGzmQXUyi/4BuJ/kOyGv7CAXt+OhdXj+/hJSKwnmG0IkGtNvo6Yyq4I
	j33xTGFYVwN8LffKlWcgJXPEf6diH7RLX0tyGZLDp54b2freODGW2VVyZ3HZ+Lmmizcn2R9L74kxA
	g57rUPdg1H4eInAIFbxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgmkN-0004hC-B8; Fri, 28 Jun 2019 09:00:43 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgmkJ-0004fI-IX
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 09:00:41 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; d="scan'208";a="40783424"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jun 2019 02:00:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 28 Jun 2019 02:00:35 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 28 Jun 2019 02:00:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=HfuP2sHFeulCSclOkpa14lJ6mK6qCfkNs8c0XwVq7izMTU+1KBrRF4NsE8VG1Xe8UzRAY7FM7N41fLqFjapjN4TPqj2GtLg7yKsLrR+1DEBb9nRHIb4HFgwl7GMRVJkoLEgxPSKksZ/CXHTrs2XyadKf0jFR4s3Pj1XGkzWrXKg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AJhXKsAkzX2BOehoCBCi30O0tVE1x34U3t8ZbIWWHM=;
 b=Rq+jfVqacOIGV6SaP5If0N30+MEQ+WC8h2dHCTFDUZhjMabeVidpmLWuL21i5SwiqowIisFcs5IMz9Zsj8sQSMceqtCS9R9HyaoU3yCVdR3KUs02BjsWUvbUmxMEoxPS/TSUsFi9X4e6tGtrG9U8ExSJ38/AvT8TRX0pMNiubqA=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AJhXKsAkzX2BOehoCBCi30O0tVE1x34U3t8ZbIWWHM=;
 b=SlpvG4XXv2rXvH+ZMGPNysl/EAvN4hc6jDCRAmnaoWs/jwUKN/GlpzZZX/Z5rTdw4ldeYXsP3WIH3zl1KkNNxwatRJTpvNSb9nPbIxOrMLMnm3sdxy5yIEi8dfB386DXOXtrdgTGUzARYTmbFI+E0emzxLBjaf/23CeCDlhEvTw=
Received: from DM5PR11MB1850.namprd11.prod.outlook.com (10.175.91.11) by
 DM5PR11MB1914.namprd11.prod.outlook.com (10.175.91.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 09:00:33 +0000
Received: from DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::5025:6c13:b07d:501e]) by DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::5025:6c13:b07d:501e%6]) with mapi id 15.20.2008.017; Fri, 28 Jun 2019
 09:00:33 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>, <boris.brezillon@collabora.com>,
 <miquel.raynal@bootlin.com>, <vigneshr@ti.com>, <marek.vasut@gmail.com>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>
Subject: [GIT PULL v2] mtd: spi-nor: Changes for 5.3
Thread-Topic: [GIT PULL v2] mtd: spi-nor: Changes for 5.3
Thread-Index: AQHVLY/xJzbCO7CwEE6/QBUmtAjOfg==
Date: Fri, 28 Jun 2019 09:00:32 +0000
Message-ID: <166a1e4f-9ed0-ade5-cae4-841fa97036ce@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0127.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::29) To DM5PR11MB1850.namprd11.prod.outlook.com
 (2603:10b6:3:112::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a8033b9-44da-4090-2cd7-08d6fba71389
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR11MB1914; 
x-ms-traffictypediagnostic: DM5PR11MB1914:
x-microsoft-antispam-prvs: <DM5PR11MB191415E6BE331FDB234116CFF0FC0@DM5PR11MB1914.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(39860400002)(346002)(136003)(396003)(189003)(199004)(14454004)(81156014)(2616005)(3846002)(8936002)(6512007)(7736002)(486006)(305945005)(81166006)(5660300002)(8676002)(6436002)(6486002)(2906002)(66066001)(6116002)(6506007)(26005)(386003)(4326008)(86362001)(53936002)(102836004)(31696002)(36756003)(25786009)(2201001)(186003)(71200400001)(99286004)(72206003)(110136005)(2501003)(256004)(68736007)(66556008)(31686004)(14444005)(476003)(66946007)(64756008)(73956011)(66476007)(52116002)(66446008)(316002)(71190400001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR11MB1914;
 H:DM5PR11MB1850.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lPiU3/GQ+RkuD5IMenH4w3PHKoym4WnnpFcsaRH0ERLcg3LVrxTlFTttCPVnNXoXkvhRkRe/RfYzIwifxkuWX8cXpzrbcrf7AHVRun5fV8COd3VsctLVXAP67tKLRY2x1heuBmz2yMKjEmySwuOdfJvecez0WRiREWCe+AwnAk/Jz3j3KY8WrSSqL1rOjMnK0fCBTFSuTLhQ1NJyyYQszfW0pSAkvW0o0+0vgoCM2rD4BiFoUdB4X7AEY/pHelVkl5M4QrKpgk7WZLeYtkjJHx6n62quYSUEBbSLYyCu0mK6+bqIvUozG/ZbaxQ0b5Cm+LXW426cUKRyMHaQjRkL0F9MAndd3MBDKbDbTUgfDFBejIG4V5DAcaeqbbgQiZ7bo1iWyotDkYq4nbVjsVvhyyTuW++Bg62x562OkOxiTEA=
Content-ID: <0A91B22ABF86204C9A8102F4C09582F5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8033b9-44da-4090-2cd7-08d6fba71389
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 09:00:32.8944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1914
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_020039_823803_55E54151 
X-CRM114-Status: GOOD (  15.03  )
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

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.3-v2

for you to fetch changes up to 8d1336c241bdadf61a56e398d82d1e512dbff5f8:

  mtd: spi-nor: cadence-quadspi: add reset control (2019-06-27 17:18:13 +0300)

----------------------------------------------------------------
SPI-NOR core changes:
- add support for the mt25ql02g and w25q16jv flashes
- print error in case of jedec read id fails
- is25lp256: add post BFPT fix to correct the addr_width

SPI NOR controller drivers changes:
- intel-spi: Add support for Intel Elkhart Lake SPI serial flash
- smt32: remove the driver as the driver was replaced by spi-stm32-qspi.c
- cadence-quadspi: add reset control

----------------------------------------------------------------
Andrey Smirnov (1):
      mtd: spi-nor: Add Micron MT25QL02 support

Dinh Nguyen (2):
      dt-bindings: cadence-quadspi: add options reset property
      mtd: spi-nor: cadence-quadspi: add reset control

Flavio Suligoi (1):
      mtd: spi-nor: change "error reading JEDEC id" from dbg to err

Geert Uytterhoeven (1):
      mtd: spi-nor: Spelling s/Writ/Write/

Liu Xiang (1):
      mtd: spi-nor: fix nor->addr_width when its value configured from SFDP does not match the actual width

Ludovic Barre (1):
      mtd: spi-nor: stm32: remove the driver as it was replaced by spi-stm32-qspi.c

Mika Westerberg (2):
      mtd: spi-nor: intel-spi: Add support for Intel Elkhart Lake SPI serial flash
      mtd: spi-nor: intel-spi: Convert to use SPDX identifier

Robert Marko (1):
      mtd: spi-nor: Add Winbond w25q16jv support

 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt |   5 ++
 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt   |  43 ---------
 drivers/mtd/spi-nor/Kconfig                               |   7 --
 drivers/mtd/spi-nor/Makefile                              |   1 -
 drivers/mtd/spi-nor/cadence-quadspi.c                     |  21 +++++
 drivers/mtd/spi-nor/intel-spi-pci.c                       |   6 +-
 drivers/mtd/spi-nor/intel-spi-platform.c                  |   5 +-
 drivers/mtd/spi-nor/intel-spi.c                           |   5 +-
 drivers/mtd/spi-nor/intel-spi.h                           |   5 +-
 drivers/mtd/spi-nor/spi-nor.c                             |  37 +++++++-
 drivers/mtd/spi-nor/stm32-quadspi.c                       | 720 --------------------------------------------------------------------------------------------------------------------------------------------------
 include/linux/platform_data/intel-spi.h                   |   5 +-
 12 files changed, 66 insertions(+), 794 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
 delete mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
