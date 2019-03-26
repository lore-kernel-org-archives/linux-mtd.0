Return-Path: <SRS0=gzro=R5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D87C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 10:52:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 992F52084B
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 10:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rfX1VKYE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="MHeUsr3b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 992F52084B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lRAHU/S+4ADe3GzlME3CQQCs9Fdj+Enpoiti9xE9cPM=; b=rfX1VKYEDVb+UZ
	bFpU5QX56q4NFAsnVFx/MwmFXaDDqdona9rgQIYJy+iN4KaFxLHGqxoCW0n8wMecHv17lrmo8PAoa
	MUpunwL2lHMVEufTxEM7e5KCUGhPFlhDMb7P+g12ua/ay1BpF2J83Ld4Ev6c7fgfEO2/oI9yPYE9D
	MxEhMm6jsAfI3Nfffgq++5ZFn7yJxNv4bXZi0yvyLtGKw8Ddndf2Ty3+yy80f26l2awclXv3QHB5F
	vSb5qTYXs6eFBVewvYYg9Bozno/y0+QpU3pDnZiqDPpFVr/DDesIROAU5GChugYkMqMjo6sUZAaDP
	xDicIRjShUv33m7wdgxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8jgy-0003l4-IY; Tue, 26 Mar 2019 10:52:28 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8jgo-0003VH-IU
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2019 10:52:27 +0000
Received: from mail.micron.com (bowex36b.micron.com [137.201.84.100])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x2QAq0FC021932;
 Tue, 26 Mar 2019 04:52:00 -0600
Received: from bowex17c.micron.com (137.201.21.211) by bowex36b.micron.com
 (137.201.84.100) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 Mar
 2019 04:51:59 -0600
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (137.201.20.7) by
 bowex17c.micron.com (137.201.21.211) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 26 Mar 2019 04:51:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWfwYNt8y0qwDEwgQzGpXIxvc9AnaxwFm0waCR2RPPk=;
 b=MHeUsr3b2zuJ+nsJmxrGfz94Dhhw1qEcM8huScjBK+Yp0SBTrCxPSBPbr4JwyVU/Ha4ms5hu+I2nN+HVs68bedBKEEyUMrYnG1xYR09K9Xar03/P5ZkdNkdUzN4fS10LdHZaZ9nGFWpGWOxNufwHN+vRl5GdihkWcwiikT9wofU=
Received: from MN2PR08MB5951.namprd08.prod.outlook.com (20.179.85.220) by
 MN2PR08MB5759.namprd08.prod.outlook.com (20.179.86.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.19; Tue, 26 Mar 2019 10:51:56 +0000
Received: from MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::c561:284f:9768:a4af]) by MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::c561:284f:9768:a4af%7]) with mapi id 15.20.1730.019; Tue, 26 Mar 2019
 10:51:56 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Boris Brezillon <bbrezillon@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] mtd: nand: Move ONFI code into nand/ directory
Thread-Topic: [PATCH 2/4] mtd: nand: Move ONFI code into nand/ directory
Thread-Index: AdTjwLylLmaJhZFZS7aXTwK2bTqhxw==
Date: Tue, 26 Mar 2019 10:51:56 +0000
Message-ID: <MN2PR08MB59511F374C25C091FF6EB316B85F0@MN2PR08MB5951.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.81.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 866db253-1fff-45c8-611d-08d6b1d910b1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR08MB5759; 
x-ms-traffictypediagnostic: MN2PR08MB5759:|MN2PR08MB5759:
x-microsoft-antispam-prvs: <MN2PR08MB57593E5B4CC77166FC15ED85B85F0@MN2PR08MB5759.namprd08.prod.outlook.com>
x-forefront-prvs: 09888BC01D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(366004)(376002)(136003)(199004)(189003)(26005)(9686003)(97736004)(99286004)(71190400001)(55016002)(81156014)(71200400001)(55236004)(6506007)(2906002)(81166006)(7416002)(102836004)(8676002)(7736002)(476003)(486006)(74316002)(14454004)(305945005)(2201001)(7696005)(186003)(86362001)(105586002)(316002)(478600001)(106356001)(33656002)(25786009)(66066001)(5660300002)(4326008)(6116002)(6436002)(3846002)(52536014)(8936002)(256004)(110136005)(68736007)(2501003)(54906003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB5759;
 H:MN2PR08MB5951.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hxDTIMXc6ROQZxkzoXK4utLZTqa4cyXCMB94101rLAbiu82svyJ72yeg/m1Q055PKnlrz/c0c6VG3ARUKO1DbEY8+qRD3G97UGJ915tOi9YUbFC/3xewAjZAWfpTVUV0m9oD2xqnQjzBQdaIymPcNevBokgMnzu4q+PeydsX68j3+SB4S0+FNOQnC/I1VmfQA5m30OrLXhk/uX5Ytx8A4PzMbB1ngRppbdB2r1dcvQvgb8ruV29USAMtVgf425qKObQPP7IwN4cmhmUgu3Oe8z/iBrTCZ4sztiz6Y3reTvtQoIJe8bhRx8AqB2ZzgNwiz5iG+7lFhF/ZJRIHkpxBSBRE6FEH06dnW9svBRSmoWyxD+AXLmm7h1slMoRd4q6+nC68vGxvQfYgLqSfrhgASZTpygd0x1jJRHdiBv9gUm8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 866db253-1fff-45c8-611d-08d6b1d910b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2019 10:51:56.3902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5759
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24512.005
X-TM-AS-Result: No--3.041000-0.000000-31
X-TM-AS-MatchedID: 105640-701604-700016-121588-701669-188019-121336-702931-1
 48004-148007-148020-148050-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.130.65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_035219_097286_F7616F8D 
X-CRM114-Status: UNSURE (   9.89  )
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
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>, Stefan Agner <stefan@agner.ch>, Marek
 Vasut <marek.vasut@gmail.com>, Liang Yang <liang.yang@amlogic.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Dmitry Osipenko <digetx@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, "Bean Huo
 \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Move generic ONFI code to nand/ directory, which can be used by SPI
NAND layer.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/Makefile                    | 2 +-
 drivers/mtd/nand/{raw/nand_onfi.c => onfi.c} | 0
 drivers/mtd/nand/raw/Makefile                | 1 -
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename drivers/mtd/nand/{raw/nand_onfi.c => onfi.c} (100%)

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 9772e781534d..1b43a911aa4a 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-nandcore-objs := core.o bbt.o
+nandcore-objs := core.o bbt.o onfi.o
 obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
 
 obj-y	+= onenand/
diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/onfi.c
similarity index 100%
rename from drivers/mtd/nand/raw/nand_onfi.c
rename to drivers/mtd/nand/onfi.c
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 898e90508a3a..3467bbb4a51a 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -59,7 +59,6 @@ obj-$(CONFIG_MTD_NAND_STM32_FMC2)	+= stm32_fmc2_nand.o
 obj-$(CONFIG_MTD_NAND_MESON)		+= meson_nand.o
 
 nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
-nand-objs += nand_onfi.o
 nand-objs += nand_jedec.o
 nand-objs += nand_amd.o
 nand-objs += nand_esmt.o
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
