Return-Path: <SRS0=bf65=3J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9503C2D0DB
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 17:54:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFFCD22525
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 17:54:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CFh340Ia";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="dWj8yg3F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFFCD22525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hd7L5AUyaDbnSLqetH/wTWSO081XVGnVfbwIBtvB/rM=; b=CFh340IaZ5+qnK
	cysNK6ZK2S2IDUmAN/Bp7SZSm+WRcyASjegnF35vgfj6DiSBxZf6JbTDXX0EzjCcgcex9TfEtnUw9
	Ffa4TyzBbsbfU7fQCxYsxp3okhRw9ssINwcEXvHPvbLw3Xaw82FXlPhqVuXEBud2+GDJrFN+5oQFn
	P5Jc1sjj1Ug+whSmB5ZCL9KVgRwQAFHvmGb4uW3UyiCxaM+133BGE9oO4jQWQ+aHjR6B6rRGw9TJ+
	Im6KJUUQDcHskwE7JghkLHPr9FfB3m8nbdfjJ4HC9XAOsQkHNSyQC5zoY5G/NbbfVT1q/b43h52R9
	P8zu2Ok0h8YlHFY005Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itbG1-0001Nt-Cd; Mon, 20 Jan 2020 17:54:37 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itbFx-0001NK-Ae
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2020 17:54:35 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
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
IronPort-SDR: tplA+omeE7WSHcJsfTL7hGqE4bsS+XscMvMRmvvpp2DKYZu194GgLBggLuw3wXTz55Fb+0goDb
 z2eU7wWkidZn5PEZhImdV7p8nq94TDy2qphbk+fFkwVoMeQtCQQRXNHJHjlIDw3mdnJKV0M6WZ
 /Wi7Ne7dlFSgoDcxEt+nA2YxqipaJJvS1AKM1qApf4Rj/Y8h7S2D4GZ2mmfMZbZhUspbptc0TM
 vXnEfQkF7IberFBCUatI8pFKYazrByLOmefCz2VLRnfiRUlHibMqUpOdojv3NHQir05T78GQSA
 +K0=
