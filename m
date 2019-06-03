Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6A1C04AB5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 12:43:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 439B327EC0
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 12:43:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mU4sF5Nm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="QPs+4FQd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 439B327EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AN3kJfaGkbLQiWZm1yiWjxQ8KpsLBuY7OxpANABv9bk=; b=mU4sF5NmNPqHNF
	OFvc/5Pj3Arx3K/0Dw9cJRzGqwKSYuRKwooEaz4BjfNGgtf0QzZfhU7Yjvwmt8A4zIgjg/ub+G3Uw
	F+8gIZ7xFtpIobITtG3o9ndhDLxE/m0g0E7qkUlfe06Jg9LEJpCvvdDGJrsQCUoL2JAU2is3ezovT
	sAdAMCyIefK9AQLWzHpn1ewLkb3iJLAtrOqOYNlpeGBcfPY6dbbRSYEzagwtZD9jeRsTpowT52lby
	lVZwVPybLNuk+Ou9VmIn5NQR+K4/kmWwKSmPImZrBYrRSpBJ+1vG1nGnZlBOh5mvSLRJpYUxEho0c
	lXIrwhq6KPpJD8MkMy5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXmJM-0004IY-6C; Mon, 03 Jun 2019 12:43:36 +0000
Received: from mail-eopbgr750057.outbound.protection.outlook.com
 ([40.107.75.57] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXmJD-00047x-Ek
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 12:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqWGWMZVHJyu/kVx4LtSNU+8fq4JT/Mr6ztQHwBfY4Q=;
 b=QPs+4FQdzPVzaT75oUXgr3jZ18LIkm0ZmSzgkm5NL+hFUQ/VIMO8donkiLFq8kFGiG5p8FJmI3hQUjEYa0JPd/8PR5m8sIX4dByo1SDaW6n++RYudexDp0KMmAAkMjc2uv8TNW1ePK0vPF6ht6/ySDZO9GTMhZlKHUMXzhOJ4SY=
Received: from MN2PR08MB5951.namprd08.prod.outlook.com (20.179.85.220) by
 MN2PR08MB5872.namprd08.prod.outlook.com (20.179.86.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.18; Mon, 3 Jun 2019 12:43:23 +0000
Received: from MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::f0f7:f262:a3c6:ce23]) by MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::f0f7:f262:a3c6:ce23%7]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 12:43:23 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>, Yixun
 Lan <yixun.lan@amlogic.com>, Lucas Stach <dev@lynxeye.de>, Anders Roxell
 <anders.roxell@linaro.org>, Stefan Agner <stefan@agner.ch>, Marcel Ziswiler
 <marcel.ziswiler@toradex.com>, "Bean Huo (beanhuo)" <beanhuo@micron.com>,
 Paul Cercueil <paul@crapouillou.net>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Chuanhong Guo <gch981213@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 01/12] mtd: rawnand: turn nand_onfi_detect to use
 nand_device
Thread-Topic: [PATCH v3 01/12] mtd: rawnand: turn nand_onfi_detect to use
 nand_device