X-IronPort-AV: E=Sophos;i="5.70,342,1574146800"; d="scan'208";a="65357050"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jan 2020 10:54:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Jan 2020 10:54:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 20 Jan 2020 10:54:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxkvJPg1ybnDwTO91T0NFnJYTDL+zex2LT9snDBIqLjyevpOLPGx4QCE1/OEgFQTOW3736h16EQIfpjnMoh9ipo0Z64Nos8iKNoZj0IWu78ww0s9XCQMZDVW1/PKKLcsstuLVxguU7QfHnppuRlvgusn93NwyXQWPfNN6xxszuTj7D6dVktK/izxocFJn7mBP05lC8+U8ZvFVT2JF0INYMLodAg2VweEzviUNWWbgkwNXv9zPLfbGplUewfeEkA30erEPDSbV15vJJxGkAtvU89bQMTA9ed5SoZsgzNPmqUHB87zj1Cph9FrH+OmwmfUAoEXN+D8jWyXDilSRj7Q4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqxMTofWduIUSEfULbrMcne2Kv4fIC3rqBQQQaGUViY=;
 b=ciQXRYL3xetgbFn+cfB4g8MeVCUZfdanBdUHHtrccKXoAEZAfWBCRqo4r/RpEZYgnjevdkUdZ2VfdO1UBnSU/DJpszxZaAtDuFSd+azMMLfDJBP4FW8RJZ+iiSNMVsPvkMZrRnAiaY0HSqzQdTRA/MtFD8YlthhXftREXF/d107/aRBA7I271HLw1XhLBDonuEWf+EaY91H8Lopdd0U3i0lZG7qG7jbtOgTK7hucoXiNDSin9Fqkijl8CSZHNK0pH2CrAGW42u99hGqWngvEcRWpT/bsnOUL8Qz840Ga+POwMDHzLn4HlTqa8CpYbtn1masI8fq7OwszkjTq3mRPig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqxMTofWduIUSEfULbrMcne2Kv4fIC3rqBQQQaGUViY=;
 b=dWj8yg3F2yywt2VmE+qNB1LHXAc+mhEhgTw97h0qQZh6uSCcmtFVeT9CGYLn8oNzL9EAH8JS4y6uLQcue7L6bRvZCJgb/lRCB6m0azYf+rTdj4S1LpZrV2TcQsIiv8UOhxr2LOqv75V0KVivbEWxaAxfUpDrlU8VwkJT5L2cbqg=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3565.namprd11.prod.outlook.com (20.178.250.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.24; Mon, 20 Jan 2020 17:54:30 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 17:54:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
Subject: [GIT PULL] mtd: spi-nor: Changes for 5.6
Thread-Topic: [GIT PULL] mtd: spi-nor: Changes for 5.6
Thread-Index: AQHVz7qqawIIyyMWnkCTtxnZkt85mA==
Date: Mon, 20 Jan 2020 17:54:30 +0000
Message-ID: <3990025.71ridMsFQ8@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 163eff4a-e61e-4629-a1c7-08d79dd1ccea
x-ms-traffictypediagnostic: MN2PR11MB3565:
x-microsoft-antispam-prvs: <MN2PR11MB3565A9CCD23005A341F95F79F0320@MN2PR11MB3565.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(366004)(376002)(39860400002)(189003)(199004)(66556008)(64756008)(66946007)(66476007)(4326008)(66446008)(6486002)(91956017)(110136005)(76116006)(478600001)(86362001)(8936002)(186003)(26005)(316002)(4001150100001)(6506007)(6512007)(9686003)(71200400001)(2906002)(81166006)(81156014)(5660300002)(8676002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3565;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mGRvp07q8Q709ZB1HdwAlMZIY0ImrThgoism6cBFqU0IpbQwI16nz0kFlyNzcNnfdysUTTaeFniNX3lnWmNNqGUQNxlNlW9iaRc5OG/rgMVEPdEmwHlrghnqg5dZ5lLpT5LNA2PvpvRdcdJpLERhaYD0vwD+peRANqtKqSKjTSsLYRWZkiXP5zXO/ztb8DJnYJFAY2Y2tdtgO0hK0pJfqO8WWLscP2g+2bm/F5fOWvlkeu6GjdeI+jSjqKF/mPdR8EsGt+D/xhFjASNp45KXBSjEKUX6m5EaRRw69VzLdOvBG1Ppz2oC7fgyNQ91dOmm7EJvik7XpuqFWNp1ryHNW9vHOQ9F/9fHZTv5sj0+zZc7ZrW0GVHWBinKfCEMb+gfBU/3OEsg0IcFDeSj4c5COBsS7LDBBTpGlbyYwv29bKYbq+aDvW7Z1tg/AybqlbGUp+3j46NokXYJeXgwYoQ7VXKjcR+nyv3lPp7M1AtTY0vvaAxDob06j7fAHsAQs7RX
x-ms-exchange-transport-forked: True
Content-ID: <32802FE0FAB6464884B0F647765C4140@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 163eff4a-e61e-4629-a1c7-08d79dd1ccea
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 17:54:30.6749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /xqeiFjgGA2iJCX0fLwYGu77UWMItECYe9cMwEa3dwnrPLdaq8JuelK19F3hZBakVV8krzS238pQPz+AKnlbviaplhQ0JBC6PVyaUdHrWPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3565
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_095433_439305_B3E575D7 
X-CRM114-Status: UNSURE (   8.30  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

This is the SPI NOR PR for 5.6.

Thanks,
ta

The following changes since commit 46cf053efec6a3a5f343fead837777efe8252a46:

  Linux 5.5-rc3 (2019-12-22 17:02:23 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/
spi-nor/for-5.6

for you to fetch changes up to ccfb9299a0b63da4fde607c822e1470472a46177:

  mtd: spi-nor: Add support for at25sl321 (2020-01-19 08:45:55 +0200)

----------------------------------------------------------------
SPI NOR core changes:
- Add support for TB selection using SR bit 6,
- Add support for few flashes.

----------------------------------------------------------------
David Bauer (1):
      mtd: spi-nor: Add support for mx25r3235f

Jerome Brunet (1):
      mtd: spi-nor: add Gigadevice gd25lq128d support

John Garry (1):
      mtd: spi-nor: hisi-sfc: Try to provide some clarity on which SFC we are

Joseph Kust (1):
      mtd: spi-nor: Add support for sst26vf016b

Jungseung Lee (4):
      mtd: spi-nor: fix typo of "JESB216" in comment
      mtd: spi-nor: Rename SR_TB to indicate the bit used
      mtd: spi-nor: Support TB selection using SR bit 6
      mtd: spi-nor: Fix wrong TB selection of GD25Q256

Michael Walle (3):
      mtd: spi-nor: remove unused enum spi_nor_ops
      mtd: spi-nor: Add support for w25q32jwm
      mtd: spi-nor: Add support for at25sl321

Mika Westerberg (2):
      mtd: spi-nor: intel-spi: Add support for Intel Jasper Lake SPI serial 
flash
      mtd: spi-nor: intel-spi: Add support for Intel Comet Lake-V SPI serial 
flash

Robert Marko (1):
      mtd: spi-nor: Add 4B_OPCODES flag to w25q256

Vignesh Raghavendra (3):
      mtd: spi-nor: Split mt25qu512a (n25q512a) entry into two
      mtd: spi-nor: Add entries for mt25q variants
      mtd: spi-nor: Add USE_FSR flag for n25q* entries

 drivers/mtd/spi-nor/Kconfig           |   4 +--
 drivers/mtd/spi-nor/aspeed-smc.c      |   4 +--
 drivers/mtd/spi-nor/cadence-quadspi.c |   4 +--
 drivers/mtd/spi-nor/hisi-sfc.c        |   6 ++--
 drivers/mtd/spi-nor/intel-spi-pci.c   |   2 ++
 drivers/mtd/spi-nor/spi-nor.c         | 127 +++++++++++++++++++++++++++++++++
++++++++++++++++++---------------------
 include/linux/mtd/spi-nor.h           |  16 +++------
 7 files changed, 107 insertions(+), 56 deletions(-)



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