Thread-Index: AdUaAy8RvNFH7myfRde2bNfDQJf8+g==
Date: Mon, 3 Jun 2019 12:43:23 +0000
Message-ID: <MN2PR08MB5951A1DDC80445E917EAA32DB8140@MN2PR08MB5951.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.81.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e48ea67-2274-4a22-3377-08d6e8211108
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR08MB5872; 
x-ms-traffictypediagnostic: MN2PR08MB5872:|MN2PR08MB5872:
x-microsoft-antispam-prvs: <MN2PR08MB5872705FCE1ABCA3C4655F5CB8140@MN2PR08MB5872.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(136003)(346002)(39860400002)(366004)(189003)(199004)(76116006)(14454004)(99286004)(7696005)(71200400001)(71190400001)(66446008)(5660300002)(9686003)(52536014)(73956011)(66946007)(66476007)(66066001)(66556008)(64756008)(2201001)(55236004)(6116002)(478600001)(316002)(102836004)(110136005)(2906002)(3846002)(6506007)(86362001)(7416002)(53936002)(486006)(26005)(2501003)(8936002)(476003)(33656002)(14444005)(256004)(8676002)(74316002)(81166006)(81156014)(6436002)(68736007)(7736002)(305945005)(186003)(25786009)(55016002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB5872;
 H:MN2PR08MB5951.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R97Kp5fG+znziDSus+uMBjixBdzBXGoL8dgz4yydPXkDaF0CpgEe1x5J3J80F+WXZSGKme490v03GiILzHAwSPxpqW3vSa6jOs6gwPtY/xAbdzQxoOcHXmkY6nWG/AIs3ykDdjKM2o7r0Be7I1ofFk5+JcV6LKdzjhs1DkiDWftfhNTk90OIFGEnMGwHaSD0XdTHB07izT/yUlQY7orjsxab4Y7KQLcs2ynHROqxQvC3K99aImhpEDeJp6NC0V5SMSDV1SVdALBYGvfzZstq2Nu72a61ubbJw91kU2/TPGl/t9inf4Jj9tVOJyLduR77WL3Wet82hmWwgg5V7sTXOGwYjQOHNfuiDzpel8hoOLRNn3q5Rg6KL0586nLTV0u3JAGsx0O/T+fXQ/yO9mD4r+SE6ylQGVHP1aeSFYaCxK4=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e48ea67-2274-4a22-3377-08d6e8211108
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 12:43:23.3910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sshivamurthy@micron.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5872
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_054327_492815_9D3570AB 
X-CRM114-Status: GOOD (  12.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

It is necessary to turn nand_onfi_detect to use nand_device structure,
to make ONFI related codes generic for all NAND devices.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/raw/internals.h | 2 +-
 drivers/mtd/nand/raw/nand_base.c | 2 +-
 drivers/mtd/nand/raw/nand_onfi.c | 8 +++++---
 include/linux/mtd/rawnand.h      | 5 +++++
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index cba6fe7dd8c4..4dc9ae108fa1 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -141,7 +141,7 @@ int nand_legacy_check_hooks(struct nand_chip *chip);
 
 /* ONFI functions */
 u16 onfi_crc16(u16 crc, u8 const *p, size_t len);
-int nand_onfi_detect(struct nand_chip *chip);
+int nand_onfi_detect(struct nand_device *base);
 
 /* JEDEC functions */
 int nand_jedec_detect(struct nand_chip *chip);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 6ecd1c496ce3..96a93481420f 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4737,7 +4737,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 
 	if (!type->name || !type->pagesize) {
 		/* Check if the chip is ONFI compliant */
-		ret = nand_onfi_detect(chip);
+		ret = nand_onfi_detect(&chip->base);
 		if (ret < 0)
 			return ret;
 		else if (ret)
diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index 0b879bd0a68c..e20b60b8dd93 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/slab.h>
+#include <linux/mtd/nand.h>
 
 #include "internals.h"
 
@@ -137,9 +138,10 @@ static void nand_bit_wise_majority(const void **srcbufs,
 /*
  * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise.
  */
-int nand_onfi_detect(struct nand_chip *chip)
+int nand_onfi_detect(struct nand_device *base)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_chip *chip = device_to_nand(base);
+	struct mtd_info *mtd = &base->mtd;
 	struct nand_memory_organization *memorg;
 	struct nand_onfi_params *p;
 	struct onfi_params *onfi;
@@ -147,7 +149,7 @@ int nand_onfi_detect(struct nand_chip *chip)
 	char id[4];
 	int i, ret, val;
 
-	memorg = nanddev_get_memorg(&chip->base);
+	memorg = nanddev_get_memorg(base);
 
 	/* Try ONFI for unknown chip or LP */
 	ret = nand_readid_op(chip, 0x20, id, sizeof(id));
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index f5bb6f11c36b..87282beee008 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1154,6 +1154,11 @@ static inline struct mtd_info *nand_to_mtd(struct nand_chip *chip)
 	return &chip->base.mtd;
 }
 
+static inline struct nand_chip *device_to_nand(struct nand_device *base)
+{
+	return container_of(base, struct nand_chip, base);
+}
+
 static inline void *nand_get_controller_data(struct nand_chip *chip)
 {
 	return chip->priv;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
